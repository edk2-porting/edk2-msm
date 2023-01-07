#include <Base.h>
#include <Guid/SmBios.h>
#include <IndustryStandard/SmBios.h>
#include <Protocol/Smbios.h>
#include <Library/SOCSmbiosInfoLib.h>

/***********************************************************************
        SMBIOS data definition  TYPE4  Processor Information
************************************************************************/
SMBIOS_TABLE_TYPE4 mProcessorInfoType4_a76_big = {
    {EFI_SMBIOS_TYPE_PROCESSOR_INFORMATION, sizeof(SMBIOS_TABLE_TYPE4), 0},
    1,                // Socket String
    CentralProcessor, // ProcessorType;          ///< The enumeration value from
                      // PROCESSOR_TYPE_DATA.
    ProcessorFamilyIndicatorFamily2, // ProcessorFamily;        ///< The
                                     // enumeration value from
                                     // PROCESSOR_FAMILY2_DATA.
    2,                               // ProcessorManufacture String;
    {                                // ProcessorId;
     {0x00, 0x00, 0x00, 0x00},
     {0x00, 0x00, 0x00, 0x00}},
    3, // ProcessorVersion String;
    {
        // Voltage;
        0, // ProcessorVoltageCapability5V        :1;
        0, // ProcessorVoltageCapability3_3V      :1;
        0, // ProcessorVoltageCapability2_9V      :1;
        0, // ProcessorVoltageCapabilityReserved  :1; ///< Bit 3, must be zero.
        0, // ProcessorVoltageReserved            :3; ///< Bits 4-6, must be
           // zero.
        1  // ProcessorVoltageIndicateLegacy      :1;
    },
    0,                     // ExternalClock;
    2840,                  // MaxSpeed;
    2840,                  // CurrentSpeed;
    0x41,                  // Status;
    ProcessorUpgradeOther, // ProcessorUpgrade;         ///< The enumeration
                           // value from PROCESSOR_UPGRADE.
    0,                     // L1CacheHandle;
    0,                     // L2CacheHandle;
    0xFFFF,                // L3CacheHandle;
    0,                     // SerialNumber;
    0,                     // AssetTag;
    7,                     // PartNumber;
    1,                     // CoreCount;
    1,                     // EnabledCoreCount;
    0,                     // ThreadCount;
    0xEC, // ProcessorCharacteristics; ///< The enumeration value from
          // PROCESSOR_CHARACTERISTIC_FLAGS ProcessorReserved1              :1;
          // ProcessorUnknown                :1;
          // Processor64BitCapble            :1;
          // ProcessorMultiCore              :1;
          // ProcessorHardwareThread         :1;
          // ProcessorExecuteProtection      :1;
          // ProcessorEnhancedVirtualization :1;
          // ProcessorPowerPerformanceCtrl    :1;
          // Processor128bitCapble            :1;
          // ProcessorReserved2               :7;
    ProcessorFamilyARM, // ARM Processor Family;
    0,                  // CoreCount2;
    0,                  // EnabledCoreCount2;
    0,                  // ThreadCount2;
};

