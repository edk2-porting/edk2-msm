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
  INF EmbeddedPkg/MetronomeDxe/MetronomeDxe.inf
  INF ArmPkg/Drivers/TimerDxe/TimerDxe.inf

  FILE DRIVER = f541d663-4a48-40aa-aabf-ff158ccae34c {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/SmemDxe/SmemDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/SmemDxe/SmemDxe.efi
    SECTION UI = "SmemDxe"
  }

  FILE DRIVER = 8E9BD160-B184-11DF-94E2-0800200C9A66 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/DALSys/DALSys.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/DALSys/DALSys.efi
    SECTION UI = "DALSys"
  }

  FILE DRIVER = af9763a2-033b-4109-8e17-56a98d380c92 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/HWIODxeDriver/HWIODxeDriver.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/HWIODxeDriver/HWIODxeDriver.efi
    SECTION UI = "HWIODxeDriver"
  }

  FILE DRIVER = 10e193df-9966-44e7-b17c-59dd831e20fc {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/ChipInfo/ChipInfo.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/ChipInfo/ChipInfo.efi
    SECTION UI = "ChipInfo"
  }

  FILE DRIVER = B105211B-BBBD-4ADD-A3B0-D1CF4A52154C {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/PlatformInfoDxeDriver/PlatformInfoDxeDriver.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/PlatformInfoDxeDriver/PlatformInfoDxeDriver.efi
    SECTION UI = "PlatformInfoDxeDriver"
  }

  FILE DRIVER = 9A00771F-36D4-4DD5-8916-C48ED9B16B86 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/HALIOMMU/HALIOMMU.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/HALIOMMU/HALIOMMU.efi
    SECTION UI = "HALIOMMU"
  }

  FILE DRIVER = E43128A8-8692-42B6-8AFA-676158578D18 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/ULogDxe/ULogDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/ULogDxe/ULogDxe.efi
    SECTION UI = "ULogDxe"
  }

  FILE DRIVER = ABA01FF8-2CCB-4E12-8B2E-CD3F4A742993 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/CmdDbDxe/CmdDbDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/CmdDbDxe/CmdDbDxe.efi
    SECTION UI = "CmdDbDxe"
  }

  FILE DRIVER = 0401b830-bff9-44a2-a5f6-95734a33c017 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/PwrUtilsDxe/PwrUtilsDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/PwrUtilsDxe/PwrUtilsDxe.efi
    SECTION UI = "PwrUtilsDxe"
  }

  FILE DRIVER = CB29F4D1-7F37-4692-A416-93E82E219711 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/NpaDxe/NpaDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/NpaDxe/NpaDxe.efi
    SECTION UI = "NpaDxe"
  }

  FILE DRIVER = CB29F4D1-7F37-4692-A416-93E82E219766 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/RpmhDxe/RpmhDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/RpmhDxe/RpmhDxe.efi
    SECTION UI = "RpmhDxe"
  }

  FILE DRIVER = 8bd3b475-401a-4b0b-9315-edee61a1eae5 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/VcsDxe/VcsDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/VcsDxe/VcsDxe.efi
    SECTION UI = "VcsDxe"
  }

  FILE DRIVER = 4DB5DEA6-5302-4D1A-8A82-677A683B0D29 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/ClockDxe/ClockDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/ClockDxe/ClockDxe.efi
    SECTION UI = "ClockDxe"
  }

  // Used to speed up booting. must be loaded after ClockDxe
  INF Platform/RenegadePkg/Drivers/SetCPUFreqDxe/SetCPUFreqDxe.inf

  FILE DRIVER = 5824f9de-17d2-4b1f-a5fe-5eb77fa53093 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/ICBDxe/ICBDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/ICBDxe/ICBDxe.efi
    SECTION UI = "ICBDxe"
  }

  FILE DRIVER = 8430c46d-ab1c-4f82-896b-33e156931fb3 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/ShmBridgeDxeLA/ShmBridgeDxeLA.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/ShmBridgeDxeLA/ShmBridgeDxeLA.efi
    SECTION UI = "ShmBridgeDxeLA"
  }

  FILE DRIVER = 4b4973ee-401b-4f36-a6a9-533dfccdfc33 {
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/ScmDxeLA/ScmDxeLA.efi
    SECTION UI = "ScmDxeLA"
  }

  FILE DRIVER = 8681cc5a-0df6-441e-b4b8-e915c538f067 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/DALTLMM/DALTLMM.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/DALTLMM/DALTLMM.efi
    SECTION UI = "DALTLMM"
  }

  FILE DRIVER = 2a7b4bef-80cd-49e1-b473-374ba4d673fc {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/SPMI/SPMI.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/SPMI/SPMI.efi
    SECTION UI = "SPMI"
  }

  FILE DRIVER = 04DE8591-D2B3-4077-BBBE-B12070094EB6 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/I2C/I2C.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/I2C/I2C.efi
    SECTION UI = "I2C"
  }

  FILE DRIVER = 3ae17db7-3cc5-4b89-9304-9549211057ef {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/ResetRuntimeDxe/ResetRuntimeDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/ResetRuntimeDxe/ResetRuntimeDxe.efi
    SECTION UI = "ResetRuntimeDxe"
  }

  FILE DRIVER = 5776232e-082d-4b75-9a0e-fe1d13f7a5d9 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/PmicDxe/PmicDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/PmicDxe/PmicDxe.efi
    SECTION UI = "PmicDxe"
  }

  INF MdeModulePkg/Universal/Disk/DiskIoDxe/DiskIoDxe.inf
  INF MdeModulePkg/Universal/Disk/PartitionDxe/PartitionDxe.inf
  INF MdeModulePkg/Universal/Disk/UnicodeCollation/EnglishDxe/EnglishDxe.inf
  INF MdeModulePkg/Universal/FvSimpleFileSystemDxe/FvSimpleFileSystemDxe.inf

  FILE DRIVER = 0d35cd8e-97ea-4f9a-96af-0f0d89f76567 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/UFSDxe/UFSDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/UFSDxe/UFSDxe.efi
    SECTION UI = "UFSDxe"
  }

  INF FatPkg/EnhancedFatDxe/Fat.inf

  FILE DRIVER = cf6dfc66-14ab-4e13-84db-9c02912d1404 {
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/TzDxeLA/TzDxeLA.efi
    SECTION UI = "TzDxeLA"
  }

  INF MdeModulePkg/Universal/Variable/RuntimeDxe/VariableRuntimeDxe.inf

  FILE DRIVER = 7DB0793A-4402-4BE1-906E-D0FABAD2707E {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/DDRInfoDxe/DDRInfoDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/DDRInfoDxe/DDRInfoDxe.efi
    SECTION UI = "DDRInfoDxe"
  }

  FILE DRIVER = 42031f68-1f0b-429b-93f1-0eb0cf89ddbf {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/IPCCDxe/IPCCDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/IPCCDxe/IPCCDxe.efi
    SECTION UI = "IPCCDxe"
  }

  FILE DRIVER = 7942a7eb-b7d5-4e2e-b908-831e4de55b58 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/GlinkDxe/GlinkDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/GlinkDxe/GlinkDxe.efi
    SECTION UI = "GlinkDxe"
  }

  INF MdeModulePkg/Universal/WatchdogTimerDxe/WatchdogTimer.inf
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

  FILE DRIVER = 6d4a9cf7-cc0c-42b0-aa89-f6a6a8d99273 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/PmicGlinkDxe/PmicGlinkDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/PmicGlinkDxe/PmicGlinkDxe.efi
    SECTION UI = "PmicGlinkDxe"
  }

  FILE DRIVER = 11faed4c-b21f-4d88-8e48-c4c28a1e50df {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/UsbPwrCtrlDxe/UsbPwrCtrlDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/UsbPwrCtrlDxe/UsbPwrCtrlDxe.efi
    SECTION UI = "UsbPwrCtrlDxe"
  }

  FILE DRIVER = 94f8a6a7-dc34-4101-88c1-99179cceae83 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/UsbfnDwc3Dxe/UsbfnDwc3Dxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/UsbfnDwc3Dxe/UsbfnDwc3Dxe.efi
    SECTION UI = "UsbfnDwc3Dxe"
  }

  FILE DRIVER = beb12bee-f6e1-11e1-9fb8-6c626de4aeb1 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/XhciPciEmulation/XhciPciEmulation.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/XhciPciEmulation/XhciPciEmulation.efi
    SECTION UI = "XhciPciEmulation"
  }

  FILE DRIVER = b7f50e91-a759-412c-ade4-dcd03e7f7c28 {
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/XhciDxe/XhciDxe.efi
    SECTION UI = "XhciDxe"
  }

  INF MdeModulePkg/Bus/Usb/UsbBusDxe/UsbBusDxe.inf
  INF MdeModulePkg/Bus/Usb/UsbMouseDxe/UsbMouseDxe.inf
  INF MdeModulePkg/Bus/Usb/UsbKbDxe/UsbKbDxe.inf
  INF MdeModulePkg/Bus/Usb/UsbMassStorageDxe/UsbMassStorageDxe.inf

  FILE DRIVER = cd823a4d-7dec-4531-ae5d-4134fa4127b8 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/UsbConfigDxe/UsbConfigDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/UsbConfigDxe/UsbConfigDxe.efi
    SECTION UI = "UsbConfigDxe"
  }

  FILE DRIVER = 5bd181db-0487-4f1a-ae73-820e165611b3 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7325/ButtonsDxe/ButtonsDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7325/ButtonsDxe/ButtonsDxe.efi
    SECTION UI = "ButtonsDxe"
  }

  INF EmbeddedPkg/SimpleTextInOutSerial/SimpleTextInOutSerial.inf
  INF MdeModulePkg/Universal/Console/ConPlatformDxe/ConPlatformDxe.inf
  INF MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitterDxe.inf
  INF MdeModulePkg/Universal/Console/GraphicsConsoleDxe/GraphicsConsoleDxe.inf


}
