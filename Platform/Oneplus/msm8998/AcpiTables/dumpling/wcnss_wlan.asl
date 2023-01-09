Device (QWLN)
{
    Name (_ADR, 0)
    Name(_PRW, Package() {0,0})    // wakeable from S0
    Name(_S0W, 2)                  // S0 should put device in D2 for wake
    Name(_S4W, 2)                  // all other Sx (just in case) should also wake from D2
    Name(_PRR, Package(0x1) { \_SB.AMSS.QWLN.WRST })  // Power resource reference for device reset and recovery.

    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        Return (0x0F)
    }

    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x18800000,         // Address Base
                0x00800000,         // Address Length
                )
            Memory32Fixed (ReadWrite,
                0x010AC000,         // Address Base
                0x00000020,         // Address Length
                )
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x000001BD,
            }
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x000001BE,
            }
            Interrupt (ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake, ,, )
            {
                0x000001BF,
            }
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x000001C0,
            }
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x000001C1,
            }
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x000001C2,
            }
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x000001C4,
            }
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x000001C5,
            }
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x000001C6,
            }
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x000001C7,
            }
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x000001C8,
            }
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x000001C9,
            }
        })
        Return (RBUF) /* \_SB_.AMSS.QWLN._CRS.RBUF */
    }

    // wlan msa memory size
    Method (WMSA, 0, NotSerialized)
    {
        Return (Package (0x01)
        {
            0x100000
        })
    }

    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
    {
    }

    Method (_PS2, 0, NotSerialized)  // _PS2: Power State 2
    {
    }

    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
    {
    }

    OperationRegion (WOPR, 0x80, Zero, 0x10)
    Field (WOPR, DWordAcc, NoLock, Preserve)
    {
        Offset (0x04), 
        WTRG,   32
    }

    PowerResource(WRST, 0x5, 0x0)
    {
        //
        // Dummy _ON, _OFF, and _STA methods. All power resources must have these
        // three defined.
        //
        Method(_ON, 0x0, NotSerialized)
        {
        }
        Method(_OFF, 0x0, NotSerialized)
        {
        }
        Method(_STA, 0x0, NotSerialized)
        {
            Return(0xf)
        }
        Method(_RST, 0x0, NotSerialized)
        {
            WTRG = 0xABCD
        }
    }
}

//agent driver of wlan for supporting windows thermal framework
Scope(\_SB)
{
    Device (COEX)
    {
        Name (_HID, "QCOM0094")
        Alias(\_SB.PSUB, _SUB)
    }
}