SMBIOS_TABLE_TYPE4 mProcessorInfoType4_a76 = {
    {EFI_SMBIOS_TYPE_PROCESSOR_INFORMATION, sizeof(SMBIOS_TABLE_TYPE4), 0},
    1,                // Socket String
    CentralProcessor, // ProcessorType;          ///< The enumeration value from
                      // PROCESSOR_TYPE_DATA.
    ProcessorFamilyIndicatorFamily2, // ProcessorFamily;        ///< The
                                     // enumeration value from
                                     // PROCESSOR_FAMILY2_DATA.
    2,                               // ProcessorManufacture String;
    {                                // ProcessorId;
     {0x00, 0x00, 0x00, 0x00},
     {0x00, 0x00, 0x00, 0x00}},
    3, // ProcessorVersion String;
    {
        // Voltage;
        0, // ProcessorVoltageCapability5V        :1;
        0, // ProcessorVoltageCapability3_3V      :1;
        0, // ProcessorVoltageCapability2_9V      :1;
        0, // ProcessorVoltageCapabilityReserved  :1; ///< Bit 3, must be zero.
        0, // ProcessorVoltageReserved            :3; ///< Bits 4-6, must be
           // zero.
        1  // ProcessorVoltageIndicateLegacy      :1;
    },
    0,                     // ExternalClock;
    2420,                  // MaxSpeed;
    2420,                  // CurrentSpeed;
    0x41,                  // Status;
    ProcessorUpgradeOther, // ProcessorUpgrade;         ///< The enumeration
                           // value from PROCESSOR_UPGRADE.
    0,                     // L1CacheHandle;
    0,                     // L2CacheHandle;
    0xFFFF,                // L3CacheHandle;
    0,                     // SerialNumber;
    0,                     // AssetTag;
    7,                     // PartNumber;
    3,                     // CoreCount;
    3,                     // EnabledCoreCount;
    0,                     // ThreadCount;
    0xEC, // ProcessorCharacteristics; ///< The enumeration value from
          // PROCESSOR_CHARACTERISTIC_FLAGS ProcessorReserved1              :1;
          // ProcessorUnknown                :1;
          // Processor64BitCapble            :1;
          // ProcessorMultiCore              :1;
          // ProcessorHardwareThread         :1;
          // ProcessorExecuteProtection      :1;
          // ProcessorEnhancedVirtualization :1;
          // ProcessorPowerPerformanceCtrl    :1;
          // Processor128bitCapble            :1;
          // ProcessorReserved2               :7;
    ProcessorFamilyARM, // ARM Processor Family;
    0,                  // CoreCount2;
    0,                  // EnabledCoreCount2;
    0,                  // ThreadCount2;
};

SMBIOS_TABLE_TYPE4 mProcessorInfoType4_a55 = {
    {EFI_SMBIOS_TYPE_PROCESSOR_INFORMATION, sizeof(SMBIOS_TABLE_TYPE4), 0},
    1,                // Socket String
    CentralProcessor, // ProcessorType;          ///< The enumeration value from
                      // PROCESSOR_TYPE_DATA.
    ProcessorFamilyIndicatorFamily2, // ProcessorFamily;        ///< The
                                     // enumeration value from
                                     // PROCESSOR_FAMILY2_DATA.
    2,                               // ProcessorManufacture String;
    {                                // ProcessorId;
     {0x00, 0x00, 0x00, 0x00},
     {0x00, 0x00, 0x00, 0x00}},
    3, // ProcessorVersion String;
    {
        // Voltage;
        0, // ProcessorVoltageCapability5V        :1;
        0, // ProcessorVoltageCapability3_3V      :1;
        0, // ProcessorVoltageCapability2_9V      :1;
        0, // ProcessorVoltageCapabilityReserved  :1; ///< Bit 3, must be zero.
        0, // ProcessorVoltageReserved            :3; ///< Bits 4-6, must be
           // zero.
        1  // ProcessorVoltageIndicateLegacy      :1;
    },
    0,                     // ExternalClock;
    1800,                  // MaxSpeed;
    1800,                  // CurrentSpeed;
    0x41,                  // Status;
    ProcessorUpgradeOther, // ProcessorUpgrade;         ///< The enumeration
                           // value from PROCESSOR_UPGRADE.
    0,                     // L1CacheHandle;
    0,                     // L2CacheHandle;
    0xFFFF,                // L3CacheHandle;
    0,                     // SerialNumber;
    0,                     // AssetTag;
    6,                     // PartNumber;
    4,                     // CoreCount;
    4,                     // EnabledCoreCount;
    0,                     // ThreadCount;
    0xEC, // ProcessorCharacteristics; ///< The enumeration value from
          // PROCESSOR_CHARACTERISTIC_FLAGS ProcessorReserved1              :1;
          // ProcessorUnknown                :1;
          // Processor64BitCapble            :1;
          // ProcessorMultiCore              :1;
          // ProcessorHardwareThread         :1;
          // ProcessorExecuteProtection      :1;
          // ProcessorEnhancedVirtualization :1;
          // ProcessorPowerPerformanceCtrl    :1;
          // Processor128bitCapble            :1;
          // ProcessorReserved2               :7;
    ProcessorFamilyARM, // ARM Processor Family;
    0,                  // CoreCount2;
    0,                  // EnabledCoreCount2;
    0,                  // ThreadCount2;
};

