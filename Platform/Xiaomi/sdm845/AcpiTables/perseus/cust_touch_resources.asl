//===========================================================================
//                           <cust_touch_resources.asl>
// DESCRIPTION
//   This file contains the resources needed by touch driver.
//
//
//   Copyright (c) 2014-19 by QUALCOMM Technologies, Inc.  All Rights Reserved.
//   QUALCOMM Confidential and Proprietary
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
        // Touch FTS521
        Package()
        {
             "DEVICE",
             "\\_SB.TSC1",
             Package()
             { 
                 "DSTATE",
                 0x0, // D0 state

		// TLMMGPIO resource RESET
                Package()
                 {
                     "TLMMGPIO",
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
                 
                // Power source - VCC33 Power Supply
                Package()
                 {
                     "PMICVREGVOTE",                 // PMICVREGVOTE resource
                     Package()
                     {
                        "PPP_RESOURCE_ID_LDO28_A",   // PM8998 ldoa 28
                         1,                          // Voltage Regulator type = LDO
                         3300000,                    // 3.3V
                         1,                          // force (1/0) enable/disable from software
                         7,                          // power mode - Normal Power Mode
                         0,                          // head room voltage
		         "HLOS_DRV",                 // DRV ID
                         "REQUIRED",                 // Set type
                     },
                 },            

		// Power source - VCCIO  Power Supply
                Package ()
                {
                    "TLMMGPIO", 
                    Package ()
                    {
                        79,  // PIN number = 79
                        1,   // State: active = 0x1
                        0,   // Function select = 0
                        1,   // direction = Output.
                        3,   // Pull Up 
                        0,   // Drive Strength: 0x0 = 2mA
                    }
                }, 


                // eKTH6318 T1 > 0 sec.  [T1]:  the time difference between 0.9VCC33 and 0.9VCCIO. 
		        Package()
		        {
			        "DELAY",
			        Package()
			        {
				        4000,           // Delay in milliseconds
			        }
		        },		 
		   
                // Power source - TOUCH 1.8VIO POWER ENABLE to VDD_TS_1P8_LDO
//                Package()
//                {
//                    "PMICGPIO", 
//                   Package()
//                    {                                                                   
//                        "IOCTL_PM_GPIO_CONFIG_DIGITAL_OUTPUT", // GPIO or GPIO IOCTL
//                        1, // PMIC_C PM8150b
//                        4,// GPIO 5
//                        0, // PM_GPIO_OUT_BUFFER_CONFIG_CMOS
//                        1, // PM_GPIO_VIN1
//                        10,// PM_GPIO_SOURCE_HIGH
//                        3, // PM_GPIO_OUT_BUFFER_HIGH
//                       4, // PM_GPIO_I_SOURCE_PULL_DOWN_10uA
//                    },
//                }, 

                        // [T2]: The time difference between 0.9VCCIO & TS_RESET
		        Package()
		        {
			        "DELAY",
			        Package()
			        {
				        400,           // Delay in milliseconds
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
                         0,   //  Pull none 
                         0,   // Drive Strength: 0x0 = 2mA
                     },
                 },
                 
                 //may need needs ~200 ms to be ready for comm
                 Package()
                 {
                     "DELAY", 
                     Package()
                     {
                         400,  // 400 Milsec delay
                     }
                 },

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
              },

             Package()
             {
                "DSTATE",
                0x3, // D3 state    

                 // TS_INT Disable Interrupt First
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
                
                // Power source - TOUCH 1.8VIO POWER DISABLE to VDD_TS_1P8_LDO
                Package ()
                {
                    "TLMMGPIO", 
                    Package ()
                    {
                        79,  // PIN number = 79
                        0,   // State: active = 0x0
                        0,   // Function select = 0
                        1,   // direction = Output.
                        0,   // Pull Down 
                        0,   // Drive Strength: 0x0 = 2mA
                    }
                }, 
                 
		        Package()
                {
                    "DELAY", 
                    Package()
                    {
                        400,  // 4s delay
                    }
                },

                // eKTH6318 Power source - VCCIO  Power Supply Off
//                Package()
//                {
//                   "PMICGPIO", 
//                    Package()
//                    {                                                                   
//                        "IOCTL_PM_GPIO_CONFIG_DIGITAL_OUTPUT", // GPIO or GPIO IOCTL
//                        1, //  PM8150b
//                        4,// GPIO 5
//                        0, // PM_GPIO_OUT_BUFFER_CONFIG_CMOS
//                        1, // PM_GPIO_VIN1
//                        0,// PM_GPIO_SOURCE_HIGH
//                        3, // PM_GPIO_OUT_BUFFER_HIGH
//                        4, // PM_GPIO_I_SOURCE_PULL_DOWN_10uA
//                    },
//                }, 

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

                Package()
                {
                    "DELAY", 
                    Package()
                    {
                         4000,  // 2ms delay
                    }
                },

                //  Power source - VCC33- Power Supply OFF
                Package()
                {
                    "PMICVREGVOTE",                 // PMICVREGVOTE resource
                     Package()
                     {
                         "PPP_RESOURCE_ID_LDO28_A",   // ldoa 28
                         1,                          // Voltage Regulator type = LDO
                         0,                          // 0V
                         1,                          // force (1/0) enable/disable from software
                         7,                          // power mode - Low Power Mode
                         0,                          // head room voltage
				 //		 "HLOS_DRV",                 // DRV ID
                         "REQUIRED",                 // Set type
                     },
                },
		 
		//400ms delay before the backlight is off
	        Package()
                {
                    "DELAY", 
                    Package()
                    {
                        400,  // 100ms delay
                    }
                },                 
            },
        },       
    })
}
