## @file
#
#  Copyright (c) 2011-2015, Mediatek Limited. All rights reserved.
#  Copyright (c) 2014, Mediatek Limited. All rights reserved.
#  Copyright (c) 2015 - 2016, Mediatek Corporation. All rights reserved.
#  Copyright (c) 2018 - 2019, Mediatek All rights reserved.
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
  gMtkPkgTokenSpaceGuid.PcdIsLkBuild|FALSE

  gMtkTokenSpaceGuid.PcdMmcHs200Caps|FALSE

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
  gMediatekFamilyPkgTokenSpaceGuid.PcdSmbiosProcessorModel|"Mediatek MT6577 @ 1 Ghz"
  gMediatekFamilyPkgTokenSpaceGuid.PcdSmbiosProcessorRetailModel|"MT6577"
  gArmPlatformTokenSpaceGuid.PcdCoreCount|8
  gArmPlatformTokenSpaceGuid.PcdClusterCount|2
  gMtkPkgTokenSpaceGuid.PsciCpuSuspendAddress|0x6c03aa8
!else
  gMediatekFamilyPkgTokenSpaceGuid.PcdSmbiosProcessorModel|"Mediatek MT6572 @ 1.2 Ghz"
  gMediatekFamilyPkgTokenSpaceGuid.PcdSmbiosProcessorRetailModel|"6572"
  gArmPlatformTokenSpaceGuid.PcdCoreCount|6
  gArmPlatformTokenSpaceGuid.PcdClusterCount|2
  gMtkPkgTokenSpaceGuid.PsciCpuSuspendAddress|0x6c03920
