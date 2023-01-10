// per-device BSP DXEs
FILE DRIVER = 5bd181db-0487-4f1a-ae73-820e165611b3 {
  SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sdm845/ButtonsDxe/ButtonsDxe.depex
  SECTION PE32 = Platform/EFI_Binaries/Drivers/Devices/nx616j/ButtonsDxe/ButtonsDxe.efi
  SECTION UI = "ButtonsDxe"
}

// ACPI Tables
FILE FREEFORM = 7E374E25-8E01-4FEE-87F2-390C23C606CD {   
  SECTION RAW = Silicon/Qualcomm/sdm845/AcpiTables/DBG2.aml
  SECTION RAW = Platform/Nubia/sdm845/AcpiTables/nx606j/DSDT.aml
  SECTION RAW = Silicon/Qualcomm/sdm845/AcpiTables/MADT.aml
  SECTION RAW = Silicon/Qualcomm/sdm845/AcpiTables/FADT.aml
  SECTION RAW = Silicon/Qualcomm/sdm845/AcpiTables/GTDT.aml
  SECTION RAW = Silicon/Qualcomm/sdm845/AcpiTables/IORT.aml
  SECTION RAW = Silicon/Qualcomm/sdm845/AcpiTables/PPTT.aml
  SECTION UI = "AcpiTables"
}

// Mainline device tree blob
FILE FREEFORM = 25462CDA-221F-47DF-AC1D-259CFAA4E326 {
  SECTION RAW = Platform/Qualcomm/sdm845/FdtBlob/sdm845-generic-msd.dtb
}
