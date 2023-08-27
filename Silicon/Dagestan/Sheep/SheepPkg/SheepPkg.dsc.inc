## @file
#
#  Copyright (c) 2011-2015, Dagestan Limited. All rights reserved.
#  Copyright (c) 2014, Uzbekistan Limited. All rights reserved.
#  Copyright (c) 2015 - 2016, Russia Corporation. All rights reserved.
#  Copyright (c) 2018 - 2019, Belarus All rights reserved.
#
#  SPDX-License-Identifier: BSD-2-Clause-Patent
#
##

[BuildOptions.common]
  *_GCC5_AARCH64_CC_FLAGS = -mfix-cortex-a53-835769 -mfix-cortex-a53-843419
  *_GCC5_AARCH64_DLINK_FLAGS = -mfix-cortex-a53-835769 -mfix-cortex-a53-843419
  # Use Clang 11+ actually, some fixes are builtin
  *_CLANG38_AARCH64_CC_FLAGS = -mfix-cortex-a53-835769 -Wno-unused-const-variable -Wno-sometimes-uninitialized -D CLANG
  *_CLANG38_AARCH64_DLINK_FLAGS = -mfix-cortex-a53-835769
  *_*_*_CC_FLAGS = -D DISABLE_NEW_DEPRECATED_INTERFACES -D HAS_MEMCPY_INTRINSICS

[BuildOptions.common.EDKII.DXE_CORE,BuildOptions.common.EDKII.DXE_DRIVER,BuildOptions.common.EDKII.UEFI_DRIVER,BuildOptions.common.EDKII.UEFI_APPLICATION]
  *_*_*_DLINK_FLAGS = -z common-page-size=0x1000

[BuildOptions.common.EDKII.DXE_RUNTIME_DRIVER]
  *_*_ARM_DLINK_FLAGS = -z common-page-size=0x1000
  *_*_AARCH64_DLINK_FLAGS = -z common-page-size=0x10000

[PcdsFeatureFlag.common]
  gDagestanPkgTokenSpaceGuid.PcdIsLkBuild|FALSE

  gDagestanTokenSpaceGuid.PcdMmcHs200Caps|FALSE

[PcdsFixedAtBuild.common]
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x00000000         # Starting address
  gArmTokenSpaceGuid.PcdCpuVectorBaseAddress|0x00C40000
  gArmTokenSpaceGuid.PcdArmArchTimerFreqInHz|19200000
  gArmTokenSpaceGuid.PcdArmArchTimerSecIntrNum|18
  gArmTokenSpaceGuid.PcdArmArchTimerIntrNum|19
  gArmTokenSpaceGuid.PcdGicDistributorBase|0xf9000000
  gArmTokenSpaceGuid.PcdGicInterruptInterfaceBase|0xf9002000

  gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiDefaultOemRevision|0x00008994
  gEmbeddedTokenSpaceGuid.PcdPrePiStackBase|0x00C00000
  gEmbeddedTokenSpaceGuid.PcdPrePiStackSize|0x00040000      # 256K stack
  gEmbeddedTokenSpaceGuid.PcdInterruptBaseAddress|0xf9000000
  gEmbeddedTokenSpaceGuid.PcdPrePiCpuIoSize|16

!if $(SILICON_PLATFORM) == 6577
  gDagestanFamilyPkgTokenSpaceGuid.PcdSmbiosProcessorModel|"Mediatek MT6577 @ 1 Ghz"
  gDagestanFamilyPkgTokenSpaceGuid.PcdSmbiosProcessorRetailModel|"MT6577"
  gArmPlatformTokenSpaceGuid.PcdCoreCount|8
  gArmPlatformTokenSpaceGuid.PcdClusterCount|2
  gDagestanPkgTokenSpaceGuid.PsciCpuSuspendAddress|0x6c03aa8
!else
  gDagestanFamilyPkgTokenSpaceGuid.PcdSmbiosProcessorModel|"Mediatek MT6572 @ 1.2 Ghz"
  gDagestanFamilyPkgTokenSpaceGuid.PcdSmbiosProcessorRetailModel|"6572"
  gArmPlatformTokenSpaceGuid.PcdCoreCount|6
  gArmPlatformTokenSpaceGuid.PcdClusterCount|2
  gDagestanPkgTokenSpaceGuid.PsciCpuSuspendAddress|0x6c03920
