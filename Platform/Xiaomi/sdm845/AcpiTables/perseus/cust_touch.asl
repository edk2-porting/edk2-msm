//
// Copyright (c) 2015 - 2017 Qualcomm Technologies Inc. All rights reserved.
//
// This file contains the touch ACPI device definitions.
//
//
// ===================================================================
// EDIT HISTORY
//
// when        who     what, where, why
// --------    ---     -----------------------------------------------
// 11/15/16    ms      Initial Version for 8998 QRD
// ===================================================================


Device (TSC1)
{
	Name (_HID, "STFT0521")  // _HID: Hardware ID
	Alias (\_SB.PSUB, _SUB)
	Name (_DEP, Package (0x03)  // _DEP: Dependencies
	{
		\_SB.GIO0,
		\_SB.IC15, 
		\_SB.PEP0
	})
	Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
	{
		Name (RBUF, ResourceTemplate ()
		{
			I2cSerialBusV2 (0x0049, ControllerInitiated, 0x00061A80,
				AddressingMode7Bit, "\\_SB.IC15",
				0x00, ResourceConsumer, , Exclusive,
				)
			GpioInt (Level, ActiveLow, Exclusive, PullUp, 0x0000,
				"\\_SB.GIO0", 0x00, ResourceConsumer, ,
				)
				{   // Pin list
					0x001F
				}
		})
		Return (RBUF) /* \_SB_.TSC1._CRS.RBUF */
	}
	Name (PGID, Buffer (0x0A)
	{
		"\\_SB.TSC1"
	})
	Name (DBUF, Buffer (DBFL){})
	CreateByteField (DBUF, Zero, STAT)
	CreateByteField (DBUF, 0x02, DVAL)
	CreateField (DBUF, 0x18, 0xA0, DEID)
	Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
	{
		Return (0x03)
	}
	Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
	{
		Return (0x03)
	}

	Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
	{
		Return (0x03)
	}

	Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
	{
		DEID = Buffer (ESNL){}
		DVAL = Zero
		DEID = PGID /* \_SB_.TSC1.PGID */
		If (\_SB.ABD.AVBL)
		{
			\_SB.PEP0.FLD0 = DBUF /* \_SB_.TSC1.DBUF */
		}
	}
	Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
	{
		DEID = Buffer (ESNL){}
		DVAL = 0x03
		DEID = PGID /* \_SB_.TSC1.PGID */
		If (\_SB.ABD.AVBL)
		{
			\_SB.PEP0.FLD0 = DBUF /* \_SB_.TSC1.DBUF */
		}
	}
}

