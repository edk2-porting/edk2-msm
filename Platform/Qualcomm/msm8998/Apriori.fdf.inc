APRIORI DXE {

  #
  # PI DXE Drivers producing Architectural Protocols (EFI Services)
  #
  INF MdeModulePkg/Universal/PCD/Dxe/Pcd.inf
  INF MdeModulePkg/Core/Dxe/DxeMain.inf
  INF MdeModulePkg/Universal/ReportStatusCodeRouter/RuntimeDxe/ReportStatusCodeRouterRuntimeDxe.inf
  INF MdeModulePkg/Universal/StatusCodeHandler/RuntimeDxe/StatusCodeHandlerRuntimeDxe.inf
  INF MdeModulePkg/Core/RuntimeDxe/RuntimeDxe.inf
  INF ArmPkg/Drivers/CpuDxe/CpuDxe.inf
  INF ArmPkg/Drivers/ArmGic/ArmGicDxe.inf
  INF MdeModulePkg/Universal/SecurityStubDxe/SecurityStubDxe.inf

  INF MdeModulePkg/Universal/CapsuleRuntimeDxe/CapsuleRuntimeDxe.inf

  FILE DRIVER = f541d663-4a48-40aa-aabf-ff158ccae34c {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/SmemDxe/SmemDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/SmemDxe/SmemDxe.efi
    SECTION UI = "SmemDxe"
  }

  FILE DRIVER = 8e9bd160-b184-11df-94e2-0800200c9a66 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/DALSys/DALSys.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/DALSys/DALSys.efi
    SECTION UI = "DALSys"
  }

  FILE DRIVER = af9763a2-033b-4109-8e17-56a98d380c92 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/HWIODxeDriver/HWIODxeDriver.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/HWIODxeDriver/HWIODxeDriver.efi
    SECTION UI = "HWIODxeDriver"
  }

  FILE DRIVER = 10e193df-9966-44e7-b17c-59dd831e20fc {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/ChipInfo/ChipInfo.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/ChipInfo/ChipInfo.efi
    SECTION UI = "ChipInfo"
  }

  FILE DRIVER = b105211b-bbbd-4add-a3b0-d1cf4a52154c {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/PlatformInfoDxeDriver/PlatformInfoDxeDriver.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/PlatformInfoDxeDriver/PlatformInfoDxeDriver.efi
    SECTION UI = "PlatformInfoDxeDriver"
  }

  INF EmbeddedPkg/MetronomeDxe/MetronomeDxe.inf
  INF ArmPkg/Drivers/TimerDxe/TimerDxe.inf

  FILE DRIVER = 7942a7eb-b7d5-4e2e-b908-831e4de55b58 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/GlinkDxe/GlinkDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/GlinkDxe/GlinkDxe.efi
    SECTION UI = "GlinkDxe"
  }

  FILE DRIVER = e43128a8-8692-42b6-8afa-676158578d18 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/ULogDxe/ULogDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/ULogDxe/ULogDxe.efi
    SECTION UI = "ULogDxe"
  }

  FILE DRIVER = cb29f4d1-7f37-4692-a416-93e82e219711 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/NpaDxe/NpaDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/NpaDxe/NpaDxe.efi
    SECTION UI = "NpaDxe"
  }

  FILE DRIVER = 4db5dea6-5302-4d1a-8a82-677a683b0d29 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/ClockDxe/ClockDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/ClockDxe/ClockDxe.efi
    SECTION UI = "ClockDxe"
  }

  INF MdeModulePkg/Universal/Disk/DiskIoDxe/DiskIoDxe.inf
  INF MdeModulePkg/Universal/Disk/PartitionDxe/PartitionDxe.inf

  FILE DRIVER = 0d35cd8e-97ea-4f9a-96af-0f0d89f76567 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/UFSDxe/UFSDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/UFSDxe/UFSDxe.efi
    SECTION UI = "UFSDxe"
  }

  INF FatPkg/EnhancedFatDxe/Fat.inf
  INF MdeModulePkg/Universal/Disk/UnicodeCollation/EnglishDxe/EnglishDxe.inf
  INF MdeModulePkg/Universal/FvSimpleFileSystemDxe/FvSimpleFileSystemDxe.inf

  FILE DRIVER = 8681cc5a-0df6-441e-b4b8-e915c538f067 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/DALTLMM/DALTLMM.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/DALTLMM/DALTLMM.efi
    SECTION UI = "DALTLMM"
  }

  FILE DRIVER = 2a7b4bef-80cd-49e1-b473-374ba4d673fc {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/SPMI/SPMI.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/SPMI/SPMI.efi
    SECTION UI = "SPMI"
  }

  INF MdeModulePkg/Universal/Variable/RuntimeDxe/VariableRuntimeDxe.inf
  INF EmbeddedPkg/EmbeddedMonotonicCounter/EmbeddedMonotonicCounter.inf
  INF MdeModulePkg/Universal/ResetSystemRuntimeDxe/ResetSystemRuntimeDxe.inf
  INF EmbeddedPkg/RealTimeClockRuntimeDxe/RealTimeClockRuntimeDxe.inf
  INF MdeModulePkg/Universal/PrintDxe/PrintDxe.inf
  INF MdeModulePkg/Universal/DevicePathDxe/DevicePathDxe.inf
  INF MdeModulePkg/Universal/HiiDatabaseDxe/HiiDatabaseDxe.inf
  
