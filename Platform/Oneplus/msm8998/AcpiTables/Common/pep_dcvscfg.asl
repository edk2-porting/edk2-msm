Scope (\_SB.PEP0)
{
    // CPU DCVS Configurations Packages
    Name (NDCV, Package (0x04)
    {
        Package (0x08)
        {
            "CHIP_INFO", 
            0x0124, 
            One, 
            Zero, 
            0x02, 
            Package (0x06)
            {
                "BIG", 
                0x04, 
                "apcs_cluster1_clk", 
                Package (0x02)
                {
                    0x0420, 
                    0x0600
                }, 

                0x03, 
                Package (0x03)
                {
                    Zero, 
                    0x0B, 
                    0x11
                }
            }, 

            Package (0x06)
            {
                "LITTLE", 
                0x04, 
                "apcs_cluster0_clk", 
                Package (0x02)
                {
                    0x03C0, 
                    0x05C6
                }, 

                0x03, 
                Package (0x03)
                {
                    Zero, 
                    0x09, 
                    0x10
                }
            }, 

            Package (0x02)
            {
                "CCI", 
                ""
            }
        }, 

        Package (0x08)
        {
            "CHIP_INFO", 
            0x0124, 
            0x02, 
            Zero, 
            0x02, 
            Package (0x06)
            {
                "BIG", 
                0x04, 
                "apcs_cluster1_clk", 
                Package (0x03)
                {
                    0x012C, 
                    0x046D, 
                    0x06C0
                }, 

                0x03, 
                Package (0x03)
                {
                    Zero, 
                    0x0B, 
                    0x13
                }
            }, 

            Package (0x06)
            {
                "LITTLE", 
                0x04, 
                "apcs_cluster0_clk", 
                Package (0x03)
                {
                    0x012C, 
                    0x040D, 
                    0x0613
                }, 

                0x03, 
                Package (0x03)
                {
                    Zero, 
                    0x0A, 
                    0x11
                }
            }, 

            Package (0x02)
            {
                "CCI", 
                ""
            }
        }, 

        Package (0x08)
        {
            "CHIP_INFO", 
            0x013F, 
            One, 
            Zero, 
            0x02, 
            Package (0x06)
            {
                "BIG", 
                0x04, 
                "apcs_cluster1_clk", 
                Package (0x03)
                {
                    0x012C, 
                    0x046D, 
                    0x06C0
                }, 

                0x03, 
                Package (0x03)
                {
                    Zero, 
                    0x0B, 
                    0x11
                }
            }, 

            Package (0x06)
            {
                "LITTLE", 
                0x04, 
                "apcs_cluster0_clk", 
                Package (0x03)
                {
                    0x012C, 
                    0x040D, 
                    0x0613
                }, 

                0x03, 
                Package (0x03)
                {
                    Zero, 
                    0x09, 
                    0x10
                }
            }, 

            Package (0x02)
            {
                "CCI", 
                ""
            }
        }, 

        Package (0x08)
        {
            "CHIP_INFO", 
            0x013F, 
            0x02, 
            Zero, 
            0x02, 
            Package (0x06)
            {
                "BIG", 
                0x04, 
                "apcs_cluster1_clk", 
                Package (0x03)
                {
                    0x012C, 
                    0x046D, 
                    0x06C0
                }, 

                0x03, 
                Package (0x03)
                {
                    Zero, 
                    0x0B, 
                    0x13
                }
            }, 

            Package (0x06)
            {
                "LITTLE", 
                0x04, 
                "apcs_cluster0_clk", 
                Package (0x03)
                {
                    0x012C, 
                    0x040D, 
                    0x0613
                }, 

                0x03, 
                Package (0x03)
                {
                    Zero, 
                    0x0A, 
                    0x11
                }
            }, 

            Package (0x02)
            {
                "CCI", 
                ""
            }
        }
    })
    Method (LDCV, 0, NotSerialized)
    {
        Return (NDCV) /* \_SB_.PEP0.NDCV */
    }
}
