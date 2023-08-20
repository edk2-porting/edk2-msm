[Defines]
  VENDOR_NAME                    = Xiaomi
  PLATFORM_NAME                  = yudi
  PLATFORM_GUID                  = 6eaa81ea-98c3-6d92-de4a-4b1c3dd714c2
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/Qualcomm/sm8475/sm8475.fdf
  DEVICE_DXE_FV_COMPONENTS       = Platform/Xiaomi/sm8475/yudi.fdf.inc

!include Platform/Qualcomm/sm8475/sm8475.dsc

[BuildOptions.common]
  GCC:*_*_AARCH64_CC_FLAGS = -DENABLE_SIMPLE_INIT

[PcdsFixedAtBuild.common]
  gQcomTokenSpaceGuid.PcdMipiFrameBufferWidth|2880
  gQcomTokenSpaceGuid.PcdMipiFrameBufferHeight|1800

  # Simple Init
  gSimpleInitTokenSpaceGuid.PcdGuiDefaultDPI|426

  gRenegadePkgTokenSpaceGuid.PcdDeviceVendor|"Xiaomi"
  gRenegadePkgTokenSpaceGuid.PcdDeviceProduct|"Pad 6 Max 14"
  gRenegadePkgTokenSpaceGuid.PcdDeviceCodeName|"yudi"
