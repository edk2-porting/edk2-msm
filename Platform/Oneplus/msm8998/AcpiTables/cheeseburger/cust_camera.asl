//==============================================================================
//                           <cust_camera.asl>
// DESCRIPTION
//   This file contains resources (such as memory address, GPIOs, etc.) and
//   methods needed by camera drivers.
//
//==============================================================================

Include("cust_camera_exasoc.asl")

Device (MPCS)
{
    Name (_DEP, Package (0x03)  // _DEP: Dependencies
    {
        \_SB.PEP0, 
        \_SB.PMIC, 
        \_SB.CAMP
    })
    Name (_HID, "QCOM00ED")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0x18)  // _UID: Unique ID
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        Return (Zero)
    }

    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x0CA30000,         // Address Base
                0x000003FF,         // Address Length
                )
            Memory32Fixed (ReadWrite,
                0x0CA30400,         // Address Base
                0x000003FF,         // Address Length
                )
            Memory32Fixed (ReadWrite,
                0x0CA30800,         // Address Base
                0x000003FF,         // Address Length
                )
            Memory32Fixed (ReadWrite,
                0x0CA30C00,         // Address Base
                0x000003FF,         // Address Length
                )
            Memory32Fixed (ReadWrite,
                0x0CA34000,         // Address Base
                0x00000FFF,         // Address Length
                )
            Memory32Fixed (ReadWrite,
                0x0CA35000,         // Address Base
                0x00000FFF,         // Address Length
                )
            Memory32Fixed (ReadWrite,
                0x0CA36000,         // Address Base
                0x00000FFF,         // Address Length
                )
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000148,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000149,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x0000014A,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x0000014B,
            }
        })
        Return (RBUF) /* \_SB_.MPCS._CRS.RBUF */
    }

    Method (MPHW, 0, NotSerialized)
    {
        Return (0x3823)
    }

    Method (MPCN, 0, NotSerialized)
    {
        Return (0x00A28000)
    }
}

Device (JPGE)
{
    Name (_DEP, Package (0x03)  // _DEP: Dependencies
    {
        \_SB.CAMP, 
        \_SB.MMU2, 
        \_SB.PEP0
    })
    Name (_HID, "QCOM0074")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0x17)  // _UID: Unique ID
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        Return (Zero)
    }

    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x0CA1C000,         // Address Base
                0x00003FFF,         // Address Length
                )
            Memory32Fixed (ReadWrite,
                0x0CA60000,         // Address Base
                0x00002FFF,         // Address Length
                )
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x0000015C,
            }
            Memory32Fixed (ReadWrite,
                0x0CAA0000,         // Address Base
                0x00003FFF,         // Address Length
                )
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000150,
            }
        })
        Return (RBUF) /* \_SB_.JPGE._CRS.RBUF */
    }

    Method (PERF, 0, NotSerialized)
    {
        Name (EBUF, Package (0x02)
        {
            Package (0x04)
            {
                "COMPONENT", 
                Zero, 
                Package (0x05)
                {
                    "PSTATE_SET", 
                    Zero, 
                    Zero, 
                    "JPEG0_CLK", 
                    Package (0x06)
                    {
                        "PSTATE", 
                        Zero, 
                        0x1C9C3800, 
                        0x1312D000, 
                        0x08F0D180, 
                        0x047868C0
                    }
                }, 

                Package (0x05)
                {
                    "PSTATE_SET", 
                    Zero, 
                    One, 
                    "JPEG0_BW", 
                    Package (0x18)
                    {
                        "PSTATE", 
                        Zero, 
                        0xEE6B2800, 
                        0xD09DC300, 
                        0xC4B20100, 
                        0xB8C63F00, 
                        0xACDA7D00, 
                        0xA0EEBB00, 
                        0x9502F900, 
                        0x89173700, 
                        0x7D2B7500, 
                        0x713FB300, 
                        0x6553F100, 
                        0x59682F00, 
                        0x4D7C6D00, 
                        0x4190AB00, 
                        0x35A4E900, 
                        0x29B92700, 
                        0x1DCD6500, 
                        0x17D78400, 
                        0x11E1A300, 
                        0x0BEBC200, 
                        0x05F5E100, 
                        Zero
                    }
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                One, 
                Package (0x05)
                {
                    "PSTATE_SET", 
                    Zero, 
                    Zero, 
                    "DMA_CLK", 
                    Package (0x05)
                    {
                        "PSTATE", 
                        Zero, 
                        0x1C9C3800, 
                        0x1312D000, 
                        0x047868C0
                    }
                }, 

                Package (0x05)
                {
                    "PSTATE_SET", 
                    Zero, 
                    One, 
                    "DMA_BW", 
                    Package (0x06)
                    {
                        "PSTATE", 
                        Zero, 
                        0x376EAC80, 
                        0x2625A000, 
                        0x07A12000, 
                        Zero
                    }
                }
            }
        })
        Return (EBUF) /* \_SB_.JPGE.PERF.EBUF */
    }
}

