#include <Library/PcdLib.h>
#include <AsmMacroIoLibV8.h>
#include <Chipset/AArch64.h>

.text
.align 3

.set CTRL_SPAN_BIT, (1 << 23)

GCC_ASM_IMPORT (CEntryPoint)
GCC_ASM_IMPORT (SecondaryCEntryPoint)

GCC_ASM_IMPORT (ArmEnableInstructionCache)
GCC_ASM_IMPORT (ArmEnableDataCache)
GCC_ASM_IMPORT (ArmInvalidateTlb)

GCC_ASM_EXPORT (_ModuleEntryPoint)
GCC_ASM_EXPORT (SecondaryCpuEntry)

.global _StackBase
.global _StackSize

_StackBase:
  .quad FixedPcdGet32(PcdPrePiStackBase)

_StackSize:
  .quad FixedPcdGet32(PcdPrePiStackSize)

_ModuleEntryPoint:
  mov x10, FixedPcdGet64 (PcdDeviceTreeStore)
  str x0, [x10] // oh my fdt

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

  mrs     x4, mpidr_el1
  and     x4, x4, #0xFFFF
  lsr     x4, x4, #8
  cbnz    x4, SecondaryCpuEntry

  ldr x1, dead
  add x2, x0, #0x800
  mov x3, x0

_FillVectors:
  stp     x1, x1, [x3], #16 /* Fill every 16 byte */
  cmp     x3, x2
  b.lt    _FillVectors

_DonNotTrap_VFP_SIMD:
  mrs x0, CPACR_EL1
  /* Bit 20 and 21 */
  orr x0, x0, #0x300000
  msr CPACR_EL1, x0
  isb sy

_SetupPrimaryCoreStack:
  ldr x0, _StackBase     /* Stack base arg0 */
  ldr x1, _StackSize     /* Stack size arg1 */

  /* Zero Init stack */
  add x2, x0, x1         /* End of Stack */
  mov x3, x0             /* Stack Base */

  mov v4.d[0], xzr
  mov v4.d[1], xzr
  mov v5.16b, v4.16b
  mov v6.16b, v4.16b
  mov v7.16b, v4.16b

_ClearStack:
  /* Assumes StackBase is 128-bit aligned, StackSize is a multiple of 64B */
  st4   {v4.16b, v5.16b, v6.16b, v7.16b}, [x3], #64  /* Fill every 64 bytes */
  cmp   x3, x2                                   /* Compare Size */
  b.lt  _ClearStack

  add sp, x2, xzr                                /* Initalize SP */

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

SecondaryCpuEntry:
  /* Keep the incoming index */
  mov x19, x4

  mov x5, #0x8
  sub x4, x5, x4

  ubfiz x2, x4, #15, #8

_SetupSecondaryCoreStack:
  ldr x3, _StackBase     /* Stack base arg0 */

  add x2, x3, x2
  sub x3, x2, #0x8000    /* Stack size arg1 */

  mov x4, xzr
  mov x5, xzr

_ClearStackSecondary:
  /* Assumes StackBase is 128-bit aligned, StackSize is a multiple of 16B */
  stp     x4, x5, [x3], #16
  cmp     x3, x2                                   /* Compare Size */
  b.lt    _ClearStackSecondary

  add sp, x2, xzr                                  /* Initalize SP */

  bl ArmInvalidateDataCache

  /* Enter MpPark spin */
  mov x0, x19
  bl SecondaryCEntryPoint

secondarydead:
  wfe
  b secondarydead                      /* We should never get here */