function platform_build_bootimg(){
	abootimg \
		--create "${OUTDIR}/boot-${DEVICE}${EXT}.img" \
		-k "${WORKSPACE}/uefi-${DEVICE}-kernel" -r ramdisk \
		||return "$?"
}
