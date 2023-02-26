// This file contains common Power Management IC (PMIC) ACPI device definitions
//

//
//
//PMIC KMDF
//
Device (PMIC)
{
    Name (_DEP, Package(0x1)
    {
        \_SB_.SPMI
    })
    Name (_HID, "QCOM0266")
    Name (_CID, "PNP0CA3")

        Method (PMCF) {
        Name (CFG0,
        Package()
                {
                        // PMIC Info
                        3,                          // Number of PMICs, must match the number of info packages
                        Package()
                        {
                                0,
                                1,
                        },
                        Package()
                        {
                                2,
                                3,
                        },
                        Package()
                        {
                                4,
                                5,
                        },
                })
        Return (CFG0)
    }
}

//
// PMIC GPIO PM8998
//
Device (PM01)
{
    Name (_HID, "QCOM0269")
    Alias(\_SB.PSUB, _SUB)
    Name (_UID, 1)
    Name (_DEP,
        Package(0x1) {
            \_SB_.PMIC
        }
    )

    Method (_CRS, 0x0, NotSerialized) {
        Name (RBUF,
            ResourceTemplate() {
                // QGIC Interrupt Resource
                // Register for SPMI Interrupt 513
                Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , ,) {513}
            }
        )
        Return (RBUF)
    }

    // _DSM method to mark PM01's ActiveBoth interrupts
    Method(_DSM, 0x4, NotSerialized) {
        // DSM UUID
        switch(ToBuffer(Arg0))
        {
            // ACPI DSM UUID for GPIO
            case(ToUUID("4F248F40-D5E2-499F-834C-27758EA1CD3F"))
            {
                // DSM Function
                switch(ToInteger(Arg2))
                {
                    // Function 0: Return supported functions, based on revision
                    case(0)
                    {
                        // revision 0: function 0 & 1 are supported.
                        return (Buffer() {0x3})
                    }

                    // Function 1: For emulated ActiveBoth controllers, returns
                    //             a package of controller-relative pin numbers.
                    //             Each corresponding pin will have an initial
                    //             polarity of ActiveHigh.
                    case(1)
                    {
                        // Marks pins KPDPWR_ON, RESIN_ON to be ActiveHigh.
                        Return (Package() {0, 1})
                    }

                    default
                    {
                        // Functions 2+: not supported
                    }
                }
            }

            default
            {
                // No other GUIDs supported
                Return(Buffer(One) { 0x00 })
            }
        }
    }
}

//
// PMIC Apps Driver
//
Device (PMAP) 
{
	Name (_HID, "QCOM0268")
	Alias(\_SB.PSUB, _SUB)
	Name(_DEP, Package(0x3) {
			\_SB_.PMIC,
			\_SB.ABD,
			\_SB.SCM0
	})
	//PMAP is dependent on ABD for operation region access

	// Get pseudo SPB controller port which is used to handle the ACPI operation region access
	Method(GEPT)
	{
			Name(BUFF, Buffer(4){})
			CreateByteField(BUFF, 0x00, STAT)
			CreateWordField(BUFF, 0x02, DATA)
			Store(0x2, DATA)
			Return(DATA)
	}

	Method (_CRS, 0x0, NotSerialized)
	{
			Name (RBUF, ResourceTemplate ()
			{
					//Interrupts must be in this order to match PmicAppsDevice.c OnPrepareHardware
					//LAB Vreg OK interrupt
					GpioInt(Edge, ActiveBoth, Exclusive, PullUp, 0, "\\_SB.PM01", , , ,) {448} // 0xEF0 - PM_INT__LAB__VREG_OK
					//WLED SC fault interrupt
					//GpioInt(Edge, ActiveHigh, Exclusive, PullUp, 0, "\\_SB.PM01", , , ,) {418} // 0xEC2 - PM_INT__WLED_CTRL__SC_FAULT
					//IBB SC fault interrupt
					//GpioInt(Edge, ActiveHigh, Exclusive, PullUp, 0, "\\_SB.PM01", , , ,) {434} // 0xEE2 - PM_INT__IBB__SC_ERROR
					//LAB SC fault interrupt
					//GpioInt(Edge, ActiveHigh, Exclusive, PullUp, 0, "\\_SB.PM01", , , ,) {449} // 0xEF1 - PM_INT__LAB__SC_ERROR
			})
			Return (RBUF)
	}
}

