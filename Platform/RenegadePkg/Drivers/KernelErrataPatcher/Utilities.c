/** @file

  Patches NTOSKRNL to not cause a bugcheck when attempting to use
  PSCI_MEMPROTECT Due to an issue in QHEE

  Based on https://github.com/SamuelTulach/rainbow

  Copyright (c) 2021 Samuel Tulach
  Copyright (c) 2022 DuoWoA authors

  SPDX-License-Identifier: MIT

**/
#include "KernelErrataPatcher.h"

VOID CopyMemory(VOID *destination, VOID *source, UINTN size)
{
  UINT8 *dst = (UINT8 *)(destination);
  UINT8 *src = (UINT8 *)(source);
  for (UINTN i = 0; i < size; i++) {
    dst[i] = src[i];
  }
}

VOID CopyToReadOnly(VOID *destination, VOID *source, UINTN size)
{
  BOOLEAN intstate = ArmGetInterruptState();
  if (intstate)
    ArmDisableInterrupts();

  ArmClearMemoryRegionReadOnly((EFI_PHYSICAL_ADDRESS)destination, size);
  CopyMemory(destination, source, size);
  ArmSetMemoryRegionReadOnly((EFI_PHYSICAL_ADDRESS)destination, size);

  if (intstate)
    ArmEnableInterrupts();
}

UINT64 FindPattern(VOID *baseAddress, UINT64 size, const CHAR8 *pattern)
{
  UINT8       *firstMatch     = NULL;
  const CHAR8 *currentPattern = pattern;

  UINT8 *start = (UINT8 *)(baseAddress);
  UINT8 *end   = start + size;

  for (UINT8 *current = start; current < end; current++) {
    UINT8 byte = currentPattern[0];
    if (!byte)
      return (UINT64)(firstMatch);
    if (byte == '\?' ||
        *(UINT8 *)(current) == GET_BYTE(byte, currentPattern[1])) {
      if (!firstMatch)
        firstMatch = current;
      if (!currentPattern[2])
        return (UINT64)(firstMatch);
      ((byte == '\?') ? (currentPattern += 2) : (currentPattern += 3));
    }
    else {
      currentPattern = pattern;
      firstMatch     = NULL;
    }
  }

  return 0;
}

KLDR_DATA_TABLE_ENTRY *GetModule(LIST_ENTRY *list, const CHAR16 *name)
{
  for (LIST_ENTRY *entry = list->ForwardLink; entry != list;
       entry             = entry->ForwardLink) {

    PKLDR_DATA_TABLE_ENTRY module =
        CONTAINING_RECORD(entry, KLDR_DATA_TABLE_ENTRY, InLoadOrderLinks);

    if (module &&
        StrnCmp(name, module->BaseDllName.Buffer, module->BaseDllName.Length) ==
            0)
      return module;
  }

  return NULL;
}