!endif

  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x00000000         # 0GB Base

  # UART
  gMediatekFamilyPkgTokenSpaceGuid.PcdUartSerialBase|0x00A90000

  gMtkPkgTokenSpaceGuid.PcdUefiMemPoolSize|0x7800000
  gMtkPkgTokenSpaceGuid.PcdPreAllocatedMemorySize|0x20000000  # Start here

  # SoC Drivers GPIO TLMM
  gMtkTokenSpaceGuid.PcdGpioTlmmBaseAddress|0xFD510000
  gMtkTokenSpaceGuid.PcdGpioTlmmSummaryIrq|240
  gMtkTokenSpaceGuid.PcdGpioTlmmIoOffset|0x1004
  gMtkTokenSpaceGuid.PcdGpioTlmmIoElementSize|0x10
  gMtkTokenSpaceGuid.PcdGpioTlmmCtlOffset|0x1000
  gMtkTokenSpaceGuid.PcdGpioTlmmCtlElementSize|0x10
  gMtkTokenSpaceGuid.PcdGpioTlmmIntrCfgOffset|0x1008
  gMtkTokenSpaceGuid.PcdGpioTlmmIntrCfgElementSize|0x10
  gMtkTokenSpaceGuid.PcdGpioTlmmIntrStatusOffset|0x100c
  gMtkTokenSpaceGuid.PcdGpioTlmmIntrStatusElementSize|0x10
  gMtkTokenSpaceGuid.PcdGpioTlmmIntrTargetOffset|0x1008
  gMtkTokenSpaceGuid.PcdGpioTlmmIntrTargetElementSize|0x10
  gMtkTokenSpaceGuid.PcdGpioTlmmIntrEnableBit|0
  gMtkTokenSpaceGuid.PcdGpioTlmmIntrStatusBit|0
  gMtkTokenSpaceGuid.PcdGpioTlmmIntrAckHigh|FALSE
  gMtkTokenSpaceGuid.PcdGpioTlmmIntrTargetBit|5
  gMtkTokenSpaceGuid.PcdGpioTlmmIntrTargetKpssValue|4
  gMtkTokenSpaceGuid.PcdGpioTlmmIntrRawStatusBit|4
  gMtkTokenSpaceGuid.PcdGpioTlmmIntrPolarityBit|1
  gMtkTokenSpaceGuid.PcdGpioTlmmIntrDetectionBit|2
  gMtkTokenSpaceGuid.PcdGpioTlmmIntrDetectionWidth|2
  gMtkTokenSpaceGuid.PcdGpioTlmmInBit|0
  gMtkTokenSpaceGuid.PcdGpioTlmmOutBit|1
  gMtkTokenSpaceGuid.PcdGpioTlmmOeBit|9
  gMtkTokenSpaceGuid.PcdGpioTlmmMuxBit|2
  gMtkTokenSpaceGuid.PcdGpioTlmmDrvBit|6
  gMtkTokenSpaceGuid.PcdGpioTlmmPullBit|0
  gMtkTokenSpaceGuid.PcdGpioTlmmNumFunctions|12

  # SoC Drivers SPMI
  gMtkTokenSpaceGuid.PcdSpmiBaseAddress|0xFC4C0000

  # SoC Drivers MMC
  gMtkTokenSpaceGuid.PcdSdccMciHcMode|0x00000078
  gMtkTokenSpaceGuid.PcdSdccHcPwrctlStatusReg|0x000000DC
  gMtkTokenSpaceGuid.PcdSdccHcPwrctlMaskReg|0x000000E0
  gMtkTokenSpaceGuid.PcdSdccHcPwrctlClearReg|0x000000E4
  gMtkTokenSpaceGuid.PcdSdccHcPwrctlCtlReg|0x000000E8
  gMtkTokenSpaceGuid.PcdMmcSdhciDdrCfgVal|0x80040870 # DDR_CFG_DLY_VAL
  gMtkTokenSpaceGuid.PcdMmcSdc1HdrvPullCtlOffset|0x00002044
  gMtkTokenSpaceGuid.PcdMmcSdc2HdrvPullCtlOffset|0x00002048

  # SoC Drivers Misc
  gMtkTokenSpaceGuid.PcdGicSpiStart|32

  # SoC Drivers UARTDM
  gMtkTokenSpaceGuid.PcdUartDmClkRxTxBitRate|0xCC

  # SoC Drivers I2C
  gMtkTokenSpaceGuid.PcdGicSpiStart|32

  # Device Driver Synaptics 3202
  gMtkPkgTokenSpaceGuid.SynapticsCtlrAddress|0x4b
  gMtkPkgTokenSpaceGuid.SynapticsCtlrResetPin|38
  gMtkPkgTokenSpaceGuid.SynapticsCtlrIntPin|77
  gMtkPkgTokenSpaceGuid.SynapticsCtlrI2cDevice|1

  # RPM
  gMtkTokenSpaceGuid.PcdApcsAlias0IpcInterrupt|0xF900D008
  gMtkTokenSpaceGuid.PcdSmdIrq|200

  # SMEM
  gMtkTokenSpaceGuid.PcdMsmSharedBase|0x06A00000
  gMtkTokenSpaceGuid.PcdMsmSharedSize|0x00200000

  # USB
  gMtkTokenSpaceGuid.PcdUsb30Ee1Irq|163
  gMtkTokenSpaceGuid.PcdUsb30Base|0xF9200000
  gMtkTokenSpaceGuid.PcdUsb30ScratchBase|0xF92F8800
  gMtkTokenSpaceGuid.PcdUsb30QmpPhyBase|0xF9B38000
  gMtkTokenSpaceGuid.PcdUsb2PhyBase|0xF9B39000
  gMtkTokenSpaceGuid.PcdUsb2PhyPortPowerDownOffset|0x000000B4
  gMtkTokenSpaceGuid.PcdUsb2PhyPortUtmiCtrl2Offset|0x000000C4
  gMtkTokenSpaceGuid.PcdUsb2PhyPortTune1Offset|0x00000080
  gMtkTokenSpaceGuid.PcdUsb2PhyPortTune2Offset|0x00000084
  gMtkTokenSpaceGuid.PcdUsb2PhyPortTune3Offset|0x00000088
  gMtkTokenSpaceGuid.PcdUsb2PhyPortTune4Offset|0x0000008C
  gMtkTokenSpaceGuid.PcdUsb2GccPhyBcr|0xFC4004B8

  # Variable Services
  # Each Size of 0xA0000
  # gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableBase|0x80000000
  # gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableSize|0x000A0000
  # gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwSpareBase|0x800A0000
  # gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwSpareSize|0x000A0000
  # gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwWorkingBase|0x80140000
  # gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwWorkingSize|0x000A0000
  # gMtkPkgTokenSpaceGuid.PcdNvStorageVolatileStorageBase|0x801E0000

  # eMMC should have block size of 512 bytes. (Assert)
  # Allocate 640KB (less than provisioned) so 500 blocks
  # And times 3 for other regions
  # And it starts at the beginning of the logical partition of "uefi_vars"
  # Synchronize the change in LK when the size changes
  # gMtkPkgTokenSpaceGuid.PcdNvStorageVariableBlockCount|3840
  # gMtkPkgTokenSpaceGuid.PcdNvStorageVariableBlockSize|512
  # gMtkPkgTokenSpaceGuid.PcdNvStorageVariableBlockLba|0
  # gMtkPkgTokenSpaceGuid.PcdNvStorageScratchAddress|0x90000000

  # PCI Express
  gEfiMdeModulePkgTokenSpaceGuid.PcdSrIovSupport|FALSE
  gEfiMdeModulePkgTokenSpaceGuid.PcdAriSupport|FALSE
  gEfiMdeModulePkgTokenSpaceGuid.PcdMrIovSupport|FALSE
  gEfiMdePkgTokenSpaceGuid.PcdPciExpressBaseAddress|0xf8800000
  gArmTokenSpaceGuid.PcdPciBusMin|0x0
  gArmTokenSpaceGuid.PcdPciBusMax|0xff

  # Timer
  gMtkTokenSpaceGuid.PcdIntDebugTimerExp|41
  gMtkTokenSpaceGuid.PcdQTimerBase|0xF9021000

