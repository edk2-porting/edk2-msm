// per-device BSP DXEs

FILE DRIVER = 8e9bd160-b184-11df-94e2-0800200c9a66 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7150/DALSys/DALSys.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/Devices/surya/DALSys/DALSys.efi
    SECTION UI = "DALSys"
}

FILE DRIVER = 5bd181db-0487-4f1a-ae73-820e165611b3 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm7150/ButtonsDxe/ButtonsDxe.depex
   SECTION PE32 = Platform/EFI_Binaries/Drivers/Devices/surya/ButtonsDxe/ButtonsDxe.efi
    SECTION UI = "ButtonsDxe"
}

// ACPI Tables
FILE FREEFORM = 7E374E25-8E01-4FEE-87F2-390C23C606CD {
# 	Customized DSDT
    SECTION RAW = Platform/Xiaomi/sm7150/AcpiTables/surya/DSDT.aml
# 	Common Tables
	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/bgrt.acpi
# 	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/Csrt.acpi
# 	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/dbg2.acpi
	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/Facp.acpi
	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/Facs.acpi
	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/Gtdt.acpi
# 	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/IORT.acpi
	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/Madt.acpi
	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/Mcfg.acpi
	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/Pptt.acpi
# 	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/spcr.acpi
	SECTION RAW = Silicon/Qualcomm/sm7150/AcpiTables/BuiltIn/TPM2.acpi
	SECTION UI = "AcpiTables"
}

// Mainline device tree blob