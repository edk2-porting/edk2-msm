Device (SYSM) { 
	Name (_HID, "ACPI0010")
	Name (_UID, 0x100000)
	Name (_LPI, Package()
	{
		0,           // Version
		0x1000000,   // Level ID
		1,           // Count

		// DRIPS State - Xo Shutdown + Cx retention + AOSS Sleep + LLC deactivate 
		Package () {
			9500,    // Min residency (us)
			6000,    // Wake latency (us)
			1,       // Flags, set bit0 to 1 to enable this state
			0x20,    // Arch context last flags + 0x20 For Debugger Transistion by PEP.
			0,       // Residency counter frequency
			0,       // Enabled parent state
			0xB300,  // Integer entry method PSCI E3 + F3 + LLC 
			ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	 // Residency counter register
			ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	 // Usage counter register
			"platform.DRIPS"						             // Name
		}
	}) // End of _LPI


	Device (CLUS)
	{ 
		Name (_HID, "ACPI0010")
		Name (_UID, 0x10)
		Name (_LPI, Package()
		{
			0,          // Version
			0x1000000,  // Level ID
			2,          // Count

			// State 0: D2
			Package ()
			{
				5900,   // Min residency (us)
				3000,   // Wake latency (us)
				0,      // Flags, set bit0 to 1 to enable this state
				0,      // Arch context last flags
				0,      // Residency counter frequency
				0,      // Enabled parent state
				0x20,   // Integer entry method
				ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	 // Residency counter register
				ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	 // Usage counter register
				"L3Cluster.D2"										 // Name
			},
			// State 1: D4
			Package ()
			{
				6000,   // Min residency (us)
				3300,   // Wake latency (us)
				1,      // Flags, set bit0 to 1 to enable this state
				0,      // Arch context last flags
				0,      // Residency counter frequency
				1,      // Enabled parent state (Till F1)
				0x40,   // Integer entry method
				ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
				ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
				"L3Cluster.D4"						                // Name
			}
		}) // End of _LPI


		Device (CPU0) // Kryo Silver CPU0 < SYSM.CLUS.CPU0 
		{
			Name (_HID, "ACPI0007")
			Name (_UID, 0x0)
			Method(_STA){ Return (0xF) }

			Name (_LPI, Package()
			{
				0, // Version
				0, // Level ID
				4, // Count

				// Core Clock Gate - C1
				Package ()
				{
					0,	// Min residency (us)
					0,	// Wake latency (us)
					1,	// Flags, set bit0 to 1 to enable this state
					0,	// Arch context last flags
					0,	// Residency counter frequency
					0,	// Enabled parent state
					ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x00000000FFFFFFFF, 3)}, // Register entry method <= WFI
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Usage counter register
					"KryoSilver0.C1"							// Name
				},
				// C2
				Package ()
				{
					400,	// Min residency (us)
					100,	// Wake latency (us)
					0,	// Flags, set bit0 to 1 to enable this state
					0,	// Arch context last flags
					0,	// Residency counter frequency
					1,	// Enabled parent state
					// Register (AddressSpaceKeyword, RegisterBitWidth, RegisterBitOffset, RegisterAddress, AccessSize, DescriptorName)
					ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x0000000000000002, 3)}, // Register entry method 
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Usage counter register
					"KryoSilver0.C2"							// Name
				},
				// C3
				Package ()
				{
					1774,	// Min residency (us)
					901,	// Wake latency (us)
					1,	// Flags, set bit0 to 1 to enable this state
					1,	// Arch context last flags
					0,	// Residency counter frequency
					1,	// Enabled parent state (Enables D4)              0x40000003
					ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000003,3)}, // Core collapse.
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Usage counter register
					"KryoSilver0.C3"							// Name
				},
				// C4 
				Package ()
				{
					4001,	// Min residency (us)
					915,	// Wake latency (us)
					1,	// Flags, set bit0 to 1 to enable this state
					1,	// Arch context last flags
					0,	// Residency counter frequency
					2,	// Enabled parent state (Enables D4)              0x40000003
					ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000004,3)}, // Core collapse.
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Usage counter register
					"KryoSilver0.C4"							// Name
				}

			}) // End of _LPI
		} // End of CPU0

		Device (CPU1) // Kyro Silver CPU1 < SYSM.CLUS.CPU1
		{
			Name (_HID, "ACPI0007")
			Name (_UID, 0x1)
			Method(_STA){ Return (0xF) }

			Name (_LPI, Package()
			{
				0, // Version
				0, // Level ID
				4, // Count

				// Core Clock Gate - C1
				Package ()
				{
					0,	// Min residency (us)
					0,	// Wake latency (us)
					1,	// Flags, set bit0 to 1 to enable this state
					0,	// Arch context last flags
					0,	// Residency counter frequency
					0,	// Enabled parent state
					ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x00000000FFFFFFFF, 3)}, // Register entry method <= WFI
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Usage counter register
					"KryoSilver1.C1"							// Name
				},
				// C2
				Package ()
				{
					400,	// Min residency (us)
					100,	// Wake latency (us)
					0,	// Flags, set bit0 to 1 to enable this state
					0,	// Arch context last flags
					0,	// Residency counter frequency
					1,	// Enabled parent state
					// Register (AddressSpaceKeyword, RegisterBitWidth, RegisterBitOffset, RegisterAddress, AccessSize, DescriptorName)
					ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x0000000000000002, 3)}, // Register entry method 
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Usage counter register
					"KryoSilver1.C2"							// Name
				},
				// C3
				Package ()
				{
					1774,	// Min residency (us)
					901,	// Wake latency (us)
					1,	// Flags, set bit0 to 1 to enable this state
					1,	// Arch context last flags
					0,	// Residency counter frequency
					1,	// Enabled parent state (Enables D4)
					ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000003,3)}, // Core collapse.
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Usage counter register
					"KryoSilver1.C3"							// Name
				},
				// C4 
				Package ()
				{
					4001,	// Min residency (us)
					915,	// Wake latency (us)
					1,	// Flags, set bit0 to 1 to enable this state
					1,	// Arch context last flags
					0,	// Residency counter frequency
					2,	// Enabled parent state (Enables LLC)
					ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000004,3)}, // Core collapse.
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Usage counter register
					"KryoSilver1.C4"							// Name
				}

			}) // End of _LPI
		} // End of CPU1

		Device (CPU2) // Kyro Silver CPU2 < SYSM.CLUS.CPU1
		{
			Name (_HID, "ACPI0007")
			Name (_UID, 0x2)
			Method(_STA){ Return (0xF) }

			Name (_LPI, Package()
			{
				0, // Version
				0, // Level ID
				4, // Count

				// Core Clock Gate - C1
				Package ()
				{
					0,	// Min residency (us)
					0,	// Wake latency (us)
					1,	// Flags, set bit0 to 1 to enable this state
					0,	// Arch context last flags
					0,	// Residency counter frequency
					0,	// Enabled parent state
					ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x00000000FFFFFFFF, 3)}, // Register entry method <= WFI
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Usage counter register
					"KryoSilver2.C1"							// Name
				},
				// C2
				Package ()
				{
					400,	// Min residency (us)
					100,	// Wake latency (us)
					0,	// Flags, set bit0 to 1 to enable this state
					0,	// Arch context last flags
					0,	// Residency counter frequency
					1,	// Enabled parent state
					// Register (AddressSpaceKeyword, RegisterBitWidth, RegisterBitOffset, RegisterAddress, AccessSize, DescriptorName)
					ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x0000000000000002, 3)}, // Register entry method 
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Usage counter register
					"KryoSilver2.C2"							// Name
				},
				// C3
				Package ()
				{
					1774,	// Min residency (us)
					901,	// Wake latency (us)
					1,	// Flags, set bit0 to 1 to enable this state
					1,	// Arch context last flags
					0,	// Residency counter frequency
					1,	// Enabled parent state (Enables D4)
					ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000003,3)}, // Core collapse.
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Usage counter register
					"KryoSilver2.C3"							// Name
				},
				// C4 
				Package ()
				{
					4001,	// Min residency (us)
					915,	// Wake latency (us)
					1,	// Flags, set bit0 to 1 to enable this state
					1,	// Arch context last flags
					0,	// Residency counter frequency
					2,	// Enabled parent state (Enables LLC)
					ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000004,3)}, // Core collapse.
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Usage counter register
					"KryoSilver2.C4"							// Name
				}

			}) // End of _LPI
		} // End of CPU2

		Device (CPU3) // Kyro Silver CPU3 < SYSM.CLUS.CPU3
		{
			Name (_HID, "ACPI0007")
			Name (_UID, 0x3)
			Method(_STA){ Return (0xF) }

			Name (_LPI, Package() {
				0, // Version
				0, // Level ID
				4, // Count

				// Core Clock Gate - C1
				Package ()
				{
					0,	// Min residency (us)
					0,	// Wake latency (us)
					1,	// Flags, set bit0 to 1 to enable this state
					0,	// Arch context last flags
					0,	// Residency counter frequency
					0,	// Enabled parent state
					ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x00000000FFFFFFFF, 3)}, // Register entry method <= WFI
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Usage counter register
					"KryoSilver3.C1"							// Name
				},
				// C2
				Package ()
				{
					400,	// Min residency (us)
					100,	// Wake latency (us)
					0,	// Flags, set bit0 to 1 to enable this state
					0,	// Arch context last flags
					0,	// Residency counter frequency
					1,	// Enabled parent state
					// Register (AddressSpaceKeyword, RegisterBitWidth, RegisterBitOffset, RegisterAddress, AccessSize, DescriptorName)
					ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x0000000000000002, 3)}, // Register entry method 
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Usage counter register
					"KryoSilver3.C2"							// Name
				},
				// C3
				Package ()
				{
					1774,	// Min residency (us)
					901,	// Wake latency (us)
					1,	// Flags, set bit0 to 1 to enable this state
					1,	// Arch context last flags
					0,	// Residency counter frequency
					1,	// Enabled parent state (Enables D4)
					ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000003,3)}, // Core collapse.
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Usage counter register
					"KryoSilver3.C3"							// Name
				},
				// C4 
				Package ()
				{
					4001,	// Min residency (us)
					915,	// Wake latency (us)
					1,	// Flags, set bit0 to 1 to enable this state
					1,	// Arch context last flags
					0,	// Residency counter frequency
					2,	// Enabled parent state (Enables LLC)
					ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000004,3)}, // Core collapse.
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},		// Usage counter register
					"KryoSilver3.C4"							// Name
				}

			}) // End of _LPI
		} // End of CPU3

		Device (CPU4) // Kryo Gold CPU0 < SYSM.CLUS.CPU4
		{
			Name (_HID, "ACPI0007")
			Name (_UID, 0x4)
			Method(_STA){ Return (0xF) }

			Name (_LPI, Package()
			{
				0, 		// Version
				0, 		// Level ID
				4, 		// Count

				// Core Clock Gate - C1
				Package ()
				{
					0,	// Min residency (us)
					0,	// Wake latency (us)
					1,	// Flags, set bit0 to 1 to enable this state
					0,	// Arch context last flags
					0,	// Residency counter frequency
					0,	// Enabled parent state
					ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x00000000FFFFFFFF, 3)}, // Register entry method <= WFI
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						// Usage counter register
					"KryoGold0.C1"														// Name
				},
				// C2
				Package ()
				{
					400,	// Min residency (us)
					100,	// Wake latency (us)
					0,		// Flags, set bit0 to 1 to enable this state
					0,		// Arch context last flags
					0,		// Residency counter frequency
					1,		// Enabled parent state
					// Register (AddressSpaceKeyword, RegisterBitWidth, RegisterBitOffset, RegisterAddress, AccessSize, DescriptorName)
					ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x0000000000000002, 3)},  // Register entry method 
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						 // Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						 // Usage counter register
					"KryoGold0.C2"														 // Name
				},
				// C3
				Package ()
				{
					3850,	// Min residency (us)
					860,	// Wake latency (us)
					1,		// Flags, set bit0 to 1 to enable this state
					1,		// Arch context last flags
					0,		// Residency counter frequency
					1,		// Enabled parent state (Enables D4)
					ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000003,3)}, // Core collapse.
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},					  // Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},				  	  // Usage counter register
					"KryoGold0.C3"													  // Name
				},
				// C4 
				Package ()
				{
					3950,	// Min residency (us)
					910,	// Wake latency (us)
					1,		// Flags, set bit0 to 1 to enable this state
					1,		// Arch context last flags
					0,		// Residency counter frequency
					2,		// Enabled parent state (Enables LLC)
					ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000004,3)}, 	// Core collapse.
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						// Usage counter register
					"KryoGold0.C4"														// Name
				}
			}) // End of _LPI
		} // End of CPU4

		Device (CPU5) // Kryo Gold CPU1 < SYSM.CLUS.CPU5
		{
			Name (_HID, "ACPI0007")
			Name (_UID, 0x5)
			Method(_STA){ Return (0xF) }

			Name (_LPI, Package()
			{
				0, 		// Version
				0, 		// Level ID
				4, 		// Count

				// Core Clock Gate - C1
				Package ()
				{
					0,	// Min residency (us)
					0,	// Wake latency (us)
					1,	// Flags, set bit0 to 1 to enable this state
					0,	// Arch context last flags
					0,	// Residency counter frequency
					0,	// Enabled parent state
					ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x00000000FFFFFFFF, 3)}, // Register entry method <= WFI
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						// Usage counter register
					"KryoGold1.C1"														// Name
				},
				// C2
				Package ()
				{
					400,	// Min residency (us)
					100,	// Wake latency (us)
					0,		// Flags, set bit0 to 1 to enable this state
					0,		// Arch context last flags
					0,		// Residency counter frequency
					1,		// Enabled parent state
					// Register (AddressSpaceKeyword, RegisterBitWidth, RegisterBitOffset, RegisterAddress, AccessSize, DescriptorName)
					ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x0000000000000002, 3)},  // Register entry method 
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						 // Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						 // Usage counter register
					"KryoGold1.C2"														 // Name
				},
				// C3
				Package ()
				{
					3850,	// Min residency (us)
					860,	// Wake latency (us)
					1,		// Flags, set bit0 to 1 to enable this state
					1,		// Arch context last flags
					0,		// Residency counter frequency
					1,		// Enabled parent state (Enables D4)   0x40000003
					ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000003,3)}, // Core collapse.
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},					  // Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},				  	  // Usage counter register
					"KryoGold1.C3"													  // Name
				},
				// C4 
				Package ()
				{
					3950,	// Min residency (us)
					910,	// Wake latency (us)
					1,		// Flags, set bit0 to 1 to enable this state
					1,		// Arch context last flags
					0,		// Residency counter frequency
					2,		// Enabled parent state (Enables D4)   0x40000003
					ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000004,3)}, 	// Core collapse.
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						// Usage counter register
					"KryoGold1.C4"														// Name
				}
			}) // End of _LPI
		} // End of CPU5

		Device (CPU6) // Kryo Gold CPU2 < SYSM.CLUS.CPU6
		{
			Name (_HID, "ACPI0007")
			Name (_UID, 0x6)
			Method(_STA){ Return (0xF) }

			Name (_LPI, Package()
			{
				0, 		// Version
				0, 		// Level ID
				4, 		// Count

				// Core Clock Gate - C1
				Package ()
				{
					0,	// Min residency (us)
					0,	// Wake latency (us)
					1,	// Flags, set bit0 to 1 to enable this state
					0,	// Arch context last flags
					0,	// Residency counter frequency
					0,	// Enabled parent state
					ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x00000000FFFFFFFF, 3)}, // Register entry method <= WFI
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						// Usage counter register
					"KryoGold2.C1"														// Name
				},
				// C2
				Package ()
				{
					400,	// Min residency (us)
					100,	// Wake latency (us)
					0,		// Flags, set bit0 to 1 to enable this state
					0,		// Arch context last flags
					0,		// Residency counter frequency
					1,		// Enabled parent state
					// Register (AddressSpaceKeyword, RegisterBitWidth, RegisterBitOffset, RegisterAddress, AccessSize, DescriptorName)
					ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x0000000000000002, 3)},  // Register entry method 
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						 // Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						 // Usage counter register
					"KryoGold2.C2"														 // Name
				},
				// C3
				Package ()
				{
					3850,	// Min residency (us)
					860,	// Wake latency (us)
					1,		// Flags, set bit0 to 1 to enable this state
					1,		// Arch context last flags
					0,		// Residency counter frequency
					1,		// Enabled parent state (Enables D4)  0x40000003
					ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000003,3)}, // Core collapse.
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},					  // Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},				  	  // Usage counter register
					"KryoGold2.C3"													  // Name
				},
				// C4 
				Package ()
				{
					3950,	// Min residency (us)
					910,	// Wake latency (us)
					1,		// Flags, set bit0 to 1 to enable this state
					1,		// Arch context last flags
					0,		// Residency counter frequency
					2,		// Enabled parent state (Enables D4)  0x40000004
					ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000004,3)}, 	// Core collapse.
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						// Usage counter register
					"KryoGold2.C4"														// Name
				}
			}) // End of _LPI
		} // End of CPU6

		Device (CPU7) // Kryo Prime CPU0 < SYSM.CLUS.CPU7
		{
			Name (_HID, "ACPI0007")
			Name (_UID, 0x7)
			Method(_STA){ Return (0xF) }

			Name (_LPI, Package()
			{
				0, 		// Version
				0, 		// Level ID
				4, 		// Count

				// Core Clock Gate - C1
				Package ()
				{
					0,	// Min residency (us)
					0,	// Wake latency (us)
					1,	// Flags, set bit0 to 1 to enable this state
					0,	// Arch context last flags
					0,	// Residency counter frequency
					0,	// Enabled parent state
					ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x00000000FFFFFFFF, 3)}, // Register entry method <= WFI
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						// Usage counter register
					"KryoPrime0.C1"														// Name
				},
				// C2
				Package ()
				{
					400,	// Min residency (us)
					100,	// Wake latency (us)
					0,		// Flags, set bit0 to 1 to enable this state
					0,		// Arch context last flags
					0,		// Residency counter frequency
					1,		// Enabled parent state
					// Register (AddressSpaceKeyword, RegisterBitWidth, RegisterBitOffset, RegisterAddress, AccessSize, DescriptorName)
					ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x0000000000000002, 3)},  // Register entry method 
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						 // Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						 // Usage counter register
					"KryoPrime0.C2"														 // Name
				},
				// C3
				Package ()
				{
					3990,	// Min residency (us)
					1000,	// Wake latency (us)
					1,		// Flags, set bit0 to 1 to enable this state
					1,		// Arch context last flags
					0,		// Residency counter frequency
					1,		// Enabled parent state (Enables D4)  0x40000003
					ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000003,3)}, // Core collapse.
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},					  // Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},				  	  // Usage counter register
					"KryoPrime0.C3"													  // Name
				},
				// C4 
				Package ()
				{
					4490,	// Min residency (us)
					1500,	// Wake latency (us)
					1,		// Flags, set bit0 to 1 to enable this state
					1,		// Arch context last flags
					0,		// Residency counter frequency
					2,		// Enabled parent state (Enables D4)  0x40000004
					ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000004,3)}, 	// Core collapse.
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						// Residency counter register
					ResourceTemplate(){Register(SystemMemory,0,0,0,0)},						// Usage counter register
					"KryoPrime0.C4"														// Name
				}
			}) // End of _LPI
		} // End of CPU7		
	} // End of CLUS
} // End of SYSM
