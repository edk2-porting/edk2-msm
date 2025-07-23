[Defines]
  VENDOR_NAME                    = Xiaomi
  PLATFORM_NAME                  = marble
  PLATFORM_GUID                  = 9851fa4b-27cf-43b4-b0bd-0af439d7987b
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/Qualcomm/sm7475/sm7475.fdf
  DEVICE_DXE_FV_COMPONENTS       = Platform/Xiaomi/sm7475/marble.fdf.inc

!include Platform/Qualcomm/sm7475/sm7475.dsc

[BuildOptions.common]
  GCC:*_*_AARCH64_CC_FLAGS = -DENABLE_SIMPLE_INIT

[PcdsFixedAtBuild.common]
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000       
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x300000000       

  gQcomTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
  gQcomTokenSpaceGuid.PcdMipiFrameBufferHeight|2400

  # Simple Init
  gSimpleInitTokenSpaceGuid.PcdGuiDefaultDPI|426

  gRenegadePkgTokenSpaceGuid.PcdDeviceVendor|"Xiaomi"
  gRenegadePkgTokenSpaceGuid.PcdDeviceProduct|"Poco F5"
  gRenegadePkgTokenSpaceGuid.PcdDeviceCodeName|"marble"
