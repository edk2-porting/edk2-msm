//
//  Please note that not all the SE engine instances (I2C/SPI/UART) from below asl file can be used directly by icluding in the client ACPI, 
//  The corresponding Access Control needs to be enabled from TZ side to get the SE/usecase working End 2 End.
//

Device (UAR3)
{
    Name (_HID, "QCOM0034")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0x03)  // _UID: Unique ID
    Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
    Name (_DEP, Package (0x01)  // _DEP: Dependencies
    {
        \_SB.PEP0
    })
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x0C171000,         // Address Base
                0x00000100,         // Address Length
                )
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x0000008D,
            }
            GpioInt (Edge, ActiveLow, Exclusive, PullDown, 0x0000,
                "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x002E
                }
        })
        Return (RBUF) /* \_SB_.UAR3._CRS.RBUF */
    }

    Method (PROP, 0, NotSerialized)
    {
        Name (RBUF, Package (0x18)
        {
            "UartClass", 
            One, 
            "EnableDma", 
            Zero, 
            "BamBase", 
            0x0C144000, 
            "BamPipeTx", 
            0x04, 
            "BamPipeRx", 
            0x05, 
            "QgicBase", 
            0x17A00000, 
            "ClkrgmBase", 
            0x00100000, 
            "TlmmBase", 
            0x03D00000, 
            "GpioRfrN", 
            0x30, 
            "GpioCtsN", 
            0x2F, 
            "GpioRxData", 
            0x2E, 
            "GpioTxData", 
            0x2D
        })
        Return (RBUF) /* \_SB_.UAR3.PROP.RBUF */
    }
}

Device (UAR5)
{
    Name (_HID, "QCOM0034")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0x05)  // _UID: Unique ID
    Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
    Name (_DEP, Package (0x01)  // _DEP: Dependencies
    {
        \_SB.PEP0
    })
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x0C1B0000,         // Address Base
                0x00000100,         // Address Length
                )
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x00000092,
            }
            GpioInt (Edge, ActiveLow, Exclusive, PullDown, 0x0000,
                "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0005
                }
        })
        Return (RBUF) /* \_SB_.UAR5._CRS.RBUF */
    }

    Method (PROP, 0, NotSerialized)
    {
        Name (RBUF, Package (0x14)
        {
            "UartClass", 
            One, 
            "EnableDma", 
            Zero, 
            "BamBase", 
            0x0C184000, 
            "BamPipeTx", 
            0x02, 
            "BamPipeRx", 
            0x03, 
            "QgicBase", 
            0x17A00000, 
            "ClkrgmBase", 
            0x00100000, 
            "TlmmBase", 
            0x03500000, 
            "GpioRxData", 
            0x05, 
            "GpioTxData", 
            0x04
        })
        Return (RBUF) /* \_SB_.UAR5.PROP.RBUF */
    }
}

Device (I2C5)
{
    Name (_HID, "QCOM001F")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0x05)  // _UID: Unique ID
    Name (_DEP, Package (0x02)  // _DEP: Dependencies
    {
        \_SB.BAM3, 
        \_SB.PEP0
    })
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x0C179000,         // Address Base
                0x00000600,         // Address Length
                )
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x00000083,
            }
        })
        Return (RBUF) /* \_SB_.I2C5._CRS.RBUF */
    }

    Method (FNOC, 0, NotSerialized)
    {
        Name (RBUF, Buffer (0x0E)
        {
            /* 0000 */  0x05, 0x00, 0x00, 0x40, 0x14, 0x0C, 0x0F, 0x0E,  // ...@....
            /* 0008 */  0x00, 0x04, 0x00, 0xF8, 0x24, 0x01               // ....$.
        })
        Return (RBUF) /* \_SB_.I2C5.FNOC.RBUF */
    }
}

