//===========================================================================
//                           <pep_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by pep drivers.
//
//===========================================================================

Scope (\_SB.PEP0)
{
    Method (PPMD, 0, NotSerialized)
    {
        Return (PPCC) /* \_SB_.PEP0.PPCC */
    }

    Name (PPCC, Package (0x04)
    {
        Package (0x03)
        {
            "DEVICE", 
            "\\_SB.PRXY", 
            Package (0x03)
            {
                "COMPONENT", 
                Zero, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }
            }
        }, 

        Package (0x03)
        {
            "DEVICE", 
            "\\_SB.STAT", 
            Package (0x03)
            {
                "COMPONENT", 
                Zero, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }
            }
        }, 

        Package (0x03)
        {
            "DEVICE", 
            "\\_SB.UARD", 
            Package (0x03)
            {
                "COMPONENT", 
                Zero, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }
            }
        }, 

        Package (0x05)
        {
            "DEVICE", 
            0x81, 
            "\\_SB.GIO0", 
            Package (0x03)
            {
                "COMPONENT", 
                Zero, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }
            }, 

            Package (0x03)
            {
                "COMPONENT", 
                One, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }
            }
        }
    })
    // System Default Resources Packages
    Name (SDFR, Package (0x01)
    {
        Package (0x03)
        {
            "DEVICE", 
            "\\_SB.SDFR", 
            Package (0x06)
            {
                "COMPONENT", 
                Zero, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x02)
                {
                    "FSTATE", 
                    One
                }, 

                Package (0x02)
                {
                    "FSTATE", 
                    0x02
                }, 

                Package (0x02)
                {
                    "FSTATE", 
                    0x03
                }
            }
        }
    })
}
