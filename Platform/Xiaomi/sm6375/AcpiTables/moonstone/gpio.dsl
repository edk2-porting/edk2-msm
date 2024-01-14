        Device (GIO0)
        {
            Name (_HID, "QCOM050D")  // _HID: Hardware ID
            Name (_CID, "QCOMFFE3")  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Alias (\_SB.PSUB, _SUB)
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00400000,         // Address Base
                        0x00C00000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                    {
                        0x00000103,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                    {
                        0x00000103,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                    {
                        0x00000103,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                    {
                        0x00000249,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Shared, ,, )
                    {
                        0x0000025B,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                    {
                        0x00000259,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000022C,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000024E,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000292,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000239,
                    }
                })
                Return (RBUF) /* \_SB_.GIO0._CRS.RBUF */
            }

            Method (OFNI, 0, NotSerialized)
            {
                Name (RBUF, Buffer (0x02)
                {
                     0xAF, 0x00                                       // ..
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

            Name (_AEI, ResourceTemplate ()  // _AEI: ACPI Event Interrupts
            {
                GpioInt (Edge, ActiveHigh, Exclusive, PullDown, 0x01F4,
                    "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x00BD
                    }
            })
            Method (_EBD, 0, NotSerialized)  // _Exx: Edge-Triggered GPE, xx=0x00-0xFF
            {
                Notify (\_SB.GPU0, 0x92) // Device-Specific
            }
        }