[LibraryClasses.common]
  PlatformMemoryMapLib|MtkPkg/Library/PlatformMemoryMapLib/PlatformMemoryMapLib.inf
  PlatformPeiLib|MtkPkg/PlatformPei/PlatformPeiLib.inf
  PlatformPrePiLib|MtkPkg/Library/PlatformPrePiLib/PlatformPrePiLib.inf
  AslUpdateLib|MediatekFamilyPkg/Library/DxeAslUpdateLib/DxeAslUpdateLib.inf

  AcpiPlatformUpdateLib|MtkPkg/Library/AcpiPlatformUpdateLib/AcpiPlatformUpdateLib.inf
  PlatformThemeLib|MtkPkg/Library/PlatformThemeLib/PlatformThemeLib.inf

  ConsoleMsgLib|MtkPkg/Library/ConsoleMsgLib/ConsoleMsgLib.inf

  # SoC Drivers
  InterruptsLib|MtkPkg/Library/InterruptsLib/InterruptsLib.inf
  MallocLib|MtkPkg/Library/MallocLib/MallocLib.inf
  KeypadDeviceHelperLib|MtkPkg/Library/KeypadDeviceHelperLib/KeypadDeviceHelperLib.inf
  KeypadDeviceImplLib|MtkPkg/Library/KeypadDeviceImplLib/KeypadDeviceImplLib.inf
  DloadUtilLib|MtkPkg/Library/DloadUtilLib/DloadUtilLib.inf
  MtkPlatformClockInitLib|MtkPkg/Library/MtkPlatformClockInitLib/MtkPlatformClockInitLib.inf
  MtkPlatformMmcLib|MtkPkg/Library/PlatformMmcLib/MtkPlatformMmcLib.inf
  MtkPlatformMmcClockOverrideLib|MtkPkg/Library/MtkPlatformMmcClockOverrideLib/MtkPlatformMmcClockOverrideLib.inf
  MtkTargetMmcSdhciLib|MtkPkg/Library/TargetMmcSdhciLib/MtkTargetMmcSdhciLib.inf
  LcmLib|MtkPkg/Library/LcmLib/LcmLib.inf
  MicroLibC|MicroLibC/MicroLibC.inf
  StrLib|MtkPkg/Library/StrLib/StrLib.inf
  MtkPlatformI2cQupLib|MtkPkg/Library/StaticMtkPlatformI2cQupLib/StaticMtkPlatformI2cQupLib.inf
  SmemLib|MtkPkg/Driver/SmemDxe/SmemImplLib.inf
  SmemPtableLib|MtkPkg/Driver/SmemPtableDxe/SmemPtableImplLib.inf
  PTableLib|MtkPkg/Library/PTableLib/PTableLib.inf
  SsbiLib|MtkPkg/Driver/SsbiDxe/SsbiImplLib.inf
  BoardLib|MtkPkg/Driver/BoardDxe/BoardImplLib.inf
  MtkTargetBoardLib|MtkPkg/Library/MtkTargetBoardLib/MtkTargetBoardLib.inf
  PlatformIdLib|MtkPkg/Library/PlatformIdLib/PlatformIdLib.inf
  QTimerLib|MtkPkg/Library/QTimerLib/QTimerLib.inf

  # RTC Private
  Pm8x41LibRtcPrivate|MtkPkg/Driver/Pm8x41Dxe/Pm8x41ImplLib.inf
  SpmiLib|MtkPkg/Driver/SpmiDxe/SpmiImplLib.inf
  Pm8x41Lib|MtkPkg/Driver/Pm8x41Dxe/Pm8x41ImplLib.inf

  # System Reset
  ArmHvcLib|ArmPkg/Library/ArmHvcLib/ArmHvcLib.inf
  EfiResetSystemLib|MtkPkg/Library/MtkPmicResetSystemLib/MtkPmicResetSystemLib.inf
  RuntimeSpmiLib|MtkPkg/Library/RuntimeSpmiLib/RuntimeSpmiLib.inf
  RuntimeSpmiMemoryConfiguratorLib|MtkPkg/Library/RuntimeSpmiMemoryConfiguratorLib/RuntimeSpmiMemoryConfiguratorLib.inf

  # PCI Express Dependencies
  MtkPlatformClock2Lib|MtkPkg/Library/MtkPlatformClock2Lib/MtkPlatformClock2Lib.inf

