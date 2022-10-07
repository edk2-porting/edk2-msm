/* Copyright (c) 2015-2018, 2020, The Linux Foundation. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 * * Redistributions of source code must retain the above copyright
 *  notice, this list of conditions and the following disclaimer.
 *  * Redistributions in binary form must reproduce the above
 * copyright notice, this list of conditions and the following
 * disclaimer in the documentation and/or other materials provided
 *  with the distribution.
 *   * Neither the name of The Linux Foundation nor the names of its
 * contributors may be used to endorse or promote products derived
 * from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
 * BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
 * IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "AutoGen.h"
#include <Library/BootSlotLib/BlockIoUtils.h>
#include <Library/BootSlotLib/EFIUtils.h>
#include <Protocol/PartitionInfo.h>

/* Volume Label size 11 chars, round off to 16 */
#define VOLUME_LABEL_SIZE 16

/* List of all the filters that need device path protocol in the handle to
 * filter */
#define FILTERS_NEEDING_DEVICEPATH                                             \
  (BLK_IO_SEL_PARTITIONED_MBR | BLK_IO_SEL_PARTITIONED_GPT |                   \
   BLK_IO_SEL_MATCH_PARTITION_TYPE_GUID | BLK_IO_SEL_SELECT_ROOT_DEVICE_ONLY | \
   BLK_IO_SEL_MATCH_ROOT_DEVICE)

/* Returns 0 if the volume label matches otherwise non zero */
STATIC UINTN CompareVolumeLabel(
    IN EFI_SIMPLE_FILE_SYSTEM_PROTOCOL *Fs, IN CHAR8 *ReqVolumeName)
{
  INT32                 CmpResult;
  UINT32                j;
  UINT16                VolumeLabel[VOLUME_LABEL_SIZE];
  EFI_FILE_PROTOCOL *   FsVolume = NULL;
  EFI_STATUS            Status;
  UINTN                 Size;
  EFI_FILE_SYSTEM_INFO *FsInfo;

  // Get information about the volume
  Status = Fs->OpenVolume(Fs, &FsVolume);

  if (Status != EFI_SUCCESS) {
    return 1;
  }

  /* Get the Volume name */
  Size   = 0;
  FsInfo = NULL;
  Status = FsVolume->GetInfo(FsVolume, &gEfiFileSystemInfoGuid, &Size, FsInfo);
  if (Status == EFI_BUFFER_TOO_SMALL) {
    FsInfo = AllocateZeroPool(Size);
    Status =
        FsVolume->GetInfo(FsVolume, &gEfiFileSystemInfoGuid, &Size, FsInfo);
    if (Status != EFI_SUCCESS) {
      FreePool(FsInfo);
      return 1;
    }
  }

  if (FsInfo == NULL) {
    return 1;
  }

  /* Convert the passed in Volume name to Wide char and upper case */
  for (j = 0; (j < VOLUME_LABEL_SIZE - 1) && ReqVolumeName[j]; ++j) {
    VolumeLabel[j] = ReqVolumeName[j];

    if ((VolumeLabel[j] >= 'a') && (VolumeLabel[j] <= 'z')) {
      VolumeLabel[j] -= ('a' - 'A');
    }
  }

  /* Null termination */
  VolumeLabel[j] = 0;

  /* Change any lower chars in volume name to upper
   * (ideally this is not needed) */
  for (j = 0; (j < VOLUME_LABEL_SIZE - 1) && FsInfo->VolumeLabel[j]; ++j) {
    if ((FsInfo->VolumeLabel[j] >= 'a') && (FsInfo->VolumeLabel[j] <= 'z')) {
      FsInfo->VolumeLabel[j] -= ('a' - 'A');
    }
  }

  CmpResult = StrnCmp(FsInfo->VolumeLabel, VolumeLabel, VOLUME_LABEL_SIZE);

  FreePool(FsInfo);
  FsVolume->Close(FsVolume);

  return CmpResult;
}

EFI_STATUS
EFIAPI
GetPartitionEntry(IN EFI_HANDLE Handle, OUT EFI_PARTITION_ENTRY **PartEntry)
{
  EFI_PARTITION_INFO_PROTOCOL *PartInfo;
  EFI_STATUS                   Status = gBS->HandleProtocol(
      Handle, &gEfiPartitionInfoProtocolGuid, (VOID **)&PartInfo);
  if (!EFI_ERROR(Status)) {
    *PartEntry = &PartInfo->Info.Gpt;
  }
  return Status;
}

