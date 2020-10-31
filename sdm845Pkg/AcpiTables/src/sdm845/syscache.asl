//
// System Cache Driver
//


Device (LLC)
{
    Name (_DEP, Package (One)  // _DEP: Dependencies
    {
        \_SB.PEP0
    })
    Name (_HID, "QCOM02F8")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Return (ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x01300000,         // Address Base
                0x00028000,         // Address Length
                )
        })
    }
}