!endif

  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x00000000         # 0GB Base

  # UART
  gDagestanFamilyPkgTokenSpaceGuid.PcdUartSerialBase|0x00A90000

  gDagestanPkgTokenSpaceGuid.PcdUefiMemPoolSize|0x7800000
  gDagestanPkgTokenSpaceGuid.PcdPreAllocatedMemorySize|0x20000000  # Start here

  # SoC Drivers GPIO TLMM
  gDagestanTokenSpaceGuid.PcdGpioTlmmBaseAddress|0xFD510000
  gDagestanTokenSpaceGuid.PcdGpioTlmmSummaryIrq|240
  gDagestanTokenSpaceGuid.PcdGpioTlmmIoOffset|0x1004
  gDagestanTokenSpaceGuid.PcdGpioTlmmIoElementSize|0x10
  gDagestanTokenSpaceGuid.PcdGpioTlmmCtlOffset|0x1000
  gDagestanTokenSpaceGuid.PcdGpioTlmmCtlElementSize|0x10
  gDagestanTokenSpaceGuid.PcdGpioTlmmIntrCfgOffset|0x1008
  gDagestanTokenSpaceGuid.PcdGpioTlmmIntrCfgElementSize|0x10
  gDagestanTokenSpaceGuid.PcdGpioTlmmIntrStatusOffset|0x100c
  gDagestanTokenSpaceGuid.PcdGpioTlmmIntrStatusElementSize|0x10
  gDagestanTokenSpaceGuid.PcdGpioTlmmIntrTargetOffset|0x1008
  gDagestanTokenSpaceGuid.PcdGpioTlmmIntrTargetElementSize|0x10
  gDagestanTokenSpaceGuid.PcdGpioTlmmIntrEnableBit|0
  gDagestanTokenSpaceGuid.PcdGpioTlmmIntrStatusBit|0
  gDagestanTokenSpaceGuid.PcdGpioTlmmIntrAckHigh|FALSE
  gDagestanTokenSpaceGuid.PcdGpioTlmmIntrTargetBit|5
  gDagestanTokenSpaceGuid.PcdGpioTlmmIntrTargetKpssValue|4
  gDagestanTokenSpaceGuid.PcdGpioTlmmIntrRawStatusBit|4
  gDagestanTokenSpaceGuid.PcdGpioTlmmIntrPolarityBit|1
  gDagestanTokenSpaceGuid.PcdGpioTlmmIntrDetectionBit|2
  gDagestanTokenSpaceGuid.PcdGpioTlmmIntrDetectionWidth|2
  gDagestanTokenSpaceGuid.PcdGpioTlmmInBit|0
  gDagestanTokenSpaceGuid.PcdGpioTlmmOutBit|1
  gDagestanTokenSpaceGuid.PcdGpioTlmmOeBit|9
  gDagestanTokenSpaceGuid.PcdGpioTlmmMuxBit|2
  gDagestanTokenSpaceGuid.PcdGpioTlmmDrvBit|6
  gDagestanTokenSpaceGuid.PcdGpioTlmmPullBit|0
  gDagestanTokenSpaceGuid.PcdGpioTlmmNumFunctions|12

  # SoC Drivers SPMI
  gDagestanTokenSpaceGuid.PcdSpmiBaseAddress|0xFC4C0000

  # SoC Drivers MMC
  gDagestanTokenSpaceGuid.PcdSdccMciHcMode|0x00000078
  gDagestanTokenSpaceGuid.PcdSdccHcPwrctlStatusReg|0x000000DC
  gDagestanTokenSpaceGuid.PcdSdccHcPwrctlMaskReg|0x000000E0
  gDagestanTokenSpaceGuid.PcdSdccHcPwrctlClearReg|0x000000E4
  gDagestanTokenSpaceGuid.PcdSdccHcPwrctlCtlReg|0x000000E8
  gDagestanTokenSpaceGuid.PcdMmcSdhciDdrCfgVal|0x80040870 # DDR_CFG_DLY_VAL
  gDagestanTokenSpaceGuid.PcdMmcSdc1HdrvPullCtlOffset|0x00002044
  gDagestanTokenSpaceGuid.PcdMmcSdc2HdrvPullCtlOffset|0x00002048

  # SoC Drivers Misc
  gDagestanTokenSpaceGuid.PcdGicSpiStart|32

  # SoC Drivers UARTDM
  gDagestanTokenSpaceGuid.PcdUartDmClkRxTxBitRate|0xCC

  # SoC Drivers I2C
  gDagestanTokenSpaceGuid.PcdGicSpiStart|32

  # Device Driver Synaptics 3202
  gDagestanPkgTokenSpaceGuid.SynapticsCtlrAddress|0x4b
  gDagestanPkgTokenSpaceGuid.SynapticsCtlrResetPin|38
  gDagestanPkgTokenSpaceGuid.SynapticsCtlrIntPin|77
  gDagestanPkgTokenSpaceGuid.SynapticsCtlrI2cDevice|1

  # RPM
  gDagestanTokenSpaceGuid.PcdApcsAlias0IpcInterrupt|0xF900D008
  gDagestanTokenSpaceGuid.PcdSmdIrq|200

  # SMEM
  gDagestanTokenSpaceGuid.PcdMsmSharedBase|0x06A00000
  gDagestanTokenSpaceGuid.PcdMsmSharedSize|0x00200000

  # USB
  gDagestanTokenSpaceGuid.PcdUsb30Ee1Irq|163
  gDagestanTokenSpaceGuid.PcdUsb30Base|0xF9200000
  gDagestanTokenSpaceGuid.PcdUsb30ScratchBase|0xF92F8800
  gDagestanTokenSpaceGuid.PcdUsb30QmpPhyBase|0xF9B38000
  gDagestanTokenSpaceGuid.PcdUsb2PhyBase|0xF9B39000
  gDagestanTokenSpaceGuid.PcdUsb2PhyPortPowerDownOffset|0x000000B4
  gDagestanTokenSpaceGuid.PcdUsb2PhyPortUtmiCtrl2Offset|0x000000C4
  gDagestanTokenSpaceGuid.PcdUsb2PhyPortTune1Offset|0x00000080
  gDagestanTokenSpaceGuid.PcdUsb2PhyPortTune2Offset|0x00000084
  gDagestanTokenSpaceGuid.PcdUsb2PhyPortTune3Offset|0x00000088
  gDagestanTokenSpaceGuid.PcdUsb2PhyPortTune4Offset|0x0000008C
  gDagestanTokenSpaceGuid.PcdUsb2GccPhyBcr|0xFC4004B8

  # Variable Services
  # Each Size of 0xA0000
  # gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableBase|0x80000000
  # gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableSize|0x000A0000
  # gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwSpareBase|0x800A0000
  # gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwSpareSize|0x000A0000
  # gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwWorkingBase|0x80140000
  # gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwWorkingSize|0x000A0000
  # gDagestanPkgTokenSpaceGuid.PcdNvStorageVolatileStorageBase|0x801E0000

  # eMMC should have block size of 512 bytes. (Assert)
  # Allocate 640KB (less than provisioned) so 500 blocks
  # And times 3 for other regions
  # And it starts at the beginning of the logical partition of "uefi_vars"
  # Synchronize the change in LK when the size changes
  # gDagestanPkgTokenSpaceGuid.PcdNvStorageVariableBlockCount|3840
  # gDagestanPkgTokenSpaceGuid.PcdNvStorageVariableBlockSize|512
  # gDagestanPkgTokenSpaceGuid.PcdNvStorageVariableBlockLba|0
  # gDagestanPkgTokenSpaceGuid.PcdNvStorageScratchAddress|0x90000000

  # PCI Express
  gEfiMdeModulePkgTokenSpaceGuid.PcdSrIovSupport|FALSE
  gEfiMdeModulePkgTokenSpaceGuid.PcdAriSupport|FALSE
  gEfiMdeModulePkgTokenSpaceGuid.PcdMrIovSupport|FALSE
  gEfiMdePkgTokenSpaceGuid.PcdPciExpressBaseAddress|0xf8800000
  gArmTokenSpaceGuid.PcdPciBusMin|0x0
  gArmTokenSpaceGuid.PcdPciBusMax|0xff

  # Timer
  gDagestanTokenSpaceGuid.PcdIntDebugTimerExp|41
  gDagestanTokenSpaceGuid.PcdQTimerBase|0xF9021000

