Scope(\_SB.PEP0)
{
	Method(CTSN)
	{
		return (THSD)
	}
	
    Method(PEPH)
    {
       Return(Package()
       {           
          "ACPI\\VEN_QCOM&DEV_0237",          
       })
    }
	
	Method(BCLH)
    {
       Return(Package()
       {           
          "ACPI\\VEN_QCOM&DEV_0294",          
       })
    }
    
    // Thermal sensors PL specific configurations
    Name(THSD,
    
		Package()
		{
			//	Below package contains a list of all the identified physical thermal sensors mapped to unique HIDs
			//	
			Package() 
			{
				21, //Total number of thermal physical sensors
				
			    //        sensor HID,                 sensor number associated to HID 
				Package() {"ACPI\\VEN_QCOM&DEV_027F", 0},
				Package() {"ACPI\\VEN_QCOM&DEV_0280", 1},
				Package() {"ACPI\\VEN_QCOM&DEV_0281", 2},
				Package() {"ACPI\\VEN_QCOM&DEV_0282", 3},				
				Package() {"ACPI\\VEN_QCOM&DEV_0283", 4},
				Package() {"ACPI\\VEN_QCOM&DEV_0284", 5},
				Package() {"ACPI\\VEN_QCOM&DEV_0285", 6},
				Package() {"ACPI\\VEN_QCOM&DEV_0286", 7},
				Package() {"ACPI\\VEN_QCOM&DEV_0287", 8},
				Package() {"ACPI\\VEN_QCOM&DEV_0288", 9},
				Package() {"ACPI\\VEN_QCOM&DEV_0289", 10},
				Package() {"ACPI\\VEN_QCOM&DEV_02AB", 11},
				Package() {"ACPI\\VEN_QCOM&DEV_02AC", 12},
				Package() {"ACPI\\VEN_QCOM&DEV_02AD", 13},
				package() {"ACPI\\VEN_QCOM&DEV_02AE", 14},
				Package() {"ACPI\\VEN_QCOM&DEV_02AF", 15},
				Package() {"ACPI\\VEN_QCOM&DEV_02C8", 16},
				Package() {"ACPI\\VEN_QCOM&DEV_02C9", 17},
				Package() {"ACPI\\VEN_QCOM&DEV_02CA", 18},
				Package() {"ACPI\\VEN_QCOM&DEV_02CB", 19},
				Package() {"ACPI\\VEN_QCOM&DEV_02CC", 20},				
			},
			
			// TSENSLIST Package
			// This package contains "lists" of thermal sensors
			// each list maps to a virtual thermal sensor
			// Always the first package should be BIG CPU, second one is LITTLE CPU and third one is ALL CPU SENSOR lists. 
			// Do not interchage inside packages. Always add new sensor list package at the end.
										
			Package() 
			{
				3,  //Number of virtual sensors.
				
				Package() // sensors associated with Little CPU
				{
					"ACPI\\VEN_QCOM&DEV_02B0", 
					21, // virtual sensor ID
					5,	//Little cpu sensors
					Package () {1, 2, 3, 4, 5},
				},
				
				Package() // sensors associated with Big CPU
				{
					"ACPI\\VEN_QCOM&DEV_02B1",
					22, // virtual sensor ID
					5,	//Big cpu sensors			
					Package () {6, 7, 8, 9, 10}, // as per thermal floor plan
				},				
				
				Package() // All MSM sensors
				{
					"ACPI\\VEN_QCOM&DEV_02B2", 
					23, // virtual sensor ID
					21, //It should be total number of sensors.
					Package () {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20},
				},
			},
			
			// Sensor HID to Vadc thermistor mapping package
			// INX and this needs to be in sync 
			// channel list/names need to obtained from tsens team
			Package ()   
			{
				10,  //Number of VADC channels
				
				//         channels name   sensor HID,      Sensor number   ADC type
				Package() {"SYS_THERM1",  "ACPI\\VEN_QCOM&DEV_0299", 0,                 0}, //vadc = 0, rradc = 1
				Package() {"SYS_THERM2",  "ACPI\\VEN_QCOM&DEV_029A", 1,                 0 },	
				Package() {"PA_THERM",    "ACPI\\VEN_QCOM&DEV_029B", 2,                 0 },
				Package() {"PA_THERM1",   "ACPI\\VEN_QCOM&DEV_029C", 3,                 0 },
				Package() {"SYS_THERM3",  "ACPI\\VEN_QCOM&DEV_029D", 4,                 0 },
				Package() {"PMIC_THERM",  "ACPI\\VEN_QCOM&DEV_029E", 5,                 0 },
				Package() {"SKIN_THERM",  "ACPI\\VEN_QCOM&DEV_029F", 6,                 1 },
				Package() {"PMIC_TEMP2",  "ACPI\\VEN_QCOM&DEV_02A0", 7,                 1 },
				Package() {"CHG_TEMP",    "ACPI\\VEN_QCOM&DEV_02EE", 8,                 1 },
				Package() {"BATT_THERM",  "ACPI\\VEN_QCOM&DEV_02EF", 9,                 1 },
			},

			//  Thermal Restriction data package
			//	high/low trigger point for each thermal restriction
			//  ID has to match to one of below enum from PEP_Themal_common.h
						//typedef enum _INT_RESTR_ID
						//{
						//	FAST_THERMAL_MTG_RESTR_B_ID = 0x01, //Throttle just the big cluster to NOM
						//	LOW_TEMP_VOLTAGE_RESTR_ID = 0x02,   //Vdd restriction at < 5C
						//	HIGH_TEMP_BOOST_RESTR_ID = 0x03,    //Unused- Turn off Correlation
						//	NORMAL_TEMP_CL_RESTR_ID = 0x04,     //8909 - Current Limiting - Disabled
						//	HIGH_TEMP_CL_RESTR_ID = 0x05,       //8909 - Current Limiting - Disabled
						//	VERY_HIGH_TEMP_CL_RESTR_ID = 0x06,  //8909 - Current Limiting - Disabled
						//	MAX_PERF_LIMITING_RESTR_ID = 0x7,   //8994 - Num cores based perf limiting
						//	FAST_THERMAL_MTG_RESTR_L_ID = 0x8,  //Throttle Little clusters to NOM
						//	INVALID_RESTR_ID = 0xffffffff,
						//} INT_RESTR_ID, *PINT_RESTR_ID;
			//
			
			Package () 
			{
				1,     // number of Thermal Restrictions
				Package ()
				{
					2,	   // tsensList. 2 indicates third package in TSENSLIST Package. In this case its All CPU sensors list
					2780,  // Restriction ON temperature. ACPI uses 10s of K as temperatures, so 0C = 2730 ACPI UNITS. 2730+50=2780.
					2830,  // Restriction OFF temperature. 100 + 2730 = 2830.
					2,     // 2 - LOW_TEMP_VOLTAGE_RESTR_ID, Vdd restriction at < 5C
					1,     // Restriction enabled = 1, disabled = 0.
				},
			},
			
			//QMI clients
			Package () 
			{
				4, // Number Of QMI Clients.
				Package ()
				{
						"cpuv_restriction_cold", //mitigation device name
						1,                       //restriction ON = 1 and RESTRICTN OFF = 0 
						0,                       //MODEM QMI INSTANCE ID = 0
				},
				Package ()
				{
						"cpuv_restriction_cold", //mitigation device name
						1,                       //restriction ON = 1 and RESTRICTN OFF = 0 
						1,                       //ADSP QMI INSTANCE ID = 1
				},
				Package ()
				{
						"cpuv_restriction_cold", //mitigation device name
						1,                       //restriction ON = 1 and RESTRICTN OFF = 0 
						0x43,                    //CDSP QMI INSTANCE ID = 0x43
				},
				Package ()
				{
						"cpuv_restriction_cold", //mitigation device name
						1,                       //restriction ON = 1 and RESTRICTN OFF = 0 
						0x53,                    //SLPI QMI INSTANCE ID = 0x53
				},	
			},
			
			// PPP PMIC VREG clients: ACPI is being parsed in the order defined in PEP_Thermal_Common.h
			// Client info will be parsed incorrectly, if this package is removed.   
			Package ()
			{
				0, 
			},
			
			//	LTVR Package having 3 sub-packages:
			//	1) Rail type from enum RAIL_TYPE in PEP_Thermal_Common.h
			//	2) Voting type - available options are EnableKraitVFC(0), VoteViaPPP(1), VoteViaQMI(2), VoteViaAOP(3) and VoteViaCallBackObj(4)
			//  3) Client subpackage number for Voting type clients package
			//  VoteViaAOP
			//      AOP does not require rail type to vote during LTVR. 
			//      It just needs an event with value on or off and it places NOM vote on cx, mx & ebi. 
			//      Only cx is added to get callback in LTVR.
			//  VoteViaCallBackObj
			//      LTVR callback notifies to all the registered clients. it is independent of rail type and voting type.
			//

			Package () // LTVR VFC vote table
			{
				7, // Available Rails
				Package() { 0, //KRAIT = 0,	
							0, //EnableKraitVFC = 0   
							0, // NULL
						}, 
				Package() { 1, //CX = 1,   	
							3, //VoteViaAOP = 3
							0, // NULL : Client data is not required;					
						},
				Package() { 3, //MSS = 3,
							2, //VoteViaQMI = 2
							0, // 0 represents first package in QMI clients list
						},
				Package() { 4, //ADSP = 4,
							2, //VoteViaQMI = 2
							1, // 1 represents second package in QMI clients list
						},
				Package() { 6, //CDSP = 6,
							2, //VoteViaQMI = 2
							2, // 2 represents third package in QMI clients
						},
				Package() { 8, //SLPI = 8,
							2, //VoteViaQMI = 2
							3, // 3 represents forth package in QMI clients
						},
				Package() { 2, //GFX = 2, NOP because call backs will be notified for all the registered clients.  
							   // No need for separate rail entry for each of the rails which are relying on call backs. 
							4, //VoteViaCallBackObj = 4. 
							0, // NOP. 
						},
			}
		}
	)
}
