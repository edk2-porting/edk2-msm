//PCIE3 asl

//
// Copyright (c) 2018, Mmoclauq Technologies, Inc. All rights reserved.
//

Device (PCI2) {
	Name (_DEP, Package(0x2) {
		 \_SB.PEP0,
		 \_SB.QPPX
	})
	Name(_HID,EISAID("PNP0A08"))
	Name(_CID,EISAID("PNP0A03"))
	Name(_UID, 0x2)
	Name(_SEG, 0x2)
	Name(_BBN, 0x0)
	Name(_PRT, Package(){
		Package(){0x0FFFF, 0, 0, 695},  // Slot 1, INTA
		Package(){0x0FFFF, 1, 0, 694},  // Slot 1, INTB
		Package(){0x0FFFF, 2, 0, 693},  // Slot 1, INTC
		Package(){0x0FFFF, 3, 0, 692}   // Slot 1, INTD
	})

	Method (_CCA, 0)
	{
		Return (One)
	}

	Method(_STA, 0)
	{
		if(LEqual(PRP2, 0x1)) {
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
			Memory32Fixed (ReadWrite, 0x70200000, 0x1DF0000)
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
					3
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
		\_SB.P2RR
	})
	Name(_PR3, Package(){
		\_SB.P2RR
	})

	// PCIe Root Port 1
	Device(RP1) {
		Method(_ADR, 0x0, Serialized) {
			Return(Zero)
		}
	
		Name(_PR0, Package(){
			\_SB.R2RR			
		})
		Name(_PR3, Package(){
			\_SB.R2RR	
		})		
	
		Name(_PRR, Package(){
			\_SB.R2RR	
		})
		
		Name(_S0W, 4)

		Name (_DSD, Package () {
			ToUUID("6211E2C0-58A3-4AF3-90E1-927A4E0C55A4"),
			Package () {
				Package (2) {"HotPlugSupportInD3", 1},
			}
		})

		Method (_CRS, 0x0, NotSerialized) {
			Name (RBUF, ResourceTemplate ()
			{
				//WAKE
				GpioInt(Edge, ActiveLow,  ExclusiveAndWake, PullUp, 0, "\\_SB.GIO0", 0 , ResourceConsumer, , ) {512}
			})
			Return (RBUF)
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
} // End PCI2

// Empty power resource for handling in Platform extension 
PowerResource(P2RR, 0x5, 0) {
	Method(_STA){Return(0)}
	Method(_ON) {
	}
	Method(_OFF) {
	}
}

// Empty power resource for handling in Platform extension 
PowerResource(R2RR, 0x5, 0) {
	Method(_STA){Return(0)}
	Method(_ON) {
	}
	Method(_OFF) {
	}
	Method(_RST){
	}
}