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

#include "AutoGen.h"
#include <Library/BootSlotLib.h>
#include <Library/DebugLib.h>
#include <Library/UefiLib.h>
#include <Uefi.h>
#include <Uefi/UefiSpec.h>

struct StoragePartInfo       Ptable[MAX_LUNS];
struct PartitionEntry        PtnEntries[MAX_NUM_PARTITIONS];
STATIC UINT32                MaxLuns;
STATIC UINT32                PartitionCount;
STATIC struct PartitionEntry PtnEntriesBak[MAX_NUM_PARTITIONS];

STATIC struct BootPartsLinkedList *HeadNode;
STATIC EFI_STATUS                  GetActiveSlot(Slot *ActiveSlot);

Slot GetCurrentSlotSuffix(VOID)
{
  Slot    CurrentSlot = {{0}};
  BOOLEAN IsMultiSlot = PartitionHasMultiSlot((CONST CHAR16 *)L"boot");

  if (IsMultiSlot == FALSE) {
    return CurrentSlot;
  }

  GetActiveSlot(&CurrentSlot);
  return CurrentSlot;
}

VOID GetPartitionCount(UINT32 *Val)
{
  *Val = PartitionCount;
  return;
}

VOID UpdatePartitionEntries(VOID)
{
  UINT32               i;
  UINT32               j;
  UINT32               Index = 0;
  EFI_STATUS           Status;
  EFI_PARTITION_ENTRY *PartEntry;

  PartitionCount = 0;
  /*Nullify the PtnEntries array before using it*/
  gBS->SetMem(
      (VOID *)PtnEntries, (sizeof(PtnEntries[0]) * MAX_NUM_PARTITIONS), 0);

  for (i = 0; i < MaxLuns; i++) {
    for (j = 0; (j < Ptable[i].MaxHandles) && (Index < MAX_NUM_PARTITIONS);
         j++, Index++) {
      Status =
          GetPartitionEntry(Ptable[i].HandleInfoList[j].Handle, &PartEntry);
      PartitionCount++;
      if (EFI_ERROR(Status)) {
        DEBUG(
            (EFI_D_VERBOSE,
             "Selected Lun : %d, handle: %d does not have "
             "partition record, ignore\n",
             i, j));
        PtnEntries[Index].lun = i;
        continue;
      }
      gBS->CopyMem((&PtnEntries[Index]), PartEntry, sizeof(PartEntry[0]));
      PtnEntries[Index].lun = i;
    }
  }
  /* Back up the ptn entries */
  gBS->CopyMem(PtnEntriesBak, PtnEntries, sizeof(PtnEntries));
}

INT32
GetPartitionIndex(CHAR16 *Pname)
{
  INT32 i;

  for (i = 0; i < PartitionCount; i++) {
    if (!StrnCmp(
            PtnEntries[i].PartEntry.PartitionName, Pname,
            ARRAY_SIZE(PtnEntries[i].PartEntry.PartitionName))) {
      return i;
    }
  }

  return INVALID_PTN;
}

STATIC EFI_STATUS
GetStorageHandle(INT32 Lun, HandleInfo *BlockIoHandle, UINT32 *MaxHandles)
{
  EFI_STATUS        Status  = EFI_INVALID_PARAMETER;
  UINT32            Attribs = 0;
  PartiSelectFilter HandleFilter;
  // UFS LUN GUIDs
  EFI_GUID LunGuids[] = {
      gEfiUfsLU0Guid, gEfiUfsLU1Guid, gEfiUfsLU2Guid, gEfiUfsLU3Guid,
      gEfiUfsLU4Guid, gEfiUfsLU5Guid, gEfiUfsLU6Guid, gEfiUfsLU7Guid,
  };

  Attribs |= BLK_IO_SEL_SELECT_ROOT_DEVICE_ONLY;
  HandleFilter.PartitionType = NULL;
  HandleFilter.VolumeName    = NULL;

  if (Lun == NO_LUN) {
    HandleFilter.RootDeviceType = &gEfiEmmcUserPartitionGuid;
    Status = GetBlkIOHandles(Attribs, &HandleFilter, BlockIoHandle, MaxHandles);
    if (EFI_ERROR(Status)) {
      DEBUG((EFI_D_ERROR, "Error getting block IO handle for Emmc\n"));
      return Status;
    }
  }
  else {
    HandleFilter.RootDeviceType = &LunGuids[Lun];
    Status = GetBlkIOHandles(Attribs, &HandleFilter, BlockIoHandle, MaxHandles);
    if (EFI_ERROR(Status)) {
      DEBUG((EFI_D_ERROR, "Error getting block IO handle for Lun:%x\n", Lun));
      return Status;
    }
  }

  return Status;
}

STATIC BOOLEAN IsUpdatePartitionAttributes()
{
  if (CompareMem(PtnEntries, PtnEntriesBak, sizeof(PtnEntries))) {
    return TRUE;
  }
  return FALSE;
}

