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
                Memory32Fixed (ReadWrite, 0x1100000, 0x1EE000)  // The CABO address space
				Memory32Fixed (ReadWrite, 0x1380000, 0x320000)   // MEMNOC address space
            }
        )
    }	
}
