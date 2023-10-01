// per-device BSP DXEs

FILE DRIVER = 8e9bd160-b184-11df-94e2-0800200c9a66 {
	SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/DALSys/DALSys.depex
	SECTION PE32 = Platform/EFI_Binaries/Drivers/Devices/mh2lm/DALSys/DALSys.efi
	SECTION UI = "DALSys"
}

#FILE DRIVER = 569ea0de-b557-4043-84cf-01103fe516e5 {
#    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/GpiDxe/GpiDxe.depex
#    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/GpiDxe/GpiDxe.efi
#    SECTION UI = "GpiDxe"
#}

FILE DRIVER = 5bd181db-0487-4f1a-ae73-820e165611b3 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/ButtonsDxe/ButtonsDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/Devices/mh2lm/ButtonsDxe/ButtonsDxe.efi
    SECTION UI = "ButtonsDxe"
}

FILE DRIVER = f10f76db-42c1-533f-34a8-69be24653110 {
    SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sm8150/SdccDxe/SdccDxe.depex
    SECTION PE32 = Platform/EFI_Binaries/Drivers/sm8150/SdccDxe/SdccDxe.efi
    SECTION UI = "SdccDxe"
  }

// ACPI Tables
FILE FREEFORM = 7E374E25-8E01-4FEE-87F2-390C23C606CD {

# 	Customized DSDT
    SECTION RAW = Platform/LG/sm8150/AcpiTables/betalm/DSDT.aml
# 	Common Tables
	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/APIC.aml
# 	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/BERT.aml
# 	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/BGRT.aml
	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/CSRT.aml
	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/DBG2.aml
	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/FACP.aml
# 	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/FPDT.aml
	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/GTDT.aml
	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/IORT.aml
	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/MCFG.aml
# 	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/MSDM.aml
	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/PPTT.aml
	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/TPM2.aml
# 	SECTION RAW = Silicon/Qualcomm/sm8150/AcpiTables/BuiltIn/XSDT.aml
	SECTION UI = "AcpiTables"
}

// Mainline device tree blob
FILE FREEFORM = 25462CDA-221F-47DF-AC1D-259CFAA4E326 {
  SECTION RAW = Platform/LG/sm8150/FdtBlob/sm8150-lge-betalm.dtb
}


  #
  # Touchscreen
  #
  # INF Silicon/Qualcomm/QcomPkg/Drivers/SynapticsRmi4Dxe/SynapticsTouchDevice.inf
  # INF Silicon/Qualcomm/QcomPkg/Drivers/SynapticsRmi4Dxe/SynapticsTouchDxe.inf
