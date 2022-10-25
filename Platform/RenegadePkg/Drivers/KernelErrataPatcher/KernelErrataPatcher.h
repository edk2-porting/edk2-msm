/** @file

  Patches NTOSKRNL to not cause a SError when reading/writing ACTLR_EL1
  Patches NTOSKRNL to not cause a bugcheck when attempting to use
  PSCI_MEMPROTECT Due to an issue in QHEE

  Based on https://github.com/SamuelTulach/rainbow

  Copyright (c) 2021 Samuel Tulach
  Copyright (c) 2022 DuoWoA authors

  SPDX-License-Identifier: MIT

**/
#ifndef _KERNEL_ERRATA_PATCHER_H_
#define _KERNEL_ERRATA_PATCHER_H_

#include <PiDxe.h>

#include <Library/UefiLib.h>
#include <Uefi.h>

#include <Library/BaseLib.h>
#include <Library/BaseMemoryLib.h>
#include <Library/DebugLib.h>
#include <Library/MemoryAllocationLib.h>
#include <Library/PcdLib.h>
#include <Library/UefiBootServicesTableLib.h>

#include "ntdef.h"

#define NT_OS_KERNEL_IMAGE_NAME L"ntoskrnl.exe"
#define ARM64_INSTRUCTION_LENGTH 4
#define ARM64_TOTAL_INSTRUCTION_LENGTH(x) (ARM64_INSTRUCTION_LENGTH * x)

#define SCAN_MAX 0x5f5e100
#define SEC_TO_MICRO(x) ((UINTN)(x)*1000 * 1000)

#define IN_RANGE(x, a, b) (x >= a && x <= b)
#define GET_BITS(x)                                                            \
  (IN_RANGE((x & (~0x20)), 'A', 'F') ? ((x & (~0x20)) - 'A' + 0xA)             \
                                     : (IN_RANGE(x, '0', '9') ? x - '0' : 0))
#define GET_BYTE(a, b) (GET_BITS(a) << 4 | GET_BITS(b))

typedef VOID (*BL_ARCH_SWITCH_CONTEXT)(UINT32 target);

EFI_STATUS
EFIAPI
KernelErrataPatcherExitBootServices(
    IN EFI_HANDLE ImageHandle, IN UINTN MapKey,
    IN PLOADER_PARAMETER_BLOCK loaderBlockX19,
    IN PLOADER_PARAMETER_BLOCK loaderBlockX20,
    IN EFI_PHYSICAL_ADDRESS    returnAddress);

EFI_STATUS
EFIAPI
ExitBootServicesWrapper(IN EFI_HANDLE ImageHandle, IN UINTN MapKey);

VOID CopyMemory(
    EFI_PHYSICAL_ADDRESS destination, EFI_PHYSICAL_ADDRESS source, UINTN size);
UINT64 FindPattern(
    EFI_PHYSICAL_ADDRESS baseAddress, UINT64 size, const CHAR8 *pattern);
KLDR_DATA_TABLE_ENTRY *GetModule(LIST_ENTRY *list, const CHAR16 *name);

#endif /* _KERNEL_ERRATA_PATCHER_H_ */