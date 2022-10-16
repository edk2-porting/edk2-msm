//
// Camera Platform, Camera Sensors, White LED Flash, JPEG HW, VFE Moved to a dedicated asl
// This is done to support Multiple platforms and Multiple OEM Projects in CRM Builds
//
Include("cust_camera.asl")
Include("cust_sensors.asl")

// GPIO_11

Method (ADDR) 
{
	If(Lequal(\_SB_.SVMJ, 1)) 
	{
		return(0x390B000)
	}
	ElseIf(Lequal(\_SB_.SVMJ, 2))
	{
		return(0x350B000)
	}              
}

OperationRegion(NM11, SystemMemory, ADDR, 0x14)
Field(NM11, DWordAcc, NoLock, Preserve){			
	PI1C, 32, 
	PIN1, 32, 
	PI1N, 32, 
	PI1S, 32,
    PI1L, 32,	
}

//  BOARD VERSION (NBID)
//  NBID == 0x0 i.e. FULL MODEM BUILD
// 	NBID == 0x1 i.e. NO MODEM BUILD

Method (_MID, 0, Serialized) {
    Name(NMID, Zero)		
    Store(PIN1, NMID)
    Return (NMID)
}

Device(RHPX)
{
	Name(_HID, "MSFT8000")
	Name(_CID, "MSFT8000")
	Name(_UID, 1)

	Name(_CRS, ResourceTemplate()
	{
		// Index 0
		I2CSerialBus(
			0xFF,                  // SlaveAddress: placeholder
			,                      // SlaveMode: default to ControllerInitiated
			400000,                // ConnectionSpeed: in Hz
			,                      // Addressing Mode: default to 7 bit
			"\\_SB.I2C6",          // ResourceSource: I2C bus controller name
			,
			,
		)                          // VendorData

		// // Index 1
		// GpioIo (Shared, PullNone, 0, 0, IoRestrictionNone, "\\_SB.GIO0",) {14}  // Pin 21 of JP1 (GPIO_S5[00])
		// // Index 2
		// GpioInt(Edge, ActiveBoth, SharedAndWake, PullNone, 0,"\\_SB.GIO0",) {14}

		// // Index 3
		// GpioIo (Shared, PullNone, 0, 0, IoRestrictionNone, "\\_SB.GIO0",) {25}  // Pin 23 of JP1 (GPIO_S5[01])
		// // Index 4
		// GpioInt(Edge, ActiveBoth, SharedAndWake, PullNone, 0,"\\_SB.GIO0",) {25}
	})

	Name(_DSD, Package()
	{
		ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
		Package()
		{
			// I2C Mapping
			Package() { "bus-I2C-I2C1", Package() { 0 }},
			// no UART Mapping
		}
	})


	Name (PGID, Buffer (0x0A)
	{
		"\\_SB.RHPX"
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
		DEID = PGID /* \_SB_.RHPX.PGID */
		If (\_SB.ABD.AVBL)
		{
			\_SB.PEP0.FLD0 = DBUF /* \_SB_.RHPX.DBUF */
		}
	}

	Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
	{
		DEID = Buffer (ESNL){}
		DVAL = 0x03
		DEID = PGID /* \_SB_.RHPX.PGID */
		If (\_SB.ABD.AVBL)
		{
			\_SB.PEP0.FLD0 = DBUF /* \_SB_.RHPX.DBUF */
		}
	}
}