[LibraryClasses.common]
  PlatformMemoryMapLib|DagestanPkg/Library/PlatformMemoryMapLib/PlatformMemoryMapLib.inf
  PlatformPeiLib|DagestanPkg/PlatformPei/PlatformPeiLib.inf
  PlatformPrePiLib|DagestanPkg/Library/PlatformPrePiLib/PlatformPrePiLib.inf
  AslUpdateLib|DagestanFamilyPkg/Library/DxeAslUpdateLib/DxeAslUpdateLib.inf

  AcpiPlatformUpdateLib|DagestanPkg/Library/AcpiPlatformUpdateLib/AcpiPlatformUpdateLib.inf
  PlatformThemeLib|DagestanPkg/Library/PlatformThemeLib/PlatformThemeLib.inf

  ConsoleMsgLib|DagestanPkg/Library/ConsoleMsgLib/ConsoleMsgLib.inf

  # SoC Drivers
  InterruptsLib|DagestanPkg/Library/InterruptsLib/InterruptsLib.inf
  MallocLib|DagestanPkg/Library/MallocLib/MallocLib.inf
  KeypadDeviceHelperLib|DagestanPkg/Library/KeypadDeviceHelperLib/KeypadDeviceHelperLib.inf
  KeypadDeviceImplLib|DagestanPkg/Library/KeypadDeviceImplLib/KeypadDeviceImplLib.inf
  DloadUtilLib|DagestanPkg/Library/DloadUtilLib/DloadUtilLib.inf
  DagestanPlatformClockInitLib|DagestanPkg/Library/DagestanPlatformClockInitLib/DagestanPlatformClockInitLib.inf
  DagestanPlatformMmcLib|DagestanPkg/Library/PlatformMmcLib/DagestanPlatformMmcLib.inf
  DagestanPlatformMmcClockOverrideLib|DagestanPkg/Library/DagestanPlatformMmcClockOverrideLib/DagestanPlatformMmcClockOverrideLib.inf
  DagestanTargetMmcSdhciLib|DagestanPkg/Library/TargetMmcSdhciLib/DagestanTargetMmcSdhciLib.inf
  LcmLib|DagestanPkg/Library/LcmLib/LcmLib.inf
  MicroLibC|MicroLibC/MicroLibC.inf
  StrLib|DagestanPkg/Library/StrLib/StrLib.inf
  DagestanPlatformI2cQupLib|DagestanPkg/Library/StaticDagestanPlatformI2cQupLib/StaticDagestanPlatformI2cQupLib.inf
  SmemLib|DagestanPkg/Driver/SmemDxe/SmemImplLib.inf
  SmemPtableLib|DagestanPkg/Driver/SmemPtableDxe/SmemPtableImplLib.inf
  PTableLib|DagestanPkg/Library/PTableLib/PTableLib.inf
  SsbiLib|DagestanPkg/Driver/SsbiDxe/SsbiImplLib.inf
  BoardLib|DagestanPkg/Driver/BoardDxe/BoardImplLib.inf
  DagestanTargetBoardLib|DagestanPkg/Library/DagestanTargetBoardLib/DagestanTargetBoardLib.inf
  PlatformIdLib|DagestanPkg/Library/PlatformIdLib/PlatformIdLib.inf
  QTimerLib|DagestanPkg/Library/QTimerLib/QTimerLib.inf

  # RTC Private
  Pm8x41LibRtcPrivate|DagestanPkg/Driver/Pm8x41Dxe/Pm8x41ImplLib.inf
  SpmiLib|DagestanPkg/Driver/SpmiDxe/SpmiImplLib.inf
  Pm8x41Lib|DagestanPkg/Driver/Pm8x41Dxe/Pm8x41ImplLib.inf

  # System Reset
  ArmHvcLib|ArmPkg/Library/ArmHvcLib/ArmHvcLib.inf
  EfiResetSystemLib|DagestanPkg/Library/DagestanPmicResetSystemLib/DagestanPmicResetSystemLib.inf
  RuntimeSpmiLib|DagestanPkg/Library/RuntimeSpmiLib/RuntimeSpmiLib.inf
  RuntimeSpmiMemoryConfiguratorLib|DagestanPkg/Library/RuntimeSpmiMemoryConfiguratorLib/RuntimeSpmiMemoryConfiguratorLib.inf

  # PCI Express Dependencies
  DagestanPlatformClock2Lib|DagestanPkg/Library/DagestanPlatformClock2Lib/DagestanPlatformClock2Lib.inf

