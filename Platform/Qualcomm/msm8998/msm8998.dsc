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
  SOC_PLATFORM            = MSM8998
  USE_PHYSICAL_TIMER      = TRUE

!include Silicon/Qualcomm/QcomPkg/QcomCommonDsc.inc

[PcdsFixedAtBuild.common]
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000         # Starting address
  gArmTokenSpaceGuid.PcdSystemMemorySize|0xF0000000         # Limit to 4GB Size here

  gArmTokenSpaceGuid.PcdCpuVectorBaseAddress|0x9ff8c000     # CPU Vectors
  gArmTokenSpaceGuid.PcdArmArchTimerFreqInHz|19200000
  gArmTokenSpaceGuid.PcdArmArchTimerSecIntrNum|17
  gArmTokenSpaceGuid.PcdArmArchTimerIntrNum|18
  gArmTokenSpaceGuid.PcdGicDistributorBase|0x17a00000
  gArmTokenSpaceGuid.PcdGicRedistributorsBase|0x17b00000

  gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiDefaultOemRevision|0x00008998
  gEmbeddedTokenSpaceGuid.PcdPrePiStackBase|0x9FF90000      # UEFI Stack
  gEmbeddedTokenSpaceGuid.PcdPrePiStackSize|0x00040000      # 256K stack
  gEmbeddedTokenSpaceGuid.PcdPrePiCpuIoSize|44

  gQcomTokenSpaceGuid.PcdUefiMemPoolBase|0xA0000000         # DXE Heap base address
  gQcomTokenSpaceGuid.PcdUefiMemPoolSize|0x2E000000         # UefiMemorySize, DXE heap size
  gQcomTokenSpaceGuid.PcdMipiFrameBufferAddress|0x9D400000

  gArmPlatformTokenSpaceGuid.PcdCoreCount|8
  gArmPlatformTokenSpaceGuid.PcdClusterCount|2

  #
  # SimpleInit
  #
  gSimpleInitTokenSpaceGuid.PcdDeviceTreeStore|0x83300000
  gSimpleInitTokenSpaceGuid.PcdLoggerdUseConsole|FALSE

[LibraryClasses.common]

  # Ported from SurfaceDuoPkg
  PlatformMemoryMapLib|Platform/$(VENDOR_NAME)/msm8998/Library/$(PLATFORM_NAME)/PlatformMemoryMapLib/PlatformMemoryMapLib.inf
  
  PlatformPeiLib|Silicon/Qualcomm/msm8998/Library/PlatformPeiLib/PlatformPeiLib.inf
  PlatformPrePiLib|Silicon/Qualcomm/msm8998/Library/PlatformPrePiLib/PlatformPrePiLib.inf
  AslUpdateLib|Silicon/Qualcomm/QcomPkg/Library/DxeAslUpdateLib/DxeAslUpdateLib.inf
  MsPlatformDevicesLib|Silicon/Qualcomm/msm8998/Library/MsPlatformDevicesLib/MsPlatformDevicesLib.inf
  SOCSmbiosInfoLib|Silicon/Qualcomm/msm8998/Library/SOCSmbiosInfoLib/SOCSmbiosInfoLib.inf

[Components.common]
  Platform/EFI_Binaries/Applications/LinuxSimpleMassStorage/LinuxSimpleMassStorage.inf
