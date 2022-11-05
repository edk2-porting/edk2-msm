// per-device BSP DXEs
FILE DRIVER = 5bd181db-0487-4f1a-ae73-820e165611b3 {
  SECTION DXE_DEPEX = Platform/Lenovo/sm8250/ButtonsDxe.depex
  SECTION PE32 = Platform/Lenovo/sm8250/ButtonsDxe.efi
  SECTION UI = "ButtonsDxe"
}

// ACPI Tables
FILE FREEFORM = 7E374E25-8E01-4FEE-87F2-390C23C606CD {   
  SECTION RAW = Silicon/Qualcomm/sm8250/AcpiTables/dbg2.aml
  SECTION RAW = Platform/Lenovo/sm8250/AcpiTables/j716f/DSDT.aml
  SECTION RAW = Silicon/Qualcomm/sm8250/AcpiTables/Madt.aml
  SECTION RAW = Silicon/Qualcomm/sm8250/AcpiTables/Facp.aml
  SECTION RAW = Silicon/Qualcomm/sm8250/AcpiTables/Gtdt.aml
  SECTION RAW = Silicon/Qualcomm/sm8250/AcpiTables/IORT.aml
  SECTION RAW = Silicon/Qualcomm/sm8250/AcpiTables/Pptt.aml
  SECTION UI = "AcpiTables"
}

