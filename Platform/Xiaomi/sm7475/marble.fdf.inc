// per-device BSP DXEs
# FILE DRIVER = 5bd181db-0487-4f1a-ae73-820e165611b3 {
#   SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/Devices/nx729j/ButtonsDxe/ButtonsDxe.depex
#   SECTION PE32 = Platform/EFI_Binaries/Drivers/Devices/nx729j/ButtonsDxe/ButtonsDxe.efi
#   SECTION UI = "ButtonsDxe"
# }

// ACPI Tables
# FILE FREEFORM = 7E374E25-8E01-4FEE-87F2-390C23C606CD {   
#   SECTION RAW = Silicon/Qualcomm/sm7475/AcpiTables/DBG2.aml
#   SECTION RAW = Platform/Nubia/sm7475/AcpiTables/nx729j/DSDT.AML
#   SECTION RAW = Silicon/Qualcomm/sm7475/AcpiTables/MADT.aml
#   SECTION RAW = Silicon/Qualcomm/sm7475/AcpiTables/FADT.aml
#   SECTION RAW = Silicon/Qualcomm/sm7475/AcpiTables/GTDT.aml
#   SECTION RAW = Silicon/Qualcomm/sm7475/AcpiTables/IORT.aml
#   SECTION RAW = Silicon/Qualcomm/sm7475/AcpiTables/PPTT.aml
#   SECTION UI = "AcpiTables"
# }

// Mainline device tree blob
# FILE FREEFORM = 25462CDA-221F-47DF-AC1D-259CFAA4E326 {
#   SECTION RAW = Platform/Qualcomm/sm7475/FdtBlob/sm7475-generic-msd.dtb
# }
# Core system drivers - MUST have these
FILE DRIVER = f541d663-4a48-40aa-aabf-ff158ccae34c {
  SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7475/SmemDxe/SmemDxe.efi
  SECTION UI = "SmemDxe"
}

FILE DRIVER = 8E9BD160-B184-11DF-94E2-0800200C9A66 {
  SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7475/DALSys/DALSys.efi
  SECTION UI = "DALSys"
}

FILE DRIVER = af9763a2-033b-4109-8e17-56a98d380c92 {
  SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7475/HWIODxeDriver/HWIODxeDriver.efi
  SECTION UI = "HWIODxeDriver"
}

FILE DRIVER = 10e193df-9966-44e7-b17c-59dd831e20fc {
  SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7475/ChipInfo/ChipInfo.efi
  SECTION UI = "ChipInfo"
}
FILE DRIVER = 4DB5DEA6-5302-4D1A-8A82-677A683B0D29 {
  SECTION PE32 = Platform/EFI_Binaries/Drivers/sm7475/ClockDxe/ClockDxe.efi
  SECTION UI = "ClockDxe"
}