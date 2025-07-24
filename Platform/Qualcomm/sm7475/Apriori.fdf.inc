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
  
  # Early debug support
  #INF ArmPlatformPkg/Drivers/PL061GpioDxe/PL061GpioDxe.inf
  #INF MdeModulePkg/Universal/SerialDxe/SerialDxe.inf

  INF MdeModulePkg/Universal/CapsuleRuntimeDxe/CapsuleRuntimeDxe.inf
  INF EmbeddedPkg/MetronomeDxe/MetronomeDxe.inf
  INF ArmPkg/Drivers/TimerDxe/TimerDxe.inf

  # CRITICAL: SmemDxe must be very early for Qualcomm platforms
FILE DRIVER = f541d663-4a48-40aa-aabf-ff158ccae34c {
  SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7475/SmemDxe/SmemDxe.efi
  SECTION UI = "SmemDxe"
}

FILE DRIVER = 8E9BD160-B184-11DF-94E2-0800200C9A66 {
  SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7475/DALSys/DALSys.efi
  SECTION UI = "DALSys"
}

FILE DRIVER = af9763a2-033b-4109-8e17-56a98d380c92 {
  SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7475/HWIODxeDriver/HWIODxeDriver.efi
  SECTION UI = "HWIODxeDriver"
}

FILE DRIVER = 10e193df-9966-44e7-b17c-59dd831e20fc {
  SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7475/ChipInfo/ChipInfo.efi
  SECTION UI = "ChipInfo"
} 

FILE DRIVER = b105211b-bbbd-4add-a3b0-d1cf4a52154c {
  SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7475/PlatformInfoDxeDriver/PlatformInfoDxeDriver.efi
  SECTION UI = "PlatformInfoDxeDriver"
} 

  # CRITICAL: ClockDxe should be earlier, before other hardware drivers
FILE DRIVER = 4DB5DEA6-5302-4D1A-8A82-677A683B0D29 {
  SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7475/ClockDxe/ClockDxe.efi
  SECTION UI = "ClockDxe"
}

  # ADD: PMIC/Power management driver (not available)
  # This is often needed for display power
  # FILE DRIVER = <PMIC_GUID> {
  #   SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7475/PmicDxe/PmicDxe.efi
  #   SECTION UI = "PmicDxe"
  # }

  # ADD: GPIO/TLMM driver (critical for display initialization)
  # FILE DRIVER = <GPIO_GUID> {
  #   SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7475/GPIODxe/GPIODxe.efi
  #   SECTION UI = "GPIODxe"
  # }

  # Memory/Storage drivers
  INF MdeModulePkg/Universal/Disk/DiskIoDxe/DiskIoDxe.inf
  INF MdeModulePkg/Universal/Disk/PartitionDxe/PartitionDxe.inf
  INF MdeModulePkg/Universal/Disk/UnicodeCollation/EnglishDxe/EnglishDxe.inf
  INF MdeModulePkg/Universal/FvSimpleFileSystemDxe/FvSimpleFileSystemDxe.inf

FILE DRIVER = 0d35cd8e-97ea-4f9a-96af-0f0d89f76567 {
  SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7475/UFSDxe/UFSDxe.efi
  SECTION UI = "UFSDxe"
}

  INF FatPkg/EnhancedFatDxe/Fat.inf

  # Variable services
  INF MdeModulePkg/Universal/Variable/RuntimeDxe/VariableRuntimeDxe.inf

  # ADD: DDR Info driver (commented out but might be needed)
  # FILE DRIVER = 7DB0793A-4402-4BE1-906E-D0FABAD2707E {
  #   SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7475/DDRInfoDxe/DDRInfoDxe.efi
  #   SECTION UI = "DDRInfoDxe"
  # }

  # Runtime services
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

  # Input drivers
FILE DRIVER = 5bd181db-0487-4f1a-ae73-820e165611b3 {
  SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7475/ButtonsDxe/ButtonsDxe.efi
  SECTION UI = "ButtonsDxe"
}

  # CRITICAL: Display drivers - This is likely where issue is
  # SimpleFbDxe needs proper framebuffer setup
  INF Silicon/Qualcomm/QcomPkg/Drivers/SimpleFbDxe/SimpleFbDxe.inf

FILE DRIVER = 4138022f-06c7-4f79-9c94-7e33b511a4e7 {
  SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7475/DisplayDxe/DisplayDxe.efi
  SECTION UI = "DisplayDxe"
}
  # Console drivers
  INF EmbeddedPkg/SimpleTextInOutSerial/SimpleTextInOutSerial.inf
  INF MdeModulePkg/Universal/Console/ConPlatformDxe/ConPlatformDxe.inf
  INF MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitterDxe.inf
  INF MdeModulePkg/Universal/Console/GraphicsConsoleDxe/GraphicsConsoleDxe.inf

  # USB drivers
  INF MdeModulePkg/Bus/Usb/UsbBusDxe/UsbBusDxe.inf
  INF MdeModulePkg/Bus/Usb/UsbMouseDxe/UsbMouseDxe.inf
  INF MdeModulePkg/Bus/Usb/UsbMassStorageDxe/UsbMassStorageDxe.inf

}