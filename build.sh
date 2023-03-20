#!/bin/bash

function _help(){
	echo "Usage: build.sh --device DEV"
	echo
	echo "Build edk2 for Qualcomm Snapdragon platforms."
	echo
	echo "Options: "
	echo "	--device DEV, -d DEV:    build for DEV."
	echo "	--all, -a:               build all devices."
	echo "	--chinese, -c:           use hub.nuaa.cf for submodule cloning."
	echo "	--release MODE, -r MODE: Release mode for building, default is 'RELEASE', 'DEBUG' alternatively."
	echo "	--toolchain TOOLCHAIN:   Set toolchain, default is 'CLANG38'."
	echo "	--uart, -u:              compile with UART support, print debug messages to uart debug port."
	echo " 	--skip-rootfs-gen:       skip generating SimpleInit rootfs to speed up building."
	echo " 	--no-exception-disp:     do not display exception information in DEBUG builds."
	echo "	--acpi, -A:              compile DSDT using MS asl with wine."
	echo "	--clean, -C:             clean workspace and output."
	echo "	--distclean, -D:         clean up all files that are not in repo."
	echo "	--outputdir, -O:         output folder."
	echo "	--boot, -b:              fastboot boot image."
	echo "	--fixclang, -f:          fix build using Clang by suppressing -Os flag."
	echo "	--installer-zip, -z:     generate flashable installer zip."
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

	if [ -f "configs/devices/${DEVICE}.conf" ]
	then source "configs/devices/${DEVICE}.conf"
	else _error "Device configuration not found"
	fi
	typeset -l SOC_PLATFORM_L="$SOC_PLATFORM"
	if [ -f "configs/${SOC_PLATFORM_L}.conf" ]
	then source "configs/${SOC_PLATFORM_L}.conf"
	else _error "SoC configuration not found"
	fi
	# for overriding config
	source "configs/devices/${DEVICE}.conf"

	if "${GEN_INSTALLER_ZIP}"
	then
		export ENABLE_LINUX_UTILS=1
	fi

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
			if compgen -G "${ROOTDIR}/Platform/${VENDOR_NAME}/${SOC_PLATFORM_L}/AcpiTables/*.asl" > /dev/null; then
				cp "${ROOTDIR}/Platform/${VENDOR_NAME}/${SOC_PLATFORM_L}/AcpiTables/"*.asl ./
			fi
			cp "${ROOTDIR}/Platform/${VENDOR_NAME}/${SOC_PLATFORM_L}/AcpiTables/${DEVICE}/"* ./
			if [ "${USE_IASL}" == "true" ]
			then iasl -ve Dsdt.asl ||_error "iasl failed"
			else wine "${ROOTDIR}/tools/asl-x64.exe" Dsdt.asl ||_error "asl.exe failed"
			fi
			test -e DSDT.aml && cp DSDT.aml "${ROOTDIR}/Platform/${VENDOR_NAME}/${SOC_PLATFORM_L}/AcpiTables/${DEVICE}/DSDT.aml"
			test -e DSDT.AML && cp DSDT.AML "${ROOTDIR}/Platform/${VENDOR_NAME}/${SOC_PLATFORM_L}/AcpiTables/${DEVICE}/DSDT.aml"
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
	rm -f BootShim.bin BootShim.elf BootShim.Dualboot.bin BootShim.Dualboot.elf
	make UEFI_BASE=${FD_BASE} UEFI_SIZE=${FD_SIZE}
	popd

	_call_hook platform_pre_build||return "$?"
	mkdir -p "${ROOTDIR}/Common/edk2/Conf"
	cp "${ROOTDIR}/tools/"{build_rule.txt,tools_def.txt} "${ROOTDIR}/Common/edk2/Conf/"
	build \
		-s \
		-n 0 \
		-a AARCH64 \
		-t "${TOOLCHAIN}" \
		-p "${ROOTDIR}/Platform/${VENDOR_NAME}/${SOC_PLATFORM_L}/${PLATFORM_NAME}.dsc" \
		-b "${_MODE}" \
		-D FIRMWARE_VER="${GITCOMMIT}" \
		-D USE_UART="${USE_UART}" \
		-D FIX_CLANG="${FIX_CLANG}" \
		-D NO_EXCEPTION_DISPLAY="${NO_EXCEPTION_DISPLAY}" \
		-D FD_BASE="${FD_BASE}" -D FD_SIZE="${FD_SIZE}" \
		-D ENABLE_LINUX_UTILS="${ENABLE_LINUX_UTILS}" \
		||return "$?"
	_call_hook platform_build_kernel||return "$?"
	_call_hook platform_build_bootimg||return "$?"
	echo "Build done: ${OUTDIR}/boot-${DEVICE}${EXT}.img"

	if "${GEN_INSTALLER_ZIP}"
	then
		cp "${WORKSPACE}/Build/${DEVICE}/${_MODE}_${TOOLCHAIN}/FV/${SOC_PLATFORM}_UEFI.fd" "${ROOTDIR}/tools/Installer/${DEVICE}_UEFI.fd"
		cp "${ROOTDIR}/tools/BootShim/BootShim.Dualboot.bin" "${ROOTDIR}/tools/Installer/BootShim.Dualboot.bin"
		pushd "${ROOTDIR}/tools/Installer/"
		./pack.sh
		popd
		mv "${ROOTDIR}/tools/Installer/installer.zip" "${OUTDIR}/uefi-installer-${DEVICE}${EXT}.zip"
		rm -f "${ROOTDIR}/tools/Installer/${DEVICE}_UEFI.fd"
		rm -f "${ROOTDIR}/tools/Installer/BootShim.Dualboot.bin"
		echo "Pack done: ${OUTDIR}/uefi-installer-${DEVICE}${EXT}.zip"
	fi
	set +x
}