Device (I2C6)
{
    Name (_HID, "QCOM001F")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0x06)  // _UID: Unique ID
    Name (_DEP, Package (0x02)  // _DEP: Dependencies
    {
        \_SB.BAM3, 
        \_SB.PEP0
    })
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x0C17A000,         // Address Base
                0x00000600,         // Address Length
                )
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x00000084,
            }
        })
        Return (RBUF) /* \_SB_.I2C6._CRS.RBUF */
    }

    Method (FNOC, 0, NotSerialized)
    {
        Name (RBUF, Buffer (0x0E)
        {
            /* 0000 */  0x06, 0x00, 0x00, 0x40, 0x14, 0x0C, 0x11, 0x10,  // ...@....
            /* 0008 */  0x00, 0x04, 0x00, 0xF8, 0x24, 0x01               // ....$.
        })
        Return (RBUF) /* \_SB_.I2C6.FNOC.RBUF */
    }
}

Device (I2C7)
{
    Name (_HID, "QCOM001F")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0x07)  // _UID: Unique ID
    Name (_DEP, Package (0x02)  // _DEP: Dependencies
    {
        \_SB.BAM4, 
        \_SB.PEP0
    })
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x0C1B5000,         // Address Base
                0x00000600,         // Address Length
                )
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x00000085,
            }
        })
        Return (RBUF) /* \_SB_.I2C7._CRS.RBUF */
    }

    Method (FNOC, 0, NotSerialized)
    {
        Name (RBUF, Buffer (0x0E)
        {
            /* 0000 */  0x07, 0x00, 0x00, 0x40, 0x18, 0x0C, 0x07, 0x06,  // ...@....
            /* 0008 */  0x00, 0x04, 0x00, 0xF8, 0x24, 0x01               // ....$.
        })
        Return (RBUF) /* \_SB_.I2C7.FNOC.RBUF */
    }
}