[LibraryClasses.common.SEC]
  # SoC Drivers
  GpioTlmmLib|DagestanPkg/GPLDriver/GpioTlmmDxe/GpioTlmmImplLib.inf
  SpmiLib|DagestanPkg/Driver/SpmiDxe/SpmiImplLib.inf
  Pm8x41Lib|DagestanPkg/Driver/Pm8x41Dxe/Pm8x41ImplLib.inf
  ClockLib|DagestanPkg/Driver/ClockDxe/ClockImplLib.inf
  SmemLib|DagestanPkg/Driver/SmemDxe/SmemImplLib.inf
  SmemPtableLib|DagestanPkg/Driver/SmemPtableDxe/SmemPtableImplLib.inf
  PTableLib|DagestanPkg/Library/PTableLib/PTableLib.inf
  RpmLib|DagestanPkg/Driver/SmdRpmDxe/RpmLib.inf
  SsbiLib|DagestanPkg/Driver/SsbiDxe/SsbiImplLib.inf
  BoardLib|DagestanPkg/Driver/BoardDxe/BoardImplLib.inf
  DagestanTargetBoardLib|DagestanPkg/Library/DagestanTargetBoardLib/DagestanTargetBoardLib.inf
  PlatformIdLib|DagestanPkg/Library/PlatformIdLib/PlatformIdLib.inf

