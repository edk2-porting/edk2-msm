//PCIE asl

//
// Copyright (c) 2014-2018, Mmoclauq Technologies, Inc. All rights reserved.
//

Device (PCI0) {
	Name (_DEP, Package(0x2) {
		 \_SB.PEP0,
		 \_SB.QPPX
	})
	Name(_HID,EISAID("PNP0A08"))
	Name(_CID,EISAID("PNP0A03"))
	Name(_UID, 0x0)
	Name(_SEG, 0x0)
	Name(_BBN, 0x0)
	Name(_PRT, Package(){
		Package(){0x0FFFF, 0, 0, 181},  // Slot 1, INTA
		Package(){0x0FFFF, 1, 0, 182},  // Slot 1, INTB
		Package(){0x0FFFF, 2, 0, 183},  // Slot 1, INTC
		Package(){0x0FFFF, 3, 0, 184}   // Slot 1, INTD
	})

	Method (_CCA, 0)
	{
		Return (One)
	}

	Method(_STA, 0)
	{
		if(LEqual(PRP0, 0x1)) {
			Return (0x0F) // EndPoints available
		} 
		else {
			Return (0x00) // No EndPoints available. 
		}
	}

	Method(_PSC) {
		Return(Zero)
	}
	
	Method (_CRS, 0x0, NotSerialized) {
		Name (RBUF, ResourceTemplate ()
		{
			// [ECAM_BASE + 2MB(ECAM_SIZE)] to [PCI_MEM_SIZE - 2MB(ECAM_SIZE) - 64KB IO Space]
			Memory32Fixed (ReadWrite, 0x60200000, 0x01DF0000)
			WordBusNumber (ResourceProducer,
				MinFixed, // IsMinFixed
				MaxFixed, // IsMaxFixed
				,         // Decode: PosDecode
				0,        // AddressGranularity
				0,        // AddressMinimum
				1,        // AddressMaximum
				0,        // AddressTranslation
				2)        // RangeLength
		})
		
		Return (RBUF)
	}
	Name(SUPP, 0)
	Name(CTRL, 0)

	Method(_DSW, 0x3, NotSerialized) {
	
	}
	
	Method(_OSC, 4) {
		// Check for proper UUID
		If(LEqual(Arg0,ToUUID("33DB4D5B-1FF7-401C-9657-7441C03DD766")))
		{
			// Create DWord-adressable fields from the Capabilities Buffer
			CreateDWordField(Arg3,0,CDW1)
			CreateDWordField(Arg3,4,CDW2)
			CreateDWordField(Arg3,8,CDW3)
			
			// Save Capabilities DWord2 & 3
			Store(CDW2,SUPP)
			Store(CDW3,CTRL)
			
			//No native hot plug support 
			//ASPM supported
			//Clock PM supported
			//MSI/MSI-X
			
			If(LNotEqual(And(SUPP, 0x16), 0x16))
			{
				And(CTRL,0x1E,CTRL) // Give control of everything to the OS
			}
			
			And(CTRL,0x15,CTRL) 
			
			If(LNotEqual(Arg1,One))
			{ // Unknown revision
				Or(CDW1,0x08,CDW1)
			}		
			If(LNotEqual(CDW3,CTRL))
			{ // Capabilities bits were masked
				Or(CDW1,0x10,CDW1)
			} // Update DWORD3 in the buffer
	
			Store(CTRL,CDW3)
			Return(Arg3)
		} 
		Else {
			Or(CDW1,4,CDW1) // Unrecognized UUID
			Return(Arg3)
		}
	} // End _OSC
	
	Method(_DSM, 0x4, NotSerialized) {
		If(LEqual(Arg0,ToUUID("E5C937D0-3553-4d7a-9117-EA4D19C3434D")))
		{
			// DSM Function
			switch(ToInteger(Arg2))
			{
			//
			// Function 0: Return supported functions, based on revision
			//
                        
			case(0)
			{			   
				// revision 0: functions 1-9 are supported. 
				return (Buffer() {0xFF, 0x03})
			}
                                   
			//
			// Function 1: For emulated ActiveBoth controllers, returns
			//             a package of controller-relative pin numbers.
			//             Each corresponding pin will have an initial
			//             polarity of ActiveHigh. 
			//
	   
			case(1)
			{   
				
				Return (Package(2) {
							Package(1){
							1}, // Success
							Package(3){
							0,0x1,0x1}// Link Width supports x1??, PCI express card slot and WAKE# signal
				
				})
			} 
			case(2)
			{   
				
				Return (Package(1) {
							Package(4){
							1,3,0,7} //Random have to check 
				
				})
			}
			case(3)
			{   
				
				Return (Package(1) {
							0}) //Random have to check , not implemented yet
				
				
			}
			case(4) // Not implemented yet
			{   
				
				Return (Package(2) {
							Package(1){0},
							Package(4){
							1,3,0,7} //Random have to check 
				
				})
			}
			case(5) // PCI Boot Configuration
			{   
				
				Return (Package(1) {
							1			
				})
			}				
			case(6) // Latency Scale and Value
			{   
				
				Return (Package(4) {
							Package(1){0}, // Maximum Snoop Latency Scale
							Package(1){0}, // Maximum Snoop Latency Value
							Package(1){0}, // Maximum No-Snoop Latency Scale
							Package(1){0}  // Maximum No-Snoop Latency Value
				
				})
			}
			case(7) // PCI Express Slot Parsing
			{   
				
				Return (Package(1) {
							1			
				})
			}
			case(8) // DSM for Avoiding Power-On Reset Delay Duplication on Sx Resume
			{   
				Return (Package(1) {
						1 // Allow OS to avoid duplicating post power-on delay on Sx resume flow
				})
			}
			case(9) // DSM for Specifying Device Readiness Durations
			{   
				Return (Package(5) {
						0xFFFFFFFF, // FW Reset Time
						0xFFFFFFFF, // FW DL_Up Time
						0xFFFFFFFF, // FW FLR Reset Time
						0x00000000, // FW D3hot to D0 Time
						0xFFFFFFFF  // FW VF Enable Time
				}) 					
			}
			
			default
			{
			   // Functions 9+: not supported
			}
                                  
			}
		}
	}
	
	Name(_S0W, 4)

	Name(_PR0, Package(){
		\_SB.P0RR
	})
	Name(_PR3, Package(){
		\_SB.P0RR
	})

	// PCIe Root Port 1
	Device(RP1) {
		Method(_ADR, 0x0, Serialized) {
			Return(Zero)
		}

		Name(_PR0, Package(){
			\_SB.R0RR			
		})
		Name(_PR3, Package(){
			\_SB.R0RR	
		})		
	
		Name(_PRR, Package(){
			\_SB.R0RR	
		})

		Name(_S0W, 4)

		Name (_DSD, Package () {
			ToUUID("6211E2C0-58A3-4AF3-90E1-927A4E0C55A4"),
			Package () {
				Package (2) {"HotPlugSupportInD3", 1},
			}
		})
	
		Method (_CRS, 0x0, NotSerialized) {
			if (LEqual(PSUB, "CLS08180"))
			{
				Name (RBF0, ResourceTemplate ()
				{
				})
				Return (RBF0)
			}
			Else
			{
				Name (RBF1, ResourceTemplate ()
				{
					GpioInt(Edge, ActiveLow, ExclusiveAndWake, PullUp, 0, "\\_SB.GIO0", 0 , ResourceConsumer, , ) {384}
				})
				Return (RBF1)
			}
		}
		
		Method(_DSM, 0x4, NotSerialized) {
			If(LEqual(Arg0,ToUUID("E5C937D0-3553-4d7a-9117-EA4D19C3434D")))
			{
				// DSM Function
				switch(ToInteger(Arg2))
				{
					case(0)
					{			   
						// revision 0: functions 1-7 are not supported. 
						return (Buffer() {0x01, 0x03})
					}
					case(8) // DSM for Avoiding Power-On Reset Delay Duplication on Sx Resume
					{
						Return (Package(1) {
							1 // Allow OS to avoid duplicating post power-on delay on Sx resume flow
						})
					}
					case(9) // DSM for Specifying Device Readiness Durations
					{
						Return (Package(5) {
							0xFFFFFFFF, // FW Reset Time
							0xFFFFFFFF, // FW DL_Up Time
							0xFFFFFFFF, // FW FLR Reset Time
							0x00000000, // FW D3hot to D0 Time
							0xFFFFFFFF  // FW VF Enable Time
						})
					}
					default
					{
					   // Functions 1-7: not supported
					}
				}
			}
		}		
    }
} // End PCI0

