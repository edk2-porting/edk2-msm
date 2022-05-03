[Defines]
  PLATFORM_NAME                  = sdm845Pkg
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = sdm845Pkg/Devices/odin.fdf

!include sdm845Pkg/sdm845Pkg.dsc

[BuildOptions.common]
  GCC:*_*_AARCH64_CC_FLAGS = -DAB_SLOTS_SUPPORT=1 -DENABLE_SIMPLE_INIT

[PcdsFixedAtBuild.common]

  gsdm845PkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
  gsdm845PkgTokenSpaceGuid.PcdMipiFrameBufferHeight|1920

  # Simple Init
  gSimpleInitTokenSpaceGuid.PcdGuiDefaultDPI|369

  gsdm845PkgTokenSpaceGuid.PcdDeviceVendor|"AYN"
  gsdm845PkgTokenSpaceGuid.PcdDeviceProduct|"Odin"
  gsdm845PkgTokenSpaceGuid.PcdDeviceCodeName|"ayn-odin"

  # Synaptics Touchscren
  gsdm845PkgTokenSpaceGuid.PcdTouchCtlrAddress|0x70
  gsdm845PkgTokenSpaceGuid.PcdTouchCtlrResetPin|104
  gsdm845PkgTokenSpaceGuid.PcdTouchCtlrIntPin|125
  gsdm845PkgTokenSpaceGuid.PcdTouchCtlrI2cDevice|6
  gsdm845PkgTokenSpaceGuid.PcdTouchMaxX|1080
  gsdm845PkgTokenSpaceGuid.PcdTouchMaxY|1920
  gsdm845PkgTokenSpaceGuid.PcdTouchInvertedX|TRUE
