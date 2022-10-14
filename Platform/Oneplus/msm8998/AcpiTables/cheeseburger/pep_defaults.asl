//===========================================================================
//                           <pep_defaults.asl>
// DESCRIPTION
//    This file contains default resource information. These are applied at either
// PEP boot time, on the ScreenOn event or on demand by the PEP driver.
//
//===========================================================================

Scope (\_SB.PEP0)
{
    Method (LDRS, 0, NotSerialized)
    {
        Return (NDRS) /* \_SB_.PEP0.NDRS */
    }

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
    Name (NDRS, Package ()
    {
        "DEFAULT_RESOURCES", 
        Package (0x04)
        {
            "WORKAROUND", 
            "CNOC_PERIPH_DEFAULT_ON", 
            "BOOT", 
            Package (0x02)
            {
                "RESOURCES", 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/cnoc_periph", 
                        One
                    }
                }
            }
        }, 

        Package (0x04)
        {
            "WORKAROUND", 
            "GRAPHICS_RAIL_DEFAULT_OFF", 
            "BOOT", 
            Package (0x09)
            {
                "RESOURCES", 
                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_gpu_cfg_ahb_clk", 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/gfx", 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_gpu_bimc_gfx_clk", 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_bimc_gfx_clk", 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_bimc_gfx_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_gpu_bimc_gfx_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/gfx", 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_gpu_cfg_ahb_clk", 
                        0x02
                    }
                }
            }
        }, 

        Package (0x04)
        {
            "WORKAROUND", 
            "CODEC_GPIO_ON", 
            "BOOT", 
            Package (0x02)
            {
                "RESOURCES", 
                Package (0x02)
                {
                    "TLMMGPIO", 
                    Package (0x06)
                    {
                        0x40, 
                        Zero, 
                        Zero, 
                        One, 
                        Zero, 
                        0x07
                    }
                }
            }
        }, 

        Package (0x04)
        {
            "WORKAROUND", 
            "RF_CLK2_DEFAULT_OFF", 
            "BOOT", 
            Package (0x03)
            {
                "RESOURCES", 
                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x04)
                    {
                        "PPP_RESOURCE_ID_CXO_BUFFERS_RFCLK2_A", 
                        0x06, 
                        One, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x04)
                    {
                        "PPP_RESOURCE_ID_CXO_BUFFERS_RFCLK2_A", 
                        0x06, 
                        Zero, 
                        Zero
                    }
                }
            }
        }
    })
}
