function platform_pre_acpi(){
	cp Platform/Xiaomi/sm8150/AcpiTables/vayu/DSDT_HUAXING.aml Platform/Xiaomi/sm8150/AcpiTables/vayu/DSDT.aml
	DEVICE="vayu"
	EXT="-huaxing"
}
