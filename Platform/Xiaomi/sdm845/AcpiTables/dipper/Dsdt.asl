//
// NOTE: The 3rd parameter (i.e. ComplianceRevision) must be >=2 for 64-bit integer support.
//
DefinitionBlock("DSDT.AML", "DSDT", 0x02, "QCOMM ", "SDM850 ", 3)
{
    Scope(\_SB_) {

		Include("addSub.asl")
        Include("dsdt_common.asl")
		Include("cust_dsdt.asl") 

        Include("usb.asl")

        // Thermal Zone devices depend on PEP (included in dsdt_common). Please be CAREFUL on location
		Include("cust_thermal_zones.asl")

		//
        // Hardware Notifications
		//
        Include("cust_hwn.asl")

        //
        // Touch
        //
        Include("cust_touch.asl")

		//
        // Buttons
		//
        Include("cust_arraybutton.asl")

        //
        // Data components
        //
        Include("data.asl")

        //
        //Qualcomm Diagnostic Consumer Interface
        //
        Device (QDCI)
        {
           Name (_DEP, Package(0x1)
           {
              \_SB_.GLNK
           })
           Name (_HID, "QCOM0224")
	 	   Alias(\_SB.PSUB, _SUB)
        }

        //
        // Bluetooth
        //
        Include("wcnss_bt.asl")

        //
        // ADC driver
        //
        Include("adc.asl")
   }

}
