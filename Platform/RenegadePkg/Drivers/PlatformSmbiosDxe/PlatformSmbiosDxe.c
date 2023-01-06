/** @file
 *
 *  Static SMBIOS Table for the Qualcomm SDM845 Platform
 *  Derived from EmulatorPkg package
 *
 *  Copyright (c) 2017-2018, Andrey Warkentin <andrey.warkentin@gmail.com>
 *  Copyright (c) 2013, Linaro.org
 *  Copyright (c) 2012, Apple Inc. All rights reserved.<BR>
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Copyright (c) 2020, ARM Limited. All rights reserved.
 *  Copyright (c) 2021, BigfootACA <bigfoot@classfun.cn>
 *
 *  SPDX-License-Identifier: BSD-2-Clause-Patent
 *
 **/

#include <Base.h>
#include <Guid/SmBios.h>
#include <IndustryStandard/SmBios.h>
#include <Library/ArmLib.h>
#include <Library/BaseLib.h>
#include <Library/BaseMemoryLib.h>
#include <Library/DebugLib.h>
#include <Library/MemoryAllocationLib.h>
#include <Library/PcdLib.h>
#include <Library/PrintLib.h>
#include <Library/TimeBaseLib.h>
#include <Library/UefiBootServicesTableLib.h>
#include <Library/UefiDriverEntryPoint.h>
#include <Library/UefiLib.h>
#include <Library/UefiRuntimeServicesTableLib.h>
#include <Library/FdtParserLib.h>
#include <Library/SOCSmbiosInfoLib.h>
#include <Protocol/Smbios.h>

/***********************************************************************
        SMBIOS data definition  TYPE0  BIOS Information
************************************************************************/
SMBIOS_TABLE_TYPE0 mBIOSInfoType0 = {
    {EFI_SMBIOS_TYPE_BIOS_INFORMATION, sizeof(SMBIOS_TABLE_TYPE0), 0},
    1,      // Vendor String
    2,      // BiosVersion String
    0xE800, // BiosSegment
    3,      // BiosReleaseDate String
    0,      // BiosSize (in 64KB)
    {
        // BiosCharacteristics
        0, //  Reserved                          :2;  ///< Bits 0-1.
        0, //  Unknown                           :1;
        0, //  BiosCharacteristicsNotSupported   :1;
        0, //  IsaIsSupported                    :1;
        0, //  McaIsSupported                    :1;
        0, //  EisaIsSupported                   :1;
        1, //  PciIsSupported                    :1; /// No PCIe support since
           //  we hide ECAM from the OS
        0, //  PcmciaIsSupported                 :1;
        1, //  PlugAndPlayIsSupported            :1;
        0, //  ApmIsSupported                    :1;
        1, //  BiosIsUpgradable                  :1;
        0, //  BiosShadowingAllowed              :1;
        0, //  VlVesaIsSupported                 :1;
        0, //  EscdSupportIsAvailable            :1;
        0, //  BootFromCdIsSupported             :1;
        1, //  SelectableBootIsSupported         :1;
        0, //  RomBiosIsSocketed                 :1;
        0, //  BootFromPcmciaIsSupported         :1;
        0, //  EDDSpecificationIsSupported       :1;
        0, //  JapaneseNecFloppyIsSupported      :1;
        0, //  JapaneseToshibaFloppyIsSupported  :1;
        0, //  Floppy525_360IsSupported          :1;
        0, //  Floppy525_12IsSupported           :1;
        0, //  Floppy35_720IsSupported           :1;
        0, //  Floppy35_288IsSupported           :1;
        0, //  PrintScreenIsSupported            :1;
        0, //  Keyboard8042IsSupported           :1;
        1, //  SerialIsSupported                 :1;
        0, //  PrinterIsSupported                :1;
        0, //  CgaMonoIsSupported                :1;
        0, //  NecPc98                           :1;
        0 //  ReservedForVendor                 :32; ///< Bits 32-63. Bits 32-47
          //  reserved for BIOS vendor
          ///< and bits 48-63 reserved for System Vendor.
    },
    {
        // BIOSCharacteristicsExtensionBytes[]
        0x03, //  AcpiIsSupported                   :1;
              //  UsbLegacyIsSupported              :1;
              //  AgpIsSupported                    :1;
              //  I2OBootIsSupported                :1;
              //  Ls120BootIsSupported              :1;
              //  AtapiZipDriveBootIsSupported      :1;
              //  Boot1394IsSupported               :1;
              //  SmartBatteryIsSupported           :1;
              //  BIOSCharacteristicsExtensionBytes[1]
        0x0C, //  BiosBootSpecIsSupported              :1;
              //  FunctionKeyNetworkBootIsSupported    :1;
              //  TargetContentDistributionEnabled     :1;
              //  UefiSpecificationSupported           :1;
              //  VirtualMachineSupported              :1;
              //  ExtensionByte2Reserved               :3;
    },
    0,    // SystemBiosMajorRelease
    0,    // SystemBiosMinorRelease
    0xFF, // EmbeddedControllerFirmwareMajorRelease
    0xFF, // EmbeddedControllerFirmwareMinorRelease
};

