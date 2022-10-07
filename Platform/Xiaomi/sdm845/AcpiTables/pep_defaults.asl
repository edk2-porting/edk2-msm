//===========================================================================
//                           <pep_defaults.asl>
// DESCRIPTION
//    This file contains default resource information. These are applied at either
// PEP boot time, on the ScreenOn event or on demand by the PEP driver.
//
//===========================================================================

Scope(\_SB.PEP0)
{
    Method(LDRS){
        return(NDRS)
    }
    
    Name( NDRS, 
        /**
         * The default resources package is used by PEP to handle system default resources.
         * Rather than having to declare them all in the SDF declaration, you define resources
         * separately and annotate them by functionality. At runtime, the parsed resources
         * will be placed into separate components within the SDF device node.
         *
         * The expected hiearchy of this package:
         * DEFAULT_RESOURCES
         *      (WORKAROUND|OPTIMIZATION)
         *      String = Name
         *          For debugging and querying -- keep it short
         *      String = "BOOT", "SCREENON", "DEMAND"
         *          When to activate these resources
         *      RESOURCES
         *          The list of resources to activate for this set workaround / optimization
         *
         */

        package(){
            "DEFAULT_RESOURCES",
            
             package()
            {
                "OPTIMIZATION",
                "CPU_CNOC_VOTE",
                "BOOT",

                package()
                {
                    "RESOURCES",

                    package() {"BUSARB", package() {3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_CLK_CTL", 1, 1, "SUPPRESSIBLE" }},

                    package()
                    {
                        "PMICVREGVOTE", // PMIC VREG resource
                        package()
                        {                                                                   
                            "PPP_RESOURCE_ID_BUCK_BOOST1_B",
                            12,         // Voltage Regulator type 12 = BOB
                            0,          // Voltage = 0V
                            0,          // SW Enable = Disable
                            2,          // BOB Mode = Auto
                            "HLOS_DRV",     // Optional: DRV Id (HLOS_DRV / DISPLAY_DRV)
                            "SUPPRESSIBLE", // Optional: Set Type (REQUIRED / SUPPRESSIBLE)
                        }
                    },
                    // TZ requirement for HW DRM
                    Package(){"CLOCK",  Package(){"gcc_disp_ahb_clk",  1}},// enable clock
                    Package(){"CLOCK",  Package(){"gcc_disp_ahb_clk",  9,8}},// mark suppressible
                    Package(){"CLOCK",  Package(){"gcc_disp_ahb_clk",  9,12}},// always ON
                },
            },
        })
}