UINT64 GetPartitionSize(EFI_BLOCK_IO_PROTOCOL *BlockIo)
{
  UINT64 PartitionSize;

  if (!BlockIo) {
    DEBUG((EFI_D_ERROR, "Invalid parameter, pleae check BlockIo info!!!\n"));
    return 0;
  }

  if (CHECK_ADD64(BlockIo->Media->LastBlock, 1)) {
    DEBUG((EFI_D_ERROR, "Integer overflow while adding LastBlock and 1\n"));
    return 0;
  }

  if ((MAX_UINT64 / (BlockIo->Media->LastBlock + 1)) <
      (UINT64)BlockIo->Media->BlockSize) {
    DEBUG(
        (EFI_D_ERROR,
         "Integer overflow while multiplying LastBlock and BlockSize\n"));
    return 0;
  }

  PartitionSize = (BlockIo->Media->LastBlock + 1) * BlockIo->Media->BlockSize;
  return PartitionSize;
}

VOID UpdatePartitionAttributes(UINT32 UpdateType)
{
  UINT32                 BlkSz;
  UINT8 *                GptHdr    = NULL;
  UINT8 *                GptHdrPtr = NULL;
  UINTN                  MaxGptPartEntrySzBytes;
  UINT32                 Offset;
  UINT32                 MaxPtnCount = 0;
  UINT32                 PtnEntrySz  = 0;
  UINT32                 i           = 0;
  UINT8 *                PtnEntriesPtr;
  UINT8 *                Ptn_Entries;
  UINT32                 CrcVal = 0;
  UINT32                 Iter;
  UINT32                 HdrSz = GPT_HEADER_SIZE;
  UINT64                 DeviceDensity;
  UINT64                 CardSizeSec;
  EFI_STATUS             Status;
  INT32                  Lun;
  EFI_BLOCK_IO_PROTOCOL *BlockIo = NULL;
  HandleInfo             BlockIoHandle[MAX_HANDLEINF_LST_SIZE];
  UINT32                 MaxHandles = MAX_HANDLEINF_LST_SIZE;
  CHAR8                  BootDeviceType[BOOT_DEV_NAME_SIZE_MAX];
  UINT32                 PartEntriesblocks = 0;
  BOOLEAN                SkipUpdation;
  UINT64                 Attr;
  struct PartitionEntry *InMemPtnEnt;

  /* The PtnEntries is the same as PtnEntriesBak by default
   *  It needs to update attributes or GUID when PtnEntries is changed
   */
  if (!IsUpdatePartitionAttributes()) {
    return;
  }

  GetRootDeviceType(BootDeviceType, BOOT_DEV_NAME_SIZE_MAX);
  for (Lun = 0; Lun < MaxLuns; Lun++) {

    if (!AsciiStrnCmp(BootDeviceType, "EMMC", AsciiStrLen("EMMC"))) {
      Status = GetStorageHandle(NO_LUN, BlockIoHandle, &MaxHandles);
    }
    else if (!AsciiStrnCmp(BootDeviceType, "UFS", AsciiStrLen("UFS"))) {
      Status = GetStorageHandle(Lun, BlockIoHandle, &MaxHandles);
    }
    else {
      DEBUG((EFI_D_ERROR, "Unsupported  boot device type\n"));
      return;
    }

    if (Status != EFI_SUCCESS) {
      DEBUG(
          (EFI_D_ERROR, "Failed to get BlkIo for device. MaxHandles:%d - %r\n",
           MaxHandles, Status));
      return;
    }
    if (MaxHandles != 1) {
      DEBUG(
          (EFI_D_VERBOSE,
           "Failed to get the BlockIo for device. MaxHandle:%d, %r\n",
           MaxHandles, Status));
      continue;
    }

    BlockIo       = BlockIoHandle[0].BlkIo;
    DeviceDensity = GetPartitionSize(BlockIo);
    if (!DeviceDensity) {
      return;
    }
    BlkSz                  = BlockIo->Media->BlockSize;
    PartEntriesblocks      = MAX_PARTITION_ENTRIES_SZ / BlkSz;
    MaxGptPartEntrySzBytes = (GPT_HDR_BLOCKS + PartEntriesblocks) * BlkSz;
    CardSizeSec            = (DeviceDensity) / BlkSz;
    Offset                 = PRIMARY_HDR_LBA;
    GptHdr                 = AllocateZeroPool(MaxGptPartEntrySzBytes);
    if (!GptHdr) {
      DEBUG((EFI_D_ERROR, "Unable to Allocate Memory for GptHdr \n"));
      return;
    }

    GptHdrPtr = GptHdr;

    /* This loop iterates twice to update both primary and backup Gpt*/
    for (Iter = 0; Iter < 2;
         Iter++, (Offset = CardSizeSec - MaxGptPartEntrySzBytes / BlkSz)) {
      SkipUpdation = TRUE;
      Status       = BlockIo->ReadBlocks(
          BlockIo, BlockIo->Media->MediaId, Offset, MaxGptPartEntrySzBytes,
          GptHdr);

      if (EFI_ERROR(Status)) {
        DEBUG((EFI_D_ERROR, "Unable to read the media \n"));
        goto Exit;
      }

      if (Iter == 0x1) {
        /* This is the back up GPT */
        Ptn_Entries = GptHdr;
        GptHdr      = GptHdr + ((PartEntriesblocks)*BlkSz);
      }
      else
        /* otherwise we are at the primary gpt */
        Ptn_Entries = GptHdr + BlkSz;

      PtnEntriesPtr = Ptn_Entries;

      for (i = 0; i < PartitionCount; i++) {
        InMemPtnEnt = (struct PartitionEntry *)PtnEntriesPtr;
        /*If GUID is not present, then it is BlkIo Handle of the Lun. Skip*/
        if (!(PtnEntries[i].PartEntry.PartitionTypeGUID.Data1)) {
          DEBUG((EFI_D_VERBOSE, " Skipping Lun:%d, i=%d\n", Lun, i));
          continue;
        }

        if (!AsciiStrnCmp(BootDeviceType, "UFS", AsciiStrLen("UFS"))) {
          /* Partition table is populated with entries from lun 0 to max lun.
           * break out of the loop once we see the partition lun is > current
           * lun */
          if (PtnEntries[i].lun > Lun)
            break;
          /* Find the entry where the partition table for 'lun' starts and then
           * update the attributes */
          if (PtnEntries[i].lun != Lun)
            continue;
        }
        Attr = GET_LLWORD_FROM_BYTE(&PtnEntriesPtr[ATTRIBUTE_FLAG_OFFSET]);
        if (UpdateType & PARTITION_GUID_MASK) {
          if (CompareMem(
                  &InMemPtnEnt->PartEntry.PartitionTypeGUID,
                  &PtnEntries[i].PartEntry.PartitionTypeGUID,
                  sizeof(EFI_GUID))) {
            /* Update the partition GUID values */
            gBS->CopyMem(
                (VOID *)PtnEntriesPtr,
                (VOID *)&PtnEntries[i].PartEntry.PartitionTypeGUID, GUID_SIZE);
            /* Update the PtnEntriesBak for next comparison */
            gBS->CopyMem(
                (VOID *)&PtnEntriesBak[i].PartEntry.PartitionTypeGUID,
                (VOID *)&PtnEntries[i].PartEntry.PartitionTypeGUID, GUID_SIZE);
            SkipUpdation = FALSE;
          }
        }

        if (UpdateType & PARTITION_ATTRIBUTES_MASK) {
          /*  If GUID is not present, then it is back up GPT, update it
           *  If GUID is present,  and the GUID is matched, update it
           */
          if (!(InMemPtnEnt->PartEntry.PartitionTypeGUID.Data1) ||
              !CompareMem(
                  &InMemPtnEnt->PartEntry.PartitionTypeGUID,
                  &PtnEntries[i].PartEntry.PartitionTypeGUID,
                  sizeof(EFI_GUID))) {
            if (Attr != PtnEntries[i].PartEntry.Attributes) {
              /* Update the partition attributes */
              PUT_LONG_LONG(
                  &PtnEntriesPtr[ATTRIBUTE_FLAG_OFFSET],
                  PtnEntries[i].PartEntry.Attributes);
              /* Update the PtnEntriesBak for next comparison */
              PtnEntriesBak[i].PartEntry.Attributes =
                  PtnEntries[i].PartEntry.Attributes;
              SkipUpdation = FALSE;
            }
          }
          else {
            if (InMemPtnEnt->PartEntry.PartitionTypeGUID.Data1) {
              DEBUG((EFI_D_ERROR, "Error in GPT header, GUID is not match!\n"));
              continue;
            }
          }
        }

        /* point to the next partition entry */
        PtnEntriesPtr += PARTITION_ENTRY_SIZE;
      }

      if (SkipUpdation)
        continue;

      MaxPtnCount = GET_LWORD_FROM_BYTE(&GptHdr[PARTITION_COUNT_OFFSET]);
      PtnEntrySz  = GET_LWORD_FROM_BYTE(&GptHdr[PENTRY_SIZE_OFFSET]);

      if (((UINT64)(MaxPtnCount)*PtnEntrySz) > MAX_PARTITION_ENTRIES_SZ) {
        DEBUG(
            (EFI_D_ERROR,
             "Invalid GPT header fields MaxPtnCount = %x, PtnEntrySz = %x\n",
             MaxPtnCount, PtnEntrySz));
        goto Exit;
      }

      Status = gBS->CalculateCrc32(
          Ptn_Entries, ((MaxPtnCount) * (PtnEntrySz)), &CrcVal);
      if (Status != EFI_SUCCESS) {
        DEBUG(
            (EFI_D_ERROR, "Error Calculating CRC32 on the Gpt header: %x\n",
             Status));
        goto Exit;
      }

      PUT_LONG(&GptHdr[PARTITION_CRC_OFFSET], CrcVal);

      /*Write CRC to 0 before we calculate the crc of the GPT header*/
      CrcVal = 0;
      PUT_LONG(&GptHdr[HEADER_CRC_OFFSET], CrcVal);

      Status = gBS->CalculateCrc32(GptHdr, HdrSz, &CrcVal);
      if (Status != EFI_SUCCESS) {
        DEBUG(
            (EFI_D_ERROR, "Error Calculating CRC32 on the Gpt header: %x\n",
             Status));
        goto Exit;
      }

      PUT_LONG(&GptHdr[HEADER_CRC_OFFSET], CrcVal);

      if (Iter == 0x1)
        /* Write the backup GPT header, which is at an offset of CardSizeSec -
         * MaxGptPartEntrySzBytes/BlkSz in blocks*/
        Status = BlockIo->WriteBlocks(
            BlockIo, BlockIo->Media->MediaId, Offset, MaxGptPartEntrySzBytes,
            (VOID *)Ptn_Entries);
      else
        /* Write the primary GPT header, which is at an offset of BlkSz */
        Status = BlockIo->WriteBlocks(
            BlockIo, BlockIo->Media->MediaId, Offset, MaxGptPartEntrySzBytes,
            (VOID *)GptHdr);

      if (EFI_ERROR(Status)) {
        DEBUG((EFI_D_ERROR, "Error writing primary GPT header: %r\n", Status));
        goto Exit;
      }
    }
    FreePool(GptHdrPtr);
    GptHdrPtr = NULL;
  }

Exit:
  if (GptHdrPtr) {
    FreePool(GptHdrPtr);
    GptHdrPtr = NULL;
  }
}

