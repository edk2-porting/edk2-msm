//===========================================================================
//                           <subsys_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by subsystem drivers.
//
//===========================================================================

Scope (\_SB.PEP0)
{
    Method (SPMD, 0, NotSerialized)
    {
        Return (SPCC) /* \_SB_.PEP0.SPCC */
    }

    Name (SPCC, Package (0x03)
    {
        Package (0x05)
        {
            "DEVICE", 
            "\\_SB.AMSS", 
            Package (0x06)
            {
                "COMPONENT", 
                Zero, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x06)
                {
                    "PSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "PMICVREGVOTE", 
                        Package (0x0E)
                        {
                            "PPP_RESOURCE_ID_SMPS2_C", 
                            0x02, 
                            0x000B7980, 
                            0x002191C0, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/pmic/client/rail_cx", 
                            0x0100
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/pmic/client/rail_mx", 
                            0x0100
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/ipa", 
                            0x1D4C
                        }
                    }
                }, 

                Package (0x05)
                {
                    "PSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/pmic/client/rail_cx", 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/pmic/client/rail_mx", 
                            Zero
                        }
                    }, 

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
                }, 

                Package (0x03)
                {
                    "PSTATE", 
                    0x02, 
                    Package (0x02)
                    {
                        "PMICVREGVOTE", 
                        Package (0x0E)
                        {
                            "PPP_RESOURCE_ID_SMPS2_C", 
                            0x02, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                }
            }, 

            Package (0x02)
            {
                "DSTATE", 
                Zero
            }, 

            Package (0x02)
            {
                "DSTATE", 
                0x03
            }
        }, 

        Package (0x05)
        {
            "DEVICE", 
            "\\_SB.ADSP", 
            Package (0x05)
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
                    "PSTATE", 
                    Zero
                }, 

                Package (0x02)
                {
                    "PSTATE", 
                    One
                }
            }, 

            Package (0x02)
            {
                "DSTATE", 
                Zero
            }, 

            Package (0x02)
            {
                "DSTATE", 
                0x03
            }
        }, 

        Package (0x05)
        {
            "DEVICE", 
            "\\_SB.SCSS", 
            Package (0x06)
            {
                "COMPONENT", 
                Zero, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x06)
                {
                    "PSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "PMICVREGVOTE", 
                        Package (0x04)
                        {
                            "PPP_RESOURCE_ID_RWAY_SSC_MX", 
                            0x0B, 
                            "RAIL_VOLTAGE_LEVEL_NOMINAL", 
                            "RAIL_VOLTAGE_LEVEL_OFF"
                        }
                    }, 

                    Package (0x02)
                    {
                        "PMICVREGVOTE", 
                        Package (0x04)
                        {
                            "PPP_RESOURCE_ID_RWAY_SSC_CX", 
                            0x0B, 
                            "RAIL_VOLTAGE_LEVEL_NOMINAL", 
                            "RAIL_VOLTAGE_LEVEL_OFF"
                        }
                    }, 

                    Package (0x02)
                    {
                        "PMICVREGVOTE", 
                        Package (0x06)
                        {
                            "PPP_RESOURCE_ID_LVS2_A", 
                            0x04, 
                            0x001B7740, 
                            0x51A4, 
                            One, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/agr2", 
                            One
                        }
                    }
                }, 

                Package (0x06)
                {
                    "PSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "PMICVREGVOTE", 
                        Package (0x04)
                        {
                            "PPP_RESOURCE_ID_RWAY_SSC_CX", 
                            0x0B, 
                            "RAIL_VOLTAGE_LEVEL_OFF", 
                            "RAIL_VOLTAGE_LEVEL_OFF"
                        }
                    }, 

                    Package (0x02)
                    {
                        "PMICVREGVOTE", 
                        Package (0x04)
                        {
                            "PPP_RESOURCE_ID_RWAY_SSC_MX", 
                            0x0B, 
                            "RAIL_VOLTAGE_LEVEL_OFF", 
                            "RAIL_VOLTAGE_LEVEL_OFF"
                        }
                    }, 

                    Package (0x02)
                    {
                        "PMICVREGVOTE", 
                        Package (0x06)
                        {
                            "PPP_RESOURCE_ID_LVS2_A", 
                            0x04, 
                            0x001B7740, 
                            0x6B80, 
                            One, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/agr2", 
                            One
                        }
                    }
                }, 

                Package (0x06)
                {
                    "PSTATE", 
                    0x02, 
                    Package (0x02)
                    {
                        "PMICVREGVOTE", 
                        Package (0x04)
                        {
                            "PPP_RESOURCE_ID_RWAY_SSC_CX", 
                            0x0B, 
                            "RAIL_VOLTAGE_LEVEL_OFF", 
                            "RAIL_VOLTAGE_LEVEL_OFF"
                        }
                    }, 

                    Package (0x02)
                    {
                        "PMICVREGVOTE", 
                        Package (0x04)
                        {
                            "PPP_RESOURCE_ID_RWAY_SSC_MX", 
                            0x0B, 
                            "RAIL_VOLTAGE_LEVEL_OFF", 
                            "RAIL_VOLTAGE_LEVEL_OFF"
                        }
                    }, 

                    Package (0x02)
                    {
                        "PMICVREGVOTE", 
                        Package (0x06)
                        {
                            "PPP_RESOURCE_ID_LVS2_A", 
                            0x04, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            0x02, 
                            "/clk/agr2", 
                            One
                        }
                    }
                }
            }, 

            Package (0x02)
            {
                "DSTATE", 
                Zero
            }, 

            Package (0x02)
            {
                "DSTATE", 
                0x03
            }
        }
    })
}
