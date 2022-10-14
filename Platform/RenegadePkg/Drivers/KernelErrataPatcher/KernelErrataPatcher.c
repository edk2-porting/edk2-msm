/** @file

  Patches NTOSKRNL to not cause a bugcheck when attempting to use
  PSCI_MEMPROTECT Due to an issue in QHEE

  Based on https://github.com/SamuelTulach/rainbow

  Copyright (c) 2021 Samuel Tulach
  Copyright (c) 2022 DuoWoA authors

  SPDX-License-Identifier: MIT

**/
#include "KernelErrataPatcher.h"

#define SILENT 1

STATIC BL_ARCH_SWITCH_CONTEXT BlpArchSwitchContext = NULL;
STATIC EFI_EXIT_BOOT_SERVICES EfiExitBootServices  = NULL;

#if SILENT == 0
#define FirmwarePrint(x, ...) Print(x, __VA_ARGS__);
#define ContextPrint(x, ...)                                                   \
  BlpArchSwitchContext(FirmwareContext);                                       \
  FirmwarePrint(x, __VA_ARGS__);                                               \
  BlpArchSwitchContext(ApplicationContext);
#else
#define FirmwarePrint(x, ...)
#define ContextPrint(x, ...)
#endif

VOID KernelErrataPatcherApplyPatches(
    COPY_TO CopyTo, VOID *Base, UINTN Size, BOOLEAN IsInFirmwareContext)
{
  // Fix up #0 (PsciMemProtect -> C0 03 5F D6) (PsciMemProtect -> RET)
  UINT8  RetInstruction[] = {0xC0, 0x03, 0x5F, 0xD6};
  UINT64 PsciMemProtect =
      FindPattern(
          Base, Size, "D5 02 00 18 03 00 80 D2 02 00 80 D2 01 00 80 D2") -
      ARM64_TOTAL_INSTRUCTION_LENGTH(8);

  if (PsciMemProtect != 0) {
    if (IsInFirmwareContext) {
      FirmwarePrint(
          L"PsciMemProtect            -> (phys) 0x%p\n", PsciMemProtect);
    }
    else {
      ContextPrint(
          L"PsciMemProtect            -> (virt) 0x%p\n", PsciMemProtect);
    }

    CopyTo((UINT64 *)PsciMemProtect, RetInstruction, sizeof(RetInstruction));
  }
}

EFI_STATUS
EFIAPI
KernelErrataPatcherExitBootServices(
    IN EFI_HANDLE ImageHandle, IN UINTN MapKey,
    IN PLOADER_PARAMETER_BLOCK loaderBlockX19,
    IN PLOADER_PARAMETER_BLOCK loaderBlockX20, IN UINTN returnAddress)
{
  // Might be called multiple times by winload in a loop failing few times
  gBS->ExitBootServices = EfiExitBootServices;

  PLOADER_PARAMETER_BLOCK loaderBlock = loaderBlockX19;

  if (loaderBlock == NULL || ((UINTN)loaderBlock & 0xFFFFFFF000000000) == 0) {
    loaderBlock = loaderBlockX20;
  }

  if (loaderBlock == NULL || ((UINTN)loaderBlock & 0xFFFFFFF000000000) == 0) {
    FirmwarePrint(
        L"Failed to find OslLoaderBlock! loaderBlock -> 0x%p\n", loaderBlock);
    goto exit;
  }

  // BlpArchSwitchContext
  BlpArchSwitchContext =
      (BL_ARCH_SWITCH_CONTEXT)(FindPattern((VOID *)returnAddress, SCAN_MAX, "1F 04 00 71 33 11 88 9A 28 00 40 B9 1F 01 00 6B") - ARM64_TOTAL_INSTRUCTION_LENGTH(9));

  if (BlpArchSwitchContext == NULL ||
      ((UINTN)BlpArchSwitchContext & 0xFFFFFFF000000000) != 0) {
    FirmwarePrint(
        L"Failed to find BlpArchSwitchContext! BlpArchSwitchContext -> 0x%p\n",
        BlpArchSwitchContext);
    goto exit;
  }

  FirmwarePrint(L"OslFwpKernelSetupPhase1   -> (phys) 0x%p\n", returnAddress);
  FirmwarePrint(L"OslLoaderBlock            -> (virt) 0x%p\n", loaderBlock);
  FirmwarePrint(
      L"BlpArchSwitchContext      -> (phys) 0x%p\n", BlpArchSwitchContext);

  /*
   * Switch context to (as defined by winload) application context
   * Within this context only the virtual addresses are valid
   * Real/physical addressing is not used
   * We can not use any EFI services unless we switch back!
   * To print on screen use ContextPrint define
   */
  BlpArchSwitchContext(ApplicationContext);

  UINT32 OsMajorVersion = loaderBlock->OsMajorVersion;
  UINT32 OsMinorVersion = loaderBlock->OsMinorVersion;
  UINT32 Size           = loaderBlock->Size;

  ContextPrint(
      L"LOADER_PARAMETER_BLOCK    -> OsMajorVersion: %d OsMinorVersion: %d "
      L"Size: %d\n",
      OsMajorVersion, OsMinorVersion, Size);

  if (OsMajorVersion != 10 || OsMinorVersion != 0 || Size == 0) {
    ContextPrint(
        L"Incompatible!           -> OsMajorVersion: %d OsMinorVersion: %d "
        L"Size: %d\n",
        OsMajorVersion, OsMinorVersion, Size);

    goto exitToFirmware;
  }

  KLDR_DATA_TABLE_ENTRY kernelModule =
      *GetModule(&loaderBlock->LoadOrderListHead, NT_OS_KERNEL_IMAGE_NAME);

  if (kernelModule.DllBase == NULL) {
    ContextPrint(
        L"Failed to find ntoskrnl.exe in OslLoaderBlock(0x%p)!\n",
        kernelModule.DllBase);

    goto exitToFirmware;
  }

  UINTN kernelBase = (UINTN)kernelModule.DllBase;
  UINTN kernelSize = kernelModule.SizeOfImage;

  ContextPrint(L"OsKernel                  -> (virt) 0x%p\n", kernelBase);

  if (kernelBase != 0 && kernelSize != 0) {
    ContextPrint(
        L"Patching OsKernel         -> (virt) 0x%p (size) 0x%p\n", kernelBase,
        kernelSize);

    // Fix up ntoskrnl.exe
    KernelErrataPatcherApplyPatches(
        CopyToReadOnly, (VOID *)kernelBase, kernelSize, FALSE);
  }

exitToFirmware:
  // Switch back to firmware context before calling real ExitBootServices
  BlpArchSwitchContext(FirmwareContext);

exit:
  FirmwarePrint(L"OslFwpKernelSetupPhase1   <- (phys) 0x%p\n", returnAddress);

  // Call the original
  return gBS->ExitBootServices(ImageHandle, MapKey);
}

EFI_STATUS
EFIAPI
KernelErrataPatcherEntryPoint(
    IN EFI_HANDLE ImageHandle, IN EFI_SYSTEM_TABLE *SystemTable)
{
  EfiExitBootServices   = gBS->ExitBootServices;
  gBS->ExitBootServices = ExitBootServicesWrapper;

  return EFI_SUCCESS;
}