//
// PMIC Apps Real Time Clock (RTC)
//
Device (PRTC) 
{
	Name(_HID, "ACPI000E")
	Name(_DEP, Package() {"\\_SB.PMAP"})       // PRTC is dependent on PMAP which implements the RTC Functions

	//Get the capabilities of the time and alarm device
	Method(_GCP)
	{
	   Return (0x04) //Bit 2 set indicating Get Set Supported
	}

	Field(\_SB.ABD.ROP1, BufferAcc, NoLock, Preserve)
	{
			Connection(I2CSerialBus( 0x0002,,0x0,, "\\_SB.ABD",,,,)),
			AccessAs(BufferAcc, AttribRawBytes(24)),
			FLD0,192
	}

	Method(_GRT) // Get the Real time
	{
			Name(BUFF, Buffer(26){})          // 18 bytes STAT(1), SIZE(1), Time(16)
			CreateField(BUFF, 16, 128, TME1)  // Create the TIME Field - For the time
			CreateField(BUFF, 144, 32, ACT1)  // Create the AC TIMER Field
			CreateField(BUFF, 176, 32, ACW1)  // Create the AC Wake Alarm Status Field
			Store(FLD0, BUFF)
			Return(TME1)
	}
	
	Method(_SRT, 1) // Set the Real time
	{
			Name(BUFF, Buffer(50){})         // 18 bytes STAT(1), SIZE(1), Time(16)
			CreateByteField(BUFF, 0x0, STAT) // Create the STAT Field
			CreateField(BUFF, 16, 128, TME1)  // Create the TIME Field - For the time
			CreateField(BUFF, 144, 32, ACT1)  // Create the AC TIMER Field
			CreateField(BUFF, 176, 32, ACW1)  // Create the AC Wake Alarm Status Field
			Store(0x0, ACT1)
			Store(Arg0, TME1)
			Store(0x0, ACW1)
			Store(Store(BUFF, FLD0),BUFF)      // Write the transaction to the Psuedo I2C Port

			// Return the status
			If(LNotEqual(STAT,0x00)) {
					Return(1) // Call to OpRegion failed
			}
			Return(0) //success
	}

	//
	//Code to enable RTC AC/DC wake timers
	//
	
	// Method(_TIV) // Get the AC TIMER Field
	// {
			// Name(BUFF, Buffer(26){})          // 18 bytes STAT(1), SIZE(1), Time(16)
			// CreateField(BUFF, 16, 128, TME1)  // Create the TIME Field - For the time
			// CreateField(BUFF, 144, 32, ACT1)  // Create the AC TIMER Field
			// CreateField(BUFF, 176, 32, ACW1)  // Create the AC Wake Alarm Status Field
			// Store(FLD0, BUFF)
			// Return(ACT1)
	// }

	// Method(_GWS) // Get the AC TIMER Wake Status
	// {
			// Name(BUFF, Buffer(26){})          // 18 bytes STAT(1), SIZE(1), Time(16)
			// CreateField(BUFF, 16, 128, TME1)  // Create the TIME Field - For the time
			// CreateField(BUFF, 144, 32, ACT1)  // Create the AC TIMER Field
			// CreateField(BUFF, 176, 32, ACW1)  // Create the AC Wake Alarm Status Field
			// Store(FLD0, BUFF)
			// Return(ACW1)
	// }

	// Method(_STV, 2) // Set alarm timer value
	// {
			// If(LEqual(Arg0,0x00)) {
					// Name(BUFF, Buffer(50){})         // 18 bytes STAT(1), SIZE(1), Time(16)
					// CreateByteField(BUFF, 0x0, STAT) // Create the STAT Field
					// CreateField(BUFF, 16, 128, TME1)  // Create the TIME Field - For the time
					// CreateField(BUFF, 144, 32, ACT1)  // Create the AC TIMER Field
					// CreateField(BUFF, 176, 32, ACW1)  // Create the AC Wake Alarm Status Field
					// Store(Arg1, ACT1)
					// Store(0x0, TME1)
					// Store(0x0, ACW1)
					// Store(Store(BUFF, FLD0),BUFF)      // Write the transaction to the Psuedo I2C Port

					// // Return the status
					// If(LNotEqual(STAT,0x00)) {
							// Return(1) // Call to OpRegion failed
					// }
					// Return(0) //success
			// }
	 // Return(1)
	// }

	// Method(_CWS, 1) // Clear wake alarm status
	// {
			// Name(BUFF, Buffer(50){})         // 18 bytes STAT(1), SIZE(1), Time(16)
			// CreateByteField(BUFF, 0x0, STAT) // Create the STAT Field
			// CreateField(BUFF, 16, 128, TME1)  // Create the TIME Field - For the time
			// CreateField(BUFF, 144, 32, ACT1)  // Create the AC TIMER Field
			// CreateField(BUFF, 176, 32, ACW1)  // Create the AC Wake Alarm Status Field
			// Store(0x0, ACT1)
			// Store(0x0, TME1)
			// Store(Arg0, ACW1)
			// Store(Store(BUFF, FLD0),BUFF)      // Write the transaction to the Psuedo I2C Port

			// // Return the status
			// If(LNotEqual(STAT,0x00)) {
					// Return(1) // Call to OpRegion failed
			// }
			// Return(0) //success
	// }
}
