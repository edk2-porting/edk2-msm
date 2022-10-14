Scope (\_SB.PEP0)
{
    //-----------------------------------------------------------------------------------------
    //  GRAPHICS, DISPLAY, and VIDEO resources
    //
    //  !!WARNING: The below table entries are auto-generated and are part of several
    //             interdependent ACPI methods that are all auto-generated from a single source.
    //             These components should NOT be edited by hand, as they must stay in sync
    //             with all other dependent graphics methods.
    //-----------------------------------------------------------------------------------------
    //  OWNING DRIVER: qcdxkm8998.sys
    //
    //  HW CONTROLLED: 3D core
    //                 MDP core
    //                 Internal display circuitry
    //                 HDMI circuitry
    //                 Rotator core
    //                 Video Decode core
    //
    //  COMPONENTS:
    //                 C0 - Internal (Primary) Display Power States
    //                 C1 - 3D Graphics Engine Power States
    //                 C2 - MDP BLT Engine Power States
    //                 C3 - Rotator Engine Power States
    //                 C4 - Video Engine Power States
    //                 C5 - Crypto Engine Power States
    //                 C6 - Video Encoder Engine Power States
    //                 C7 - Internal (Secondary) Display Power States
    //                 C8 - Display Port Power States
    //                 C9 - Dummy Component for WP Workaround
    //-----------------------------------------------------------------------------------------
    //
    
    //--------------------------------------------------------------------------------------
    //  Complete list of individual component methods
    //--------------------------------------------------------------------------------------
    //
    Method (GPMD, 0, NotSerialized)
    {
        Name (LIST, Package (0x0C)
        {
            "METHOD_LIST", 
            "DM0G", 
            "DM1G", 
            "DM2G", 
            "DM3G", 
            "DM4G", 
            "DM5G", 
            "DM6G", 
            "DM7G", 
            "DM8G", 
            "DM9G", 
            "DMKG"
        })
        Return (LIST) /* \_SB_.PEP0.GPMD.LIST */
    }

    Method (G0MD, 0, NotSerialized)
    {
        Name (GPCC, Package (One)
        {
            Package (0x03)
            {
                "DEVICE", 
                "\\_SB.GPU0", 
                Package (0x0C)
                {
                    "COMPONENT", 
                    Zero, 
                    Package (0x02)
                    {
                        "FSTATE", 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "FSTATE", 
                        One, 
                        Package (0x12)
                        {
                            "ENTER", 
                            Package (One)
                            {
                                "PSTATE_SAVE"
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x03, 
                                    0x09
                                }
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x04, 
                                    0x29
                                }
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x02, 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_MDSS", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x0B, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x80, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x5B, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    0x14
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO1_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO2_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO28_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x06)
                                {
                                    "PPP_RESOURCE_ID_LVS1_A", 
                                    0x04, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    0x05
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x55, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x04)
                                {
                                    "PPP_RESOURCE_ID_CXO_BUFFERS_BBCLK2_A", 
                                    0x06, 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x0E)
                        {
                            "EXIT", 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_MDSS", 
                                    One
                                }
                            }, 

                            Package (0x01)
                            {
                                "PSTATE_RESTORE"
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x55, 
                                    One, 
                                    Zero, 
                                    One, 
                                    0x03, 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    0x05
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x04)
                                {
                                    "PPP_RESOURCE_ID_CXO_BUFFERS_BBCLK2_A", 
                                    0x06, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO1_A", 
                                    One, 
                                    0x000D6D80, 
                                    0x8F5C, 
                                    One, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO2_A", 
                                    One, 
                                    0x00124F80, 
                                    0x1888, 
                                    One, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x06)
                                {
                                    "PPP_RESOURCE_ID_LVS1_A", 
                                    0x04, 
                                    0x0002BF20, 
                                    0x000186A0, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x5B, 
                                    One, 
                                    Zero, 
                                    One, 
                                    0x03, 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x80, 
                                    One, 
                                    Zero, 
                                    One, 
                                    0x03, 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x0B, 
                                    One, 
                                    Zero, 
                                    One, 
                                    0x03, 
                                    0x02
                                }
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "INIT_FSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "PRELOAD_FSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "ABANDON_FSTATE", 
                        Zero
                    }, 

                    Package (0x06)
                    {
                        "PSTATE_SET", 
                        Zero, 
                        Package (0x02)
                        {
                            "PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x04)
                    {
                        "PSTATE_SET", 
                        One, 
                        Package (0x04)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_MDSS", 
                                    One
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_MDSS", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    Zero
                                }
                            }
                        }
                    }, 

                    Package (0x0A)
                    {
                        "PSTATE_SET", 
                        0x02, 
                        Package (0x15)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_misc_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_vsync_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk0_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc0_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_intf_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_intf_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_extpclk_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_dp_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_clk", 
                                    One
                                }
                            }
                        }, 

                        Package (0x15)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_misc_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_vsync_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk0_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc0_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_intf_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_intf_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_extpclk_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_dp_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_clk", 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x15)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_misc_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_vsync_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk0_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc0_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_intf_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk1_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc1_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_intf_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_extpclk_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_dp_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_clk", 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x15)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_misc_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_vsync_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk0_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc0_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_intf_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_intf_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_extpclk_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_dp_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_clk", 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x15)
                        {
                            "PSTATE", 
                            0x04, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_misc_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_axi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_vsync_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk0_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc0_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_intf_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk1_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc1_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_intf_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_extpclk_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_dp_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x0F)
                    {
                        "PSTATE_SET", 
                        0x03, 
                        Package (0x04)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x18964020, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x11E1A300, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x13AB6680, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x11E1A300, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x11E1A300, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x11E1A300, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x10642AC0, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x08F0D180, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x04, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x0BEBC200, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x08F0D180, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x05, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x0A37CADB, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x047868C0, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x06, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x08F0D180, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x047868C0, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x07, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x05F5E100, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x047868C0, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x08, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x051BE56E, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x047868C0, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x09, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            0x03
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            0x03
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            0x03
                        }
                    }, 

                    Package (0x2F)
                    {
                        "PSTATE_SET", 
                        0x04, 
                        Package (0x03)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000025A01C500, 
                                    0x000000025A01C500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000002422A4100, 
                                    0x00000002422A4100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000022A52BD00, 
                                    0x000000022A52BD00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000002127B3900, 
                                    0x00000002127B3900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x04, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001FAA3B500, 
                                    0x00000001FAA3B500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x05, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001E2CC3100, 
                                    0x00000001E2CC3100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x06, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001CAF4AD00, 
                                    0x00000001CAF4AD00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x07, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001B31D2900, 
                                    0x00000001B31D2900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x08, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000019B45A500, 
                                    0x000000019B45A500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x09, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001836E2100, 
                                    0x00000001836E2100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0A, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000016B969D00, 
                                    0x000000016B969D00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0B, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000153BF1900, 
                                    0x0000000153BF1900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0C, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000013BE79500, 
                                    0x000000013BE79500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0D, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000124101100, 
                                    0x0000000124101100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0E, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000010C388D00, 
                                    0x000000010C388D00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0F, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xF4610900, 
                                    0xF4610900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x10, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xDC898500, 
                                    0xDC898500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x11, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xC4B20100, 
                                    0xC4B20100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x12, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xACDA7D00, 
                                    0xACDA7D00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x13, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x9502F900, 
                                    0x9502F900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x14, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x8F0D1800, 
                                    0x8F0D1800
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x15, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x89173700, 
                                    0x89173700
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x16, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x83215600, 
                                    0x83215600
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x17, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x7D2B7500, 
                                    0x7D2B7500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x18, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x77359400, 
                                    0x77359400
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x19, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x713FB300, 
                                    0x713FB300
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1A, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x6B49D200, 
                                    0x6B49D200
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1B, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x6553F100, 
                                    0x6553F100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1C, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x5F5E1000, 
                                    0x5F5E1000
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1D, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x59682F00, 
                                    0x59682F00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1E, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x53724E00, 
                                    0x53724E00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1F, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x4D7C6D00, 
                                    0x4D7C6D00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x20, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x47868C00, 
                                    0x47868C00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x21, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x4190AB00, 
                                    0x4190AB00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x22, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x3B9ACA00, 
                                    0x3B9ACA00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x23, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x35A4E900, 
                                    0x35A4E900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x24, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x2FAF0800, 
                                    0x2FAF0800
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x25, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x29B92700, 
                                    0x29B92700
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x26, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x23C34600, 
                                    0x23C34600
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x27, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x1DCD6500, 
                                    0x1DCD6500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x28, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x17D78400, 
                                    0x17D78400
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x29, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            0x21
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            0x21
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            0x21
                        }
                    }
                }
            }
        })
        Return (GPCC) /* \_SB_.PEP0.G0MD.GPCC */
    }

    Method (G1MD, 0, NotSerialized)
    {
        Name (GPCC, Package (One)
        {
            Package (0x03)
            {
                "DEVICE", 
                "\\_SB.GPU0", 
                Package (0x0B)
                {
                    "COMPONENT", 
                    One, 
                    Package (0x02)
                    {
                        "FSTATE", 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "FSTATE", 
                        One, 
                        Package (0x0F)
                        {
                            "ENTER", 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "gpucc_gfx3d_clk", 
                                    0x09, 
                                    0x15
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "gpucc_gfx3d_clk", 
                                    0x09, 
                                    0x13
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gpucc_rbbmtimer_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gpucc_gfx3d_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_GFX3D_CFG", 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x01)
                            {
                                "PSTATE_SAVE"
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x03, 
                                    0x0C
                                }
                            }, 

                            Package (0x01)
                            {
                                "PSTATE_ADJUST"
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_GPU_GX", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_GPU_CX", 
                                    0x02
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
                        }, 

                        Package (0x0D)
                        {
                            "EXIT", 
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
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_GPU_CX", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_GPU_GX", 
                                    One
                                }
                            }, 

                            Package (0x01)
                            {
                                "PSTATE_RESTORE"
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_GFX3D_CFG", 
                                    0x08F0D180, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gpucc_gfx3d_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gpucc_rbbmtimer_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "gpucc_gfx3d_clk", 
                                    0x09, 
                                    0x12
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "gpucc_gfx3d_clk", 
                                    0x09, 
                                    0x14
                                }
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "INIT_FSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "PRELOAD_FSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "ABANDON_FSTATE", 
                        One
                    }, 

                    Package (0x07)
                    {
                        "PSTATE_SET", 
                        Zero, 
                        Package (0x02)
                        {
                            "PSTATE", 
                            Zero
                        }, 

                        Package (0x07)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gpucc_gfx3d_clk", 
                                    0x0A
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gpucc_gpu_cx_bcr", 
                                    0x0A
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gpucc_gpu_cx_bcr", 
                                    0x0B
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gpucc_gfx3d_clk", 
                                    0x0B
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x07)
                    {
                        "PSTATE_SET", 
                        One, 
                        Package (0x07)
                        {
                            "PSTATE", 
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
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "gpucc_gfx3d_clk", 
                                    0x09, 
                                    0x12
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "gpucc_gfx3d_clk", 
                                    0x09, 
                                    0x14
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_GPU_CX", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_GPU_GX", 
                                    One
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PSTATE", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_SET", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_SET", 
                        0x03
                    }
                }
            }
        })
        Name (P001, Package (0x02)
        {
            "PSTATE_ADJUST", 
            Package (0x02)
            {
                0x02, 
                0x06
            }
        })
        Name (P002, Package (0x02)
        {
            "PSTATE_ADJUST", 
            Package (0x02)
            {
                0x02, 
                0x08
            }
        })
        Name (P003, Package (0x0B)
        {
            "PSTATE_SET", 
            0x02, 
            Package (0x04)
            {
                "PSTATE", 
                Zero, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/cnoc", 
                        0x00011D28
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/gfx", 
                        0x0009E340
                    }
                }
            }, 

            Package (0x04)
            {
                "PSTATE", 
                One, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/cnoc", 
                        0x00011D28
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/gfx", 
                        0x0007A8F0
                    }
                }
            }, 

            Package (0x04)
            {
                "PSTATE", 
                0x02, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/cnoc", 
                        0x00011D28
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/gfx", 
                        0x00061E68
                    }
                }
            }, 

            Package (0x04)
            {
                "PSTATE", 
                0x03, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/cnoc", 
                        0x8AAC
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/gfx", 
                        0x00050910
                    }
                }
            }, 

            Package (0x04)
            {
                "PSTATE", 
                0x04, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/cnoc", 
                        0x8AAC
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/gfx", 
                        0x0003CCA8
                    }
                }
            }, 

            Package (0x04)
            {
                "PSTATE", 
                0x05, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/cnoc", 
                        0x8AAC
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/gfx", 
                        0x00029428
                    }
                }
            }, 

            Package (0x04)
            {
                "PSTATE", 
                0x06, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/cnoc", 
                        Zero
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
                }
            }, 

            Package (0x02)
            {
                "PREPARE_PSTATE", 
                0x03
            }, 

            Package (0x02)
            {
                "ABANDON_PSTATE", 
                0x03
            }
        })
        Name (P004, Package (0x0D)
        {
            "PSTATE_SET", 
            0x02, 
            Package (0x04)
            {
                "PSTATE", 
                Zero, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/cnoc", 
                        0x00011D28
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/gfx", 
                        0x000ACDA0
                    }
                }
            }, 

            Package (0x04)
            {
                "PSTATE", 
                One, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/cnoc", 
                        0x00011D28
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/gfx", 
                        0x000A3160
                    }
                }
            }, 

            Package (0x04)
            {
                "PSTATE", 
                0x02, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/cnoc", 
                        0x00011D28
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/gfx", 
                        0x00091050
                    }
                }
            }, 

            Package (0x04)
            {
                "PSTATE", 
                0x03, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/cnoc", 
                        0x00011D28
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/gfx", 
                        0x0007D3E8
                    }
                }
            }, 

            Package (0x04)
            {
                "PSTATE", 
                0x04, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/cnoc", 
                        0x8AAC
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/gfx", 
                        0x00064960
                    }
                }
            }, 

            Package (0x04)
            {
                "PSTATE", 
                0x05, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/cnoc", 
                        0x8AAC
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/gfx", 
                        0x00053020
                    }
                }
            }, 

            Package (0x04)
            {
                "PSTATE", 
                0x06, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/cnoc", 
                        0x8AAC
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/gfx", 
                        0x0003E418
                    }
                }
            }, 

            Package (0x04)
            {
                "PSTATE", 
                0x07, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/cnoc", 
                        0x8AAC
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/gfx", 
                        0x0002B750
                    }
                }
            }, 

            Package (0x04)
            {
                "PSTATE", 
                0x08, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/cnoc", 
                        Zero
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
                }
            }, 

            Package (0x02)
            {
                "PREPARE_PSTATE", 
                0x05
            }, 

            Package (0x02)
            {
                "ABANDON_PSTATE", 
                0x05
            }
        })
        Name (P005, Package (0x11)
        {
            "PSTATE_SET", 
            0x03, 
            Package (0x03)
            {
                "PSTATE", 
                Zero, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0x000000035BA45C00, 
                        Zero
                    }
                }
            }, 

            Package (0x03)
            {
                "PSTATE", 
                One, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0x00000002E49F9C00, 
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
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0x000000026906FC00, 
                        Zero
                    }
                }
            }, 

            Package (0x03)
            {
                "PSTATE", 
                0x03, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0x00000001E4469C00, 
                        Zero
                    }
                }
            }, 

            Package (0x03)
            {
                "PSTATE", 
                0x04, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0x000000016D41DC00, 
                        Zero
                    }
                }
            }, 

            Package (0x03)
            {
                "PSTATE", 
                0x05, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0x00000001440EFC00, 
                        Zero
                    }
                }
            }, 

            Package (0x03)
            {
                "PSTATE", 
                0x06, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0x0000000103F8BC00, 
                        Zero
                    }
                }
            }, 

            Package (0x03)
            {
                "PSTATE", 
                0x07, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0xC3E27C00, 
                        Zero
                    }
                }
            }, 

            Package (0x03)
            {
                "PSTATE", 
                0x08, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0x8E18F400, 
                        Zero
                    }
                }
            }, 

            Package (0x03)
            {
                "PSTATE", 
                0x09, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0x5E69EC00, 
                        Zero
                    }
                }
            }, 

            Package (0x03)
            {
                "PSTATE", 
                0x0A, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0x46926800, 
                        Zero
                    }
                }
            }, 

            Package (0x03)
            {
                "PSTATE", 
                0x0B, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0x2EBAE400, 
                        Zero
                    }
                }
            }, 

            Package (0x03)
            {
                "PSTATE", 
                0x0C, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        Zero, 
                        Zero
                    }
                }
            }, 

            Package (0x02)
            {
                "PREPARE_PSTATE", 
                0x05
            }, 

            Package (0x02)
            {
                "ABANDON_PSTATE", 
                0x05
            }
        })
        Name (P006, Package (0x11)
        {
            "PSTATE_SET", 
            0x03, 
            Package (0x03)
            {
                "PSTATE", 
                Zero, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0x000000035BA45C00, 
                        Zero
                    }
                }
            }, 

            Package (0x03)
            {
                "PSTATE", 
                One, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0x00000002E49F9C00, 
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
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0x000000026906FC00, 
                        Zero
                    }
                }
            }, 

            Package (0x03)
            {
                "PSTATE", 
                0x03, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0x00000001E4469C00, 
                        Zero
                    }
                }
            }, 

            Package (0x03)
            {
                "PSTATE", 
                0x04, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0x000000016D41DC00, 
                        Zero
                    }
                }
            }, 

            Package (0x03)
            {
                "PSTATE", 
                0x05, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0x00000001440EFC00, 
                        Zero
                    }
                }
            }, 

            Package (0x03)
            {
                "PSTATE", 
                0x06, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0x0000000103F8BC00, 
                        Zero
                    }
                }
            }, 

            Package (0x03)
            {
                "PSTATE", 
                0x07, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0xC3E27C00, 
                        Zero
                    }
                }
            }, 

            Package (0x03)
            {
                "PSTATE", 
                0x08, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0x8E18F400, 
                        Zero
                    }
                }
            }, 

            Package (0x03)
            {
                "PSTATE", 
                0x09, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0x5E69EC00, 
                        Zero
                    }
                }
            }, 

            Package (0x03)
            {
                "PSTATE", 
                0x0A, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0x46926800, 
                        Zero
                    }
                }
            }, 

            Package (0x03)
            {
                "PSTATE", 
                0x0B, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        0x2EBAE400, 
                        Zero
                    }
                }
            }, 

            Package (0x03)
            {
                "PSTATE", 
                0x0C, 
                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_GFX3D", 
                        "ICBID_SLAVE_EBI1", 
                        Zero, 
                        Zero
                    }
                }
            }, 

            Package (0x02)
            {
                "PREPARE_PSTATE", 
                0x05
            }, 

            Package (0x02)
            {
                "ABANDON_PSTATE", 
                0x05
            }
        })
        If ((\_SB.SIDV < 0x00020000))
        {
            DerefOf (DerefOf (DerefOf (DerefOf (GPCC [Zero]
                ) [0x02]) [0x03]) [0x02]) [0x08] = P001 /* \_SB_.PEP0.G1MD.P001 */
        }
        Else
        {
            DerefOf (DerefOf (DerefOf (DerefOf (GPCC [Zero]
                ) [0x02]) [0x03]) [0x02]) [0x08] = P002 /* \_SB_.PEP0.G1MD.P002 */
        }

        If ((\_SB.SIDV < 0x00020000))
        {
            DerefOf (DerefOf (GPCC [Zero]) [0x02]) [0x09]
                    = P003 /* \_SB_.PEP0.G1MD.P003 */
        }
        Else
        {
            DerefOf (DerefOf (GPCC [Zero]) [0x02]) [0x09]
                    = P004 /* \_SB_.PEP0.G1MD.P004 */
        }

        If ((\_SB.SIDV < 0x00020000))
        {
            DerefOf (DerefOf (GPCC [Zero]) [0x02]) [0x0A]
                    = P005 /* \_SB_.PEP0.G1MD.P005 */
        }
        Else
        {
            DerefOf (DerefOf (GPCC [Zero]) [0x02]) [0x0A]
                    = P006 /* \_SB_.PEP0.G1MD.P006 */
        }

        Return (GPCC) /* \_SB_.PEP0.G1MD.GPCC */
    }

    Method (G2MD, 0, NotSerialized)
    {
        Name (GPCC, Package (0x01)
        {
            Package (0x03)
            {
                "DEVICE", 
                "\\_SB.GPU0", 
                Package (0x0C)
                {
                    "COMPONENT", 
                    0x02, 
                    Package (0x02)
                    {
                        "FSTATE", 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "FSTATE", 
                        One, 
                        Package (0x0C)
                        {
                            "ENTER", 
                            Package (0x01)
                            {
                                "PSTATE_SAVE"
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x02, 
                                    0x09
                                }
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x03, 
                                    0x29
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_vsync_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_misc_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_axi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x0A)
                        {
                            "EXIT", 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_misc_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_vsync_clk", 
                                    One
                                }
                            }, 

                            Package (0x01)
                            {
                                "PSTATE_RESTORE"
                            }
                        }
                    }, 

                    Package (0x04)
                    {
                        "FSTATE", 
                        0x02, 
                        Package (0x0E)
                        {
                            "ENTER", 
                            Package (0x01)
                            {
                                "PSTATE_SAVE"
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x02, 
                                    0x09
                                }
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x03, 
                                    0x29
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_vsync_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_misc_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_axi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_MDSS", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x0C)
                        {
                            "EXIT", 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_MDSS", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_misc_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_vsync_clk", 
                                    One
                                }
                            }, 

                            Package (0x01)
                            {
                                "PSTATE_RESTORE"
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "INIT_FSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "PRELOAD_FSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "ABANDON_FSTATE", 
                        0x02
                    }, 

                    Package (0x06)
                    {
                        "PSTATE_SET", 
                        Zero, 
                        Package (0x02)
                        {
                            "PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x04)
                    {
                        "PSTATE_SET", 
                        One, 
                        Package (0x04)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_MDSS", 
                                    One
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_MDSS", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    Zero
                                }
                            }
                        }
                    }, 

                    Package (0x0F)
                    {
                        "PSTATE_SET", 
                        0x02, 
                        Package (0x04)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x18964020, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x11E1A300, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x13AB6680, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x11E1A300, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x11E1A300, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x11E1A300, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x10642AC0, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x08F0D180, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x04, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x0BEBC200, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x08F0D180, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x05, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x0A37CADB, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x047868C0, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x06, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x08F0D180, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x047868C0, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x07, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x05F5E100, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x047868C0, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x08, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x051BE56E, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x047868C0, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x09, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            0x06
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            0x06
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            0x06
                        }
                    }, 

                    Package (0x2C)
                    {
                        "PSTATE_SET", 
                        0x03, 
                        Package (0x03)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000025A01C500, 
                                    0x000000025A01C500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000002422A4100, 
                                    0x00000002422A4100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000022A52BD00, 
                                    0x000000022A52BD00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000002127B3900, 
                                    0x00000002127B3900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x04, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001FAA3B500, 
                                    0x00000001FAA3B500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x05, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001E2CC3100, 
                                    0x00000001E2CC3100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x06, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001CAF4AD00, 
                                    0x00000001CAF4AD00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x07, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001B31D2900, 
                                    0x00000001B31D2900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x08, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000019B45A500, 
                                    0x000000019B45A500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x09, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001836E2100, 
                                    0x00000001836E2100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0A, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000016B969D00, 
                                    0x000000016B969D00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0B, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000153BF1900, 
                                    0x0000000153BF1900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0C, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000013BE79500, 
                                    0x000000013BE79500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0D, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000124101100, 
                                    0x0000000124101100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0E, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000010C388D00, 
                                    0x000000010C388D00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0F, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xF4610900, 
                                    0xF4610900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x10, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xDC898500, 
                                    0xDC898500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x11, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xC4B20100, 
                                    0xC4B20100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x12, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xACDA7D00, 
                                    0xACDA7D00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x13, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x9502F900, 
                                    0x9502F900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x14, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x8F0D1800, 
                                    0x8F0D1800
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x15, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x89173700, 
                                    0x89173700
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x16, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x83215600, 
                                    0x83215600
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x17, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x7D2B7500, 
                                    0x7D2B7500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x18, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x77359400, 
                                    0x77359400
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x19, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x713FB300, 
                                    0x713FB300
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1A, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x6B49D200, 
                                    0x6B49D200
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1B, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x6553F100, 
                                    0x6553F100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1C, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x5F5E1000, 
                                    0x5F5E1000
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1D, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x59682F00, 
                                    0x59682F00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1E, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x53724E00, 
                                    0x53724E00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1F, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x4D7C6D00, 
                                    0x4D7C6D00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x20, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x47868C00, 
                                    0x47868C00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x21, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x4190AB00, 
                                    0x4190AB00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x22, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x3B9ACA00, 
                                    0x3B9ACA00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x23, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x35A4E900, 
                                    0x35A4E900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x24, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x2FAF0800, 
                                    0x2FAF0800
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x25, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x29B92700, 
                                    0x29B92700
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x26, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x23C34600, 
                                    0x23C34600
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x27, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x1DCD6500, 
                                    0x1DCD6500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x28, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x17D78400, 
                                    0x17D78400
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x29, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    Zero, 
                                    Zero
                                }
                            }
                        }
                    }
                }
            }
        })
        Return (GPCC) /* \_SB_.PEP0.G2MD.GPCC */
    }

    Method (G3MD, 0, NotSerialized)
    {
        Name (GPCC, Package (0x01)
        {
            Package (0x03)
            {
                "DEVICE", 
                "\\_SB.GPU0", 
                Package (0x0C)
                {
                    "COMPONENT", 
                    0x03, 
                    Package (0x02)
                    {
                        "FSTATE", 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "FSTATE", 
                        One, 
                        Package (0x0D)
                        {
                            "ENTER", 
                            Package (0x01)
                            {
                                "PSTATE_SAVE"
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x02, 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x03, 
                                    0x29
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_vsync_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_misc_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_axi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_rot_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x0C)
                        {
                            "EXIT", 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_misc_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_rot_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_vsync_clk", 
                                    One
                                }
                            }, 

                            Package (0x01)
                            {
                                "PSTATE_RESTORE"
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x02, 
                                    0x03
                                }
                            }
                        }
                    }, 

                    Package (0x04)
                    {
                        "FSTATE", 
                        0x02, 
                        Package (0x0F)
                        {
                            "ENTER", 
                            Package (0x01)
                            {
                                "PSTATE_SAVE"
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x02, 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x03, 
                                    0x29
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_vsync_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_misc_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_axi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_rot_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_MDSS", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x0E)
                        {
                            "EXIT", 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_MDSS", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_misc_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_rot_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_vsync_clk", 
                                    One
                                }
                            }, 

                            Package (0x01)
                            {
                                "PSTATE_RESTORE"
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x02, 
                                    0x03
                                }
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "INIT_FSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "PRELOAD_FSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "ABANDON_FSTATE", 
                        0x02
                    }, 

                    Package (0x06)
                    {
                        "PSTATE_SET", 
                        Zero, 
                        Package (0x02)
                        {
                            "PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x04)
                    {
                        "PSTATE_SET", 
                        One, 
                        Package (0x04)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_MDSS", 
                                    One
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_MDSS", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    Zero
                                }
                            }
                        }
                    }, 

                    Package (0x0A)
                    {
                        "PSTATE_SET", 
                        0x02, 
                        Package (0x04)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_rot_clk", 
                                    0x03, 
                                    0x18964020, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x11E1A300, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_rot_clk", 
                                    0x03, 
                                    0x13AB6680, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x11E1A300, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_rot_clk", 
                                    0x03, 
                                    0x10642AC0, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x08F0D180, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_rot_clk", 
                                    0x03, 
                                    0x0A37CADB, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x047868C0, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x04, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_rot_clk", 
                                    0x03, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            0x03
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            0x03
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            0x03
                        }
                    }, 

                    Package (0x2C)
                    {
                        "PSTATE_SET", 
                        0x03, 
                        Package (0x03)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000025A01C500, 
                                    0x000000025A01C500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000002422A4100, 
                                    0x00000002422A4100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000022A52BD00, 
                                    0x000000022A52BD00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000002127B3900, 
                                    0x00000002127B3900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x04, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001FAA3B500, 
                                    0x00000001FAA3B500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x05, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001E2CC3100, 
                                    0x00000001E2CC3100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x06, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001CAF4AD00, 
                                    0x00000001CAF4AD00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x07, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001B31D2900, 
                                    0x00000001B31D2900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x08, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000019B45A500, 
                                    0x000000019B45A500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x09, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001836E2100, 
                                    0x00000001836E2100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0A, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000016B969D00, 
                                    0x000000016B969D00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0B, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000153BF1900, 
                                    0x0000000153BF1900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0C, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000013BE79500, 
                                    0x000000013BE79500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0D, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000124101100, 
                                    0x0000000124101100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0E, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000010C388D00, 
                                    0x000000010C388D00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0F, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xF4610900, 
                                    0xF4610900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x10, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xDC898500, 
                                    0xDC898500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x11, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xC4B20100, 
                                    0xC4B20100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x12, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xACDA7D00, 
                                    0xACDA7D00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x13, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x9502F900, 
                                    0x9502F900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x14, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x8F0D1800, 
                                    0x8F0D1800
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x15, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x89173700, 
                                    0x89173700
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x16, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x83215600, 
                                    0x83215600
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x17, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x7D2B7500, 
                                    0x7D2B7500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x18, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x77359400, 
                                    0x77359400
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x19, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x713FB300, 
                                    0x713FB300
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1A, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x6B49D200, 
                                    0x6B49D200
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1B, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x6553F100, 
                                    0x6553F100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1C, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x5F5E1000, 
                                    0x5F5E1000
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1D, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x59682F00, 
                                    0x59682F00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1E, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x53724E00, 
                                    0x53724E00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1F, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x4D7C6D00, 
                                    0x4D7C6D00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x20, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x47868C00, 
                                    0x47868C00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x21, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x4190AB00, 
                                    0x4190AB00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x22, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x3B9ACA00, 
                                    0x3B9ACA00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x23, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x35A4E900, 
                                    0x35A4E900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x24, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x2FAF0800, 
                                    0x2FAF0800
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x25, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x29B92700, 
                                    0x29B92700
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x26, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x23C34600, 
                                    0x23C34600
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x27, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x1DCD6500, 
                                    0x1DCD6500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x28, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x17D78400, 
                                    0x17D78400
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x29, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    Zero, 
                                    Zero
                                }
                            }
                        }
                    }
                }
            }
        })
        Return (GPCC) /* \_SB_.PEP0.G3MD.GPCC */
    }

    Method (G4MD, 0, NotSerialized)
    {
        Name (GPCC, Package (0x01)
        {
            Package (0x03)
            {
                "DEVICE", 
                "\\_SB.GPU0", 
                Package (0x0C)
                {
                    "COMPONENT", 
                    0x04, 
                    Package (0x02)
                    {
                        "FSTATE", 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "FSTATE", 
                        One, 
                        Package (0x0C)
                        {
                            "ENTER", 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_core_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_maxi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_axi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_vmem_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_vmem_maxi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x0C)
                        {
                            "EXIT", 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_vmem_maxi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_vmem_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_maxi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_core_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore0_clk", 
                                    One
                                }
                            }
                        }
                    }, 

                    Package (0x04)
                    {
                        "FSTATE", 
                        0x02, 
                        Package (0x1B)
                        {
                            "ENTER", 
                            Package (0x01)
                            {
                                "PSTATE_SAVE"
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x02, 
                                    0x05
                                }
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x03, 
                                    0x3C
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_core_clk", 
                                    0x09, 
                                    0x13
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_core_clk", 
                                    0x09, 
                                    0x15
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x09, 
                                    0x13
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x09, 
                                    0x15
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x09, 
                                    0x13
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x09, 
                                    0x15
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_core_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_maxi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_axi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_vmem_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_vmem_maxi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE0", 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE0", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE1", 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE1", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_TOP", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x1A)
                        {
                            "EXIT", 
                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_TOP", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE0", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE0", 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE1", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE1", 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_vmem_maxi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_vmem_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_maxi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_core_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore0_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_core_clk", 
                                    0x09, 
                                    0x12
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_core_clk", 
                                    0x09, 
                                    0x14
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x09, 
                                    0x12
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x09, 
                                    0x14
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x09, 
                                    0x12
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x09, 
                                    0x14
                                }
                            }, 

                            Package (0x01)
                            {
                                "PSTATE_RESTORE"
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "INIT_FSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "PRELOAD_FSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "ABANDON_FSTATE", 
                        0x02
                    }, 

                    Package (0x07)
                    {
                        "PSTATE_SET", 
                        Zero, 
                        Package (0x02)
                        {
                            "PSTATE", 
                            Zero
                        }, 

                        Package (0x0F)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x0A
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x0A
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_core_clk", 
                                    0x0A
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_maxi_clk", 
                                    0x0A
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_axi_clk", 
                                    0x0A
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_ahb_clk", 
                                    0x0A
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_core_clk", 
                                    0x0B
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_axi_clk", 
                                    0x0B
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_ahb_clk", 
                                    0x0B
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_maxi_clk", 
                                    0x0B
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x0B
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x0B
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            One
                        }
                    }, 

                    Package (0x07)
                    {
                        "PSTATE_SET", 
                        One, 
                        Package (0x09)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_TOP", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE0", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE0", 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE1", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE1", 
                                    0x03
                                }
                            }
                        }, 

                        Package (0x09)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_TOP", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE0", 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE0", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE1", 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE1", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            One
                        }
                    }, 

                    Package (0x0B)
                    {
                        "PSTATE_SET", 
                        0x02, 
                        Package (0x07)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_core_clk", 
                                    0x03, 
                                    0x1FC4EF40, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x03, 
                                    0x1FC4EF40, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x03, 
                                    0x1FC4EF40, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_vmem_maxi_clk", 
                                    0x03, 
                                    0x18331180, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_VENUS_CFG", 
                                    0x11E1A300, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x07)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_core_clk", 
                                    0x03, 
                                    0x1A76E700, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x03, 
                                    0x1A76E700, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x03, 
                                    0x1A76E700, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_vmem_maxi_clk", 
                                    0x03, 
                                    0x134096C0, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_VENUS_CFG", 
                                    0x11E1A300, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x07)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_core_clk", 
                                    0x03, 
                                    0x1528DEC0, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x03, 
                                    0x1528DEC0, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x03, 
                                    0x1528DEC0, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_vmem_maxi_clk", 
                                    0x03, 
                                    0x0A3140C0, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_VENUS_CFG", 
                                    0x08F0D180, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x07)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_core_clk", 
                                    0x03, 
                                    0x10089D40, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x03, 
                                    0x10089D40, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x03, 
                                    0x10089D40, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_vmem_maxi_clk", 
                                    0x03, 
                                    0x0A3140C0, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_VENUS_CFG", 
                                    0x08F0D180, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x07)
                        {
                            "PSTATE", 
                            0x04, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_core_clk", 
                                    0x03, 
                                    0x0BEBC200, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x03, 
                                    0x0BEBC200, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x03, 
                                    0x0BEBC200, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_vmem_maxi_clk", 
                                    0x03, 
                                    0x047868C0, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_VENUS_CFG", 
                                    0x047868C0, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x07)
                        {
                            "PSTATE", 
                            0x05, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_core_clk", 
                                    0x03, 
                                    Zero, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x03, 
                                    Zero, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x03, 
                                    Zero, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_vmem_maxi_clk", 
                                    0x03, 
                                    Zero, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_VENUS_CFG", 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            0x04
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            0x04
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            0x04
                        }
                    }, 

                    Package (0x42)
                    {
                        "PSTATE_SET", 
                        0x03, 
                        Package (0x03)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000002CB417800, 
                                    0x00000002CB417800
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000002BF55B600, 
                                    0x00000002BF55B600
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000002B369F400, 
                                    0x00000002B369F400
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000002A77E3200, 
                                    0x00000002A77E3200
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x04, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000029B927000, 
                                    0x000000029B927000
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x05, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000028FA6AE00, 
                                    0x000000028FA6AE00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x06, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000283BAEC00, 
                                    0x0000000283BAEC00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x07, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000277CF2A00, 
                                    0x0000000277CF2A00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x08, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000026BE36800, 
                                    0x000000026BE36800
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x09, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000025FF7A600, 
                                    0x000000025FF7A600
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0A, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000002540BE400, 
                                    0x00000002540BE400
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0B, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000248202200, 
                                    0x0000000248202200
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0C, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000023C346000, 
                                    0x000000023C346000
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0D, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000230489E00, 
                                    0x0000000230489E00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0E, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000002245CDC00, 
                                    0x00000002245CDC00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0F, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000218711A00, 
                                    0x0000000218711A00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x10, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000020C855800, 
                                    0x000000020C855800
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x11, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000200999600, 
                                    0x0000000200999600
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x12, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001F4ADD400, 
                                    0x00000001F4ADD400
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x13, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001E8C21200, 
                                    0x00000001E8C21200
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x14, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001DCD65000, 
                                    0x00000001DCD65000
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x15, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001D0EA8E00, 
                                    0x00000001D0EA8E00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x16, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001C4FECC00, 
                                    0x00000001C4FECC00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x17, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001B9130A00, 
                                    0x00000001B9130A00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x18, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001AD274800, 
                                    0x00000001AD274800
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x19, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001A13B8600, 
                                    0x00000001A13B8600
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1A, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001954FC400, 
                                    0x00000001954FC400
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1B, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000189640200, 
                                    0x0000000189640200
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1C, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000017D784000, 
                                    0x000000017D784000
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1D, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001718C7E00, 
                                    0x00000001718C7E00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1E, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000165A0BC00, 
                                    0x0000000165A0BC00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1F, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000159B4FA00, 
                                    0x0000000159B4FA00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x20, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000014DC93800, 
                                    0x000000014DC93800
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x21, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000141DD7600, 
                                    0x0000000141DD7600
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x22, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000135F1B400, 
                                    0x0000000135F1B400
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x23, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000012A05F200, 
                                    0x000000012A05F200
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x24, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000011E1A3000, 
                                    0x000000011E1A3000
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x25, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001122E6E00, 
                                    0x00000001122E6E00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x26, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000010642AC00, 
                                    0x000000010642AC00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x27, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xFA56EA00, 
                                    0xFA56EA00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x28, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xEE6B2800, 
                                    0xEE6B2800
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x29, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xE27F6600, 
                                    0xE27F6600
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x2A, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xD693A400, 
                                    0xD693A400
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x2B, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xCAA7E200, 
                                    0xCAA7E200
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x2C, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xBEBC2000, 
                                    0xBEBC2000
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x2D, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xB2D05E00, 
                                    0xB2D05E00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x2E, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xA6E49C00, 
                                    0xA6E49C00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x2F, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x9AF8DA00, 
                                    0x9AF8DA00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x30, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x8F0D1800, 
                                    0x8F0D1800
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x31, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x83215600, 
                                    0x83215600
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x32, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x77359400, 
                                    0x77359400
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x33, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x6B49D200, 
                                    0x6B49D200
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x34, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x5F5E1000, 
                                    0x5F5E1000
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x35, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x53724E00, 
                                    0x53724E00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x36, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x47868C00, 
                                    0x47868C00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x37, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x3B9ACA00, 
                                    0x3B9ACA00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x38, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x2FAF0800, 
                                    0x2FAF0800
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x39, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x23C34600, 
                                    0x23C34600
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x3A, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x17D78400, 
                                    0x17D78400
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x3B, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0BEBC200, 
                                    0x0BEBC200
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x3C, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            0x3A
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            0x3A
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            0x3A
                        }
                    }
                }
            }
        })
        Return (GPCC) /* \_SB_.PEP0.G4MD.GPCC */
    }

    Method (G5MD, 0, NotSerialized)
    {
        Name (GPCC, Package (0x01)
        {
            Package (0x03)
            {
                "DEVICE", 
                "\\_SB.GPU0", 
                Package (0x0A)
                {
                    "COMPONENT", 
                    0x05, 
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
                        "INIT_FSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "PRELOAD_FSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "ABANDON_FSTATE", 
                        Zero
                    }, 

                    Package (0x07)
                    {
                        "PSTATE_SET", 
                        Zero, 
                        Package (0x02)
                        {
                            "PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PSTATE", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x07)
                    {
                        "PSTATE_SET", 
                        One, 
                        Package (0x02)
                        {
                            "PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PSTATE", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x06)
                    {
                        "PSTATE_SET", 
                        0x02, 
                        Package (0x02)
                        {
                            "PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            Zero
                        }
                    }
                }
            }
        })
        Return (GPCC) /* \_SB_.PEP0.G5MD.GPCC */
    }

    Method (G6MD, 0, NotSerialized)
    {
        Name (GPCC, Package (0x01)
        {
            Package (0x03)
            {
                "DEVICE", 
                "\\_SB.GPU0", 
                Package (0x0C)
                {
                    "COMPONENT", 
                    0x06, 
                    Package (0x02)
                    {
                        "FSTATE", 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "FSTATE", 
                        One, 
                        Package (0x0C)
                        {
                            "ENTER", 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_core_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_maxi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_axi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_vmem_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_vmem_maxi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x0C)
                        {
                            "EXIT", 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_vmem_maxi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_vmem_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_maxi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_core_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore0_clk", 
                                    One
                                }
                            }
                        }
                    }, 

                    Package (0x04)
                    {
                        "FSTATE", 
                        0x02, 
                        Package (0x1B)
                        {
                            "ENTER", 
                            Package (0x01)
                            {
                                "PSTATE_SAVE"
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x02, 
                                    0x05
                                }
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x03, 
                                    0x3C
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_core_clk", 
                                    0x09, 
                                    0x13
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_core_clk", 
                                    0x09, 
                                    0x15
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x09, 
                                    0x13
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x09, 
                                    0x15
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x09, 
                                    0x13
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x09, 
                                    0x15
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_core_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_maxi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_axi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_vmem_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_vmem_maxi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE0", 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE0", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE1", 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE1", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_TOP", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x1C)
                        {
                            "EXIT", 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_TOP", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE0", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE0", 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE1", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE1", 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
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
                                    "/clk/mmnoc_axi", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_vmem_maxi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_vmem_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_maxi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_core_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore0_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_core_clk", 
                                    0x09, 
                                    0x12
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_core_clk", 
                                    0x09, 
                                    0x14
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x09, 
                                    0x12
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x09, 
                                    0x14
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x09, 
                                    0x12
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x03)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x09, 
                                    0x14
                                }
                            }, 

                            Package (0x01)
                            {
                                "PSTATE_RESTORE"
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "INIT_FSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "PRELOAD_FSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "ABANDON_FSTATE", 
                        0x02
                    }, 

                    Package (0x07)
                    {
                        "PSTATE_SET", 
                        Zero, 
                        Package (0x02)
                        {
                            "PSTATE", 
                            Zero
                        }, 

                        Package (0x0F)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x0A
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x0A
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_core_clk", 
                                    0x0A
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_maxi_clk", 
                                    0x0A
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_axi_clk", 
                                    0x0A
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_ahb_clk", 
                                    0x0A
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_core_clk", 
                                    0x0B
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_axi_clk", 
                                    0x0B
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_ahb_clk", 
                                    0x0B
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_maxi_clk", 
                                    0x0B
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x0B
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x0B
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            One
                        }
                    }, 

                    Package (0x07)
                    {
                        "PSTATE_SET", 
                        One, 
                        Package (0x09)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_TOP", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE0", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE0", 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE1", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE1", 
                                    0x03
                                }
                            }
                        }, 

                        Package (0x09)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_TOP", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE0", 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE0", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE1", 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VIDEO_SUBCORE1", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            One
                        }
                    }, 

                    Package (0x0B)
                    {
                        "PSTATE_SET", 
                        0x02, 
                        Package (0x07)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_core_clk", 
                                    0x03, 
                                    0x1FC4EF40, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x03, 
                                    0x1FC4EF40, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x03, 
                                    0x1FC4EF40, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_vmem_maxi_clk", 
                                    0x03, 
                                    0x18331180, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_VENUS_CFG", 
                                    0x11E1A300, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x07)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_core_clk", 
                                    0x03, 
                                    0x1A76E700, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x03, 
                                    0x1A76E700, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x03, 
                                    0x1A76E700, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_vmem_maxi_clk", 
                                    0x03, 
                                    0x134096C0, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_VENUS_CFG", 
                                    0x11E1A300, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x07)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_core_clk", 
                                    0x03, 
                                    0x1528DEC0, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x03, 
                                    0x1528DEC0, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x03, 
                                    0x1528DEC0, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_vmem_maxi_clk", 
                                    0x03, 
                                    0x0A3140C0, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_VENUS_CFG", 
                                    0x08F0D180, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x07)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_core_clk", 
                                    0x03, 
                                    0x10089D40, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x03, 
                                    0x10089D40, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x03, 
                                    0x10089D40, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_vmem_maxi_clk", 
                                    0x03, 
                                    0x0A3140C0, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_VENUS_CFG", 
                                    0x08F0D180, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x07)
                        {
                            "PSTATE", 
                            0x04, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_core_clk", 
                                    0x03, 
                                    0x0BEBC200, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x03, 
                                    0x0BEBC200, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x03, 
                                    0x0BEBC200, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_vmem_maxi_clk", 
                                    0x03, 
                                    0x047868C0, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_VENUS_CFG", 
                                    0x047868C0, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x07)
                        {
                            "PSTATE", 
                            0x05, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_core_clk", 
                                    0x03, 
                                    Zero, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore0_clk", 
                                    0x03, 
                                    Zero, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_video_subcore1_clk", 
                                    0x03, 
                                    Zero, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_vmem_maxi_clk", 
                                    0x03, 
                                    Zero, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_VENUS_CFG", 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            0x04
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            0x04
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            0x04
                        }
                    }, 

                    Package (0x42)
                    {
                        "PSTATE_SET", 
                        0x03, 
                        Package (0x03)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000002CB417800, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000002BF55B600, 
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
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000002B369F400, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000002A77E3200, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x04, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000029B927000, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x05, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000028FA6AE00, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x06, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000283BAEC00, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x07, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000277CF2A00, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x08, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000026BE36800, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x09, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000025FF7A600, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0A, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000002540BE400, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0B, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000248202200, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0C, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000023C346000, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0D, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000230489E00, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0E, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000002245CDC00, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0F, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000218711A00, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x10, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000020C855800, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x11, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000200999600, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x12, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001F4ADD400, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x13, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001E8C21200, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x14, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001DCD65000, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x15, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001D0EA8E00, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x16, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001C4FECC00, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x17, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001B9130A00, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x18, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001AD274800, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x19, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001A13B8600, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1A, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001954FC400, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1B, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000189640200, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1C, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000017D784000, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1D, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001718C7E00, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1E, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000165A0BC00, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1F, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000159B4FA00, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x20, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000014DC93800, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x21, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000141DD7600, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x22, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000135F1B400, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x23, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000012A05F200, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x24, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000011E1A3000, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x25, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001122E6E00, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x26, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000010642AC00, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x27, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xFA56EA00, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x28, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xEE6B2800, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x29, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xE27F6600, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x2A, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xD693A400, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x2B, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xCAA7E200, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x2C, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xBEBC2000, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x2D, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xB2D05E00, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x2E, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xA6E49C00, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x2F, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x9AF8DA00, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x30, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x8F0D1800, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x31, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x83215600, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x32, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x77359400, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x33, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x6B49D200, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x34, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x5F5E1000, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x35, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x53724E00, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x36, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x47868C00, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x37, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x3B9ACA00, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x38, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x2FAF0800, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x39, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x23C34600, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x3A, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x17D78400, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x3B, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0BEBC200, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x3C, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VIDEO", 
                                    "ICBID_SLAVE_EBI1", 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            0x3A
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            0x3A
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            0x3A
                        }
                    }
                }
            }
        })
        Return (GPCC) /* \_SB_.PEP0.G6MD.GPCC */
    }

    Method (G7MD, 0, NotSerialized)
    {
        Name (GPCC, Package (0x01)
        {
            Package (0x03)
            {
                "DEVICE", 
                "\\_SB.GPU0", 
                Package (0x0C)
                {
                    "COMPONENT", 
                    0x07, 
                    Package (0x02)
                    {
                        "FSTATE", 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "FSTATE", 
                        One, 
                        Package (0x07)
                        {
                            "ENTER", 
                            Package (0x01)
                            {
                                "PSTATE_SAVE"
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x03, 
                                    0x09
                                }
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x04, 
                                    0x29
                                }
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x02, 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_MDSS", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "EXIT", 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_MDSS", 
                                    One
                                }
                            }, 

                            Package (0x01)
                            {
                                "PSTATE_RESTORE"
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "INIT_FSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "PRELOAD_FSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "ABANDON_FSTATE", 
                        Zero
                    }, 

                    Package (0x06)
                    {
                        "PSTATE_SET", 
                        Zero, 
                        Package (0x02)
                        {
                            "PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x04)
                    {
                        "PSTATE_SET", 
                        One, 
                        Package (0x04)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_MDSS", 
                                    One
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_MDSS", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    Zero
                                }
                            }
                        }
                    }, 

                    Package (0x0A)
                    {
                        "PSTATE_SET", 
                        0x02, 
                        Package (0x15)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_misc_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_vsync_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk0_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc0_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_intf_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_intf_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_extpclk_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_dp_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_clk", 
                                    One
                                }
                            }
                        }, 

                        Package (0x15)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_misc_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_vsync_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk0_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc0_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_intf_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_intf_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_extpclk_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_dp_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_clk", 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x15)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_misc_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_vsync_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk0_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc0_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_intf_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk1_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc1_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_intf_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_extpclk_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_dp_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_clk", 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x15)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_misc_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_vsync_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk0_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc0_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_intf_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_intf_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_extpclk_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_dp_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_clk", 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x15)
                        {
                            "PSTATE", 
                            0x04, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_misc_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_axi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_vsync_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk0_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc0_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_intf_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk1_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc1_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_intf_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_extpclk_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_dp_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x0F)
                    {
                        "PSTATE_SET", 
                        0x03, 
                        Package (0x04)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x18964020, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x11E1A300, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x13AB6680, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x11E1A300, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x11E1A300, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x11E1A300, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x10642AC0, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x08F0D180, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x04, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x0BEBC200, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x08F0D180, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x05, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x0A37CADB, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x047868C0, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x06, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x08F0D180, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x047868C0, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x07, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x05F5E100, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x047868C0, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x08, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x051BE56E, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x047868C0, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x09, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            0x03
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            0x03
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            0x03
                        }
                    }, 

                    Package (0x2F)
                    {
                        "PSTATE_SET", 
                        0x04, 
                        Package (0x03)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000025A01C500, 
                                    0x000000025A01C500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000002422A4100, 
                                    0x00000002422A4100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000022A52BD00, 
                                    0x000000022A52BD00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000002127B3900, 
                                    0x00000002127B3900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x04, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001FAA3B500, 
                                    0x00000001FAA3B500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x05, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001E2CC3100, 
                                    0x00000001E2CC3100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x06, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001CAF4AD00, 
                                    0x00000001CAF4AD00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x07, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001B31D2900, 
                                    0x00000001B31D2900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x08, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000019B45A500, 
                                    0x000000019B45A500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x09, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001836E2100, 
                                    0x00000001836E2100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0A, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000016B969D00, 
                                    0x000000016B969D00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0B, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000153BF1900, 
                                    0x0000000153BF1900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0C, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000013BE79500, 
                                    0x000000013BE79500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0D, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000124101100, 
                                    0x0000000124101100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0E, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000010C388D00, 
                                    0x000000010C388D00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0F, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xF4610900, 
                                    0xF4610900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x10, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xDC898500, 
                                    0xDC898500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x11, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xC4B20100, 
                                    0xC4B20100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x12, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xACDA7D00, 
                                    0xACDA7D00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x13, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x9502F900, 
                                    0x9502F900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x14, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x8F0D1800, 
                                    0x8F0D1800
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x15, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x89173700, 
                                    0x89173700
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x16, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x83215600, 
                                    0x83215600
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x17, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x7D2B7500, 
                                    0x7D2B7500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x18, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x77359400, 
                                    0x77359400
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x19, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x713FB300, 
                                    0x713FB300
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1A, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x6B49D200, 
                                    0x6B49D200
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1B, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x6553F100, 
                                    0x6553F100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1C, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x5F5E1000, 
                                    0x5F5E1000
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1D, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x59682F00, 
                                    0x59682F00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1E, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x53724E00, 
                                    0x53724E00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1F, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x4D7C6D00, 
                                    0x4D7C6D00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x20, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x47868C00, 
                                    0x47868C00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x21, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x4190AB00, 
                                    0x4190AB00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x22, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x3B9ACA00, 
                                    0x3B9ACA00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x23, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x35A4E900, 
                                    0x35A4E900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x24, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x2FAF0800, 
                                    0x2FAF0800
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x25, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x29B92700, 
                                    0x29B92700
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x26, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x23C34600, 
                                    0x23C34600
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x27, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x1DCD6500, 
                                    0x1DCD6500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x28, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x17D78400, 
                                    0x17D78400
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x29, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            0x21
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            0x21
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            0x21
                        }
                    }
                }
            }
        })
        Return (GPCC) /* \_SB_.PEP0.G7MD.GPCC */
    }

    Method (G8MD, 0, NotSerialized)
    {
        Name (GPCC, Package (0x01)
        {
            Package (0x03)
            {
                "DEVICE", 
                "\\_SB.GPU0", 
                Package (0x0B)
                {
                    "COMPONENT", 
                    0x08, 
                    Package (0x02)
                    {
                        "FSTATE", 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "FSTATE", 
                        One, 
                        Package (0x21)
                        {
                            "ENTER", 
                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x1F, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x20, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x21, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x22, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_misc_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_axi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_vsync_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk0_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc0_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_intf_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk1_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc1_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_intf_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_extpclk_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_dp_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x01)
                            {
                                "PSTATE_SAVE"
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x02, 
                                    0x09
                                }
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x03, 
                                    0x29
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_MDSS", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO12_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO1_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO2_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO1_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x1E)
                        {
                            "EXIT", 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_MDSS", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_bimc_smmu_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_misc_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_axi_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_vsync_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk0_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc0_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte0_intf_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_pclk1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_esc1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_byte1_intf_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_extpclk_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_dp_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_hdmi_clk", 
                                    One
                                }
                            }, 

                            Package (0x01)
                            {
                                "PSTATE_RESTORE"
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x1F, 
                                    One, 
                                    One, 
                                    One, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x20, 
                                    One, 
                                    One, 
                                    One, 
                                    0x03, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x21, 
                                    One, 
                                    One, 
                                    One, 
                                    0x03, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x22, 
                                    One, 
                                    One, 
                                    Zero, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO12_A", 
                                    One, 
                                    0x001B7740, 
                                    0x332C, 
                                    One, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO1_A", 
                                    One, 
                                    0x000D6D80, 
                                    0x85FC, 
                                    One, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO2_A", 
                                    One, 
                                    0x00124F80, 
                                    0x3778, 
                                    One, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "INIT_FSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "PRELOAD_FSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "ABANDON_FSTATE", 
                        Zero
                    }, 

                    Package (0x06)
                    {
                        "PSTATE_SET", 
                        Zero, 
                        Package (0x02)
                        {
                            "PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x04)
                    {
                        "PSTATE_SET", 
                        One, 
                        Package (0x04)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_MDSS", 
                                    One
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_MDSS", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    Zero
                                }
                            }
                        }
                    }, 

                    Package (0x0F)
                    {
                        "PSTATE_SET", 
                        0x02, 
                        Package (0x04)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x18964020, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x11E1A300, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x13AB6680, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x11E1A300, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x11E1A300, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x11E1A300, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x10642AC0, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x08F0D180, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x04, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x0BEBC200, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x08F0D180, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x05, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x0A37CADB, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x047868C0, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x06, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x08F0D180, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x047868C0, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x07, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x05F5E100, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x047868C0, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x08, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    0x051BE56E, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    0x047868C0, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x09, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x03, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_DISPLAY_CFG", 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            0x03
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            0x03
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            0x03
                        }
                    }, 

                    Package (0x2F)
                    {
                        "PSTATE_SET", 
                        0x03, 
                        Package (0x03)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000025A01C500, 
                                    0x000000025A01C500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000002422A4100, 
                                    0x00000002422A4100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000022A52BD00, 
                                    0x000000022A52BD00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000002127B3900, 
                                    0x00000002127B3900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x04, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001FAA3B500, 
                                    0x00000001FAA3B500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x05, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001E2CC3100, 
                                    0x00000001E2CC3100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x06, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001CAF4AD00, 
                                    0x00000001CAF4AD00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x07, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001B31D2900, 
                                    0x00000001B31D2900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x08, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000019B45A500, 
                                    0x000000019B45A500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x09, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x00000001836E2100, 
                                    0x00000001836E2100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0A, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000016B969D00, 
                                    0x000000016B969D00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0B, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000153BF1900, 
                                    0x0000000153BF1900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0C, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000013BE79500, 
                                    0x000000013BE79500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0D, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0000000124101100, 
                                    0x0000000124101100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0E, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x000000010C388D00, 
                                    0x000000010C388D00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0F, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xF4610900, 
                                    0xF4610900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x10, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xDC898500, 
                                    0xDC898500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x11, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xC4B20100, 
                                    0xC4B20100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x12, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0xACDA7D00, 
                                    0xACDA7D00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x13, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x9502F900, 
                                    0x9502F900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x14, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x8F0D1800, 
                                    0x8F0D1800
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x15, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x89173700, 
                                    0x89173700
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x16, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x83215600, 
                                    0x83215600
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x17, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x7D2B7500, 
                                    0x7D2B7500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x18, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x77359400, 
                                    0x77359400
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x19, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x713FB300, 
                                    0x713FB300
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1A, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x6B49D200, 
                                    0x6B49D200
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1B, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x6553F100, 
                                    0x6553F100
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1C, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x5F5E1000, 
                                    0x5F5E1000
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1D, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x59682F00, 
                                    0x59682F00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1E, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x53724E00, 
                                    0x53724E00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x1F, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x4D7C6D00, 
                                    0x4D7C6D00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x20, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x47868C00, 
                                    0x47868C00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x21, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x4190AB00, 
                                    0x4190AB00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x22, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x3B9ACA00, 
                                    0x3B9ACA00
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x23, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x35A4E900, 
                                    0x35A4E900
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x24, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x2FAF0800, 
                                    0x2FAF0800
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x25, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x29B92700, 
                                    0x29B92700
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x26, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x23C34600, 
                                    0x23C34600
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x27, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x1DCD6500, 
                                    0x1DCD6500
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x28, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x17D78400, 
                                    0x17D78400
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x29, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_MDP", 
                                    "ICBID_SLAVE_EBI1", 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PRELOAD_PSTATE", 
                            0x21
                        }, 

                        Package (0x02)
                        {
                            "PREPARE_PSTATE", 
                            0x21
                        }, 

                        Package (0x02)
                        {
                            "ABANDON_PSTATE", 
                            0x21
                        }
                    }
                }
            }
        })
        Return (GPCC) /* \_SB_.PEP0.G8MD.GPCC */
    }

    Method (G9MD, 0, NotSerialized)
    {
        Name (GPCC, Package (0x01)
        {
            Package (0x03)
            {
                "DEVICE", 
                "\\_SB.GPU0", 
                Package (0x07)
                {
                    "COMPONENT", 
                    0x09, 
                    Package (0x02)
                    {
                        "FSTATE", 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "FSTATE", 
                        One, 
                        Package (0x08)
                        {
                            "ENTER", 
                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0E)
                                {
                                    "PPP_RESOURCE_ID_SMPS4_A", 
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
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_misc_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_MDSS", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x08)
                        {
                            "EXIT", 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_axi", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_MDSS", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_misc_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "mmss_mdss_mdp_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0E)
                                {
                                    "PPP_RESOURCE_ID_SMPS4_A", 
                                    0x02, 
                                    0x001B7740, 
                                    0x32C8, 
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
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "INIT_FSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "PRELOAD_FSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "ABANDON_FSTATE", 
                        Zero
                    }
                }
            }
        })
        Return (GPCC) /* \_SB_.PEP0.G9MD.GPCC */
    }

    Method (GKMD, 0, NotSerialized)
    {
        Name (GPCC, Package (0x01)
        {
            Package (0x03)
            {
                "DEVICE", 
                "\\_SB.GPU0", 
                Package (0x06)
                {
                    "COMPONENT", 
                    0x0A, 
                    Package (0x02)
                    {
                        "FSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "INIT_FSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "PRELOAD_FSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "ABANDON_FSTATE", 
                        Zero
                    }
                }
            }
        })
        Return (GPCC) /* \_SB_.PEP0.GKMD.GPCC */
    }
}