/**
  Returns a list of BlkIo handles based on required criteria
SelectionAttrib : Bitmask representing the conditions that need
to be met for the handles returned. Based on the
selections filter members should have valid values.
FilterData      : Instance of Partition Select Filter structure that
needs extended data for certain type flags. For example
Partition type and/or Volume name can be specified.
HandleInfoPtr   : Pointer to array of HandleInfo structures in which the
output is returned.
MaxBlkIopCnt    : On input, max number of handle structures the buffer can hold,
On output, the number of handle structures returned.

@retval EFI_SUCCESS if the operation was successful
*/
EFI_STATUS
EFIAPI
GetBlkIOHandles(
    IN UINT32 SelectionAttrib, IN PartiSelectFilter *FilterData,
    OUT HandleInfo *HandleInfoPtr, IN OUT UINT32 *MaxBlkIopCnt)
{
  EFI_BLOCK_IO_PROTOCOL *          BlkIo;
  EFI_HANDLE *                     BlkIoHandles;
  UINTN                            BlkIoHandleCount;
  UINTN                            i;
  UINTN                            DevicePathDepth;
  HARDDRIVE_DEVICE_PATH *          Partition, *PartitionOut;
  EFI_STATUS                       Status;
  EFI_DEVICE_PATH_PROTOCOL *       DevPathInst;
  EFI_DEVICE_PATH_PROTOCOL *       TempDevicePath;
  VENDOR_DEVICE_PATH *             RootDevicePath;
  EFI_SIMPLE_FILE_SYSTEM_PROTOCOL *Fs;
  UINT32                           BlkIoCnt = 0;
  EFI_PARTITION_ENTRY *            PartEntry;

  if ((MaxBlkIopCnt == NULL) || (HandleInfoPtr == NULL))
    return EFI_INVALID_PARAMETER;

  /* Adjust some defaults first */
  if ((SelectionAttrib & (BLK_IO_SEL_MEDIA_TYPE_REMOVABLE |
                          BLK_IO_SEL_MEDIA_TYPE_NON_REMOVABLE)) == 0)
    SelectionAttrib |=
        (BLK_IO_SEL_MEDIA_TYPE_REMOVABLE | BLK_IO_SEL_MEDIA_TYPE_NON_REMOVABLE);

  if (((BLK_IO_SEL_PARTITIONED_GPT | BLK_IO_SEL_PARTITIONED_MBR) &
       SelectionAttrib) == 0)
    SelectionAttrib |=
        (BLK_IO_SEL_PARTITIONED_GPT | BLK_IO_SEL_PARTITIONED_MBR);

  /* If we need Filesystem handle then search based on that its narrower search
   * than BlkIo */
  if (SelectionAttrib & (BLK_IO_SEL_SELECT_MOUNTED_FILESYSTEM |
                         BLK_IO_SEL_SELECT_BY_VOLUME_NAME)) {
    Status = gBS->LocateHandleBuffer(
        ByProtocol, &gEfiSimpleFileSystemProtocolGuid, NULL, &BlkIoHandleCount,
        &BlkIoHandles);
  }
  else {
    Status = gBS->LocateHandleBuffer(
        ByProtocol, &gEfiBlockIoProtocolGuid, NULL, &BlkIoHandleCount,
        &BlkIoHandles);
  }

  if (Status != EFI_SUCCESS) {
    DEBUG((EFI_D_ERROR, "Unable to get Filesystem Handle buffer %r\n", Status));
    return Status;
  }

  /* Loop through to search for the ones we are interested in. */
  for (i = 0; i < BlkIoHandleCount; i++) {

    Status = gBS->HandleProtocol(
        BlkIoHandles[i], &gEfiBlockIoProtocolGuid, (VOID **)&BlkIo);
    /* Fv volumes will not support Blk I/O protocol */
    if (Status == EFI_UNSUPPORTED) {
      continue;
    }

    if (Status != EFI_SUCCESS) {
      DEBUG((EFI_D_ERROR, "Unable to get Filesystem Handle %r\n", Status));
      return Status;
    }

    /* Check if the media type criteria (for removable/not) satisfies */
    if (BlkIo->Media->RemovableMedia) {
      if ((SelectionAttrib & BLK_IO_SEL_MEDIA_TYPE_REMOVABLE) == 0)
        continue;
    }
    else {
      if ((SelectionAttrib & BLK_IO_SEL_MEDIA_TYPE_NON_REMOVABLE) == 0)
        continue;
    }

    /* Clear the pointer, we can get it if the filter is set */
    PartitionOut = NULL;

    /* Check if partition related criteria satisfies */
    if ((SelectionAttrib & FILTERS_NEEDING_DEVICEPATH) != 0) {
      Status = gBS->HandleProtocol(
          BlkIoHandles[i], &gEfiDevicePathProtocolGuid, (VOID **)&DevPathInst);

      /* If we didn't get the DevicePath Protocol then this handle
       * cannot be used */
      if (EFI_ERROR(Status))
        continue;

      DevicePathDepth = 0;

      /* Get the device path */
      TempDevicePath = DevPathInst;
      RootDevicePath = (VENDOR_DEVICE_PATH *)DevPathInst;
      Partition      = (HARDDRIVE_DEVICE_PATH *)TempDevicePath;

      if ((SelectionAttrib & (BLK_IO_SEL_SELECT_ROOT_DEVICE_ONLY |
                              BLK_IO_SEL_MATCH_ROOT_DEVICE)) != 0) {
        if (!FilterData) {
          return EFI_INVALID_PARAMETER;
        }
        /* If this is not the root device that we are looking for, ignore this
         * handle */
        if (RootDevicePath->Header.Type != HARDWARE_DEVICE_PATH ||
            RootDevicePath->Header.SubType != HW_VENDOR_DP ||
            (RootDevicePath->Header.Length[0] |
             (RootDevicePath->Header.Length[1] << 8)) !=
                sizeof(VENDOR_DEVICE_PATH) ||
            ((FilterData->RootDeviceType != NULL) &&
             (CompareGuid(FilterData->RootDeviceType, &RootDevicePath->Guid) ==
              FALSE)))
          continue;
      }

      /* Locate the last Device Path Node */
      while (!IsDevicePathEnd(TempDevicePath)) {
        DevicePathDepth++;
        Partition      = (HARDDRIVE_DEVICE_PATH *)TempDevicePath;
        TempDevicePath = NextDevicePathNode(TempDevicePath);
      }

      /* If we need the handle for root device only and if this is representing
       * a sub partition in the root device then ignore this handle */
      if (SelectionAttrib & BLK_IO_SEL_SELECT_ROOT_DEVICE_ONLY)
        if (DevicePathDepth > 1)
          continue;

      /* Check if the last node is Harddrive Device path that contains the
       * Partition information */
      if (Partition->Header.Type == MEDIA_DEVICE_PATH &&
          Partition->Header.SubType == MEDIA_HARDDRIVE_DP &&
          (Partition->Header.Length[0] | (Partition->Header.Length[1] << 8)) ==
              sizeof(*Partition)) {
        PartitionOut = Partition;

        if ((SelectionAttrib & BLK_IO_SEL_PARTITIONED_GPT) == 0)
          if (Partition->MBRType == PARTITIONED_TYPE_GPT)
            continue;

        if ((SelectionAttrib & BLK_IO_SEL_PARTITIONED_MBR) == 0)
          if (Partition->MBRType == PARTITIONED_TYPE_MBR)
            continue;

        /* PartitionDxe implementation should return partition type also */
        if ((SelectionAttrib & BLK_IO_SEL_MATCH_PARTITION_TYPE_GUID) != 0) {
          VOID *Interface;

          if (!FilterData || FilterData->PartitionType == NULL) {
            return EFI_INVALID_PARAMETER;
          }

          Status = gBS->HandleProtocol(
              BlkIoHandles[i], FilterData->PartitionType, (VOID **)&Interface);
          if (EFI_ERROR(Status)) {
            Status = GetPartitionEntry(BlkIoHandles[i], &PartEntry);
            if (EFI_ERROR(Status)) {
              continue;
            }
            if (CompareGuid(
                    &PartEntry->PartitionTypeGUID, FilterData->PartitionType) ==
                FALSE) {
              continue;
            }
          }
        }
      }
      /* If we wanted a particular partition and didn't get the HDD DP,
         then this handle is probably not the interested ones */
      else if ((SelectionAttrib & BLK_IO_SEL_MATCH_PARTITION_TYPE_GUID) != 0)
        continue;
    }

    /* Check if the Filesystem related criteria satisfies */
    if ((SelectionAttrib & BLK_IO_SEL_SELECT_MOUNTED_FILESYSTEM) != 0) {
      Status = gBS->HandleProtocol(
          BlkIoHandles[i], &gEfiSimpleFileSystemProtocolGuid, (VOID **)&Fs);
      if (EFI_ERROR(Status)) {
        continue;
      }

      if ((SelectionAttrib & BLK_IO_SEL_SELECT_BY_VOLUME_NAME) != 0) {
        if (!FilterData || FilterData->VolumeName == NULL) {
          return EFI_INVALID_PARAMETER;
        }
        if (CompareVolumeLabel(Fs, FilterData->VolumeName) != 0) {
          continue;
        }
      }
    }

    /* Check if the Partition name related criteria satisfies */
    if ((SelectionAttrib & BLK_IO_SEL_MATCH_PARTITION_LABEL) != 0) {
      Status = GetPartitionEntry(BlkIoHandles[i], &PartEntry);
      if (Status != EFI_SUCCESS)
        continue;
      if (StrnCmp(
              PartEntry->PartitionName, FilterData->PartitionLabel,
              MAX(StrLen(PartEntry->PartitionName),
                  StrLen(FilterData->PartitionLabel))))
        continue;
    }
    /* We came here means, this handle satisfies all the conditions needed,
     * Add it into the list */
    HandleInfoPtr[BlkIoCnt].Handle        = BlkIoHandles[i];
    HandleInfoPtr[BlkIoCnt].BlkIo         = BlkIo;
    HandleInfoPtr[BlkIoCnt].PartitionInfo = PartitionOut;
    BlkIoCnt++;
    if (BlkIoCnt >= *MaxBlkIopCnt)
      break;
  }

  *MaxBlkIopCnt = BlkIoCnt;

  /* Free the handle buffer */
  if (BlkIoHandles != NULL) {
    FreePool(BlkIoHandles);
    BlkIoHandles = NULL;
  }

  return EFI_SUCCESS;
}