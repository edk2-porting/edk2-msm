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
// #include <Library/AslUpdateLib.h>
#include <Library/MemoryMapHelperLib.h>

#include <Configuration/BootDevices.h>

#include <Protocol/EFIChipInfo.h>
#include <Protocol/EFIPlatformInfo.h>
#include <Protocol/EFISmem.h>

VOID
EFIAPI
PlatformSetup()
{
  // Allow MPSS and HLOS to access the allocated RFS Shared Memory Region
  // Normally this would be done by a driver in Linux
  // TODO: Move to a better place!
  // RFSLocateAndProtectSharedArea();

  // Patch ACPI Tables
  // PlatformUpdateAcpiTables();
}
