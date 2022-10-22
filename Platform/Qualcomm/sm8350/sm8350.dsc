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
  SOC_PLATFORM            = SM8350
  USE_PHYSICAL_TIMER      = FALSE

!include Silicon/Qualcomm/QcomPkg/QcomCommonDsc.inc

[PcdsFixedAtBuild.common]
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000         # Starting address
  gArmTokenSpaceGuid.PcdSystemMemorySize|0xFDFA0000         # Limit to 4GB Size here

  gArmTokenSpaceGuid.PcdCpuVectorBaseAddress|0x9f58c000     # CPU Vectors
  gArmTokenSpaceGuid.PcdArmArchTimerFreqInHz|19200000
  gArmTokenSpaceGuid.PcdArmArchTimerSecIntrNum|29
  gArmTokenSpaceGuid.PcdArmArchTimerIntrNum|30
  gArmTokenSpaceGuid.PcdGicDistributorBase|0x17a00000
  gArmTokenSpaceGuid.PcdGicRedistributorsBase|0x17b40000

  gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiDefaultOemRevision|0x00000850
  gEmbeddedTokenSpaceGuid.PcdPrePiStackBase|0x9F590000      # UEFI Stack
  gEmbeddedTokenSpaceGuid.PcdPrePiStackSize|0x00040000      # 256K stack
  gEmbeddedTokenSpaceGuid.PcdPrePiCpuIoSize|44

  gQcomTokenSpaceGuid.PcdUefiMemPoolSize|0x04230000         # UefiMemorySize, DXE heap size
  gQcomTokenSpaceGuid.PcdPreAllocatedMemorySize|0x19100000  # Start here, DXE heap
  gQcomTokenSpaceGuid.PcdMipiFrameBufferAddress|0xe1000000

  gArmPlatformTokenSpaceGuid.PcdCoreCount|8
  gArmPlatformTokenSpaceGuid.PcdClusterCount|3

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
  AslUpdateLib|Silicon/Qualcomm/QcomPkg/Library/DxeAslUpdateLib/DxeAslUpdateLib.inf

  MemoryInitPeiLib|Silicon/Qualcomm/sm8350/Library/MemoryInitPeiLib/PeiMemoryAllocationLib.inf
  PlatformPeiLib|Silicon/Qualcomm/sm8350/Library/PlatformPeiLib/PlatformPeiLib.inf
  PlatformPrePiLib|Silicon/Qualcomm/sm8350/Library/PlatformPrePiLib/PlatformPrePiLib.inf
  MsPlatformDevicesLib|Silicon/Qualcomm/sm8350/Library/MsPlatformDevicesLib/MsPlatformDevicesLib.inf
  SOCSmbiosInfoLib|Silicon/Qualcomm/sm8350/Library/SOCSmbiosInfoLib/SOCSmbiosInfoLib.inf

[Components.common]
!ifdef $(AB_SLOTS_SUPPORT)
  Silicon/Qualcomm/QcomPkg/Drivers/BootSlotDxe/BootSlotDxe.inf
  Platform/RenegadePkg/Application/SwitchSlotsApp/SwitchSlotsApp.inf
!endif #$(AB_SLOTS_SUPPORT)

  Platform/EFI_Binaries/Applications/LinuxSimpleMassStorage/LinuxSimpleMassStorage.inf
  Silicon/Qualcomm/QcomPkg/Drivers/SynapticsTouchDxe/SynapticsTouchDevice.inf
  Silicon/Qualcomm/QcomPkg/Drivers/SynapticsTouchDxe/SynapticsTouchDxe.inf
  
  Platform/RenegadePkg/Drivers/KernelErrataPatcher/KernelErrataPatcher.inf
