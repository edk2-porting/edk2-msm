Scope (\_SB.PEP0)
{
    Method (V6M1, 0, NotSerialized)
    {
        Name (TAB6, Package (0x05)
        {
            "VPP_SETTING", 
            "1", 
            "0", 
            "132", 
            Package (0x03)
            {
                "FOUNDRY", 
                "*", 
                Package (0x05)
                {
                    "CHIP_INFO", 
                    "292", 
                    "1", 
                    "*", 
                    Package (0x03)
                    {
                        "SPEEDBIN_INFO", 
                        "*", 
                        Package (0x02)
                        {
                            "CPR_REV", 
                            "*"
                        }
                    }
                }
            }
        })
        Return (TAB6) /* \_SB_.PEP0.V6M1.TAB6 */
    }

    Method (V6M2, 0, NotSerialized)
    {
        Name (TAB6, Package (0x05)
        {
            "VPP_SETTING", 
            "1", 
            "0", 
            "132", 
            Package (0x03)
            {
                "FOUNDRY", 
                "*", 
                Package (0x05)
                {
                    "CHIP_INFO", 
                    "292", 
                    "2", 
                    "*", 
                    Package (0x03)
                    {
                        "SPEEDBIN_INFO", 
                        "*", 
                        Package (0x05)
                        {
                            "CPR_REV", 
                            "*", 
                            Package (0x04)
                            {
                                "TEMP_POINT", 
                                "GFX", 
                                "0", 
                                "50"
                            }, 

                            Package (0x04)
                            {
                                "TEMP_POINT", 
                                "APC0", 
                                "0", 
                                "50"
                            }, 

                            Package (0x04)
                            {
                                "TEMP_POINT", 
                                "APC1", 
                                "0", 
                                "50"
                            }
                        }
                    }
                }
            }
        })
        Return (TAB6) /* \_SB_.PEP0.V6M2.TAB6 */
    }

    Method (V6A1, 0, NotSerialized)
    {
        Name (TAB6, Package (0x05)
        {
            "VPP_SETTING", 
            "1", 
            "0", 
            "132", 
            Package (0x03)
            {
                "FOUNDRY", 
                "*", 
                Package (0x05)
                {
                    "CHIP_INFO", 
                    "319", 
                    "1", 
                    "*", 
                    Package (0x03)
                    {
                        "SPEEDBIN_INFO", 
                        "*", 
                        Package (0x02)
                        {
                            "CPR_REV", 
                            "*"
                        }
                    }
                }
            }
        })
        Return (TAB6) /* \_SB_.PEP0.V6A1.TAB6 */
    }

    Method (V6A2, 0, NotSerialized)
    {
        Name (TAB6, Package (0x05)
        {
            "VPP_SETTING", 
            "1", 
            "0", 
            "132", 
            Package (0x03)
            {
                "FOUNDRY", 
                "*", 
                Package (0x05)
                {
                    "CHIP_INFO", 
                    "319", 
                    "2", 
                    "*", 
                    Package (0x03)
                    {
                        "SPEEDBIN_INFO", 
                        "*", 
                        Package (0x05)
                        {
                            "CPR_REV", 
                            "*", 
                            Package (0x04)
                            {
                                "TEMP_POINT", 
                                "GFX", 
                                "0", 
                                "50"
                            }, 

                            Package (0x04)
                            {
                                "TEMP_POINT", 
                                "APC0", 
                                "0", 
                                "50"
                            }, 

                            Package (0x04)
                            {
                                "TEMP_POINT", 
                                "APC1", 
                                "0", 
                                "50"
                            }
                        }
                    }
                }
            }
        })
        Return (TAB6) /* \_SB_.PEP0.V6A2.TAB6 */
    }
}