STATIC VOID MarkPtnActive(CHAR16 *ActiveSlot)
{
  UINT32 i;
  for (i = 0; i < PartitionCount; i++) {
    /* Mark all the slots with current ActiveSlot as active */
    if (StrStr(PtnEntries[i].PartEntry.PartitionName, ActiveSlot))
      PtnEntries[i].PartEntry.Attributes |= PART_ATT_ACTIVE_VAL;
    else
      PtnEntries[i].PartEntry.Attributes &= ~PART_ATT_ACTIVE_VAL;
  }

  /* Update the partition table */
  UpdatePartitionAttributes(PARTITION_ATTRIBUTES);
}

STATIC VOID SwapPtnGuid(EFI_PARTITION_ENTRY *p1, EFI_PARTITION_ENTRY *p2)
{
  EFI_GUID Temp;

  if (p1 == NULL || p2 == NULL)
    return;
  gBS->CopyMem((VOID *)&Temp, (VOID *)&p1->PartitionTypeGUID, sizeof(EFI_GUID));
  gBS->CopyMem(
      (VOID *)&p1->PartitionTypeGUID, (VOID *)&p2->PartitionTypeGUID,
      sizeof(EFI_GUID));
  gBS->CopyMem((VOID *)&p2->PartitionTypeGUID, (VOID *)&Temp, sizeof(EFI_GUID));
}

