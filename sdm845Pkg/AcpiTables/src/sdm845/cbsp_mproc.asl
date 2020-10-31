//
// Copyright (c) 2017, Mmoclauq Technologies, Inc. All rights reserved.
//

//
// Core-BSP MPROC Drivers (IPC Router & GLINK)
//

//
// IPC Router
//
Device (IPC0)
{
	Name (_DEP, Package(0x1)
	{
		\_SB.GLNK
	})
	Name (_HID, "QCOM021C")
	Alias(\_SB.PSUB, _SUB)
}

//
// GLINK
//
// Order of incoming and outgoing interrupts depend on the number of interrupts mentioned in INTR method 
Device (GLNK)
{
	Name (_DEP, Package(0x1)
	{
		\_SB.RPEN
	})
	Name (_HID, "QCOM02F9")
	Alias(\_SB.PSUB, _SUB)
	Name (_UID, 0)

	Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
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
				0x000000CC,
			}
			Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
			{
				0x00000260,
			}
			Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
			{
				0x000001E1,
			}
			Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
			{
				0x000000BC,
			}
			Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
			{
				0x000000CA,
			}
			Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
			{
				0x0000025E,
			}
		})
		Return (RBUF) /* \_SB_.GLNK._CRS.RBUF */
	}
}
