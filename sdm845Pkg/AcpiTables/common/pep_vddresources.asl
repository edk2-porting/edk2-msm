//Cx & Mx supported vlvl
//RAIL_VOLTAGE_LEVEL_OFF            = 0,
//RAIL_VOLTAGE_LEVEL_RETENTION      = 16,
//RAIL_VOLTAGE_LEVEL_SVS_LOW        = 64,
//RAIL_VOLTAGE_LEVEL_SVS            = 128,
//RAIL_VOLTAGE_LEVEL_SVS_HIGH       = 192,
//RAIL_VOLTAGE_LEVEL_NOMINAL        = 256,
//RAIL_VOLTAGE_LEVEL_NOMINAL_HIGH   = 320,
//RAIL_VOLTAGE_LEVEL_TURBO          = 384,
//RAIL_VOLTAGE_LEVEL_TURBO_L1       = 384,

// XO supported vlvl
//XO_LEVEL_CRYSTAL_OFF     = 0x0,
//XO_LEVEL_PMIC_BUFFER_OFF = 0x20,
//XO_LEVEL_SOC_BUFFER_OFF  = 0x50,
//XO_LEVEL_ON              = 0x80,

Scope(\_SB.PEP0)
{
	
    Method(LVDD){
		return(NVDD)
	}
	Name( NVDD, package(){		
		package(){
			"/arc/client/rail_cx",         // Resource name
			"RAIL_VOLTAGE_LEVEL_NOMINAL",  // Initial value
		},
		package(){
			"/arc/client/display/rail_cx", // Resource name
			"RAIL_VOLTAGE_LEVEL_OFF",      // Initial value
		},
		package(){
			"/arc/client/rail_mx",         // Resource name
			"RAIL_VOLTAGE_LEVEL_NOMINAL",  // Initial value
		},
		package(){
			"/arc/client/display/rail_mx", // Resource name
			"RAIL_VOLTAGE_LEVEL_OFF",      // Initial value
		},
		package(){
			"/arc/client/rail_xo",         // Resource name
			"XO_LEVEL_ON",  		       // Initial value
		},
		package(){
			"/arc/client/display/rail_xo", // Resource name
			"XO_LEVEL_CRYSTAL_OFF",        // Initial value
		},
	})
}
