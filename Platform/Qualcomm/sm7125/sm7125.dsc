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
  SOC_PLATFORM            = SM7125
  USE_PHYSICAL_TIMER      = TRUE

!include Silicon/Qualcomm/QcomPkg/QcomCommonDsc.inc

[PcdsFixedAtBuild.common]
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000         # Starting address
  gArmTokenSpaceGuid.PcdSystemMemorySize|0xFDFA0000         # Limit to 4GB Size here

  gArmTokenSpaceGuid.PcdCpuVectorBaseAddress|0x9FF8C000     # CPU Vectors
  gArmTokenSpaceGuid.PcdArmArchTimerFreqInHz|19200000
  gArmTokenSpaceGuid.PcdArmArchTimerSecIntrNum|17
  gArmTokenSpaceGuid.PcdArmArchTimerIntrNum|18
  gArmTokenSpaceGuid.PcdGicDistributorBase|0x17a00000
  gArmTokenSpaceGuid.PcdGicRedistributorsBase|0x17a60000

  gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiDefaultOemRevision|0x00007180
  gEmbeddedTokenSpaceGuid.PcdPrePiStackBase|0x9FF90000      # UEFI Stack
  gEmbeddedTokenSpaceGuid.PcdPrePiStackSize|0x00040000      # 256K stack
  gEmbeddedTokenSpaceGuid.PcdPrePiCpuIoSize|44

  gQcomTokenSpaceGuid.PcdUefiMemPoolSize|0x08400000         # UefiMemorySize, DXE heap size
  gQcomTokenSpaceGuid.PcdPreAllocatedMemorySize|0x13C00000  # Start here, DXE heap
  gQcomTokenSpaceGuid.PcdMipiFrameBufferAddress|0x9C000000

  gQcomTokenSpaceGuid.PcdDebugUartPortBase|0xa88000

  gArmPlatformTokenSpaceGuid.PcdCoreCount|8
  gArmPlatformTokenSpaceGuid.PcdClusterCount|2

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

  MemoryInitPeiLib|Silicon/Qualcomm/sm7125/Library/MemoryInitPeiLib/PeiMemoryAllocationLib.inf
  PlatformPeiLib|Silicon/Qualcomm/sm7125/Library/PlatformPeiLib/PlatformPeiLib.inf
  PlatformPrePiLib|Silicon/Qualcomm/sm7125/Library/PlatformPrePiLib/PlatformPrePiLib.inf
  # RFSProtectionLib|Silicon/Qualcomm/sm7125/Library/RFSProtectionLib/RFSProtectionLib.inf
  MsPlatformDevicesLib|Silicon/Qualcomm/sm7125/Library/MsPlatformDevicesLib/MsPlatformDevicesLib.inf
  SOCSmbiosInfoLib|Silicon/Qualcomm/sm7125/Library/SOCSmbiosInfoLib/SOCSmbiosInfoLib.inf

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
  Silicon/Qualcomm/QcomPkg/Drivers/SynapticsTouchDxe/SynapticsTouchDevice.inf
  Silicon/Qualcomm/QcomPkg/Drivers/SynapticsTouchDxe/SynapticsTouchDxe.inf

  Platform/RenegadePkg/Drivers/KernelErrataPatcher/KernelErrataPatcher.inf
