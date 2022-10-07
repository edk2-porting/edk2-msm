/*
 * Copyright (c) 2015-2020, The Linux Foundation. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of The Linux Foundation nor
 *       the names of its contributors may be used to endorse or promote
 *       products derived from this software without specific prior written
 *       permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

#ifndef __BSL_PARTITION_TABLE_H__
#define __BSL_PARTITION_TABLE_H__

#include <Library/BootSlotLib/BlockIoUtils.h>

enum ReturnVal {
  SUCCESS = 0,
  FAILURE,
};

typedef enum {
  PARTITION_ATTRIBUTES = 1,
  PARTITION_GUID,
  PARTITION_ALL,
} UPDATE_TYPE;

typedef enum {
  PTN_ENTRIES_TO_MISC = 1,
  PTN_ENTRIES_FROM_MISC,
} NANDAB_UPDATE_TYPE;

#define NANDAB_MAX_SLOTNAME_LEN 7

#define PARTITION_ATTRIBUTES_MASK 0x1
#define PARTITION_GUID_MASK 0x2

#define MAX_HANDLEINF_LST_SIZE 128

#define PARTITION_TYPE_MBR 0
#define PARTITION_TYPE_GPT 1
#define PARTITION_TYPE_GPT_BACKUP 2
#define GPT_PROTECTIVE 0xEE
#define MBR_PARTITION_RECORD 446
#define OS_TYPE 4
#define MBR_SIGNATURE 510
#define MBR_SIGNATURE_BYTE_0 0x55
#define MBR_SIGNATURE_BYTE_1 0xAA
#define MIBIB_MAGIC1 0xFE569FAC
#define MIBIB_MAGIC2 0xCD7F127A

/* GPT Signature should be 0x5452415020494645 */
#define GPT_SIGNATURE_1 0x54524150
#define GPT_SIGNATURE_2 0x20494645
#define GPT_HEADER_SIZE 92
#define GPT_LBA 1
#define GPT_PART_ENTRY_SIZE 128
#define MAX_GPT_NAME_SIZE 72

/* GPT Offsets */
#define HEADER_SIZE_OFFSET 12
#define HEADER_CRC_OFFSET 16
#define PRIMARY_HEADER_OFFSET 24
#define BACKUP_HEADER_OFFSET 32
#define FIRST_USABLE_LBA_OFFSET 40
#define LAST_USABLE_LBA_OFFSET 48
#define PARTITION_ENTRIES_OFFSET 72
#define PARTITION_COUNT_OFFSET 80
#define PENTRY_SIZE_OFFSET 84
#define PARTITION_CRC_OFFSET 88
#define PARTITION_ENTRY_LAST_LBA 40
#define PARTITION_TYPE_GUID_SIZE 4
#define UNIQUE_PARTITION_GUID_SIZE 16

#define PARTITION_ENTRY_SIZE 128
#define PART_ATT_READONLY_OFFSET 60
/*
The attributes like Priority, Active bit,
Max retry count, Success bit and Unabootable bits will be
stored in attributes filed of the each partition in partition
table in the respective position mentioned below.
*/
/* Partition Attribute fields*/
#define PART_ATT_PRIORITY_BIT 48
#define PART_ATT_ACTIVE_BIT 50
#define PART_ATT_MAX_RETRY_CNT_BIT 51
#define PART_ATT_SUCCESS_BIT 54
#define PART_ATT_UNBOOTABLE_BIT 55

#define PART_ATT_PRIORITY_VAL ((UINT64)0x3 << PART_ATT_PRIORITY_BIT)
#define PART_ATT_ACTIVE_VAL ((UINT64)0x1 << PART_ATT_ACTIVE_BIT)
#define PART_ATT_MAX_RETRY_COUNT_VAL ((UINT64)0x7 << PART_ATT_MAX_RETRY_CNT_BIT)
#define PART_ATT_SUCCESSFUL_VAL ((UINT64)0x1 << PART_ATT_SUCCESS_BIT)
#define PART_ATT_UNBOOTABLE_VAL ((UINT64)0x1 << PART_ATT_UNBOOTABLE_BIT)
#define MAX_PRIORITY 3
#define MAX_RETRY_COUNT 7
#define MAX_NUM_PARTITIONS 128
#define MIN_PARTITION_ARRAY_SIZE 0x4000
#define ATTRIBUTE_FLAG_OFFSET 48
#define INVALID_PTN -1
#define GPT_HDR_BLOCKS 0x1
#define MAX_PARTITION_ENTRIES_SZ (MAX_NUM_PARTITIONS * PARTITION_ENTRY_SIZE)
#define GUID_SIZE 16
#define PRIMARY_HDR_LBA 0x1
#define BOOT_PART_SIZE 32

