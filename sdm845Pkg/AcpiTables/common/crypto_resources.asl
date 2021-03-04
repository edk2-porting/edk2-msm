//===========================================================================
//                           <crypto_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by pep drivers.
//
//
//===========================================================================



Scope(\_SB_.PEP0) 
{

    // CRYPTO 
    Method(CRMD)
    {
        Return(CRCC)
    }	
	
	
    Name(CRCC,
    Package ()
    { 
	//Device QsecureMSM Data
        Package()
        {
            "DEVICE",
            "\\_SB.QBCC",
            
            Package()
            {
                "COMPONENT",
                0x0, // Component 0. PRNG
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
		
                    //package() {"REQUIRED_RESOURCE", package() { 1, "/clk/pnoc"  , 100000}},  // 100MHz
                    package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_PRNG", 800000000, 0}},      
                    // Earlier the clock request was 100MHz. Replacing it with BUSARB: 800MB/s is requested because the bus width is 8 bytes, so one 8-byte transfer occurs per clock.
                    
					
		            package()
                    {
                        "CLOCK", // Clock resource
                        package()
                        {
                            "gcc_prng_ahb_clk",  // Clock name
                            1,             // Enable
                            0,             // na
                            1,             // Match, at least
                        }
                    },
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
                    //package() {"REQUIRED_RESOURCE", package() { 1, "/clk/pnoc"  , 0}}, 	
                    package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_PRNG", 0, 0}},

		            package()
                    {
                        "CLOCK", // Clock resource
                        package()
                        {
                            "gcc_prng_ahb_clk",  // Clock name
                            2,             // Disable
                            0,             // na
                            1,             // Match, at least
                        }
                    },
                },
            },
			
    	    Package()
            {
		        "COMPONENT",
                0x1, // Component 1. Dedicated Crypto (CRYPTO1 - ce2)
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                    //package() {"REQUIRED_RESOURCE", package() { 1, "/clk/snoc", 0xffffffff}},
                    //package() {"REQUIRED_RESOURCE", package() { 1, "/clk/cnoc", 0xffffffff}},
                    //package() {"BUSARB", Package() { 3, "ICBID_MASTER_CRYPTO_CORE1", "ICBID_SLAVE_EBI1", 200000000, 200000000}},			

                    package()
                    {
                        "CLOCK", // Clock resource
                        package()
                        {
                            "gcc_ce2_ahb_clk",  // Clock name
                            1,             // 1: Enable 
                            0,             // Freq: NA
                            1,             // Match: 1, at least
                        }
                    },                        
                    package()
                    {
                        "CLOCK", // Clock resource
                        package()
                        {
                            "gcc_ce2_axi_clk",  // Clock name
                            1,             // 1: Enable 
                            0,             // Freq: NA
                            1,             // Match: 1, at least
                        }
                    },
                    package()
                    {
                        "CLOCK", // Clock resource
                        package()
                        {
                            "gcc_ce2_clk",  // Clock name
                            1,             // 1: Enable
                            0,             // Freq: NA
                            1,             // Match: 1, at least
                        }
                    },
                    
                    //Attach with Pstate 0 (Highest Power)
                    package(){"PSTATE_ADJUST", Package () { 0, 0 }},
                },

                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
	                //package() {"REQUIRED_RESOURCE", package() { 0, "/clk/snoc", 0x0}},
                    //package() {"REQUIRED_RESOURCE", package() { 0, "/clk/cnoc", 0x0}},
                    
                    //Attach with Pstate 3 (Remove bandwidth vote)
                    package(){"PSTATE_ADJUST", Package () { 0, 3 }},

                    package()
                    {
                        "CLOCK", // Clock resource
                        package()
                        {
                                "gcc_ce2_ahb_clk",  // Clock name
                                2,             // Disable
                                0,             // na
                                1,             // Match: At Least
                        }
                    },

                    package()
                    {
                        "CLOCK", // Clock resource
                        package()
                        {
                                "gcc_ce2_axi_clk",  // Clock name
                                2,             // Disable
                                0,             // na
                                1,             // Match: At Least
                        }
                    },
                    package()
                    {
                        "CLOCK", // Clock resource
                        package()
                        {
                                "gcc_ce2_clk",  // Clock name
                                2,             // Disable
                                0,             // na
                                1,             // Match: At Least
                        }
                    },
                },

                Package()
                {
                    "PSTATE",
                    0x0, // P0 state
                    //Highest power state , vote for max possible frequency, Device should already be in F0, before reaching this state
                    package() {"BUSARB", Package() { 3, "ICBID_MASTER_CRYPTO_CORE1", "ICBID_SLAVE_EBI1", 200000000, 200000000}},
                    
                    package()
                    {
                        "CLOCK", // Clock resource
                        package()
                        {
                            "gcc_ce2_clk", // Clock name
                            3,             // 3: Set
                            171430000,     // Freq: 171.43 Mhz (Turbo/Nominal)
                            1,             // Match: 1, at least
                        }
                    },
                },
                Package()
                {
                    "PSTATE",
                    0x1, // P1 state
                    //Low power state , vote for less frequency, Device should already be in F0, before reaching this state
                    package() {"BUSARB", Package() { 3, "ICBID_MASTER_CRYPTO_CORE1", "ICBID_SLAVE_EBI1", 100000000, 100000000}},
                    
                    package()
                    {
                        "CLOCK", // Clock resource
                        package()
                        {
                            "gcc_ce2_clk", // Clock name
                            3,             // 3: Set
                            85710000,      // Freq: 85.71 Mhz (SVS)
                            1,             // Match: 1, at least
                        }
                    },
                },
                Package()
                {
                    "PSTATE",
                    0x2, // P2 state
                    //Lower power state , vote for least possible frequency, Device should already be in F0, before reaching this state
                    package() {"BUSARB", Package() { 3, "ICBID_MASTER_CRYPTO_CORE1", "ICBID_SLAVE_EBI1", 50000000, 50000000}},
                    
                    package()
                    {
                        "CLOCK", // Clock resource
                        package()
                        {
                            "gcc_ce2_clk", // Clock name
                            3,             // 3: Set
                            42860000,      // Freq: 42.86 Mhz (SVS2)
                            1,             // Match: 1, at least
                        }
                    },
                },
                Package()
                {
                    "PSTATE",
                    0x3, // P3 state
                    //Off power state , remove bandwidth votes. Device should transition to this state before going to F1
                    package() {"BUSARB", Package() { 3, "ICBID_MASTER_CRYPTO_CORE1", "ICBID_SLAVE_EBI1", 0, 0}},
                    
                    package()
                    {
                        "CLOCK", // Clock resource
                        package()
                        {
                            "gcc_ce2_clk", // Clock name
                            3,             // 3: Set
                            42860000,      // Freq: 42.86 Mhz (SVS2)
                            1,             // Match: 1, at least
                        }
                    },
                },
    	    },
	
    	    Package()
            {
		        "COMPONENT",
                0x2, // Component 2. Shared Crypto (CRYPTO0)
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                    
                    //skubair: New way to turn on/off clocks through NPA
                    package(){ "REQUIRED_RESOURCE", package(){ 1, "/clk/ce1", 1 } },
                    
                    //Attach with Pstate 0 (Highest Power)
                    package(){"PSTATE_ADJUST", Package () { 0, 0 }},
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
	                
                    //Attach with Pstate 3 (Remove bandwidth vote)
                    package(){"PSTATE_ADJUST", Package () { 0, 3 }},
                    
                    //skubair: New way to turn on/off clocks through NPA
                    //Removing below vote. Instead, setting the freq to 0 Hz in P3
                    //package(){ "REQUIRED_RESOURCE", package(){ 1, "/clk/ce1", 0 } },
                },
                Package()
                {
                    "PSTATE",
                    0x0, // P0 state
                    //Highest power state , vote for max possible frequency, Device should already be in F0, before reaching this state
                    package() {"BUSARB", Package() { 3, "ICBID_MASTER_CRYPTO_CORE0", "ICBID_SLAVE_EBI1", 200000000, 200000000}},
                    
                    //skubair: New way to turn on/off clocks through NPA
                    package(){ "REQUIRED_RESOURCE", package(){ 1, "/clk/ce1", 171430 } },
                },
                Package()
                {
                    "PSTATE",
                    0x1, // P1 state
                    //Low power state , vote for less frequency, Device should already be in F0, before reaching this state
                    package() {"BUSARB", Package() { 3, "ICBID_MASTER_CRYPTO_CORE0", "ICBID_SLAVE_EBI1", 100000000, 100000000}},
                    
                    //skubair: New way to turn on/off clocks through NPA
                    package(){ "REQUIRED_RESOURCE", package(){ 1, "/clk/ce1", 85710 } },
                },
                Package()
                {
                    "PSTATE",
                    0x2, // P2 state
                    //Lower power state , vote for least possible frequency, Device should already be in F0, before reaching this state
                    package() {"BUSARB", Package() { 3, "ICBID_MASTER_CRYPTO_CORE0", "ICBID_SLAVE_EBI1", 50000000, 50000000}},
                    
                    //skubair: New way to turn on/off clocks through NPA
                    package(){ "REQUIRED_RESOURCE", package(){ 1, "/clk/ce1", 42860 } },
                },
                Package()
                {
                    "PSTATE",
                    0x3, // P3 state
                    //Off power state , remove bandwidth votes. Device should transition to this state before going to F1
                    package() {"BUSARB", Package() { 3, "ICBID_MASTER_CRYPTO_CORE0", "ICBID_SLAVE_EBI1", 0, 0}},
                    
                    //skubair: New way to turn on/off clocks through NPA
                    package(){ "REQUIRED_RESOURCE", package(){ 1, "/clk/ce1", 0 } },
                },
	        },

            Package()
            {
                "COMPONENT",
                0x3, // Component 3. Dedicated Crypto (CRYPTO2)
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                    //package() {"REQUIRED_RESOURCE", package() { 1, "/clk/snoc", 0xffffffff}},
                    //package() {"REQUIRED_RESOURCE", package() { 1, "/clk/cnoc", 0xffffffff}},
                    //package() {"BUSARB", Package() { 3, "ICBID_MASTER_CRYPTO_CORE2", "ICBID_SLAVE_EBI1", 200000000, 200000000}},     
                    
                    package()
                    {
                        "CLOCK", // Clock resource
                        package()
                        {
                            "gcc_ce3_ahb_clk",  // Clock name
                            1,             // 1: Enable 
                            0,             // Freq: NA
                            1,             // Match: 1, at least
                        }
                    },                        
                    package()
                    {
                        "CLOCK", // Clock resource
                        package()
                        {
                            "gcc_ce3_axi_clk",  // Clock name
                            1,             // 1: Enable 
                            0,             // Freq: NA
                            1,             // Match: 1, at least
                        }
                    },
                    package()
                    {
                        "CLOCK", // Clock resource
                        package()
                        {
                            "gcc_ce3_clk",  // Clock name
                            1,             // 1: Enable
                            0,             // Freq: NA
                            1,             // Match: 1, at least
                        }
                    },
                    
                    //Attach with Pstate 0 (Highest Power)
                    package(){"PSTATE_ADJUST", Package () { 0, 0 }},
                },

                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
                    //package() {"REQUIRED_RESOURCE", package() { 0, "/clk/snoc", 0x0}},
                    //package() {"REQUIRED_RESOURCE", package() { 0, "/clk/cnoc", 0x0}},
                    
                    //Attach with Pstate 3 (Remove bandwidth vote)
                    package(){"PSTATE_ADJUST", Package () { 0, 3 }},

                    package()
                    {
                        "CLOCK", // Clock resource
                        package()
                        {
                                "gcc_ce3_ahb_clk",  // Clock name
                                2,             // Disable
                                0,             // na
                                1,             // Match: At Least
                        }
                    },

                    package()
                    {
                        "CLOCK", // Clock resource
                        package()
                        {
                                "gcc_ce3_axi_clk",  // Clock name
                                2,             // Disable
                                0,             // na
                                1,             // Match: At Least
                        }
                    },
                    package()
                    {
                        "CLOCK", // Clock resource
                        package()
                        {
                                "gcc_ce3_clk",  // Clock name
                                2,             // Disable
                                0,             // na
                                1,             // Match: At Least
                        }
                    },
                },

                Package()
                {
                    "PSTATE",
                    0x0, // P0 state
                    //Highest power state , vote for max possible frequency, Device should already be in F0, before reaching this state
                    package() {"BUSARB", Package() { 3, "ICBID_MASTER_CRYPTO_CORE2", "ICBID_SLAVE_EBI1", 200000000, 200000000}},
                    
                    package()
                    {
                        "CLOCK", // Clock resource
                        package()
                        {
                            "gcc_ce3_clk", // Clock name
                            3,             // 3: Set
                            171430000,     // Freq: 171.43 Mhz (Turbo/Nominal)
                            1,             // Match: At Least
                        }
                    },
                },
                Package()
                {
                    "PSTATE",
                    0x1, // P1 state
                    //Low power state , vote for less frequency, Device should already be in F0, before reaching this state
                    package() {"BUSARB", Package() { 3, "ICBID_MASTER_CRYPTO_CORE2", "ICBID_SLAVE_EBI1", 100000000, 100000000}},
                    
                    package()
                    {
                        "CLOCK", // Clock resource
                        package()
                        {
                            "gcc_ce3_clk", // Clock name
                            3,             // 3: Set
                            85710000,      // Freq: 85.71 Mhz (SVS)
                            1,             // Match: At Least
                        }
                    },
                },
                Package()
                {
                    "PSTATE",
                    0x2, // P2 state
                    //Lower power state , vote for least possible frequency, Device should already be in F0, before reaching this state
                    package() {"BUSARB", Package() { 3, "ICBID_MASTER_CRYPTO_CORE2", "ICBID_SLAVE_EBI1", 50000000, 50000000}},
                    
                    package()
                    {
                        "CLOCK", // Clock resource
                        package()
                        {
                            "gcc_ce3_clk", // Clock name
                            3,             // 3: Set
                            42860000,      // Freq: 42.86 Mhz (SVS2)
                            1,             // Match: At Least
                        }
                    },
                },
                Package()
                {
                    "PSTATE",
                    0x3, // P3 state
                    //Off power state , remove bandwidth votes. Device should transition to this state before going to F1
                    package() {"BUSARB", Package() { 3, "ICBID_MASTER_CRYPTO_CORE2", "ICBID_SLAVE_EBI1", 0, 0}},
                    
                    package()
                    {
                        "CLOCK", // Clock resource
                        package()
                        {
                            "gcc_ce3_clk", // Clock name
                            3,             // 3: Set
                            42860000,      // Freq: 42.86 Mhz (SVS2)
                            1,             // Match: At Least
                        }
                    },
                },
            },
	    }
    })
}
