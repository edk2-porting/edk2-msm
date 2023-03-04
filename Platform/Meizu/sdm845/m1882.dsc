[Defines]
  VENDOR_NAME                    = Meizu
  PLATFORM_NAME                  = m1882
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/Qualcomm/sdm845/sdm845.fdf
  DEVICE_DXE_FV_COMPONENTS       = Platform/Meizu/sdm845/m18x2.fdf.inc
  
!include Platform/Qualcomm/sdm845/sdm845.dsc

[BuildOptions.common]
  GCC:*_*_AARCH64_CC_FLAGS = -DENABLE_SIMPLE_INIT -DENABLE_LINUX_SIMPLE_MASS_STORAGE

[PcdsFixedAtBuild.common]

  gQcomTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
  gQcomTokenSpaceGuid.PcdMipiFrameBufferHeight|2160

  gRenegadePkgTokenSpaceGuid.PcdDeviceVendor|"Meizu"
  gRenegadePkgTokenSpaceGuid.PcdDeviceProduct|"16th"
  gRenegadePkgTokenSpaceGuid.PcdDeviceCodeName|"m1882"
