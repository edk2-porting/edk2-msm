function platform_pre_acpi(){
	cp Platform/Xiaomi/sdm845/AcpiTables/beryllium/panel-tianma.asl Platform/Xiaomi/sdm845/AcpiTables/beryllium/panel.asl
	DEVICE="beryllium"
	EXT="-tianma"
	GEN_ACPI=true
}
