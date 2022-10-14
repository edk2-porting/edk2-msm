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
    Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
    {
        ToPLD (
            PLD_Revision           = 0x2,
            PLD_IgnoreColor        = 0x1,
            PLD_Red                = 0x0,
            PLD_Green              = 0x0,
            PLD_Blue               = 0x0,
            PLD_Width              = 0x0,
            PLD_Height             = 0x0,
            PLD_UserVisible        = 0x1,
            PLD_Dock               = 0x0,
            PLD_Lid                = 0x0,
            PLD_Panel              = "BACK",
            PLD_VerticalPosition   = "CENTER",
            PLD_HorizontalPosition = "LEFT",
            PLD_Shape              = "VERTICALRECTANGLE",
            PLD_GroupOrientation   = 0x0,
            PLD_GroupToken         = 0x0,
            PLD_GroupPosition      = 0x1,
            PLD_Bay                = 0x0,
            PLD_Ejectable          = 0x0,
            PLD_EjectRequired      = 0x0,
            PLD_CabinetNumber      = 0x0,
            PLD_CardCageNumber     = 0x0,
            PLD_Reference          = 0x0,
            PLD_Rotation           = 0x0,
            PLD_Order              = 0x0,
            PLD_VerticalOffset     = 0xFFFF,
            PLD_HorizontalOffset   = 0xFFFF)

    })
    Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
    {
        One, 
        0x09, 
        Zero, 
        Zero
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
    //In order to use windbg debugging, USB is disabled
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        Return (Zero)
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
