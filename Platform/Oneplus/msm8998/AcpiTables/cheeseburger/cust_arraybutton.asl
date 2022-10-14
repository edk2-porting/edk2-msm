Device (BTNS)
{
    Name (_HID, "ACPI0011" /* Generic Buttons Device */)  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, Zero)  // _UID: Unique ID
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            //Power Button
            GpioInt (Edge, ActiveBoth, Exclusive, PullDown, 0x0000,
                "\\_SB.PM01", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0040
                }
            // Volume Up button
            GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullUp, 0x0000,
                "\\_SB.PM01", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0628
                }
            // Volume Down button
            GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullDown, 0x0000,
                "\\_SB.PM01", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0041
                }
        })
        Return (RBUF) /* \_SB_.BTNS._CRS.RBUF */
    }

    Name (_DSD, Package (0x02)
    {
        ToUUID ("fa6bd625-9ce8-470d-a2c7-b3ca36c4282e"), 
        Package() {
            Package(5) {0,1,0,0x01,0x0D}, // Portable Device Control Application Collection
            Package(5) {1,0,1,0x01,0x81}, // Sleep
            Package(5) {1,1,1,0x0C,0xE9}, // Volume Increment
            Package(5) {1,2,1,0x0C,0xEA}, // Volume Decrement
            // Package(5) {1,3,1,0x90,0x20}, // Camera Auto Focus
            // Package(5) {1,4,1,0x90,0x21}, // Camera Shutter
        },
    })
}
