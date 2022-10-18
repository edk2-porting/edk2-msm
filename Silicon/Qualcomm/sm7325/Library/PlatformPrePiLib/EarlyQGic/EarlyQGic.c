/** @file

  This files implements early GIC initialization.

  Copyright (c) 2018, Bingxing Wang. All rights reserved.
  Copyright (c) 2016, Brian McKenzie. All rights reserved.
  Copyright (c) 2015-2016, Linaro Limited. All rights reserved.
  Copyright (c) 2015-2016, Hisilicon Limited. All rights reserved.

  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#include "PlatformUtils.h"

#include <Guid/LzmaDecompress.h>
#include <Guid/VariableFormat.h>
#include <Pi/PiBootMode.h>
#include <Pi/PiHob.h>
#include <PiDxe.h>
#include <PiPei.h>
#include <Ppi/GuidedSectionExtraction.h>

#include <Library/ArmGicLib.h>
#include <Library/ArmLib.h>
#include <Library/BaseMemoryLib.h>
#include <Library/CacheMaintenanceLib.h>
#include <Library/DebugAgentLib.h>
#include <Library/DebugLib.h>
#include <Library/FrameBufferSerialPortLib.h>
#include <Library/HobLib.h>
#include <Library/IoLib.h>
#include <Library/MemoryAllocationLib.h>
#include <Library/PcdLib.h>
#include <Library/PeCoffGetEntryPointLib.h>
#include <Library/PerformanceLib.h>
#include <Library/PrePiHobListPointerLib.h>
#include <Library/PrePiLib.h>
#include <Library/SerialPortLib.h>

#include "ArmGicV3Extensions.h"
#include "EarlyQGic.h"

#define GIC_WAKER_PROCESSORSLEEP 2
#define GIC_WAKER_CHILDRENASLEEP 4

/* Intialize distributor */
VOID QGicDistConfig(UINT32 NumIrq)
{
  UINT32 i;

  /* Set each interrupt line to use N-N software model
   * and edge sensitive, active high
   */
  for (i = 32; i < NumIrq; i += 16) {
    MmioWrite32(GIC_DIST_CONFIG + i * 4 / 16, 0xffffffff);
  }

  MmioWrite32(GIC_DIST_CONFIG + 4, 0xffffffff);

  /* Set priority of all interrupts */

  /*
   * In bootloader we dont care about priority so
   * setting up equal priorities for all
   */
  for (i = 0; i < NumIrq; i += 4) {
    MmioWrite32(GIC_DIST_PRI + i * 4 / 4, 0xa0a0a0a0);
  }

  /* Disabling interrupts */
  for (i = 0; i < NumIrq; i += 32) {
    MmioWrite32(GIC_DIST_ENABLE_CLEAR + i * 4 / 32, 0xffffffff);
  }

  MmioWrite32(GIC_DIST_ENABLE_SET, 0x0000ffff);
}

VOID QGicHardwareReset(VOID)
{
  UINT32 n;
  UINT32 num_irq = 0;

  /* Disabling GIC */
  MmioWrite32(GIC_DIST_CTRL, 0);
  // Reboots, GIC400 only? At least this makes a one instruction reboot
  // command... :)
  // MmioWrite32(GIC_DIST_CGCR, 0);
  ArmGicV3DisableInterruptInterface();
  ArmGicV3SetPriorityMask(0);
  ArmGicV3SetBinaryPointer(0);

  /* Find out how many interrupts are supported. */
  num_irq = MmioRead32(GIC_DIST_CTR) & 0x1f;
  num_irq = (num_irq + 1);

  for (n = 0; n < num_irq; n++) {
    MmioWrite32(GIC_DIST_REG(0x180 + 4 * n), 0xFFFFFFFF);
    MmioWrite32(GIC_DIST_REG(0x280 + 4 * n), 0xFFFFFFFF);
    MmioWrite32(GIC_DIST_REG(0x80 + 4 * n), 0xFFFFFFFF);
    MmioWrite32(GIC_DIST_REG(0xd00 + 4 * n), 0);
  }
}

VOID QGicSetBinpoint(VOID)
{
  /* No PREEMPT */
  ArmGicV3SetBinaryPointer(0x7);
}

