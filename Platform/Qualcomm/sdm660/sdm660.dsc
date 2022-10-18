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
  DEFINE SOC_PLATFORM = SDM660

[PcdsFixedAtBuild.common]
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000         # Starting address
  gArmTokenSpaceGuid.PcdSystemMemorySize|0xFDFA0000         # Limit to 4GB Size here

  gArmTokenSpaceGuid.PcdCpuVectorBaseAddress|0x9ff8c000     # CPU Vectors
  gArmTokenSpaceGuid.PcdArmArchTimerFreqInHz|19200000
  gArmTokenSpaceGuid.PcdArmArchTimerSecIntrNum|17
  gArmTokenSpaceGuid.PcdArmArchTimerVirtIntrNum|19
  gArmTokenSpaceGuid.PcdArmArchTimerIntrNum|18
  gArmTokenSpaceGuid.PcdGicDistributorBase|0x17a00000
  gArmTokenSpaceGuid.PcdGicRedistributorsBase|0x17b00000

  gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiDefaultOemRevision|0x00000850
  gEmbeddedTokenSpaceGuid.PcdPrePiStackBase|0x9FF90000      # UEFI Stack
  gEmbeddedTokenSpaceGuid.PcdPrePiStackSize|0x00040000      # 256K stack
  gEmbeddedTokenSpaceGuid.PcdPrePiCpuIoSize|44

  gQcomTokenSpaceGuid.PcdUefiMemPoolSize|0x04230000         # UefiMemorySize, DXE heap size
  gQcomTokenSpaceGuid.PcdPreAllocatedMemorySize|0x19100000  # Start here, DXE heap
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

  # Ported from SurfaceDuoPkg
  AslUpdateLib|Silicon/Qualcomm/QcomPkg/Library/DxeAslUpdateLib/DxeAslUpdateLib.inf

  MemoryInitPeiLib|Silicon/Qualcomm/sdm660/Library/MemoryInitPeiLib/PeiMemoryAllocationLib.inf
  PlatformPeiLib|Silicon/Qualcomm/sdm660/Library/PlatformPeiLib/PlatformPeiLib.inf
  PlatformPrePiLib|Silicon/Qualcomm/sdm660/Library/PlatformPrePiLib/PlatformPrePiLib.inf
  RFSProtectionLib|Silicon/Qualcomm/sdm660/Library/RFSProtectionLib/RFSProtectionLib.inf
  MsPlatformDevicesLib|Silicon/Qualcomm/sdm660/Library/MsPlatformDevicesLib/MsPlatformDevicesLib.inf

[Components.common]

  Silicon/Qualcomm/QcomPkg/Drivers/SynapticsTouchDxe/SynapticsTouchDevice.inf
  Silicon/Qualcomm/QcomPkg/Drivers/SynapticsTouchDxe/SynapticsTouchDxe.inf
  
  Platform/RenegadePkg/Drivers/KernelErrataPatcher/KernelErrataPatcher.inf
