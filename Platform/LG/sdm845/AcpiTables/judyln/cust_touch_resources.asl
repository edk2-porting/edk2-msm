//===========================================================================
//                           <cust_touch_resources.asl>
// DESCRIPTION
//   This file contains the resources needed by touch driver.
//
//
//===========================================================================
Scope(\_SB_.PEP0)
{
    
  Method(LPMX)
  {
     Return(LPXC)
  }
  
  Name(LPXC,
    Package(){
        // Touch LVS1
        Package()
        {
             "DEVICE",
             "\\_SB.TSC1",
             Package()
             { 
                "DSTATE",
                0x0, // D0 state
                
                // TS_INT configuration
                Package()
                {
                    "TLMMGPIO", // TLMMGPIO resource TS_INT
                    Package()
                    {                                    
                        31,  // PIN number = 31
                        0,   // State: NOT active = 0x0
                        0,   // Function select = 0
                        0,   // direction = Input.
                        3,   // Pull Up 
                        0,   // Drive Strength: 0x0 = 2mA
                    },
                },
                Package()
                {
                    "TLMMGPIO", // TLMMGPIO resource RESET
                    Package()
                    {                                    
                        32,  // PIN number = 32
                        0,   // State: NOT active = 0x0
                        0,   // Function select = 0
                        1,   // direction = Output.
                        0,   // NO Pull 
                        0,   // Drive Strength: 0x0 = 2mA
                    },
                },

                // Synaptics Power source - VDD
                Package()
                {
                    "PMICVREGVOTE",                 // PMICVREGVOTE resource
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO14_A",  // VREG ID
                        1,                          // Voltage Regulator type = LDO
                        1800000,                    // 3.3V
                        1,                          // force enable from software
                        7,                          // power mode - Normal Power Mode
                        0,                          // head room voltage
                    },
                },

                // I2C Pull Up source
                // Package()
                // {
                //     "TLMMGPIO",
                //     Package()
                //     {                                    
                //         23,  // PIN number = 23
                //         1,   // State: active = 0x1
                //         0,   // Function select = 0
                //         1,   // direction = Output.
                //         3,   // Pull Up 
                //         0,   // Drive Strength: 0x0 = 2mA
                //     },
                // },
                
                Package()
                {
                    "DELAY", // Hold the RESET line LOW after power up for 2ms
                    Package()
                    {
                        1000,  // 2 Milsec delay
                    }
                },
                
                // Drive RESET Line High
                Package()
                {
                    "TLMMGPIO", // TLMMGPIO resource TS_RESET 
                    Package()
                    {                                    
                        32,  // PIN number = 32
                        1,   // State: active = 0x1
                        0,   // Function select = 0
                        1,   // direction = O/P
                        0,   // Pull Up
                        0,   // Drive Strength: 0x0 = 2mA
                    },
                },
                
                // Synaptics may need needs ~200 ms to be ready for comm
                Package()
                {
                    "DELAY", 
                    Package()
                    {
                        20000,  // 200 Milsec delay
                    }
                },
             },
             Package()
             {
                "DSTATE",
                0x3, // D3 state    
                
                // Synaptics Power source - VDD
                Package()
                {
                    "PMICVREGVOTE",                 // PMICVREGVOTE resource
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO14_A",  // VREG ID
                        1,                          // Voltage Regulator type = LDO
                        0,                          // Voltage is in micro volts
                        0,                          // Force disable from s/w
                        5,                          // power mode - Low Power Mode
                        0,                          // head room voltage
                    },
                },
                
                // I2C Pull Up source
                // Package()
                // {
                //     "TLMMGPIO",
                //     Package()
                //     {                                    
                //         23,  // PIN number = 23
                //         0,   // State: IN active = 0x0
                //         0,   // Function select = 0
                //         1,   // direction = Output.
                //         1,   // Pull Down 
                //         0,   // Drive Strength: 0x0 = 2mA
                //     },
                // },               
                 
                // RESET pin - power save mode 
                Package()
                {
                    "TLMMGPIO", // TLMMGPIO resource RESET
                    Package()
                    {                                    
                        32,  // PIN number = 32
                        0,   // State: IN active = 0x0
                        0,   // Function select = 0
                        0,   // direction = Output.
                        1,   // Pull Down
                        0,   // Drive Strength: 0x0 = 2mA
                    },
                },

                // TS_INT configuration - power save mode
                Package()
                {
                    "TLMMGPIO", // TLMMGPIO resource TS_INT
                    Package()
                    {                                    
                        31,  // PIN number = 31
                        0,   // State: IN active = 0x0
                        0,   // Function select = 0
                        0,   // direction = Input.
                        1,   // Pull Down 
                        0,   // Drive Strength: 0x0 = 2mA
                    },
                },
             },
         },       
    })
}