CHAR8 mCpuName[128] = "Qualcomm Snapdragon SM8150";

CHAR8 *mProcessorInfoType4Strings[] = {
    "BGA", "Qualcomm", "Snapdragon SM8150", NULL};

/***********************************************************************
        SMBIOS data definition  TYPE7  Cache Information
************************************************************************/
SMBIOS_TABLE_TYPE7 mCacheInfoType7_a76_L1I = {
    {EFI_SMBIOS_TYPE_CACHE_INFORMATION, sizeof(SMBIOS_TABLE_TYPE7), 0},
    1,     // SocketDesignation String
    0x380, // Cache Configuration
           // Cache Level        :3  (L1)
           // Cache Socketed     :1  (Not Socketed)
           // Reserved           :1
           // Location           :2  (Internal)
           // Enabled/Disabled   :1  (Enabled)
           // Operational Mode   :2  (Unknown)
           // Reserved           :6
    0x0030, // Maximum Size
    0x0030, // Install Size
    {
        // Supported SRAM Type
        0, // Other             :1
        1, // Unknown           :1
        0, // NonBurst          :1
        0, // Burst             :1
        0, // PiplelineBurst    :1
        0, // Synchronous       :1
        0, // Asynchronous      :1
        0  // Reserved          :9
    },
    {
        // Current SRAM Type
        0, // Other             :1
        1, // Unknown           :1
        0, // NonBurst          :1
        0, // Burst             :1
        0, // PiplelineBurst    :1
        0, // Synchronous       :1
        0, // Asynchronous      :1
        0  // Reserved          :9
    },
    0,                      // Cache Speed unknown
    CacheErrorParity,       // Error Correction
    CacheTypeInstruction,   // System Cache Type
    CacheAssociativityOther // Associativity
};

SMBIOS_TABLE_TYPE7 mCacheInfoType7_a55_L1I = {
    {EFI_SMBIOS_TYPE_CACHE_INFORMATION, sizeof(SMBIOS_TABLE_TYPE7), 0},
    1,     // SocketDesignation String
    0x380, // Cache Configuration
           // Cache Level        :3  (L1)
           // Cache Socketed     :1  (Not Socketed)
           // Reserved           :1
           // Location           :2  (Internal)
           // Enabled/Disabled   :1  (Enabled)
           // Operational Mode   :2  (Unknown)
           // Reserved           :6
    0x0030, // Maximum Size
    0x0030, // Install Size
    {
        // Supported SRAM Type
        0, // Other             :1
        1, // Unknown           :1
        0, // NonBurst          :1
        0, // Burst             :1
        0, // PiplelineBurst    :1
        0, // Synchronous       :1
        0, // Asynchronous      :1
        0  // Reserved          :9
    },
    {
        // Current SRAM Type
        0, // Other             :1
        1, // Unknown           :1
        0, // NonBurst          :1
        0, // Burst             :1
        0, // PiplelineBurst    :1
        0, // Synchronous       :1
        0, // Asynchronous      :1
        0  // Reserved          :9
    },
    0,                     // Cache Speed unknown
    CacheErrorParity,      // Error Correction
    CacheTypeInstruction,  // System Cache Type
    CacheAssociativity2Way // Associativity
};
CHAR8 *mCacheInfoType7Strings[] = {"L1 Instruction", "L1 Data", "L2", NULL};

