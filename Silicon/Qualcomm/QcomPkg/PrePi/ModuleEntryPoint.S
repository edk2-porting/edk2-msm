#include <Library/PcdLib.h>
#include <AsmMacroIoLibV8.h>
#include <Chipset/AArch64.h>

#define LoadConstantToReg(Data, Reg) \
  ldr  Reg, =Data

.text
.align 3

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
  /* Know about the current CPU index */
  mrs x3, mpidr_el1
  mov x2, x3
  mov x1, #0x0000100
  and x2, x2, x1
  cmp x2, #0x0
  mov x0, #0
  beq _CpuIndex

  mov x0, #4
_CpuIndex:
  mov x2, x3
  mov x1, #0xf
  and x2, x2, x1
  add x0, x0, x2

  /* Keep the CPU index in x19 */
  mov x19, x0

  /* Secondary startup case */
  cmp x19, #0x0
  bne SecondaryCpuEntry

  /* First ensure all interrupts are disabled */
  bl ASM_PFX(ArmDisableInterrupts)

  /* Ensure that the MMU and caches are off */
  bl ASM_PFX(ArmDisableCachesAndMmu)

  /* Invalide I-Cache */
  bl ASM_PFX(ArmInvalidateInstructionCache)

  /* Invalidate TLB */
  bl ASM_PFX(ArmInvalidateTlb)

_SetupExceptionVector:
  LoadConstantToReg (FixedPcdGet32(PcdCpuVectorBaseAddress), x0)
  ldr x1, dead
  mov x2, #0

_FillVectors:
  /* Each entry is 8 bytes, vector table size is 0x800 per core */
  str     x1, [x0, x2]
  adds    x2, x2, #8
  cmp     x2, #0x800
  bne     _FillVectors

  /* Get current EL in x0 */
  mrs x0, CurrentEl

  /* Check if we are in EL1 */
  cmp x0, #0x4
  b.eq _SetupEl1VBar

  cmp x0, #0x5
  b.eq _SetupEl1VBar

_SetupEl1VBar:
  msr vbar_el1, x0        

_DonNotTrap_VFP_SIMD:
  mrs x0, CPACR_EL1
  /* Bit 20 and 21 */
  orr x0, x0, #0x300000
  msr CPACR_EL1, x0

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
  st4     {v4.16b, v5.16b, v6.16b, v7.16b}, [x3], #64  /* Fill every 64 bytes */
  cmp     x3, x2                                   /* Compare Size */ 
  b.lt     _ClearStack 

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

SecondaryCpuEntry:
  mov x19, x4

  mov x5, #0x8
  sub x4, x5, x4

  ubfiz   x2, x4, #15, #8

_SetupSecondaryCoreStack:
  ldr x3, _StackBase     /* Stack base arg0 */

  add x2, x3, x2
  sub x3, x2,#0x8000     /* Stack size arg1 */

  mov x4, xzr
  mov x5, xzr

_ClearStackSecondary: 
  /* Assumes StackBase is 128-bit aligned, StackSize is a multiple of 64B */
  st4     {v4.2d, v5.2d, v6.2d, v7.2d}, [x3], #64  /* Fill every 64 bytes */
  cmp     x3, x2                                   /* Compare Size */ 
  b.lt     _ClearStackSecondary 

  add sp, x2, xzr                                  /* Initalize SP */

  bl ArmInvalidateDataCache

  /* Enter MpPark spin */
  mov x0, x19
  bl SecondaryCEntryPoint

secondarydead:
  wfe
  b secondarydead                      /* We should never get here */