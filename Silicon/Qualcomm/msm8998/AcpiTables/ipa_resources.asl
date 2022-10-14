//===========================================================================
//                           <ipa_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by ipa driver.
//
//===========================================================================

//===========================================================================
// Implementation of function states for IPA driver.
// Present implementation has two function states F0 and F1.
//
// F0 = Full power mode.
// F1 = Low power mode.
//
// Resource being managed is /clk/ipa
//===========================================================================

Scope (\_SB.PEP0)
{
    Method (IPMD, 0, NotSerialized)
    {
        Return (IPSC) /* \_SB_.PEP0.IPSC */
    }

    Name (IPSC, Package (0x01)
    {
        Package (0x03)
        {
            "DEVICE", 
            "\\_SB.IPA", 
            Package (0x04)
            {
                "COMPONENT", 
                Zero, 
                Package (0x03)
                {
                    "FSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/ipa", 
                            0x000124F8
                        }
                    }
                }, 

                Package (0x03)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/ipa", 
                            Zero
                        }
                    }
                }
            }
        }
    })
}
