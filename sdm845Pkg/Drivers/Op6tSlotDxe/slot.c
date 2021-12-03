/*
 * Op6tSlot Module
 * Copyright (C) 2021 longjunyu <ljy122@qq.com>
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

#include "slot.h"
#include "crc32.h"
#include <Library/UefiLib.h>
#include <Protocol/BlockIo.h>
#include <Protocol/DiskIo.h>
#include <Uefi.h>

void WaitAnyKey(EFI_SYSTEM_TABLE *mSystemTable);

EFI_STATUS EFIAPI
SlotMain(IN EFI_HANDLE ImageHandle, IN EFI_SYSTEM_TABLE *SystemTable)
{
  EFI_STATUS             status;
  EFI_HANDLE *           controllerHandles = NULL;
  UINTN                  handleIndex, numHandles;
  EFI_DISK_IO_PROTOCOL * mDiskIoProtocol  = NULL;
  EFI_BLOCK_IO_PROTOCOL *mBlockIoProtocol = NULL;
  UINT32                 mMediaId;
  UINT32                 mBlockSize;
  int                    index;
  unsigned char          currentSlotA[OP6T_SLOT_FLAG_SIZE];
  unsigned char          currentSlotB[OP6T_SLOT_FLAG_SIZE];
  // list all Handles that installed DiskIoProtocol
  status = SystemTable->BootServices->LocateHandleBuffer(
      ByProtocol, &gEfiDiskIoProtocolGuid, NULL, &numHandles,
      &controllerHandles);
  if (EFI_ERROR(status)) {
    // WaitAnyKey(SystemTable);
    return status;
  }
  // ergodic the handles
  for (handleIndex = 0; handleIndex < numHandles; handleIndex++) {
    // open DiskIoProtocol on target handle
    status = SystemTable->BootServices->HandleProtocol(
        controllerHandles[handleIndex], &gEfiDiskIoProtocolGuid,
        (VOID **)&mDiskIoProtocol);
    unsigned char slotNameBuffer[OP6T_SLOT_BOOT_BUFFER_LEN];
    if (EFI_ERROR(status))
      continue;
    // open BlockIoProtocol on target handle
    status = SystemTable->BootServices->HandleProtocol(
        controllerHandles[handleIndex], &gEfiBlockIoProtocolGuid,
        (VOID **)&mBlockIoProtocol);
    if (EFI_ERROR(status)) {
      continue;
    }
    else {
      // filter disk device by LogicalPartition
      if (mBlockIoProtocol->Media->LogicalPartition)
        continue;
      SystemTable->ConOut->OutputString(
          SystemTable->ConOut, L"The media is disk.\n");
      mMediaId   = mBlockIoProtocol->Media->MediaId;
      mBlockSize = mBlockIoProtocol->Media->BlockSize;
      // read buffers from disk
      status = mDiskIoProtocol->ReadDisk(
          mDiskIoProtocol, mMediaId,
          2 * mBlockSize + OP6T_SLOT_A_BOOT_BUFFER_LBA2_OFFSET,
          OP6T_SLOT_BOOT_BUFFER_LEN, slotNameBuffer);
      if (EFI_ERROR(status))
        continue;
      // filter disk device by the name of boot partition
      int i = 0;
      for (index = 0; index < OP6T_SLOT_BOOT_BUFFER_LEN; index++) {
        if (slotNameBuffer[index] != OP6T_SLOT_A_BOOT_BUFFER[index]) {
          i = 1;
          break;
        }
      }
      if (i == 1)
        continue;
      SystemTable->ConOut->OutputString(
          SystemTable->ConOut, L"The name of target partition is matched.\n");
      // read flag of slot A
      status = mDiskIoProtocol->ReadDisk(
          mDiskIoProtocol, mMediaId,
          2 * mBlockSize + OP6T_SLOT_A_BOOT_FLAG_LBA2_OFFSET,
          OP6T_SLOT_FLAG_SIZE, currentSlotA);
      if (EFI_ERROR(status))
        return status;
      // read flag of slot B
      status = mDiskIoProtocol->ReadDisk(
          mDiskIoProtocol, mMediaId,
          3 * mBlockSize + OP6T_SLOT_B_BOOT_FLAG_LBA3_OFFSET,
          OP6T_SLOT_FLAG_SIZE, currentSlotB);
      if (EFI_ERROR(status))
        return status;

      // analyze A/B flags
      int flag_offset = 0;
      if (currentSlotA[0] == OP6T_SLOT_FLAG_ACTIVE)
        return EFI_SUCCESS;
      else if (currentSlotA[0] == OP6T_SLOT_FLAG_UNBOOTABLE)
        if (currentSlotB[0] == OP6T_SLOT_FLAG_ACTIVE)
          return EFI_SUCCESS;
        else if (currentSlotB[0] == OP6T_SLOT_FLAG_UNBOOTABLE)
          flag_offset = 2 * mBlockSize + OP6T_SLOT_A_BOOT_FLAG_LBA2_OFFSET;
        else
          flag_offset = 3 * mBlockSize + OP6T_SLOT_B_BOOT_FLAG_LBA3_OFFSET;
      else
        flag_offset = 2 * mBlockSize + OP6T_SLOT_A_BOOT_FLAG_LBA2_OFFSET;

      // write flag into disk
      unsigned char f[1] = {OP6T_SLOT_FLAG_ACTIVE};
      status             = mDiskIoProtocol->WriteDisk(
          mDiskIoProtocol, mMediaId, flag_offset, OP6T_SLOT_FLAG_SIZE, f);
      if (EFI_ERROR(status)) {
        SystemTable->ConOut->OutputString(
            SystemTable->ConOut, L"Failed to write flag into disk.\n");
        continue;
      }
      else {
        SystemTable->ConOut->OutputString(
            SystemTable->ConOut, L"Succeed to write flag into disk.\n");
        break;
      }
    }
  }
  // try to fix gpt crc32
  if (mBlockIoProtocol != NULL) {
    status = (FixGptCRC32(mBlockIoProtocol, mDiskIoProtocol, SystemTable));
    if (EFI_ERROR(status))
      SystemTable->ConOut->OutputString(
          SystemTable->ConOut, L"Failed to fix CRC32 value.\n");
    else
      SystemTable->ConOut->OutputString(
          SystemTable->ConOut, L"Succeed to fix CRC32 value.\n");
  }

  // release memory
  if (controllerHandles != NULL)
    SystemTable->BootServices->FreePool(controllerHandles);
  // WaitAnyKey(SystemTable);
  return EFI_SUCCESS;
}

void WaitAnyKey(EFI_SYSTEM_TABLE *mSystemTable)
{
  UINTN         index = 0;
  EFI_INPUT_KEY Key;
  mSystemTable->BootServices->WaitForEvent(
      1, &mSystemTable->ConIn->WaitForKey, &index);
  mSystemTable->ConIn->ReadKeyStroke(mSystemTable->ConIn, &Key);
}
