[Defines]
  PLATFORM_NAME                  = raven
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/Google/tensor/tensor.fdf
  DEVICE_DXE_FV_COMPONENTS       = Platform/Google/tensor/raven.fdf.inc

!include Platform/Google/tensor/tensor.dsc

[BuildOptions.common]
  GCC:*_*_AARCH64_CC_FLAGS = -DENABLE_SIMPLE_INIT -DENABLE_LINUX_SIMPLE_MASS_STORAGE

[PcdsFixedAtBuild.common]

  gQcomTokenSpaceGuid.PcdMipiFrameBufferAddress|0xFAC00000
  gQcomTokenSpaceGuid.PcdMipiFrameBufferWidth|1440
  gQcomTokenSpaceGuid.PcdMipiFrameBufferHeight|3120

  gRenegadePkgTokenSpaceGuid.PcdDeviceVendor|"Google"
  gRenegadePkgTokenSpaceGuid.PcdDeviceProduct|"Pixel 6 Pro"
  gRenegadePkgTokenSpaceGuid.PcdDeviceCodeName|"raven"

  # Simple Init
  gSimpleInitTokenSpaceGuid.PcdGuiDefaultDPI|512