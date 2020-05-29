#!/bin/bash
# based on the instructions from edk2-platform
echo cleanning BuidFiles
rm -rf boot_dipper.img
echo Done.
set -e
. firstrun_common.sh
# not actually GCC5; it's GCC7 on Ubuntu 18.04.
GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -s -n 0 -a AARCH64 -t GCC5 -p sdm845Pkg/dipper.dsc
gzip -c < workspace/Build/sdm845Pkg/DEBUG_GCC5/FV/SDM845PKG_UEFI.fd >uefi_img
cat ./device_specific/dipper.dtb >>uefi_img
abootimg --create boot_dipper.img -k uefi_img -r ramdisk -f bootimg.cfg
rm -rf ./uefi_img
