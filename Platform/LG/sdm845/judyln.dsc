[Defines]
  PLATFORM_NAME                  = sdm845Pkg
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = sdm845Pkg/Devices/judyln.fdf
  
  # Enable A/B Slot Environment
  DEFINE AB_SLOTS_SUPPORT        = TRUE

!include sdm845Pkg/sdm845Pkg.dsc

[BuildOptions.common]
  GCC:*_*_AARCH64_CC_FLAGS = -DLG_PIL_FIXED=1 -DAB_SLOTS_SUPPORT=1 -DENABLE_SIMPLE_INIT -DENABLE_LINUX_SIMPLE_MASS_STORAGE

[PcdsFixedAtBuild.common]

  gsdm845PkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1440
  gsdm845PkgTokenSpaceGuid.PcdMipiFrameBufferHeight|3120

  # Simple Init
  gSimpleInitTokenSpaceGuid.PcdGuiDefaultDPI|550

  gsdm845PkgTokenSpaceGuid.PcdDeviceVendor|"LG"
  gsdm845PkgTokenSpaceGuid.PcdDeviceProduct|"G7 ThinQ"
  gsdm845PkgTokenSpaceGuid.PcdDeviceCodeName|"Judyln"