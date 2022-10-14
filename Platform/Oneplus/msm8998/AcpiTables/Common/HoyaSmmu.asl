// SMMU Driver
Device (MMU0)
{
    Name (_HID, "QCOM0011")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, Zero)  // _UID: Unique ID
    Name (_DEP, Package (0x01)  // _DEP: Dependencies
    {
        \_SB.PEP0
    })
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Return (ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x0CD00000,         // Address Base
                0x00040000,         // Address Length
                )
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000128,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000127,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x0000012A,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x0000012B,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x0000012C,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000114,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000115,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000117,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000118,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000119,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x0000011A,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x0000011B,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x0000011C,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x0000011D,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x0000011E,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x0000011F,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000120,
            }
        })
    }
}

Device (MMU1)
{
    Name (_HID, "QCOM0011")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0x03)  // _UID: Unique ID
    Name (_DEP, Package (0x01)  // _DEP: Dependencies
    {
        \_SB.PEP0
    })
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Return (ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x05040000,         // Address Base
                0x0000E000,         // Address Length
                )
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x0000016E,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000169,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x0000016A,
            }
        })
    }
}

Device (MMU2)
{
    Name (_HID, "QCOM0011")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0x07)  // _UID: Unique ID
    Name (_DEP, Package (0x01)  // _DEP: Dependencies
    {
        \_SB.PEP0
    })
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Return (ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x05100000,         // Address Base
                0x00040000,         // Address Length
                )
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000000A0,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000102,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000001A9,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000001AA,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000001AB,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000001AC,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000001AD,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000001AE,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000001AF,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000001B0,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000001B1,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000001B2,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000001B3,
            }
        })
    }
}

Device (MMU3)
{
    Name (_HID, "QCOM0011")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0x08)  // _UID: Unique ID
    Name (_DEP, Package (0x01)  // _DEP: Dependencies
    {
        \_SB.PEP0
    })
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Return (ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x016C0000,         // Address Base
                0x00040000,         // Address Length
                )
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x0000019D,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000195,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000196,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000197,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000198,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000199,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x0000019A,
            }
        })
    }
}