SMBIOS_TABLE_TYPE7 mCacheInfoType7_a76_L1D = {
    {EFI_SMBIOS_TYPE_CACHE_INFORMATION, sizeof(SMBIOS_TABLE_TYPE7), 0},
    2,     // SocketDesignation String
    0x180, // Cache Configuration
           // Cache Level        :3  (L1)
           // Cache Socketed     :1  (Not Socketed)
           // Reserved           :1
           // Location           :2  (Internal)
           // Enabled/Disabled   :1  (Enabled)
           // Operational Mode   :2  (WB)
           // Reserved           :6
    0x0020, // Maximum Size
    0x0020, // Install Size
    {
        // Supported SRAM Type
        0, // Other             :1
        1, // Unknown           :1
        0, // NonBurst          :1
        0, // Burst             :1
        0, // PiplelineBurst    :1
        0, // Synchronous       :1
        0, // Asynchronous      :1
        0  // Reserved          :9
    },
    {
        // Current SRAM Type
        0, // Other             :1
        1, // Unknown           :1
        0, // NonBurst          :1
        0, // Burst             :1
        0, // PiplelineBurst    :1
        0, // Synchronous       :1
        0, // Asynchronous      :1
        0  // Reserved          :9
    },
    0,                     // Cache Speed unknown
    CacheErrorSingleBit,   // Error Correction
    CacheTypeData,         // System Cache Type
    CacheAssociativity2Way // Associativity
};

SMBIOS_TABLE_TYPE7 mCacheInfoType7_a55_L1D = {
    {EFI_SMBIOS_TYPE_CACHE_INFORMATION, sizeof(SMBIOS_TABLE_TYPE7), 0},
    2,     // SocketDesignation String
    0x180, // Cache Configuration
           // Cache Level        :3  (L1)
           // Cache Socketed     :1  (Not Socketed)
           // Reserved           :1
           // Location           :2  (Internal)
           // Enabled/Disabled   :1  (Enabled)
           // Operational Mode   :2  (WB)
           // Reserved           :6
    0x0020, // Maximum Size
    0x0020, // Install Size
    {
        // Supported SRAM Type
        0, // Other             :1
        1, // Unknown           :1
        0, // NonBurst          :1
        0, // Burst             :1
        0, // PiplelineBurst    :1
        0, // Synchronous       :1
        0, // Asynchronous      :1
        0  // Reserved          :9
    },
    {
        // Current SRAM Type
        0, // Other             :1
        1, // Unknown           :1
        0, // NonBurst          :1
        0, // Burst             :1
        0, // PiplelineBurst    :1
        0, // Synchronous       :1
        0, // Asynchronous      :1
        0  // Reserved          :9
    },
    0,                     // Cache Speed unknown
    CacheErrorSingleBit,   // Error Correction
    CacheTypeData,         // System Cache Type
    CacheAssociativity4Way // Associativity
};

SMBIOS_TABLE_TYPE7 mCacheInfoType7_a76_L2 = {
    {EFI_SMBIOS_TYPE_CACHE_INFORMATION, sizeof(SMBIOS_TABLE_TYPE7), 0},
    3,      // SocketDesignation String
    0x0181, // Cache Configuration
            // Cache Level        :3  (L2)
            // Cache Socketed     :1  (Not Socketed)
            // Reserved           :1
            // Location           :2  (Internal)
            // Enabled/Disabled   :1  (Enabled)
            // Operational Mode   :2  (WB)
            // Reserved           :6
    0x0800, // Maximum Size
    0x0800, // Install Size
    {
        // Supported SRAM Type
        0, // Other             :1
        0, // Unknown           :1
        1, // NonBurst          :1
        0, // Burst             :1
        0, // PiplelineBurst    :1
        0, // Synchronous       :1
        0, // Asynchronous      :1
        0  // Reserved          :9
    },
    {
        // Current SRAM Type
        0, // Other             :1
        0, // Unknown           :1
        1, // NonBurst          :1
        0, // Burst             :1
        0, // PiplelineBurst    :1
        0, // Synchronous       :1
        0, // Asynchronous      :1
        0  // Reserved          :9
    },
    0,                      // Cache Speed unknown
    CacheErrorSingleBit,    // Error Correction Multi
    CacheTypeUnified,       // System Cache Type
    CacheAssociativity16Way // Associativity
};

