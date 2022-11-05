// per-device BSP DXEs
# FILE DRIVER = 5bd181db-0487-4f1a-ae73-820e165611b3 {
#   SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/Devices/polaris/ButtonsDxe/ButtonsDxe.depex
#   SECTION PE32 = Platform/EFI_Binaries/Drivers/Devices/polaris/ButtonsDxe/ButtonsDxe.efi
#   SECTION UI = "ButtonsDxe"
# }

// ACPI Tables
FILE FREEFORM = 7E374E25-8E01-4FEE-87F2-390C23C606CD {   
  SECTION RAW = Silicon/Qualcomm/sm7325/AcpiTables/dbg2.aml
  SECTION RAW = Platform/Xiaomi/sm7325/AcpiTables/mona/DSDT.aml
  SECTION RAW = Silicon/Qualcomm/sm7325/AcpiTables/Madt.aml
  SECTION RAW = Silicon/Qualcomm/sm7325/AcpiTables/Facp.aml
  SECTION RAW = Silicon/Qualcomm/sm7325/AcpiTables/Gtdt.aml
  SECTION RAW = Silicon/Qualcomm/sm7325/AcpiTables/IORT.aml
  SECTION RAW = Silicon/Qualcomm/sm7325/AcpiTables/Pptt.aml
  SECTION UI = "AcpiTables"
}

// Mainline device tree blob
FILE FREEFORM = 25462CDA-221F-47DF-AC1D-259CFAA4E326 {
  SECTION RAW = Platform/Xiaomi/sm7325/FdtBlob/sm7325-generic-msd.dtb
}

