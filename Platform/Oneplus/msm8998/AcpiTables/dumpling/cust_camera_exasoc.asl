//==============================================================================
//                           <cust_camera_exasoc.asl>
// DESCRIPTION
//   This file contains resources (such as memory address, GPIOs, etc.) and
//   methods needed by camera drivers for external components like sensors,flash etc.
//
//==============================================================================

Device (CAMP)
{
    Name (_DEP, Package (0x02)  // _DEP: Dependencies
    {
        \_SB.PEP0, 
        \_SB.PMIC
    })
    Name (_HID, "QCOM006C")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0x1B)  // _UID: Unique ID
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        Return (Zero)
    }

    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x0CA0C000,         // Address Base
                0x00003FFF,         // Address Length
                )
            Memory32Fixed (ReadWrite,
                0x0CA00000,         // Address Base
                0x00000047,         // Address Length
                )
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000147,
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
                    0x001D
                }
            GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x001B
                }
        })
        Return (RBUF) /* \_SB_.CAMP._CRS.RBUF */
    }

    Method (PLED, 0, NotSerialized)
    {
        Return (0x0102)
    }

    Method (INFO, 0, NotSerialized)
    {
        Return (0x00010000)
    }

    Method (PERF, 0, NotSerialized)
    {
        Name (EBUF, Package (0x01)
        {
            Package (0x03)
            {
                "COMPONENT", 
                Zero, 
                Package (0x05)
                {
                    "PSTATE_SET", 
                    Zero, 
                    Zero, 
                    "CAMP_CLK", 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        0x0124F800, 
                        0x0237A080
                    }
                }
            }
        })
        Return (EBUF) /* \_SB_.CAMP.PERF.EBUF */
    }
}

Device (CAMS)
{
    Name (_DEP, Package (0x03)  // _DEP: Dependencies
    {
        \_SB.CAMP, 
        \_SB.PEP0, 
        \_SB.MPCS
    })
    Name (_HID, "QCOM0042")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0x15)  // _UID: Unique ID
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        Return (Zero)
    }

    Name (PGID, Buffer (0x0A)
    {
        "\\_SB.CAMS"
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
        DEID = PGID /* \_SB_.CAMS.PGID */
        If (\_SB.ABD.AVBL)
        {
            \_SB.PEP0.FLD0 = DBUF /* \_SB_.CAMS.DBUF */
        }
    }

    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
    {
        DEID = Buffer (ESNL){}
        DVAL = 0x03
        DEID = PGID /* \_SB_.CAMS.PGID */
        If (\_SB.ABD.AVBL)
        {
            \_SB.PEP0.FLD0 = DBUF /* \_SB_.CAMS.DBUF */
        }
    }
}

Device (CAMI)
{
    Name (_DEP, Package (0x04)  // _DEP: Dependencies
    {
        \_SB.CAMP, 
        \_SB.PEP0, 
        \_SB.MPCS, 
        \_SB.CAMF
    })
    Name (_HID, "QCOM0044")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0x1C)  // _UID: Unique ID
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        Return (Zero)
    }

    Name (PGID, Buffer (0x0A)
    {
        "\\_SB.CAMI"
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
        DEID = PGID /* \_SB_.CAMI.PGID */
        If (\_SB.ABD.AVBL)
        {
            \_SB.PEP0.FLD0 = DBUF /* \_SB_.CAMI.DBUF */
        }
    }

    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
    {
        DEID = Buffer (ESNL){}
        DVAL = 0x03
        DEID = PGID /* \_SB_.CAMI.PGID */
        If (\_SB.ABD.AVBL)
        {
            \_SB.PEP0.FLD0 = DBUF /* \_SB_.CAMI.DBUF */
        }
    }
}

Device (CAMF)
{
    Name (_DEP, Package (0x04)  // _DEP: Dependencies
    {
        \_SB.CAMP, 
        \_SB.PEP0, 
        \_SB.MPCS, 
        \_SB.CAMS
    })
    Name (_HID, "QCOM0047")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0x1A)  // _UID: Unique ID
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        Return (Zero)
    }

    Name (PGID, Buffer (0x0A)
    {
        "\\_SB.CAMF"
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
        DEID = PGID /* \_SB_.CAMF.PGID */
        If (\_SB.ABD.AVBL)
        {
            \_SB.PEP0.FLD0 = DBUF /* \_SB_.CAMF.DBUF */
        }
    }

    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
    {
        DEID = Buffer (ESNL){}
        DVAL = 0x03
        DEID = PGID /* \_SB_.CAMF.PGID */
        If (\_SB.ABD.AVBL)
        {
            \_SB.PEP0.FLD0 = DBUF /* \_SB_.CAMF.DBUF */
        }
    }
}
