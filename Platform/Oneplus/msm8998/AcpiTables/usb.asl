Device (USB0)
{
    Name (_DEP, Package (One)  // _DEP: Dependencies
    {
        \_SB.PEP0
    })
    Name (_HID, "QCOM2430")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_CID, "ACPI\\PNP0D15")  // _CID: Compatible ID
    Name (_UID, One)  // _UID: Unique ID
    Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
    Name (_ADR, Zero)  // _ADR: Address
    Name (_S0W, 0x03)  // _S0W: S0 Device Wake State

    // _PLD as defined in the ACPI spec. The GroupToken and GroupPosition are used to
    // derive a unique "Connector ID". The other fields are not really important.
    Name(_PLD, Package()
    {
        Buffer()
        {
            0x82,                   // Revision 2, ignore color.
            0x00,0x00,0x00,         // Color (ignored).
            0x00,0x00,0x00,0x00,    // Width and height.
            0x69,                   // User visible; Back panel; VerticalPos:Center.
            0x0c,                   // HorizontalPos:0; Shape:Vertical Rectangle; GroupOrientation:0.
            0x80,0x00,              // Group Token:0; Group Position:1; So Connector ID is 1.
            0x00,0x00,0x00,0x00,    // Not ejectable.
            0xFF,0xFF,0xFF,0xFF     // Vert. and horiz. offsets not supplied.
        }
    })
    // _UPC as defined in the ACPI spec.
    Name(_UPC, Package()
    {
        0x01,                       // Port is connectable.
        0x09,                       // Connector type: Type C connector - USB2 and SS with switch.
        0x00000000,                 // Reserved0 - must be zero.
        0x00000000                  // Reserved1 - must be zero.
    })
    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
    {
        Memory32Fixed (ReadWrite,
            0x0A800000,         // Address Base
            0x000FFFFF,         // Address Length
            )
        Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
        {
            0x000000A3,
        }
        Interrupt (ResourceConsumer, Level, ActiveHigh, SharedAndWake, ,, )
        {
            0x0000017B,
        }
        Interrupt (ResourceConsumer, Level, ActiveHigh, SharedAndWake, ,, )
        {
            0x00000113,
        }
    })
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        Return (0x0F)
    }

    Method (CCVL, 0, NotSerialized)
    {
        Return (\_SB.CCST)
    }

    Method (HSEN, 0, NotSerialized)
    {
        Return (\_SB.HSFL)
    }
}

// Holds the CC OUT Status
// 0 -> CC1
// 1 -> CC2
// 2 -> CC Open
Name(CCST, Buffer(){0x02})

// Holds the HS Only enumeration Flag for display alternate mode
// 0 -> Super Speed Controller Enumeration support
// 1 -> High Speed Controller Enumeration support
// 2 -> Invalid
Name(HSFL, Buffer(){0x00})
