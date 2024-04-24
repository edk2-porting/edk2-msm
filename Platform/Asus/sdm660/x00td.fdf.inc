// per-device BSP DXEs

// ACPI Tables
FILE FREEFORM = 7E374E25-8E01-4FEE-87F2-390C23C606CD {
  SECTION RAW = Silicon/Qualcomm/sdm660/AcpiTables/DSDT/DSDT.aml
  SECTION RAW = Silicon/Qualcomm/sdm660/AcpiTables/BuiltIn/CSRT.aml
  SECTION RAW = Silicon/Qualcomm/sdm660/AcpiTables/BuiltIn/DBG2.aml
  SECTION RAW = Silicon/Qualcomm/sdm660/AcpiTables/BuiltIn/FACS.aml
  SECTION RAW = Silicon/Qualcomm/sdm660/AcpiTables/BuiltIn/FADT.aml
  SECTION RAW = Silicon/Qualcomm/sdm660/AcpiTables/BuiltIn/GTDT.aml
  SECTION RAW = Silicon/Qualcomm/sdm660/AcpiTables/BuiltIn/MADT.aml
  SECTION RAW = Silicon/Qualcomm/sdm660/AcpiTables/BuiltIn/MCFG.aml
  SECTION UI = "AcpiTables"
}

// Mainline device tree blob
