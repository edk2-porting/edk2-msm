[Defines]
  VENDOR_NAME                    = Bbkedu
  PLATFORM_NAME                  = h7000
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/Qualcomm/sdm660/sdm660.fdf
  DEVICE_DXE_FV_COMPONENTS       = Platform/Bbkedu/sdm660/h7000.fdf.inc

!include Platform/Qualcomm/sdm660/sdm660.dsc

[BuildOptions.common]
  GCC:*_*_AARCH64_CC_FLAGS = -DENABLE_SIMPLE_INIT

[PcdsFixedAtBuild.common]
  gQcomTokenSpaceGuid.PcdMipiFrameBufferWidth|1600
  gQcomTokenSpaceGuid.PcdMipiFrameBufferHeight|2176

  # Simple Init
  gSimpleInitTokenSpaceGuid.PcdGuiDefaultDPI|300

  gRenegadePkgTokenSpaceGuid.PcdDeviceVendor|"Bbkedu"
  gRenegadePkgTokenSpaceGuid.PcdDeviceProduct|"S5"
  gRenegadePkgTokenSpaceGuid.PcdDeviceCodeName|"h7000"
