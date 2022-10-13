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
  DEFINE SOC_PLATFORM = MSM8998

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

  gQcomTokenSpaceGuid.PcdUefiMemPoolSize|0x07B30000         # UefiMemorySize, DXE heap size
  gQcomTokenSpaceGuid.PcdPreAllocatedMemorySize|0x15800000  # Start here, DXE heap
  gQcomTokenSpaceGuid.PcdMipiFrameBufferAddress|0x9D400000

  gArmPlatformTokenSpaceGuid.PcdCoreCount|8
  gArmPlatformTokenSpaceGuid.PcdClusterCount|2

  #
  # SimpleInit
  #
  gSimpleInitTokenSpaceGuid.PcdDeviceTreeStore|0x83300000
  gSimpleInitTokenSpaceGuid.PcdLoggerdUseConsole|FALSE

[LibraryClasses.common]
# UART not supported yet
# !if $(USE_UART) == 1
#   SerialPortLib|Silicon/Qualcomm/QcomPkg/Library/QcomGeniSerialPortLib/QcomGeniSerialPortLib.inf
# !else
#   SerialPortLib|Silicon/Qualcomm/QcomPkg/Library/FrameBufferSerialPortLib/FrameBufferSerialPortLib.inf
# !endif

  SerialPortLib|Silicon/Qualcomm/QcomPkg/Library/FrameBufferSerialPortLib/FrameBufferSerialPortLib.inf

  # Ported from SurfaceDuoPkg
  MemoryInitPeiLib|Silicon/Qualcomm/msm8998/Library/MemoryInitPeiLib/PeiMemoryAllocationLib.inf
  PlatformPeiLib|Silicon/Qualcomm/msm8998/Library/PlatformPeiLib/PlatformPeiLib.inf
  PlatformPrePiLib|Silicon/Qualcomm/msm8998/Library/PlatformPrePiLib/PlatformPrePiLib.inf
  # AslUpdateLib|SurfaceDuoFamilyPkg/Library/DxeAslUpdateLib/DxeAslUpdateLib.inf
  # RFSProtectionLib|SurfaceDuo1Pkg/Library/RFSProtectionLib/RFSProtectionLib.inf
  MsPlatformDevicesLib|Silicon/Qualcomm/msm8998/Library/MsPlatformDevicesLib/MsPlatformDevicesLib.inf

[Components.common]
  Platform/EFI_Binaries/Applications/LinuxSimpleMassStorage/LinuxSimpleMassStorage.inf
