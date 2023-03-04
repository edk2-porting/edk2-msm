[Defines]
  VENDOR_NAME                    = Google
  PLATFORM_NAME                  = sargo
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/Qualcomm/sdm670/sdm670.fdf
  DEVICE_DXE_FV_COMPONENTS       = Platform/Google/sdm670/sargo.fdf.inc

!include Platform/Qualcomm/sdm670/sdm670.dsc

[BuildOptions.common]
  GCC:*_*_AARCH64_CC_FLAGS = -DENABLE_SIMPLE_INIT -DENABLE_LINUX_SIMPLE_MASS_STORAGE

[PcdsFixedAtBuild.common]
  gQcomTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
  gQcomTokenSpaceGuid.PcdMipiFrameBufferHeight|2220

  # Simple Init
  gSimpleInitTokenSpaceGuid.PcdGuiDefaultDPI|350

  gRenegadePkgTokenSpaceGuid.PcdDeviceVendor|"Google"
  gRenegadePkgTokenSpaceGuid.PcdDeviceProduct|"Pixel 3a"
  gRenegadePkgTokenSpaceGuid.PcdDeviceCodeName|"sargo"
