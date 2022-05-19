#!/bin/bash

##### Change this to add device #####
DEVICES=(
	dipper
	enchilada
	fajita
	polaris
	beryllium-tianma
	beryllium-ebbg
	perseus
	nx616j
	m1882
	m1892
	skr-a0
	judyln
	judyp
	judypn
	star2qltechn
	dipper-old
	pafm00
	trident
	olympic
	draco
	pd1821
	ayn-odin
	akershus
	equuleus
)
#####################################

function _help(){
	echo "Usage: build.sh --device DEV"
	echo
	echo "Build edk2 for Qualcomm SDM845 platform."
	echo
	echo "Options: "
	echo "	--device DEV, -d DEV:    build for DEV. (${DEVICES[*]})"
	echo "	--all, -a:               build all devices."
	echo "	--chinese, -c:           use hub.fastgit.xyz for submodule cloning."
	echo "	--release MODE, -r MODE: Release mode for building, default is 'RELEASE', 'DEBUG' alternatively."
	echo "	--toolchain TOOLCHAIN:   Set toolchain, default is 'GCC5'."
	echo "	--uart, -u:              compile with UART support, print debug messages to uart debug port."
	echo "	--acpi, -A:              compile DSDT using MS asl with wine"
	echo "	--clean, -C:             clean workspace and output."
	echo "	--distclean, -D:         clean up all files that are not in repo."
	echo "	--outputdir, -O:         output folder."
	echo "	--help, -h:              show this help."
	echo
	echo "MainPage: https://github.com/edk2-porting/edk2-sdm845"
	exit "${1}"
}

function _error(){ echo "${@}" >&2;exit 1; }

function _build(){
	local DEVICE="${1}"
	shift
	source "${_EDK2}/edksetup.sh"
	[ -d "${WORKSPACE}" ]||mkdir "${WORKSPACE}"
	set -x
	make -C "${_EDK2}/BaseTools"||exit "$?"
	
	EXT="" #support for both panels of beryllium
	if [ "${DEVICE}" == "beryllium-tianma" ]
	then cp sdm845Pkg/AcpiTables/beryllium/panel-tianma.asl sdm845Pkg/AcpiTables/beryllium/panel.asl
		DEVICE="beryllium"
		EXT="-tianma"
		GEN_ACPI=true
	fi
	if [ "${DEVICE}" == "beryllium-ebbg" ]
	then cp sdm845Pkg/AcpiTables/beryllium/panel-ebbg.asl sdm845Pkg/AcpiTables/beryllium/panel.asl
		DEVICE="beryllium"
		EXT="-ebbg"
		GEN_ACPI=true
	fi
	
	if "${GEN_ACPI}" && ! (cd sdm845Pkg/AcpiTables/${DEVICE}/ && wine ../bin/asl-x64.exe Dsdt.asl && cd ../../..)
	then echo "asl build failed. Have you installed wine?" >&2;return 1
	fi
	# based on the instructions from edk2-platform
	rm -f "${OUTDIR}/boot-${DEVICE}${EXT}.img" uefi_img "uefi-${DEVICE}.img.gz" "uefi-${DEVICE}.img.gz-dtb"
	case "${MODE}" in
		RELEASE)_MODE=RELEASE;;
		*)_MODE=DEBUG;;
	esac
	if [ -f "devices/${DEVICE}.conf" ]
	then source "devices/${DEVICE}.conf"
	else source "devices/default.conf"
	fi
	build \
		-s \
		-n 0 \
		-a AARCH64 \
		-t "${TOOLCHAIN}" \
		-p "${DSC_FILE}" \
		-b "${_MODE}" \
		-D FIRMWARE_VER="${GITCOMMIT}" \
		-D USE_UART="${USE_UART}" \
		||return "$?"
	gzip -c \
		< "workspace/Build/sdm845Pkg/${_MODE}_${TOOLCHAIN}/FV/SDM845PKG_UEFI.fd" \
		> "workspace/uefi-${DEVICE}.img.gz" \
		||return "$?"
	cat \
		"workspace/uefi-${DEVICE}.img.gz" \
		"device_specific/${DEVICE}.dtb" \
		> "workspace/uefi-${DEVICE}.img.gz-dtb" \
		||return "$?"
	python3 ./mkbootimg.py \
		--kernel "workspace/uefi-${DEVICE}.img.gz-dtb" \
		--ramdisk ramdisk \
		--kernel_offset 0x00000000 \
		--ramdisk_offset 0x00000000 \
		--tags_offset 0x00000000 \
		--os_version "${BOOTIMG_OS_VERSION}" \
		--os_patch_level "${BOOTIMG_OS_PATCH_LEVEL}" \
		--header_version 1 \
		-o "${OUTDIR}/boot-${DEVICE}${EXT}.img" \
		||return "$?"
	echo "Build done: ${OUTDIR}/boot-${DEVICE}${EXT}.img"
	set +x
}

function _clean(){ rm --one-file-system --recursive --force ./workspace boot-*.img uefi-*.img*; }

function _distclean(){ if [ -d .git ];then git clean -xdf;else _clean;fi; }

