//
// TLMM controller.
//
Device (GIO0)
{
    Name (_HID, "QCOM0016")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, Zero)  // _UID: Unique ID
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x03400000,         // Address Base
                0x00C00000,         // Address Length
                )
            Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
            {
                0x000000F0,
            }
            Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
            {
                0x000000F0,
            }
            Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
            {
                0x000000F0,
            }
        })
        Return (RBUF) /* \_SB_.GIO0._CRS.RBUF */
    }

	// ACPI method to return Num pins
	Method(OFNI, 0x0, NotSerialized) {
		Name(RBUF, Buffer()
		{
			0x96,  // 0: TOTAL_GPIO_PINS
			0x00   // 1: TOTAL_GPIO_PINS
		})
		Return (RBUF)
	}
	
	Name(GABL, Zero)
	Method(_REG, 0x2, NotSerialized)
	{
		If(LEqual(Arg0, 0x8))
		{
			Store(Arg1, GABL)
		}
	} 
}