CHAR8 mBiosVendor[128]  = "Renegade-Project";
CHAR8 mBiosVersion[128] = "edk2-msm";
CHAR8 mBiosDate[12]     = __DATE__;

CHAR8 *mBIOSInfoType0Strings[] = {
    mBiosVendor,  // Vendor
    mBiosVersion, // Version
    mBiosDate,    // Release Date
    NULL};

/***********************************************************************
        SMBIOS data definition  TYPE1  System Information
************************************************************************/
SMBIOS_TABLE_TYPE1 mSysInfoType1 = {
    {EFI_SMBIOS_TYPE_SYSTEM_INFORMATION, sizeof(SMBIOS_TABLE_TYPE1), 0},
    1, // Manufacturer String
    2, // ProductName String
    3, // Version String
    4, // SerialNumber String
    {0x8A95D198,
     0x7F46,
     0x11E5,
     {0xBF, 0x8B, 0x08, 0x00, 0x27, 0x04, 0xD4, 0x8E}},
    SystemWakeupTypePowerSwitch,
    5, // SKUNumber String
    6, // Family String
};

CHAR8 mSysInfoManufName[128];
CHAR8 mSysInfoProductName[128];
CHAR8 mSysInfoVersionName[128];
CHAR8 mSysInfoSerial[sizeof(UINT64) * 2 + 1] = "Serial Not Set";
CHAR8 mSysInfoSKU[sizeof(UINT64) * 2 + 1]    = "SKU Not Set";

CHAR8 *mSysInfoType1Strings[] = {
    mSysInfoManufName,
    mSysInfoProductName,
    mSysInfoVersionName,
    mSysInfoSerial,
    mSysInfoSKU,
    "Snapdragon 845 Device",
    NULL};

/***********************************************************************
        SMBIOS data definition  TYPE2  Board Information
************************************************************************/
SMBIOS_TABLE_TYPE2 mBoardInfoType2 = {
    {EFI_SMBIOS_TYPE_BASEBOARD_INFORMATION, sizeof(SMBIOS_TABLE_TYPE2), 0},
    1, // Manufacturer String
    2, // ProductName String
    3, // Version String
    4, // SerialNumber String
    5, // AssetTag String
    {
        // FeatureFlag
        1, //  Motherboard           :1;
        0, //  RequiresDaughterCard  :1;
        0, //  Removable             :1;
        0, //  Replaceable           :1;
        0, //  HotSwappable          :1;
        0, //  Reserved              :3;
    },
    6,                        // LocationInChassis String
    0,                        // ChassisHandle;
    BaseBoardTypeMotherBoard, // BoardType;
    0,                        // NumberOfContainedObjectHandles;
    {0}                       // ContainedObjectHandles[1];
};