STATIC EFI_STATUS GetMultiSlotPartsList(VOID)
{
  UINT32                      i            = 0;
  UINT32                      j            = 0;
  UINT32                      Len          = 0;
  UINT32                      PtnLen       = 0;
  CHAR16 *                    SearchString = NULL;
  struct BootPartsLinkedList *TempNode     = NULL;

  for (i = 0; i < PartitionCount; i++) {
    SearchString = PtnEntries[i].PartEntry.PartitionName;
    if (!SearchString[0])
      continue;

    for (j = i + 1; j < PartitionCount; j++) {
      if (!PtnEntries[j].PartEntry.PartitionName[0])
        continue;
      Len    = StrLen(SearchString);
      PtnLen = StrLen(PtnEntries[j].PartEntry.PartitionName);

      /*Need to compare till "boot_"a hence skip last Char from StrLen value*/
      if ((PtnLen == Len) &&
          !StrnCmp(
              PtnEntries[j].PartEntry.PartitionName, SearchString, Len - 1) &&
          (StrStr(SearchString, (CONST CHAR16 *)L"_a") ||
           StrStr(SearchString, (CONST CHAR16 *)L"_b"))) {
        TempNode = AllocateZeroPool(sizeof(struct BootPartsLinkedList));
        if (TempNode) {
          /*Skip _a/_b from partition name*/
          StrnCpyS(
              TempNode->PartName, sizeof(TempNode->PartName), SearchString,
              Len - 2);
          TempNode->Next = HeadNode;
          HeadNode       = TempNode;
        }
        else {
          DEBUG(
              (EFI_D_ERROR,
               "Unable to Allocate Memory for MultiSlot Partition list\n"));
          return EFI_OUT_OF_RESOURCES;
        }
        break;
      }
    }
  }
  return EFI_SUCCESS;
}

