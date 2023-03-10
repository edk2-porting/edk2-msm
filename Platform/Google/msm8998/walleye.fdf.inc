// per-device BSP DXEs
FILE DRIVER = 5bd181db-0487-4f1a-ae73-820e165611b3 {
  SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/Devices/walleye/ButtonsDxe/ButtonsDxe.depex
  SECTION PE32 = Platform/EFI_Binaries/Drivers/Devices/walleye/ButtonsDxe/ButtonsDxe.efi
  SECTION UI = "ButtonsDxe"
}

// ACPI Tables
FILE FREEFORM = 7E374E25-8E01-4FEE-87F2-390C23C606CD {
  SECTION RAW = Platform/Google/msm8998/AcpiTables/walleye/DSDT.aml
  SECTION RAW = Silicon/Qualcomm/msm8998/AcpiTables/Csrt.acp
  SECTION RAW = Silicon/Qualcomm/msm8998/AcpiTables/dbg2.acp
  SECTION RAW = Silicon/Qualcomm/msm8998/AcpiTables/Facp.acp
  SECTION RAW = Silicon/Qualcomm/msm8998/AcpiTables/Facs.acp
  SECTION RAW = Silicon/Qualcomm/msm8998/AcpiTables/Gtdt.acp
  SECTION RAW = Silicon/Qualcomm/msm8998/AcpiTables/IORT.acp
  SECTION RAW = Silicon/Qualcomm/msm8998/AcpiTables/Madt.acp
  SECTION RAW = Silicon/Qualcomm/msm8998/AcpiTables/Mcfg.acp
  SECTION UI = "AcpiTables"
}

// Mainline device tree blob
FILE FREEFORM = 25462CDA-221F-47DF-AC1D-259CFAA4E326 {
  SECTION RAW = Platform/Google/msm8998/FdtBlob/msm8998-google-walleye.dtb
}