!if $(SECURE_BOOT_ENABLE) == TRUE
  INF SecurityPkg/VariableAuthenticated/SecureBootConfigDxe/SecureBootConfigDxe.inf
  INF SecurityPkg/VariableAuthenticated/SecureBootDefaultKeysDxe/SecureBootDefaultKeysDxe.inf
!endif

  INF MdeModulePkg/Universal/BdsDxe/BdsDxe.inf  

  INF MdeModulePkg/Universal/WatchdogTimerDxe/WatchdogTimer.inf

  FILE DRIVER = F10F76DB-42C1-533F-34A8-69BE24653110 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/SdccDxe/SdccDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/SdccDxe/SdccDxe.efi
    SECTION UI = "SdccDxe"
  }

  FILE DRIVER = C44697D5-B4AA-4030-9749-29860844183D {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/PmicDxe/PmicDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/PmicDxe/PmicDxe.efi
    SECTION UI = "PmicDxe"
  }

  FILE DRIVER = 7a32bd23-f735-4f57-aa1a-447d2fe3be0d {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/SPI/SPI.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/SPI/SPI.efi
    SECTION UI = "SPI"
  }

  FILE DRIVER = 04de8591-d2b3-4077-bbbe-b12070094eb6 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/I2C/I2C.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/I2C/I2C.efi
    SECTION UI = "I2C"
  }

  INF EmbeddedPkg/SimpleTextInOutSerial/SimpleTextInOutSerial.inf
  INF MdeModulePkg/Universal/Console/ConPlatformDxe/ConPlatformDxe.inf
  INF MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitterDxe.inf
  INF MdeModulePkg/Universal/Console/GraphicsConsoleDxe/GraphicsConsoleDxe.inf

  // The path is wrong. I hope it works as Apriori.
  FILE DRIVER = 5BD181DB-0487-4F1A-AE73-820E165611B3 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/Devices/cheeseburger/ButtonsDxe/ButtonsDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/Devices/cheeseburger/ButtonsDxe/ButtonsDxe.efi
    SECTION UI = "ButtonsDxe"
  }

  FILE DRIVER = 5A5CB8CA-9382-4E0C-B383-77FB517CD9EB {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/AdcDxe/AdcDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/AdcDxe/AdcDxe.efi
    SECTION UI = "AdcDxe"
  }

  FILE DRIVER = 88ABF42E-EFA7-4D72-A9C8-8B29ACDCF64F {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/MpPowerDxe/MpPowerDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/MpPowerDxe/MpPowerDxe.efi
    SECTION UI = "MpPowerDxe"
  }

  FILE DRIVER = DD0616C8-B50D-4A58-B9BE-10C9F3F7156C {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/UsbTypeCDxe/UsbTypeCDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/UsbTypeCDxe/UsbTypeCDxe.efi
    SECTION UI = "UsbTypeCDxe"
  }

  FILE DRIVER = 94F8A6A7-DC34-4101-88C1-99179CCEAE83 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/UsbfnDwc3Dxe/UsbfnDwc3Dxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/UsbfnDwc3Dxe/UsbfnDwc3Dxe.efi
    SECTION UI = "UsbfnDwc3Dxe"
  }

  FILE DRIVER = BEB12BEE-F6E1-11E1-9FB8-6C626DE4AEB1 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/XhciPciEmulation/XhciPciEmulation.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/XhciPciEmulation/XhciPciEmulation.efi
    SECTION UI = "XhciPciEmulation"
  }

  FILE DRIVER = B7F50E91-A759-412C-ADE4-DCD03E7F7C28 {
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/XhciDxe/XhciDxe.efi
    SECTION UI = "XhciDxe"
  }

  INF MdeModulePkg/Bus/Usb/UsbBusDxe/UsbBusDxe.inf
  INF MdeModulePkg/Bus/Usb/UsbMouseDxe/UsbMouseDxe.inf
  INF MdeModulePkg/Bus/Usb/UsbMassStorageDxe/UsbMassStorageDxe.inf

  FILE DRIVER = 2D2E62CF-9ECF-43B7-8219-94E7FC713DFE {
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/UsbKbDxe/UsbKbDxe.efi
    SECTION UI = "UsbKbDxe"
  }

  FILE DRIVER = 5AF77F10-90DF-4E7E-8325-A17EC09D5443 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/UsbMsdDxe/UsbMsdDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/UsbMsdDxe/UsbMsdDxe.efi
    SECTION UI = "UsbMsdDxe"
  }

  FILE DRIVER = 3299A266-15F0-4346-8318-716336736D3E {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/UsbDeviceDxe/UsbDeviceDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/UsbDeviceDxe/UsbDeviceDxe.efi
    SECTION UI = "UsbDeviceDxe"
  }

  FILE DRIVER = CD823A4D-7DEC-4531-AE5D-4134FA4127B8 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/UsbConfigDxe/UsbConfigDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/UsbConfigDxe/UsbConfigDxe.efi
    SECTION UI = "UsbConfigDxe"
  }

  FILE DRIVER = 0A134F0E-075E-40B3-9C63-3B3906804663 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/UsbInitDxe/UsbInitDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/UsbInitDxe/UsbInitDxe.efi
    SECTION UI = "UsbInitDxe"
  }

  FILE DRIVER = 51D4273A-C3FB-48FD-B5B7-97CE091A58A6 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/msm8998/UsbfnChgDxe/UsbfnChgDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/msm8998/UsbfnChgDxe/UsbfnChgDxe.efi
    SECTION UI = "UsbfnChgDxe"
  }
}
