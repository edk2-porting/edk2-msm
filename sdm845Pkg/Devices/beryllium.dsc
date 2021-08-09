[Defines]
  PLATFORM_NAME                  = sdm845Pkg
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = sdm845Pkg/Devices/beryllium.fdf

!include sdm845Pkg/sdm845Pkg.dsc

[PcdsFixedAtBuild.common]
  # System Memory (5GB)
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x140000000

  gsdm845PkgTokenSpaceGuid.PcdMipiFrameBufferAddress|0x9D469780
  gsdm845PkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
  gsdm845PkgTokenSpaceGuid.PcdMipiFrameBufferHeight|2140

  #uncomment section underneath and comment out the above section to use full display, including the notch
  #gsdm845PkgTokenSpaceGuid.PcdMipiFrameBufferPixelBpp|32|UINT32|0x0000a403
  #gsdm845PkgTokenSpaceGuid.PcdMipiFrameBufferVisibleWidth|1080|UINT32|0x0000a404
  #gsdm845PkgTokenSpaceGuid.PcdMipiFrameBufferVisibleHeight|2234|UINT32|0x0000a405

