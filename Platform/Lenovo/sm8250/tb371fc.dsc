[Defines]
  VENDOR_NAME                    = Lenovo
  PLATFORM_NAME                  = tb371fc
  PLATFORM_GUID                  = 49f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/Qualcomm/sm8250/sm8250.fdf
  DEVICE_DXE_FV_COMPONENTS       = Platform/Lenovo/sm8250/tb371fc.fdf.inc

!include Platform/Qualcomm/sm8250/sm8250.dsc

[BuildOptions.common]
  GCC:*_*_AARCH64_CC_FLAGS = -DENABLE_SIMPLE_INIT -DENABLE_LINUX_SIMPLE_MASS_STORAGE

[PcdsFixedAtBuild.common]
  gQcomTokenSpaceGuid.PcdMipiFrameBufferWidth|2944
  gQcomTokenSpaceGuid.PcdMipiFrameBufferHeight|1840

  # Simple Init
  gSimpleInitTokenSpaceGuid.PcdGuiDefaultDPI|340

  gRenegadePkgTokenSpaceGuid.PcdDeviceVendor|"Lenovo"
  gRenegadePkgTokenSpaceGuid.PcdDeviceProduct|"XiaoXin Pad Pro 12.7"
  gRenegadePkgTokenSpaceGuid.PcdDeviceCodeName|"TB371FC"