function _clean(){ rm --one-file-system --recursive --force "${WORKSPACE}"./workspace "${OUTDIR}"/boot-*.img "${OUTDIR}"/uefi-installer-*.zip "${OUTDIR}"/uefi-*.img*; }

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
TOOLCHAIN=CLANG38
export FIX_CLANG=0
SOC_VENDOR=Qualcomm
USE_UART=0
NO_EXCEPTION_DISPLAY=0
export ROOTDIR OUTDIR SOC_VENDOR
export GEN_ACPI=false
export GEN_ROOTFS=true
export GEN_INSTALLER_ZIP=false
export FASTBOOT=false
OPTS="$(getopt -o t:d:hfabczACDO:r:u -l toolchain:,device:,help,fixclang,all,boot,chinese,acpi,skip-rootfs-gen,no-exception-disp,installer-zip,uart,clean,distclean,outputdir:,release: -n 'build.sh' -- "$@")"||exit 1
eval set -- "${OPTS}"
while true
do	case "${1}" in
		-d|--device) DEVICE="${2}";shift 2;;
		-a|--all) DEVICE=all;shift;;
		-b|--boot) FASTBOOT=true;shift;;
		-c|--chinese) CHINESE=true;shift;;
		-A|--acpi) GEN_ACPI=true;shift;;
		-C|--clean) CLEAN=true;shift;;
		-D|--distclean) DISTCLEAN=true;shift;;
		-O|--outputdir) OUTDIR="${2}";shift 2;;
		--skip-rootfs-gen) GEN_ROOTFS=false;shift;;
		--no-exception-disp) NO_EXCEPTION_DISPLAY=1;shift;;
		-r|--release) MODE="${2}";shift 2;;
		-t|--toolchain) TOOLCHAIN="${2}";shift 2;;
		-u|--uart) USE_UART=1;shift;;
		-f|--fixclang) FIX_CLANG=1;shift;;
		-z|--installer-zip) GEN_INSTALLER_ZIP=true;ENABLE_LINUX_UTILS=1;shift;;
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
		vim -u NONE -N .gitmodules -c "%s/github.com/hub.nuaa.cf/g" -c ":wq"
		git submodule init;git submodule update --depth 1
		pushd Common/edk2
		vim -u NONE -N .gitmodules -c "%s/github.com/hub.nuaa.cf/g" -c ":wq"
		git submodule init;git submodule update
		pushd CryptoPkg/Library/OpensslLib/openssl
		git submodule set-url boringssl https://hub.nuaa.cf/google/boringssl
		vim -u NONE -N .gitmodules -c "%s/github.com/hub.nuaa.cf/g" -c ":wq"
		git submodule init;git submodule update
		git checkout .gitmodules
		popd
		git checkout .gitmodules
		popd
		pushd Common/edk2-platforms
		vim -u NONE -N .gitmodules -c "%s/github.com/hub.nuaa.cf/g" -c ":wq"
		git submodule init;git submodule update
		git checkout .gitmodules
		popd
		pushd GPLDrivers/Library/SimpleInit
		git submodule set-url libs/freetype https://hub.nuaa.cf/freetype/freetype.git
		vim -u NONE -N .gitmodules -c "%s/github.com/hub.nuaa.cf/g" -c ":wq"
		git submodule init;git submodule update
		popd
		git checkout .gitmodules
		git submodule init;git submodule update --recursive
	else
		git submodule init;git submodule update --depth 1
		pushd Common/edk2
		git submodule init;git submodule update
		popd
		pushd Common/edk2-platforms
		git submodule init;git submodule update
		popd
		pushd GPLDrivers/Library/SimpleInit
		git submodule init;git submodule update
		popd
		pushd tools/Installer
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
for i in "${SIMPLE_INIT}" GPLDrivers/Library/SimpleInit ./simple-init ../simple-init
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
[ -f "configs/devices/${DEVICE}.conf" ]||_error "Device configuration not found"
echo "EDK2 Path: ${_EDK2}"
echo "EDK2_PLATFORMS Path: ${_EDK2_PLATFORMS}"
export CROSS_COMPILE="${CROSS_COMPILE:-aarch64-linux-gnu-}"
export GCC5_AARCH64_PREFIX="${CROSS_COMPILE}"
export CLANG38_AARCH64_PREFIX="${CROSS_COMPILE}"
export PACKAGES_PATH="$_EDK2:$_EDK2_PLATFORMS:$_SIMPLE_INIT:$PWD:$PWD/GPLDrivers"
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

if "${FASTBOOT}"
then
    fastboot boot ${OUTDIR}/boot-${DEVICE}${EXT}.img
fi
