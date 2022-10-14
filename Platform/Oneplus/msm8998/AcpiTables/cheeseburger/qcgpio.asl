//
// TLMM controller.
//
Device (GIO0)
{
    Name (_HID, "QCOM0016")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (One)  // _DEP: Dependencies
    {
        \_SB.I2C7
    })
    Name (_UID, Zero)  // _UID: Unique ID
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x03400000,         // Address Base
                0x00C00000,         // Address Length
                )
            Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
            {
                0x000000F0,
            }
            Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
            {
                0x000000F0,
            }
            Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
            {
                0x000000F0,
            }
            GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x000F
                }
            GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0010
                }
            GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0013
                }
            GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x001E
                }
            GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x003F
                }
        })
        Return (RBUF) /* \_SB_.GIO0._CRS.RBUF */
    }

    // ACPI method to return Num pins
    Method (OFNI, 0, NotSerialized)
    {
        Name (RBUF, Buffer (0x02)
        {
                0x96, 0x00                                       // ..
        })
        Return (RBUF) /* \_SB_.GIO0.OFNI.RBUF */
    }

    Name (GABL, Zero)
    Method (_REG, 2, NotSerialized)  // _REG: Region Availability
    {
        If ((Arg0 == 0x08))
        {
            GABL = Arg1
        }
    }

    OperationRegion (CP22, SystemMemory, 0x03D22000, 0x10)
    Field (CP22, DWordAcc, NoLock, Preserve)
    {
        PI3C,   32, 
        PIN3,   32, 
        PI3N,   32, 
        PI3S,   32
    }

    // ACPI event-based notification method for detecting HDMI hot plug-in event
    Name (_AEI, ResourceTemplate ()  // _AEI: ACPI Event Interrupts
    {
        GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullDown, 0x01F4,
            "\\_SB.GIO0", 0x00, ResourceConsumer, ,
            )
            {   // Pin list
                0x0022
            }
        GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
            "\\_SB.GIO0", 0x00, ResourceConsumer, ,
            )
            {   // Pin list
                0x0028
            }
        GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionNone,
            "\\_SB.GIO0", 0x00, ResourceConsumer, ,
            )
            {   // Pin list
                0x007F,
                0x0081
            }
    })
    Method (_E22, 0, NotSerialized)  // _Exx: Edge-Triggered GPE
    {
        Local0 = HPDS ()
        If ((Local0 == One))
        {
            // Notify event ID - 0x92 to GFX driver on a hot plug-in event
            Notify (\_SB.GPU0, 0x92) // Device-Specific
        }

        \_SB.I2C7.HHPD (Local0)
    }

    Method (HPDS, 0, NotSerialized)
    {
        Local0 = PIN3 /* \_SB_.GIO0.PIN3 */
        Local0 &= One
        Return (Local0)
    }
}