[LibraryClasses.common.SEC]
  # SoC Drivers
  GpioTlmmLib|MtkPkg/GPLDriver/GpioTlmmDxe/GpioTlmmImplLib.inf
  SpmiLib|MtkPkg/Driver/SpmiDxe/SpmiImplLib.inf
  Pm8x41Lib|MtkPkg/Driver/Pm8x41Dxe/Pm8x41ImplLib.inf
  ClockLib|MtkPkg/Driver/ClockDxe/ClockImplLib.inf
  SmemLib|MtkPkg/Driver/SmemDxe/SmemImplLib.inf
  SmemPtableLib|MtkPkg/Driver/SmemPtableDxe/SmemPtableImplLib.inf
  PTableLib|MtkPkg/Library/PTableLib/PTableLib.inf
  RpmLib|MtkPkg/Driver/SmdRpmDxe/RpmLib.inf
  SsbiLib|MtkPkg/Driver/SsbiDxe/SsbiImplLib.inf
  BoardLib|MtkPkg/Driver/BoardDxe/BoardImplLib.inf
  MtkTargetBoardLib|MtkPkg/Library/MtkTargetBoardLib/MtkTargetBoardLib.inf
  PlatformIdLib|MtkPkg/Library/PlatformIdLib/PlatformIdLib.inf

[LibraryClasses.common.DXE_DRIVER]
  # SoC Drivers
  GpioTlmmLib|MtkPkg/GPLDriver/GpioTlmmDxe/GpioTlmmLib.inf
  SpmiLib|MtkPkg/Driver/SpmiDxe/SpmiImplLib.inf
  Pm8x41Lib|MtkPkg/Driver/Pm8x41Dxe/Pm8x41ImplLib.inf
  ClockLib|MtkPkg/Driver/ClockDxe/ClockLib.inf
  I2cQupLib|MtkPkg/Driver/I2cQupDxe/I2cQupLib.inf
  SmemLib|MtkPkg/Driver/SmemDxe/SmemImplLib.inf
  SmemPtableLib|MtkPkg/Driver/SmemPtableDxe/SmemPtableImplLib.inf
  PTableLib|MtkPkg/Library/PTableLib/PTableLib.inf
  RpmLib|MtkPkg/Driver/SmdRpmDxe/RpmLib.inf
  SsbiLib|MtkPkg/Driver/SsbiDxe/SsbiImplLib.inf
  BoardLib|MtkPkg/Driver/BoardDxe/BoardImplLib.inf
  MtkTargetBoardLib|MtkPkg/Library/MtkTargetBoardLib/MtkTargetBoardLib.inf
  PlatformIdLib|MtkPkg/Library/PlatformIdLib/PlatformIdLib.inf
  MtkDxeTimerLib|MtkPkg/Library/QTimerLib/MtkQTimerDxeTimerLib.inf

