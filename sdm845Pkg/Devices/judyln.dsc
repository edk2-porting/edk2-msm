[Defines]
  PLATFORM_NAME                  = sdm845Pkg
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = sdm845Pkg/Devices/845.fdf

!include sdm845Pkg/sdm845Pkg.dsc

[BuildOptions.common]
  GCC:*_*_AARCH64_CC_FLAGS = -DMEMORY_4G=1

[PcdsFixedAtBuild.common]
  # System Memory (3GB)
  gArmTokenSpaceGuid.PcdSystemMemorySize|0xC0000000

  gsdm845PkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1440
  gsdm845PkgTokenSpaceGuid.PcdMipiFrameBufferHeight|3120
