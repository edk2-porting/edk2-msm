/*
 * SwitchSlotsApp Module
 * Copyright (C) 2021 Renard Gold <goldrenard@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/
 */

#include <Library/BootSlotLib.h>
#include <Library/UefiApplicationEntryPoint.h>

EFI_STATUS
EFIAPI
SwitchSlotsAppEntryPoint(
    IN EFI_HANDLE ImageHandle, IN EFI_SYSTEM_TABLE *SystemTable)
{

  MemCardType Type = CheckRootDeviceType();
  if (Type == UNKNOWN) {
    PrintAndWaitAnyKey(
        SystemTable, L"Unknown device storage. Press any key to exit.\n");
    return EFI_UNSUPPORTED;
  }

  EFI_STATUS Status = EnumeratePartitions();

  if (EFI_ERROR(Status)) {
    Print(L"Could not enumerate partitions. Code %d\n", Status);
    WaitAnyKey(SystemTable);
    return Status;
  }

  UpdatePartitionEntries();

  /*Check for multislot boot support*/
  BOOLEAN MultiSlotSupported = PartitionHasMultiSlot((CONST CHAR16 *)L"boot");
  if (!MultiSlotSupported) {
    PrintAndWaitAnyKey(
        SystemTable,
        L"A/B slots aren't supported on this device. Press any key to exit.\n");
    return EFI_UNSUPPORTED;
  }

  Slot CurrentSlot = GetCurrentSlotSuffix();
  if (IsSuffixEmpty(&CurrentSlot)) {
    PrintAndWaitAnyKey(
        SystemTable, L"Current active slot not found, try to boot Android "
                     L"first. Press any key to exit.\n");
    return EFI_NOT_READY;
  }

  Slot *NewSlot = NULL;
  Slot  Slots[] = {{L"_a"}, {L"_b"}};
  if (StrnCmp(CurrentSlot.Suffix, Slots[0].Suffix, StrLen(Slots[0].Suffix)) ==
      0) {
    NewSlot = &Slots[1];
  }
  else {
    NewSlot = &Slots[0];
  }

  // Print (L"Current active slot suffix is: %s, next slot suffix is: %s\n",
  // &CurrentSlot.Suffix, &NewSlot->Suffix);

  Status = SetActiveSlot(NewSlot, TRUE, FALSE);

  if (EFI_ERROR(Status)) {
    Print(L"Could not update active slot. Code %d\n", Status);
    WaitAnyKey(SystemTable);
    return Status;
  }
  UpdatePartitionAttributes(PARTITION_GUID);
  UpdatePartitionAttributes(PARTITION_ATTRIBUTES);

  // Print (L"Current active slot has been updated successfully! Press any key
  // to reboot.\n"); WaitAnyKey(SystemTable);
  gRT->ResetSystem(EfiResetWarm, EFI_SUCCESS, 0, NULL);
  CpuDeadLoop();
  return EFI_SUCCESS;
}