STATIC VOID SwitchPtnSlots(CONST CHAR16 *SetActive)
{
  UINT32                      i;
  struct PartitionEntry *     PtnCurrent = NULL;
  struct PartitionEntry *     PtnNew     = NULL;
  CHAR16                      CurSlot[BOOT_PART_SIZE];
  CHAR16                      NewSlot[BOOT_PART_SIZE];
  CHAR16                      SetInactive[MAX_SLOT_SUFFIX_SZ];
  UINT32                      UfsBootLun = 0;
  BOOLEAN                     UfsGet     = TRUE;
  BOOLEAN                     UfsSet     = FALSE;
  struct BootPartsLinkedList *TempNode   = NULL;
  EFI_STATUS                  Status;
  CHAR8                       BootDeviceType[BOOT_DEV_NAME_SIZE_MAX];

  /* Create the partition name string for active and non active slots*/
  if (!StrnCmp(SetActive, (CONST CHAR16 *)L"_a", StrLen((CONST CHAR16 *)L"_a")))
    StrnCpyS(
        SetInactive, MAX_SLOT_SUFFIX_SZ, (CONST CHAR16 *)L"_b",
        StrLen((CONST CHAR16 *)L"_b"));
  else
    StrnCpyS(
        SetInactive, MAX_SLOT_SUFFIX_SZ, (CONST CHAR16 *)L"_a",
        StrLen((CONST CHAR16 *)L"_a"));

  if (!HeadNode) {
    Status = GetMultiSlotPartsList();
    if (Status != EFI_SUCCESS) {
      DEBUG((EFI_D_INFO, "Unable to get GetMultiSlotPartsList\n"));
      return;
    }
  }

  for (TempNode = HeadNode; TempNode; TempNode = TempNode->Next) {
    gBS->SetMem(CurSlot, BOOT_PART_SIZE, 0);
    gBS->SetMem(NewSlot, BOOT_PART_SIZE, 0);

    StrnCpyS(
        CurSlot, BOOT_PART_SIZE, TempNode->PartName,
        StrLen(TempNode->PartName));
    StrnCatS(CurSlot, BOOT_PART_SIZE, SetInactive, StrLen(SetInactive));

    StrnCpyS(
        NewSlot, BOOT_PART_SIZE, TempNode->PartName,
        StrLen(TempNode->PartName));
    StrnCatS(NewSlot, BOOT_PART_SIZE, SetActive, StrLen(SetActive));

    /* Find the pointer to partition table entry for active and non-active
     * slots*/
    for (i = 0; i < PartitionCount; i++) {
      if (!StrnCmp(
              PtnEntries[i].PartEntry.PartitionName, CurSlot,
              StrLen(CurSlot))) {
        PtnCurrent = &PtnEntries[i];
      }
      else if (!StrnCmp(
                   PtnEntries[i].PartEntry.PartitionName, NewSlot,
                   StrLen(NewSlot))) {
        PtnNew = &PtnEntries[i];
      }
    }
    /* Swap the guids for the slots */
    SwapPtnGuid(&PtnCurrent->PartEntry, &PtnNew->PartEntry);
    PtnCurrent = PtnNew = NULL;
  }

  GetRootDeviceType(BootDeviceType, BOOT_DEV_NAME_SIZE_MAX);
  if (!AsciiStrnCmp(BootDeviceType, "UFS", AsciiStrLen("UFS"))) {
    UfsGetSetBootLun(&UfsBootLun, UfsGet);
    // Special case for XBL is to change the bootlun instead of swapping the
    // guid
    if (UfsBootLun == 0x1 &&
        !StrnCmp(
            SetActive, (CONST CHAR16 *)L"_b", StrLen((CONST CHAR16 *)L"_b"))) {
      DEBUG((EFI_D_INFO, "Switching the boot lun from 1 to 2\n"));
      UfsBootLun = 0x2;
    }
    else if (
        UfsBootLun == 0x2 &&
        !StrnCmp(
            SetActive, (CONST CHAR16 *)L"_a", StrLen((CONST CHAR16 *)L"_a"))) {
      DEBUG((EFI_D_INFO, "Switching the boot lun from 2 to 1\n"));
      UfsBootLun = 0x1;
    }
    UfsGetSetBootLun(&UfsBootLun, UfsSet);
  }

  UpdatePartitionAttributes(PARTITION_GUID);
}

EFI_STATUS
EnumeratePartitions(VOID)
{
  EFI_STATUS        Status;
  PartiSelectFilter HandleFilter;
  UINT32            Attribs = 0;
  UINT32            i;
  // UFS LUN GUIDs
  EFI_GUID LunGuids[] = {
      gEfiUfsLU0Guid, gEfiUfsLU1Guid, gEfiUfsLU2Guid, gEfiUfsLU3Guid,
      gEfiUfsLU4Guid, gEfiUfsLU5Guid, gEfiUfsLU6Guid, gEfiUfsLU7Guid,
  };

  gBS->SetMem((VOID *)Ptable, (sizeof(struct StoragePartInfo) * MAX_LUNS), 0);

  /* By default look for emmc partitions if not found look for UFS */
  Attribs |= BLK_IO_SEL_MATCH_ROOT_DEVICE;

  Ptable[0].MaxHandles        = ARRAY_SIZE(Ptable[0].HandleInfoList);
  HandleFilter.PartitionType  = NULL;
  HandleFilter.VolumeName     = NULL;
  HandleFilter.RootDeviceType = &gEfiEmmcUserPartitionGuid;

  Status = GetBlkIOHandles(
      Attribs, &HandleFilter, &Ptable[0].HandleInfoList[0],
      &Ptable[0].MaxHandles);
  if (Status == EFI_SUCCESS && Ptable[0].MaxHandles > 0) {
    MaxLuns = 1;
  }
  /* If the media is not emmc then look for UFS */
  else if (EFI_ERROR(Status) || Ptable[0].MaxHandles == 0) {
    /* By default max 8 luns are supported but HW could be configured to use
     * only few of them or all of them
     * Based on the information read update the MaxLuns to reflect the max
     * supported luns */
    for (i = 0; i < MAX_LUNS; i++) {
      Ptable[i].MaxHandles        = ARRAY_SIZE(Ptable[i].HandleInfoList);
      HandleFilter.PartitionType  = NULL;
      HandleFilter.VolumeName     = NULL;
      HandleFilter.RootDeviceType = &LunGuids[i];

      Status = GetBlkIOHandles(
          Attribs, &HandleFilter, &Ptable[i].HandleInfoList[0],
          &Ptable[i].MaxHandles);
      /* If we fail to get block for a lun that means the lun is not configured
       * and unsed, ignore the error
       * and continue with the next Lun */
      if (EFI_ERROR(Status)) {
        DEBUG(
            (EFI_D_ERROR,
             "Error getting block IO handle for %d lun, Lun may be unused\n",
             i));
        continue;
      }
    }
    MaxLuns = i;
  }
  else {
    DEBUG((EFI_D_ERROR, "Error populating block IO handles\n"));
    return EFI_NOT_FOUND;
  }

  return Status;
}

