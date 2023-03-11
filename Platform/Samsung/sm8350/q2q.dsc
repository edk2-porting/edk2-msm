[Defines]
  VENDOR_NAME                    = Samsung
  PLATFORM_NAME                  = q2q
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/Qualcomm/sm8350/sm8350.fdf
  DEVICE_DXE_FV_COMPONENTS       = Platform/Samsung/sm8350/q2q.fdf.inc

!include Platform/Qualcomm/sm8350/sm8350.dsc

[BuildOptions.common]
  GCC:*_*_AARCH64_CC_FLAGS = -DENABLE_SIMPLE_INIT 

[PcdsFixedAtBuild.common]

  gQcomTokenSpaceGuid.PcdMipiFrameBufferWidth|2208
  gQcomTokenSpaceGuid.PcdMipiFrameBufferHeight|1768
  gQcomTokenSpaceGuid.PcdMipiFrameBufferAddress|0xe4000000

  # Simple Init
  gSimpleInitTokenSpaceGuid.PcdGuiDefaultDPI|362

  gRenegadePkgTokenSpaceGuid.PcdDeviceVendor|"Samsung"
  gRenegadePkgTokenSpaceGuid.PcdDeviceProduct|"Galaxy Z Fold 3"
  gRenegadePkgTokenSpaceGuid.PcdDeviceCodeName|"q2q"