CHAR8 mChassisAssetTag[128];

CHAR8 *mBoardInfoType2Strings[] = {
    mSysInfoManufName,
    mSysInfoProductName,
    mSysInfoVersionName,
    mSysInfoSerial,
    mChassisAssetTag,
    "Portable",
    NULL};

/***********************************************************************
        SMBIOS data definition  TYPE3  Enclosure Information
************************************************************************/
SMBIOS_TABLE_TYPE3 mEnclosureInfoType3 = {
    {EFI_SMBIOS_TYPE_SYSTEM_ENCLOSURE, sizeof(SMBIOS_TABLE_TYPE3), 0},
    1,                         // Manufacturer String
    MiscChassisTypePortable,   // Type;
    2,                         // Version String
    3,                         // SerialNumber String
    4,                         // AssetTag String
    ChassisStateSafe,          // BootupState;
    ChassisStateSafe,          // PowerSupplyState;
    ChassisStateSafe,          // ThermalState;
    ChassisSecurityStatusNone, // SecurityStatus;
    {0, 0, 0, 0},              // OemDefined[4];
    1,                         // Height;
    1,                         // NumberofPowerCords;
    0,                         // ContainedElementCount;
    0,                         // ContainedElementRecordLength;
    {{0}},                     // ContainedElements[1];
};
CHAR8 *mEnclosureInfoType3Strings[] = {
    mSysInfoManufName, mSysInfoProductName, mSysInfoSerial, mChassisAssetTag,
    NULL};

/***********************************************************************
        SMBIOS data definition  TYPE9  System Slot Information
************************************************************************/
SMBIOS_TABLE_TYPE9 mSysSlotInfoType9_0 = {
    {EFI_SMBIOS_TYPE_SYSTEM_SLOTS, sizeof(SMBIOS_TABLE_TYPE9), 0},
    1,                        // SlotDesignation String
    SlotTypePciExpressGen2X4, // SlotType;                 ///< The enumeration
                              // value from MISC_SLOT_TYPE.
    SlotDataBusWidth1X, // SlotDataBusWidth;         ///< The enumeration value
                        // from MISC_SLOT_DATA_BUS_WIDTH.
    SlotUsageUnknown,   // CurrentUsage;             ///< The enumeration value
                        // from MISC_SLOT_USAGE.
    SlotLengthShort,    // SlotLength;               ///< The enumeration value
                        // from MISC_SLOT_LENGTH.
    0,                  // SlotID;
    {
        // SlotCharacteristics1;
        1, // CharacteristicsUnknown  :1;
        0, // Provides50Volts         :1;
        0, // Provides33Volts         :1;
        0, // SharedSlot              :1;
        0, // PcCard16Supported       :1;
        0, // CardBusSupported        :1;
        0, // ZoomVideoSupported      :1;
        0, // ModemRingResumeSupported:1;
    },
    {
        // SlotCharacteristics2;
        1, // PmeSignalSupported      :1;
        0, // HotPlugDevicesSupported :1;
        1, // SmbusSignalSupported    :1;
        0, // Reserved                :5;  ///< Set to 0.
    },
    0, // SegmentGroupNum;
    2, // BusNum;
    1, // DevFuncNum;
};

