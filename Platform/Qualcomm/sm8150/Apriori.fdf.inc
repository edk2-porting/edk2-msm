APRIORI DXE {

  #
  # PI DXE Drivers producing Architectural Protocols (EFI Services)
  #
  INF MdeModulePkg/Universal/PCD/Dxe/Pcd.inf
  INF MdeModulePkg/Core/Dxe/DxeMain.inf
  # INF MdeModulePkg/Universal/ReportStatusCodeRouter/RuntimeDxe/ReportStatusCodeRouterRuntimeDxe.inf
  # INF MdeModulePkg/Universal/StatusCodeHandler/RuntimeDxe/StatusCodeHandlerRuntimeDxe.inf
  INF MdeModulePkg/Core/RuntimeDxe/RuntimeDxe.inf
  INF ArmPkg/Drivers/CpuDxe/CpuDxe.inf
  INF ArmPkg/Drivers/ArmGic/ArmGicDxe.inf
  INF MdeModulePkg/Universal/SecurityStubDxe/SecurityStubDxe.inf

  INF EmbeddedPkg/MetronomeDxe/MetronomeDxe.inf
  INF ArmPkg/Drivers/TimerDxe/TimerDxe.inf

  FILE DRIVER = f541d663-4a48-40aa-aabf-ff158ccae34c {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/SmemDxe/SmemDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/SmemDxe/SmemDxe.efi
    SECTION UI = "SmemDxe"
  }

  FILE DRIVER = 8e9bd160-b184-11df-94e2-0800200c9a66 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/DALSys/DALSys.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/DALSys/DALSys.efi
    SECTION UI = "DALSys"
  }

  FILE DRIVER = af9763a2-033b-4109-8e17-56a98d380c92 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/HWIODxeDriver/HWIODxeDriver.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/HWIODxeDriver/HWIODxeDriver.efi
    SECTION UI = "HWIODxeDriver"
  }

  FILE DRIVER = 10e193df-9966-44e7-b17c-59dd831e20fc {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/ChipInfo/ChipInfo.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/ChipInfo/ChipInfo.efi
    SECTION UI = "ChipInfo"
  }

  FILE DRIVER = b105211b-bbbd-4add-a3b0-d1cf4a52154c {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/PlatformInfoDxeDriver/PlatformInfoDxeDriver.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/PlatformInfoDxeDriver/PlatformInfoDxeDriver.efi
    SECTION UI = "PlatformInfoDxeDriver"
  }

  FILE DRIVER = 9a00771f-36d4-4dd5-8916-c48ed9b16b86 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/HALIOMMU/HALIOMMU.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/Patched_Binaries/HALIOMMU.efi
    SECTION UI = "HALIOMMU"
  }

  FILE DRIVER = e43128a8-8692-42b6-8afa-676158578d18 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/ULogDxe/ULogDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/ULogDxe/ULogDxe.efi
    SECTION UI = "ULogDxe"
  }

  FILE DRIVER = aba01ff8-2ccb-4e12-8b2e-cd3f4a742993 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/CmdDbDxe/CmdDbDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/CmdDbDxe/CmdDbDxe.efi
    SECTION UI = "CmdDbDxe"
  }

  FILE DRIVER = cb29f4d1-7f37-4692-a416-93e82e219711 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/NpaDxe/NpaDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/NpaDxe/NpaDxe.efi
    SECTION UI = "NpaDxe"
  }

  FILE DRIVER = cb29f4d1-7f37-4692-a416-93e82e219766 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/RpmhDxe/RpmhDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/RpmhDxe/RpmhDxe.efi
    SECTION UI = "RpmhDxe"
  }

  FILE DRIVER = b43c22db-6333-490c-872d-0a73439059fd {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/PdcDxe/PdcDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/PdcDxe/PdcDxe.efi
    SECTION UI = "PdcDxe"
  }

  FILE DRIVER = 4db5dea6-5302-4d1a-8a82-677a683b0d29 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/ClockDxe/ClockDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/ClockDxe/ClockDxe.efi
    SECTION UI = "ClockDxe"
  }

  FILE DRIVER = 9c1eb71f-dd6c-4ed5-9f6a-5cc0ca789f16 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/WP_Binaries/ShmBridgeDxe/ShmBridgeDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/WP_Binaries/ShmBridgeDxe/ShmBridgeDxe.efi
    SECTION UI = "ShmBridgeDxe"
  }

  FILE DRIVER = 2d7a83e3-e343-4ffb-9109-631f2ee11694 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/ScmDxe/ScmDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/ScmDxe/ScmDxe.efi
    SECTION UI = "ScmDxe"
  }

  FILE DRIVER = 7942a7eb-b7d5-4e2e-b908-831e4de55b58 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/WP_Binaries/GlinkDxe/GlinkDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/WP_Binaries/GlinkDxe/GlinkDxe.efi
    SECTION UI = "GlinkDxe"
  }

  FILE DRIVER = 6b38f7b4-ad98-40e9-9093-aca2b5a253c4 {
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/DiskIoDxe/DiskIoDxe.efi
    SECTION UI = "DiskIoDxe"
  }

  INF MdeModulePkg/Universal/Disk/PartitionDxe/PartitionDxe.inf
  INF MdeModulePkg/Universal/Disk/UnicodeCollation/EnglishDxe/EnglishDxe.inf
  INF MdeModulePkg/Universal/FvSimpleFileSystemDxe/FvSimpleFileSystemDxe.inf

  FILE DRIVER = 0d35cd8e-97ea-4f9a-96af-0f0d89f76567 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/UFSDxe/UFSDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/Patched_Binaries/UFSDxe.efi
    SECTION UI = "UFSDxe"
  }

  INF MdeModulePkg/Bus/Pci/PciBusDxe/PciBusDxe.inf
  INF FatPkg/EnhancedFatDxe/Fat.inf

  FILE DRIVER = 6925fad3-e243-4b69-ad61-3f978c8abc60 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/TzDxe/TzDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/TzDxe/TzDxe.efi
    SECTION UI = "TzDxe"
  }

  INF MdeModulePkg/Universal/Variable/RuntimeDxe/VariableRuntimeDxe.inf

  FILE DRIVER = 040e1e61-0afb-411b-9ec9-00f3fc59cc13 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/QcomWDogDxe/QcomWDogDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/QcomWDogDxe/QcomWDogDxe.efi
    SECTION UI = "QcomWDogDxe"
  }

  FILE DRIVER = 8681cc5a-0df6-441e-b4b8-e915c538f067 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/DALTLMM/DALTLMM.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/DALTLMM/DALTLMM.efi
    SECTION UI = "DALTLMM"
  }

  FILE DRIVER = 2a7b4bef-80cd-49e1-b473-374ba4d673fc {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/SPMI/SPMI.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/SPMI/SPMI.efi
    SECTION UI = "SPMI"
  }

  FILE DRIVER = 7db0793a-4402-4be1-906e-d0fabad2707e {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/DDRInfoDxe/DDRInfoDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/DDRInfoDxe/DDRInfoDxe.efi
    SECTION UI = "DDRInfoDxe"
  }

  FILE DRIVER = 5776232e-082d-4b75-9a0e-fe1d13f7a5d9 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/PmicDxe/PmicDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/PmicDxe/PmicDxe.efi
    SECTION UI = "PmicDxe"
  }
  
