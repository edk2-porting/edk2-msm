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
  SOC_PLATFORM            = sm6225
  USE_PHYSICAL_TIMER      = TRUE

!include Silicon/Qualcomm/QcomPkg/QcomCommonDsc.inc

[PcdsFixedAtBuild.common]
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x40000000         # Starting address
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x100000000

  gArmTokenSpaceGuid.PcdCpuVectorBaseAddress|0x5FF8C000     # CPU Vectors
  gArmTokenSpaceGuid.PcdArmArchTimerFreqInHz|19200000
  gArmTokenSpaceGuid.PcdArmArchTimerSecIntrNum|1
  gArmTokenSpaceGuid.PcdArmArchTimerIntrNum|2
  gArmTokenSpaceGuid.PcdArmArchTimerVirtIntrNum|3
  gArmTokenSpaceGuid.PcdArmArchTimerHypIntrNum|0
  gArmTokenSpaceGuid.PcdGicDistributorBase|0xf200000
  gArmTokenSpaceGuid.PcdGicRedistributorsBase|0xf300000
  gArmTokenSpaceGuid.PcdGicInterruptInterfaceBase|0xf200000

  gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiDefaultOemRevision|0x00006225
  gEmbeddedTokenSpaceGuid.PcdPrePiStackBase|0x5FF90000      # UEFI Stack
  gEmbeddedTokenSpaceGuid.PcdPrePiStackSize|0x00040000      # 256K stack
  gEmbeddedTokenSpaceGuid.PcdPrePiCpuIoSize|44

  gQcomTokenSpaceGuid.PcdUefiMemPoolBase|0x63900000         # DXE Heap base address
  gQcomTokenSpaceGuid.PcdUefiMemPoolSize|0x0E000000         # UefiMemorySize, DXE heap size
  gQcomTokenSpaceGuid.PcdMipiFrameBufferAddress|0x5C000000

  gQcomTokenSpaceGuid.PcdDebugUartPortBase|0xa90000

  gArmPlatformTokenSpaceGuid.PcdCoreCount|8
  gArmPlatformTokenSpaceGuid.PcdClusterCount|2

  #
  # SimpleInit
  #
  gSimpleInitTokenSpaceGuid.PcdDeviceTreeStore|0x53F00000
  gSimpleInitTokenSpaceGuid.PcdLoggerdUseConsole|FALSE
 
  gEfiMdePkgTokenSpaceGuid.PcdDebugPrintErrorLevel|0x80000048

[LibraryClasses.common]

  # Ported from SurfaceDuoPkg
  AslUpdateLib|Silicon/Qualcomm/QcomPkg/Library/DxeAslUpdateLib/DxeAslUpdateLib.inf
  SerialPortLib|Silicon/Qualcomm/QcomPkg/Library/FrameBufferSerialPortLib/FrameBufferSerialPortLib.inf
  #SerialPortLib|MdePkg/Library/BaseSerialPortLibNull/BaseSerialPortLibNull.inf
  PlatformMemoryMapLib|Silicon/Qualcomm/sm6225/Library/PlatformMemoryMapLib/PlatformMemoryMapLib.inf
  PlatformPeiLib|Silicon/Qualcomm/sm6225/Library/PlatformPeiLib/PlatformPeiLib.inf
  PlatformPrePiLib|Silicon/Qualcomm/sm6225/Library/PlatformPrePiLib/PlatformPrePiLib.inf
  MsPlatformDevicesLib|Silicon/Qualcomm/sm6225/Library/MsPlatformDevicesLib/MsPlatformDevicesLib.inf
  SOCSmbiosInfoLib|Silicon/Qualcomm/sm6225/Library/SOCSmbiosInfoLib/SOCSmbiosInfoLib.inf