VOID QGicDistInit(VOID)
{
  UINT32 i;
  UINT32 num_irq = 0;
  UINT32 affinity;

  /* Read the mpidr register to find out the boot up cluster */
  affinity = ArmReadMpidr();

  /* For aarch32 mode we have only 3 affinity values: aff0:aff1:aff2*/
  affinity = affinity & 0x00ffffff;

  /* Find out how many interrupts are supported. */
  num_irq = MmioRead32(GIC_DIST_CTR) & 0x1f;
  num_irq = (num_irq + 1) * 32;

  /* Do the qgic dist initialization */
  QGicDistConfig(num_irq);

  /* Write the affinity value, for routing all the SPIs */
  for (i = 32; i < num_irq; i++) {
    MmioWrite32(GICD_IROUTER + i * 8, affinity);
  }

  /* Enable affinity routing of grp0/grp1 interrupts */
  MmioWrite32(GIC_DIST_CTRL, ENABLE_GRP0_SEC | ENABLE_GRP1_NS | ENABLE_ARE);
}

/* Wake up redistributors */
VOID QGicCpuEarlyConfig(VOID)
{
  for (UINTN i = 0; i < FixedPcdGet32(PcdCoreCount); i++) {
    UINT32 retry = 1000000;

    /* For cpu init need to wake up the redistributor */
    MmioWrite32(
        GIC_REDIST_CPU(i) + GICR_WAKER,
        (MmioRead32(GIC_REDIST_CPU(i) + GICR_WAKER) & ~GIC_WAKER_PROCESSORSLEEP));

    /* Wait until redistributor is up */
    while (MmioRead32(GIC_REDIST_CPU(i) + GICR_WAKER) & GIC_WAKER_CHILDRENASLEEP) {
      retry--;
      if (!retry) {
        DEBUG((EFI_D_ERROR, "Failed to wake redistributor for CPU%d\n", i));
        ASSERT(FALSE);
      }

      // MicroSecondDelay(1);
    }

    // Deactivate Interrupts for this CPU
    MmioWrite32(GIC_REDIST_CPU(i) + GICR_SGI + GICR_ICENABLER0, 0);

    // Clear Pending Interrupts for this CPU
    MmioWrite32(GIC_REDIST_CPU(i) + GICR_SGI + GICR_ICPENDR0, 0x10000000);
  }
}

/* Intialize cpu specific controller */
VOID QGicCpuInit(VOID)
{
  UINT32 retry = 1000000;
  UINT32 sre   = 0;
  UINT32 pmr   = 0xff;

  /* For cpu init need to wake up the redistributor */
  MmioWrite32(
      GICR_WAKER_CURRENT_CPU,
      (MmioRead32(GICR_WAKER_CURRENT_CPU) & ~GIC_WAKER_PROCESSORSLEEP));

  /* Wait until redistributor is up */
  while (MmioRead32(GICR_WAKER_CURRENT_CPU) & GIC_WAKER_CHILDRENASLEEP) {
    retry--;
    if (!retry) {
      DEBUG((EFI_D_ERROR, "Failed to wake redistributor for CPU0\n"));
      ASSERT(FALSE);
    }

    // MicroSecondDelay(1);
  }

  /* Make sure the system register access is enabled for us */
  sre = ArmGicV3GetControlSystemRegisterEnable();
  sre |= 1;
  ArmGicV3SetControlSystemRegisterEnable(sre);

  /* If system register access is not set, we fail */
  sre = ArmGicV3GetControlSystemRegisterEnable();
  if (!(sre & 1)) {
    DEBUG((EFI_D_ERROR, "Failed to set SRE for NS world\n"));
    ASSERT(FALSE);
  }

  /* Set the priortiy mask register, interrupts with priority
   * higher than this value will be signalled to processor.
   * Lower value means higher priority.
   */
  ArmGicV3SetPriorityMask(pmr);

  /* Make sure EOI is handled in NS EL3 */
  ArmGicV3Disable();

  /* Enable grp1 interrupts for NS EL3*/
  ArmGicV3EnableInterruptInterface();
}

EFI_STATUS
EFIAPI
QGicPeim(VOID)
{
  QGicHardwareReset();
  QGicSetBinpoint();
  QGicDistInit();
  QGicCpuEarlyConfig();
  QGicCpuInit();

  return EFI_SUCCESS;
}