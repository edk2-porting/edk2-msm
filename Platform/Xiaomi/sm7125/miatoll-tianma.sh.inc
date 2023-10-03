function platform_pre_acpi(){
	cp Platform/Xiaomi/sm7125/AcpiTables/miatoll/DSDT_TIANMA.aml Platform/Xiaomi/sm7125/AcpiTables/miatoll/DSDT.aml
	DEVICE="miatoll"
	EXT="-tianma"
}