// Empty power resource for handling in Platform extension 
PowerResource(P0RR, 0x5, 0) {
	Method(_STA){Return(0)}
	Method(_ON) {
	}
	Method(_OFF) {
	}
}

// Empty power resource for handling in Platform extension 
PowerResource(R0RR, 0x5, 0) {
	Method(_STA){Return(0)}
	Method(_ON) {
	}
	Method(_OFF) {
	}
	Method(_RST){
	}
}

Device (QPPX)
{
	Name (_HID, "HID_QPPX")
	Name (_UID, 0)
	Name (_CCA, 0)
    Alias(\_SB.PSUB, _SUB)
	
	Method (_STA, 0) {
		Return(0xF)
	}
	
	Method (_CRS, 0x0, Serialized) 
	{
		Name (RBUF, ResourceTemplate ()
		{
			// TCSR_PCIEPHY_LINK_CONFIG
			Memory32Fixed (ReadWrite, 0x01FEC004, 0x4)

			//
			// Following are the PERST GPIO assignment for four PCIe cores.
			// The Method _QPG(), will return a package in the same order
			// as the following GPIO resource definitions with 0x00, if the
			// GPIO resource listed below is not applicable to this platform,
			// else, will return 0x01 in the corresponding index for the GPIOIO
			// resource
			//
			GpioIo (Shared, PullNone, 0, 0, IoRestrictionNone, "\\_SB.GIO0", 0, ResourceConsumer, , RawDataBuffer(0x1){0x01}) {35}  // PCI0_PERST
			GpioIo (Shared, PullNone, 0, 0, IoRestrictionNone, "\\_SB.GIO0", 1, ResourceConsumer, , RawDataBuffer(0x1){0x01}) {175} // PCI1_PERST
			GpioIo (Shared, PullNone, 0, 0, IoRestrictionNone, "\\_SB.GIO0", 2, ResourceConsumer, , RawDataBuffer(0x1){0x01}) {102} // PCI2_PERST
			GpioIo (Shared, PullNone, 0, 0, IoRestrictionNone, "\\_SB.GIO0", 3, ResourceConsumer, , RawDataBuffer(0x1){0x01}) {178} // PCI3_PERST
		} )
		Return (RBUF)
	}

	Method (_QPG, 0x0, Serialized)
	{
		If (LEqual(\_SB.PSUB, "CLS08180"))
		{
			// CLS Platform
			Return( Package()
			{
				// 0x00 - INVALID FOR THIS PLATFORM, 0x01 -   VALID FOR THIS PLATFORM
				0x00, //PCI0-PERST INVALID
				0x01, //PCI1-PERST VALID
				0x01, //PCI2-PERST VALID
				0x01, //PCI3-PERST VALID
			})
		}
		Else
		{
			// Rest of the Platform
			Return( Package()
			{
				// 0x00 - INVALID FOR THIS PLATFORM, 0x01 -   VALID FOR THIS PLATFORM
				0x01, //PCI0-PERST VALID
				0x01, //PCI1-PERST VALID
				0x01, //PCI2-PERST VALID
				0x01, //PCI3-PERST VALID
			})
		}
	}

	//WLAN EN GPIO resource
	Name (GWLE, ResourceTemplate () 
	{
		GpioIo (Exclusive,PullNone,0,0, ,"\\_SB.GIO0") {169} // WL_EN
	})

	//SDX55 PON GPIO resource
	Name (GMDM, ResourceTemplate ()
	{
		GpioIo (Exclusive,PullNone,0,0, ,"\\_SB.GIO0") {185} // SDX Power ON
	})
	//SDX55 Reset PMIC GPIO resource
	Name (GMDR, ResourceTemplate ()
	{
		GpioIo(Exclusive, PullNone,0,0, ,"\\_SB.PM01") {528} // PMIC GPIO9C
	})
	//SDX55 PON Switch PMIC GPIO resource
	Name (GMDS, ResourceTemplate ()
	{
		GpioIo (Exclusive,PullNone,0,0, ,"\\_SB.PM01") {677} // PMIC GPIO6E
	})

	Scope(\_SB.GIO0) {
		OperationRegion(WLEN, GeneralPurposeIO, 0, 1)
		OperationRegion(MPON, GeneralPurposeIO, 0, 1)
	}

	Scope(\_SB.PM01) {
		OperationRegion(PMDR, GeneralPurposeIO, 0, 1)
		OperationRegion(PMON, GeneralPurposeIO, 0, 1)
	}

	// TLMM GPIO resource fields
	Field(\_SB.GIO0.WLEN, ByteAcc, NoLock, Preserve) 
	{
		Connection (\_SB.QPPX.GWLE),
		WLEN, 1, // WLAN_EN
	}

	// TLMM GPIO resource SDX PON
	Field(\_SB.GIO0.MPON, ByteAcc, NoLock, Preserve) 
	{
		Connection (\_SB.QPPX.GMDM),
		MPON, 1, // SDX PON
	}

	// PMIC GPIO resource field for SDX reset
	Field(\_SB.PM01.PMDR, ByteAcc, NoLock, Preserve) 
	{
		Connection (\_SB.QPPX.GMDR),
		PMDR, 1, // SDX Reset
	}

	// PMIC GPIO resource field for SDX PON
	Field(\_SB.PM01.PMON, ByteAcc, NoLock, Preserve) 
	{
		Connection (\_SB.QPPX.GMDS),
		PMON, 1, // SDX PON Switch
	}

	Method (_RST, 0x1, Serialized)
	{
		switch(ToInteger(Arg0))
		{
			Case (0)
			{
				If (Lequal(\_SB_.PSUB,"MTP08180")) // MTP
				{ 
					If (Lequal(\_SB_.PLST, 1) || Lequal(\_SB_.PLST, 4)) // Hastings
					{
						Store (0x00, \_SB.QPPX.WLEN)
						Sleep(5)
						Store (0x01, \_SB.QPPX.WLEN)
					}
				}
				ElseIf (Lequal(\_SB_.PSUB,"CLS08180")) // CLS
				{
					If(Lequal(\_SB_.SOID, 404) && ( LEqual(BSID, 0x2) || LEqual(BSID, 0x3) )) // Hastings
					{
 						Store (0x00, \_SB.QPPX.WLEN)
						Sleep(5)
						Store (0x01, \_SB.QPPX.WLEN)
					}
				}
			}
			Case (1)
			{

			}
			Case (2)
			{

			}
			Case (3)
			{
				If (LEqual(\_SB_.PSUB,"CLS08180"))
				{
					// To see if it is a EVT3 board, only then the following sequence will apply
					// For EVT3 both GPIO 41 and 42 will be 0x0
					If(LEqual(BREV, 0x0))
					{
						Store(0x0, \_SB.QPPX.PMON) //PMIC GPIO 6E for SDX55 power switch OFF
						Store(0x0, \_SB.QPPX.PMDR) //PMIC GPIO 9C for SDX55 Assert Reset
						Store(0x0, \_SB.QPPX.MPON) // TLMM GPIO 185 for SDX Power supply
						Sleep(400) //Delay 400 ms for M.2 3.3 V power to discharge to 0 Volts
						Store(0x1, \_SB.QPPX.MPON) // TLMM GPIO 185 for SDX Power supply
						Store(0x1, \_SB.QPPX.PMDR) //PMIC GPIO 9C for SDX55 De-Assert Reset
						Sleep(100) //Delay 100 ms for SDX55 to process cold reset
						Store(0x1, \_SB.QPPX.PMON) //PMIC GPIO 6E for SDX55 power switch ON
						Sleep(30) //Delay 30 ms for SDX55 to process cold boot
					}
				}
			}
			Default
			{
				Store("Invalid PCIe port number passed to QPPX reset helper", Debug)
			}
		}
	}
}

Include("pcie1.asl")
Include("pcie2.asl")
Include("pcie3.asl")