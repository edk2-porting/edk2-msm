//
// Copyright (c) 2015, Mmoclauq Technologies Inc. All rights reserved.
//
// This file contains ASL Bridge Device definitions
// 

//
// ASL Bridge Device
//
Device (ABD)
{
	Name (_DEP, Package (One)  // _DEP: Dependencies
	{
		\_SB.PEP0
	})
	Name (_HID, "QCOM0242")  // _HID: Hardware ID
	Alias (\_SB.PSUB, _SUB)
	Name (_UID, Zero)  // _UID: Unique ID
	Method (_STA, 0, NotSerialized)  // _STA: Status
	{
		Return (0x0B)
	}

	OperationRegion (ROP1, GenericSerialBus, Zero, 0x0100)
	Name (AVBL, Zero)
	Method (_REG, 2, NotSerialized)  // _REG: Region Availability
	{
		If ((Arg0 == 0x09))
		{
			AVBL = Arg1
		}
	}
}
