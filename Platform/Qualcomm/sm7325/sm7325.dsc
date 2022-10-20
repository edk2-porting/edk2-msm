## @file
#
#  Copyright (c) 2011-2015, ARM Limited. All rights reserved.
#  Copyright (c) 2014, Linaro Limited. All rights reserved.
#  Copyright (c) 2015 - 2016, Intel Corporation. All rights reserved.
#  Copyright (c) 2018 - 2019, Bingxing Wang. All rights reserved.
#  Copyright (c) 2022, Xilin Wu. All rights reserved.
#
#  SPDX-License-Identifier: BSD-2-Clause-Patent
#
##

################################################################################
#
# Defines Section - statements that will be processed to create a Makefile.
#
################################################################################

[Defines]
  SOC_PLATFORM            = SM7325
  USE_PHYSICAL_TIMER      = FALSE

!include Silicon/Qualcomm/QcomPkg/QcomCommonDsc.inc

[PcdsFixedAtBuild.common]
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000         # Starting address
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x200000000

  gArmTokenSpaceGuid.PcdCpuVectorBaseAddress|0x9FF8C000     # CPU Vectors
  gArmTokenSpaceGuid.PcdArmArchTimerFreqInHz|19200000
  gArmTokenSpaceGuid.PcdArmArchTimerSecIntrNum|29
  gArmTokenSpaceGuid.PcdArmArchTimerIntrNum|30
  gArmTokenSpaceGuid.PcdGicDistributorBase|0x17a00000
  gArmTokenSpaceGuid.PcdGicRedistributorsBase|0x17B40000

  gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiDefaultOemRevision|0x00007280
  gEmbeddedTokenSpaceGuid.PcdPrePiStackBase|0x9FF90000      # UEFI Stack
  gEmbeddedTokenSpaceGuid.PcdPrePiStackSize|0x00040000      # 256K stack
  gEmbeddedTokenSpaceGuid.PcdInterruptBaseAddress|0x09BC0000
  gEmbeddedTokenSpaceGuid.PcdPrePiCpuIoSize|44

  gQcomTokenSpaceGuid.PcdPreAllocatedMemorySize|0x20B00000  # Start here, DXE heap
  gQcomTokenSpaceGuid.PcdUefiMemPoolSize|0x07900000         # UefiMemorySize, DXE heap size
  gQcomTokenSpaceGuid.PcdMipiFrameBufferAddress|0xE1000000

  gArmPlatformTokenSpaceGuid.PcdCoreCount|8
  gArmPlatformTokenSpaceGuid.PcdClusterCount|3

  #
  # SimpleInit
  #
  gSimpleInitTokenSpaceGuid.PcdDeviceTreeStore|0x9DA00000
  gSimpleInitTokenSpaceGuid.PcdLoggerdUseConsole|FALSE

[LibraryClasses.common]
!if $(USE_UART) == 1
  SerialPortLib|Silicon/Qualcomm/QcomPkg/Library/QcomGeniSerialPortLib/QcomGeniSerialPortLib.inf
!else
  SerialPortLib|Silicon/Qualcomm/QcomPkg/Library/FrameBufferSerialPortLib/FrameBufferSerialPortLib.inf
!endif

# !ifdef $(AB_SLOTS_SUPPORT)
#   BootSlotLib|Silicon/Qualcomm/QcomPkg/Library/BootSlotLib/BootSlotLib.inf
# !endif

  # Ported from SurfaceDuoPkg
  # AslUpdateLib|Silicon/Qualcomm/QcomPkg/Library/DxeAslUpdateLib/DxeAslUpdateLib.inf

  MemoryInitPeiLib|Silicon/Qualcomm/sm7325/Library/MemoryInitPeiLib/PeiMemoryAllocationLib.inf
  PlatformPeiLib|Silicon/Qualcomm/sm7325/Library/PlatformPeiLib/PlatformPeiLib.inf
  PlatformPrePiLib|Silicon/Qualcomm/sm7325/Library/PlatformPrePiLib/PlatformPrePiLib.inf
  # RFSProtectionLib|SurfaceDuo1Pkg/Library/RFSProtectionLib/RFSProtectionLib.inf
  MsPlatformDevicesLib|Silicon/Qualcomm/sm7325/Library/MsPlatformDevicesLib/MsPlatformDevicesLib.inf

[Components.common]
  #
  # OnePlus 6T A/B Slot Support
  # Op6tSlotDxe and BootSlotDxe have the same goal, do not use them both at the same time in device fdf.
  #
#   Platform/Oneplus/sdm845/Drivers/Op6tSlotDxe/Op6tSlotDxe.inf
# !ifdef $(AB_SLOTS_SUPPORT)
#   Silicon/Qualcomm/QcomPkg/Drivers/BootSlotDxe/BootSlotDxe.inf
#   Platform/RenegadePkg/Application/SwitchSlotsApp/SwitchSlotsApp.inf
# !endif

  Platform/EFI_Binaries/Applications/LinuxSimpleMassStorage/LinuxSimpleMassStorage.inf
  # Silicon/Qualcomm/QcomPkg/Drivers/SynapticsTouchDxe/SynapticsTouchDevice.inf
  # Silicon/Qualcomm/QcomPkg/Drivers/SynapticsTouchDxe/SynapticsTouchDxe.inf

  # Platform/RenegadePkg/Drivers/KernelErrataPatcher/KernelErrataPatcher.inf
