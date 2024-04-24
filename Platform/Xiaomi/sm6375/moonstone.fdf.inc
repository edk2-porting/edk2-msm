// per-device BSP DXEs
INF Platform/EFI_Binaries/Drivers/sm6225/ButtonsDxe/ButtonsDxe.inf

// ACPI Tables
FILE FREEFORM = 7E374E25-8E01-4FEE-87F2-390C23C606CD {   
  SECTION RAW = Platform/Xiaomi/sm6375/AcpiTables/moonstone/DSDT.aml
  SECTION RAW = Silicon/Qualcomm/sm6375/AcpiTables/MADT.aml
  SECTION RAW = Silicon/Qualcomm/sm6375/AcpiTables/FADT.aml
  SECTION RAW = Silicon/Qualcomm/sm6375/AcpiTables/GTDT.aml
  SECTION UI = "AcpiTables"
}

// Mainline device tree blob
 FILE FREEFORM = 25462CDA-221F-47DF-AC1D-259CFAA4E326 {
  SECTION RAW = Platform/Xiaomi/sm6375/FdtBlob_compat/moonstone.dtb
}

