[Defines]
  VENDOR_NAME                    = Xiaomi
  PLATFORM_NAME                  = nabu
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/Qualcomm/sm8150/sm8150.fdf
  DEVICE_DXE_FV_COMPONENTS       = Platform/Xiaomi/sm8150/nabu.fdf.inc
  
  # Enable A/B Slot Environment
  AB_SLOTS_SUPPORT               = FALSE

!include Platform/Qualcomm/sm8150/sm8150.dsc

[BuildOptions.common]
  GCC:*_*_AARCH64_CC_FLAGS = -DMEMMAP_XIAOMI_HACKS=1 -DENABLE_SIMPLE_INIT -DENABLE_LINUX_SIMPLE_MASS_STORAGE

[PcdsFixedAtBuild.common]
  gQcomTokenSpaceGuid.PcdMipiFrameBufferWidth|1600
  gQcomTokenSpaceGuid.PcdMipiFrameBufferHeight|2560

  # Simple Init
  gSimpleInitTokenSpaceGuid.PcdGuiDefaultDPI|320

  gRenegadePkgTokenSpaceGuid.PcdDeviceVendor|"Xiaomi"
  gRenegadePkgTokenSpaceGuid.PcdDeviceProduct|"Pad 5"
  gRenegadePkgTokenSpaceGuid.PcdDeviceCodeName|"nabu"

  gsm8150PkgTokenSpaceGuid.PcdSmbiosProcessorModel|"Snapdragon (TM) 860 @ 2.96 GHz"

  gQcomTokenSpaceGuid.PcdHallSensorPin|9
  gQcomTokenSpaceGuid.PcdHallSensorActiveLow|TRUE