SMBIOS_TABLE_TYPE7 mCacheInfoType7_a55_L2 = {
    {EFI_SMBIOS_TYPE_CACHE_INFORMATION, sizeof(SMBIOS_TABLE_TYPE7), 0},
    3,      // SocketDesignation String
    0x0181, // Cache Configuration
            // Cache Level        :3  (L2)
            // Cache Socketed     :1  (Not Socketed)
            // Reserved           :1
            // Location           :2  (Internal)
            // Enabled/Disabled   :1  (Enabled)
            // Operational Mode   :2  (WB)
            // Reserved           :6
    0x0800, // Maximum Size
    0x0800, // Install Size
    {
        // Supported SRAM Type
        0, // Other             :1
        1, // Unknown           :1
        0, // NonBurst          :1
        0, // Burst             :1
        0, // PiplelineBurst    :1
        0, // Synchronous       :1
        0, // Asynchronous      :1
        0  // Reserved          :9
    },
    {
        // Current SRAM Type
        0, // Other             :1
        0, // Unknown           :1
        1, // NonBurst          :1
        0, // Burst             :1
        0, // PiplelineBurst    :1
        0, // Synchronous       :1
        0, // Asynchronous      :1
        0  // Reserved          :9
    },
    0,                      // Cache Speed unknown
    CacheErrorSingleBit,    // Error Correction Multi
    CacheTypeUnified,       // System Cache Type
    CacheAssociativity16Way // Associativity
};

/***********************************************************************
        SMBIOS data definition  TYPE17  Memory Device Information
************************************************************************/
SMBIOS_TABLE_TYPE17 mMemDevInfoType17 = {
    {EFI_SMBIOS_TYPE_MEMORY_DEVICE, sizeof(SMBIOS_TABLE_TYPE17), 0},
    0, // MemoryArrayHandle; // Should match SMBIOS_TABLE_TYPE16.Handle,
       // initialized at runtime, refer to PhyMemArrayInfoUpdateSmbiosType16()
    0xFFFE, // MemoryErrorInformationHandle; (not provided)
    64,     // TotalWidth; (unknown)
    64,     // DataWidth; (unknown)
    0x2000, // Size; // When bit 15 is 0: Size in MB
            // When bit 15 is 1: Size in KB, and continues in ExtendedSize
            // initialized at runtime, refer to
            // PhyMemArrayInfoUpdateSmbiosType16()
    MemoryFormFactorRowOfChips, // FormFactor;                     ///< The
                                // enumeration value from MEMORY_FORM_FACTOR.
    0,                          // DeviceSet;
    1,                          // DeviceLocator String
    2,                          // BankLocator String
    MemoryTypeLpddr4, // MemoryType;                     ///< The enumeration
                      // value from MEMORY_DEVICE_TYPE.
    {
        // TypeDetail;
        0, // Reserved        :1;
        0, // Other           :1;
        0, // Unknown         :1;
        0, // FastPaged       :1;
        0, // StaticColumn    :1;
        0, // PseudoStatic    :1;
        0, // Rambus          :1;
        0, // Synchronous     :1;
        0, // Cmos            :1;
        0, // Edo             :1;
        0, // WindowDram      :1;
        0, // CacheDram       :1;
        0, // Nonvolatile     :1;
        0, // Registered      :1;
        1, // Unbuffered      :1;
        0, // Reserved1       :1;
    },
    2133,                 // Speed; (unknown)
    2,                    // Manufacturer String
    0,                    // SerialNumber String
    0,                    // AssetTag String
    0,                    // PartNumber String
    0,                    // Attributes; (unknown rank)
    0,                    // ExtendedSize; (since Size < 32GB-1)
    0,                    // ConfiguredMemoryClockSpeed; (unknown)
    0,                    // MinimumVoltage; (unknown)
    0,                    // MaximumVoltage; (unknown)
    0,                    // ConfiguredVoltage; (unknown)
    MemoryTechnologyDram, // MemoryTechnology                 ///< The
                          // enumeration value from MEMORY_DEVICE_TECHNOLOGY
    {{
        // MemoryOperatingModeCapability
        0, // Reserved                        :1;
        0, // Other                           :1;
        0, // Unknown                         :1;
        1, // VolatileMemory                  :1;
        0, // ByteAccessiblePersistentMemory  :1;
        0, // BlockAccessiblePersistentMemory :1;
        0  // Reserved                        :10;
    }},
    0,                     // FirwareVersion
    0,                     // ModuleManufacturerID (unknown)
    0,                     // ModuleProductID (unknown)
    0,                     // MemorySubsystemControllerManufacturerID (unknown)
    0,                     // MemorySubsystemControllerProductID (unknown)
    0,                     // NonVolatileSize
    0xFFFFFFFFFFFFFFFFULL, // VolatileSize // initialized at runtime, refer to
                           // PhyMemArrayInfoUpdateSmbiosType16()
    0,                     // CacheSize
    0,                     // LogicalSize (since MemoryType is not
                           // MemoryTypeLogicalNonVolatileDevice)
    0,                     // ExtendedSpeed,
    0                      // ExtendedConfiguredMemorySpeed
};
CHAR8 *mMemDevInfoType17Strings[] = {"Builtin", "BANK 0", NULL};