Scope(\_SB_.PEP0)
{
    
  Method(LPMZ)
  {
     Return(LPXD)
  }
  
  Name(LPXD,
    Package(){
        // Touch LVS1
        Package()
        {
             "DEVICE",
             "\\_SB.TSC2",
             Package()
             { 
                "DSTATE",
                0x0, // D0 state
                
                // TS_INT configuration
                Package()
                {
                    "TLMMGPIO", // TLMMGPIO resource TS_INT
                    Package()
                    {                                    
                        31,  // PIN number = 31
                        0,   // State: NOT active = 0x0
                        0,   // Function select = 0
                        0,   // direction = Input.
                        3,   // Pull Up 
                        0,   // Drive Strength: 0x0 = 2mA
                    },
                },
                Package()
                {
                    "TLMMGPIO", // TLMMGPIO resource RESET
                    Package()
                    {                                    
                        32,  // PIN number = 32
                        0,   // State: NOT active = 0x0
                        0,   // Function select = 0
                        1,   // direction = Output.
                        0,   // NO Pull 
                        0,   // Drive Strength: 0x0 = 2mA
                    },
                },

                // Synaptics Power source - VDD
                Package()
                {
                    "PMICVREGVOTE",                 // PMICVREGVOTE resource
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO14_A",  // VREG ID
                        1,                          // Voltage Regulator type = LDO
                        1800000,                    // 3.3V
                        1,                          // force enable from software
                        7,                          // power mode - Normal Power Mode
                        0,                          // head room voltage
                    },
                },

                // I2C Pull Up source
                // Package()
                // {
                //     "TLMMGPIO",
                //     Package()
                //     {                                    
                //         23,  // PIN number = 23
                //         1,   // State: active = 0x1
                //         0,   // Function select = 0
                //         1,   // direction = Output.
                //         3,   // Pull Up 
                //         0,   // Drive Strength: 0x0 = 2mA
                //     },
                // },
                
                Package()
                {
                    "DELAY", // Hold the RESET line LOW after power up for 2ms
                    Package()
                    {
                        1000,  // 2 Milsec delay
                    }
                },
                
                // Drive RESET Line High
                Package()
                {
                    "TLMMGPIO", // TLMMGPIO resource TS_RESET 
                    Package()
                    {                                    
                        32,  // PIN number = 32
                        1,   // State: active = 0x1
                        0,   // Function select = 0
                        1,   // direction = O/P
                        0,   // Pull Up
                        0,   // Drive Strength: 0x0 = 2mA
                    },
                },
                
                // Synaptics may need needs ~200 ms to be ready for comm
                Package()
                {
                    "DELAY", 
                    Package()
                    {
                        20000,  // 200 Milsec delay
                    }
                },
             },
             Package()
             {
                "DSTATE",
                0x3, // D3 state    
                
                // Synaptics Power source - VDD
                Package()
                {
                    "PMICVREGVOTE",                 // PMICVREGVOTE resource
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO14_A",  // VREG ID
                        1,                          // Voltage Regulator type = LDO
                        0,                          // Voltage is in micro volts
                        0,                          // Force disable from s/w
                        5,                          // power mode - Low Power Mode
                        0,                          // head room voltage
                    },
                },
                
                // I2C Pull Up source
                // Package()
                // {
                //     "TLMMGPIO",
                //     Package()
                //     {                                    
                //         23,  // PIN number = 23
                //         0,   // State: IN active = 0x0
                //         0,   // Function select = 0
                //         1,   // direction = Output.
                //         1,   // Pull Down 
                //         0,   // Drive Strength: 0x0 = 2mA
                //     },
                // },               
                 
                // RESET pin - power save mode 
                Package()
                {
                    "TLMMGPIO", // TLMMGPIO resource RESET
                    Package()
                    {                                    
                        32,  // PIN number = 32
                        0,   // State: IN active = 0x0
                        0,   // Function select = 0
                        0,   // direction = Output.
                        1,   // Pull Down
                        0,   // Drive Strength: 0x0 = 2mA
                    },
                },

                // TS_INT configuration - power save mode
                Package()
                {
                    "TLMMGPIO", // TLMMGPIO resource TS_INT
                    Package()
                    {                                    
                        31,  // PIN number = 31
                        0,   // State: IN active = 0x0
                        0,   // Function select = 0
                        0,   // direction = Input.
                        1,   // Pull Down 
                        0,   // Drive Strength: 0x0 = 2mA
                    },
                },
             },
         },       
    })
}
