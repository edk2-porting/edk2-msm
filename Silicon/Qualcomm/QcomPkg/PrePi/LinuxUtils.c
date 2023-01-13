#define DEBUG_PEI 0

#include "Pi.h"
#include "LinuxUtils.h"
#include <Library/PlatformPrePiLib.h>
#include <comp_libfdt.h>

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

  DEBUG((EFI_D_INFO, "\nRenegade Project edk2-msm (AArch64)\n"));
  DEBUG(
      (EFI_D_ERROR,
       "Kernel Load Address = 0x%llx, Device Tree Load Address = 0x%llx\n\nLoading Android...\n",
       LinuxKernelAddr, DeviceTreeLoadAddress));

  // Jump to linux
  LinuxKernel ((UINT64)DeviceTreeLoadAddress, 0, 0, 0);
  // We should never reach here
  CpuDeadLoop();
}

STATIC BOOLEAN RanOnceFlag = FALSE, UefiBootRequested = TRUE;
STATIC CONST CHAR8 *ForceNormalBoot = "androidboot.force_normal_boot=1";
STATIC CONST CHAR8 *SkipRamFs = "skip_initramfs";

VOID ContinueToLinuxIfAcquired(IN VOID *DeviceTreeLoadAddress, IN VOID *KernelLoadAddress)
{
  if (RanOnceFlag) {
    return;
  }

  RanOnceFlag = TRUE;

#if DEBUG_PEI
  SerialPortInitialize();
#endif

  // This feature is not enabled by default
#if ENABLE_LINUX_UTILS
  BOOLEAN CheckHallOnly = FixedPcdGetBool(PcdLinuxUtilsCheckHallOnly);

  // Don't check cmdline if PcdLinuxUtilsCheckHallOnly is TRUE
  if(CheckHallOnly) UefiBootRequested = !IsLinuxBootRequested();
  else {
    // Use Hall sensor or other GPIO based detection to 
    // disable UEFI booting as a fail-safe routine to boot recovery
    if(!IsLinuxBootRequested()) {
      void *Fdt = DeviceTreeLoadAddress;
      char Cmdline[4096], *Ptr = NULL;
      if(!Fdt) return;
      int Length = 0, CmdlineNode = fdt_path_offset(Fdt, "/chosen");
      if(CmdlineNode < 0) DEBUG((EFI_D_INFO, "Warning: Failed to get cmdline.\n"));
      else
        Ptr = (char*)fdt_getprop(Fdt, CmdlineNode, "bootargs", &Length);

      if(Ptr) {
        ZeroMem(Cmdline, sizeof(Cmdline));
        AsciiStrnCatS(Cmdline, sizeof(Cmdline), Ptr, Length);
        if(AsciiStrStr(Cmdline, ForceNormalBoot) || AsciiStrStr(Cmdline, SkipRamFs))
          UefiBootRequested = FALSE;
      }
    } else UefiBootRequested = FALSE;
  }

  if (!UefiBootRequested && IsLinuxAvailable(DeviceTreeLoadAddress, KernelLoadAddress)) {
      BootLinux(DeviceTreeLoadAddress, KernelLoadAddress);
  }
#endif
  return;
}