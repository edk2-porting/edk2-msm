//
// NOTE: The 3rd parameter (i.e. ComplianceRevision) must be >=2 for 64-bit integer support.
//
DefinitionBlock("DSDT.AML", "DSDT", 0x02, "QCOMM ", "SDM850 ", 3)
{
    Scope(\_SB_) {

		// Include("addSub.asl")
        Include("dsdt_common.asl")
		// Include("cust_dsdt.asl") 

        // Include("usb.asl")

		//
        // Buttons
		//
        // Include("cust_arraybutton.asl")

        //
        // Bluetooth
        //
        // Include("wcnss_bt.asl")
   }
}
