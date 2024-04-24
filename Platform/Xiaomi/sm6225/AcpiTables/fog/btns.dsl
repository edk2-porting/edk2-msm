Device (BTNS)
{
    Name (_HID, "ACPI0011" /* Generic Buttons Device */)  // _HID: Hardware ID
    Alias (PSUB, _SUB)
    Name (_UID, Zero)  // _UID: Unique ID
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullDown, 0x0000,
                "\\_SB.PM01", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0000
                }
            GpioInt (Edge, ActiveBoth, Exclusive, PullUp, 0x0000,
                "\\_SB.PM01", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0085
                }
            GpioInt (Edge, ActiveBoth, Exclusive, PullDown, 0x0000,
                "\\_SB.PM01", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0001
                }
        })
        Return (RBUF) /* \_SB_.BTNS._CRS.RBUF */
    }

    Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
    {
        ToUUID ("fa6bd625-9ce8-470d-a2c7-b3ca36c4282e") /* Generic Buttons Device */, 
        Package (0x04)
        {
            Package (0x05) // Portable Device Control 
            {
                Zero, 
                One, 
                Zero, 
                One, 
                0x0D
            }, 

            Package (0x05) // Power
            {
                One, 
                Zero, 
                One, 
                One, 
                0x81
            }, 

            Package (0x05) // Vol Up
            {
                One, 
                One, 
                One, 
                0x0C, 
                0xE9
            }, 

            Package (0x05) // Vol Down
            {
                One, 
                0x02, 
                One, 
                0x0C, 
                0xEA
            }
        }
    })
}