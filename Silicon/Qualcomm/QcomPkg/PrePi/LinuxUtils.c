/**
 * @file LinuxUtils.c
 * 
 * Copyright (c) DuoWoA authors. All rights reserved.
 * Copyright (c) Renegade Project. All rights reserved.
 *
 * SPDX-License-Identifier: BSD-2-Clause-Patent
**/

#define DEBUG_PEI 0

#include "Pi.h"
#include "LinuxUtils.h"
#include <Library/PlatformPrePiLib.h>

#if DEBUG_PEI
#include <Library/SerialPortLib.h>
#endif

BOOLEAN IsLinuxAvailable(IN VOID *DeviceTreeLoadAddress, IN VOID *KernelLoadAddress)
{
  VOID *LinuxKernelAddr = KernelLoadAddress + 0x200000 + FixedPcdGet32(PcdFdSize);
  UINT32 *LinuxKernelMagic = (UINT32*)(LinuxKernelAddr + LINUX_KERNEL_ARCH_MAGIC_OFFSET);
  return *LinuxKernelMagic == LINUX_KERNEL_AARCH64_MAGIC;
}

VOID BootLinux(IN VOID *DeviceTreeLoadAddress, IN VOID *KernelLoadAddress)
{
  VOID *LinuxKernelAddr = KernelLoadAddress + 0x200000 + FixedPcdGet32(PcdFdSize);
  LINUX_KERNEL LinuxKernel = (LINUX_KERNEL) LinuxKernelAddr;

  DEBUG(
      (EFI_D_ERROR,
       "Kernel Load Address = 0x%llx, Device Tree Load Address = 0x%llx\n\n",
       LinuxKernelAddr, DeviceTreeLoadAddress));

  // Jump to linux
  LinuxKernel ((UINT64)DeviceTreeLoadAddress, 0, 0, 0);
  // We should never reach here
  CpuDeadLoop();
}

STATIC BOOLEAN RanOnceFlag = FALSE;

VOID ContinueToLinuxIfAcquired(IN VOID *DeviceTreeLoadAddress, IN VOID *KernelLoadAddress)
{
  if (RanOnceFlag) {
    return;
  }

#if DEBUG_PEI
  SerialPortInitialize();
#endif

  RanOnceFlag = TRUE;
  if (IsLinuxAvailable(DeviceTreeLoadAddress, KernelLoadAddress)) {
    if (IsLinuxBootRequested()) {
      BootLinux(DeviceTreeLoadAddress, KernelLoadAddress);
    }
  }
}