SMBIOS_TABLE_TYPE9 mSysSlotInfoType9_1 = {
    {EFI_SMBIOS_TYPE_SYSTEM_SLOTS, sizeof(SMBIOS_TABLE_TYPE9), 0},
    2,                        // SlotDesignation String
    SlotTypePciExpressGen2X4, // SlotType;                 ///< The enumeration
                              // value from MISC_SLOT_TYPE.
    SlotDataBusWidth1X, // SlotDataBusWidth;         ///< The enumeration value
                        // from MISC_SLOT_DATA_BUS_WIDTH.
    SlotUsageUnknown,   // CurrentUsage;             ///< The enumeration value
                        // from MISC_SLOT_USAGE.
    SlotLengthShort,    // SlotLength;               ///< The enumeration value
                        // from MISC_SLOT_LENGTH.
    0,                  // SlotID;
    {
        // SlotCharacteristics1;
        1, // CharacteristicsUnknown  :1;
        0, // Provides50Volts         :1;
        0, // Provides33Volts         :1;
        0, // SharedSlot              :1;
        0, // PcCard16Supported       :1;
        0, // CardBusSupported        :1;
        0, // ZoomVideoSupported      :1;
        0, // ModemRingResumeSupported:1;
    },
    {
        // SlotCharacteristics2;
        1, // PmeSignalSupported      :1;
        0, // HotPlugDevicesSupported :1;
        1, // SmbusSignalSupported    :1;
        0, // Reserved                :5;  ///< Set to 0.
    },
    0, // SegmentGroupNum;
    2, // BusNum;
    2, // DevFuncNum;
};

SMBIOS_TABLE_TYPE9 mSysSlotInfoType9_2 = {
    {EFI_SMBIOS_TYPE_SYSTEM_SLOTS, sizeof(SMBIOS_TABLE_TYPE9), 0},
    3,                        // SlotDesignation String
    SlotTypePciExpressGen2X8, // SlotType;                 ///< The enumeration
                              // value from MISC_SLOT_TYPE.
    SlotDataBusWidth4X, // SlotDataBusWidth;         ///< The enumeration value
                        // from MISC_SLOT_DATA_BUS_WIDTH.
    SlotUsageUnknown,   // CurrentUsage;             ///< The enumeration value
                        // from MISC_SLOT_USAGE.
    SlotLengthShort,    // SlotLength;               ///< The enumeration value
                        // from MISC_SLOT_LENGTH.
    0,                  // SlotID;
    {
        // SlotCharacteristics1;
        1, // CharacteristicsUnknown  :1;
        0, // Provides50Volts         :1;
        0, // Provides33Volts         :1;
        0, // SharedSlot              :1;
        0, // PcCard16Supported       :1;
        0, // CardBusSupported        :1;
        0, // ZoomVideoSupported      :1;
        0, // ModemRingResumeSupported:1;
    },
    {
        // SlotCharacteristics2;
        1, // PmeSignalSupported      :1;
        0, // HotPlugDevicesSupported :1;
        1, // SmbusSignalSupported    :1;
        0, // Reserved                :5;  ///< Set to 0.
    },
    0, // SegmentGroupNum;
    2, // BusNum;
    3, // DevFuncNum;
};

SMBIOS_TABLE_TYPE9 mSysSlotInfoType9_3 = {
    {EFI_SMBIOS_TYPE_SYSTEM_SLOTS, sizeof(SMBIOS_TABLE_TYPE9), 0},
    4,                         // SlotDesignation String
    SlotTypePciExpressGen2X16, // SlotType;                 ///< The enumeration
                               // value from MISC_SLOT_TYPE.
    SlotDataBusWidth4X, // SlotDataBusWidth;         ///< The enumeration value
                        // from MISC_SLOT_DATA_BUS_WIDTH.
    SlotUsageUnknown,   // CurrentUsage;             ///< The enumeration value
                        // from MISC_SLOT_USAGE.
    SlotLengthShort,    // SlotLength;               ///< The enumeration value
                        // from MISC_SLOT_LENGTH.
    0,                  // SlotID;
    {
        // SlotCharacteristics1;
        1, // CharacteristicsUnknown  :1;
        0, // Provides50Volts         :1;
        0, // Provides33Volts         :1;
        0, // SharedSlot              :1;
        0, // PcCard16Supported       :1;
        0, // CardBusSupported        :1;
        0, // ZoomVideoSupported      :1;
        0, // ModemRingResumeSupported:1;
    },
    {
        // SlotCharacteristics2;
        1, // PmeSignalSupported      :1;
        0, // HotPlugDevicesSupported :1;
        1, // SmbusSignalSupported    :1;
        0, // Reserved                :5;  ///< Set to 0.
    },
    0,  // SegmentGroupNum;
    2,  // BusNum;
    0xC // DevFuncNum;
};

