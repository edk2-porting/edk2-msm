Device (QWPP)
{
    Name (_DEP, Package () { \_SB_.PEP0 })

    Name (_HID, "HID_QWPP")
	Alias(\_SB.PSUB, _SUB)
    Name (_UID, 0)

    Method(_STA, 0)
    {
        return (0xB)  // Loaded, but hidden
    }

    Method (_CRS, 0x0, NotSerialized)
    {
        Return
        (
            ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite, 0x09200000, 0x00400000)  // The LLCC0-7 and CABO0-7 address space
                Memory32Fixed (ReadWrite, 0x09680000, 0x00070000)  // The GEMNOC address space
            }
        )
    }	
}
