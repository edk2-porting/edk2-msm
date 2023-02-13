_Head:
	/* Jump to the real code */
	b		_Start

_KernelStart:
	/* Jump to the kernel
	   This value needs to be filled when patching */
	b 		#0x02000000

	/* Text Offset */
	.quad 0x00080000

	/* Image Size */
	.quad 0x0BADFACE

	/* Flags. 0x2 informs the bootloader to load kernel as
	 low as possible to make enough room for UEFI */
	.quad 0x2
_StackBase:
	.quad UEFI_BASE

_StackSize:
	.quad UEFI_SIZE

_KernelSize:
	/* Size of kernel for calculating where the FD is */
	.quad 0xDEADBEEF

	/* ARM64 Magic */
	.ascii "ARM\x64"

	/* Reserved */
	.long 0

	/* Magic for identification */
	.ascii "EDK2-MSM"

_Start:
	/* Here it reads 0x17FE00000 to get 
	message from simple-init on last reboot */
	mov		x4, #0x7FE00000
	movk	x4, #0x1, lsl #32
	mov		x6, #128
	mov		w7, #0x5241

_TestLoop:
	ldrh	w5, [x4]
	add		x4, x4, #2
	cmp		w5, w7
	b.eq	_ClearFlags
	subs	x6, x6, #1
	b.ne    _TestLoop

_CopyUEFI:
	/* Copy the UEFI into the right location */
	adr		x4, _Head
	ldr		x5, _KernelSize
	add		x4, x4, x5

	ldr		x5, _StackBase
	ldr		x6, _StackSize

	bl 		_CopyLoop

_Entry:
	ldr		x5, _StackBase
	/* Jump to UEFI */
	br		x5

_CopyLoop:
	ldp		x2, x3, [x4], #16
	stp		x2, x3, [x5], #16
	subs	x6, x6, #16
	b.ne	_CopyLoop
	ret

_ClearFlags:
	mov		x4, #0x7FE00000
	movk	x4, #0x1, lsl #32
	mov		x6, #32

_ClearLoop:
	/* fill in 64bit at a time */
	str		xzr, [x4]
	add		x4, x4, #8
	subs	x6, x6, #1
	b.ne    _ClearLoop
	b 		_KernelStart

_Dead:
	/* We should never get here */
	b		_Dead

.text
.align 4