VOID RegisterSOCSmbiosInfo(
	SMBIOS_LOG_SMBIOS_DATA LogSmbiosData,
	EFI_SMBIOS_HANDLE Type16
){
  EFI_SMBIOS_HANDLE SmbiosHandle;
  // TYPE7 Cache Information
  LogSmbiosData(
      (EFI_SMBIOS_TABLE_HEADER *)&mCacheInfoType7_a76_L1I,
      mCacheInfoType7Strings, NULL);
  LogSmbiosData(
      (EFI_SMBIOS_TABLE_HEADER *)&mCacheInfoType7_a55_L1I,
      mCacheInfoType7Strings, NULL);

  LogSmbiosData(
      (EFI_SMBIOS_TABLE_HEADER *)&mCacheInfoType7_a76_L1D,
      mCacheInfoType7Strings, &SmbiosHandle);
  mProcessorInfoType4_a76_big.L1CacheHandle = (UINT16)SmbiosHandle;
  mProcessorInfoType4_a76.L1CacheHandle = (UINT16)SmbiosHandle;

  LogSmbiosData(
      (EFI_SMBIOS_TABLE_HEADER *)&mCacheInfoType7_a55_L1D,
      mCacheInfoType7Strings, &SmbiosHandle);
  mProcessorInfoType4_a55.L1CacheHandle = (UINT16)SmbiosHandle;

  LogSmbiosData(
      (EFI_SMBIOS_TABLE_HEADER *)&mCacheInfoType7_a76_L2,
      mCacheInfoType7Strings, &SmbiosHandle);
  mProcessorInfoType4_a76_big.L2CacheHandle = (UINT16)SmbiosHandle;
  mProcessorInfoType4_a76.L2CacheHandle = (UINT16)SmbiosHandle;

  LogSmbiosData(
      (EFI_SMBIOS_TABLE_HEADER *)&mCacheInfoType7_a55_L2,
      mCacheInfoType7Strings, &SmbiosHandle);
  mProcessorInfoType4_a55.L2CacheHandle = (UINT16)SmbiosHandle;

  // Update string table before proceeds
  mProcessorInfoType4Strings[2] =
      (CHAR8 *)FixedPcdGetPtr(PcdSmbiosProcessorModel);
      
  // TYPE4 Processor Information
  LogSmbiosData(
      (EFI_SMBIOS_TABLE_HEADER *)&mProcessorInfoType4_a76_big,
      mProcessorInfoType4Strings, NULL);
  LogSmbiosData(
      (EFI_SMBIOS_TABLE_HEADER *)&mProcessorInfoType4_a76,
      mProcessorInfoType4Strings, NULL);
  LogSmbiosData(
      (EFI_SMBIOS_TABLE_HEADER *)&mProcessorInfoType4_a55,
      mProcessorInfoType4Strings, NULL);

  // TYPE17 Memory Device Information
  mMemDevInfoType17.MemoryArrayHandle    = Type16;
  LogSmbiosData(
      (EFI_SMBIOS_TABLE_HEADER *)&mMemDevInfoType17, mMemDevInfoType17Strings,
      NULL);
}
