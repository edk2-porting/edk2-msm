[Defines]
  PLATFORM_NAME                  = bluejay
  PLATFORM_GUID                  = 30ac5eb8-bec2-444f-b624-3f7e7c77d440
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/Google/tensor/tensor.fdf
  DEVICE_DXE_FV_COMPONENTS       = Platform/Google/tensor/bluejay.fdf.inc

!include Platform/Google/tensor/tensor.dsc

[BuildOptions.common]
  GCC:*_*_AARCH64_CC_FLAGS = -DENABLE_SIMPLE_INIT -DENABLE_LINUX_SIMPLE_MASS_STORAGE

[PcdsFixedAtBuild.common]

  gQcomTokenSpaceGuid.PcdMipiFrameBufferAddress|0xFAC00000
  gQcomTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
  gQcomTokenSpaceGuid.PcdMipiFrameBufferHeight|2400

  gRenegadePkgTokenSpaceGuid.PcdDeviceVendor|"Google"
  gRenegadePkgTokenSpaceGuid.PcdDeviceProduct|"Pixel 6a"
  gRenegadePkgTokenSpaceGuid.PcdDeviceCodeName|"bluejay"

  # Simple Init
  gSimpleInitTokenSpaceGuid.PcdGuiDefaultDPI|512
