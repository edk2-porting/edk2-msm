// per-device BSP DXEs

// ACPI Tables
FILE FREEFORM = 7E374E25-8E01-4FEE-87F2-390C23C606CD {
  SECTION RAW = Platform/Oneplus/msm8998/AcpiTables/dumpling/DSDT.aml
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
  SECTION RAW = Platform/Oneplus/msm8998/FdtBlob/msm8998-oneplus-dumpling.dtb
}

