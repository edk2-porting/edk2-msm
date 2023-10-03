


// ACPI Tables
FILE FREEFORM = 7E374E25-8E01-4FEE-87F2-390C23C606CD {
# 	Customized DSDT
    SECTION RAW = Platform/Xiaomi/sm7125/AcpiTables/miatoll/DSDT.aml
# 	Common Tables
 	SECTION RAW = Silicon/Qualcomm/sm7125/AcpiTables/BuiltIn/APIC.aml
	SECTION RAW = Silicon/Qualcomm/sm7125/AcpiTables/BuiltIn/CSRT.aml
  	SECTION RAW = Silicon/Qualcomm/sm7125/AcpiTables/BuiltIn/DBG2.aml
 	SECTION RAW = Silicon/Qualcomm/sm7125/AcpiTables/BuiltIn/FACP.aml
	SECTION RAW = Silicon/Qualcomm/sm7125/AcpiTables/BuiltIn/FACS.aml
	SECTION RAW = Silicon/Qualcomm/sm7125/AcpiTables/BuiltIn/GTDT.aml
	SECTION RAW = Silicon/Qualcomm/sm7125/AcpiTables/BuiltIn/IORT.aml
	SECTION RAW = Silicon/Qualcomm/sm7125/AcpiTables/BuiltIn/MCFG.aml
	SECTION RAW = Silicon/Qualcomm/sm7125/AcpiTables/BuiltIn/PPTT.aml
	SECTION RAW = Silicon/Qualcomm/sm7125/AcpiTables/BuiltIn/SPCR.aml
	SECTION RAW = Silicon/Qualcomm/sm7125/AcpiTables/BuiltIn/TPM2.aml
	SECTION UI = "AcpiTables"
}


// Mainline device tree blob
FILE FREEFORM = 25462CDA-221F-47DF-AC1D-259CFAA4E326 {
  SECTION RAW = Platform/Qualcomm/sm7125/FdtBlob/sm7125-generic-msd.dtb
}
