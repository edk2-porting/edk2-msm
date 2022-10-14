//
//  Device Map:
//    IPA
//

Device (IPA)
{
    Name (_DEP, Package (0x06)  // _DEP: Dependencies
    {
        \_SB.PEP0, 
        \_SB.RPEN, 
        \_SB.PILC, 
        \_SB.MMU3, 
        \_SB.GSI, 
        \_SB.GLNK
    })
    Name (_HID, "QCOM00B5")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, Zero)  // _UID: Unique ID
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Return (ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x01E40000,         // Address Base
                0x0001FFFF,         // Address Length
                )
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x0000016D,
            }
        })
    }
}