CHAR8 *mSysSlotInfoType9Strings[] = {
    "PCIE Slot 0", "PCIE Slot 1", "PCIE Slot 2", "PCIE Slot 3", NULL};

/***********************************************************************
        SMBIOS data definition  TYPE 11  OEM Strings
************************************************************************/

SMBIOS_TABLE_TYPE11 mOemStringsType11 = {
    {EFI_SMBIOS_TYPE_OEM_STRINGS, sizeof(SMBIOS_TABLE_TYPE11), 0},
    1 // StringCount
};
CHAR8 *mOemStringsType11Strings[] = {
    "https://github.com/edk2-porting/edk2-msm", NULL};

/***********************************************************************
        SMBIOS data definition  TYPE16  Physical Memory ArrayInformation
************************************************************************/
SMBIOS_TABLE_TYPE16 mPhyMemArrayInfoType16 = {
    {EFI_SMBIOS_TYPE_PHYSICAL_MEMORY_ARRAY, sizeof(SMBIOS_TABLE_TYPE16), 0},
    MemoryArrayLocationSystemBoard, // Location;                       ///< The
                                    // enumeration value from
                                    // MEMORY_ARRAY_LOCATION.
    MemoryArrayUseSystemMemory,     // Use;                            ///< The
                                    // enumeration value from MEMORY_ARRAY_USE.
    MemoryErrorCorrectionNone,      // MemoryErrorCorrection;          ///< The
                                    // enumeration value from
                                    // MEMORY_ERROR_CORRECTION.
    0x800000,                       // MaximumCapacity;
    0xFFFE,                         // MemoryErrorInformationHandle;
    1,                              // NumberOfMemoryDevices;
    0x00000000ULL,                  // ExtendedMaximumCapacity;
};
CHAR8 *mPhyMemArrayInfoType16Strings[] = {NULL};

/***********************************************************************
        SMBIOS data definition  TYPE19  Memory Array Mapped Address Information
************************************************************************/
SMBIOS_TABLE_TYPE19 mMemArrMapInfoType19 = {
    {EFI_SMBIOS_TYPE_MEMORY_ARRAY_MAPPED_ADDRESS, sizeof(SMBIOS_TABLE_TYPE19),
     0},
    0xFFFFFFFF, // StartingAddress;
    0xFFFFFFFF, // EndingAddress;
    0, // MemoryArrayHandle; // Should match SMBIOS_TABLE_TYPE16.Handle,
       // initialized at runtime, refer to PhyMemArrayInfoUpdateSmbiosType16()
    1, // PartitionWidth;
    0, // ExtendedStartingAddress;  // not used
    0, // ExtendedEndingAddress;    // not used
};
CHAR8 *mMemArrMapInfoType19Strings[] = {NULL};

/***********************************************************************
        SMBIOS data definition  TYPE32  Boot Information
************************************************************************/
SMBIOS_TABLE_TYPE32 mBootInfoType32 = {
    {EFI_SMBIOS_TYPE_SYSTEM_BOOT_INFORMATION, sizeof(SMBIOS_TABLE_TYPE32), 0},
    {0, 0, 0, 0, 0, 0},          // Reserved[6];
    BootInformationStatusNoError // BootStatus
};

CHAR8 *mBootInfoType32Strings[] = {NULL};

