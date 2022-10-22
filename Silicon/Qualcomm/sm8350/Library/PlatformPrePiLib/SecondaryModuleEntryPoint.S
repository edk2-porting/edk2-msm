#include <Library/PcdLib.h>
#include <AsmMacroIoLibV8.h>
#include <Chipset/AArch64.h>

.text
.align 3

.set CTRL_SPAN_BIT, (1 << 23)

GCC_ASM_IMPORT (CEntryPoint)

GCC_ASM_IMPORT (ArmEnableInstructionCache)
GCC_ASM_IMPORT (ArmEnableDataCache)
GCC_ASM_IMPORT (ArmInvalidateTlb)

GCC_ASM_EXPORT (_SecondaryModuleEntryPoint)

_StackBase:
  .quad FixedPcdGet32(PcdPrePiStackBase)

_StackSize:
  .quad FixedPcdGet32(PcdPrePiStackSize)

_SecondaryModuleEntryPoint:
  /* Keep the CPU index in x19 */
  mov x19, x0

  mov x0, #0
  mov x1, #0

  /* First ensure all interrupts are disabled */
  bl ASM_PFX(ArmDisableInterrupts)

  /* Ensure that the MMU and caches are off */
  bl ASM_PFX(ArmDisableCachesAndMmu)

  /* Invalide I-Cache */
  bl ASM_PFX(ArmInvalidateInstructionCache)

  /* Invalidate TLB */
  bl ASM_PFX(ArmInvalidateTlb)

  mrs x0, sctlr_el1
  orr x0, x0, #CTRL_SPAN_BIT
  msr sctlr_el1, x0

_SetupExceptionVector:
  ldr x0, =FixedPcdGet64(PcdCpuVectorBaseAddress)
  bl ArmWriteVBar

  /* Keep the CPU index in x4 */
  mov     x4, x19
  and     x4, x4, #0xFFFF
  lsr     x4, x4, #8

  mov x5, #0x8
  sub x4, x5, x4

  ubfiz x2, x4, #15, #8

_SetupSecondaryCoreStack:
  ldr x3, =FixedPcdGet32(PcdPrePiStackBase)         /* Stack base arg0 */

  add x2, x3, x2
  sub x3, x2, #0x8000                               /* Stack size arg1 */

  mov x4, xzr
  mov x5, xzr

_ClearStackSecondary:
  /* Assumes StackBase is 128-bit aligned, StackSize is a multiple of 16B */
  stp     x4, x5, [x3], #16
  cmp     x3, x2                                   /* Compare Size */
  b.lt    _ClearStackSecondary

  add sp, x2, xzr                                  /* Initalize SP */

_EnableCache:
  bl ArmInvalidateDataCache
  bl ASM_PFX(ArmEnableInstructionCache)
  bl ASM_PFX(ArmEnableDataCache)

_PrepareArguments:
  /* x0 = _StackBase and x1 = _StackSize */
  ldr x0, _StackBase     /* Stack base arg0 */
  ldr x1, _StackSize     /* Stack size arg1 */

  bl CEntryPoint

.align 3
dead:
  b dead                      /* We should never get here */