// per-device BSP DXEs
  FILE DRIVER = CD823A4D-7DEC-4531-AE5D-4134FA4127B8 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7150/UsbConfigDxe/UsbConfigDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7150/UsbConfigDxe/UsbConfigDxe.efi
    SECTION UI = "UsbConfigDxe"
  }
  
  FILE DRIVER = 3299A266-15F0-4346-8318-716336736D3E {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7150/UsbDeviceDxe/UsbDeviceDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7150/UsbDeviceDxe/UsbDeviceDxe.efi
    SECTION UI = "UsbDeviceDxe"
  }
  
  FILE DRIVER = 11FAED4C-B21F-4D88-8E48-C4C28A1E50DF {
	SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7150/UsbPwrCtrlDxe/UsbPwrCtrlDxe.depex
	SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7150/UsbPwrCtrlDxe/UsbPwrCtrlDxe.efi
	SECTION UI = "UsbPwrCtrlDxe"
  }
  
//FILE FREEFORM = 26462CDA-221F-47DF-AC1D-259CFAA4E326 {
  //SECTION RAW = Platform/Bbkedu/sm7150/FdtBlob_compat/sm6150.dtb
//}

// ACPI Tables
FILE FREEFORM = 7E374E25-8E01-4FEE-87F2-390C23C606CD {
# 	Common Tables
	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/bgrt.acpi
  	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/Csrt.acpi
  	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/dbg2.acpi
	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/Facp.acpi
	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/Facs.acpi
	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/Gtdt.acpi
  	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/IORT.acpi
	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/Madt.acpi
	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/Mcfg.acpi
	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/Pptt.acpi
  	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/spcr.acpi
	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/TPM2.acpi
	SECTION UI = "AcpiTables"
}
