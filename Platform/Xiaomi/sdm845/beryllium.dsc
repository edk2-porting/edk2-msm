[Defines]
  VENDOR_NAME                    = Xiaomi
  PLATFORM_NAME                  = beryllium
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/Qualcomm/sdm845/sdm845.fdf
  DEVICE_DXE_FV_COMPONENTS       = Platform/Xiaomi/sdm845/beryllium.fdf.inc

!include Platform/Qualcomm/sdm845/sdm845.dsc

[BuildOptions.common]
  GCC:*_*_AARCH64_CC_FLAGS = -DENABLE_SIMPLE_INIT -DENABLE_LINUX_SIMPLE_MASS_STORAGE

[PcdsFixedAtBuild.common]

  #gQcomTokenSpaceGuid.PcdMipiFrameBufferAddress|0x9D469780
  gQcomTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
  gQcomTokenSpaceGuid.PcdMipiFrameBufferHeight|2246

  gRenegadePkgTokenSpaceGuid.PcdDeviceVendor|"Xiaomi"
  gRenegadePkgTokenSpaceGuid.PcdDeviceProduct|"Poco F1"
  gRenegadePkgTokenSpaceGuid.PcdDeviceCodeName|"beryllium"

  # Simple Init
  gSimpleInitTokenSpaceGuid.PcdGuiDefaultDPI|440

  #uncomment section underneath and comment out the above section to use full display, including the notch
  gQcomTokenSpaceGuid.PcdMipiFrameBufferPixelBpp|32|UINT32|0x0000a403
  gQcomTokenSpaceGuid.PcdMipiFrameBufferVisibleWidth|1080|UINT32|0x0000a404
  gQcomTokenSpaceGuid.PcdMipiFrameBufferVisibleHeight|2246|UINT32|0x0000a405