/*Function to provide has-slot info
 *Pname: the partition name
 *return: 1 or 0.
 */
BOOLEAN
PartitionHasMultiSlot(CONST CHAR16 *Pname)
{
  UINT32 i;
  UINT32 SlotCount = 0;
  UINT32 Len       = StrLen(Pname);

  for (i = 0; i < PartitionCount; i++) {
    if (!(StrnCmp(PtnEntries[i].PartEntry.PartitionName, Pname, Len))) {
      if (PtnEntries[i].PartEntry.PartitionName[Len] == L'_' &&
          (PtnEntries[i].PartEntry.PartitionName[Len + 1] == L'a' ||
           PtnEntries[i].PartEntry.PartitionName[Len + 1] == L'b'))
        if (++SlotCount > MIN_SLOTS) {
          return TRUE;
        }
    }
  }
  return FALSE;
}

STATIC struct PartitionEntry *GetBootPartitionEntry(Slot *BootSlot)
{
  INT32 Index = INVALID_PTN;

  if (StrnCmp(
          (CONST CHAR16 *)L"_a", BootSlot->Suffix, StrLen(BootSlot->Suffix)) ==
      0) {
    Index = GetPartitionIndex((CHAR16 *)L"boot_a");
  }
  else if (
      StrnCmp(
          (CONST CHAR16 *)L"_b", BootSlot->Suffix, StrLen(BootSlot->Suffix)) ==
      0) {
    Index = GetPartitionIndex((CHAR16 *)L"boot_b");
  }
  else {
    DEBUG(
        (EFI_D_ERROR,
         "GetBootPartitionEntry: No boot partition "
         "entry for slot %s\n",
         BootSlot->Suffix));
    return NULL;
  }

  if (Index == INVALID_PTN) {
    DEBUG(
        (EFI_D_ERROR,
         "GetBootPartitionEntry: No boot partition entry "
         "for slot %s, invalid index\n",
         BootSlot->Suffix));
    return NULL;
  }
  return &PtnEntries[Index];
}

BOOLEAN IsSlotBootable(Slot *BootSlot)
{
  struct PartitionEntry *BootPartition = NULL;
  BootPartition                        = GetBootPartitionEntry(BootSlot);
  if (BootPartition == NULL) {
    DEBUG(
        (EFI_D_ERROR,
         "IsCurrentSlotBootable: No boot partition "
         "entry for slot %s\n",
         BootSlot->Suffix));
    return FALSE;
  }
  DEBUG(
      (EFI_D_VERBOSE, "Slot suffix %s Part Attr 0x%lx\n", BootSlot->Suffix,
       BootPartition->PartEntry.Attributes));

  if (!(BootPartition->PartEntry.Attributes & PART_ATT_UNBOOTABLE_VAL) &&
      BootPartition->PartEntry.Attributes & PART_ATT_SUCCESSFUL_VAL) {
    DEBUG((EFI_D_VERBOSE, "Slot %s is bootable\n", BootSlot->Suffix));
    return TRUE;
  }

  DEBUG((EFI_D_VERBOSE, "Slot %s is unbootable \n", BootSlot->Suffix));
  return FALSE;
}

EFI_STATUS ClearUnbootable(Slot *BootSlot)
{
  struct PartitionEntry *BootEntry = NULL;
  BootEntry                        = GetBootPartitionEntry(BootSlot);
  if (BootEntry == NULL) {
    DEBUG(
        (EFI_D_ERROR, "ClearUnbootable: No boot partition entry for slot %s\n",
         BootSlot->Suffix));
    return EFI_NOT_FOUND;
  }
  BootEntry->PartEntry.Attributes &= ~PART_ATT_UNBOOTABLE_VAL;
  BootEntry->PartEntry.Attributes |= PART_ATT_MAX_RETRY_COUNT_VAL;
  UpdatePartitionAttributes(PARTITION_ATTRIBUTES);
  return EFI_SUCCESS;
}

