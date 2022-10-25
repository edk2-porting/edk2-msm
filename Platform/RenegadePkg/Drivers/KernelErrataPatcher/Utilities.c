/** @file

  Patches NTOSKRNL to not cause a SError when reading/writing ACTLR_EL1
  Patches NTOSKRNL to not cause a bugcheck when attempting to use
  PSCI_MEMPROTECT Due to an issue in QHEE

  Based on https://github.com/SamuelTulach/rainbow

  Copyright (c) 2021 Samuel Tulach
  Copyright (c) 2022 DuoWoA authors

  SPDX-License-Identifier: MIT

**/
#include "KernelErrataPatcher.h"

VOID CopyMemory(
    EFI_PHYSICAL_ADDRESS destination, EFI_PHYSICAL_ADDRESS source, UINTN size)
{
  UINT8 *dst = (UINT8 *)(destination);
  UINT8 *src = (UINT8 *)(source);
  for (UINTN i = 0; i < size; i++) {
    dst[i] = src[i];
  }
}

EFI_PHYSICAL_ADDRESS
FindPattern(EFI_PHYSICAL_ADDRESS baseAddress, UINTN size, const CHAR8 *pattern)
{
  EFI_PHYSICAL_ADDRESS firstMatch     = 0;
  const CHAR8         *currentPattern = pattern;

  for (EFI_PHYSICAL_ADDRESS current = baseAddress; current < baseAddress + size;
       current++) {
    UINT8 byte = currentPattern[0];
    if (!byte)
      return firstMatch;
    if (byte == '\?' ||
        *(UINT8 *)(current) == GET_BYTE(byte, currentPattern[1])) {
      if (!firstMatch)
        firstMatch = current;
      if (!currentPattern[2])
        return firstMatch;
      ((byte == '\?') ? (currentPattern += 2) : (currentPattern += 3));
    }
    else {
      currentPattern = pattern;
      firstMatch     = 0;
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