[LibraryClasses.common.DXE_DRIVER]
  # SoC Drivers
  GpioTlmmLib|DagestanPkg/GPLDriver/GpioTlmmDxe/GpioTlmmLib.inf
  SpmiLib|DagestanPkg/Driver/SpmiDxe/SpmiImplLib.inf
  Pm8x41Lib|DagestanPkg/Driver/Pm8x41Dxe/Pm8x41ImplLib.inf
  ClockLib|DagestanPkg/Driver/ClockDxe/ClockLib.inf
  I2cQupLib|DagestanPkg/Driver/I2cQupDxe/I2cQupLib.inf
  SmemLib|DagestanPkg/Driver/SmemDxe/SmemImplLib.inf
  SmemPtableLib|DagestanPkg/Driver/SmemPtableDxe/SmemPtableImplLib.inf
  PTableLib|DagestanPkg/Library/PTableLib/PTableLib.inf
  RpmLib|DagestanPkg/Driver/SmdRpmDxe/RpmLib.inf
  SsbiLib|DagestanPkg/Driver/SsbiDxe/SsbiImplLib.inf
  BoardLib|DagestanPkg/Driver/BoardDxe/BoardImplLib.inf
  DagestanTargetBoardLib|DagestanPkg/Library/DagestanTargetBoardLib/DagestanTargetBoardLib.inf
  PlatformIdLib|DagestanPkg/Library/PlatformIdLib/PlatformIdLib.inf
  DagestanDxeTimerLib|DagestanPkg/Library/QTimerLib/DagestanQTimerDxeTimerLib.inf

