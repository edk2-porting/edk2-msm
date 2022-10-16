//===========================================================================
//                           <audio_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by audio drivers.
//
//===========================================================================

Scope(\_SB_.PEP0) 
{

    // AUDIO 
    Method(APMD)
    {
        Return(APCC)
    }	
	
    Name(APCC,
    Package ()
    {     
        Package()
        {
            "DEVICE",
            "\\_SB.ADSP.SLM1.ADCM.AUDD",
            Package()
            {
                "COMPONENT",
                0x0, // Component 0 - EXT_CLK (LN_BB_CLK2)
                Package()
                {
                    "FSTATE",
                    0x0, // f0 statepackage()                   
                    package()
                    {
                        "PMICVREGVOTE", // PMICVREGVOTE resource
                        package()
                        {
                               "PPP_RESOURCE_ID_CXO_BUFFERS_BBCLK2_A",      // Resource ID
                               6,                                           // Voltage Regulator type = CXO Buffer
                               1,                                           // Software enable - Enable
                        },
                    },
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 statepackage()
                    package()
                    {
                        "PMICVREGVOTE", // PMICVREGVOTE resource
                        package()
                        {
                               "PPP_RESOURCE_ID_CXO_BUFFERS_BBCLK2_A",      // Resource ID
                               6,                                           // Voltage Regulator type = CXO Buffer
                               0,                                           // Software enable - Disable
                        },
                    },
                },
                Package()
                {
                    "PSTATE_SET",
                    0x0, 
                    package()
                    {
                        "PSTATE",
                        0,
                        package()
                        {
                            "PMICVREGVOTE", // PMICVREGVOTE resource
                            package()
                            {   
                                "PPP_RESOURCE_ID_SMPS4_A",                  // Resource ID
                                2,                                          // Voltage Regulator type = SMPS
                                1800000,                                    // 1.8V
                                1,                                          // Software enable - Enable
                                0,                                          // Software power mode - AUTO
                                0,                                          // Head room voltage
                            },
                        }
                    },
                    package()
                    {
                        "PSTATE",
                        1,
                        package()
                        {
                            "PMICVREGVOTE", // PMICVREGVOTE resource
                            package()
                            {   
                                "PPP_RESOURCE_ID_SMPS4_A",                  // Resource ID
                                2,                                          // Voltage Regulator type = SMPS
                                1800000,                                    // 1.8V
                                0,                                          // Software enable - Disable
                                0,                                          // Software power mode - AUTO
                                0,                                          // Head room voltage
                            },
                        },
                    },
                    Package()
                    { 
                        "PREPARE_PSTATE",
                        0,
                    },
                    Package()
                    { 
                        "ABANDON_PSTATE",
                        1,
                    },
                },
            },
			Package()
            {
                "COMPONENT",
                1, // Component 1
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
                },
            },
			Package()
            {
                "COMPONENT",
                2, // Component 2
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
                },
            },
			Package()
            {
                "COMPONENT",
                3, // Component 3
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state 					
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state                                                     
                },
            },
			//4,5,6 power components reserved for WCD and device specific requests.
			Package()
            {
                "COMPONENT",
                4, // Component 4
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state 					
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state                                                     
                },
            },
			Package()
            {
                "COMPONENT",
                5, // Component 5
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state 					
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state                                                     
                },
            },		
			
            Package()
            {
                "COMPONENT",
				6, // Component 6 used only for HDMI Rx devices
                Package()
                {
                    "FSTATE",
                    0x0, // f0 statepackage()
                    
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 statepackage()
                   
                },
            }, 
            Package()
            {
                "COMPONENT",
                7, // Component 7 for Primary MI2S Rx device TLMMGPIO resources.
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state 
					/* 
					package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            68,  // GPIO PIN number = 68 // for audio PRI MI2S SD1
                            1,   // State: active = 0x1
                            1,   // Function select = 1 //PRI_MI2S_DATA1                       
                            1,   // direction = Output.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            65,  // GPIO PIN number = 65 // for audio PRI MI2S SCLK
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            66,  // GPIO PIN number = 66 //for audio PRI MI2S WS
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },            
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            64,  // GPIO PIN number = 64 //for audio PRI MI2S MCLK
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    }, 
					*/                           
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
                    /*
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            68,  // GPIO PIN number = 68 // for audio PRI MI2S SD1
                            0,   // State: active = 0x1
                            0,   // Function select = 1 //PRI_MI2S_DATA1  
                            0,   // direction = Input.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            65,  // GPIO PIN number = 65 // for audio PRI MI2S SCLK
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            66,  // GPIO PIN number = 66 //for audio PRI MI2S WS
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },            
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            64,  // GPIO PIN number = 64 //for audio PRI MI2S MCLK
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    }, 
					*/                                            
                },
            },
            Package()
            {
                "COMPONENT",
                8, // Component 8 for Primary MI2S Tx device TLMMGPIO resources.
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                    /*
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            67,  // GPIO PIN number = 67 //for audio PRI MI2S SD0
                            1,   // State: active = 0x1 //This field is only valid if “Direction” field is “Output”, 
                            1,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down 
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            65,  // GPIO PIN number = 65 // for audio PRI MI2S SCLK
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            66,  // GPIO PIN number = 66 //for audio PRI MI2S WS
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },   
                    //TODO: Confirm if needed on 8994         
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            64,  // GPIO PIN number = 64 //for audio PRI MI2S MCLK
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    }, 
					*/
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
                    /*
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            67,  // GPIO PIN number = 67 //for audio PRI MI2S SD0
                            0,   // State: active = 0x1 //This field is only valid if “Direction” field is “Output”, 
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down 
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            65,  // GPIO PIN number = 65 // for audio PRI MI2S SCLK
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            66,  // GPIO PIN number = 66 //for audio PRI MI2S WS
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },            
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            64,  // GPIO PIN number = 64 //for audio PRI MI2S MCLK
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    }, 
					*/
                },
            },
            Package()
            {
                "COMPONENT",
                9, // Component 9 for Secondary MI2S Rx device TLMMGPIO Resources.
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                    /*
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            83,  // GPIO PIN number = 83 // for audio SEC MI2S SD1
                            1,   // State: active = 0x1
                            1,   // Function select = 1 
                            1,   // direction = Output.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            80,  // GPIO PIN number = 80 // for audio SEC MI2S SCLK
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            81,  // GPIO PIN number = 81 //for audio SEC MI2S WS
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },            
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            79,  // GPIO PIN number = 79 //for audio SEC MI2S MCLK
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    }, 
					*/                           
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
                    /*
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            83,  // GPIO PIN number = 83 // for audio SEC MI2S SD1
                            0,   // State: active = 0x1
                            0,   // Function select = 1 
                            0,   // direction = Input.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            80,  // GPIO PIN number = 80 // for audio SEC MI2S SCLK
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            81,  // GPIO PIN number = 81 //for audio SEC MI2S WS
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },            
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            79,  // GPIO PIN number = 79 //for audio SEC MI2S MCLK
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },  
					*/                                          
                },
            },        
            Package()
            {
                "COMPONENT",
                10, // Component 10 for Secondary MI2S Tx device TLMMGPIO Resources.
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                    /*
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            82,  // GPIO PIN number = 82 //for audio SEC MI2S SD0
                            1,   // State: active = 0x1 //This field is only valid if “Direction” field is “Output”, 
                            1,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down 
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            80,  // GPIO PIN number = 80 // for audio SEC MI2S SCLK
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            81,  // GPIO PIN number = 81 //for audio SEC MI2S WS
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },            
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            79,  // GPIO PIN number = 79 //for audio SEC MI2S MCLK
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },  
					*/                          
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
                    /*
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            82,  // GPIO PIN number = 82 //for audio SEC MI2S SD0
                            0,   // State: active = 0x1 //This field is only valid if “Direction” field is “Output”, 
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down 
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            80,  // GPIO PIN number = 80 // for audio SEC MI2S SCLK
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            81,  // GPIO PIN number = 81 //for audio SEC MI2S WS
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },            
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            79,  // GPIO PIN number = 79 //for audio SEC MI2S MCLK
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },  
					*/                                          
                },
            },                
            Package()
            {
                "COMPONENT",
                11, // Component 11 for TER MI2S Rx device TLMMGPIO Resources.
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                    /*
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            78,  // GPIO PIN number = 78 // for audio TER MI2S SD1
                            1,   // State: active = 0x1
                            1,   // Function select = 1 
                            1,   // direction = Output.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            75,  // GPIO PIN number = 75 // for audio TER MI2S SCLK
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            76,  // GPIO PIN number = 66 //for audio TER MI2S WS
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },            
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            74,  // GPIO PIN number = 74 //for audio TER MI2S MCLK
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },   
					*/                         
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
                    /*
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            78,  // GPIO PIN number = 78 // for audio TER MI2S SD1
                            0,   // State: active = 0x1
                            0,   // Function select = 1 
                            0,   // direction = Input.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            75,  // GPIO PIN number = 75 // for audio TER MI2S SCLK
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            76,  // GPIO PIN number = 76 //for audio TER MI2S WS
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            74,  // GPIO PIN number = 74 //for audio TER MI2S MCLK
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },  
					*/                                          
                },
            },    
            Package()
            {
                "COMPONENT",
                12, // Component 12 for FM Tx(TER MI2S Tx) device TLMMGPIO Resources.
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                    /*
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            77,  // GPIO PIN number = 77 //for audio FM Tx data
                            1,   // State: active = 0x1 //This field is only valid if “Direction” field is “Output”, 
                            1,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down 
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            75,  // GPIO PIN number = 75 // for audio FM Tx CLK
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            76,  // GPIO PIN number = 76 //for audio FM Tx SYNC
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },  
                    */
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
                    /*
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            77,  // GPIO PIN number = 77 //for audio FM Tx data
                            0,   // State: active = 0x1 //This field is only valid if “Direction” field is “Output”, 
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down 
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            75,  // GPIO PIN number = 75 // for audio FM Tx CLK
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {                
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            76,  // GPIO PIN number = 76 //for audio FM Tx SYNC
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    }, 
                    */
                },
            },    
            Package()
            {
                "COMPONENT",
                13, // Component 13 for QUAD MI2S Rx device TLMMGPIO Resources.
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            61,  // GPIO PIN number = 61 // for audio QUAD MI2S SD1
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            58,  // GPIO PIN number = 58 // for audio QUAD MI2S SCLK
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            59,  // GPIO PIN number = 59 //for audio QUAD MI2S WS
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                            
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            57,  // GPIO PIN number = 57 //for audio QUAD MI2S MCLK
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },     
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            61,  // GPIO PIN number = 61 // for audio QUAD MI2S SD1
                            0,   // State: active = 0x1
                            0,   // Function select = 1 
                            0,   // direction = Input.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            58,  // GPIO PIN number = 58 // for audio QUAD MI2S SCLK
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            59,  // GPIO PIN number = 59 //for audio QUAD MI2S WS
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },            
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            57,  // GPIO PIN number = 57 //for audio QUAD MI2S MCLK
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },  
                },
            },    
            Package()
            {
                "COMPONENT",
                14, // Component 14 for QUAD MI2S Tx device TLMMGPIO Resources.
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                    /* 
					package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            60,  // GPIO PIN number = 60 //for audio QUAD MI2S SD0
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },            
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            58,  // GPIO PIN number = 58 // for audio QUAD MI2S SCLK
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            59,  // GPIO PIN number = 59 //for audio QUAD MI2S WS
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                            
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            57,  // GPIO PIN number = 57 //for audio QUAD MI2S MCLK
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    }, 
					*/                                           
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
                    /* 
					package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            60,  // GPIO PIN number = 60 //for audio QUAD MI2S SD0
                            0,   // State: active = 0x1 //This field is only valid if “Direction” field is “Output”, 
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down 
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            58,  // GPIO PIN number = 58 // for audio QUAD MI2S SCLK
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            59,  // GPIO PIN number = 59 //for audio QUAD MI2S WS
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },            
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            57,  // GPIO PIN number = 57 //for audio QUAD MI2S MCLK
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },  
					*/                                                          
                },
            },    
            Package(){
                "COMPONENT", 
                15, // Component 15 for BT SCO Primay Rx PCM devices.
                Package(){
                    "FSTATE", 
                    0, 
                    /*
                    package(){ 
                        "TLMMGPIO", 
                        package(){ 
                            65, // GPIO Pin Number - 65 PRI BT RX CLK
                            1, // State - 1 - Active
                            1, // Function Select - 1
                            1, // Direction - 1 - Output
                            1, // Pull Type - 1 - Pull Down
                            0, // Drive Strength - 0 - 2mA
                        },
                    },
                    package(){ 
                        "TLMMGPIO", 
                        package(){ 
                            66, // GPIO Pin Number - 66 PRI BT RX SYNC
                            1, // State - 1 - Active
                            1, // Function Select - 1
                            1, // Direction - 1 - Output
                            1, // Pull Type - 1 - Pull Down
                            0, // Drive Strength - 0 - 2mA
                        },
                    },
                    package(){ 
                        "TLMMGPIO", 
                        package(){ 
                            68, // GPIO Pin Number - 68 DOUT RX
                            1, // State - 1 - Active
                            1, // Function Select - 1
                            1, // Direction - 1 - Output
                            1, // Pull Type - 1 - Pull Down
                            0, // Drive Strength - 0 - 2mA
                        },
                    }, 
                    */
                },
                Package(){
                    "FSTATE", 
                    1, 
                    /*
                    package(){ 
                        "TLMMGPIO", 
                        package(){ 
                            65, // GPIO Pin Number - 65
                            0, // State - 0 - Inactive
                            0, // Function Select - 0
                            0, // Direction - 0 - Input
                            1, // Pull Type - 1 - Pull Down
                            0, // Drive Strength - 0 - 2mA
                        },
                    },
                    package(){ 
                        "TLMMGPIO", 
                        package(){ 
                            66, // GPIO Pin Number - 66
                            0, // State - 0 - Inactive
                            0, // Function Select - 0
                            0, // Direction - 0 - Input
                            1, // Pull Type - 1 - Pull Down
                            0, // Drive Strength - 0 - 2mA
                        },
                    },
                    package(){ 
                        "TLMMGPIO", 
                        package(){ 
                            68, // GPIO Pin Number - 68
                            0, // State - 0 - Inactive
                            0, // Function Select - 0
                            0, // Direction - 0 - Input
                            1, // Pull Type - 1 - Pull Down
                            0, // Drive Strength - 0 - 2mA
                        },
                    },
                    */
                },
            },
            Package(){
                "COMPONENT", 
                16, // Component 16 for BT SCO Primay Tx PCM devices.
                Package(){
                    "FSTATE", 
                    0, 
                    /*
                    package(){ 
                        "TLMMGPIO", 
                        package(){ 
                            67, // GPIO Pin Number - 67 DIN
                            1, // State - 1 - Active
                            1, // Function Select - 1
                            0, // Direction - 0 - Input
                            1, // Pull Type - 1 - Pull Down
                            0, // Drive Strength - 0 - 2mA
                        },
                    },
                    package(){ 
                        "TLMMGPIO", 
                        package(){ 
                            66, // GPIO Pin Number - 66 SYNC
                            1, // State - 1 - Active
                            1, // Function Select - 1
                            1, // Direction - 1 - Output
                            1, // Pull Type - 1 - Pull Down
                            0, // Drive Strength - 0 - 2mA
                        },
                    },
                    package(){ 
                        "TLMMGPIO", 
                        package(){ 
                            65, // GPIO Pin Number - 65 CLK
                            1, // State - 1 - Active
                            1, // Function Select - 1
                            1, // Direction - 1 - Output
                            1, // Pull Type - 1 - Pull Down
                            0, // Drive Strength - 0 - 2mA
                        },
                    }, 
                    */
                },
                Package(){
                    "FSTATE", 
                    1, 
                    /*
                    package(){ 
                        "TLMMGPIO", 
                        package(){ 
                            67, // GPIO Pin Number - 67
                            0, // State - 0 - Inactive
                            0, // Function Select - 0
                            0, // Direction - 0 - Input
                            1, // Pull Type - 1 - Pull Down
                            0, // Drive Strength - 0 - 2mA
                        },
                    },
                    package(){ 
                        "TLMMGPIO", 
                        package(){ 
                            66, // GPIO Pin Number - 66
                            0, // State - 0 - Inactive
                            0, // Function Select - 0
                            0, // Direction - 0 - Input
                            1, // Pull Type - 1 - Pull Down
                            0, // Drive Strength - 0 - 2mA
                        },
                    },
                    package(){ 
                        "TLMMGPIO", 
                        package(){ 
                            65, // GPIO Pin Number - 65
                            0, // State - 0 - Inactive
                            0, // Function Select - 0
                            0, // Direction - 0 - Input
                            1, // Pull Type - 1 - Pull Down
                            0, // Drive Strength - 0 - 2mA
                        },
                    }, 
                    */
                },
            },
            Package()
            {
                "COMPONENT",
                17, // Component 17 for SEC Rx PCM devices.
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                    /*
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            83,  // GPIO PIN number = 83 // for audio PCM DOut
                            1,   // State: active = 0x1
                            1,   // Function select = 1 
                            1,   // direction = Output.
                            0,   // 0: No Pull
                            3,   // Drive Strength: 0x0 = 8mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            80,  // GPIO PIN number = 80 // for audio PCM CLK
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            0,   // 0: No Pull
                            3,   // Drive Strength: 0x0 = 8mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            81,  // GPIO PIN number = 81 //for audio PCM sync
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            0,   // 0: No Pull
                            3,   // Drive Strength: 0x0 = 8mA
                        },
                    },    
					*/					
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
                    /*
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            83,  // GPIO PIN number = 83 // for audio PCM Dout
                            0,   // State: active = 0x1
                            0,   // Function select = 1 
                            0,   // direction = Input. 
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                    
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            80,  // GPIO PIN number = 80 // for audio_pcm_clk    
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            81,  // GPIO PIN number = 81 //for audio_pcm_sync
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },
					*/					
                },
            },                        
            Package()
            {
                "COMPONENT",
                18, // Component 18 for SEC Tx PCM devices.
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                    /*
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            82,  // GPIO PIN number = 82 //for audio PCM DIn
                            1,   // State: active = 0x1 //This field is only valid if “Direction” field is “Output”, 
                            1,   // Function select = 1
                            0,   // direction = Input.
                            0,   // 0: No Pull
                            3,   // Drive Strength: 0x0 = 2mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            80,  // GPIO PIN number = 80 // for audio PCM CLK
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            0,   // 0: No Pull
                            3,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            81,  // GPIO PIN number = 81 //for audio PCM sync
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            0,   // 0: No Pull
                            3,   // Drive Strength: 0x0 = 2mA
                        },
                    },  
					*/
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
                    /*                               
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            82,  // GPIO PIN number = 82 //for audio_pcm_din
                            0,   // State: active = 0x1 //This field is only valid if “Direction” field is “Output”, 
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            80,  // GPIO PIN number = 80 // for audio_pcm_clk    
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            81,  // GPIO PIN number = 81 //for audio_pcm_sync
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    }, 
					*/
                },
            },    
            Package()
            {
                "COMPONENT",
                19, // Component 19 for I2S SPKR Rx device TLMMGPIO resources.
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state 
					/* 
					package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            71,  // GPIO PIN number = 71 // for audio I2S SPKR SD0
                            1,   // State: active = 0x1
                            2,   // Function select = 2 
                            1,   // direction = Output.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            70,  // GPIO PIN number = 70 // for audio I2S SPKR SCLK
                            1,   // State: active = 0x1
                            2,   // Function select = 2
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            72,  // GPIO PIN number = 72 //for audio I2S SPKR WS
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },            
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            69,  // GPIO PIN number = 69 //for audio I2S SPKR MCLK
                            1,   // State: active = 0x1
                            2,   // Function select = 2
                            1,   // direction = Output.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    }, 
					*/                           
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
					/* 
					package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            71,  // GPIO PIN number = 71 // for audio I2S SPKR SD0
                            0,   // State: active = 0x1
                            0,   // Function select = 2 
                            0,   // direction = Input.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            70,  // GPIO PIN number = 70 // for audio I2S SPKR SCLK
                            0,   // State: active = 0x1
                            0,   // Function select = 2
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            72,  // GPIO PIN number = 72 //for audio I2S SPKR WS
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },            
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            69,  // GPIO PIN number = 69 //for audio I2S SPKR MCLK
                            0,   // State: active = 0x1
                            0,   // Function select = 2
                            0,   // direction = Input.
                            1,   // Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    }, 
					*/                           
                },
            },
            Package()
            {
                "COMPONENT",
                20, // Component 20 for TER Rx PCM devices.
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                    /*
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            78,  // GPIO PIN number = 78 // for audio PCM DOut
                            1,   // State: active = 0x1
                            1,   // Function select = 1 
                            1,   // direction = Output.
                            0,   // 0: No Pull
                            3,   // Drive Strength: 0x0 = 8mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            75,  // GPIO PIN number = 75 // for audio PCM CLK
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            0,   // 0: No Pull
                            3,   // Drive Strength: 0x0 = 8mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            76,  // GPIO PIN number = 76 //for audio PCM sync
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            0,   // 0: No Pull
                            3,   // Drive Strength: 0x0 = 8mA
                        },
                    },    
					*/					
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
                    /*
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            78,  // GPIO PIN number = 78 // for audio PCM Dout
                            0,   // State: active = 0x1
                            0,   // Function select = 1 
                            0,   // direction = Input. 
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                    
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            75,  // GPIO PIN number = 75 // for audio_pcm_clk    
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            76,  // GPIO PIN number = 76 //for audio_pcm_sync
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },
					*/
                },
            },                        
            Package()
            {
                "COMPONENT",
                21, // Component 21 for TER Tx PCM devices.
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                    /*
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            77,  // GPIO PIN number = 77 //for audio PCM DIn
                            1,   // State: active = 0x1 //This field is only valid if “Direction” field is “Output”, 
                            1,   // Function select = 1
                            0,   // direction = Input.
                            0,   // 0: No Pull
                            3,   // Drive Strength: 0x0 = 2mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            75,  // GPIO PIN number = 75 // for audio PCM CLK
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            0,   // 0: No Pull
                            3,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            76,  // GPIO PIN number = 76 //for audio PCM sync
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            0,   // 0: No Pull
                            3,   // Drive Strength: 0x0 = 2mA
                        },
                    },  
					*/
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
                    /*                               
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            77,  // GPIO PIN number = 77 //for audio_pcm_din
                            0,   // State: active = 0x1 //This field is only valid if “Direction” field is “Output”, 
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            75,  // GPIO PIN number = 75 // for audio_pcm_clk    
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            76,  // GPIO PIN number = 76 //for audio_pcm_sync
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    }, 
                    */
                },
            },
            Package()
            {
                "COMPONENT",
                22, // Component 22 for QUAD Rx PCM devices.
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                    /*
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            61,  // GPIO PIN number = 61 // for audio PCM DOut
                            1,   // State: active = 0x1
                            1,   // Function select = 1 
                            1,   // direction = Output.
                            0,   // 0: No Pull
                            3,   // Drive Strength: 0x0 = 8mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            58,  // GPIO PIN number = 58 // for audio PCM CLK
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            0,   // 0: No Pull
                            3,   // Drive Strength: 0x0 = 8mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            59,  // GPIO PIN number = 59 //for audio PCM sync
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            0,   // 0: No Pull
                            3,   // Drive Strength: 0x0 = 8mA
                        },
                    },    
					*/					
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
                    /*
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            61,  // GPIO PIN number = 61 // for audio PCM Dout
                            0,   // State: active = 0x1
                            0,   // Function select = 1 
                            0,   // direction = Input. 
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                    
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            58,  // GPIO PIN number = 58 // for audio_pcm_clk    
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            59,  // GPIO PIN number = 59 //for audio_pcm_sync
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },
					*/					
                },
            },                        
            Package()
            {
                "COMPONENT",
                23, // Component 23 for QUAD Tx PCM devices.
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                    /*
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            60,  // GPIO PIN number = 60 //for audio PCM DIn
                            1,   // State: active = 0x1 //This field is only valid if “Direction” field is “Output”, 
                            1,   // Function select = 1
                            0,   // direction = Input.
                            0,   // 0: No Pull
                            3,   // Drive Strength: 0x0 = 2mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            58,  // GPIO PIN number = 58 // for audio PCM CLK
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            0,   // 0: No Pull
                            3,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            59,  // GPIO PIN number = 59 //for audio PCM sync
                            1,   // State: active = 0x1
                            1,   // Function select = 1
                            1,   // direction = Output.
                            0,   // 0: No Pull
                            3,   // Drive Strength: 0x0 = 2mA
                        },
                    },  
					*/
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
                    /*                               
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            60,  // GPIO PIN number = 60 //for audio_pcm_din
                            0,   // State: active = 0x1 //This field is only valid if “Direction” field is “Output”, 
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            58,  // GPIO PIN number = 58 // for audio_pcm_clk    
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    },                
                    package()
                    {
                        "TLMMGPIO", // TLMMGPIO resource 
                        package()
                        {                                    
                            59,  // GPIO PIN number = 59 //for audio_pcm_sync
                            0,   // State: active = 0x1
                            0,   // Function select = 1
                            0,   // direction = Input.
                            1,   // 1: Pull Down
                            0,   // Drive Strength: 0x0 = 2mA
                        },
                    }, 
                    */
                },
            },
        },// end AUDD
        /////////////////////////////////////////////////////////////////////////////////////
        Package()
        {
            "DEVICE",
            "\\_SB.ADSP.SLM1.ADCM.AUDD.MBHC",
            Package()
            {
                "COMPONENT",
                0x0, // Component 0.
                Package()
                {
                    "FSTATE",
                    0x0, // f0 statepackage()
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 statepackage()
                },
            },
        },// end MBHC
    })
}
