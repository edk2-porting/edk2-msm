// per-device BSP DXEs
FILE DRIVER = 5bd181db-0487-4f1a-ae73-820e165611b3 {
  SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sdm845/ButtonsDxe/ButtonsDxe.depex
  SECTION PE32 = Platform/EFI_Binaries/Drivers/sdm845/ButtonsDxe/ButtonsDxe.efi
  SECTION UI = "ButtonsDxe"
}

// Synaptics Touch
FILE DRIVER = F0D87C5E-4D5D-4FB5-939F-A6768AE8A310 {
  SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sdm845/Synaptics/SynapticsTouchDeviceDxe.depex
  SECTION PE32 = Platform/EFI_Binaries/Drivers/sdm845/Synaptics/SynapticsTouchDeviceDxe.efi
  SECTION UI = "SynapticsTouchDeviceDxe"
}

// ACPI Tables
FILE FREEFORM = 7E374E25-8E01-4FEE-87F2-390C23C606CD {   
  SECTION RAW = Silicon/Qualcomm/sdm845/AcpiTables/DBG2.aml
  SECTION RAW = Platform/Oneplus/sdm845/AcpiTables/fajita/DSDT.aml
  SECTION RAW = Silicon/Qualcomm/sdm845/AcpiTables/MADT.aml
  SECTION RAW = Silicon/Qualcomm/sdm845/AcpiTables/FADT.aml
  SECTION RAW = Silicon/Qualcomm/sdm845/AcpiTables/GTDT.aml
  SECTION RAW = Silicon/Qualcomm/sdm845/AcpiTables/IORT.aml
  SECTION RAW = Silicon/Qualcomm/sdm845/AcpiTables/PPTT.aml
  SECTION UI = "AcpiTables"
}

// Mainline device tree blob
FILE FREEFORM = 25462CDA-221F-47DF-AC1D-259CFAA4E326 {
  SECTION RAW = Platform/Oneplus/sdm845/FdtBlob/sdm845-oneplus-fajita.dtb
}
