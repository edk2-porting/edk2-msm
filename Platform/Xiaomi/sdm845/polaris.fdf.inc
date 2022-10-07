// per-device BSP DXEs
FILE DRIVER = 5bd181db-0487-4f1a-ae73-820e165611b3 {
  SECTION DXE_DEPEX = sdm845Pkg/Binary/Polaris/ButtonsDxe/ButtonsDxe.depex
  SECTION PE32 = sdm845Pkg/Binary/Polaris/ButtonsDxe/ButtonsDxe.efi
  SECTION UI = "ButtonsDxe"
}

// ACPI Tables
FILE FREEFORM = 7E374E25-8E01-4FEE-87F2-390C23C606CD {   
  SECTION RAW = sdm845Pkg/AcpiTables/Common/DBG2.aml
  SECTION RAW = sdm845Pkg/AcpiTables/polaris/DSDT.AML
  SECTION RAW = sdm845Pkg/AcpiTables/Common/MADT.aml
  SECTION RAW = sdm845Pkg/AcpiTables/Common/FADT.aml
  SECTION RAW = sdm845Pkg/AcpiTables/Common/GTDT.aml
  SECTION RAW = sdm845Pkg/AcpiTables/Common/IORT.aml
  SECTION RAW = sdm845Pkg/AcpiTables/Common/PPTT.aml
  SECTION UI = "AcpiTables"
}

// Mainline device tree blob
FILE FREEFORM = 25462CDA-221F-47DF-AC1D-259CFAA4E326 {
  SECTION RAW = sdm845Pkg/FdtBlob/sdm845-xiaomi-polaris.dtb
}

