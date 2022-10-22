#!/bin/bash

function _help(){
	echo "Usage: build.sh --device DEV"
	echo
	echo "Build edk2 for Qualcomm Snapdragon platforms."
	echo
	echo "Options: "
	echo "	--device DEV, -d DEV:    build for DEV."
	echo "	--all, -a:               build all devices."
	echo "	--chinese, -c:           use hub.fastgit.xyz for submodule cloning."
	echo "	--release MODE, -r MODE: Release mode for building, default is 'RELEASE', 'DEBUG' alternatively."
	echo "	--toolchain TOOLCHAIN:   Set toolchain, default is 'GCC5'."
	echo "	--uart, -u:              compile with UART support, print debug messages to uart debug port."
	echo " 	--skip-rootfs-gen:       skip generating SimpleInit rootfs to speed up building."
	echo "	--acpi, -A:              compile DSDT using MS asl with wine"
	echo "	--clean, -C:             clean workspace and output."
	echo "	--distclean, -D:         clean up all files that are not in repo."
	echo "	--outputdir, -O:         output folder."
	echo "	--help, -h:              show this help."
	echo
	echo "MainPage: https://github.com/edk2-porting/edk2-msm"
	exit "${1}"
}

function _error(){ echo "${@}" >&2;exit 1; }

function _call_hook(){
	local NAME="${1}"
	shift
	if declare -F "${NAME}" &>/dev/null
	then eval "${NAME}" "${@}"||return 1
	fi
	return 0
}

function _load_platform_hooks(){
	if [ -f "${ROOTDIR}/${1}" ]
	then source "${ROOTDIR}/${1}"
	fi
}

