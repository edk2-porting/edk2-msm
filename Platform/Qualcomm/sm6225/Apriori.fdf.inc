APRIORI DXE {

  #
  # PI DXE Drivers producing Architectural Protocols (EFI Services)
  #
  INF  MdeModulePkg/Universal/PCD/Dxe/Pcd.inf
  INF  MdeModulePkg/Core/Dxe/DxeMain.inf
  INF  MdeModulePkg/Universal/ReportStatusCodeRouter/RuntimeDxe/ReportStatusCodeRouterRuntimeDxe.inf
  INF  MdeModulePkg/Universal/StatusCodeHandler/RuntimeDxe/StatusCodeHandlerRuntimeDxe.inf
  INF  MdeModulePkg/Core/RuntimeDxe/RuntimeDxe.inf
  INF  ArmPkg/Drivers/CpuDxe/CpuDxe.inf
  INF  ArmPkg/Drivers/ArmGic/ArmGicDxe.inf
  INF  EmbeddedPkg/MetronomeDxe/MetronomeDxe.inf
  INF  ArmPkg/Drivers/TimerDxe/TimerDxe.inf
  INF  MdeModulePkg/Universal/SecurityStubDxe/SecurityStubDxe.inf

  INF  Platform/EFI_Binaries/Drivers/sm6225/SmemDxe/SmemDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/DALSYSDxe/DALSYSDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/HWIODxe/HWIODxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/ChipInfoDxe/ChipInfoDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/PlatformInfoDxe/PlatformInfoDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/HALIOMMUDxe/HALIOMMUDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/GLinkDxe/GLinkDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/ULogDxe/ULogDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/NpaDxe/NpaDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/VcsDxe/VcsDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/ClockDxe/ClockDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/ShmBridgeDxe/ShmBridgeDxeLA.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/TzDxe/ScmDxeLA.inf

  INF  MdeModulePkg/Universal/Disk/UnicodeCollation/EnglishDxe/EnglishDxe.inf
  INF  MdeModulePkg/Universal/FvSimpleFileSystemDxe/FvSimpleFileSystemDxe.inf

  INF  Platform/EFI_Binaries/Drivers/sm6225/SdccDxe/SdccDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/UFSDxe/UFSDxe.inf

  INF  MdeModulePkg/Bus/Pci/PciBusDxe/PciBusDxe.inf
  INF  FatPkg/EnhancedFatDxe/Fat.inf

  INF  Platform/EFI_Binaries/Drivers/sm6225/TzDxe/TzDxeLA.inf
  INF MdeModulePkg/Universal/Variable/RuntimeDxe/VariableRuntimeDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/QcomWDogDxe/QcomWDogDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/TLMMDxe/TLMMDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/SPMIDxe/SPMIDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/ResetRuntimeDxe/ResetRuntimeDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/PmicDxe/PmicDxeLa.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/PILDxe/PILDxe.inf

!if $(SECURE_BOOT_ENABLE) == TRUE
  INF  SecurityPkg/VariableAuthenticated/SecureBootConfigDxe/SecureBootConfigDxe.inf
  INF  SecurityPkg/VariableAuthenticated/SecureBootDefaultKeysDxe/SecureBootDefaultKeysDxe.inf
!endif

  INF  MdeModulePkg/Universal/WatchdogTimerDxe/WatchdogTimer.inf
  INF  EmbeddedPkg/EmbeddedMonotonicCounter/EmbeddedMonotonicCounter.inf
  INF  MdeModulePkg/Universal/ResetSystemRuntimeDxe/ResetSystemRuntimeDxe.inf
  INF  EmbeddedPkg/RealTimeClockRuntimeDxe/RealTimeClockRuntimeDxe.inf
  INF  MdeModulePkg/Universal/PrintDxe/PrintDxe.inf
  INF  MdeModulePkg/Universal/DevicePathDxe/DevicePathDxe.inf
  INF  MdeModulePkg/Universal/CapsuleRuntimeDxe/CapsuleRuntimeDxe.inf
  INF  MdeModulePkg/Universal/HiiDatabaseDxe/HiiDatabaseDxe.inf

  INF  Platform/EFI_Binaries/Drivers/sm6225/FontDxe/FontDxe.inf

  INF  MdeModulePkg/Universal/BdsDxe/BdsDxe.inf

  INF  Platform/EFI_Binaries/Drivers/sm6225/I2CDxe/I2CDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/AdcDxe/AdcDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/UsbPwrCtrlDxe/UsbPwrCtrlDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/QcomChargerDxe/QcomChargerDxeLA.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/ChargerExDxe/ChargerExDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/UsbfnDwc3Dxe/UsbfnDwc3Dxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/UsbConfigDxe/UsbConfigDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/TsensDxe/TsensDxe.inf

  INF  Silicon/Qualcomm/QcomPkg/Drivers/SimpleFbDxe/SimpleFbDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/GpiDxe/GpiDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/DDRInfoDxe/DDRInfoDxe.inf
     
  INF  EmbeddedPkg/SimpleTextInOutSerial/SimpleTextInOutSerial.inf
  INF  MdeModulePkg/Universal/Console/ConPlatformDxe/ConPlatformDxe.inf
  INF  MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitterDxe.inf
  INF  MdeModulePkg/Universal/Console/GraphicsConsoleDxe/GraphicsConsoleDxe.inf
}