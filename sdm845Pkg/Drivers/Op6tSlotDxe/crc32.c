/*
 * Op6tSlot Module
 * Copyright (C) 2021 longjunyu <ljy122@qq.com>
 * Copyright (C) 2021 Junyue Wang <wjyue2001@qq.com>
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

#include "crc32.h"
#include <Library/UefiLib.h>

EFI_STATUS FixGptCRC32(
    EFI_BLOCK_IO_PROTOCOL *mBlockIoProtocol,
    EFI_DISK_IO_PROTOCOL *mDiskIoProtocol, EFI_SYSTEM_TABLE *mSystemTable)
{
  EFI_STATUS status;
  UINT32     mMediaId;
  UINT32     mBlockSize;
  mMediaId   = mBlockIoProtocol->Media->MediaId;
  mBlockSize = mBlockIoProtocol->Media->BlockSize;
  unsigned char  crc32_header[GPT_CRC32_LEN];
  unsigned char  crc32_entry[GPT_CRC32_LEN];
  unsigned char *bufGptHeader;
  unsigned char *bufGptEntry;
  // try to allocate pool for bufGptEntry
  status = mSystemTable->BootServices->AllocatePool(
      EfiBootServicesCode, GPT_ENTRY_COUNT * mBlockSize, (VOID **)&bufGptEntry);
  if (EFI_ERROR(status)) {
    return status;
  }
  // read gpt entry list
  status = mDiskIoProtocol->ReadDisk(
      mDiskIoProtocol, mMediaId, 2 * mBlockSize, GPT_ENTRY_COUNT * mBlockSize,
      bufGptEntry);

  if (EFI_ERROR(status))
    return status;
  // get gpt entry crc32 value
  get_result_array(
      calculate_crc32(bufGptEntry, GPT_ENTRY_COUNT * mBlockSize), crc32_entry);

  // write gpt entry crc32 value to disk
  status = mDiskIoProtocol->WriteDisk(
      mDiskIoProtocol, mMediaId, mBlockSize + GPT_ENTRY_CRC32_LBA1_OFFSET,
      GPT_CRC32_LEN, crc32_entry);
  if (EFI_ERROR(status))
    return status;
  // try to release bufGptEntry
  status = mSystemTable->BootServices->FreePool(bufGptEntry);
  if (EFI_ERROR(status)) {
    return status;
  }
  // try to allocate pool for bufGptHeader
  status = mSystemTable->BootServices->AllocatePool(
      EfiBootServicesCode, GPT_HEADER_SIZE, (VOID **)&bufGptHeader);
  // get gpt header
  status = mDiskIoProtocol->ReadDisk(
      mDiskIoProtocol, mMediaId, mBlockSize, GPT_HEADER_SIZE, bufGptHeader);
  if (EFI_ERROR(status))
    return status;
  // set previous crc32 value to 0x00
  for (int i = GPT_HEADER_CRC32_LBA1_OFFSET;
       i < GPT_HEADER_CRC32_LBA1_OFFSET + GPT_CRC32_LEN; i++) {
    bufGptHeader[i] = 0x00;
  }
  // get gpt header crc32 value
  get_result_array(
      calculate_crc32(bufGptHeader, GPT_HEADER_SIZE), crc32_header);
  // write gpt header crc32 value to disk
  status = mDiskIoProtocol->WriteDisk(
      mDiskIoProtocol, mMediaId, mBlockSize + GPT_HEADER_CRC32_LBA1_OFFSET,
      GPT_CRC32_LEN, crc32_header);
  if (EFI_ERROR(status))
    return status;
  // try to release bufGptHeader
  status = mSystemTable->BootServices->FreePool(bufGptHeader);
  if (EFI_ERROR(status)) {
    return status;
  }
  return EFI_SUCCESS;
}

/*
 * A8h reflected is 15h, i.e. 10101000 <--> 00010101
 */
int reflect(int data, int len)
{
  int ref = 0;

  for (int i = 0; i < len; i++) {
    if (data & 0x1) {
      ref |= (1 << ((len - 1) - i));
    }
    data = (data >> 1);
  }

  return ref;
}

/*
 * Function to calculate the CRC32
 */
unsigned int calculate_crc32(unsigned char *buffer, int len)
{
  int          byte_length = 8; /*length of unit (i.e. byte) */
  int          msb         = 0;
  int          polynomial  = 0x04C11DB7; /* IEEE 32bit polynomial */
  unsigned int regs        = 0xFFFFFFFF; /* init to all ones */
  int          regs_mask   = 0xFFFFFFFF; /* ensure only 32 bit answer */
  int          regs_msb    = 0;
  unsigned int reflected_regs;

  for (int i = 0; i < len; i++) {
    int data_byte = buffer[i];
    data_byte     = reflect(data_byte, 8);
    for (int j = 0; j < byte_length; j++) {
      msb = data_byte >> (byte_length - 1); /* get MSB */
      msb &= 1;                             /* ensure just 1 bit */
      regs_msb = (regs >> 31) & 1;          /* MSB of regs */
      regs     = regs << 1;                 /* shift regs for CRC-CCITT */
      if (regs_msb ^ msb) {                 /* MSB is a 1 */
        regs = regs ^ polynomial;           /* XOR with generator poly */
      }
      regs = regs & regs_mask; /* Mask off excess upper bits */
      data_byte <<= 1;         /* get to next bit */
    }
  }
  regs           = regs & regs_mask;
  reflected_regs = reflect(regs, 32) ^ 0xFFFFFFFF;

  return reflected_regs;
}

// Convert Function
// unsigned char** convert(unsigned int reflected_regs, int *size)
void get_result_array(unsigned int reflected_regs, unsigned char *res)
{

  for (int i = 0; i < 4; i++) {
    res[i] = reflected_regs & 0xff;
    reflected_regs >>= 8;
  }
}
