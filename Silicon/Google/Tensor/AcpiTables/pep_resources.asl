//===========================================================================
//                           <pep_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by pep drivers.
//
//===========================================================================

Scope(\_SB_.PEP0) 
{

    // PEP 
    Method(PPMD)
    {
        Return(PPCC)
    }	
	
    Name(PPCC,
    Package ()
    { 
         // PEP Proxy Driver
        Package(){
            "DEVICE", 
            "\\_SB.PRXY", 
            Package(){
                "COMPONENT", 
                0, 
                // F-State placeholders
                Package(){ "FSTATE", 0, },
            },
        },
        // PEP Stats Driver
        Package(){
            "DEVICE", 
            "\\_SB.STAT", 
            Package(){
                "COMPONENT", 
                0, 
                // F-State placeholders
                Package(){ "FSTATE", 0, },
            },
        },
        // Claim GPIO Device to enable wake up from XO etc
        Package()
        {
            //GPIO
            "DEVICE",
            0x81, // TransferrableIOIrq
            "\\_SB.GIO0",
            Package()
            {
                "COMPONENT",
                0,
                // F-State placeholders
                Package() {"FSTATE",0,},
            },
            Package()
            {
                "COMPONENT",
                1,
                // F-State placeholders
                Package() {"FSTATE",0},
            },
        },
       
    })
	// System Default Resources Packages
    Name(SDFR,
	Package()
	{
        //System Resources
        Package(){
            "DEVICE", 
            "\\_SB.SDFR", 
            
            Package(){
                "COMPONENT", 
                0, 
                Package(){
                    "FSTATE", 
                    0, 
                    // Place any resources required for nominal operation
                    // SDF will choose either Nominal or SVS at boot
                },
                Package(){
                    "FSTATE", 
                    1, 
                    // Place any resources required for SVS operation
                    // SDF will choose either Nominal or SVS at boot
                },
                Package(){
                    "FSTATE", 
                    2,
                    // Common SDF resources; will be set when PEP finishes 
                    // parsing standard ACPI resources

                },
                Package(){
                    "FSTATE", 
                    3, 
                    //Low Power Pad Settings
                },
            },
        },
        }) 
}
