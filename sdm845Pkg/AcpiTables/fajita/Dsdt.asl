
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
        // Sillab FM chip
        //
        //Include("wcnss_fm.asl")

        //
        // Bluetooth
        //
        Include("wcnss_bt.asl")

        //
        // QCOM App Profiler: Used by performance team
        //
 //       Device (PER0)
 //       {
 //           Name (_HID, "QCOM02ED")

 //       }

                // XOMC: 48MHz XO Mode configuration
                //   0: NO 48MHz XO on HW, otherwise 1
                // Method WXOM = 'MOXW': WCNSS XO Mode configuration
                //   Returns XOMC value. Invoked by WCN driver.
                //   WCN driver turns ON or OFF 48MHz according to XOMC value.
                //
                // NOTE: this method explicitly sets the XO mode and when present bypasses auto-ID checking in the WCN driver.
                //       If this is not in ACPI, WCN driver will do auto-ID checking and decide the 48MHz XO mode according to the chip ID
                //Scope(\_SB_.RIVA)
                //{
                //      Name(XOMC, 0x0)
                //
                //      Method(WXOM)
                //      {
                //              return(XOMC)
                //      }
                //}

        //
        // ADC driver
        //
        Include("adc.asl")
        //Include("Bringup_Disable.asl")
   }

}
