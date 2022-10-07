/* Copyright (c) 2015-2018, 2020-2021, The Linux Foundation. All rights
 * reserved.
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
#include <Library/BootSlotLib/StorageUtils.h>

STATIC CONST CHAR8 *DeviceType[] = {
    [EMMC]    = "EMMC",
    [UFS]     = "UFS",
    [UNKNOWN] = "Unknown",
};

/**
 Device Handler Info

 @param[out]     HndlInfo  : Pointer to array of HandleInfo structures
                               in which the output is returned.
 @param[in, out] MaxHandles  : On input, max number of handle structures
                               the buffer can hold, On output, the number
                               of handle structures returned.
 @param[in]      Type        : Device Type : UNKNOWN, UFS, EMMC, NAND
 @retval         EFI_STATUS  : Return Success on getting Handler Info
 **/

STATIC EFI_STATUS
GetDeviceHandleInfo(VOID *HndlInfo, UINT32 MaxHandles, MemCardType Type)
{
  EFI_STATUS        Status  = EFI_INVALID_PARAMETER;
  UINT32            Attribs = 0;
  PartiSelectFilter HandleFilter;
  HandleInfo *      HandleInfoList = HndlInfo;

  Attribs |= BLK_IO_SEL_MATCH_ROOT_DEVICE;
  HandleFilter.PartitionType = NULL;
  HandleFilter.VolumeName    = NULL;

  switch (Type) {
  case UFS:
    HandleFilter.RootDeviceType = &gEfiUfsLU0Guid;
    break;
  case EMMC:
    HandleFilter.RootDeviceType = &gEfiEmmcUserPartitionGuid;
    break;
  case UNKNOWN:
    DEBUG((EFI_D_ERROR, "Device type unknown\n"));
    return Status;
  }

  Status = GetBlkIOHandles(Attribs, &HandleFilter, HandleInfoList, &MaxHandles);
  if (EFI_ERROR(Status) || MaxHandles == 0) {
    DEBUG((EFI_D_ERROR, "Get BlkIohandles failed\n"));
    return Status;
  }
  return Status;
}

/**
 Return a device type
 @retval         Device type : UNKNOWN | UFS | EMMC | NAND
 **/
STATIC UINT32 GetCompatibleRootDeviceType(VOID)
{
  EFI_STATUS Status = EFI_INVALID_PARAMETER;
  HandleInfo HandleInfoList[HANDLE_MAX_INFO_LIST];
  UINT32     MaxHandles = ARRAY_SIZE(HandleInfoList);
  UINT32     Index;

  for (Index = 0; Index < UNKNOWN; Index++) {
    Status = GetDeviceHandleInfo(HandleInfoList, MaxHandles, Index);
    if (Status == EFI_SUCCESS) {
      return Index;
    }
  }

  return Index;
}

/**
 Return a device type
 @retval         Device type : UNKNOWN | UFS | EMMC, default is UNKNOWN
 **/

MemCardType CheckRootDeviceType(VOID)
{
  EFI_STATUS                 Status = EFI_INVALID_PARAMETER;
  STATIC MemCardType         Type   = UNKNOWN;
  MEM_CARD_INFO              CardInfoData;
  EFI_MEM_CARDINFO_PROTOCOL *CardInfo;

  if (Type == UNKNOWN) {
    Status = gBS->LocateProtocol(
        &gEfiMemCardInfoProtocolGuid, NULL, (VOID **)&CardInfo);
    if (!EFI_ERROR(Status)) {

      Status = CardInfo->GetCardInfo(CardInfo, &CardInfoData);

      if (!EFI_ERROR(Status)) {

        if (!AsciiStrnCmp(
                (CHAR8 *)CardInfoData.card_type, "UFS", AsciiStrLen("UFS"))) {
          Type = UFS;
        }
        else if (!AsciiStrnCmp(
                     (CHAR8 *)CardInfoData.card_type, "EMMC",
                     AsciiStrLen("EMMC"))) {
          Type = EMMC;
        }
        else {
          Type = GetCompatibleRootDeviceType();
        }
      }
    }
  }
  return Type;
}

/**
 Get device type
 @param[out]  StrDeviceType  : Pointer to array of device type string.
 @param[in]   Len            : The size of the device type string
 **/
VOID GetRootDeviceType(CHAR8 *StrDeviceType, UINT32 Len)
{
  UINT32 Type;

  Type = CheckRootDeviceType();
  AsciiSPrint(StrDeviceType, Len, "%a", DeviceType[Type]);
}

EFI_STATUS
UfsGetSetBootLun(UINT32 *UfsBootlun, BOOLEAN IsGet)
{
  EFI_STATUS                 Status = EFI_INVALID_PARAMETER;
  EFI_MEM_CARDINFO_PROTOCOL *CardInfo;
  HandleInfo                 HandleInfoList[MAX_HANDLE_INFO_LIST];
  UINT32                     Attribs = 0;
  UINT32                     MaxHandles;
  PartiSelectFilter          HandleFilter;

  Attribs |= BLK_IO_SEL_MATCH_ROOT_DEVICE;
  MaxHandles                  = ARRAY_SIZE(HandleInfoList);
  HandleFilter.PartitionType  = NULL;
  HandleFilter.VolumeName     = NULL;
  HandleFilter.RootDeviceType = &gEfiUfsLU0Guid;

  Status = GetBlkIOHandles(Attribs, &HandleFilter, HandleInfoList, &MaxHandles);
  if (EFI_ERROR(Status))
    return EFI_NOT_FOUND;

  Status = gBS->HandleProtocol(
      HandleInfoList[0].Handle, &gEfiMemCardInfoProtocolGuid,
      (VOID **)&CardInfo);

  if (Status != EFI_SUCCESS) {
    DEBUG((EFI_D_ERROR, "Error locating MemCardInfoProtocol:%x\n", Status));
    return Status;
  }

  if (CardInfo->Revision < EFI_MEM_CARD_INFO_PROTOCOL_REVISION) {
    DEBUG(
        (EFI_D_ERROR, "This API not supported in Revision =%u\n",
         CardInfo->Revision));
    return EFI_NOT_FOUND;
  }

  if (IsGet == TRUE) {
    if (CardInfo->GetBootLU(CardInfo, UfsBootlun) == EFI_SUCCESS)
      DEBUG((EFI_D_VERBOSE, "Get BootLun =%u\n", *UfsBootlun));
  }
  else {
    if (CardInfo->SetBootLU(CardInfo, *UfsBootlun) == EFI_SUCCESS)
      DEBUG((EFI_D_VERBOSE, "SetBootLun =%u\n", *UfsBootlun));
  }
  return Status;
}