BOOLEAN
IsSuffixEmpty(Slot *CheckSlot)
{
  if (CheckSlot == NULL) {
    return TRUE;
  }

  if (StrLen(CheckSlot->Suffix) == 0) {
    return TRUE;
  }
  return FALSE;
}

STATIC EFI_STATUS GetActiveSlot(Slot *ActiveSlot)
{
  EFI_STATUS Status   = EFI_SUCCESS;
  Slot       Slots[]  = {{L"_a"}, {L"_b"}};
  UINT64     Priority = 0;

  if (ActiveSlot == NULL) {
    DEBUG((EFI_D_ERROR, "GetActiveSlot: bad parameter\n"));
    return EFI_INVALID_PARAMETER;
  }

  for (UINTN SlotIndex = 0; SlotIndex < ARRAY_SIZE(Slots); SlotIndex++) {
    struct PartitionEntry *BootPartition =
        GetBootPartitionEntry(&Slots[SlotIndex]);
    UINT64 BootPriority = 0;
    if (BootPartition == NULL) {
      DEBUG(
          (EFI_D_ERROR,
           "GetActiveSlot: No boot partition "
           "entry for slot %s\n",
           Slots[SlotIndex].Suffix));
      return EFI_NOT_FOUND;
    }

    BootPriority =
        (BootPartition->PartEntry.Attributes & PART_ATT_PRIORITY_VAL) >>
        PART_ATT_PRIORITY_BIT;

    if ((BootPartition->PartEntry.Attributes & PART_ATT_ACTIVE_VAL) &&
        (BootPriority > Priority)) {
      GUARD(StrnCpyS(
          ActiveSlot->Suffix, ARRAY_SIZE(ActiveSlot->Suffix),
          Slots[SlotIndex].Suffix, StrLen(Slots[SlotIndex].Suffix)));
      Priority = BootPriority;
    }
  }

  DEBUG(
      (EFI_D_VERBOSE, "GetActiveSlot: found active slot %s, priority %d\n",
       ActiveSlot->Suffix, Priority));

  if (IsSuffixEmpty(ActiveSlot) == TRUE) {
    /* Check for first boot and set default slot */
    /* For First boot all A/B attributes for the slot would be 0 */
    UINT64                 BootPriority = 0;
    UINT64                 RetryCount   = 0;
    struct PartitionEntry *SlotA        = GetBootPartitionEntry(&Slots[0]);
    if (SlotA == NULL) {
      DEBUG(
          (EFI_D_ERROR,
           "GetActiveSlot: First Boot: No boot partition "
           "entry for slot %s\n",
           Slots[0].Suffix));
      return EFI_NOT_FOUND;
    }

    BootPriority = (SlotA->PartEntry.Attributes & PART_ATT_PRIORITY_VAL) >>
                   PART_ATT_PRIORITY_BIT;
    RetryCount = (SlotA->PartEntry.Attributes & PART_ATT_MAX_RETRY_COUNT_VAL) >>
                 PART_ATT_MAX_RETRY_CNT_BIT;

    if ((SlotA->PartEntry.Attributes & PART_ATT_ACTIVE_VAL) == 0 &&
        (SlotA->PartEntry.Attributes & PART_ATT_SUCCESSFUL_VAL) == 0 &&
        (SlotA->PartEntry.Attributes & PART_ATT_UNBOOTABLE_VAL) == 0 &&
        BootPriority == 0) {

      DEBUG(
          (EFI_D_INFO, "GetActiveSlot: First boot: set "
                       "default slot _a\n"));
      SlotA->PartEntry.Attributes &=
          (~PART_ATT_SUCCESSFUL_VAL & ~PART_ATT_UNBOOTABLE_VAL);
      SlotA->PartEntry.Attributes |=
          (PART_ATT_PRIORITY_VAL | PART_ATT_ACTIVE_VAL |
           PART_ATT_MAX_RETRY_COUNT_VAL);

      GUARD(StrnCpyS(
          ActiveSlot->Suffix, ARRAY_SIZE(ActiveSlot->Suffix), Slots[0].Suffix,
          StrLen(Slots[0].Suffix)));
      UpdatePartitionAttributes(PARTITION_ATTRIBUTES);
      return EFI_SUCCESS;
    }

    DEBUG((EFI_D_ERROR, "GetActiveSlot: No active slot found\n"));
    DEBUG(
        (EFI_D_ERROR,
         "GetActiveSlot: Slot attr: Priority %ld, Retry "
         "%ld, Active %ld, Success %ld, unboot %ld\n",
         BootPriority, RetryCount,
         (SlotA->PartEntry.Attributes & PART_ATT_ACTIVE_VAL) >>
             PART_ATT_ACTIVE_BIT,
         (SlotA->PartEntry.Attributes & PART_ATT_SUCCESSFUL_VAL),
         (SlotA->PartEntry.Attributes & PART_ATT_UNBOOTABLE_VAL)));

    return EFI_NOT_FOUND;
  }

  return EFI_SUCCESS;
}

