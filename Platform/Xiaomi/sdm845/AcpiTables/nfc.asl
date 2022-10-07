//
// NFC entry.
//
Device(NFCD)
{
    Name(_HID, "NXP1001")
    Name(_CID, "ACPI\NXP1001")
	Alias(\_SB.PSUB, _SUB)
    Name(_CRS, ResourceTemplate()
    {
        I2CSerialBus(0x28, ControllerInitiated, 400000, AddressingMode7Bit, "\\_SB.I2C4", 0, ResourceConsumer, , )
        GpioInt(Level, ActiveHigh, Exclusive, PullDefault, 0, "\\_SB.GIO0", 0, ResourceConsumer, , ) {63}
    })
// ESE SPI GPIO
    Name(NFCS, ResourceTemplate()
    {
       GpioIO(Exclusive, PullDefault, 0, 0, IoRestrictionNone, "\\_SB.GIO0", 0, ResourceConsumer, , ) {116}
    })
// NFCC VEN GPIO
    Name(NFCP, ResourceTemplate()
    {
       GpioIO(Exclusive, PullDefault, 0, 0, IoRestrictionNone, "\\_SB.GIO0", 0, ResourceConsumer, , ) {12}
    })
        Scope(GIO0)
        {
           OperationRegion(NFPO, GeneralPurposeIO, Zero, One)
        }
        Field(\_SB_.GIO0.NFPO, ByteAcc, NoLock, Preserve)
        {
            Connection(\_SB_.NFCD.NFCP),
            MGPE, 1
        }
           Method(POON, 0x0, NotSerialized)
            {
                Store(One, MGPE)
            }
            Method(POOF, 0x0, NotSerialized)
            {
                Store(Zero, MGPE)
            }
//NFCC FW DOWNLOAD GPIO
    Name(NFCF, ResourceTemplate()
    {
        GpioIO(Exclusive, PullDefault, 0, 0, IoRestrictionNone, "\\_SB.GIO0", 0, ResourceConsumer, , ) {88} // Download
    })
        Scope(GIO0)
        {
            OperationRegion(NFFO, GeneralPurposeIO, Zero, One)
        }
        Field(\_SB_.GIO0.NFFO, ByteAcc, NoLock, Preserve)
        {
            Connection(\_SB_.NFCD.NFCF),
            MGFE, 1
        }
            Method(FWON, 0x0, NotSerialized)
            {
                Store(One, MGFE)
            }
            Method(FWOF, 0x0, NotSerialized)
            {
                Store(Zero, MGFE)
            }
            Method(_DSM, 0x4, NotSerialized)
            {
                Store("Method NFC _DSM begin", Debug)
                If(LEqual(Arg0, Buffer(0x10)
                {
                    0xc4, 0xf6, 0xe7, 0xa2, 0x38, 0x96, 0x85, 0x44, 0x9f, 0x12, 0x6b, 0x4e,
                    0x20, 0xb6, 0x0d, 0x63
                }))
                {
                   If(LEqual(Arg2, Zero))
                   {
                        Store("Method NFC _DSM QUERY", Debug)
                        If(LEqual(Arg1, One))
                        {
                            \_SB_.NFCD.POOF()
                            Sleep(0x14)
                            Return(Buffer(One)
                            {
                                0x0f
                            })
                        }
                    }
                   If(LEqual(Arg2, 0x2))
                   {
                        Store("Method NFC _DSM SETPOWERMODE", Debug)
                        If(LEqual(Arg3, One))
                        {
                            \_SB_.NFCD.POON()
                             Sleep(0x14)
                        }
                        If(LEqual(Arg3, Zero))
                        {
                            \_SB_.NFCD.POOF()
                            Sleep(0x14)
                        }
                    }
                    If(LEqual(Arg2, One))
                    {
                        Store("Method NFC _DSM SETFWMODE", Debug)
//
// Set the firmware mode to ON.
//
                        If(LEqual(Arg3, One))
                        {
                            \_SB_.NFCD.FWON()
//
// Provide any delay required by the controller before toggling the power GPIO line.
//
                        Sleep(0x14)
                            \_SB_.NFCD.POOF()
                            Sleep(0x14)
                            \_SB_.NFCD.POON()
                            Sleep(0x14)
                        }
//
// Set the firmware mode to OFF.
//
                        If(LEqual(Arg3, Zero))
                        {
                            \_SB_.NFCD.FWOF()
                            Sleep(0x14)
                            \_SB_.NFCD.POOF()
                            Sleep(0x14)
                            \_SB_.NFCD.POON()
                            Sleep(0x14)
                        }
                    } 
                        If(LEqual(Arg2, 0x3))
                        {
                            Store("Method NFC _DSM EEPROM Config", Debug)
                            Return(Buffer(0x13)
                            {
                                0x9c, 0x1f, 0x38, 0x19, 0xa8, 0xb9, 0x4b, 0xab, 0xa1, 0xba, 0xd0, 0x20,
                                0x76, 0x88, 0x2a, 0xe0, 0x03, 0x01, 0x11
                            })
                        }
                }
            }
//PEP Proxy Support
    Name(PGID, Buffer(10) {"\\_SB.NFCD"}) // Device ID buffer - PGID( Pep given ID )
    Name(DBUF, Buffer(DBFL) {})           // Device ID buffer - PGID( Pep given ID )
        CreateByteField(DBUF, 0x0, STAT)      // STATUS 1 BYTE
                                          // HIDDEN 1 BYTE ( SIZE )
        CreateByteField(DBUF, 2, DVAL )       // Packet value, 1 BYTES Device Status
        CreateField(DBUF, 24, 160, DEID)      // Device ID, 20 BYTES(160 Bits)
            Method (_S1D, 0) { Return (3) }     // S1 => D3
            Method (_S2D, 0) { Return (3) }     // S2 => D3
            Method (_S3D, 0) { Return (3) }     // S3 => D3

            Method(_PS0, 0x0, NotSerialized) 
            {
                Store(Buffer(ESNL){}, DEID)
                Store(0, DVAL)
                Store(PGID, DEID)
                    If(\_SB.ABD.AVBL)
                    {
                        Store(DBUF, \_SB.PEP0.FLD0)
                    }
            }
            Method(_PS3, 0x0, NotSerialized) 
            {
                Store(Buffer(ESNL){}, DEID)
                Store(3, DVAL)
                Store(PGID, DEID)
                    If(\_SB.ABD.AVBL)
                    {
                        Store(DBUF, \_SB.PEP0.FLD0)
                    }
            }
}
