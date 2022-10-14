//===========================================================================
//                           <HoyaSmmu_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by SMMU driver.
//
//===========================================================================

Scope (\_SB.PEP0)
{
    Method (SMMD, 0, NotSerialized)
    {
        Return (SMMC) /* \_SB_.PEP0.SMMC */
    }

    Name (SMMC, Package (0x04)
    {
        Package (0x03)
        {
            "DEVICE", 
            "\\_SB.MMU0", 
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
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_HLOS1_ALL_MMSS_SMMU", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "gcc_hlos1_all_mmss_smmu_clk", 
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
                        "CLOCK", 
                        Package (0x02)
                        {
                            "gcc_hlos1_all_mmss_smmu_clk", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_HLOS1_ALL_MMSS_SMMU", 
                            0x02
                        }
                    }
                }
            }
        }, 

        Package (0x03)
        {
            "DEVICE", 
            "\\_SB.MMU1", 
            Package (0x04)
            {
                "COMPONENT", 
                Zero, 
                Package (0x05)
                {
                    "FSTATE", 
                    Zero, 
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
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_HLOS1_GPU_SMMU", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "gcc_hlos1_gpu_smmu_clk", 
                            One
                        }
                    }
                }, 

                Package (0x05)
                {
                    "FSTATE", 
                    One, 
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
                            "gcc_hlos1_gpu_smmu_clk", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_HLOS1_GPU_SMMU", 
                            0x02
                        }
                    }
                }
            }
        }, 

        Package (0x03)
        {
            "DEVICE", 
            "\\_SB.MMU2", 
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
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_HLOS1_ALL_LPASS_SMMU", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "gcc_hlos1_all_lpass_smmu_clk", 
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
                        "CLOCK", 
                        Package (0x02)
                        {
                            "gcc_hlos1_all_lpass_smmu_clk", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_HLOS1_ALL_LPASS_SMMU", 
                            0x02
                        }
                    }
                }
            }
        }, 

        Package (0x03)
        {
            "DEVICE", 
            "\\_SB.MMU3", 
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
                            "/clk/agr2", 
                            One
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
                            "/clk/agr2", 
                            Zero
                        }
                    }
                }
            }
        }
    })
}
