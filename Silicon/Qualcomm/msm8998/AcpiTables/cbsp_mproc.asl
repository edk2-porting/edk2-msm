//
// Core-BSP MPROC Drivers (IPC Router & GLINK)
//

//
// IPC Router
//
Device (IPC0)
{
    Name (_DEP, Package (One)  // _DEP: Dependencies
    {
        \_SB.GLNK
    })
    Name (_HID, "QCOM001B")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
}

//
// GLINK
//
// Order of incoming and outgoing interrupts depend on the number of interrupts mentioned in INTR method 
Device (GLNK)
{
    Name (_DEP, Package (One)  // _DEP: Dependencies
    {
        \_SB.RPEN
    })
    Name (_HID, "QCOM00FF")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, Zero)  // _UID: Unique ID
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000001E3,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000000BE,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000000D2,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000001E2,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000000D1,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000001E4,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000000BD,
            }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000000D3,
            }
        })
        Return (RBUF) /* \_SB_.GLNK._CRS.RBUF */
    }
}