//
//  PEP resources for buses
//
Scope (\_SB.PEP0)
{
    Method (BSMD, 0, NotSerialized)
    {
        Return (BSRC) /* \_SB_.PEP0.BSRC */
    }

    Name (BSRC, Package (0x05)
    {
        Package (0x04)
        {
            "DEVICE", 
            "\\_SB.UAR3", 
            Package (0x11)
            {
                "COMPONENT", 
                Zero, 
                Package (0x05)
                {
                    "FSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "gcc_blsp1_ahb_clk", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "gcc_blsp1_uart3_apps_clk", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "BUSARB", 
                        Package (0x05)
                        {
                            0x03, 
                            "ICBID_MASTER_BLSP_1", 
                            "ICBID_SLAVE_EBI1", 
                            Zero, 
                            0x0007A120
                        }
                    }
                }, 

                Package (0x05)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "gcc_blsp1_ahb_clk", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "gcc_blsp1_uart3_apps_clk", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "BUSARB", 
                        Package (0x05)
                        {
                            0x03, 
                            "ICBID_MASTER_BLSP_1", 
                            "ICBID_SLAVE_EBI1", 
                            Zero, 
                            Zero
                        }
                    }
                }, 

                Package (0x06)
                {
                    "PSTATE", 
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
                    }
                }, 

                Package (0x06)
                {
                    "PSTATE", 
                    One, 
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
                            "gcc_blsp1_uart3_apps_clk", 
                            0x03, 
                            0x00708000, 
                            0x04
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
                            "gcc_blsp1_uart3_apps_clk", 
                            0x03, 
                            0x00E10000, 
                            0x04
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
                            "gcc_blsp1_uart3_apps_clk", 
                            0x03, 
                            0x00F42400, 
                            0x04
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
                            "gcc_blsp1_uart3_apps_clk", 
                            0x03, 
                            0x016E3600, 
                            0x04
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
                            "gcc_blsp1_uart3_apps_clk", 
                            0x03, 
                            0x01E84800, 
                            0x04
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
                            "gcc_blsp1_uart3_apps_clk", 
                            0x03, 
                            0x02625A00, 
                            0x04
                        }
                    }
                }, 

                Package (0x03)
                {
                    "PSTATE", 
                    0x08, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "gcc_blsp1_uart3_apps_clk", 
                            0x03, 
                            0x02DC6C00, 
                            0x04
                        }
                    }
                }, 

                Package (0x03)
                {
                    "PSTATE", 
                    0x09, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "gcc_blsp1_uart3_apps_clk", 
                            0x03, 
                            0x030D4000, 
                            0x04
                        }
                    }
                }, 

                Package (0x03)
                {
                    "PSTATE", 
                    0x0A, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "gcc_blsp1_uart3_apps_clk", 
                            0x03, 
                            0x03567E00, 
                            0x04
                        }
                    }
                }, 

                Package (0x03)
                {
                    "PSTATE", 
                    0x0B, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "gcc_blsp1_uart3_apps_clk", 
                            0x03, 
                            0x03840000, 
                            0x04
                        }
                    }
                }, 

                Package (0x03)
                {
                    "PSTATE", 
                    0x0C, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "gcc_blsp1_uart3_apps_clk", 
                            0x03, 
                            0x03D09000, 
                            0x04
                        }
                    }
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                One, 
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
            }
        }, 

        Package (0x04)
        {
            "DEVICE", 
            "\\_SB.UAR5", 
            Package (0x11)
            {
                "COMPONENT", 
                Zero, 
                Package (0x05)
                {
                    "FSTATE", 
                    Zero, 
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
                        Package (0x02)
                        {
                            "gcc_blsp2_uart2_apps_clk", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "BUSARB", 
                        Package (0x05)
                        {
                            0x03, 
                            "ICBID_MASTER_BLSP_2", 
                            "ICBID_SLAVE_EBI1", 
                            Zero, 
                            0x0007A120
                        }
                    }
                }, 

                Package (0x05)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "gcc_blsp2_ahb_clk", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "gcc_blsp2_uart2_apps_clk", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "BUSARB", 
                        Package (0x05)
                        {
                            0x03, 
                            "ICBID_MASTER_BLSP_2", 
                            "ICBID_SLAVE_EBI1", 
                            Zero, 
                            Zero
                        }
                    }
                }, 

                Package (0x04)
                {
                    "PSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x05, 
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
                            0x04, 
                            Zero, 
                            0x02, 
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
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x05, 
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
                            0x04, 
                            Zero, 
                            0x02, 
                            Zero, 
                            Zero, 
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
                        "CLOCK", 
                        Package (0x04)
                        {
                            "gcc_blsp2_uart2_apps_clk", 
                            0x03, 
                            0x00708000, 
                            0x04
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
                            "gcc_blsp2_uart2_apps_clk", 
                            0x03, 
                            0x00E10000, 
                            0x04
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
                            "gcc_blsp2_uart2_apps_clk", 
                            0x03, 
                            0x00F42400, 
                            0x04
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
                            "gcc_blsp2_uart2_apps_clk", 
                            0x03, 
                            0x016E3600, 
                            0x04
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
                            "gcc_blsp2_uart2_apps_clk", 
                            0x03, 
                            0x01E84800, 
                            0x04
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
                            "gcc_blsp2_uart2_apps_clk", 
                            0x03, 
                            0x02625A00, 
                            0x04
                        }
                    }
                }, 

                Package (0x03)
                {
                    "PSTATE", 
                    0x08, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "gcc_blsp2_uart2_apps_clk", 
                            0x03, 
                            0x02DC6C00, 
                            0x04
                        }
                    }
                }, 

                Package (0x03)
                {
                    "PSTATE", 
                    0x09, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "gcc_blsp2_uart2_apps_clk", 
                            0x03, 
                            0x030D4000, 
                            0x04
                        }
                    }
                }, 

                Package (0x03)
                {
                    "PSTATE", 
                    0x0A, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "gcc_blsp2_uart2_apps_clk", 
                            0x03, 
                            0x03567E00, 
                            0x04
                        }
                    }
                }, 

                Package (0x03)
                {
                    "PSTATE", 
                    0x0B, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "gcc_blsp2_uart2_apps_clk", 
                            0x03, 
                            0x03840000, 
                            0x04
                        }
                    }
                }, 

                Package (0x03)
                {
                    "PSTATE", 
                    0x0C, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "gcc_blsp2_uart2_apps_clk", 
                            0x03, 
                            0x03D09000, 
                            0x04
                        }
                    }
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                One, 
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
            }
        }, 

        Package (0x07)
        {
            "DEVICE", 
            "\\_SB.I2C5", 
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

            Package (0x07)
            {
                "DSTATE", 
                Zero, 
                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_blsp1_ahb_clk", 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_blsp1_qup5_i2c_apps_clk", 
                        0x08, 
                        0x0124F800, 
                        0x04
                    }
                }, 

                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_BLSP_1", 
                        "ICBID_SLAVE_EBI1", 
                        0x0927C000, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "TLMMGPIO", 
                    Package (0x06)
                    {
                        0x57, 
                        One, 
                        0x03, 
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
                        0x58, 
                        One, 
                        0x03, 
                        One, 
                        0x03, 
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

            Package (0x07)
            {
                "DSTATE", 
                0x03, 
                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_blsp1_ahb_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_blsp1_qup5_i2c_apps_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_BLSP_1", 
                        "ICBID_SLAVE_EBI1", 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "TLMMGPIO", 
                    Package (0x06)
                    {
                        0x58, 
                        Zero, 
                        Zero, 
                        Zero, 
                        0x03, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "TLMMGPIO", 
                    Package (0x06)
                    {
                        0x57, 
                        Zero, 
                        Zero, 
                        Zero, 
                        0x03, 
                        Zero
                    }
                }
            }
        }, 

        Package (0x07)
        {
            "DEVICE", 
            "\\_SB.I2C6", 
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

            Package (0x07)
            {
                "DSTATE", 
                Zero, 
                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_blsp1_ahb_clk", 
                        One
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "gcc_blsp1_qup6_i2c_apps_clk", 
                        0x08, 
                        0x0124F800, 
                        0x04
                    }
                }, 

                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_BLSP_1", 
                        "ICBID_SLAVE_EBI1", 
                        0x0927C000, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "TLMMGPIO", 
                    Package (0x06)
                    {
                        0x2B, 
                        One, 
                        0x03, 
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
                        0x2C, 
                        One, 
                        0x03, 
                        One, 
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

            Package (0x07)
            {
                "DSTATE", 
                0x03, 
                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_blsp1_ahb_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_blsp1_qup6_i2c_apps_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_BLSP_1", 
                        "ICBID_SLAVE_EBI1", 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "TLMMGPIO", 
                    Package (0x06)
                    {
                        0x2C, 
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
                        0x2B, 
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
            "\\_SB.I2C7", 
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

            Package (0x07)
            {
                "DSTATE", 
                Zero, 
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
                    Package (0x04)
                    {
                        "gcc_blsp2_qup1_i2c_apps_clk", 
                        0x08, 
                        0x0124F800, 
                        0x04
                    }
                }, 

                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_BLSP_2", 
                        "ICBID_SLAVE_EBI1", 
                        0x0927C000, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "TLMMGPIO", 
                    Package (0x06)
                    {
                        0x37, 
                        One, 
                        0x03, 
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
                        0x38, 
                        One, 
                        0x03, 
                        One, 
                        0x03, 
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

            Package (0x07)
            {
                "DSTATE", 
                0x03, 
                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_blsp2_ahb_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x02)
                    {
                        "gcc_blsp2_qup1_i2c_apps_clk", 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "BUSARB", 
                    Package (0x05)
                    {
                        0x03, 
                        "ICBID_MASTER_BLSP_2", 
                        "ICBID_SLAVE_EBI1", 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "TLMMGPIO", 
                    Package (0x06)
                    {
                        0x38, 
                        Zero, 
                        Zero, 
                        Zero, 
                        0x03, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "TLMMGPIO", 
                    Package (0x06)
                    {
                        0x37, 
                        Zero, 
                        Zero, 
                        Zero, 
                        0x03, 
                        Zero
                    }
                }
            }
        }
    })
}
