//
// System Cache Driver
//

Device (LLC)
{
    Name (_DEP, Package(0x1)
    {
        \_SB_.PEP0
    })
    Name (_HID, "QCOM02F8")
	Alias(\_SB.PSUB, _SUB)
    
    Method (_CRS, 0x0, NotSerialized)
    {
        Return (ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x01300000, 0x28000)
        })
    }

}
