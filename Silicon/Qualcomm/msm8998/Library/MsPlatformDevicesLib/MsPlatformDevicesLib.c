/** @file
 *MsPlatformDevicesLib  - Device specific library.

Copyright (C) Microsoft Corporation. All rights reserved.
SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#include <Uefi.h>

#include <Protocol/DevicePath.h>

#include <Library/BaseMemoryLib.h>
#include <Library/DebugLib.h>
#include <Library/DevicePathLib.h>
#include <Library/IoLib.h>
#include <Library/MsPlatformDevicesLib.h>
#include <Library/PcdLib.h>
#include <Library/UefiBootServicesTableLib.h>
#include <Library/UefiLib.h>

#include <Library/AslUpdateLib.h>

#include <Configuration/BootDevices.h>

#include <Configuration/DeviceMemoryMap.h>

#include <Protocol/EFIChipInfo.h>
#include <Protocol/EFIPlatformInfo.h>
#include <Protocol/EFISmem.h>

EFI_STATUS
EFIAPI
MemoryMapLocateArea(PARM_MEMORY_REGION_DESCRIPTOR_EX *MemoryDescriptor, CHAR8 *Name)
{
  PARM_MEMORY_REGION_DESCRIPTOR_EX MemoryDescriptorEx =
      gDeviceMemoryDescriptorEx;

  // Run through each memory descriptor
  while (MemoryDescriptorEx->Length != 0) {
    if (AsciiStriCmp(Name, MemoryDescriptorEx->Name) == 0) {
      *MemoryDescriptor = MemoryDescriptorEx;
      return EFI_SUCCESS;
    }
    MemoryDescriptorEx++;
  }

  return EFI_NOT_FOUND;
}

VOID
PlatformUpdateAcpiTables(VOID)
{
  EFI_STATUS Status;

  PARM_MEMORY_REGION_DESCRIPTOR_EX MPSSEFSRegion = NULL;
  PARM_MEMORY_REGION_DESCRIPTOR_EX ADSPEFSRegion = NULL;

  UINT32                              SOID  = 0;
  UINT32                              SIDV  = 0;
  UINT16                              SDFE  = 0;
  UINT16                              SIDM  = 0;
  UINT32                              SOSN1 = 0;
  UINT32                              SOSN2 = 0;
  CHAR8                               SIDS[EFICHIPINFO_MAX_ID_LENGTH] = {0};
  EFI_PLATFORMINFO_PLATFORM_INFO_TYPE PlatformInfo;
  UINT32                              RMTB = 0;
  UINT32                              RMTX = 0;
  UINT32                              RFMB = 0;
  UINT32                              RFMS = 0;
  UINT32                              RFAB = 0;
  UINT32                              RFAS = 0;

  EFI_CHIPINFO_PROTOCOL     *mBoardProtocol           = NULL;
  EFI_SMEM_PROTOCOL         *pEfiSmemProtocol         = NULL;
  EFI_PLATFORMINFO_PROTOCOL *pEfiPlatformInfoProtocol = NULL;

  UINT32 SmemSize = 0;

  //
  // Find the ChipInfo protocol
  //
  Status = gBS->LocateProtocol(
      &gEfiChipInfoProtocolGuid, NULL, (VOID *)&mBoardProtocol);
  if (EFI_ERROR(Status)) {
    return;
  }

  //
  // Find the SMEM protocol
  //
  Status = gBS->LocateProtocol(
      &gQcomSMEMProtocolGuid, NULL, (VOID **)&pEfiSmemProtocol);
  if (EFI_ERROR(Status)) {
    return;
  }

  //
  // Find the PlatformInfo protocol
  //
  Status = gBS->LocateProtocol(
      &gEfiPlatformInfoProtocolGuid, NULL, (VOID **)&pEfiPlatformInfoProtocol);
  if (EFI_ERROR(Status)) {
    return;
  }

  MemoryMapLocateArea(&MPSSEFSRegion, "MPSS_EFS");
  MemoryMapLocateArea(&ADSPEFSRegion, "ADSP_EFS");

  mBoardProtocol->GetChipId(mBoardProtocol, &SOID);
  mBoardProtocol->GetChipVersion(mBoardProtocol, &SIDV);
  mBoardProtocol->GetChipFamily(mBoardProtocol, (EFIChipInfoFamilyType *)&SDFE);
  mBoardProtocol->GetModemSupport(mBoardProtocol, (EFIChipInfoModemType *)&SIDM);
  mBoardProtocol->GetSerialNumber(mBoardProtocol, (EFIChipInfoSerialNumType *)&SOSN1);
  mBoardProtocol->GetQFPROMChipId(mBoardProtocol, (EFIChipInfoQFPROMChipIdType *)&SOSN2);
  mBoardProtocol->GetChipIdString(mBoardProtocol, SIDS, EFICHIPINFO_MAX_ID_LENGTH);

  pEfiPlatformInfoProtocol->GetPlatformInfo(pEfiPlatformInfoProtocol, &PlatformInfo);

  UINT16 SVMJ = (UINT16)((SIDV >> 16) & 0xFFFF);
  UINT16 SVMI = (UINT16)(SIDV & 0xFFFF);
  UINT64 SOSN = ((UINT64)SOSN2 << 32) | SOSN1;
  UINT32 PLST = PlatformInfo.subtype;

  if (MPSSEFSRegion != NULL) {
    RMTB = MPSSEFSRegion->Address;
    RMTX = MPSSEFSRegion->Length;
  }

  if (ADSPEFSRegion != NULL) {
    RFAB = ADSPEFSRegion->Address;
    RFAS = ADSPEFSRegion->Length / 2;
    RFMB = ADSPEFSRegion->Address + ADSPEFSRegion->Length / 2;
    RFMS = ADSPEFSRegion->Length / 2;
  }

  DEBUG((EFI_D_INFO, "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"));
  DEBUG((EFI_D_INFO, "Chip Id: %d\n", SOID));
  DEBUG((EFI_D_INFO, "Chip Family Id: %d\n", SDFE));
  DEBUG((EFI_D_INFO, "Chip Major Version: %d\n", SVMJ));
  DEBUG((EFI_D_INFO, "Chip Minor Version: %d\n", SVMI));
  DEBUG((EFI_D_INFO, "Chip Modem Support: 0x%x\n", SIDM));
  DEBUG((EFI_D_INFO, "Chip Serial Number: 0x%x\n", SOSN));
  DEBUG((EFI_D_INFO, "Chip Name: %a\n", SIDS));
  DEBUG((EFI_D_INFO, "Platform Subtype: %d\n", PLST));

  // gBS->Stall(10 * 1000 * 1000);
  UpdateNameAslCode(SIGNATURE_32('S', 'O', 'I', 'D'), &SOID, 4);
  UpdateNameAslCode(SIGNATURE_32('S', 'I', 'D', 'V'), &SIDV, 4);
  UpdateNameAslCode(SIGNATURE_32('S', 'V', 'M', 'J'), &SVMJ, 2);
  UpdateNameAslCode(SIGNATURE_32('S', 'V', 'M', 'I'), &SVMI, 2);
  UpdateNameAslCode(SIGNATURE_32('S', 'D', 'F', 'E'), &SDFE, 2);
  UpdateNameAslCode(SIGNATURE_32('S', 'I', 'D', 'M'), &SIDM, 2);
  UpdateNameAslCode(SIGNATURE_32('S', 'O', 'S', 'N'), &SOSN, 8);
  UpdateNameAslCode(SIGNATURE_32('P', 'L', 'S', 'T'), &PLST, 4);
  UpdateNameAslCode(SIGNATURE_32('R', 'M', 'T', 'B'), &RMTB, 4);
  UpdateNameAslCode(SIGNATURE_32('R', 'M', 'T', 'X'), &RMTX, 4);
  UpdateNameAslCode(SIGNATURE_32('R', 'F', 'M', 'B'), &RFMB, 4);
  UpdateNameAslCode(SIGNATURE_32('R', 'F', 'M', 'S'), &RFMS, 4);
  UpdateNameAslCode(SIGNATURE_32('R', 'F', 'A', 'B'), &RFAB, 4);
  UpdateNameAslCode(SIGNATURE_32('R', 'F', 'A', 'S'), &RFAS, 4);
  UpdateNameAslCode(SIGNATURE_32('S', 'I', 'D', 'S'), &SIDS, EFICHIPINFO_MAX_ID_LENGTH);
}

VOID
EFIAPI
PlatformSetup()
{
  // Patch ACPI Tables
  PlatformUpdateAcpiTables();
}
