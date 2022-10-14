// PEP resources for WCNSS
Scope (\_SB.PEP0)
{
    //Wireless Connectivity Devices
    Method (EWMD, 0, NotSerialized)
    {
        Return (WBRC) /* \_SB_.PEP0.WBRC */
    }

    Name (WBRC, Package (0x02)
    {
        // PEP settings for Wlan iHelium
        Package (0x08)
        {
            "DEVICE", 
            "\\_SB.AMSS.QWLN", 
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

            Package (0x08)
            {
                "DSTATE", 
                Zero, 
                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0E)
                    {
                        "PPP_RESOURCE_ID_SMPS7_A", 
                        0x02, 
                        0x000FA3E8, 
                        Zero, 
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
                        "PPP_RESOURCE_ID_LDO5_A", 
                        One, 
                        0x000C3500, 
                        Zero, 
                        One, 
                        0x04, 
                        One, 
                        0x04, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0E)
                    {
                        "PPP_RESOURCE_ID_SMPS5_A", 
                        0x02, 
                        0x001F47D0, 
                        Zero, 
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
                        "PPP_RESOURCE_ID_LDO7_A", 
                        One, 
                        0x001B7740, 
                        Zero, 
                        One, 
                        0x04, 
                        One, 
                        0x04, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0A)
                    {
                        "PPP_RESOURCE_ID_LDO17_A", 
                        One, 
                        0x0013E5C0, 
                        Zero, 
                        One, 
                        0x04, 
                        One, 
                        0x04, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0A)
                    {
                        "PPP_RESOURCE_ID_LDO25_A", 
                        One, 
                        0x00328980, 
                        Zero, 
                        One, 
                        0x04, 
                        One, 
                        0x04, 
                        Zero, 
                        Zero
                    }
                }
            }, 

            Package (0x08)
            {
                "DSTATE", 
                0x02, 
                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0A)
                    {
                        "PPP_RESOURCE_ID_LDO25_A", 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        0x04, 
                        Zero, 
                        0x04, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0A)
                    {
                        "PPP_RESOURCE_ID_LDO17_A", 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        0x04, 
                        Zero, 
                        0x04, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0A)
                    {
                        "PPP_RESOURCE_ID_LDO7_A", 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        0x04, 
                        Zero, 
                        0x04, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0A)
                    {
                        "PPP_RESOURCE_ID_LDO5_A", 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        0x04, 
                        Zero, 
                        0x04, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0E)
                    {
                        "PPP_RESOURCE_ID_SMPS5_A", 
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
                    "PMICVREGVOTE", 
                    Package (0x0E)
                    {
                        "PPP_RESOURCE_ID_SMPS7_A", 
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
            }, 

            Package (0x08)
            {
                "DSTATE", 
                0x03, 
                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0A)
                    {
                        "PPP_RESOURCE_ID_LDO25_A", 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        0x04, 
                        Zero, 
                        0x04, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0A)
                    {
                        "PPP_RESOURCE_ID_LDO17_A", 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        0x04, 
                        Zero, 
                        0x04, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0A)
                    {
                        "PPP_RESOURCE_ID_LDO7_A", 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        0x04, 
                        Zero, 
                        0x04, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0A)
                    {
                        "PPP_RESOURCE_ID_LDO5_A", 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        0x04, 
                        Zero, 
                        0x04, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0E)
                    {
                        "PPP_RESOURCE_ID_SMPS5_A", 
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
                    "PMICVREGVOTE", 
                    Package (0x0E)
                    {
                        "PPP_RESOURCE_ID_SMPS7_A", 
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
            }, 

            Package (0x02)
            {
                "PRELOAD_DSTATE", 
                Zero
            }, 

            Package (0x02)
            {
                "ABANDON_DSTATE", 
                0x02
            }
        }, 

        Package (0x05)
        {
            "DEVICE", 
            "\\_SB.BTH0", 
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

            Package (0x0B)
            {
                "DSTATE", 
                Zero, 
                Package (0x02)
                {
                    "TLMMGPIO", 
                    Package (0x06)
                    {
                        0x30, 
                        Zero, 
                        0x02, 
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
                        0x2F, 
                        Zero, 
                        0x02, 
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
                        0x2E, 
                        Zero, 
                        0x02, 
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
                        0x2D, 
                        Zero, 
                        0x02, 
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
                        "PPP_RESOURCE_ID_SMPS3_A", 
                        0x02, 
                        0x00149970, 
                        Zero, 
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
                    Package (0x0E)
                    {
                        "PPP_RESOURCE_ID_SMPS5_A", 
                        0x02, 
                        0x001F47D0, 
                        Zero, 
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
                        "PPP_RESOURCE_ID_LDO7_A", 
                        One, 
                        0x001B7740, 
                        0x09C4, 
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
                        "PPP_RESOURCE_ID_LDO17_A", 
                        One, 
                        0x0013E5C0, 
                        0x09C4, 
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
                        "PPP_RESOURCE_ID_LDO25_A", 
                        One, 
                        0x00328980, 
                        0x09C4, 
                        One, 
                        Zero, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                }
            }, 

            Package (0x0B)
            {
                "DSTATE", 
                0x03, 
                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0E)
                    {
                        "PPP_RESOURCE_ID_SMPS3_A", 
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
                    "PMICVREGVOTE", 
                    Package (0x0E)
                    {
                        "PPP_RESOURCE_ID_SMPS5_A", 
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
                    "PMICVREGVOTE", 
                    Package (0x0A)
                    {
                        "PPP_RESOURCE_ID_LDO7_A", 
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
                        "PPP_RESOURCE_ID_LDO17_A", 
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
                        "PPP_RESOURCE_ID_LDO25_A", 
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
                    "TLMMGPIO", 
                    Package (0x06)
                    {
                        0x30, 
                        Zero, 
                        0x02, 
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
                        0x2F, 
                        Zero, 
                        0x02, 
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
                        0x2E, 
                        Zero, 
                        0x02, 
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
                        0x2D, 
                        Zero, 
                        0x02, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                }
            }
        }
    })
}