!if $(SECURE_BOOT_ENABLE) == TRUE
  INF SecurityPkg/VariableAuthenticated/SecureBootConfigDxe/SecureBootConfigDxe.inf
  INF SecurityPkg/VariableAuthenticated/SecureBootDefaultKeysDxe/SecureBootDefaultKeysDxe.inf
!endif

!if $(USE_SIMPLEFBDXE) == TRUE
  INF SurfaceDuoFamilyPkg/Driver/SimpleFbDxe/SimpleFbDxe.inf
!endif

!if $(USE_DISPLAYDXE) == TRUE
  FILE DRIVER = 4138022f-06c7-4f79-9c94-7e33b511a4e7 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/DisplayDxe/DisplayDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/Patched_Binaries/DisplayDxe.efi
    SECTION UI = "DisplayDxe"
  }
!endif

  FILE DRIVER = 1d317734-4083-47c6-83ea-e3a42f2a6bff {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/PILDxe/PILDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/PILDxe/PILDxe.efi
    SECTION UI = "PILDxe"
  }

  INF MdeModulePkg/Universal/WatchdogTimerDxe/WatchdogTimer.inf

  INF EmbeddedPkg/EmbeddedMonotonicCounter/EmbeddedMonotonicCounter.inf
  INF MdeModulePkg/Universal/ResetSystemRuntimeDxe/ResetSystemRuntimeDxe.inf
  INF EmbeddedPkg/RealTimeClockRuntimeDxe/RealTimeClockRuntimeDxe.inf
  INF MdeModulePkg/Universal/PrintDxe/PrintDxe.inf
  INF MdeModulePkg/Universal/DevicePathDxe/DevicePathDxe.inf

  INF MdeModulePkg/Universal/HiiDatabaseDxe/HiiDatabaseDxe.inf

  FILE DRIVER = ed15ffd5-bc96-4107-9118-95366600188e {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/FontDxe/FontDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/FontDxe/FontDxe.efi
    SECTION UI = "FontDxe"
  }

  INF MdeModulePkg/Universal/BdsDxe/BdsDxe.inf

  FILE DRIVER = 04de8591-d2b3-4077-bbbe-b12070094eb6 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/I2C/I2C.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/I2C/I2C.efi
    SECTION UI = "I2C"
  }

  FILE DRIVER = 5a5cb8ca-9382-4e0c-b383-77fb517cd9eb {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/AdcDxe/AdcDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/AdcDxe/AdcDxe.efi
    SECTION UI = "AdcDxe"
  }

  FILE DRIVER = 6d4a9cf7-cc0c-42b0-aa89-f6a6a8d99273 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/WP_Binaries/PmicGlinkDxe/PmicGlinkDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/WP_Binaries/PmicGlinkDxe/PmicGlinkDxe.efi
    SECTION UI = "PmicGlinkDxe"
  }

  FILE DRIVER = 11faed4c-b21f-4d88-8e48-c4c28a1e50df {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/WP_Binaries/UsbPwrCtrlDxe/UsbPwrCtrlDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/WP_Binaries/UsbPwrCtrlDxe/UsbPwrCtrlDxe.efi
    SECTION UI = "UsbPwrCtrlDxe"
  }

  FILE DRIVER = 94f8a6a7-dc34-4101-88c1-99179cceae83 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/UsbfnDwc3Dxe/UsbfnDwc3Dxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/UsbfnDwc3Dxe/UsbfnDwc3Dxe.efi
    SECTION UI = "UsbfnDwc3Dxe"
  }

  FILE DRIVER = BEB12BEE-F6E1-11E1-9FB8-6C626DE4AEB1 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/WP_Binaries/XhciPciEmulation/XhciPciEmulation.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/WP_Binaries/XhciPciEmulation/XhciPciEmulation.efi
    SECTION UI = "XhciPciEmulation"
  }

  FILE DRIVER = B7F50E91-A759-412C-ADE4-DCD03E7F7C28 {
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/WP_Binaries/XhciDxe/XhciDxe.efi
    SECTION UI = "XhciDxe"
  }

  FILE DRIVER = 240612B7-A063-11D4-9A3A-0090273FC14D {
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/WP_Binaries/UsbBusDxe/UsbBusDxe.efi
    SECTION UI = "UsbBusDxe"
  }

  FILE DRIVER = 2D2E62CF-9ECF-43B7-8219-94E7FC713DFE {
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/WP_Binaries/UsbKbDxe/UsbKbDxe.efi
    SECTION UI = "UsbKbDxe"
  }

  INF MdeModulePkg/Bus/Usb/UsbMouseDxe/UsbMouseDxe.inf

  FILE DRIVER = 9FB4B4A7-42C0-4BCD-8540-9BCC6711F83E {
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/WP_Binaries/UsbMassStorageDxe/UsbMassStorageDxe.efi
    SECTION UI = "UsbMassStorageDxe"
  }

  FILE DRIVER = cd823a4d-7dec-4531-ae5d-4134fa4127b8 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/UsbConfigDxe/UsbConfigDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/Patched_Binaries/UsbConfigDxe.efi
    SECTION UI = "UsbConfigDxe"
  }

  FILE DRIVER = 0A134F0E-075E-40B3-9C63-3B3906804663 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/WP_Binaries/UsbInitDxe/UsbInitDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/WP_Binaries/UsbInitDxe/UsbInitDxe.efi
    SECTION UI = "UsbInitDxe"
  }

  FILE DRIVER = 3299a266-15f0-4346-8318-716336736d3e {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/WP_Binaries/UsbDeviceDxe/UsbDeviceDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/WP_Binaries/UsbDeviceDxe/UsbDeviceDxe.efi
    SECTION UI = "UsbDeviceDxe"
  }

  #FILE DRIVER = 5bd181db-0487-4f1a-ae73-820e165611b3 {
  #  SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/ButtonsDxe/ButtonsDxe.depex
  #  SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/ButtonsDxe/ButtonsDxe.efi
  #  SECTION UI = "ButtonsDxe"
  #}

  FILE DRIVER = f09ad92e-485c-9cdb-3e05-3385c38f94cc {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/TsensDxe/TsensDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/TsensDxe/TsensDxe.efi
    SECTION UI = "TsensDxe"
  }

  FILE DRIVER = 569ea0de-b557-4043-84cf-01103fe516e5 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/GpiDxe/GpiDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/GpiDxe/GpiDxe.efi
    SECTION UI = "GpiDxe"
  }

  FILE DRIVER = c62f4b20-681e-11df-8f0d-0002a5d5c51b {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/WP_Binaries/PciHostBridge/PciHostBridge.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/Patched_Binaries/PciHostBridgeDxe.efi
    SECTION UI = "PciHostBridge"
  }

  FILE DRIVER = ce044919-3000-4998-82af-ddb4e17c6b66 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/WP_Binaries/AdapterInformationDxe/AdapterInformationDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/WP_Binaries/AdapterInformationDxe/AdapterInformationDxe.efi
    SECTION UI = "AdapterInformationDxe"
  }

  INF EmbeddedPkg/SimpleTextInOutSerial/SimpleTextInOutSerial.inf
  INF MdeModulePkg/Universal/Console/ConPlatformDxe/ConPlatformDxe.inf
  INF MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitterDxe.inf
  INF MdeModulePkg/Universal/Console/GraphicsConsoleDxe/GraphicsConsoleDxe.inf

  INF MdeModulePkg/Universal/CapsuleRuntimeDxe/CapsuleRuntimeDxe.inf
}
