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

  #FILE DRIVER = 9A5163E7-5C29-453F-825C-837A46A81E15 {
  #  SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sdm845/SerialDxe/SerialDxe.depex
  #  SECTION PE32 = Platform/EFI_Binaries/Drivers/sdm845/SerialDxe/SerialDxe.efi
  #  SECTION UI = "SerialDxe"
  #} 

  

  INF EmbeddedPkg/MetronomeDxe/MetronomeDxe.inf
  INF ArmPkg/Drivers/TimerDxe/TimerDxe.inf

  

  // Used to speed up booting. must be loaded after ClockDxe
  #INF Platform/RenegadePkg/Drivers/SetCPUFreqDxe/SetCPUFreqDxe.inf

  INF MdeModulePkg/Universal/Disk/DiskIoDxe/DiskIoDxe.inf
  INF MdeModulePkg/Universal/Disk/PartitionDxe/PartitionDxe.inf

  #FILE DRIVER = 0d35cd8e-97ea-4f9a-96af-0f0d89f76567 {
  #  SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sdm845/UFSDxe/UFSDxe.depex
  #  SECTION PE32 = Platform/EFI_Binaries/Drivers/sdm845/UFSDxe/UFSDxe.efi
  #  SECTION UI = "UFSDxe"
  #}

  INF FatPkg/EnhancedFatDxe/Fat.inf
  INF MdeModulePkg/Universal/Disk/UnicodeCollation/EnglishDxe/EnglishDxe.inf
  INF MdeModulePkg/Universal/FvSimpleFileSystemDxe/FvSimpleFileSystemDxe.inf

  #FILE DRIVER = 2a7b4bef-80cd-49e1-b473-374ba4d673fc {
  #  SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sdm845/SPMI/SPMI.depex
  #  SECTION PE32 = Platform/EFI_Binaries/Drivers/sdm845/SPMI/SPMI.efi
  #  SECTION UI = "SPMI"
  #}

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

!if $(USE_SIMPLEFBDXE) == TRUE
  INF SurfaceDuoFamilyPkg/Driver/SimpleFbDxe/SimpleFbDxe.inf
!endif

  INF MdeModulePkg/Universal/BdsDxe/BdsDxe.inf  

  INF MdeModulePkg/Universal/WatchdogTimerDxe/WatchdogTimer.inf

  

  INF EmbeddedPkg/SimpleTextInOutSerial/SimpleTextInOutSerial.inf
  INF MdeModulePkg/Universal/Console/ConPlatformDxe/ConPlatformDxe.inf
  INF MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitterDxe.inf
  INF MdeModulePkg/Universal/Console/GraphicsConsoleDxe/GraphicsConsoleDxe.inf

  
  INF MdeModulePkg/Bus/Usb/UsbBusDxe/UsbBusDxe.inf
  INF MdeModulePkg/Bus/Usb/UsbMouseDxe/UsbMouseDxe.inf
  INF MdeModulePkg/Bus/Usb/UsbMassStorageDxe/UsbMassStorageDxe.inf

  

  # INF Silicon/Qualcomm/sdm845/Drivers/sdm845Dxe/sdm845Dxe.inf
}