function _build(){
	local DEVICE="${1}"
	shift
	source "${_EDK2}/edksetup.sh"
	[ -d "${WORKSPACE}" ]||mkdir "${WORKSPACE}"
	set -x
	make -C "${_EDK2}/BaseTools"||exit "$?"

	SPLIT_DSDT=false
	EXT=""

	if [ -f "configs/${DEVICE}.conf" ]
	then source "configs/${DEVICE}.conf"
	else _error "Device configuration not found"
	fi
	typeset -l SOC_PLATFORM_L="$SOC_PLATFORM"
	_load_platform_hooks Platform/platform.sh.inc
	_load_platform_hooks Silicon/platform.sh.inc
	_load_platform_hooks "Silicon/${SOC_VENDOR}/platform.sh.inc"
	_load_platform_hooks "Platform/${VENDOR_NAME}/platform.sh.inc"
	_load_platform_hooks "Silicon/${SOC_VENDOR}/${SOC_PLATFORM_L}/platform.sh.inc"
	_load_platform_hooks "Platform/${VENDOR_NAME}/${SOC_PLATFORM_L}/platform.sh.inc"
	_load_platform_hooks "Platform/${VENDOR_NAME}/${SOC_PLATFORM_L}/${PLATFORM_NAME}.sh.inc"
	_load_platform_hooks "Platform/${VENDOR_NAME}/${SOC_PLATFORM_L}/${DEVICE}.sh.inc"

	_call_hook platform_pre_acpi||return "$?"

	if "${GEN_ACPI}"
	then
		if "${SPLIT_DSDT}"
		then
			rm -rf "${WORKSPACE}/Build/${DEVICE}/ACPI"
			mkdir -p "${WORKSPACE}/Build/${DEVICE}/ACPI"
			pushd "${WORKSPACE}/Build/${DEVICE}/ACPI"
			cp "${ROOTDIR}/Silicon/${SOC_VENDOR}/${SOC_PLATFORM_L}/AcpiTables"/* ./
			cp "${ROOTDIR}/Platform/${VENDOR_NAME}/${SOC_PLATFORM_L}/AcpiTables/"{*.asl,"${DEVICE}/"*} ./
			if [ "${USE_IASL}" == "true" ]
			then iasl -ve Dsdt.asl ||_error "iasl failed"
			else wine "${ROOTDIR}/tools/asl-x64.exe" Dsdt.asl ||_error "asl.exe failed"
			fi
			if [ "${USE_IASL}" == "true" ]
			then cp DSDT.aml "${ROOTDIR}/Platform/${VENDOR_NAME}/${SOC_PLATFORM_L}/AcpiTables/${DEVICE}/"
			else cp DSDT.AML "${ROOTDIR}/Platform/${VENDOR_NAME}/${SOC_PLATFORM_L}/AcpiTables/${DEVICE}/"
			fi
			popd
		else
			_error "Building DSDT is unsupported for this device"
		fi
	fi

	# based on the instructions from edk2-platform
	rm -f "${OUTDIR}/boot-${DEVICE}${EXT}.img" "${OUTDIR}/uefi-${DEVICE}"*

	case "${MODE}" in
		RELEASE) _MODE=RELEASE;;
		*) _MODE=DEBUG;;
	esac

	echo "Building BootShim"
	pushd "${ROOTDIR}/tools/BootShim"
	make UEFI_BASE=0xD0000000 UEFI_SIZE=0x00600000
	popd

	_call_hook platform_pre_build||return "$?"
	build \
		-s \
		-n 0 \
		-a AARCH64 \
		-t "${TOOLCHAIN}" \
		-p "${ROOTDIR}/Platform/${VENDOR_NAME}/${SOC_PLATFORM_L}/${PLATFORM_NAME}.dsc" \
		-b "${_MODE}" \
		-D FIRMWARE_VER="${GITCOMMIT}" \
		-D USE_UART="${USE_UART}" \
		||return "$?"
	_call_hook platform_build_kernel||return "$?"
	_call_hook platform_build_bootimg||return "$?"
	echo "Build done: ${OUTDIR}/boot-${DEVICE}${EXT}.img"
	set +x
}

function _clean(){ rm --one-file-system --recursive --force "${WORKSPACE}" "${OUTDIR}"/boot-*.img "${OUTDIR}"/uefi-*.img*; }

function _distclean(){ if [ -d .git ];then git clean -xdf;else _clean;fi; }

OUTDIR="${PWD}"
ROOTDIR="$(realpath "$(dirname "$0")")"
cd "${ROOTDIR}"||exit 1
typeset -l DEVICE
typeset -u MODE
DEVICE=""
MODE=RELEASE
CHINESE=false
CLEAN=false
DISTCLEAN=false
TOOLCHAIN=GCC5
SOC_VENDOR=Qualcomm
USE_UART=0
export ROOTDIR OUTDIR SOC_VENDOR
export GEN_ACPI=false
export GEN_ROOTFS=true
OPTS="$(getopt -o t:d:hacACDO:r:u -l toolchain:,device:,help,all,chinese,acpi,skip-rootfs-gen,uart,clean,distclean,outputdir:,release: -n 'build.sh' -- "$@")"||exit 1
eval set -- "${OPTS}"
while true
do	case "${1}" in
		-d|--device) DEVICE="${2}";shift 2;;
		-a|--all) DEVICE=all;shift;;
		-c|--chinese) CHINESE=true;shift;;
		-A|--acpi) GEN_ACPI=true;shift;;
		-C|--clean) CLEAN=true;shift;;
		-D|--distclean) DISTCLEAN=true;shift;;
		-O|--outputdir) OUTDIR="${2}";shift 2;;
		--skip-rootfs-gen) GEN_ROOTFS=false;shift;;
		-r|--release) MODE="${2}";shift 2;;
		-t|--toolchain) TOOLCHAIN="${2}";shift 2;;
		-u|--uart) USE_UART=1;shift;;
		-h|--help) _help 0;shift;;
		--) shift;break;;
		*) _help 1;;
	esac
done
if "${DISTCLEAN}";then _distclean;exit "$?";fi
if "${CLEAN}";then _clean;exit "$?";fi
[ -z "${DEVICE}" ]&&_help 1
if ! [ -f Common/edk2/edksetup.sh ] && ! [ -f ../edk2/edksetup.sh ]
then
	set -e
	echo "Updating submodules"
	if "${CHINESE}"
	then
		git submodule set-url Common/edk2                                           https://hub.fastgit.xyz/tianocore/edk2.git
		git submodule set-url Common/edk2-platforms                                 https://hub.fastgit.xyz/tianocore/edk2-platforms.git
		git submodule set-url Platform/EFI_Binaries                                 https://hub.fastgit.xyz/edk2-porting/edk2-sdm845-binary.git
		git submodule set-url Platform/RenegadePkg/Library/SimpleInit               https://hub.fastgit.xyz/BigfootACA/simple-init.git
		git submodule init;git submodule update --depth 1
		pushd Common/edk2

		git submodule set-url ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3   https://hub.fastgit.xyz/ucb-bar/berkeley-softfloat-3.git
		git submodule set-url CryptoPkg/Library/OpensslLib/openssl                  https://hub.fastgit.xyz/openssl/openssl.git
		git submodule set-url BaseTools/Source/C/BrotliCompress/brotli              https://hub.fastgit.xyz/google/brotli.git
		git submodule set-url UnitTestFrameworkPkg/Library/CmockaLib/cmocka         https://hub.fastgit.xyz/tianocore/edk2-cmocka.git
		git submodule set-url ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3   https://hub.fastgit.xyz/ucb-bar/berkeley-softfloat-3.git
		git submodule set-url MdeModulePkg/Library/BrotliCustomDecompressLib/brotli https://hub.fastgit.xyz/google/brotli.git
		git submodule set-url MdeModulePkg/Universal/RegularExpressionDxe/oniguruma https://hub.fastgit.xyz/kkos/oniguruma.git
		git submodule set-url RedfishPkg/Library/JsonLib/jansson                    https://hub.fastgit.xyz/akheron/jansson.git
		git submodule init;git submodule update
		git checkout .gitmodules
		popd
		pushd Platform/RenegadePkg/Library/SimpleInit
		git submodule set-url libs/lvgl     https://hub.fastgit.xyz/lvgl/lvgl.git
		git submodule set-url libs/freetype https://hub.fastgit.xyz/freetype/freetype.git
		git submodule init;git submodule update
		popd
		git checkout .gitmodules
	else
		git submodule init;git submodule update --depth 1
		pushd Common/edk2
		git submodule init;git submodule update
		popd
		pushd Platform/RenegadePkg/Library/SimpleInit
		git submodule init;git submodule update
		popd
	fi
	set +e
fi
for i in "${EDK2}" ./Common/edk2 ../edk2
do
	if [ -n "${i}" ]&&[ -f "${i}/edksetup.sh" ]
	then
		_EDK2="$(realpath "${i}")"
		break
	fi
done
for i in "${EDK2_PLATFORMS}" ./Common/edk2-platforms ../edk2-platforms
do
	if [ -n "${i}" ]&&[ -d "${i}/Platform" ]
	then
		_EDK2_PLATFORMS="$(realpath "${i}")"
		break
	fi
done
for i in "${SIMPLE_INIT}" Platform/RenegadePkg/Library/SimpleInit ./simple-init ../simple-init
do
	if [ -n "${i}" ]&&[ -f "${i}/SimpleInit.inc" ]
	then
		_SIMPLE_INIT="$(realpath "${i}")"
		break
	fi
done
[ -n "${_EDK2}" ]||_error "EDK2 not found, please see README.md"
[ -n "${_EDK2_PLATFORMS}" ]||_error "EDK2 Platforms not found, please see README.md"
[ -n "${_SIMPLE_INIT}" ]||_error "SimpleInit not found, please see README.md"
[ -f "configs/${DEVICE}.conf" ]||_error "Device configuration not found"
echo "EDK2 Path: ${_EDK2}"
echo "EDK2_PLATFORMS Path: ${_EDK2_PLATFORMS}"
export CROSS_COMPILE="${CROSS_COMPILE:-aarch64-linux-gnu-}"
export GCC5_AARCH64_PREFIX="${CROSS_COMPILE}"
export CLANG38_AARCH64_PREFIX="${CROSS_COMPILE}"
export PACKAGES_PATH="$_EDK2:$_EDK2_PLATFORMS:$_SIMPLE_INIT:$PWD"
export WORKSPACE="${OUTDIR}/workspace"
GITCOMMIT="$(git describe --tags --always)"||GITCOMMIT="unknown"
export GITCOMMIT
echo > ramdisk
set -e
mkdir -p "${_SIMPLE_INIT}/build" "${_SIMPLE_INIT}/root/usr/share/locale"
for i in "${_SIMPLE_INIT}/po/"*.po
do
	[ -f "${i}" ]||continue
	_name="$(basename "$i" .po)"
	_path="${_SIMPLE_INIT}/root/usr/share/locale/${_name}/LC_MESSAGES"
	mkdir -p "${_path}"
	msgfmt -o "${_path}/simple-init.mo" "${i}"
done

if "${GEN_ROOTFS}"
then
	 bash "${_SIMPLE_INIT}/scripts/gen-rootfs-source.sh" \
		"${_SIMPLE_INIT}" \
		"${_SIMPLE_INIT}/build"
fi

if [ "${DEVICE}" == "all" ]
then
	E=0
	for i in configs/*.conf
	do
		DEV="$(basename "$i" .conf)"
		echo "Building ${DEV}"
		_build "${DEV}"||E="$?"
	done
	exit "${E}"
else
	_build "${DEVICE}"
fi
