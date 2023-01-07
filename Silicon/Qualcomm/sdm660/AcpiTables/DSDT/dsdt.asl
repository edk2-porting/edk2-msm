DefinitionBlock("DSDT.aml", "DSDT", 0x02, "QCOMM ", "SDM660 ", 3)
{
    Scope(\_SB_) {

		Include("addSub.asl")
        
        // Include("usb.asl")
        
        Include("dsdt_common.asl")

    }
}
