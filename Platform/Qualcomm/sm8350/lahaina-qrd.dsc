[Defines]
  VENDOR_NAME                    = Qualcomm
  PLATFORM_NAME                  = lahaina-qrd
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/Qualcomm/sm8350/sm8350.fdf
  DEVICE_DXE_FV_COMPONENTS       = Platform/Qualcomm/sm8350/lahaina-qrd.fdf.inc

!include Platform/Qualcomm/sm8350/sm8350.dsc

[BuildOptions.common]
  GCC:*_*_AARCH64_CC_FLAGS = -DENABLE_SIMPLE_INIT -DENABLE_LINUX_SIMPLE_MASS_STORAGE

[PcdsFixedAtBuild.common]
  gQcomTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
  gQcomTokenSpaceGuid.PcdMipiFrameBufferHeight|2340

  # Simple Init
  gSimpleInitTokenSpaceGuid.PcdGuiDefaultDPI|400

  gRenegadePkgTokenSpaceGuid.PcdDeviceVendor|"Qualcomm"
  gRenegadePkgTokenSpaceGuid.PcdDeviceProduct|"QRD 888"
  gRenegadePkgTokenSpaceGuid.PcdDeviceCodeName|"lahaina-qrd"