Device (VFE0)
{
    Name (_DEP, Package (0x03)  // _DEP: Dependencies
    {
        \_SB.MMU1, 
        \_SB.PEP0, 
        \_SB.CAMP
    })
    Name (_HID, "QCOM0040")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0x16)  // _UID: Unique ID
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        Return (Zero)
    }

    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x0CA31000,         // Address Base
                0x00000BFF,         // Address Length
                )
            Memory32Fixed (ReadWrite,
                0x0CA40000,         // Address Base
                0x00001FFF,         // Address Length
                )
            Memory32Fixed (ReadWrite,
                0x0CA18000,         // Address Base
                0x00003FFF,         // Address Length
                )
            Memory32Fixed (ReadWrite,
                0x0CA04000,         // Address Base
                0x00003FFF,         // Address Length
                )
            Memory32Fixed (ReadWrite,
                0x0CA10000,         // Address Base
                0x00003FFF,         // Address Length
                )
            Memory32Fixed (ReadWrite,
                0x170F7000,         // Address Base
                0x00000090,         // Address Length
                )
            Memory32Fixed (ReadWrite,
                0x0CA14000,         // Address Base
                0x00003FFF,         // Address Length
                )
            Memory32Fixed (ReadWrite,
                0x0CAA4000,         // Address Base
                0x000007FF,         // Address Length
                )
            Memory32Fixed (ReadWrite,
                0x0CAA5000,         // Address Base
                0x000003FF,         // Address Length
                )
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x0000015A,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000155,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000146,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x0000015B,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000145,
            }
        })
        Return (RBUF) /* \_SB_.VFE0._CRS.RBUF */
    }

    Method (PERF, 0, NotSerialized)
    {
        Name (EBUF, Package (0x03)
        {
            Package (0x04)
            {
                "COMPONENT", 
                Zero, 
                Package (0x05)
                {
                    "PSTATE_SET", 
                    Zero, 
                    Zero, 
                    "VFE0_CLK", 
                    Package (0x14)
                    {
                        "PSTATE", 
                        One, 
                        0x23C34600, 
                        One, 
                        0x22551000, 
                        One, 
                        0x1C9C3800, 
                        0x02, 
                        0x18148D00, 
                        0x02, 
                        0x16E36000, 
                        One, 
                        0x1312D000, 
                        One, 
                        0x11E1A300, 
                        One, 
                        0x0BEBC200, 
                        One, 
                        Zero, 
                        One
                    }
                }, 

                Package (0x05)
                {
                    "PSTATE_SET", 
                    Zero, 
                    One, 
                    "VFE0_BW", 
                    Package (0x18)
                    {
                        "PSTATE", 
                        Zero, 
                        0xEE6B2800, 
                        0xD09DC300, 
                        0xC4B20100, 
                        0xB8C63F00, 
                        0xACDA7D00, 
                        0xA0EEBB00, 
                        0x9502F900, 
                        0x89173700, 
                        0x7D2B7500, 
                        0x713FB300, 
                        0x6553F100, 
                        0x59682F00, 
                        0x4D7C6D00, 
                        0x4190AB00, 
                        0x35A4E900, 
                        0x29B92700, 
                        0x1DCD6500, 
                        0x17D78400, 
                        0x11E1A300, 
                        0x0BEBC200, 
                        0x05F5E100, 
                        Zero
                    }
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                One, 
                Package (0x05)
                {
                    "PSTATE_SET", 
                    Zero, 
                    Zero, 
                    "VFE1_CLK", 
                    Package (0x14)
                    {
                        "PSTATE", 
                        One, 
                        0x23C34600, 
                        One, 
                        0x22551000, 
                        One, 
                        0x1C9C3800, 
                        0x02, 
                        0x18148D00, 
                        0x02, 
                        0x16E36000, 
                        One, 
                        0x1312D000, 
                        One, 
                        0x11E1A300, 
                        One, 
                        0x0BEBC200, 
                        One, 
                        Zero, 
                        One
                    }
                }, 

                Package (0x05)
                {
                    "PSTATE_SET", 
                    Zero, 
                    One, 
                    "VFE1_BW", 
                    Package (0x18)
                    {
                        "PSTATE", 
                        Zero, 
                        0xEE6B2800, 
                        0xD09DC300, 
                        0xC4B20100, 
                        0xB8C63F00, 
                        0xACDA7D00, 
                        0xA0EEBB00, 
                        0x9502F900, 
                        0x89173700, 
                        0x7D2B7500, 
                        0x713FB300, 
                        0x6553F100, 
                        0x59682F00, 
                        0x4D7C6D00, 
                        0x4190AB00, 
                        0x35A4E900, 
                        0x29B92700, 
                        0x1DCD6500, 
                        0x17D78400, 
                        0x11E1A300, 
                        0x0BEBC200, 
                        0x05F5E100, 
                        Zero
                    }
                }
            }, 

            Package (0x05)
            {
                "COMPONENT", 
                0x02, 
                Package (0x05)
                {
                    "PSTATE_SET", 
                    Zero, 
                    Zero, 
                    "CPP_CLK", 
                    Package (0x12)
                    {
                        "PSTATE", 
                        One, 
                        0x23C34600, 
                        One, 
                        0x22551000, 
                        One, 
                        0x1C9C3800, 
                        One, 
                        0x18148D00, 
                        0x02, 
                        0x16E36000, 
                        0x02, 
                        0x0BEBC200, 
                        One, 
                        0x05F5E100, 
                        One, 
                        Zero, 
                        One
                    }
                }, 

                Package (0x05)
                {
                    "PSTATE_SET", 
                    Zero, 
                    One, 
                    "CPP_BW", 
                    Package (0x18)
                    {
                        "PSTATE", 
                        Zero, 
                        0xEE6B2800, 
                        0xD09DC300, 
                        0xC4B20100, 
                        0xB8C63F00, 
                        0xACDA7D00, 
                        0xA0EEBB00, 
                        0x9502F900, 
                        0x89173700, 
                        0x7D2B7500, 
                        0x713FB300, 
                        0x6553F100, 
                        0x59682F00, 
                        0x4D7C6D00, 
                        0x4190AB00, 
                        0x35A4E900, 
                        0x29B92700, 
                        0x1DCD6500, 
                        0x17D78400, 
                        0x11E1A300, 
                        0x0BEBC200, 
                        0x05F5E100, 
                        Zero
                    }
                }, 

                Package (0x05)
                {
                    "PSTATE_SET", 
                    One, 
                    Zero, 
                    "AHB_CLK", 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        0x04C4B400, 
                        0x02625A00
                    }
                }
            }
        })
        Return (EBUF) /* \_SB_.VFE0.PERF.EBUF */
    }
}
