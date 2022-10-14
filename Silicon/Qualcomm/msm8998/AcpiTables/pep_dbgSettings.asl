Scope (\_SB.PEP0)
{
    Method (LDBG, 0, NotSerialized)
    {
        Return (NDBG) /* \_SB_.PEP0.NDBG */
    }

    Name (NDBG, Package (0x03)
    {
        "DEBUGGERS", 
        Package (0x05)
        {
            "TYPE", 
            "SERIAL", 
            Package (0x02)
            {
                "INSTANCES", 
                "\\_SB.UARD"
            }, 

            Package (0x05)
            {
                "DEBUG_ON", 
                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_blsp2_uart2_apps_clk", 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_blsp2_ahb_clk", 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x03)
                    {
                        "gcc_blsp2_uart2_apps_clk", 
                        0x09, 
                        0x08
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x03)
                    {
                        "gcc_blsp2_ahb_clk", 
                        0x09, 
                        0x08
                    }
                }
            }, 

            Package (One)
            {
                "DEBUG_OFF"
            }
        }, 

        Package (0x05)
        {
            "TYPE", 
            "USB3.0", 
            Package (0x02)
            {
                "INSTANCES", 
                "\\_SB.USB0"
            }, 

            Package (0x16)
            {
                "DEBUG_ON", 
                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0A)
                    {
                        "PPP_RESOURCE_ID_LDO24_A", 
                        One, 
                        0x002EEBB8, 
                        0x16A8, 
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
                        0xA08C, 
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
                        0xA08C, 
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
                        0x000F4240, 
                        0x6590, 
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

            Package (One)
            {
                "DEBUG_OFF"
            }
        }
    })
}
