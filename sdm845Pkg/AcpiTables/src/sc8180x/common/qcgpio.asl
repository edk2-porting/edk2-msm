//
// Copyright (c) 2015-2018, Mmoclauq Technologies, Inc. All rights reserved.
//

//
// TLMM controller.
//
Device (GIO0)
{
	Name (_HID, "HID_GIO0")
	Name (_UID, 0)
	Alias(\_SB.PSUB, _SUB)

	Method (_CRS, 0x0, NotSerialized) {
		Name (RBUF, ResourceTemplate ()
		{
		   // TLMM register address space
			Memory32Fixed (ReadWrite, 0x03000000, 0x00DDC000)

			// Summary Interrupt shared by all banks
			Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , , ) {240}
			Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , , ) {240}
			Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , , ) {240}
			Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , , ) {585} // GPIO 96
			Interrupt(ResourceConsumer, Edge,  ActiveHigh, Shared, , , ) {603} // GPIO 123
			Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , , ) {601} // GPIO 121
			 // PCIe PDC Wake GPIO mapping
			Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {556}
			Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {590}
			Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {658}
			Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {569}
		} )

		Return (RBUF)
	}
	// ACPI method to return Num pins
	Method(OFNI, 0x0, NotSerialized) {
		Name(RBUF, Buffer()
		{
			0xBE,  // 0: TOTAL_GPIO_PINS
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

	// ACPI event-based notification method for detecting Mini DP hot plug-in event
	Name (_AEI, ResourceTemplate()
	{
		GpioInt(Edge, ActiveHigh, Exclusive, PullDown, 500,"\\_SB.GIO0"){189}
	}) 
	Method (_EBD, 0x0, NotSerialized)
	{
		// Notify event ID - 0x92 to GFX driver on a hot plug-in event
		Notify(\_SB.GPU0, 0x92)
	}

}