/**

   Create SMBIOS record.

   Converts a fixed SMBIOS structure and an array of pointers to strings into
   an SMBIOS record where the strings are cat'ed on the end of the fixed record
   and terminated via a double NULL and add to SMBIOS table.

   SMBIOS_TABLE_TYPE32 gSmbiosType12 = {
   { EFI_SMBIOS_TYPE_SYSTEM_CONFIGURATION_OPTIONS, sizeof (SMBIOS_TABLE_TYPE12),
0 }, 1 // StringCount
   };

   CHAR8 *gSmbiosType12Strings[] = {
   "Not Found",
   NULL
   };

   ...

   LogSmbiosData (
   (EFI_SMBIOS_TABLE_HEADER*)&gSmbiosType12,
   gSmbiosType12Strings
   );

   @param  Template    Fixed SMBIOS structure, required.
   @param  StringPack  Array of strings to convert to an SMBIOS string pack.
   NULL is OK.
   @param  DataSmbiosHandle  The new SMBIOS record handle.
   NULL is OK.
**/

EFI_STATUS
EFIAPI
LogSmbiosData(
    IN EFI_SMBIOS_TABLE_HEADER *Template, IN CHAR8 **StringPack,
    OUT EFI_SMBIOS_HANDLE *DataSmbiosHandle)
{
  EFI_STATUS               Status;
  EFI_SMBIOS_PROTOCOL *    Smbios;
  EFI_SMBIOS_HANDLE        SmbiosHandle;
  EFI_SMBIOS_TABLE_HEADER *Record;
  UINTN                    Index;
  UINTN                    StringSize;
  UINTN                    Size;
  CHAR8 *                  Str;

  //
  // Locate Smbios protocol.
  //
  Status = gBS->LocateProtocol(&gEfiSmbiosProtocolGuid, NULL, (VOID **)&Smbios);

  if (EFI_ERROR(Status)) {
    return Status;
  }

  // Calculate the size of the fixed record and optional string pack

  Size = Template->Length;
  if (StringPack == NULL) {
    // At least a double null is required
    Size += 2;
  }
  else {
    for (Index = 0; StringPack[Index] != NULL; Index++) {
      StringSize = AsciiStrSize(StringPack[Index]);
      Size += StringSize;
    }
    if (StringPack[0] == NULL) {
      // At least a double null is required
      Size += 1;
    }

    // Don't forget the terminating double null
    Size += 1;
  }

  // Copy over Template
  Record = (EFI_SMBIOS_TABLE_HEADER *)AllocateZeroPool(Size);
  if (Record == NULL) {
    return EFI_OUT_OF_RESOURCES;
  }
  CopyMem(Record, Template, Template->Length);

  // Append string pack
  Str = ((CHAR8 *)Record) + Record->Length;

  for (Index = 0; StringPack[Index] != NULL; Index++) {
    StringSize = AsciiStrSize(StringPack[Index]);
    CopyMem(Str, StringPack[Index], StringSize);
    Str += StringSize;
  }

  *Str         = 0;
  SmbiosHandle = SMBIOS_HANDLE_PI_RESERVED;
  Status       = Smbios->Add(Smbios, gImageHandle, &SmbiosHandle, Record);

  if ((Status == EFI_SUCCESS) && (DataSmbiosHandle != NULL)) {
    *DataSmbiosHandle = SmbiosHandle;
  }

  ASSERT_EFI_ERROR(Status);
  FreePool(Record);
  return Status;
}

