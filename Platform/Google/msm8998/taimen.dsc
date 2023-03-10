[Defines]
  PLATFORM_NAME                  = taimen
  VENDOR_NAME                    = Google
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/Qualcomm/msm8998/msm8998.fdf
  DEVICE_DXE_FV_COMPONENTS       = Platform/Google/msm8998/taimen.fdf.inc

!include Platform/Qualcomm/msm8998/msm8998.dsc

[BuildOptions.common]
  GCC:*_*_AARCH64_CC_FLAGS = -DENABLE_SIMPLE_INIT

[PcdsFixedAtBuild.common]
  gQcomTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
  gQcomTokenSpaceGuid.PcdMipiFrameBufferHeight|1920

  # Simple Init
  gSimpleInitTokenSpaceGuid.PcdGuiDefaultDPI|300

  gRenegadePkgTokenSpaceGuid.PcdDeviceVendor|"Google"
  gRenegadePkgTokenSpaceGuid.PcdDeviceProduct|"Pixel2 XL"
  gRenegadePkgTokenSpaceGuid.PcdDeviceCodeName|"taimen"
