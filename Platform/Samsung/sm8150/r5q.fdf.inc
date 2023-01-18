// per-device BSP DXEs

FILE DRIVER = 8e9bd160-b184-11df-94e2-0800200c9a66 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/DALSys/DALSys.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/Devices/vayu/DALSys/DALSys.efi
    SECTION UI = "DALSys"
}

FILE DRIVER = 5bd181db-0487-4f1a-ae73-820e165611b3 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/ButtonsDxe/ButtonsDxe.depex
   SECTION PE32 = Platform/EFI_Binaries/Drivers/Devices/vayu/ButtonsDxe/ButtonsDxe.efi
    SECTION UI = "ButtonsDxe"
}

FILE DRIVER = f10f76db-42c1-533f-34a8-69be24653110 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/SdccDxe/SdccDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/SdccDxe/SdccDxe.efi
    SECTION UI = "SdccDxe"
  }

FILE DRIVER = 11faed4c-b21f-4d88-8e48-c4c28a1e50df {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/WP_Binaries/UsbPwrCtrlDxe/UsbPwrCtrlDxe.depex
	SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/WP_Binaries/UsbPwrCtrlDxe/UsbPwrCtrlDxe.efi
    SECTION UI = "UsbPwrCtrlDxe"
}

// Mainline device tree blob 
//FILE FREEFORM = 25462CDA-221F-47DF-AC1D-259CFAA4E326 {
  //SECTION RAW = Platform/Samsung/sm8150/FdtBlob/r5q/sm8150-Samsung-r5q.dtb
//}

