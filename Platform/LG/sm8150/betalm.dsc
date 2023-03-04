[Defines]
  VENDOR_NAME                    = LG
  PLATFORM_NAME                  = betalm
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/Qualcomm/sm8150/sm8150.fdf
  DEVICE_DXE_FV_COMPONENTS       = Platform/LG/sm8150/betalm.fdf.inc

!include Platform/Qualcomm/sm8150/sm8150.dsc

[BuildOptions.common]
  GCC:*_*_AARCH64_CC_FLAGS = -DENABLE_SIMPLE_INIT -DMEMMAP_LG_HACKS -DENABLE_LINUX_SIMPLE_MASS_STORAGE

[PcdsFixedAtBuild.common]
  gQcomTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
  gQcomTokenSpaceGuid.PcdMipiFrameBufferHeight|2248
  gQcomTokenSpaceGuid.PcdMipiFrameBufferAddress|0x9D200000

  # Simple Init
  gSimpleInitTokenSpaceGuid.PcdGuiDefaultDPI|355

  gRenegadePkgTokenSpaceGuid.PcdDeviceVendor|"LG"
  gRenegadePkgTokenSpaceGuid.PcdDeviceProduct|"G8S ThinQ"
  gRenegadePkgTokenSpaceGuid.PcdDeviceCodeName|"betalm"

  # Synaptics Touchscren
  gQcomTokenSpaceGuid.PcdTouchCtlrAddress|0x20
  gQcomTokenSpaceGuid.PcdTouchCtlrResetPin|54
  gQcomTokenSpaceGuid.PcdTouchCtlrIntPin|122
  gQcomTokenSpaceGuid.PcdTouchCtlrI2cDevice|18
  gQcomTokenSpaceGuid.PcdTouchMaxX|1080
  gQcomTokenSpaceGuid.PcdTouchMaxY|2248
  gQcomTokenSpaceGuid.PcdTouchCtlrVddPin|59
  gQcomTokenSpaceGuid.PcdTouchCtlrVddIoPin|152
