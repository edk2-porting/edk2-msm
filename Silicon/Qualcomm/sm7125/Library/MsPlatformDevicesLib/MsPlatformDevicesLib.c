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
#include <Library/MemoryMapHelperLib.h>
#include <Library/RFSProtectionLib.h>

#include <Configuration/BootDevices.h>

#include <Protocol/EFIChipInfo.h>
#include <Protocol/EFIPlatformInfo.h>
#include <Protocol/EFISmem.h>

VOID
PlatformUpdateAcpiTables(VOID)
{
  EFI_STATUS Status;

  ARM_MEMORY_REGION_DESCRIPTOR_EX MPSSEFSRegion;
  ARM_MEMORY_REGION_DESCRIPTOR_EX ADSPEFSRegion;
  ARM_MEMORY_REGION_DESCRIPTOR_EX TGCMRegion;

  UINT32                              SOID  = 0;
  UINT32                              SIDV  = 0;
  UINT16                              SDFE  = 0;
  UINT16                              SIDM  = 0;
  UINT32                             *pSIDT = (UINT32 *)0x784180;
  UINT32                              SIDT  = (*pSIDT & 0xFF00000) >> 20;
  UINT32                             *pSJTG = (UINT32 *)0x784180;
  UINT32                              SJTG  = *pSJTG & 0xFFFFF;
  UINT32                             *pEMUL = (UINT32 *)0x1FC8004;
  UINT32                              EMUL  = *pEMUL & 0x3;
  UINT32                              SOSN1 = 0;
  UINT32                              SOSN2 = 0;
  UINT64                              SOSI  = 0;
  UINT32                              PRP1  = 0xFFFFFFFF;
  CHAR8                               SIDS[EFICHIPINFO_MAX_ID_LENGTH] = {0};
  EFI_PLATFORMINFO_PLATFORM_INFO_TYPE PlatformInfo;
  UINT32                              RMTB = 0;
  UINT32                              RMTX = 0;
  UINT32                              RFMB = 0;
  UINT32                              RFMS = 0;
  UINT32                              RFAB = 0;
  UINT32                              RFAS = 0;
  UINT32                              TCMA = 0;
  UINT32                              TCML = 0;

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

  mBoardProtocol->GetChipId(mBoardProtocol, &SOID);
  mBoardProtocol->GetChipVersion(mBoardProtocol, &SIDV);
  mBoardProtocol->GetChipFamily(mBoardProtocol, (EFIChipInfoFamilyType *)&SDFE);
  mBoardProtocol->GetModemSupport(mBoardProtocol, (EFIChipInfoModemType *)&SIDM);
  mBoardProtocol->GetSerialNumber(mBoardProtocol, (EFIChipInfoSerialNumType *)&SOSN1);
  mBoardProtocol->GetQFPROMChipId(mBoardProtocol, (EFIChipInfoQFPROMChipIdType *)&SOSN2);
  mBoardProtocol->GetChipIdString(mBoardProtocol, SIDS, EFICHIPINFO_MAX_ID_LENGTH);

  pEfiSmemProtocol->GetFunc(137, &SmemSize, (VOID **)&SOSI);

  pEfiPlatformInfoProtocol->GetPlatformInfo(pEfiPlatformInfoProtocol, &PlatformInfo);

  UINT16 SVMJ = (UINT16)((SIDV >> 16) & 0xFFFF);
  UINT16 SVMI = (UINT16)(SIDV & 0xFFFF);
  UINT64 SOSN = ((UINT64)SOSN2 << 32) | SOSN1;
  UINT32 PLST = PlatformInfo.subtype;

  if (!EFI_ERROR(LocateMemoryMapAreaByName("MPSS_EFS", &MPSSEFSRegion))) {
    RMTB = MPSSEFSRegion.Address;
    RMTX = MPSSEFSRegion.Length;
  }

  if (!EFI_ERROR(LocateMemoryMapAreaByName("ADSP_EFS", &ADSPEFSRegion))) {
    RFMB = ADSPEFSRegion.Address + ADSPEFSRegion.Length / 2;
    RFMS = ADSPEFSRegion.Length / 2;
    RFAB = ADSPEFSRegion.Address;
    RFAS = ADSPEFSRegion.Length / 2;
  }

  if (!EFI_ERROR(LocateMemoryMapAreaByName("TGCM", &TGCMRegion))) {
    TCMA = TGCMRegion.Address;
    TCML = TGCMRegion.Length;
  } else {
    TCMA = 0xDEADBEEF;
    TCML = 0xBEEFDEAD;
  }

  DEBUG((EFI_D_WARN, "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"));
  DEBUG((EFI_D_WARN, "Chip Id: %d\n", SOID));
  DEBUG((EFI_D_WARN, "Chip Family Id: %d\n", SDFE));
  DEBUG((EFI_D_WARN, "Chip Major Version: %d\n", SVMJ));
  DEBUG((EFI_D_WARN, "Chip Minor Version: %d\n", SVMI));
  DEBUG((EFI_D_WARN, "Chip Modem Support: 0x%x\n", SIDM));
  DEBUG((EFI_D_WARN, "Chip Serial Number: 0x%x\n", SOSN));
  DEBUG((EFI_D_WARN, "Chip Name: %a\n", SIDS));
  DEBUG((EFI_D_WARN, "Chip Info Address: 0x%x\n", SOSI));
  DEBUG((EFI_D_WARN, "Platform Subtype: %d\n", PLST));

  // gBS->Stall(10 * 1000 * 1000);
  UpdateNameAslCode(SIGNATURE_32('S', 'O', 'I', 'D'), &SOID, 4);
  UpdateNameAslCode(SIGNATURE_32('S', 'I', 'D', 'V'), &SIDV, 4);
  UpdateNameAslCode(SIGNATURE_32('S', 'V', 'M', 'J'), &SVMJ, 2);
  UpdateNameAslCode(SIGNATURE_32('S', 'V', 'M', 'I'), &SVMI, 2);
  UpdateNameAslCode(SIGNATURE_32('S', 'D', 'F', 'E'), &SDFE, 2);
  UpdateNameAslCode(SIGNATURE_32('S', 'I', 'D', 'M'), &SIDM, 2);
  UpdateNameAslCode(SIGNATURE_32('S', 'I', 'D', 'T'), &SIDT, 4);
  UpdateNameAslCode(SIGNATURE_32('S', 'J', 'T', 'G'), &SJTG, 4);
  UpdateNameAslCode(SIGNATURE_32('S', 'O', 'S', 'N'), &SOSN, 8);
  UpdateNameAslCode(SIGNATURE_32('P', 'L', 'S', 'T'), &PLST, 4);
  UpdateNameAslCode(SIGNATURE_32('E', 'M', 'U', 'L'), &EMUL, 4);
  UpdateNameAslCode(SIGNATURE_32('R', 'M', 'T', 'B'), &RMTB, 4);
  UpdateNameAslCode(SIGNATURE_32('R', 'M', 'T', 'X'), &RMTX, 4);
  UpdateNameAslCode(SIGNATURE_32('R', 'F', 'M', 'B'), &RFMB, 4);
  UpdateNameAslCode(SIGNATURE_32('R', 'F', 'M', 'S'), &RFMS, 4);
  UpdateNameAslCode(SIGNATURE_32('R', 'F', 'A', 'B'), &RFAB, 4);
  UpdateNameAslCode(SIGNATURE_32('R', 'F', 'A', 'S'), &RFAS, 4);
  UpdateNameAslCode(SIGNATURE_32('T', 'C', 'M', 'A'), &TCMA, 4);
  UpdateNameAslCode(SIGNATURE_32('T', 'C', 'M', 'L'), &TCML, 4);
  UpdateNameAslCode(SIGNATURE_32('S', 'O', 'S', 'I'), &SOSI, 8);
  UpdateNameAslCode(SIGNATURE_32('P', 'R', 'P', '1'), &PRP1, 4);
  UpdateNameAslCode(SIGNATURE_32('S', 'I', 'D', 'S'), &SIDS, EFICHIPINFO_MAX_ID_LENGTH);
}

VOID
EFIAPI
PlatformSetup()
{
  // Allow MPSS and HLOS to access the allocated RFS Shared Memory Region
  // Normally this would be done by a driver in Linux
  RFSLocateAndProtectSharedArea();

  // Patch ACPI Tables
  PlatformUpdateAcpiTables();
}
