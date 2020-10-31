//--------------------------------------------------------------------------------------------------
// Copyright (c) 2017-2018 Mmoclauq Technologies, Inc.
// All Rights Reserved.
// Confidential and Proprietary - Mmoclauq Technologies, Inc.
//--------------------------------------------------------------------------------------------------

// 
// iHelium WLAN
//
Device (QWLN)
{
    Name (_ADR, Zero)  // _ADR: Address
    Name (_DEP, Package (0x02)  // _DEP: Dependencies
    {
        \_SB.PEP0, 
        \_SB.MMU0
    })
    Name (_PRW, Package (0x02)    // wakeable from S0
    {
        Zero, 
        Zero
    })
    Name (_S0W, 0x02)  // S0 should put device in D2 for wake 
    Name (_S4W, 0x02)  // all other Sx (just in case) should also wake from D2
    Name (_PRR, Package (One)  // Power resource reference for device reset and recovery.
    {
        \_SB.AMSS.QWLN.WRST
    })
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            // Shared memory
            //CE registers
            Memory32Fixed (ReadWrite,
                0x18800000,         // Address Base
                0x00800000,         // Address Length
                )
            //WCSSAON registers
            Memory32Fixed (ReadWrite,
                0x0C250000,         // Address Base
                0x00000010,         // Address Length
                )
            //MSA image address
            Memory32Fixed (ReadWrite,
                0x8DF00000,         // Address Base // fajita ATTENTION
                0x00100000,         // Address Length
                )
            // CE interrupts
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x000001BE,
            }
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x000001BF,
            }
            Interrupt (ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake, ,, )
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
                0x000001C3,
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

    Method (WMSA, 0, NotSerialized)
    {
        Return (Package (0x01)
        {
            0x00100000
        })
    }

    OperationRegion (WOPR, 0x80, Zero, 0x10)
    Field (WOPR, DWordAcc, NoLock, Preserve)
    {
        Offset (0x04), 
        WTRG,   32
    }

    PowerResource (WRST, 0x05, 0x0000)
    {
        Method (_ON, 0, NotSerialized)  // _ON_: Power On
        {
        }

        Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
        {
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }

        Method (_RST, 0, NotSerialized)  // _RST: Device Reset
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
        Name (_HID, "QCOM0295")
        Alias(\_SB.PSUB, _SUB)
    }
}

Include("plat_wcnss_wlan.asl")   // Platform specific data