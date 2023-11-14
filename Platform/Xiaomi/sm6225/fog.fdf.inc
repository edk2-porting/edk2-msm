// per-device BSP DXEs

// ACPI Tables
FILE FREEFORM = 7E374E25-8E01-4FEE-87F2-390C23C606CD {
  SECTION RAW = Silicon/Qualcomm/sm6225/AcpiTables/DSDT.min.aml
  SECTION RAW = Silicon/Qualcomm/sm6225/AcpiTables/FADT.aml
  SECTION RAW = Silicon/Qualcomm/sm6225/AcpiTables/GTDT.aml
  SECTION RAW = Silicon/Qualcomm/sm6225/AcpiTables/MADT.aml
  SECTION UI = "AcpiTables"
}

FILE FREEFORM = 25462CDA-221F-47DF-AC1D-259CFAA4E326 {
  SECTION RAW = Platform/Xiaomi/sm6225/FdtBlob_compat/fog.dtb
}

