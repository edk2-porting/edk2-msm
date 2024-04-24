//ButtonsDxe
FILE DRIVER = 5bd181db-0487-4f1a-ae73-820e165611b3 {
  SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8250/ButtonsDxe/ButtonsDxe.depex
  SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8250/ButtonsDxe/ButtonsDxe.efi
  SECTION UI = "ButtonsDxe"
}

// ACPI Tables
FILE FREEFORM = 7E374E25-8E01-4FEE-87F2-390C23C606CD {
  SECTION RAW = Platform/Lenovo/sm8250/AcpiTables/tb-9707f/DSDT.aml
  SECTION RAW = Silicon/Qualcomm/sm8250/AcpiTables/Madt.aml
  SECTION RAW = Silicon/Qualcomm/sm8250/AcpiTables/Facp.aml
  SECTION RAW = Silicon/Qualcomm/sm8250/AcpiTables/Gtdt.aml
  SECTION RAW = Silicon/Qualcomm/sm8250/AcpiTables/bgrt.aml
  SECTION UI = "AcpiTables"
}
