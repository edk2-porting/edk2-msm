  INF  Platform/EFI_Binaries/Drivers/sm6225/SmemDxe/SmemDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/DALSYSDxe/DALSYSDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/HWIODxe/HWIODxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/ChipInfoDxe/ChipInfoDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/PlatformInfoDxe/PlatformInfoDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/HALIOMMUDxe/HALIOMMUDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/GLinkDxe/GLinkDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/ULogDxe/ULogDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/NpaDxe/NpaDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/VcsDxe/VcsDxe.inf
  INF  Platform/EFI_Binaries/Drivers/Devices/fog/ClockDxe/ClockDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/ShmBridgeDxe/ShmBridgeDxeLA.inf
  # INF  Platform/EFI_Binaries/Drivers/sm6225/ScmDxe/ScmDxe.inf

    FILE DRIVER = 4b4973ee-401b-4f36-a6a9-533dfccdfc33 {
            SECTION PE32 =  Platform/EFI_Binaries/Drivers/sm6225/ScmDxe/ScmDxe.efi
            SECTION UI = "ScmDxe"
    }

    INF  Platform/EFI_Binaries/Drivers/sm6225/SdccDxe/SdccDxe.inf
    INF  Platform/EFI_Binaries/Drivers/Devices/fog/UFSDxe/UFSDxe.inf

    # INF  Platform/EFI_Binaries/Drivers/sm6225/TzDxe/TzDxeLA.inf

    FILE DRIVER = cf6dfc66-14ab-4e13-84db-9c02912d1404 {
            SECTION PE32 =  Platform/EFI_Binaries/Drivers/sm6225/TzDxe/TzDxeLA.efi
            SECTION UI = "TzDxe"
    }

  FILE FREEFORM = A91D838E-A5FA-4138-825D-455E2303079E {
    SECTION UI = "BDS_Menu.cfg"
    SECTION RAW = Platform/Xiaomi/sm6225/RawFiles/fog/BDS_Menu.cfg
  }

  FILE FREEFORM = 02E0AF91-5D44-424F-828F-211ADC520B0C {
    SECTION UI = "Panel_truly_td4330_fhd_cmd.xml"
    SECTION RAW = Platform/Xiaomi/sm6225/RawFiles/fog/Panel_truly_td4330_fhd_cmd.xml
  }

  FILE FREEFORM = 9BAE75D9-A217-4B31-9DCD-00D2609BC6AE {
    SECTION UI = "Panel_truly_td4330_fhd_vid.xml"
    SECTION RAW = Platform/Xiaomi/sm6225/RawFiles/fog/Panel_truly_td4330_fhd_vid.xml
  }

  FILE FREEFORM = C0DECCE0-BD15-480F-BD18-5FF4C530176C {
    SECTION UI = "Panel_c3q_35_02_0a_fhdp_video.xml"
    SECTION RAW = Platform/Xiaomi/sm6225/RawFiles/fog/Panel_c3q_35_02_0a_fhdp_video.xml
  }

  FILE FREEFORM = 8CB43165-DA92-41B6-85EB-5E15802F9A07 {
    SECTION UI = "Panel_c3q_43_03_0b_fhdp_video.xml"
    SECTION RAW = Platform/Xiaomi/sm6225/RawFiles/fog/Panel_c3q_43_03_0b_fhdp_video.xml
  }

  FILE FREEFORM = A1E235DE-E825-4591-9623-C43175811826 {
    SECTION UI = "SecParti.cfg"
    SECTION RAW = Platform/Xiaomi/sm6225/RawFiles/fog/SecParti.cfg
  }

  FILE FREEFORM = 21E9BDD9-6C3F-4F10-84A5-BBEC322741F1 {
    SECTION UI = "uefipil.cfg"
    SECTION RAW = Platform/Xiaomi/sm6225/RawFiles/fog/uefipil.cfg
  }

  FILE FREEFORM = 45FE4B7C-150C-45DA-A021-4BEB2048EC6F {
    SECTION UI = "QcomChargerCfg.cfg"
    SECTION RAW = Platform/Xiaomi/sm6225/RawFiles/fog/QcomChargerCfg.cfg
  }

  FILE FREEFORM = F780C779-DD7C-47CD-BD1A-5EB414C51704 {
    SECTION UI = "BATTERY.PROVISION"
    SECTION RAW = Platform/Xiaomi/sm6225/RawFiles/fog/BATTERY.PROVISION
  }

  FILE FREEFORM = F52EC379-FD2E-4229-BF74-319444BAF482 {
    SECTION UI = "Panel_c3q_45_02_0c_fhdp_video.xml"
    SECTION RAW = Platform/Xiaomi/sm6225/RawFiles/fog/Panel_c3q_45_02_0c_fhdp_video.xml
  }
  
    FILE FREEFORM = 9BAE75D9-A217-4B31-9DCD-00D2609B6784 {
    SECTION UI = "Panel_truly_nt36525_hd_plus_vid.xml"
    SECTION RAW = Platform/Xiaomi/sm6225/RawFiles/fog/Panel_truly_nt36525_hd_plus_vid.xml
  }
  
    FILE FREEFORM = 9BAE75D9-A217-4B31-9DCD-00D2609B6785 {
    SECTION UI = "Panel_nt36525_hd_plus_90hz_vid.xml"
    SECTION RAW = Platform/Xiaomi/sm6225/RawFiles/fog/Panel_nt36525_hd_plus_90hz_vid.xml
  }

  INF  Platform/EFI_Binaries/Drivers/sm6225/QcomWDogDxe/QcomWDogDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/TLMMDxe/TLMMDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/SPMIDxe/SPMIDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/ResetRuntimeDxe/ResetRuntimeDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/PmicDxe/PmicDxeLa.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/PILDxe/PILDxe.inf
    
  INF  Platform/EFI_Binaries/Drivers/sm6225/FontDxe/FontDxe.inf

  INF  Platform/EFI_Binaries/Drivers/sm6225/AdcDxe/AdcDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/UsbPwrCtrlDxe/UsbPwrCtrlDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/QcomChargerDxe/QcomChargerDxeLA.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/ChargerExDxe/ChargerExDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/UsbfnDwc3Dxe/UsbfnDwc3Dxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/UsbMsdDxe/UsbMsdDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/UsbDeviceDxe/UsbDeviceDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/UsbConfigDxe/UsbConfigDxe.inf
  INF  Platform/EFI_Binaries/Drivers/Devices/fog/ButtonsDxe/ButtonsDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/TsensDxe/TsensDxe.inf

  INF Silicon/Qualcomm/QcomPkg/Drivers/SimpleFbDxe/SimpleFbDxe.inf
  INF  Platform/EFI_Binaries/Drivers/sm6225/GpiDxe/GpiDxe.inf

  INF Platform/EFI_Binaries/Drivers/sm6225/DDRInfoDxe/DDRInfoDxe.inf
