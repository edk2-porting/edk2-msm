//
// Copyright (c) 2015-2018, Mmoclauq Technologies, Inc. All rights reserved.
//

//
// TLMM controller.
//

Device (GIO0)
{
	Name (_HID, "QCOM0217")  // _HID: Hardware ID
	Alias (\_SB.PSUB, _SUB)
	Name (_UID, Zero)  // _UID: Unique ID
	OperationRegion (GPOR, GeneralPurposeIo, Zero, One)
	Field (\_SB.GIO0.GPOR, ByteAcc, NoLock, Preserve)
	{
	}

	Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
	{
		Name (RBUF, ResourceTemplate ()
		{
			// TLMM register address space
			Memory32Fixed (ReadWrite,
				0x03400000,         // Address Base
				0x00C00000,         // Address Length
				)
			
			// Summary Interrupt shared by all banks
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
			Interrupt (ResourceConsumer, Edge, ActiveHigh, Shared, ,, )
			{
				0x00000288,
			}
			Interrupt (ResourceConsumer, Edge, ActiveHigh, Shared, ,, )
			{
				0x00000238,
			}
			Interrupt (ResourceConsumer, Edge, ActiveHigh, Shared, ,, )
			{
				0x00000226,
			}
			Interrupt (ResourceConsumer, Edge, ActiveHigh, Shared, ,, )
			{
				0x00000232,
			}
			Interrupt (ResourceConsumer, Edge, ActiveHigh, Shared, ,, )
			{
				0x00000284,
			}
			Interrupt (ResourceConsumer, Edge, ActiveHigh, Shared, ,, )
			{
				0x0000021F,
			}
			Interrupt (ResourceConsumer, Edge, ActiveHigh, Shared, ,, )
			{
				0x00000236,
			}
			Interrupt (ResourceConsumer, Edge, ActiveHigh, Shared, ,, )
			{
				0x0000023D,
			}
		})
		Return (RBUF) /* \_SB_.GIO0._CRS.RBUF */
	}

	// ACPI method to return Num pins
	Method (OFNI, 0, NotSerialized)
	{
		Name (RBUF, Buffer (0x02)
		{
			 0x96, 0x00                                       // ..
		})
		Return (RBUF) /* \_SB_.GIO0.OFNI.RBUF */
	}

	Name (GABL, Zero)
	Method (_REG, 2, NotSerialized)  // _REG: Region Availability
	{
		If ((Arg0 == 0x08))
		{
			GABL = Arg1
		}
	}

	// MIGHT BE ACPI event-based notification method for detecting Mini DP hot plug-in event
	Name (_AEI, Buffer (0x02)  // _AEI: ACPI Event Interrupts
	{
		 0x79, 0x00                                       // y.
	})
}