/*Slot specific macros*/
#define MAX_SLOT_SUFFIX_SZ 3
#define MIN_SLOTS 1
#define MAX_SLOTS 2
#define MAX_LUNS 8
#define NO_LUN -1

#define GET_LWORD_FROM_BYTE(x)                                                 \
  ((UINT32) * (x) | ((UINT32) * (x + 1) << 8) | ((UINT32) * (x + 2) << 16) |   \
   ((UINT32) * (x + 3) << 24))

#define GET_LLWORD_FROM_BYTE(x)                                                \
  ((UINT64) * (x) | ((UINT64) * (x + 1) << 8) | ((UINT64) * (x + 2) << 16) |   \
   ((UINT64) * (x + 3) << 24) | ((UINT64) * (x + 4) << 32) |                   \
   ((UINT64) * (x + 5) << 40) | ((UINT64) * (x + 6) << 48) |                   \
   ((UINT64) * (x + 7) << 56))

#define GET_LONG(x)                                                            \
  ((UINT32) * (x) | ((UINT32) * (x + 1) << 8) | ((UINT32) * (x + 2) << 16) |   \
   ((UINT32) * (x + 3) << 24))

#define PUT_LONG(x, y)                                                         \
  *(x)     = y & 0xff;                                                         \
  *(x + 1) = (y >> 8) & 0xff;                                                  \
  *(x + 2) = (y >> 16) & 0xff;                                                 \
  *(x + 3) = (y >> 24) & 0xff;

#define PUT_LONG_LONG(x, y)                                                    \
  (*(x) = (y)&0xff);                                                           \
  (*((x) + 1) = (((y) >> 8) & 0xff));                                          \
  (*((x) + 2) = (((y) >> 16) & 0xff));                                         \
  (*((x) + 3) = (((y) >> 24) & 0xff));                                         \
  (*((x) + 4) = (((y) >> 32) & 0xff));                                         \
  (*((x) + 5) = (((y) >> 40) & 0xff));                                         \
  (*((x) + 6) = (((y) >> 48) & 0xff));                                         \
  (*((x) + 7) = (((y) >> 56) & 0xff));

#define GUARD(code)                                                            \
  do {                                                                         \
    Status = (code);                                                           \
    if (Status != EFI_SUCCESS) {                                               \
      DEBUG(                                                                   \
          (EFI_D_ERROR, "Err: line:%d %a() status: %r\n", __LINE__,            \
           __FUNCTION__, Status));                                             \
      return Status;                                                           \
    }                                                                          \
  } while (0)

struct StoragePartInfo {
  HandleInfo HandleInfoList[MAX_NUM_PARTITIONS];
  UINT32     MaxHandles;
};
extern struct StoragePartInfo Ptable[MAX_LUNS];

typedef struct {
  CHAR16 Suffix[MAX_SLOT_SUFFIX_SZ];
} Slot;

Slot   GetCurrentSlotSuffix();
UINT32 GetMaxLuns();
VOID   GetPartitionCount(UINT32 *Val);
VOID   SetMultiSlotBootVal(BOOLEAN Val);

struct PartitionEntry {
  EFI_PARTITION_ENTRY PartEntry;
  UINT32              lun;
};
extern struct PartitionEntry PtnEntries[MAX_NUM_PARTITIONS];

struct BootPartsLinkedList {
  CHAR16                      PartName[BOOT_PART_SIZE];
  struct BootPartsLinkedList *Next;
};

INT32      GetPartitionIndex(CHAR16 *PartitionName);
BOOLEAN    PartitionHasMultiSlot(CONST CHAR16 *Pname);
EFI_STATUS EnumeratePartitions(VOID);
VOID       UpdatePartitionEntries(VOID);
VOID       UpdatePartitionAttributes(UINT32 UpdateType);
BOOLEAN    IsSuffixEmpty(Slot *CheckSlot);
EFI_STATUS
SetActiveSlot(Slot *NewSlot, BOOLEAN ResetSuccessBit, BOOLEAN SetSuccessBit);
BOOLEAN    IsSlotBootable(Slot *CheckSlot);
EFI_STATUS ClearUnbootable(Slot *CheckSlot);
UINT64     GetPartitionSize(EFI_BLOCK_IO_PROTOCOL *BlockIo);

#endif
