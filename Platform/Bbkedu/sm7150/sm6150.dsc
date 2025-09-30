[Defines]
  VENDOR_NAME                    = Bbkedu
  PLATFORM_NAME                  = sm6150
  PLATFORM_GUID                  = 27f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/Qualcomm/sm7150/sm7150.fdf
  DEVICE_DXE_FV_COMPONENTS       = Platform/Bbkedu/sm7150/sm6150.fdf.inc

!include Platform/Qualcomm/sm7150/sm7150.dsc

[BuildOptions.common]
  GCC:*_*_AARCH64_CC_FLAGS = -DENABLE_SIMPLE_INIT -DENABLE_LINUX_SIMPLE_MASS_STORAGE

[PcdsFixedAtBuild.common]
  gQcomTokenSpaceGuid.PcdMipiFrameBufferWidth|1600
  gQcomTokenSpaceGuid.PcdMipiFrameBufferHeight|2176
  # gQcomTokenSpaceGuid.PcdMipiFrameBufferAddress|0x9c400000

  # Simple Init
  gSimpleInitTokenSpaceGuid.PcdGuiDefaultDPI|320

  gRenegadePkgTokenSpaceGuid.PcdDeviceVendor|"Bbkedu"
  gRenegadePkgTokenSpaceGuid.PcdDeviceProduct|"S6"
  gRenegadePkgTokenSpaceGuid.PcdDeviceCodeName|"sm6150"