[LibraryClasses.common.UEFI_APPLICATION]
  # SoC Drivers
  GpioTlmmLib|MtkPkg/GPLDriver/GpioTlmmDxe/GpioTlmmLib.inf
  SpmiLib|MtkPkg/Driver/SpmiDxe/SpmiImplLib.inf
  Pm8x41Lib|MtkPkg/Driver/Pm8x41Dxe/Pm8x41ImplLib.inf
  ClockLib|MtkPkg/Driver/ClockDxe/ClockLib.inf
  SmemLib|MtkPkg/Driver/SmemDxe/SmemImplLib.inf
  SmemPtableLib|MtkPkg/Driver/SmemPtableDxe/SmemPtableImplLib.inf
  PTableLib|MtkPkg/Library/PTableLib/PTableLib.inf
  RpmLib|MtkPkg/Driver/SmdRpmDxe/RpmLib.inf
  SsbiLib|MtkPkg/Driver/SsbiDxe/SsbiImplLib.inf
  BoardLib|MtkPkg/Driver/BoardDxe/BoardImplLib.inf
  MtkTargetBoardLib|MtkPkg/Library/MtkTargetBoardLib/MtkTargetBoardLib.inf
  PlatformIdLib|MtkPkg/Library/PlatformIdLib/PlatformIdLib.inf

[LibraryClasses.common.DXE_RUNTIME_DRIVER]
  # System Reset
  ArmHvcLib|ArmPkg/Library/ArmHvcLib/ArmHvcLib.inf
  EfiResetSystemLib|MtkPkg/Library/MtkPmicResetSystemLib/MtkPmicResetSystemLib.inf
  HwResetSystemLib|ArmPkg/Library/ArmSmcPsciResetSystemLib/ArmSmcPsciResetSystemLib.inf

[Components.common]
  # SoC Drivers (Cross-referenced from EFIDroid)
  MtkPkg/Driver/BamDxe/BamDxe.inf
  MtkPkg/GPLDriver/GpioTlmmDxe/GpioTlmmDxe.inf
  MtkPkg/GPLDriver/GpioTlmmInterruptDxe/GpioTlmmInterruptDxe.inf
  MtkPkg/Driver/SpmiDxe/SpmiDxe.inf
  MtkPkg/Driver/Pm8x41Dxe/Pm8x41Dxe.inf
  MtkPkg/Driver/GenericKeypadDeviceDxe/GenericKeypadDeviceDxe.inf
  MtkPkg/Driver/KeypadDxe/KeypadDxe.inf
  MtkPkg/Driver/ClockDxe/ClockDxe.inf
  MtkPkg/Driver/SdhciMMCHSDxe/SdhciMMCHS.inf
  MtkPkg/Driver/I2cQupDxe/I2cQupDxe.inf
  MtkPkg/Driver/SmemDxe/SmemDxe.inf
  MtkPkg/Driver/SmemPtableDxe/SmemPtableDxe.inf
  MtkPkg/Driver/SmdRpmDxe/RpmDxe.inf
  MtkPkg/Driver/SsbiDxe/SsbiDxe.inf
  MtkPkg/Driver/BoardDxe/BoardDxe.inf
  MtkPkg/Driver/RuntimeMemoryConfigDxe/RuntimeMemoryConfigDxe.inf
  MtkPkg/Driver/PCIExpressConfiguratorDxe/PCIExpressConfiguratorDxe.inf
  MtkPkg/Driver/TimerDxe/TimerDxe.inf

  # Device Drivers
  MtkPkg/Driver/SynapticsTouchDxe/SynapticsTouchDevice.inf
  MtkPkg/Driver/SynapticsTouchDxe/SynapticsTouchDxe.inf


  # Graphics Driver
  MediatekFamilyPkg/Driver/SimpleFbDxe/SimpleFbDxe.inf

  # Lattice UC120 Configuration
  MtkPkg/Driver/LiCE40SpiConfigDxe/LiCE40SpiConfigDxe.inf
  MtkPkg/GPLDriver/QupSpiDxe/QupSpiDxe.inf

  MediatekFamilyPkg/Driver/SmBiosTableDxe/SmBiosTableDxe.inf

  MdeModulePkg/Universal/Console/GraphicsConsoleDxe/GraphicsConsoleDxe.inf
  MdeModulePkg/Universal/Disk/DiskIoDxe/DiskIoDxe.inf

  MediatekFamilyPkg/Driver/GpioButtons/GpioButtons.inf
