//
// Copyright (c) 2016 - 2018 Qualcomm Technologies, Inc. All rights reserved.
//

//
//
//  Please note that not all the SE engine instances (I2C/SPI/UART) from below asl file can be used directly by icluding in the client ACPI,
//  The corresponding Access Control needs to be enabled from TZ side to get the SE/usecase working End 2 End.
//
//

//
// QUPV3_ID0_SE7 (attached to BT SOC)
//
Device (UAR7)
{
    Name (_HID, "QCOM0236")
    Alias(\_SB.PSUB, _SUB)
    Name (_UID, 7)
    Name (_DEP, Package() { \_SB_.PEP0 })
    Name (_CCA, 0)

    Method (_CRS)
    {
        Name (RBUF, ResourceTemplate()
        {
            Memory32Fixed(ReadWrite, 0x00898000, 0x0004000)
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive) {639}
            GpioInt(Edge, ActiveLow, Exclusive, PullDown, 0, "\\_SB.GIO0") {48}  // UART RX,
        })
        Return (RBUF)
    }
}

//
// QUPV3_ID1_SE2  (UART Debug port)
//
 Device (UARD)
 {
     Name (_HID, "QCOM0236")
     Alias(\_SB.PSUB, _SUB)
     Name (_UID, 10)
     Name (_DEP, Package() { \_SB_.PEP0 })
     Name (_CCA, 0)

     Method (_CRS)
     {
         Name (RBUF, ResourceTemplate()
         {
             Memory32Fixed(ReadWrite, 0x00A84000, 0x00004000)
             Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive) {386}
             GpioInt(Edge, ActiveLow, Exclusive, PullDown, 0, "\\_SB.GIO0") {5}  // UART RX
         })
         Return (RBUF)
     }
 }

 Device (I2C1)
 {
     Name (_HID, "QCOM0220")  // _HID: Hardware ID
     Alias (\_SB.PSUB, _SUB)
     Name (_UID, One)  // _UID: Unique ID
     Name (_DEP, Package (0x02)  // _DEP: Dependencies
     {
         \_SB.PEP0, 
         \_SB.QGP0
     })
     Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
     Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
     {
         Name (RBUF, ResourceTemplate ()
         {
             Memory32Fixed (ReadWrite,
                 0x00880000,         // Address Base
                 0x00004000,         // Address Length
                 )
             Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
             {
                 0x00000279,
             }
         })
         Return (RBUF) /* \_SB_.I2C1._CRS.RBUF */
     }
 }
 Device (I2C3)
 {
     Name (_HID, "QCOM0220")  // _HID: Hardware ID
     Alias (\_SB.PSUB, _SUB)
     Name (_UID, 0x03)  // _UID: Unique ID
     Name (_DEP, Package (0x02)  // _DEP: Dependencies
     {
         \_SB.PEP0, 
         \_SB.QGP0
     })
     Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
     Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
     {
         Name (RBUF, ResourceTemplate ()
         {
             Memory32Fixed (ReadWrite,
                 0x00888000,         // Address Base
                 0x00004000,         // Address Length
                 )
             Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
             {
                 0x0000027B,
             }
         })
         Return (RBUF) /* \_SB_.I2C3._CRS.RBUF */
     }
 }
 Device (I2C4)
 {
     Name (_HID, "QCOM0220")  // _HID: Hardware ID
     Alias (\_SB.PSUB, _SUB)
     Name (_UID, 0x04)  // _UID: Unique ID
     Name (_DEP, Package (0x01)  // _DEP: Dependencies
     {
         \_SB.PEP0//, 
         //\_SB.QGP0
     })
     Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
     Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
     {
         Name (RBUF, ResourceTemplate ()
         {
             Memory32Fixed (ReadWrite,
                 0x0088C000,         // Address Base
                 0x00004000,         // Address Length
                 )
             Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
             {
                 0x0000027C,
             }
         })
         Return (RBUF) /* \_SB_.I2C4._CRS.RBUF */
     }
 }
 Device (I2C5)
 {
     Name (_HID, "QCOM0220")  // _HID: Hardware ID
     Alias (\_SB.PSUB, _SUB)
     Name (_UID, 0x05)  // _UID: Unique ID
     Name (_DEP, Package (0x02)  // _DEP: Dependencies
     {
         \_SB.PEP0, 
         \_SB.QGP0
     })
     Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
     Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
     {
         Name (RBUF, ResourceTemplate ()
         {
             Memory32Fixed (ReadWrite,
                 0x00890000,         // Address Base
                 0x00004000,         // Address Length
                 )
             Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
             {
                 0x0000027D,
             }
         })
         Return (RBUF) /* \_SB_.I2C5._CRS.RBUF */
     }
 }
 Device (I2C8)
 {
     Name (_HID, "QCOM0220")  // _HID: Hardware ID
     Alias (\_SB.PSUB, _SUB)
     Name (_UID, 0x08)  // _UID: Unique ID
     Name (_DEP, Package (0x02)  // _DEP: Dependencies
     {
         \_SB.PEP0, 
         \_SB.QGP0
     })
     Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
     Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
     {
         Name (RBUF, ResourceTemplate ()
         {
             Memory32Fixed (ReadWrite,
                 0x0089C000,         // Address Base
                 0x00004000,         // Address Length
                 )
             Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
             {
                 0x00000280,
             }
         })
         Return (RBUF) /* \_SB_.I2C8._CRS.RBUF */
     }
 }
 Device (IC11)
 {
     Name (_HID, "QCOM0220")  // _HID: Hardware ID
     Alias (\_SB.PSUB, _SUB)
     Name (_UID, 0x0B)  // _UID: Unique ID
     Name (_DEP, Package (0x01)  // _DEP: Dependencies
     {
         \_SB.PEP0//, 
         //\_SB.QGP0
     })
     Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
     Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
     {
         Name (RBUF, ResourceTemplate ()
         {
             Memory32Fixed (ReadWrite,
                 0x00A88000,         // Address Base
                 0x00004000,         // Address Length
                 )
             Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
             {
                 0x00000183,
             }
         })
         Return (RBUF) /* \_SB_.IC11._CRS.RBUF */
     }
 }
 Device (IC12)
 {
     Name (_HID, "QCOM0220")  // _HID: Hardware ID
     Alias (\_SB.PSUB, _SUB)
     Name (_UID, 0x0C)  // _UID: Unique ID
     Name (_DEP, Package (0x02)  // _DEP: Dependencies
     {
         \_SB.PEP0, 
         \_SB.QGP0
     })
     Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
     Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
     {
         Name (RBUF, ResourceTemplate ()
         {
             Memory32Fixed (ReadWrite,
                 0x00A8C000,         // Address Base
                 0x00004000,         // Address Length
                 )
             Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
             {
                 0x00000184,
             }
         })
         Return (RBUF) /* \_SB_.IC12._CRS.RBUF */
     }
 }
 Device (IC13)
 {
     Name (_HID, "QCOM0220")  // _HID: Hardware ID
     Alias (\_SB.PSUB, _SUB)
     Name (_UID, 0x0D)  // _UID: Unique ID
     Name (_DEP, Package (0x01)  // _DEP: Dependencies
     {
         \_SB.PEP0
     })
     Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
     Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
     {
         Name (RBUF, ResourceTemplate ()
         {
             Memory32Fixed (ReadWrite,
                 0x00A90000,         // Address Base
                 0x00004000,         // Address Length
                 )
             Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
             {
                 0x00000185,
             }
         })
         Return (RBUF) /* \_SB_.IC13._CRS.RBUF */
     }
 }
 Device (IC15)
 {
     Name (_HID, "QCOM0220")  // _HID: Hardware ID
     Name (_UID, 0x0F)  // _UID: Unique ID
     Name (_DEP, Package (0x02)  // _DEP: Dependencies
     {
         \_SB.PEP0, 
         \_SB.QGP0
     })
     Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
     Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
     {
         Name (RBUF, ResourceTemplate ()
         {
             Memory32Fixed (ReadWrite,
                 0x00A98000,         // Address Base
                 0x00004000,         // Address Length
                 )
             Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
             {
                 0x00000187,
             }
         })
         Return (RBUF) /* \_SB_.IC15._CRS.RBUF */
     }
 }
 Device (IC16)
 {
     Name (_HID, "QCOM0220")  // _HID: Hardware ID
     Name (_UID, 0x10)  // _UID: Unique ID
     Name (_DEP, Package (0x02)  // _DEP: Dependencies
     {
         \_SB.PEP0, 
         \_SB.QGP0
     })
     Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
     Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
     {
         Name (RBUF, ResourceTemplate ()
         {
             Memory32Fixed (ReadWrite,
                 0x00A9C000,         // Address Base
                 0x00004000,         // Address Length
                 )
             Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
             {
                 0x00000188,
             }
         })
         Return (RBUF) /* \_SB_.IC16._CRS.RBUF */
     }
 }

