//===========================================================================
//                           <corebsp_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by core BSP drivers.
//
//
//
//===========================================================================


Scope(\_SB_.PEP0) 
{
	Method(LPMD)
    {
        Return(LPCC)
    }
    
    Name(LPCC,
    Package ()
    {   
        //Need to put under external Cfg package 
		//Touch  
		// Package()
		// {
			// "DEVICE",
			// "\\_SB.TSC0",
			// Package()
			// {
				// "COMPONENT",
				// 0x0, // Component 0.
				// Package()
				// {
					// "FSTATE",
					// 0x0, // f0 state
				// },
				
				// Package()
				// {
					// "FSTATE",
					// 0x1, // f1 state    
				// },
				
			// },
			// Package()
			// {
				// "DSTATE",
				// 0x0, // D0 state    
				
				// package()
				// {
					// "PMICVREGVOTE", // PMICVREGVOTE resource
					// package()
					// {	
						// "PPP_RESOURCE_ID_SMPS3_A", 
						// 2,     // Voltage Regulator type = SMPS
						// 1800000,  // 1.8V
						// 2000000,   // 2000 mA -> 2A
						// 1,   // Force enable from s/w
						// 0,	 // Disable pin control enable
						// 0,	 // Power mode - AUTO
						// 0,	 // Disable pin control power mode
						// 0,	 // Bypass allowed - default
						// 5,	 // Frequency - 3.20 MHz
						// 0,	 // Freq reason - none
						// 0,	 // Quiet Mode - disable
						// 0,	 // Corner Mode - none
						// 0,	 // head room voltage
					// },
				// },

				
				// package()
				// {
					// "TLMMGPIO", // TLMMGPIO Resource Enabling HID/I2C firmware on Touch Controller
					// package()
					// {
						// 57,   // PIN number
						// 0,   // State = active
						// 0,   // Function select = GPIO
						// 1,   // direction = Output
						// 0,   // Pull value = No Pull
						// 0,   // Drive Strength = 2mA
					// },
				// },
				
				
				
				// // START mxT1386E in RESET 
				// package()
				// {
					// "TLMMGPIO", // TLMMGPIO resource Touch RESET 
					// package()
					// {
						// 60,   // PIN number
						// 0,   // State = inactive
						// 0,   // Function select = GPIO
						// 1,   // direction = Output
						// 0,   // Pull value = No Pull
						// 0,   // Drive Strength = 2mA
					// },
				// },
				
				// // Enable POWER to mxT1664S using LDO 22
				// package()	
				// {
					// "PMICVREGVOTE",   // PMICVREGVOTE resource
					// package()
					// {									
						// "PPP_RESOURCE_ID_LDO22_A", // VREG ID
						// 1,   // Voltage Regulator type = LDO
						// 3000000,  // 3.00V. Voltage is in micro volts on 8960
						// 300000,   // 300 mA Peak current in microamps
                        // 1,	// force enable from software
						// 0,	// disable pin control enable
						// 1,	// power mode - Normal Power Mode
						// 0, 	// power mode pin control - disable
						// 0,	// bypass mode allowed
						// 0,	// head room voltage
					// },
				// },
				
			
				// // WAIT for AVdd & DVdd to stabilize
				// package()
				// {
					// "DELAY", // Delay resource
					// package()
					// {
						// 2,  // 2 Millisec delay
					// },
				// },
				// // Take mxT1664S out of RESET
				// package()
				// {
					// "TLMMGPIO", // TLMMGPIO resource Touch RESET 
					// package()
					// {
						// 60,   // PIN number
						// 1,   // State = active
						// 0,   // Function select = GPIO
						// 1,   // direction = Output
						// 0,   // Pull value = No Pull
						// 0,   // Drive Strength = 2mA
					// },
				// },
				// // WAIT for mxT1386E to be READY for I2C communication
				// package()
				// {
					// "DELAY", // Delay resource
					// package()
					// {
							// 100,  // 100 Millisec delay
					// },
				// },
					
				
				
			// }, //End of D0
			
			// Package()
			// {
				// "DSTATE",
				// 0x3, // D3 state    
				
				// // Turn OFF POWER to mxT1664S
				// package()
				// {
					// "PMICVREGVOTE", // PMICVREGVOTE resource
					// package()
					// {
						// "PPP_RESOURCE_ID_LDO22_A",
						// 1,  // Voltage Regulator type = LDO
						// 0,  // Voltage (uV)
						// 0,  // Peak current (uA)
                        // 0,	// force disable from software
						// 0,	// disable pin control enable
						// 0,	// power mode - Low Power Mode
						// 0, 	// power mode pin control - disable
						// 0,	// bypass mode allowed
						// 0,	// head room voltage
					// },
				// },

				// //Drive SMPS3A to low power mode
				// package()
				// {
					// "PMICVREGVOTE", // PMICVREGVOTE resource
					// package()
					// {	
						// "PPP_RESOURCE_ID_SMPS3_A", 
						// 2,   // Voltage Regulator type = SMPS
						// 0, 	 // 0V
						// 0,   // 0 mA 
						// 1,   // Force enable from s/w
						// 0,	 // Disable pin control enable
						// 0,	 // Power mode - AUTO
						// 0,	 // Disable pin control power mode
						// 0,	 // Bypass allowed - default
						// 5,	 // Frequency - 3.20 MHz
						// 0,	 // Freq reason - none
						// 0,	 // Quiet Mode - disable
						// 0,	 // Corner Mode - none
						// 0,	 // head room voltage
					// },
				// },
				
				
				// //Drive Firmware Selection line to low power mode
				// package()
				// { 
					// "TLMMGPIO", // TLMMGPIO Resource Selecting  HID/I2C firmware on Touch Controller
					// package()
					// {
						// 57,   // PIN number
						// 0,   // State = Inactive
						// 0,   // Function select = GPIO
						// 0,   // direction = Input
						// 1,   // Pull value = Pull Down
						// 0,   // Drive Strength = 2mA
					// },
				// },
				// //Drive Reset line in low power mode
				// package()
				// { 
					// "TLMMGPIO", // TLMMGPIO resource Touch RESET 
					// package()
					// {
						// 60,   // PIN number
						// 0,   // State = inactive
						// 0,   // Function select = GPIO
						// 0,   // direction = Output
						// 1,   // Pull value = Pull Down
						// 0,   // Drive Strength = 2mA
					// },
				// },

			// },
		// },
        /////////////////////////////////////////////////////////////////////////////////////
    })	

}