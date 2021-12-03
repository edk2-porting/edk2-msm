/*
 * BootSlot DXE Driver
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
#include <Library/UefiLib.h>
#include <Uefi.h>

EFI_STATUS
EFIAPI
BootSlotMain(IN EFI_HANDLE ImageHandle, IN EFI_SYSTEM_TABLE *SystemTable)
{
  MemCardType Type = CheckRootDeviceType();
  if (Type == UNKNOWN) {
    DEBUG((EFI_D_ERROR, "Device storage is not supported \n"));
    return EFI_SUCCESS;
  }

  EFI_STATUS Status = EnumeratePartitions();

  if (EFI_ERROR(Status)) {
    DEBUG((EFI_D_ERROR, "Could not enumerate partitions. Code %d\n", Status));
    return Status;
  }

  UpdatePartitionEntries();

  /*Check for multislot boot support*/
  BOOLEAN MultiSlotSupported = PartitionHasMultiSlot((CONST CHAR16 *)L"boot");
  if (!MultiSlotSupported) {
    DEBUG((
        EFI_D_ERROR,
        "A/B slots aren't supported on this device. Press any key to exit.\n"));
    return EFI_SUCCESS;
  }

  Slot Slots[] = {{L"_a"}, {L"_b"}};

  Slot CurrentSlot = GetCurrentSlotSuffix();
  if (IsSuffixEmpty(&CurrentSlot)) {
    CurrentSlot = Slots[0]; // Set A as active if there is no slot available
                            // (shouldn't happen though)
  }

  // Clear all unbootable bits if exists
  for (UINTN SlotIndex = 0; SlotIndex < ARRAY_SIZE(Slots); SlotIndex++) {
    Slot *SlotEntry = &Slots[SlotIndex];
    if (!IsSlotBootable(SlotEntry)) {
      ClearUnbootable(SlotEntry);
    }
  }

  // Set current slot as active again just refresh its attributes + mark it
  // successful
  Status = SetActiveSlot(&CurrentSlot, FALSE, TRUE);

  if (EFI_ERROR(Status)) {
    DEBUG((EFI_D_ERROR, "Could not update active slot. Code %d\n", Status));
    return Status;
  }

  return EFI_SUCCESS;
}