EFI_STATUS
SetActiveSlot(Slot *NewSlot, BOOLEAN ResetSuccessBit, BOOLEAN SetSuccessBit)
{
  EFI_STATUS             Status        = EFI_SUCCESS;
  Slot                   CurrentSlot   = {{0}};
  Slot *                 AlternateSlot = NULL;
  Slot                   Slots[]       = {{L"_a"}, {L"_b"}};
  BOOLEAN                UfsGet        = TRUE;
  BOOLEAN                UfsSet        = FALSE;
  UINT32                 UfsBootLun    = 0;
  CHAR8                  BootDeviceType[BOOT_DEV_NAME_SIZE_MAX];
  struct PartitionEntry *BootEntry = NULL;

  if (NewSlot == NULL) {
    DEBUG((EFI_D_ERROR, "SetActiveSlot: input parameter invalid\n"));
    return EFI_INVALID_PARAMETER;
  }

  GUARD(GetActiveSlot(&CurrentSlot));

  if (StrnCmp(NewSlot->Suffix, Slots[0].Suffix, StrLen(Slots[0].Suffix)) == 0) {
    AlternateSlot = &Slots[1];
  }
  else {
    AlternateSlot = &Slots[0];
  }

  BootEntry = GetBootPartitionEntry(NewSlot);
  if (BootEntry == NULL) {
    DEBUG(
        (EFI_D_ERROR, "SetActiveSlot: No boot partition entry for slot %s\n",
         NewSlot->Suffix));
    return EFI_NOT_FOUND;
  }

  BootEntry->PartEntry.Attributes |=
      (PART_ATT_PRIORITY_VAL | PART_ATT_ACTIVE_VAL |
       PART_ATT_MAX_RETRY_COUNT_VAL);

  BootEntry->PartEntry.Attributes &= (~PART_ATT_UNBOOTABLE_VAL);

  if (ResetSuccessBit &&
      (BootEntry->PartEntry.Attributes & PART_ATT_SUCCESSFUL_VAL)) {
    BootEntry->PartEntry.Attributes &= (~PART_ATT_SUCCESSFUL_VAL);
  }

  if (SetSuccessBit &&
      ((BootEntry->PartEntry.Attributes & PART_ATT_SUCCESSFUL_VAL) == 0)) {
    BootEntry->PartEntry.Attributes |= PART_ATT_SUCCESSFUL_VAL;
  }

  /* Reduce the priority and clear the active flag for alternate slot*/
  BootEntry = GetBootPartitionEntry(AlternateSlot);
  if (BootEntry == NULL) {
    DEBUG(
        (EFI_D_ERROR, "SetActiveSlot: No boot partition entry for slot %s\n",
         AlternateSlot->Suffix));
    return EFI_NOT_FOUND;
  }

  BootEntry->PartEntry.Attributes &=
      (~PART_ATT_PRIORITY_VAL & ~PART_ATT_ACTIVE_VAL);
  BootEntry->PartEntry.Attributes |=
      (((UINT64)MAX_PRIORITY - 1) << PART_ATT_PRIORITY_BIT);

  UpdatePartitionAttributes(PARTITION_ATTRIBUTES);
  if (StrnCmp(
          CurrentSlot.Suffix, NewSlot->Suffix, StrLen(CurrentSlot.Suffix)) ==
      0) {
    DEBUG(
        (EFI_D_INFO, "SetActiveSlot: %s already active slot\n",
         NewSlot->Suffix));

    /* Check if BootLun is matching with Slot */
    GetRootDeviceType(BootDeviceType, BOOT_DEV_NAME_SIZE_MAX);
    if (!AsciiStrnCmp(BootDeviceType, "UFS", AsciiStrLen("UFS"))) {
      UfsGetSetBootLun(&UfsBootLun, UfsGet);
      if (UfsBootLun == 0x1 && !StrnCmp(
                                   CurrentSlot.Suffix, (CONST CHAR16 *)L"_b",
                                   StrLen((CONST CHAR16 *)L"_b"))) {
        DEBUG((EFI_D_INFO, "Boot lun mismatch switch from 1 to 2\n"));
        DEBUG((EFI_D_INFO, "Reboot Required\n"));
        UfsBootLun = 0x2;
        UfsGetSetBootLun(&UfsBootLun, UfsSet);
      }
      else if (
          UfsBootLun == 0x2 && !StrnCmp(
                                   CurrentSlot.Suffix, (CONST CHAR16 *)L"_a",
                                   StrLen((CONST CHAR16 *)L"_a"))) {
        DEBUG((EFI_D_INFO, "Boot lun mismatch switch from 2 to 1\n"));
        DEBUG((EFI_D_INFO, "Reboot Required\n"));
        UfsBootLun = 0x1;
        UfsGetSetBootLun(&UfsBootLun, UfsSet);
      }
    }
  }
  else {
    DEBUG(
        (EFI_D_INFO, "Alternate slot %s, New slot %s\n", AlternateSlot->Suffix,
         NewSlot->Suffix));
    SwitchPtnSlots(NewSlot->Suffix);
    MarkPtnActive(NewSlot->Suffix);
  }
  return EFI_SUCCESS;
}