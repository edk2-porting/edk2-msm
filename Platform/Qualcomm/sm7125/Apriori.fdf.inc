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
  INF ArmPkg/Drivers/TimerDxe/TimerDxe.inf

  FILE DRIVER = f541d663-4a48-40aa-aabf-ff158ccae34c {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/SmemDxe/SmemDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/SmemDxe/SmemDxe.efi
    SECTION UI = "SmemDxe"
  }

  FILE DRIVER = 8E9BD160-B184-11DF-94E2-0800200C9A66 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/DALSys/DALSys.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/DALSys/DALSys.efi
    SECTION UI = "DALSys"
  }

  FILE DRIVER = af9763a2-033b-4109-8e17-56a98d380c92 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/HWIODxeDriver/HWIODxeDriver.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/HWIODxeDriver/HWIODxeDriver.efi
    SECTION UI = "HWIODxeDriver"
  }

  FILE DRIVER = 10e193df-9966-44e7-b17c-59dd831e20fc {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/ChipInfo/ChipInfo.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/ChipInfo/ChipInfo.efi
    SECTION UI = "ChipInfo"
  }

  FILE DRIVER = B105211B-BBBD-4ADD-A3B0-D1CF4A52154C {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/PlatformInfoDxeDriver/PlatformInfoDxeDriver.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/PlatformInfoDxeDriver/PlatformInfoDxeDriver.efi
    SECTION UI = "PlatformInfoDxeDriver"
  }

  # FILE DRIVER = 9A00771F-36D4-4DD5-8916-C48ED9B16B86 {
  #   SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/HALIOMMU/HALIOMMU.depex
  #   SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/HALIOMMU/HALIOMMU.efi
  #   SECTION UI = "HALIOMMU"
  # }

  INF EmbeddedPkg/MetronomeDxe/MetronomeDxe.inf

  FILE DRIVER = E43128A8-8692-42B6-8AFA-676158578D18 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/ULogDxe/ULogDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/ULogDxe/ULogDxe.efi
    SECTION UI = "ULogDxe"
  }

  FILE DRIVER = ABA01FF8-2CCB-4E12-8B2E-CD3F4A742993 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/CmdDbDxe/CmdDbDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/CmdDbDxe/CmdDbDxe.efi
    SECTION UI = "CmdDbDxe"
  }

  FILE DRIVER = CB29F4D1-7F37-4692-A416-93E82E219711 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/NpaDxe/NpaDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/NpaDxe/NpaDxe.efi
    SECTION UI = "NpaDxe"
  }

  FILE DRIVER = CB29F4D1-7F37-4692-A416-93E82E219766 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/RpmhDxe/RpmhDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/RpmhDxe/RpmhDxe.efi
    SECTION UI = "RpmhDxe"
  }

  FILE DRIVER = B43C22DB-6333-490C-872D-0A73439059FD {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/PdcDxe/PdcDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/PdcDxe/PdcDxe.efi
    SECTION UI = "PdcDxe"
  }

  FILE DRIVER = 4DB5DEA6-5302-4D1A-8A82-677A683B0D29 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/ClockDxe/ClockDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/ClockDxe/ClockDxe.efi
    SECTION UI = "ClockDxe"
  }

  FILE DRIVER = 9c1eb71f-dd6c-4ed5-9f6a-5cc0ca789f16 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/ShmBridgeDxe/ShmBridgeDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/ShmBridgeDxe/ShmBridgeDxe.efi
    SECTION UI = "ShmBridgeDxe"
  }

  FILE DRIVER = 2d7a83e3-e343-4ffb-9109-631f2ee11694 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/ScmDxe/ScmDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/ScmDxe/ScmDxe.efi
    SECTION UI = "ScmDxe"
  }

  INF MdeModulePkg/Universal/Disk/DiskIoDxe/DiskIoDxe.inf
  INF MdeModulePkg/Universal/Disk/PartitionDxe/PartitionDxe.inf
  INF MdeModulePkg/Universal/Disk/UnicodeCollation/EnglishDxe/EnglishDxe.inf
  INF MdeModulePkg/Universal/FvSimpleFileSystemDxe/FvSimpleFileSystemDxe.inf

  FILE DRIVER = 0d35cd8e-97ea-4f9a-96af-0f0d89f76567 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/UFSDxe/UFSDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/UFSDxe/UFSDxe.efi
    SECTION UI = "UFSDxe"
  }

  FILE DRIVER = 6925fad3-e243-4b69-ad61-3f978c8abc60 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/TzDxe/TzDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/TzDxe/TzDxe.efi
    SECTION UI = "TzDxe"
  }
 
  INF FatPkg/EnhancedFatDxe/Fat.inf

  INF MdeModulePkg/Universal/Variable/RuntimeDxe/VariableRuntimeDxe.inf

  # FILE DRIVER = 040e1e61-0afb-411b-9ec9-00f3fc59cc13 {
  #   SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/QcomWDogDxe/QcomWDogDxe.depex
  #   SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/QcomWDogDxe/QcomWDogDxe.efi
  #   SECTION UI = "QcomWDogDxe"
  # }

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

  FILE DRIVER = 8681cc5a-0df6-441e-b4b8-e915c538f067 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/DALTLMM/DALTLMM.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/DALTLMM/DALTLMM.efi
    SECTION UI = "DALTLMM"
  }

  FILE DRIVER = 2a7b4bef-80cd-49e1-b473-374ba4d673fc {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/SPMI/SPMI.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/SPMI/SPMI.efi
    SECTION UI = "SPMI"
  }

  FILE DRIVER = 7DB0793A-4402-4BE1-906E-D0FABAD2707E {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/DDRInfoDxe/DDRInfoDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/DDRInfoDxe/DDRInfoDxe.efi
    SECTION UI = "DDRInfoDxe"
  }

  FILE DRIVER = 5776232e-082d-4b75-9a0e-fe1d13f7a5d9 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/PmicDxe/PmicDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/PmicDxe/PmicDxe.efi
    SECTION UI = "PmicDxe"
  }

  # FILE DRIVER = 04DE8591-D2B3-4077-BBBE-B12070094EB6 {
  #   SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/I2C/I2C.depex
  #   SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/I2C/I2C.efi
  #   SECTION UI = "I2C"
  # }

  INF EmbeddedPkg/SimpleTextInOutSerial/SimpleTextInOutSerial.inf
  INF MdeModulePkg/Universal/Console/ConPlatformDxe/ConPlatformDxe.inf
  INF MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitterDxe.inf
  INF MdeModulePkg/Universal/Console/GraphicsConsoleDxe/GraphicsConsoleDxe.inf

  FILE DRIVER = 5bd181db-0487-4f1a-ae73-820e165611b3 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/ButtonsDxe/ButtonsDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/ButtonsDxe/ButtonsDxe.efi
    SECTION UI = "ButtonsDxe"
  }

  # FILE DRIVER = 11faed4c-b21f-4d88-8e48-c4c28a1e50df {
  #   SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/UsbPwrCtrlDxe/UsbPwrCtrlDxe.depex
  #   SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/UsbPwrCtrlDxe/UsbPwrCtrlDxe.efi
  #   SECTION UI = "UsbPwrCtrlDxe"
  # }

  # FILE DRIVER = 94f8a6a7-dc34-4101-88c1-99179cceae83 {
  #   SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/UsbfnDwc3Dxe/UsbfnDwc3Dxe.depex
  #   SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/UsbfnDwc3Dxe/UsbfnDwc3Dxe.efi
  #   SECTION UI = "UsbfnDwc3Dxe"
  # }

  # FILE DRIVER = beb12bee-f6e1-11e1-9fb8-6c626de4aeb1 {
  #   SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/XhciPciEmulation/XhciPciEmulation.efi
  #   SECTION UI = "XhciPciEmulation"
  # }

  # FILE DRIVER = b7f50e91-a759-412c-ade4-dcd03e7f7c28 {
  #   SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/XhciDxe/XhciDxe.efi
  #   SECTION UI = "XhciDxe"
  # }

  INF MdeModulePkg/Bus/Usb/UsbBusDxe/UsbBusDxe.inf
  INF MdeModulePkg/Bus/Usb/UsbMouseDxe/UsbMouseDxe.inf
  INF MdeModulePkg/Bus/Usb/UsbMassStorageDxe/UsbMassStorageDxe.inf

  # FILE DRIVER = 2d2e62cf-9ecf-43b7-8219-94e7fc713dfe {
  #   SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/UsbKbDxe/UsbKbDxe.efi
  #   SECTION UI = "UsbKbDxe"
  # }

  # FILE DRIVER = cd823a4d-7dec-4531-ae5d-4134fa4127b8 {
  #   SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/UsbConfigDxe/UsbConfigDxe.depex
  #   SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/UsbConfigDxe/UsbConfigDxe.efi
  #   SECTION UI = "UsbConfigDxe"
  # }

  # FILE DRIVER = 0A134F0E-075E-40B3-9C63-3B3906804663 {
  #   SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/UsbInitDxe/UsbInitDxe.depex
  #   SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/UsbInitDxe/UsbInitDxe.efi
  #   SECTION UI = "UsbInitDxe"
  # }

  # FILE DRIVER = 3299a266-15f0-4346-8318-716336736d3e {
  #   SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7125/UsbDeviceDxe/UsbDeviceDxe.depex
  #   SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7125/UsbDeviceDxe/UsbDeviceDxe.efi
  #   SECTION UI = "UsbDeviceDxe"
  # }
}