//SPI9 - EPM

Device (SPI9)
{
    Name (_HID, "QCOM021E")
    Alias(\_SB.PSUB, _SUB)
    Name (_UID, 9)
    Name (_DEP, Package(){\_SB_.PEP0,\_SB_.QGP1})
    Name (_CCA, 0)

    Method (_CRS)
    {
        Name (RBUF, ResourceTemplate()
        {
            Memory32Fixed(ReadWrite, 0xA80000, 0x00004000)
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive) {385}
        })
        Return (RBUF)
    }
}


//
//  PEP resources for buses
//
Scope(\_SB_.PEP0)
{
    Method(BSMD)
    {
        Return(BSRC)
    }

    Method(PQMD)
    {
        If (LLess(\_SB.SIDV,0x00020000))
        {
            Return(DFS1)
        }
        Else
        {
            Return(DFS2)
        }
    }

    Name (BSRC, Package (0x0C)
    {
                Package (0x04)
                {
                    "DEVICE", 
                    "\\_SB.UAR7", 
                    Package (0x12)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x09)
                        {
                            "FSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_BLSP_1", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x53724E00, 
                                    0x0682
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_BLSP_1", 
                                    0x08D24D00, 
                                    0x02FAF080
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_qupv3_wrap_0_m_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_qupv3_wrap_0_s_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_qupv3_wrap0_core_2x_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_qupv3_wrap0_core_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_qupv3_wrap0_s6_clk", 
                                    One
                                }
                            }
                        }, 

                        Package (0x09)
                        {
                            "FSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_qupv3_wrap_0_m_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_qupv3_wrap_0_s_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_qupv3_wrap0_s6_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_qupv3_wrap0_core_2x_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_qupv3_wrap0_core_clk", 
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
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_BLSP_1", 
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
                                    0x2D, 
                                    Zero, 
                                    One, 
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
                                    One, 
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
                                    One, 
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
                                    One, 
                                    Zero, 
                                    One, 
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
                                    0x2D, 
                                    Zero, 
                                    One, 
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
                                    One, 
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
                                    One, 
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
                                    One, 
                                    Zero, 
                                    One, 
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
                                    "gcc_qupv3_wrap0_s6_clk", 
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
                                    "gcc_qupv3_wrap0_s6_clk", 
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
                                    "gcc_qupv3_wrap0_s6_clk", 
                                    0x03, 
                                    0x01C20000, 
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
                                    "gcc_qupv3_wrap0_s6_clk", 
                                    0x03, 
                                    0x01E84800, 
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
                                    "gcc_qupv3_wrap0_s6_clk", 
                                    0x03, 
                                    0x02DC6C00, 
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
                                    "gcc_qupv3_wrap0_s6_clk", 
                                    0x03, 
                                    0x03D09000, 
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
                                    "gcc_qupv3_wrap0_s6_clk", 
                                    0x03, 
                                    0x04C4B400, 
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
                                    "gcc_qupv3_wrap0_s6_clk", 
                                    0x03, 
                                    0x05B8D800, 
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
                                    "gcc_qupv3_wrap0_s6_clk", 
                                    0x03, 
                                    0x061A8000, 
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
                                    "gcc_qupv3_wrap0_s6_clk", 
                                    0x03, 
                                    0x06ACFC00, 
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
                                    "gcc_qupv3_wrap0_s6_clk", 
                                    0x03, 
                                    0x07080000, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0D, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_qupv3_wrap0_s6_clk", 
                                    0x03, 
                                    0x07A12000, 
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

                Package (0x05)
                {
                    "DEVICE", 
                    0x02, 
                    "\\_SB.UARD", 
                    Package (0x12)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x0A)
                        {
                            "FSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_BLSP_2", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x53724E00, 
                                    0x0682
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_BLSP_2", 
                                    0x08D24D00, 
                                    0x02FAF080
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_qupv3_wrap_1_m_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_qupv3_wrap_1_s_ahb_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_qupv3_wrap1_s1_clk", 
                                    0x03, 
                                    0x00708000, 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_qupv3_wrap1_s1_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_qupv3_wrap1_core_2x_clk", 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_qupv3_wrap1_core_clk", 
                                    One
                                }
                            }
                        }, 

                        Package (0x09)
                        {
                            "FSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_qupv3_wrap_1_m_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_qupv3_wrap_1_s_ahb_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_qupv3_wrap1_s1_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_qupv3_wrap1_core_2x_clk", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x02)
                                {
                                    "gcc_qupv3_wrap1_core_clk", 
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
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_APPSS_PROC", 
                                    "ICBID_SLAVE_BLSP_2", 
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
                                    One, 
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
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x05, 
                                    Zero, 
                                    One, 
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
                                    One, 
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
                                    "gcc_qupv3_wrap1_s1_clk", 
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
                                    "gcc_qupv3_wrap1_s1_clk", 
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
                                    "gcc_qupv3_wrap1_s1_clk", 
                                    0x03, 
                                    0x01C20000, 
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
                                    "gcc_qupv3_wrap1_s1_clk", 
                                    0x03, 
                                    0x01E84800, 
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
                                    "gcc_qupv3_wrap1_s1_clk", 
                                    0x03, 
                                    0x02DC6C00, 
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
                                    "gcc_qupv3_wrap1_s1_clk", 
                                    0x03, 
                                    0x03D09000, 
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
                                    "gcc_qupv3_wrap1_s1_clk", 
                                    0x03, 
                                    0x04C4B400, 
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
                                    "gcc_qupv3_wrap1_s1_clk", 
                                    0x03, 
                                    0x05B8D800, 
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
                                    "gcc_qupv3_wrap1_s1_clk", 
                                    0x03, 
                                    0x061A8000, 
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
                                    "gcc_qupv3_wrap1_s1_clk", 
                                    0x03, 
                                    0x06ACFC00, 
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
                                    "gcc_qupv3_wrap1_s1_clk", 
                                    0x03, 
                                    0x07080000, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0D, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_qupv3_wrap1_s1_clk", 
                                    0x03, 
                                    0x07A12000, 
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
                    "\\_SB.I2C1", 
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
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_BLSP_1", 
                                "ICBID_SLAVE_EBI1", 
                                0x53724E00, 
                                0x0682
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_1", 
                                0x08D24D00, 
                                0x02FAF080
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_0_m_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_0_s_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_qupv3_wrap0_s0_clk", 
                                0x08, 
                                0x0124F800, 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_core_2x_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_core_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                Zero, 
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
                                One, 
                                One, 
                                One, 
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

                    Package (0x0B)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_0_m_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_0_s_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_s0_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_core_2x_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_core_clk", 
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
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                Zero, 
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
                                One, 
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
                    "\\_SB.I2C3", 
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
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_BLSP_1", 
                                "ICBID_SLAVE_EBI1", 
                                0x53724E00, 
                                0x0682
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_1", 
                                0x08D24D00, 
                                0x02FAF080
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_0_m_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_0_s_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_qupv3_wrap0_s2_clk", 
                                0x08, 
                                0x0124F800, 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_core_2x_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_core_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x1B, 
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
                                0x1C, 
                                One, 
                                One, 
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

                    Package (0x0B)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_0_m_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_0_s_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_s2_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_core_2x_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_core_clk", 
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
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x1B, 
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
                                0x1C, 
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
                    "\\_SB.I2C4", 
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
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_BLSP_1", 
                                "ICBID_SLAVE_EBI1", 
                                0x53724E00, 
                                0x0682
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_1", 
                                0x08D24D00, 
                                0x02FAF080
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_0_m_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_0_s_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_qupv3_wrap0_s3_clk", 
                                0x08, 
                                0x0124F800, 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_core_2x_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_core_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x29, 
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
                                0x2A, 
                                One, 
                                One, 
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

                    Package (0x0B)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_0_m_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_0_s_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_s3_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_core_2x_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_core_clk", 
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
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x29, 
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
                                0x2A, 
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

                    Package (0x0B)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_BLSP_1", 
                                "ICBID_SLAVE_EBI1", 
                                0x53724E00, 
                                0x0682
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_1", 
                                0x00E1D480, 
                                0x02FAF080
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_0_m_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_0_s_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_qupv3_wrap0_s4_clk", 
                                0x08, 
                                0x0124F800, 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_core_2x_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_core_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x59, 
                                One, 
                                0x02, 
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
                                0x5A, 
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

                    Package (0x0B)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_0_m_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_0_s_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_s4_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_core_2x_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_core_clk", 
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
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x59, 
                                Zero, 
                                0x02, 
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
                                0x5A, 
                                Zero, 
                                0x03, 
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
                    "\\_SB.I2C8", 
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
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_BLSP_1", 
                                "ICBID_SLAVE_EBI1", 
                                0x53724E00, 
                                0x0682
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_1", 
                                0x08D24D00, 
                                0x02FAF080
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_0_m_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_0_s_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_qupv3_wrap0_s7_clk", 
                                0x08, 
                                0x0124F800, 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_core_2x_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_core_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x5D, 
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
                                0x5E, 
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

                    Package (0x0B)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_0_m_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_0_s_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_s7_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_core_2x_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap0_core_clk", 
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
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x5D, 
                                Zero, 
                                0x03, 
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
                                0x5E, 
                                Zero, 
                                0x03, 
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
                    "\\_SB.IC11", 
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
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_BLSP_2", 
                                "ICBID_SLAVE_EBI1", 
                                0x53724E00, 
                                0x0682
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_2", 
                                0x08D24D00, 
                                0x02FAF080
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_m_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_s_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_qupv3_wrap1_s2_clk", 
                                0x08, 
                                0x0124F800, 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_2x_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x37, 
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
                                0x38, 
                                One, 
                                One, 
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

                    Package (0x0B)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_m_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_s_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_s2_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_2x_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_clk", 
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
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_2", 
                                Zero, 
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
                        }
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.IC12", 
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
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_BLSP_2", 
                                "ICBID_SLAVE_EBI1", 
                                0x53724E00, 
                                0x0682
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_2", 
                                0x08D24D00, 
                                0x02FAF080
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_m_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_s_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_qupv3_wrap1_s3_clk", 
                                0x08, 
                                0x0124F800, 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_2x_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_clk", 
                                One
                            }
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
                                0x03, 
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

                    Package (0x0B)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_m_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_s_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_s3_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_2x_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_clk", 
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
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_2", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x1F, 
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
                                0x20, 
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
                    "\\_SB.IC13", 
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
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_BLSP_2", 
                                "ICBID_SLAVE_EBI1", 
                                0x53724E00, 
                                0x0682
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_2", 
                                0x08D24D00, 
                                0x02FAF080
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_m_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_s_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_qupv3_wrap1_s4_clk", 
                                0x08, 
                                0x0124F800, 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_2x_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x31, 
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
                                0x32, 
                                One, 
                                One, 
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

                    Package (0x0B)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_m_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_s_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_s4_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_2x_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_clk", 
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
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_2", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x31, 
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
                                0x32, 
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
                    "\\_SB.IC15", 
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
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_BLSP_2", 
                                "ICBID_SLAVE_EBI1", 
                                0x53724E00, 
                                0x0682
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_2", 
                                0x08F0D180, 
                                0x02FAF080
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_m_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_s_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_qupv3_wrap1_s6_clk", 
                                0x08, 
                                0x0124F800, 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_2x_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x21, 
                                One, 
                                0x02, 
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
                                0x02, 
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

                    Package (0x0B)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_m_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_s_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_s6_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_2x_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_clk", 
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
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_2", 
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
                                0x22, 
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
                    "\\_SB.IC16", 
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
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_BLSP_2", 
                                "ICBID_SLAVE_EBI1", 
                                0x53724E00, 
                                0x0682
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_2", 
                                0x08D24D00, 
                                0x02FAF080
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_m_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_s_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_qupv3_wrap1_s7_clk", 
                                0x08, 
                                0x0124F800, 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_2x_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x51, 
                                One, 
                                0x02, 
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
                                0x52, 
                                One, 
                                0x02, 
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

                    Package (0x0B)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_m_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_s_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_s7_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_2x_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_clk", 
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
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_2", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x51, 
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
                                0x52, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }
    })

    Name (DFS1, Package (0x01)
    {
                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.SPI9", 
                    Package (0x0A)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_qupv3_wrap1_s0_clk", 
                                    0x03, 
                                    0x0124F800, 
                                    0x03
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
                                    "gcc_qupv3_wrap1_s0_clk", 
                                    0x03, 
                                    0x01E84800, 
                                    0x03
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
                                    "gcc_qupv3_wrap1_s0_clk", 
                                    0x03, 
                                    0x0249F000, 
                                    0x03
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
                                    "gcc_qupv3_wrap1_s0_clk", 
                                    0x03, 
                                    0x02DC6C00, 
                                    0x03
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
                                    "gcc_qupv3_wrap1_s0_clk", 
                                    0x03, 
                                    0x03D09000, 
                                    0x03
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
                                    "gcc_qupv3_wrap1_s0_clk", 
                                    0x03, 
                                    0x05B8D800, 
                                    0x03
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
                                    "gcc_qupv3_wrap1_s0_clk", 
                                    0x03, 
                                    0x05F5E100, 
                                    0x03
                                }
                            }
                        }
                    }, 

                    Package (0x0D)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_BLSP_2", 
                                "ICBID_SLAVE_EBI1", 
                                0x53724E00, 
                                0x0682
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_2", 
                                0x08D24D00, 
                                0x02FAF080
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_m_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_s_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_s0_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_2x_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x41, 
                                One, 
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
                                0x42, 
                                One, 
                                0x02, 
                                One, 
                                One, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x43, 
                                One, 
                                0x02, 
                                One, 
                                One, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x44, 
                                One, 
                                0x02, 
                                One, 
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

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x0D)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_m_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_s_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_s0_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_2x_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_clk", 
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
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_2", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x41, 
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
                                0x42, 
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
                                0x43, 
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
                                0x44, 
                                Zero, 
                                0x02, 
                                Zero, 
                                One, 
                                Zero
                            }
                        }
                    }
                }
    })
    
    Name (DFS2, Package (0x01)
    {
                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.SPI9", 
                    Package (0x0A)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_qupv3_wrap1_s0_clk", 
                                    0x03, 
                                    0x0124F800, 
                                    0x03
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
                                    "gcc_qupv3_wrap1_s0_clk", 
                                    0x03, 
                                    0x01E84800, 
                                    0x03
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
                                    "gcc_qupv3_wrap1_s0_clk", 
                                    0x03, 
                                    0x02DC6C00, 
                                    0x03
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
                                    "gcc_qupv3_wrap1_s0_clk", 
                                    0x03, 
                                    0x03D09000, 
                                    0x03
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
                                    "gcc_qupv3_wrap1_s0_clk", 
                                    0x03, 
                                    0x05B8D800, 
                                    0x03
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
                                    "gcc_qupv3_wrap1_s0_clk", 
                                    0x03, 
                                    0x05F5E100, 
                                    0x03
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
                                    "gcc_qupv3_wrap1_s0_clk", 
                                    0x03, 
                                    0x07270E00, 
                                    0x03
                                }
                            }
                        }
                    }, 

                    Package (0x0D)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_BLSP_2", 
                                "ICBID_SLAVE_EBI1", 
                                0x53724E00, 
                                0x0682
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_2", 
                                0x08D24D00, 
                                0x02FAF080
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_m_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_s_ahb_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_s0_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_2x_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x41, 
                                One, 
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
                                0x42, 
                                One, 
                                0x02, 
                                One, 
                                One, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x43, 
                                One, 
                                0x02, 
                                One, 
                                One, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x44, 
                                One, 
                                0x02, 
                                One, 
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

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x0D)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_m_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap_1_s_ahb_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_s0_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_2x_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_qupv3_wrap1_core_clk", 
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
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_BLSP_2", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x41, 
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
                                0x42, 
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
                                0x43, 
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
                                0x44, 
                                Zero, 
                                0x02, 
                                Zero, 
                                One, 
                                Zero
                            }
                        }
                    }
                }
    })
}
