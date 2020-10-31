//
// Copyright (c) 2017, Mmoclauq Technologies Inc. All rights reserved.
//
// This file contains common Power Management IC (PMIC) ACPI device definitions
// 

//
//
//PMIC KMDF
//
Device (PMIC)
{
	Name (_DEP, Package (One)  // _DEP: Dependencies
	{
		\_SB.SPMI
	})
	Name (_HID, "QCOM0266")  // _HID: Hardware ID
	Name (_CID, "PNP0CA3")  // _CID: Compatible ID
	Method (_STA, 0, NotSerialized)  // _STA: Status
	{
		Return (0x0B)
	}

	Method (PMCF, 0, NotSerialized)
	{
		Name (CFG0, Package (0x04)
		{
			// PMIC Info
			0x03, 	// Number of PMICs, must match the number of info packages
			Package (0x02)
			{
				Zero, 
				One
			}, 

			Package (0x02)
			{
				0x02, 
				0x03
			}, 

			Package (0x02)
			{
				0x04, 
				0x05
			}
		})
		Return (CFG0) /* \_SB_.PMIC.PMCF.CFG0 */
	}
}


//
// PMIC GPIO
//
Device (PM01)
{
	Name (_HID, "QCOM0269")  // _HID: Hardware ID
	Alias (\_SB.PSUB, _SUB)
	Name (_UID, One)  // _UID: Unique ID
	Name (_DEP, Package (One)  // _DEP: Dependencies
	{
		\_SB.PMIC
	})
	Method (_STA, 0, NotSerialized)  // _STA: Status
	{
		Return (0x0B)
	}

	Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
	{
		Name (RBUF, ResourceTemplate ()
		{
			Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
			{
				0x00000201,
			}
		})
		Return (RBUF) /* \_SB_.PM01._CRS.RBUF */
	}

	Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
	{
		While (One)
		{
			Name (_T_0, Buffer (0x01)  // _T_x: Emitted by ASL Compiler
			{
				 0x00                                             // .
			})
			CopyObject (ToBuffer (Arg0), _T_0) /* \_SB_.PM01._DSM._T_0 */
			If ((_T_0 == ToUUID ("4f248f40-d5e2-499f-834c-27758ea1cd3f") /* GPIO Controller */))
			{
				While (One)
				{
					Name (_T_1, 0x00)  // _T_x: Emitted by ASL Compiler
					_T_1 = ToInteger (Arg2)
					If ((_T_1 == Zero))
					{
						Return (Buffer (One)
						{
							 0x03                                             // .
						})
					}
					ElseIf ((_T_1 == One))
					{
						Return (Package (0x02)
						{
							Zero, 
							One
						})
					}
					Else
					{
					}

					Break
				}
			}
			Else
			{
				Return (Buffer (One)
				{
					 0x00                                             // .
				})
			}

			Break
		}
	}
}

//
// PMIC Apps Driver
//
Device (PMAP)
{
	Name (_HID, "QCOM0268")  // _HID: Hardware ID
	Alias (\_SB.PSUB, _SUB)
	Name (_DEP, Package (0x03)  // _DEP: Dependencies
	{
		\_SB.PMIC, 
		\_SB.ABD, 
		\_SB.SCM0
	})
	//PMAP is dependent on ABD for operation region access
	Method (_STA, 0, NotSerialized)  // _STA: Status
	{
		Return (0x0B)
	}

	// Get pseudo SPB controller port which is used to handle the ACPI operation region access
	Method (GEPT, 0, NotSerialized)
	{
		Name (BUFF, Buffer (0x04){})
		CreateByteField (BUFF, Zero, STAT)
		CreateWordField (BUFF, 0x02, DATA)
		DATA = 0x02
		Return (DATA) /* \_SB_.PMAP.GEPT.DATA */
	}

	Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
	{
		Name (RBUF, Buffer (0x02)
		{
			 0x79, 0x00                                       // y.
		})
		Return (RBUF) /* \_SB_.PMAP._CRS.RBUF */
	}
}




//
// PMIC Apps Real Time Clock (RTC)
//
Device (PRTC)
{
	Name (_HID, "ACPI000E" /* Time and Alarm Device */)  // _HID: Hardware ID
	Name (_DEP, Package (0x01)  // _DEP: Dependencies
	{
		\_SB.PMAP
	})
	Method (_STA, 0, NotSerialized)  // _STA: Status
	{
		Return (0x0B)
	}

	Method (_GCP, 0, NotSerialized)  // _GCP: Get Capabilities
	{
		Return (0x04)
	}

	Field (^ABD.ROP1, BufferAcc, NoLock, Preserve)
	{
		Connection (
			I2cSerialBusV2 (0x0002, ControllerInitiated, 0x00000000,
				AddressingMode7Bit, "\\_SB.ABD",
				0x00, ResourceConsumer, , Exclusive,
				)
		), 
		AccessAs (BufferAcc, AttribRawBytes (0x18)), 
		FLD0,   192
	}

	Method (_GRT, 0, NotSerialized)  // _GRT: Get Real Time
	{
		Name (BUFF, Buffer (0x1A){})
		CreateField (BUFF, 0x10, 0x80, TME1)
		CreateField (BUFF, 0x90, 0x20, ACT1)
		CreateField (BUFF, 0xB0, 0x20, ACW1)
		BUFF = FLD0 /* \_SB_.PRTC.FLD0 */
		Return (TME1) /* \_SB_.PRTC._GRT.TME1 */
	}

	Method (_SRT, 1, NotSerialized)  // _SRT: Set Real Time
	{
		Name (BUFF, Buffer (0x32){})
		CreateByteField (BUFF, Zero, STAT)
		CreateField (BUFF, 0x10, 0x80, TME1)
		CreateField (BUFF, 0x90, 0x20, ACT1)
		CreateField (BUFF, 0xB0, 0x20, ACW1)
		ACT1 = Zero
		TME1 = Arg0
		ACW1 = Zero
		BUFF = FLD0 = BUFF /* \_SB_.PRTC._SRT.BUFF */
		If ((STAT != Zero))
		{
			Return (One)
		}

		Return (Zero)
	}
}