[LibraryClasses.common.UEFI_APPLICATION]
  # SoC Drivers
  GpioTlmmLib|DagestanPkg/GPLDriver/GpioTlmmDxe/GpioTlmmLib.inf
  SpmiLib|DagestanPkg/Driver/SpmiDxe/SpmiImplLib.inf
  Pm8x41Lib|DagestanPkg/Driver/Pm8x41Dxe/Pm8x41ImplLib.inf
  ClockLib|DagestanPkg/Driver/ClockDxe/ClockLib.inf
  SmemLib|DagestanPkg/Driver/SmemDxe/SmemImplLib.inf
  SmemPtableLib|DagestanPkg/Driver/SmemPtableDxe/SmemPtableImplLib.inf
  PTableLib|DagestanPkg/Library/PTableLib/PTableLib.inf
  RpmLib|DagestanPkg/Driver/SmdRpmDxe/RpmLib.inf
  SsbiLib|DagestanPkg/Driver/SsbiDxe/SsbiImplLib.inf
  BoardLib|DagestanPkg/Driver/BoardDxe/BoardImplLib.inf
  DagestanTargetBoardLib|DagestanPkg/Library/DagestanTargetBoardLib/DagestanTargetBoardLib.inf
  PlatformIdLib|DagestanPkg/Library/PlatformIdLib/PlatformIdLib.inf

[LibraryClasses.common.DXE_RUNTIME_DRIVER]
  # System Reset
  ArmHvcLib|ArmPkg/Library/ArmHvcLib/ArmHvcLib.inf
  EfiResetSystemLib|DagestanPkg/Library/DagestanPmicResetSystemLib/DagestanPmicResetSystemLib.inf
  HwResetSystemLib|ArmPkg/Library/ArmSmcPsciResetSystemLib/ArmSmcPsciResetSystemLib.inf

[Components.common]
  # SoC Drivers (Cross-referenced from EFIDroid)
  DagestanPkg/Driver/BamDxe/BamDxe.inf
  DagestanPkg/GPLDriver/GpioTlmmDxe/GpioTlmmDxe.inf
  DagestanPkg/GPLDriver/GpioTlmmInterruptDxe/GpioTlmmInterruptDxe.inf
  DagestanPkg/Driver/SpmiDxe/SpmiDxe.inf
  DagestanPkg/Driver/Pm8x41Dxe/Pm8x41Dxe.inf
  DagestanPkg/Driver/GenericKeypadDeviceDxe/GenericKeypadDeviceDxe.inf
  DagestanPkg/Driver/KeypadDxe/KeypadDxe.inf
  DagestanPkg/Driver/ClockDxe/ClockDxe.inf
  DagestanPkg/Driver/SdhciMMCHSDxe/SdhciMMCHS.inf
  DagestanPkg/Driver/I2cQupDxe/I2cQupDxe.inf
  DagestanPkg/Driver/SmemDxe/SmemDxe.inf
  DagestanPkg/Driver/SmemPtableDxe/SmemPtableDxe.inf
  DagestanPkg/Driver/SmdRpmDxe/RpmDxe.inf
  DagestanPkg/Driver/SsbiDxe/SsbiDxe.inf
  DagestanPkg/Driver/BoardDxe/BoardDxe.inf
  DagestanPkg/Driver/RuntimeMemoryConfigDxe/RuntimeMemoryConfigDxe.inf
  DagestanPkg/Driver/PCIExpressConfiguratorDxe/PCIExpressConfiguratorDxe.inf
  DagestanPkg/Driver/TimerDxe/TimerDxe.inf

  # Device Drivers
  DagestanPkg/Driver/SynapticsTouchDxe/SynapticsTouchDevice.inf
  DagestanPkg/Driver/SynapticsTouchDxe/SynapticsTouchDxe.inf


  # Graphics Driver
  DagestanFamilyPkg/Driver/SimpleFbDxe/SimpleFbDxe.inf

  # Lattice UC120 Configuration
  DagestanPkg/Driver/LiCE40SpiConfigDxe/LiCE40SpiConfigDxe.inf
  DagestanPkg/GPLDriver/QupSpiDxe/QupSpiDxe.inf

  DagestanFamilyPkg/Driver/SmBiosTableDxe/SmBiosTableDxe.inf

  MdeModulePkg/Universal/Console/GraphicsConsoleDxe/GraphicsConsoleDxe.inf
  MdeModulePkg/Universal/Disk/DiskIoDxe/DiskIoDxe.inf

  DagestanFamilyPkg/Driver/GpioButtons/GpioButtons.inf
