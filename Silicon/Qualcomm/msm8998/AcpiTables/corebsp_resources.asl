//===========================================================================
//                           <corebsp_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by core BSP drivers.
//
//===========================================================================

Scope (\_SB.PEP0)
{
    Method (BPMD, 0, NotSerialized)
    {
        Return (BPCC) /* \_SB_.PEP0.BPCC */
    }

    Method (LPMD, 0, NotSerialized)
    {
        Return (LPCC) /* \_SB_.PEP0.LPCC */
    }

    Name (BPCC, Package (0x06)
    {
        Package (0x05)
        {
            "DEVICE", 
            "\\_SB.UFS0", 
            Package (0x07)
            {
                "COMPONENT", 
                Zero, 
                Package (0x05)
                {
                    "FSTATE", 
                    Zero, 
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
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            One, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            0x02, 
                            Zero
                        }
                    }
                }, 

                Package (0x05)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            0x02, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            One, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            Zero, 
                            One
                        }
                    }
                }, 

                Package (0x04)
                {
                    "PSTATE_SET", 
                    Zero, 
                    Package (0x03)
                    {
                        "PSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "VDD_UFS", 
                                One
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "VDD_UFS", 
                                0x02
                            }
                        }
                    }
                }, 

                Package (0x04)
                {
                    "PSTATE_SET", 
                    One, 
                    Package (0x0C)
                    {
                        "PSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_ufs_axi_clk", 
                                0x08, 
                                0x0BEBC200, 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_ufs_unipro_core_clk", 
                                0x08, 
                                0x08F0D180, 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_ufs_ice_core_clk", 
                                0x08, 
                                0x11E1A300, 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_ufs_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre1_ufs_axi_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_ufs_phy_aux_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_ufs_tx_symbol_0_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_ufs_rx_symbol_0_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_ufs_rx_symbol_1_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_ufs_clkref_clk", 
                                One
                            }
                        }
                    }, 

                    Package (0x0C)
                    {
                        "PSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_ufs_ahb_clk", 
                                0x02, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_aggre1_ufs_axi_clk", 
                                0x02, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_ufs_phy_aux_clk", 
                                0x02, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_ufs_tx_symbol_0_clk", 
                                0x02, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_ufs_rx_symbol_0_clk", 
                                0x02, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_ufs_rx_symbol_1_clk", 
                                0x02, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_ufs_ice_core_clk", 
                                0x02, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_ufs_unipro_core_clk", 
                                0x02, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_ufs_axi_clk", 
                                0x02, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_ufs_clkref_clk", 
                                0x02, 
                                Zero, 
                                0x02
                            }
                        }
                    }
                }, 

                Package (0x04)
                {
                    "PSTATE_SET", 
                    0x02, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_UFS", 
                                "ICBID_SLAVE_EBI1", 
                                0x35A4E900, 
                                0x35A4E900
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_UFS_CFG", 
                                0x35A4E900, 
                                0x35A4E900
                            }
                        }
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_UFS_CFG", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_UFS", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }
            }, 

            Package (0x0C)
            {
                "DSTATE", 
                Zero, 
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
                    "PMICVREGVOTE", 
                    Package (0x0A)
                    {
                        "PPP_RESOURCE_ID_LDO20_A", 
                        One, 
                        0x002D0370, 
                        0x000B71B0, 
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
                        "PPP_RESOURCE_ID_LDO26_A", 
                        One, 
                        0x00124F80, 
                        0x00088B80, 
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
                    Package (0x0E)
                    {
                        "PPP_RESOURCE_ID_SMPS4_A", 
                        0x02, 
                        0x001B7740, 
                        0x000B71B0, 
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
                    "PMICVREGVOTE", 
                    Package (0x0A)
                    {
                        "PPP_RESOURCE_ID_LDO2_A", 
                        One, 
                        0x00124F80, 
                        0x3908, 
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
                        0xC8C8, 
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
                    "DELAY", 
                    Package (0x01)
                    {
                        0x23
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x04)
                    {
                        "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                        0x06, 
                        One, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "PSTATE_ADJUST", 
                    Package (0x02)
                    {
                        One, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "PSTATE_ADJUST", 
                    Package (0x02)
                    {
                        0x02, 
                        Zero
                    }
                }
            }, 

            Package (0x0A)
            {
                "DSTATE", 
                0x03, 
                Package (0x02)
                {
                    "PSTATE_ADJUST", 
                    Package (0x02)
                    {
                        0x02, 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "PSTATE_ADJUST", 
                    Package (0x02)
                    {
                        One, 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x04)
                    {
                        "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                        0x06, 
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
                        "PPP_RESOURCE_ID_LDO20_A", 
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
                    "DELAY", 
                    Package (0x01)
                    {
                        0x23
                    }
                }, 

                Package (0x02)
                {
                    "PSTATE_ADJUST", 
                    Package (0x02)
                    {
                        Zero, 
                        One
                    }
                }
            }
        }, 

        Package (0x05)
        {
            "DEVICE", 
            "\\_SB.SDC2", 
            Package (0x09)
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

                Package (0x19)
                {
                    "PSTATE_SET", 
                    Zero, 
                    Package (0x03)
                    {
                        "PSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x02, 
                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x04, 
                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x05, 
                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x06, 
                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x07, 
                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x08, 
                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x09, 
                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0B, 
                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0C, 
                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0D, 
                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0E, 
                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0F, 
                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x10, 
                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x11, 
                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x12, 
                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x13, 
                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }
                    }, 

                    Package (0x08)
                    {
                        "PSTATE", 
                        0x14, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO21_A", 
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
                                "PPP_RESOURCE_ID_LDO13_A", 
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
                            "DELAY", 
                            Package (0x01)
                            {
                                0x23
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO21_A", 
                                One, 
                                0x002D0370, 
                                0x000C3500, 
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
                                "PPP_RESOURCE_ID_LDO13_A", 
                                One, 
                                0x002D0370, 
                                0x55F0, 
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
                            "DELAY", 
                            Package (0x01)
                            {
                                0x23
                            }
                        }
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x15, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO13_A", 
                                One, 
                                0x001C3A90, 
                                0x55F0, 
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
                            "DELAY", 
                            Package (0x01)
                            {
                                0x23
                            }
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x16, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO21_A", 
                                One, 
                                0x002D0370, 
                                0x000C3500, 
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
                                "PPP_RESOURCE_ID_LDO13_A", 
                                One, 
                                0x002D0370, 
                                0x55F0, 
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
                            "DELAY", 
                            Package (0x01)
                            {
                                0x23
                            }
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x17, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO21_A", 
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
                                "PPP_RESOURCE_ID_LDO13_A", 
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
                            "DELAY", 
                            Package (0x01)
                            {
                                0x23
                            }
                        }
                    }
                }, 

                Package (0x0A)
                {
                    "PSTATE_SET", 
                    One, 
                    Package (0x03)
                    {
                        "PSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sdcc2_apps_clk", 
                                0x02
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_sdcc2_apps_clk", 
                                0x08, 
                                0x00061A80, 
                                0x02
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x02, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_sdcc2_apps_clk", 
                                0x08, 
                                0x01312D00, 
                                0x02
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_sdcc2_apps_clk", 
                                0x08, 
                                0x017D7840, 
                                0x02
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x04, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_sdcc2_apps_clk", 
                                0x08, 
                                0x02FAF080, 
                                0x02
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x05, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_sdcc2_apps_clk", 
                                0x08, 
                                0x05F5E100, 
                                0x02
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x06, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_sdcc2_apps_clk", 
                                0x08, 
                                0x05F5E100, 
                                0x02
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x07, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_sdcc2_apps_clk", 
                                0x08, 
                                0x05F5E100, 
                                0x02
                            }
                        }
                    }
                }, 

                Package (0x07)
                {
                    "PSTATE_SET", 
                    0x02, 
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
                                "ICBID_MASTER_SDCC_2", 
                                "ICBID_SLAVE_EBI1", 
                                0x0BEBC200, 
                                0x05F5E100
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
                                "ICBID_MASTER_SDCC_2", 
                                "ICBID_SLAVE_EBI1", 
                                0x0BEBC200, 
                                0x05F5E100
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
                                "ICBID_MASTER_SDCC_2", 
                                "ICBID_SLAVE_EBI1", 
                                0x05F5E100, 
                                0x02FAF080
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
                                "ICBID_MASTER_SDCC_2", 
                                "ICBID_SLAVE_EBI1", 
                                0x02625A00, 
                                0x01312D00
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
                                "ICBID_MASTER_SDCC_2", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }, 

                Package (0x05)
                {
                    "PSTATE_SET", 
                    0x03, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                One, 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                0x02, 
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
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                One, 
                                0x06
                            }
                        }, 

                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                0x02, 
                                One
                            }
                        }
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x02, 
                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                One, 
                                0x02
                            }
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
                    "PSTATE_SET", 
                    0x04, 
                    Package (0x03)
                    {
                        "PSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sdcc2_ahb_clk", 
                                One
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_sdcc2_ahb_clk", 
                                0x02, 
                                Zero, 
                                0x02
                            }
                        }
                    }
                }
            }, 

            Package (0x07)
            {
                "DSTATE", 
                Zero, 
                Package (0x02)
                {
                    "PSTATE_ADJUST", 
                    Package (0x02)
                    {
                        Zero, 
                        0x16
                    }
                }, 

                Package (0x02)
                {
                    "TLMMPORT", 
                    Package (0x03)
                    {
                        0x00099000, 
                        0x7FFF, 
                        0x1FE4
                    }
                }, 

                Package (0x02)
                {
                    "PSTATE_ADJUST", 
                    Package (0x02)
                    {
                        0x02, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "PSTATE_ADJUST", 
                    Package (0x02)
                    {
                        0x04, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "PSTATE_ADJUST", 
                    Package (0x02)
                    {
                        One, 
                        0x07
                    }
                }
            }, 

            Package (0x07)
            {
                "DSTATE", 
                0x03, 
                Package (0x02)
                {
                    "PSTATE_ADJUST", 
                    Package (0x02)
                    {
                        One, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "PSTATE_ADJUST", 
                    Package (0x02)
                    {
                        0x04, 
                        One
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
                    "TLMMPORT", 
                    Package (0x03)
                    {
                        0x00099000, 
                        0x7FFF, 
                        0x0A00
                    }
                }, 

                Package (0x02)
                {
                    "PSTATE_ADJUST", 
                    Package (0x02)
                    {
                        Zero, 
                        0x17
                    }
                }
            }
        }, 

        Package (0x07)
        {
            "DEVICE", 
            "\\_SB.ADSP.SLM1", 
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

            Package (0x02)
            {
                "DSTATE", 
                Zero
            }, 

            Package (0x02)
            {
                "DSTATE", 
                One
            }, 

            Package (0x02)
            {
                "DSTATE", 
                0x02
            }, 

            Package (0x02)
            {
                "DSTATE", 
                0x03
            }
        }, 

        Package (0x07)
        {
            "DEVICE", 
            "\\_SB.ADSP.SLM2", 
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

            Package (0x02)
            {
                "DSTATE", 
                Zero
            }, 

            Package (0x02)
            {
                "DSTATE", 
                One
            }, 

            Package (0x02)
            {
                "DSTATE", 
                0x02
            }, 

            Package (0x02)
            {
                "DSTATE", 
                0x03
            }
        }, 

        Package (0x07)
        {
            "DEVICE", 
            "\\_SB.PCI0", 
            Package (0x04)
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
                }
            }, 

            Package (0x0E)
            {
                "DSTATE", 
                Zero, 
                Package (0x02)
                {
                    "FOOTSWITCH", 
                    Package (0x02)
                    {
                        "VDD_PCIE_0", 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x04)
                    {
                        "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                        0x06, 
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
                        "/clk/agr1", 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_pcie_0_pipe_clk", 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_pcie_0_slv_axi_clk", 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_pcie_0_mstr_axi_clk", 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_pcie_0_cfg_ahb_clk", 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_pcie_0_aux_clk", 
                        0x08, 
                        0x0124F800, 
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
                        "ICBID_SLAVE_PCIE_0_CFG", 
                        0x047868C0, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_PCIE_0", 
                        "ICBID_SLAVE_EBI1", 
                        0x17D78400, 
                        0x0BEBC200
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
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0A)
                    {
                        "PPP_RESOURCE_ID_LDO1_A", 
                        One, 
                        0x000D6D80, 
                        0xC8C8, 
                        One, 
                        Zero, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                }
            }, 

            Package (0x02)
            {
                "DSTATE", 
                One
            }, 

            Package (0x02)
            {
                "DSTATE", 
                0x02
            }, 

            Package (0x0E)
            {
                "DSTATE", 
                0x03, 
                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_pcie_0_pipe_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_pcie_0_aux_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_pcie_0_slv_axi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_pcie_0_mstr_axi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_pcie_0_cfg_ahb_clk", 
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
                        "ICBID_SLAVE_PCIE_0_CFG", 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_PCIE_0", 
                        "ICBID_SLAVE_EBI1", 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        Zero, 
                        "/clk/agr1", 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "FOOTSWITCH", 
                    Package (0x02)
                    {
                        "VDD_PCIE_0", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x04)
                    {
                        "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                        0x06, 
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
            }
        }, 

        Package (0x07)
        {
            "DEVICE", 
            "\\_SB.PCI0.RP1", 
            Package (0x04)
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
                One
            }, 

            Package (0x02)
            {
                "DSTATE", 
                0x02
            }, 

            Package (0x02)
            {
                "DSTATE", 
                0x03
            }
        }
    })
    Name (LPCC, Package (0x05)
    {
        Package (0x07)
        {
            "DEVICE", 
            "\\_SB.URS0", 
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
                One
            }, 

            Package (0x02)
            {
                "DSTATE", 
                0x02
            }, 

            Package (0x02)
            {
                "DSTATE", 
                0x03
            }
        }, 

        Package (0x08)
        {
            "DEVICE", 
            "\\_SB.URS0.USB0", 
            Package (0x05)
            {
                "COMPONENT", 
                Zero, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x0B)
                {
                    "PSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "gcc_usb30_sleep_clk", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "gcc_usb30_sleep_clk", 
                            0x09, 
                            0x08
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "gcc_usb30_sleep_clk", 
                            0x09, 
                            0x0C
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "gcc_usb30_mock_utmi_clk", 
                            0x09, 
                            0x0A
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x05)
                        {
                            "gcc_usb3_phy_pipe_clk", 
                            0x06, 
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
                            "gcc_usb3_phy_pipe_clk", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "gcc_usb3_phy_pipe_clk", 
                            0x09, 
                            0x08
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "gcc_usb_phy_cfg_ahb2phy_clk", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "gcc_usb_phy_cfg_ahb2phy_clk", 
                            0x09, 
                            0x08
                        }
                    }
                }, 

                Package (0x02)
                {
                    "PRELOAD_PSTATE", 
                    Zero
                }
            }, 

            Package (0x11)
            {
                "DSTATE", 
                Zero, 
                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0A)
                    {
                        "PPP_RESOURCE_ID_LDO12_A", 
                        One, 
                        0x001B7740, 
                        0x6FCD, 
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
                        "PPP_RESOURCE_ID_LDO24_A", 
                        One, 
                        0x002EEBB8, 
                        0x143C, 
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
                        0x2710, 
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
                        0x750E, 
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
                    "FOOTSWITCH", 
                    Package (0x02)
                    {
                        "VDD_USB_30", 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/snoc", 
                        0x0001D4C0
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/agr1", 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_aggre1_usb3_axi_clk", 
                        0x08, 
                        0x78, 
                        0x09
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_cfg_noc_usb3_axi_clk", 
                        0x08, 
                        0x78, 
                        0x09
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_usb30_master_clk", 
                        0x08, 
                        0x78, 
                        0x09
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_usb30_mock_utmi_clk", 
                        0x08, 
                        0x4B00, 
                        0x07
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_usb3_phy_aux_clk", 
                        0x08, 
                        0x04B0, 
                        0x07
                    }
                }, 

                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_USB3", 
                        "ICBID_SLAVE_EBI1", 
                        0x28000000, 
                        0x28000000
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/pmic/client/rail_cx", 
                        0x04
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x04)
                    {
                        "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                        0x06, 
                        One, 
                        Zero
                    }
                }
            }, 

            Package (0x11)
            {
                "DSTATE", 
                One, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        Zero, 
                        "/clk/snoc", 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        Zero, 
                        "/clk/agr1", 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_usb30_master_clk", 
                        0x03, 
                        0x2580, 
                        0x05
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb30_master_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_cfg_noc_usb3_axi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_aggre1_usb3_axi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb30_mock_utmi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb3_phy_aux_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x04)
                    {
                        "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                        0x06, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_USB3", 
                        "ICBID_SLAVE_EBI1", 
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
                        0x02, 
                        One, 
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
                        "PPP_RESOURCE_ID_LDO24_A", 
                        One, 
                        0x002EEBB8, 
                        0x10, 
                        One, 
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
                        0x00124F80, 
                        Zero, 
                        One, 
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
                        0x000D6D80, 
                        0x044C, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                }
            }, 

            Package (0x12)
            {
                "DSTATE", 
                0x02, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        Zero, 
                        "/clk/snoc", 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        Zero, 
                        "/clk/agr1", 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_usb30_master_clk", 
                        0x03, 
                        0x00927C00, 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb30_master_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_cfg_noc_usb3_axi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_aggre1_usb3_axi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb30_mock_utmi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb3_phy_aux_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x04)
                    {
                        "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                        0x06, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "FOOTSWITCH", 
                    Package (0x02)
                    {
                        "VDD_USB_30", 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_USB3", 
                        "ICBID_SLAVE_EBI1", 
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
                        0x02, 
                        One, 
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
                        "PPP_RESOURCE_ID_LDO24_A", 
                        One, 
                        0x002EEBB8, 
                        0x10, 
                        One, 
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
                        0x00124F80, 
                        Zero, 
                        One, 
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
                        0x000D6D80, 
                        0x044C, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                }
            }, 

            Package (0x12)
            {
                "DSTATE", 
                0x03, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        Zero, 
                        "/clk/snoc", 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        Zero, 
                        "/clk/agr1", 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_usb30_master_clk", 
                        0x03, 
                        0x00927C00, 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb30_master_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_cfg_noc_usb3_axi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_aggre1_usb3_axi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb30_mock_utmi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb3_phy_aux_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x04)
                    {
                        "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                        0x06, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "FOOTSWITCH", 
                    Package (0x02)
                    {
                        "VDD_USB_30", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_USB3", 
                        "ICBID_SLAVE_EBI1", 
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
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0A)
                    {
                        "PPP_RESOURCE_ID_LDO24_A", 
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

            Package (0x02)
            {
                "ABANDON_DSTATE", 
                0x03
            }
        }, 

        Package (0x08)
        {
            "DEVICE", 
            "\\_SB.URS0.UFN0", 
            Package (0x05)
            {
                "COMPONENT", 
                Zero, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x0B)
                {
                    "PSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "gcc_usb30_sleep_clk", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "gcc_usb30_sleep_clk", 
                            0x09, 
                            0x08
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "gcc_usb30_sleep_clk", 
                            0x09, 
                            0x0C
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "gcc_usb30_mock_utmi_clk", 
                            0x09, 
                            0x0A
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x05)
                        {
                            "gcc_usb3_phy_pipe_clk", 
                            0x06, 
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
                            "gcc_usb3_phy_pipe_clk", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "gcc_usb3_phy_pipe_clk", 
                            0x09, 
                            0x08
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "gcc_usb_phy_cfg_ahb2phy_clk", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "gcc_usb_phy_cfg_ahb2phy_clk", 
                            0x09, 
                            0x08
                        }
                    }
                }, 

                Package (0x02)
                {
                    "PRELOAD_PSTATE", 
                    Zero
                }
            }, 

            Package (0x11)
            {
                "DSTATE", 
                Zero, 
                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0A)
                    {
                        "PPP_RESOURCE_ID_LDO12_A", 
                        One, 
                        0x001B7740, 
                        0x6FCD, 
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
                        "PPP_RESOURCE_ID_LDO24_A", 
                        One, 
                        0x002EEBB8, 
                        0x0C, 
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
                        0x2710, 
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
                        0x750E, 
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
                    "FOOTSWITCH", 
                    Package (0x02)
                    {
                        "VDD_USB_30", 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/snoc", 
                        0x0001D4C0
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/agr1", 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_aggre1_usb3_axi_clk", 
                        0x08, 
                        0x78, 
                        0x09
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_cfg_noc_usb3_axi_clk", 
                        0x08, 
                        0x78, 
                        0x09
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_usb30_master_clk", 
                        0x08, 
                        0x78, 
                        0x09
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_usb30_mock_utmi_clk", 
                        0x08, 
                        0x4B00, 
                        0x07
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_usb3_phy_aux_clk", 
                        0x08, 
                        0x04B0, 
                        0x07
                    }
                }, 

                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_USB3", 
                        "ICBID_SLAVE_EBI1", 
                        0x28000000, 
                        0x28000000
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/pmic/client/rail_cx", 
                        0x04
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x04)
                    {
                        "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                        0x06, 
                        One, 
                        Zero
                    }
                }
            }, 

            Package (0x02)
            {
                "DSTATE", 
                One
            }, 

            Package (0x11)
            {
                "DSTATE", 
                0x02, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        Zero, 
                        "/clk/snoc", 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        Zero, 
                        "/clk/agr1", 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_usb30_master_clk", 
                        0x03, 
                        0x2580, 
                        0x05
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb30_master_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_cfg_noc_usb3_axi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_aggre1_usb3_axi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb30_mock_utmi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb3_phy_aux_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x04)
                    {
                        "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                        0x06, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_USB3", 
                        "ICBID_SLAVE_EBI1", 
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
                        0x04
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
                        0x02, 
                        One, 
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
                        "PPP_RESOURCE_ID_LDO24_A", 
                        One, 
                        0x002EEBB8, 
                        0xC4, 
                        One, 
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

            Package (0x12)
            {
                "DSTATE", 
                0x03, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        Zero, 
                        "/clk/snoc", 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        Zero, 
                        "/clk/agr1", 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_usb30_master_clk", 
                        0x03, 
                        0x00927C00, 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb30_master_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_cfg_noc_usb3_axi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_aggre1_usb3_axi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb30_mock_utmi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb3_phy_aux_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x04)
                    {
                        "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                        0x06, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "FOOTSWITCH", 
                    Package (0x02)
                    {
                        "VDD_USB_30", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_USB3", 
                        "ICBID_SLAVE_EBI1", 
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
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0A)
                    {
                        "PPP_RESOURCE_ID_LDO24_A", 
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

            Package (0x02)
            {
                "ABANDON_DSTATE", 
                0x03
            }
        }, 

        Package (0x07)
        {
            "DEVICE", 
            "\\_SB.PTCC", 
            Package (0x05)
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
                    "PSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "PMICVREGVOTE", 
                        Package (0x0A)
                        {
                            "PPP_RESOURCE_ID_LDO24_A", 
                            One, 
                            0x002EEBB8, 
                            0x03E8, 
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
                            "PPP_RESOURCE_ID_LDO12_A", 
                            One, 
                            0x001B7740, 
                            0x03E8, 
                            One, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
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
                        "PMICVREGVOTE", 
                        Package (0x0A)
                        {
                            "PPP_RESOURCE_ID_LDO24_A", 
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
                One
            }, 

            Package (0x02)
            {
                "DSTATE", 
                0x02
            }, 

            Package (0x02)
            {
                "DSTATE", 
                0x03
            }
        }, 

        Package (0x08)
        {
            "DEVICE", 
            "\\_SB.USB0", 
            Package (0x05)
            {
                "COMPONENT", 
                Zero, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x0B)
                {
                    "PSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "gcc_usb30_sleep_clk", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "gcc_usb30_sleep_clk", 
                            0x09, 
                            0x08
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "gcc_usb30_sleep_clk", 
                            0x09, 
                            0x0C
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "gcc_usb30_mock_utmi_clk", 
                            0x09, 
                            0x0A
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x05)
                        {
                            "gcc_usb3_phy_pipe_clk", 
                            0x06, 
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
                            "gcc_usb3_phy_pipe_clk", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "gcc_usb3_phy_pipe_clk", 
                            0x09, 
                            0x08
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "gcc_usb_phy_cfg_ahb2phy_clk", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "gcc_usb_phy_cfg_ahb2phy_clk", 
                            0x09, 
                            0x08
                        }
                    }
                }, 

                Package (0x02)
                {
                    "PRELOAD_PSTATE", 
                    Zero
                }
            }, 

            Package (0x11)
            {
                "DSTATE", 
                Zero, 
                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0A)
                    {
                        "PPP_RESOURCE_ID_LDO12_A", 
                        One, 
                        0x001B7740, 
                        0x6FCD, 
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
                        "PPP_RESOURCE_ID_LDO24_A", 
                        One, 
                        0x002EEBB8, 
                        0x143C, 
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
                        0x2710, 
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
                        0x750E, 
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
                    "FOOTSWITCH", 
                    Package (0x02)
                    {
                        "VDD_USB_30", 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/snoc", 
                        0x0001D4C0
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/clk/agr1", 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_aggre1_usb3_axi_clk", 
                        0x08, 
                        0x78, 
                        0x09
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_cfg_noc_usb3_axi_clk", 
                        0x08, 
                        0x78, 
                        0x09
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_usb30_master_clk", 
                        0x08, 
                        0x78, 
                        0x09
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_usb30_mock_utmi_clk", 
                        0x08, 
                        0x4B00, 
                        0x07
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_usb3_phy_aux_clk", 
                        0x08, 
                        0x04B0, 
                        0x07
                    }
                }, 

                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_USB3", 
                        "ICBID_SLAVE_EBI1", 
                        0x28000000, 
                        0x28000000
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        One, 
                        "/pmic/client/rail_cx", 
                        0x04
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x04)
                    {
                        "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                        0x06, 
                        One, 
                        Zero
                    }
                }
            }, 

            Package (0x11)
            {
                "DSTATE", 
                One, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        Zero, 
                        "/clk/snoc", 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        Zero, 
                        "/clk/agr1", 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_usb30_master_clk", 
                        0x03, 
                        0x2580, 
                        0x05
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb30_master_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_cfg_noc_usb3_axi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_aggre1_usb3_axi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb30_mock_utmi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb3_phy_aux_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x04)
                    {
                        "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                        0x06, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_USB3", 
                        "ICBID_SLAVE_EBI1", 
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
                        0x02, 
                        One, 
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
                        "PPP_RESOURCE_ID_LDO24_A", 
                        One, 
                        0x002EEBB8, 
                        0x10, 
                        One, 
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
                        0x00124F80, 
                        0x02, 
                        One, 
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
                        0x000D6D80, 
                        0x044C, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                }
            }, 

            Package (0x12)
            {
                "DSTATE", 
                0x02, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        Zero, 
                        "/clk/snoc", 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        Zero, 
                        "/clk/agr1", 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_usb30_master_clk", 
                        0x03, 
                        0x00927C00, 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb30_master_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_cfg_noc_usb3_axi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_aggre1_usb3_axi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb30_mock_utmi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb3_phy_aux_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x04)
                    {
                        "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                        0x06, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "FOOTSWITCH", 
                    Package (0x02)
                    {
                        "VDD_USB_30", 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_USB3", 
                        "ICBID_SLAVE_EBI1", 
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
                        0x02, 
                        One, 
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
                        "PPP_RESOURCE_ID_LDO24_A", 
                        One, 
                        0x002EEBB8, 
                        0x10, 
                        One, 
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
                        0x00124F80, 
                        0x02, 
                        One, 
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
                        0x000D6D80, 
                        0x044C, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                }
            }, 

            Package (0x11)
            {
                "DSTATE", 
                0x03, 
                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        Zero, 
                        "/clk/snoc", 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "REQUIRED_RESOURCE", 
                    Package (0x03)
                    {
                        Zero, 
                        "/clk/agr1", 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_usb30_master_clk", 
                        0x03, 
                        0x2580, 
                        0x05
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb30_master_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_cfg_noc_usb3_axi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_aggre1_usb3_axi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb30_mock_utmi_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_usb3_phy_aux_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x04)
                    {
                        "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A", 
                        0x06, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_USB3", 
                        "ICBID_SLAVE_EBI1", 
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
                        0x02, 
                        One, 
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
                        "PPP_RESOURCE_ID_LDO24_A", 
                        One, 
                        0x002EEBB8, 
                        0x10, 
                        One, 
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
                        0x00124F80, 
                        0x02, 
                        One, 
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
                        0x000D6D80, 
                        0x044C, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                }
            }, 

            Package (0x02)
            {
                "ABANDON_DSTATE", 
                0x03
            }
        }
    })
}
