// per-device BSP DXEs

FILE DRIVER = 5bd181db-0487-4f1a-ae73-820e165611b3 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8250/ButtonsDxe/ButtonsDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/Devices/r8q/ButtonsDxe/ButtonsDxe.efi
    SECTION UI = "ButtonsDxe"
}
FILE DRIVER = 7DDA7772-B8F5-4859-9DBA-0D6F2DBA4AF1 {
    SECTION PE32 = Platform/EFI_Binaries/Drivers/fsdrivers/ext2_aa64.efi
    SECTION UI = "Ext2Dxe"
}

FILE DRIVER = 2920E524-AD21-499E-9F4A-466BFDC3BFFB {
    SECTION PE32 = Platform/EFI_Binaries/Drivers/fsdrivers/exfat_aa64.efi
    SECTION UI = "ExfatDxe"
}

FILE DRIVER = 3D1F4906-3509-4DD4-8850-70033DE336E4 {
    SECTION PE32 = Platform/EFI_Binaries/Drivers/fsdrivers/f2fs_aa64.efi
    SECTION UI = "F2fsDxe"
}

FILE DRIVER = 80FB68D4-7C52-4AFE-A91E-D3DDADB5C54F {
    SECTION PE32 = Platform/EFI_Binaries/Drivers/fsdrivers/ntfs_aa64.efi
    SECTION UI = "NtfsDxe"
}








// ACPI Tables
FILE FREEFORM = 7E374E25-8E01-4FEE-87F2-390C23C606CD {

# 	Customized DSDT
 #   SECTION RAW = Platform/Samsung/sm8250/AcpiTables/r8q/DSDT.aml
# 	Common Tables
	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/APIC.aml
# 	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/BERT.aml
# 	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/BGRT.aml
	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/CSRT.aml
	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/DBG2.aml
	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/FACP.aml
# 	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/FPDT.aml
	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/GTDT.aml
	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/IORT.aml
	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/MCFG.aml
# 	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/MSDM.aml
	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/PPTT.aml
	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/TPM2.aml
# 	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/XSDT.aml
	SECTION UI = "AcpiTables"
}

// Mainline device tree blob