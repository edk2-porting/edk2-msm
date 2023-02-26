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
  SOC_PLATFORM            = tensor
  USE_PHYSICAL_TIMER      = TRUE

!include Silicon/Google/GooglePkg/GoogleCommonDsc.inc

[PcdsFixedAtBuild.common]
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x880000000         # Starting address
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x0FDFA0000         # Limit to 4GB Size here

  gArmTokenSpaceGuid.PcdCpuVectorBaseAddress|0x880000000     # CPU Vectors
  gArmTokenSpaceGuid.PcdArmArchTimerFreqInHz|0x1770000
  gArmTokenSpaceGuid.PcdArmArchTimerSecIntrNum|13
  gArmTokenSpaceGuid.PcdArmArchTimerIntrNum|14
  gArmTokenSpaceGuid.PcdGicDistributorBase|0x10400000
  gArmTokenSpaceGuid.PcdGicRedistributorsBase|0x10440000

  gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiDefaultOemRevision|0x00000850
  gEmbeddedTokenSpaceGuid.PcdPrePiStackBase|0xfd800000      # UEFI Stack
  gEmbeddedTokenSpaceGuid.PcdPrePiStackSize|0x00040000      # 256K stack
  #gEmbeddedTokenSpaceGuid.PcdPrePiCpuIoSize|44

  gQcomTokenSpaceGuid.PcdUefiMemPoolBase|0x880010000         # DXE Heap base address
  gQcomTokenSpaceGuid.PcdUefiMemPoolSize|0x2E000000         # UefiMemorySize, DXE heap size
  
  gQcomTokenSpaceGuid.PcdMipiFrameBufferAddress|0xfd90c000

  gArmPlatformTokenSpaceGuid.PcdCoreCount|8
  gArmPlatformTokenSpaceGuid.PcdClusterCount|3

  #
  # SimpleInit
  #
  gSimpleInitTokenSpaceGuid.PcdDeviceTreeStore|0x83300000
  gSimpleInitTokenSpaceGuid.PcdLoggerdUseConsole|FALSE

[LibraryClasses.common]

  # Ported from SurfaceDuoPkg
  AslUpdateLib|Silicon/Google/GooglePkg/Library/DxeAslUpdateLib/DxeAslUpdateLib.inf

  PlatformMemoryMapLib|Silicon/Google/Tensor/Library/PlatformMemoryMapLib/PlatformMemoryMapLib.inf
  PlatformPeiLib|Silicon/Google/Tensor/Library/PlatformPeiLib/PlatformPeiLib.inf
  PlatformPrePiLib|Silicon/Google/Tensor/Library/PlatformPrePiLib/PlatformPrePiLib.inf
  MsPlatformDevicesLib|Silicon/Google/Tensor/Library/MsPlatformDevicesLib/MsPlatformDevicesLib.inf
  SOCSmbiosInfoLib|Silicon/Google/Tensor/Library/SOCSmbiosInfoLib/SOCSmbiosInfoLib.inf

[Components.common]
  #
  # OnePlus 6T A/B Slot Support
  # Op6tSlotDxe and BootSlotDxe have the same goal, do not use them both at the same time in device fdf.
  #
  # GPLDrivers/Drivers/Op6tSlotDxe/Op6tSlotDxe.inf