cd "$(dirname "$0")"||exit 1
[ -f sdm845Pkg/sdm845Pkg.dsc ]||_error "cannot find sdm845Pkg/sdm845Pkg.dsc"
typeset -l DEVICE
typeset -u MODE
DEVICE=""
MODE=RELEASE
CHINESE=false
CLEAN=false
DISTCLEAN=false
TOOLCHAIN=GCC5
USE_UART=0
export OUTDIR="${PWD}"
export GEN_ACPI=false
OPTS="$(getopt -o t:d:hacACDO:r:u -l toolchain:,device:,help,all,chinese,acpi,uart,clean,distclean,outputdir:,release: -n 'build.sh' -- "$@")"||exit 1
eval set -- "${OPTS}"
while true
do	case "${1}" in
		-d|--device)DEVICE="${2}";shift 2;;
		-a|--all)DEVICE=all;shift;;
		-c|--chinese)CHINESE=true;shift;;
		-A|--acpi)GEN_ACPI=true;shift;;
		-C|--clean)CLEAN=true;shift;;
		-D|--distclean)DISTCLEAN=true;shift;;
		-O|--outputdir)OUTDIR="${2}";shift 2;;
		-r|--release)MODE="${2}";shift 2;;
		-t|--toolchain)TOOLCHAIN="${2}";shift 2;;
		-u|--uart)USE_UART=1;shift;;
		-h|--help)_help 0;shift;;
		--)shift;break;;
		*)_help 1;;
	esac
done
if "${DISTCLEAN}";then _distclean;exit "$?";fi
if "${CLEAN}";then _clean;exit "$?";fi
[ -z "${DEVICE}" ]&&_help 1
if ! [ -f edk2/edksetup.sh ] && ! [ -f ../edk2/edksetup.sh ]
then	set -e
	echo "Updating submodules"
	[ -e sdm845Pkg/AcpiTables/.git ]||git clone https://git.renegade-project.org/edk2-sdm845-acpi.git sdm845Pkg/AcpiTables
	if "${CHINESE}"
	then	git submodule set-url edk2                         https://hub.fastgit.xyz/tianocore/edk2.git
		git submodule set-url edk2-platforms               https://hub.fastgit.xyz/tianocore/edk2-platforms.git
		git submodule set-url sdm845Pkg/Binary             https://hub.fastgit.xyz/edk2-porting/edk2-sdm845-binary.git
		git submodule set-url sdm845Pkg/Library/SimpleInit https://hub.fastgit.xyz/BigfootACA/simple-init.git
		git submodule init;git submodule update --depth 1
		pushd edk2

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
		pushd sdm845Pkg/Library/SimpleInit
		git submodule set-url libs/lvgl     https://hub.fastgit.xyz/lvgl/lvgl.git
		git submodule set-url libs/freetype https://hub.fastgit.xyz/freetype/freetype.git
		git submodule init;git submodule update
		popd
		git checkout .gitmodules
	else	git submodule init;git submodule update --depth 1
		pushd edk2
		git submodule init;git submodule update
		popd
		pushd sdm845Pkg/Library/SimpleInit
		git submodule init;git submodule update
		popd
	fi
	set +e
fi
for i in "${EDK2}" ./edk2 ../edk2
do	if [ -n "${i}" ]&&[ -f "${i}/edksetup.sh" ]
	then	_EDK2="$(realpath "${i}")"
		break
	fi
done
for i in "${EDK2_PLATFORMS}" ./edk2-platforms ../edk2-platforms
do	if [ -n "${i}" ]&&[ -d "${i}/Platform" ]
	then	_EDK2_PLATFORMS="$(realpath "${i}")"
		break
	fi
done
for i in "${SIMPLE_INIT}" sdm845Pkg/Library/SimpleInit ./simple-init ../simple-init
do	if [ -n "${i}" ]&&[ -f "${i}/SimpleInit.inc" ]
	then	_SIMPLE_INIT="$(realpath "${i}")"
		break
	fi
done
[ -n "${_EDK2}" ]||_error "EDK2 not found, please see README.md"
[ -n "${_EDK2_PLATFORMS}" ]||_error "EDK2 Platforms not found, please see README.md"
[ -n "${_SIMPLE_INIT}" ]||_error "SimpleInit not found, please see README.md"
echo "EDK2 Path: ${_EDK2}"
echo "EDK2_PLATFORMS Path: ${_EDK2_PLATFORMS}"
export CROSS_COMPILE="${CROSS_COMPILE:-aarch64-linux-gnu-}"
export GCC5_AARCH64_PREFIX="${CROSS_COMPILE}"
export CLANG38_AARCH64_PREFIX="${CROSS_COMPILE}"
export PACKAGES_PATH="$_EDK2:$_EDK2_PLATFORMS:$_SIMPLE_INIT:$PWD"
export WORKSPACE="${PWD}/workspace"
GITCOMMIT="$(git describe --tags --always)"||GITCOMMIT="unknown"
export GITCOMMIT
echo > ramdisk
set -e
python3 assets/generate-logo.py "${GITCOMMIT}"
mkdir -p "${_SIMPLE_INIT}/build" "${_SIMPLE_INIT}/root/usr/share/locale"
for i in "${_SIMPLE_INIT}/po/"*.po
do	[ -f "${i}" ]||continue
	_name="$(basename "$i" .po)"
	_path="${_SIMPLE_INIT}/root/usr/share/locale/${_name}/LC_MESSAGES"
	mkdir -p "${_path}"
	msgfmt -o "${_path}/simple-init.mo" "${i}"
done
bash "${_SIMPLE_INIT}/scripts/gen-rootfs-source.sh" \
	"${_SIMPLE_INIT}" \
	"${_SIMPLE_INIT}/build"
if [ "${DEVICE}" == "all" ]
then	E=0
	for i in "${DEVICES[@]}"
	do	echo "Building ${i}"
		rm --recursive --force --one-file-system ./workspace||true
		_build "${i}"||E="$?"
	done
	exit "${E}"
else	HAS=false
	for i in "${DEVICES[@]}"
	do	[ "${i}" == "${DEVICE}" ]||continue
		HAS=true
		break
	done
	[ "${HAS}" == "true" ]||_error "build.sh: unknown build target device ${DEVICE}."
	_build "${DEVICE}"
fi
