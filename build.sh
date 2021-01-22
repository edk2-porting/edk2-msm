#!/bin/bash
##### Change this to add device #####
DEVICES=(
	dipper
	enchilada
	fajita
	polaris
	beryllium
	perseus
)
#####################################
function _help(){
	echo "Usage: build.sh --device DEV"
	echo
	echo "Build edk2 for Qualcomm SDM845 platform."
	echo
	echo "Options: "
	echo "	--device DEV, -d DEV: build for DEV. (${DEVICES[*]})"
	echo "	--all, -a:            build all devices."
	echo "	--chinese, -c:        optimization for Chinese users."
	echo "	--help, -h:           show this help."
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
	make -C "${_EDK2}/BaseTools" -j "$(nproc)"||exit "$?"
	# based on the instructions from edk2-platform
	rm -f "boot_${DEVICE}.img" uefi_img "uefi-${DEVICE}.img.gz" "uefi-${DEVICE}.img.gz-dtb"
	build -s -n 0 -a AARCH64 -t GCC5 -p "sdm845Pkg/${DEVICE}.dsc"||return "$?"
	gzip -c < workspace/Build/sdm845Pkg/DEBUG_GCC5/FV/SDM845PKG_UEFI.fd > "uefi-${DEVICE}.img.gz"||return "$?"
	cat "uefi-${DEVICE}.img.gz" "device_specific/${DEVICE}.dtb" > "uefi-${DEVICE}.img.gz-dtb"||return "$?"
	abootimg --create "boot-${DEVICE}.img" -k "uefi-${DEVICE}.img.gz-dtb" -r ramdisk||return "$?"
	echo "Build done: boot-${DEVICE}.img"
	set +x
}
cd "$(dirname "$0")"||exit 1
[ -f sdm845Pkg/sdm845Pkg.dsc ]||_error "cannot find sdm845Pkg/sdm845Pkg.dsc"
typeset -l DEVICE
DEVICE=""
CHINESE=false
OPTS="$(getopt -o d:hac -l device:,help,all,chinese -n 'build.sh' -- "$@")"||exit 1
eval set -- "${OPTS}"
while true
do	case "${1}" in
		-d|--device)DEVICE="${2}";shift 2;;
		-a|--all)DEVICE=all;shift;;
		-c|--chinese)CHINESE=true;shift;;
		-h|--help)_help 0;shift;;
		--)shift;break;;
		*)_help 1;;
	esac
done
if ! [ -f edk2/edksetup.sh ] || ! [ -f ../edk2/edksetup.sh ]
then	set -e
	echo "Updating submodules"
	if "${CHINESE}"
	then	git submodule set-url edk2 https://hub.fastgit.org/tianocore/edk2.git
		git submodule set-url edk2-platforms https://hub.fastgit.org/tianocore/edk2-platforms.git
		git submodule init;git submodule update --depth 1
		pushd edk2
		
		git submodule set-url ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3   https://hub.fastgit.org/ucb-bar/berkeley-softfloat-3.git
		git submodule set-url CryptoPkg/Library/OpensslLib/openssl                  https://hub.fastgit.org/openssl/openssl.git
		git submodule set-url BaseTools/Source/C/BrotliCompress/brotli              https://hub.fastgit.org/google/brotli.git
		git submodule set-url UnitTestFrameworkPkg/Library/CmockaLib/cmocka         https://git.cryptomilk.org/projects/cmocka.git
		git submodule set-url ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3   https://hub.fastgit.org/ucb-bar/berkeley-softfloat-3.git
		git submodule set-url MdeModulePkg/Library/BrotliCustomDecompressLib/brotli https://hub.fastgit.org/google/brotli.git
		git submodule set-url MdeModulePkg/Universal/RegularExpressionDxe/oniguruma https://hub.fastgit.org/kkos/oniguruma.git
		git submodule init;git submodule update
		git checkout .gitmodules
		popd
		git checkout .gitmodules
	else	git submodule init;git submodule update --depth 1
		pushd edk2
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
[ -n "${_EDK2}" ]||_error "EDK2 not found, please see README.md"
[ -n "${_EDK2_PLATFORMS}" ]||_error "EDK2 Platforms not found, please see README.md"
echo "EDK2 Path: ${_EDK2}"
echo "EDK2_PLATFORMS Path: ${_EDK2_PLATFORMS}"
# not actually GCC5, it's GCC7 on Ubuntu 18.04.
export GCC5_AARCH64_PREFIX="${CROSS_COMPILE:-aarch64-linux-gnu-}"
export PACKAGES_PATH="$_EDK2:$_EDK2_PLATFORMS:$PWD"
export WORKSPACE="${PWD}/workspace"
echo > ramdisk
set -e
python3 assets/generate-logo.py
if [ -z "${DEVICE}" ]
then _help 1
elif [ "${DEVICE}" == "all" ]
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
