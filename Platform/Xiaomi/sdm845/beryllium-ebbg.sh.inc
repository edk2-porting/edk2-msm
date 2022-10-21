function platform_pre_acpi(){
	cp Platform/Xiaomi/sdm845/AcpiTables/beryllium/panel-ebbg.asl Platform/Xiaomi/sdm845/AcpiTables/beryllium/panel.asl
	DEVICE="beryllium"
	EXT="-ebbg"
	GEN_ACPI=true
}
