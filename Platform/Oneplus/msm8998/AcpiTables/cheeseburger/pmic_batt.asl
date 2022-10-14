// This file contains the Power Management IC (PMIC)
// ACPI device definitions, configuration and look-up tables.
//

//
//PMIC Type-C Controler Driver (PMICTCC) Driver
//
Device (PTCC)
{
    Name (_HID, "QCOM00EB")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (One)  // _DEP: Dependencies
    {
        \_SB.PMIC
    })
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        Return (Zero)
    }

    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            GpioInt (Edge, ActiveHigh, SharedAndWake, PullNone, 0x0000,
                "\\_SB.PM02", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x009F
                }
            GpioInt (Edge, ActiveHigh, SharedAndWake, PullNone, 0x0000,
                "\\_SB.PM02", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x00BE
                }
            GpioInt (Edge, ActiveHigh, SharedAndWake, PullNone, 0x0000,
                "\\_SB.PM02", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x00BD
                }
            GpioInt (Edge, ActiveHigh, SharedAndWake, PullNone, 0x0000,
                "\\_SB.PM02", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x00BC
                }
            GpioInt (Edge, ActiveHigh, SharedAndWake, PullNone, 0x0000,
                "\\_SB.PM02", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x00BB
                }
            GpioInt (Edge, ActiveHigh, SharedAndWake, PullNone, 0x0000,
                "\\_SB.PM02", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x00BA
                }
            GpioInt (Edge, ActiveHigh, SharedAndWake, PullNone, 0x0000,
                "\\_SB.PM02", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x00B9
                }
            GpioInt (Edge, ActiveHigh, SharedAndWake, PullNone, 0x0000,
                "\\_SB.PM02", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x00B8
                }
            GpioInt (Edge, ActiveHigh, Exclusive, PullUp, 0x0000,
                "\\_SB.PM02", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0089
                }
        })
        Return (RBUF) /* \_SB_.PTCC._CRS.RBUF */
    }

    Method (PIEN, 0, NotSerialized)
    {
        Name (CFG0, Package (0x09)
        {
            "CCStChg", 
            "MsgRxDiscd", 
            "MsgTxDiscd", 
            "MsgTxFailed", 
            "MsgRecv", 
            "MsgSent", 
            "SgnlRecv", 
            "SgnlSent", 
            "OtgOc"
        })
        Return (CFG0) /* \_SB_.PTCC.PIEN.CFG0 */
    }
}

Device (BAT1)
{
    Name (_HID, "BQB1380")  // _HID: Hardware ID // BQ27411
    Name (_UID, One)  // _UID: Unique ID
    Name (_DEP, Package (One)  // _DEP: Dependencies
    {
        \_SB.I2C7
    })
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            I2cSerialBusV2 (0x0055, ControllerInitiated, 0x000186A0,
                AddressingMode7Bit, "\\_SB.I2C7",
                0x00, ResourceConsumer, , Exclusive,
                )
        })
        Return (RBUF) /* \_SB_.BAT1._CRS.RBUF */
    }
}

Device (BCL1)
{
    Name (_HID, "QCOM00DB")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (One)  // _DEP: Dependencies
    {
        \_SB.PMIC
    })
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        Return (0x0F)
    }

    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                "\\_SB.PM01", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x01E8
                }
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                "\\_SB.PM01", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x01E9
                }
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                "\\_SB.PM01", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x01EA
                }
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                "\\_SB.PM01", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x01EB
                }
        //  GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
        //      "\\_SB.PM01", 0x00, ResourceConsumer, ,
        //      )
        //      {   // Pin list
        //          0x01EC
        //      }
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                "\\_SB.PM01", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x01F3
                }
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                "\\_SB.PM02", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0210
                }
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                "\\_SB.PM02", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0211
                }
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                "\\_SB.PM02", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0213
                }
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                "\\_SB.PM02", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0214
                }
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                "\\_SB.PM02", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0204
                }
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                "\\_SB.PM02", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0206
                }
            GpioInt (Edge, ActiveBoth, Shared, PullUp, 0x0000,
                "\\_SB.PM02", 0x00, ResourceConsumer, ,
                RawDataBuffer (0x01)  // Vendor Data
                {
                    0x08
                })
                {   // Pin list
                    0x0218
                }
            GpioInt (Edge, ActiveBoth, Shared, PullUp, 0x0000,
                "\\_SB.PM02", 0x00, ResourceConsumer, ,
                RawDataBuffer (0x01)  // Vendor Data
                {
                    0x08
                })
                {   // Pin list
                    0x0219
                }
            GpioInt (Edge, ActiveBoth, Shared, PullUp, 0x0000,
                "\\_SB.PM02", 0x00, ResourceConsumer, ,
                RawDataBuffer (0x01)  // Vendor Data
                {
                    0x08
                })
                {   // Pin list
                    0x021A
                }
        })
        Return (RBUF) /* \_SB_.BCL1._CRS.RBUF */
    }

    Method (BCLS, 0, NotSerialized)
    {
        Name (CFG0, Package (0x0B)
        {
            0x02, 
            0x07, 
            0x1388, 
            0x50, 
            0x5A, 
            0x0CE4, 
            0x0A28, 
            0x0C80, 
            0x0ABE, 
            0x09C4, 
            0x0A
        })
        Return (CFG0) /* \_SB_.BCL1.BCLS.CFG0 */
    }

    Method (BCLQ, 0, NotSerialized)
    {
        Name (CFG0, Package (0x0F)
        {
            "VCOMP_LOW0", 
            "VCOMP_LOW1", 
            "VCOMP_LOW2", 
            "VCOMP_HI", 
            "SYS_OK", 
            "BAN_ALARM", 
            "IBATT_HI", 
            "IBATT_THI", 
            "VBATT_LOW", 
            "VBATT_TLOW", 
            "MSOC_LOW", 
            "MSOC_HI", 
            "LMH_LVL0", 
            "LMH_LVL1", 
            "LMH_LVL2"
        })
        Return (CFG0) /* \_SB_.BCL1.BCLQ.CFG0 */
    }
}