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

!include Silicon/Qualcomm/QcomPkg/QcomCommonDsc.inc

[Defines]
  DEFINE SOC_PLATFORM = SDM845

[PcdsFixedAtBuild.common]
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000         # Starting address
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x17AE00000        # 6GB Size

  gArmTokenSpaceGuid.PcdCpuVectorBaseAddress|0x9ff8c000     # CPU Vectors
  gArmTokenSpaceGuid.PcdArmArchTimerFreqInHz|19200000
  gArmTokenSpaceGuid.PcdArmArchTimerSecIntrNum|17
  gArmTokenSpaceGuid.PcdArmArchTimerIntrNum|18
  gArmTokenSpaceGuid.PcdGicDistributorBase|0x17a00000
  gArmTokenSpaceGuid.PcdGicRedistributorsBase|0x17a60000

  gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiDefaultOemRevision|0x00000850
  gEmbeddedTokenSpaceGuid.PcdPrePiStackBase|0x9FF90000      # UEFI Stack
  gEmbeddedTokenSpaceGuid.PcdPrePiStackSize|0x00040000      # 256K stack
  gEmbeddedTokenSpaceGuid.PcdPrePiCpuIoSize|44

  gQcomTokenSpaceGuid.PcdUefiMemPoolSize|0x05730000         # UefiMemorySize, DXE heap size
  gQcomTokenSpaceGuid.PcdPreAllocatedMemorySize|0x17C00000  # Start here, DXE heap
  gQcomTokenSpaceGuid.PcdMipiFrameBufferAddress|0x9d400000

  gArmPlatformTokenSpaceGuid.PcdCoreCount|8
  gArmPlatformTokenSpaceGuid.PcdClusterCount|2

  #
  # SimpleInit
  #
  gSimpleInitTokenSpaceGuid.PcdDeviceTreeStore|0x83300000
  gSimpleInitTokenSpaceGuid.PcdLoggerdUseConsole|FALSE

[LibraryClasses.common]
!if $(USE_UART) == 1
  SerialPortLib|Silicon/Qualcomm/QcomPkg/Library/QcomGeniSerialPortLib/QcomGeniSerialPortLib.inf
!else
  SerialPortLib|Silicon/Qualcomm/QcomPkg/Library/FrameBufferSerialPortLib/FrameBufferSerialPortLib.inf
!endif

!ifdef $(AB_SLOTS_SUPPORT)
  BootSlotLib|Silicon/Qualcomm/QcomPkg/Library/BootSlotLib/BootSlotLib.inf
!endif #$(AB_SLOTS_SUPPORT)

  # Ported from SurfaceDuoPkg
  MemoryInitPeiLib|Silicon/Qualcomm/sdm845/Library/MemoryInitPeiLib/PeiMemoryAllocationLib.inf
  PlatformPeiLib|Silicon/Qualcomm/sdm845/Library/PlatformPeiLib/PlatformPeiLib.inf
  PlatformPrePiLib|Silicon/Qualcomm/sdm845/Library/PlatformPrePiLib/PlatformPrePiLib.inf
  # AslUpdateLib|SurfaceDuoFamilyPkg/Library/DxeAslUpdateLib/DxeAslUpdateLib.inf
  # RFSProtectionLib|SurfaceDuo1Pkg/Library/RFSProtectionLib/RFSProtectionLib.inf

[Components.common]
  #
  # OnePlus 6T A/B Slot Support
  # Op6tSlotDxe and BootSlotDxe have the same goal, do not use them both at the same time in device fdf.
  #
  Platform/Oneplus/sdm845/Drivers/Op6tSlotDxe/Op6tSlotDxe.inf
!ifdef $(AB_SLOTS_SUPPORT)
  Silicon/Qualcomm/QcomPkg/Drivers/BootSlotDxe/BootSlotDxe.inf
  Platform/RenegadePkg/Application/SwitchSlotsApp/SwitchSlotsApp.inf
!endif #$(AB_SLOTS_SUPPORT)

  Platform/EFI_Binaries/845/LinuxSimpleMassStorage/LinuxSimpleMassStorage.inf
  Silicon/Qualcomm/QcomPkg/Drivers/SynapticsTouchDxe/SynapticsTouchDevice.inf
  Silicon/Qualcomm/QcomPkg/Drivers/SynapticsTouchDxe/SynapticsTouchDxe.inf
