[Defines]
  PLATFORM_NAME                  = sdm845Pkg
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = sdm845Pkg/Devices/judyp.fdf

!include sdm845Pkg/sdm845Pkg.dsc

[PcdsFixedAtBuild.common]
  # System Memory (5GB)
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x15AE00000

  gsdm845PkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1440
  gsdm845PkgTokenSpaceGuid.PcdMipiFrameBufferHeight|2880
  
    gsdm845PkgTokenSpaceGuid.PcdDeviceVendor|"LG"
  gsdm845PkgTokenSpaceGuid.PcdDeviceProduct|"V35 ThinQ"
  gsdm845PkgTokenSpaceGuid.PcdDeviceCodeName|"Judyp"

