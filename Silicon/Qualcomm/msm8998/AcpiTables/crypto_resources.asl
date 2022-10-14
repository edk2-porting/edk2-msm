//===========================================================================
//                           <crypto_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by pep drivers.
//
//===========================================================================

Scope (\_SB.PEP0)
{
    Method (CRMD, 0, NotSerialized)
    {
        Return (CRCC) /* \_SB_.PEP0.CRCC */
    }

    Name (CRCC, Package (0x01)
    {
        Package (0x03)
        {
            "DEVICE", 
            "\\_SB.QBCC", 
            Package (0x04)
            {
                "COMPONENT", 
                Zero, 
                Package (0x04)
                {
                    "FSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "BUSARB", 
                        Package (0x05)
                        {
                            0x03, 
                            "ICBID_MASTER_APPSS_PROC", 
                            "ICBID_SLAVE_PRNG", 
                            0x2FAF0800, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "gcc_prng_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }
                }, 

                Package (0x04)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "BUSARB", 
                        Package (0x05)
                        {
                            0x03, 
                            "ICBID_MASTER_APPSS_PROC", 
                            "ICBID_SLAVE_PRNG", 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "gcc_prng_ahb_clk", 
                            0x02, 
                            Zero, 
                            One
                        }
                    }
                }
            }
        }
    })
}
