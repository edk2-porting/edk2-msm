[Defines]
  VENDOR_NAME                    = AYN
  PLATFORM_NAME                  = ayn-odin
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/Qualcomm/sdm845/sdm845.fdf
  DEVICE_DXE_FV_COMPONENTS       = Platform/AYN/sdm845/ayn-odin.fdf.inc

  # Enable A/B Slot Environment
  AB_SLOTS_SUPPORT               = TRUE

!include Platform/Qualcomm/sdm845/sdm845.dsc

[BuildOptions.common]
  GCC:*_*_AARCH64_CC_FLAGS = -DENABLE_SIMPLE_INIT -DENABLE_LINUX_SIMPLE_MASS_STORAGE

[PcdsFixedAtBuild.common]

  gQcomTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
  gQcomTokenSpaceGuid.PcdMipiFrameBufferHeight|1920

  # Simple Init
  gSimpleInitTokenSpaceGuid.PcdGuiDefaultDPI|369

  gRenegadePkgTokenSpaceGuid.PcdDeviceVendor|"AYN"
  gRenegadePkgTokenSpaceGuid.PcdDeviceProduct|"Odin"
  gRenegadePkgTokenSpaceGuid.PcdDeviceCodeName|"ayn-odin"

  # Synaptics Touchscren
  gQcomTokenSpaceGuid.PcdTouchCtlrAddress|0x70
  gQcomTokenSpaceGuid.PcdTouchCtlrResetPin|104
  gQcomTokenSpaceGuid.PcdTouchCtlrIntPin|125
  gQcomTokenSpaceGuid.PcdTouchCtlrI2cDevice|6
  gQcomTokenSpaceGuid.PcdTouchMaxX|1080
  gQcomTokenSpaceGuid.PcdTouchMaxY|1920
  gQcomTokenSpaceGuid.PcdTouchInvertedX|TRUE