EFI_STATUS
EFIAPI
PlatformSmbiosDriverEntryPoint(
    IN EFI_HANDLE ImageHandle, IN EFI_SYSTEM_TABLE *SystemTable)
{
  EFI_SMBIOS_HANDLE SmbiosHandle;
  UINTN Node = 0;
  UINTN MemoryBase = 0;
  UINTN MemorySize = 0;
  VOID *Fdt;
  CHAR8 *Serial;

  Fdt = GetFdt ();
  ASSERT(Fdt != NULL);

  // TYPE0 BIOS Information
  AsciiSPrint(
      mBiosVersion, sizeof(mBiosVersion), "edk2-msm %s",
      (CHAR16 *)FixedPcdGetPtr(PcdFirmwareVersionString));
  LogSmbiosData(
      (EFI_SMBIOS_TABLE_HEADER *)&mBIOSInfoType0, mBIOSInfoType0Strings, NULL);

  // TYPE1 System Information
  AsciiStrCpyS(
      mSysInfoManufName, sizeof(mSysInfoManufName),
      (CHAR8 *)PcdGetPtr(PcdDeviceVendor));
  AsciiStrCpyS(
      mSysInfoProductName, sizeof(mSysInfoProductName),
      (CHAR8 *)PcdGetPtr(PcdDeviceProduct));
  AsciiStrCpyS(
      mSysInfoVersionName, sizeof(mSysInfoVersionName),
      (CHAR8 *)PcdGetPtr(PcdDeviceCodeName));
  Serial = param_get_android_serial_number (fdt_get_cmdline_items (Fdt, NULL));
  if (Serial != NULL) {
    DEBUG((EFI_D_INFO, "Android Serial Number: %a\n", Serial));
    ZeroMem(mSysInfoSerial, sizeof(mSysInfoSerial));
    AsciiStrCpyS(
        mSysInfoSerial, sizeof(mSysInfoSerial),
        Serial);
  }
  LogSmbiosData(
      (EFI_SMBIOS_TABLE_HEADER *)&mSysInfoType1, mSysInfoType1Strings, NULL);

  // TYPE3 Enclosure Information
  LogSmbiosData(
      (EFI_SMBIOS_TABLE_HEADER *)&mEnclosureInfoType3,
      mEnclosureInfoType3Strings, &SmbiosHandle);
  mBoardInfoType2.ChassisHandle = (UINT16)SmbiosHandle;

  // TYPE2 Board Information
  LogSmbiosData(
      (EFI_SMBIOS_TABLE_HEADER *)&mBoardInfoType2, mBoardInfoType2Strings,
      NULL);

  // TYPE9 System Slot Information
  LogSmbiosData(
      (EFI_SMBIOS_TABLE_HEADER *)&mSysSlotInfoType9_0, mSysSlotInfoType9Strings,
      NULL);
  LogSmbiosData(
      (EFI_SMBIOS_TABLE_HEADER *)&mSysSlotInfoType9_1, mSysSlotInfoType9Strings,
      NULL);
  LogSmbiosData(
      (EFI_SMBIOS_TABLE_HEADER *)&mSysSlotInfoType9_2, mSysSlotInfoType9Strings,
      NULL);
  LogSmbiosData(
      (EFI_SMBIOS_TABLE_HEADER *)&mSysSlotInfoType9_3, mSysSlotInfoType9Strings,
      NULL);

  // TYPE11 OEM Strings
  LogSmbiosData(
      (EFI_SMBIOS_TABLE_HEADER *)&mOemStringsType11, mOemStringsType11Strings,
      NULL);

  // TYPE16 Physical Memory Array Information
  LogSmbiosData(
      (EFI_SMBIOS_TABLE_HEADER *)&mPhyMemArrayInfoType16,
      mPhyMemArrayInfoType16Strings, &SmbiosHandle);
  mMemArrMapInfoType19.MemoryArrayHandle = SmbiosHandle;

  RegisterSOCSmbiosInfo(LogSmbiosData, SmbiosHandle);

  // TYPE19 Memory Array Map Information

  while (fdt_get_memory(Fdt, (int)Node, (uint64_t*)&MemoryBase, (uint64_t*)&MemorySize)) {
    mMemArrMapInfoType19.StartingAddress = RShiftU64(MemoryBase, 10);
    mMemArrMapInfoType19.EndingAddress = mMemArrMapInfoType19.StartingAddress + RShiftU64(MemorySize, 10);
    LogSmbiosData(
        (EFI_SMBIOS_TABLE_HEADER *)&mMemArrMapInfoType19,
        mMemArrMapInfoType19Strings, NULL);
    Node++;
  }

  // TYPE32 Boot Information
  LogSmbiosData(
      (EFI_SMBIOS_TABLE_HEADER *)&mBootInfoType32, mBootInfoType32Strings,
      NULL);

  return EFI_SUCCESS;
}
