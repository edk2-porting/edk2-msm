Include ("novatek_focaltech_resources.asl")

Device (TSC1)
{
    Name (_HID, "FTTS8719")  // _HID: Hardware ID
    //Name (_HID, "TEST3330")  // _HID: Hardware ID
    Name (_HRV, One)  // _HRV: Hardware Revision
    Name (_ADR, Zero)  // _ADR: Address
    Name (_UID, One)  // _UID: Unique ID
    Name (_DEP, Package (0x03)  // _DEP: Dependencies
    {
        PEP0, 
        GIO0, 
        IC15
    })
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            I2cSerialBusV2 (0x0038, ControllerInitiated, 0x00061A80,
                AddressingMode7Bit, "\\_SB.IC15",
                0x00, ResourceConsumer, , Exclusive,
                )
            GpioInt (Edge, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x001F
                }
        })
        Return (RBUF) /* \_SB_.TSC1._CRS.RBUF */
    }

    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        While (One)
        {
            Name (_T_0, Buffer (One)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
            {
                    0x00                                             // .
            })
            CopyObject (ToBuffer (Arg0), _T_0) /* \_SB_.TSC1._DSM._T_0 */
            If ((_T_0 == ToUUID ("3cdff6f7-4267-4555-ad05-b30a3d8938de") /* HID I2C Device */))
            {
                While (One)
                {
                    Name (_T_1, Zero)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                    _T_1 = ToInteger (Arg2)
                    If ((_T_1 == Zero))
                    {
                        While (One)
                        {
                            Name (_T_2, Zero)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_2 = ToInteger (Arg1)
                            If ((_T_2 == One))
                            {
                                Return (Buffer (One)
                                {
                                        0x03                                             // .
                                })
                            }
                            Else
                            {
                                Return (Buffer (One)
                                {
                                        0x00                                             // .
                                })
                            }

                            Break
                        }
                    }
                    ElseIf ((_T_1 == One))
                    {
                        Debug = "Method _DSM Function HID"
                        Return (0x20)
                    }
                    Else
                    {
                    }

                    Break
                }
            }
            Else
            {
                Return (Buffer (One)
                {
                        0x00                                             // .
                })
            }

            Break
        }
    }

    Name (PGID, Buffer (0x0A)
    {
        "\\_SB.TSC1"
    })
    Name (DBUF, Buffer (DBFL){})
    CreateByteField (DBUF, Zero, STAT)
    CreateByteField (DBUF, 0x02, DVAL)
    CreateField (DBUF, 0x18, 0xA0, DEID)
    Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
    {
        Return (0x03)
    }

    Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
    {
        Return (0x03)
    }

    Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
    {
        Return (0x03)
    }

    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
    {
        DEID = Buffer (ESNL){}
        DVAL = Zero
        DEID = PGID /* \_SB_.TSC1.PGID */
        If (^^ABD.AVBL)
        {
            ^^PEP0.FLD0 = DBUF /* \_SB_.TSC1.DBUF */
        }
    }

    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
    {
        DEID = Buffer (ESNL){}
        DVAL = 0x03
        DEID = PGID /* \_SB_.TSC1.PGID */
        If (^^ABD.AVBL)
        {
            ^^PEP0.FLD0 = DBUF /* \_SB_.TSC1.DBUF */
        }
    }
}
