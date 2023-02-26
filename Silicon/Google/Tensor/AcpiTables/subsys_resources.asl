//===========================================================================
//                           <subsys_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by subsystem drivers.
//
//===========================================================================


Scope(\_SB_.PEP0)
{

    // Subsystem Drivers
    Method(SPMD)
    {
        Return(SPCC)
    }


    Name(SPCC,
    Package ()
    {
        Package()
        {
            "DEVICE",
            "\\_SB.AMSS",
            Package()
            {
                "COMPONENT",
                0x0,         // Component 0.
                Package()
                {
                    "FSTATE",
                    0x0,     // f0 state
                },
                Package()
                {
                    "PSTATE",
                    0x0,     // P0 state

                    // turning on MSS specific clocks which were earlier not power managed
                    // gcc_mss_gpll0_div_clk_src enabled using register in subsys amss code
                    // Action:     1 == ENABLE, 2 == DISABLE, 3 == SET_FREQ, 8 == ENABLE_SET_FREQ, 9 == CONFIGURE
                    // Match_Type: 1 == CLOCK_FREQUENCY_HZ_AT_LEAST, 3 == CLOCK_FREQUENCY_HZ_CLOSEST
                    // -----------------------------------------------------------------------------------------------------
                    // CLOCK                              Clock Name        Action Freq (Hz)  MatchType
                    // -----------------------------------------------------------------------------------------------------
                    Package() { "CLOCK", Package() { "gcc_boot_rom_ahb_clk",            1,}},
                    Package() { "CLOCK", Package() { "gcc_mss_cfg_ahb_clk",             1,}},
                    Package() { "CLOCK", Package() { "gcc_mss_q6_memnoc_axi_clk",       1,}},
                    Package() { "CLOCK", Package() { "gcc_mss_snoc_axi_clk",            1,}},
                    Package() { "CLOCK", Package() { "gcc_mss_mfab_axis_clk",           1,}},
                    Package() { "CLOCK", Package() { "gcc_prng_ahb_clk",                1,}},
                    Package() { "CLOCK", Package() { "gcc_mss_axis2_clk",               1,}},


                    // MSS HPG says that step 1 is to turn on the power rails
                    // to nominal settings. The HPG calls out the following:
                    Package()
                    {
                        "PMICVREGVOTE",
                        Package()
                        {
                            "PPP_RESOURCE_ID_SMPS2_C", // Voltage Regulator ID - PPP_RESOURCE_ID_SMPS2_C S2CPM8005 See http://ipcatalog.qualcomm.com/pmic/grids/73
                            2,                         // Voltage Regulator Type - 2 - SMPS
                            752000,                    // Voltage - 0.752 V
                            1,                         // Software Enable - 1 - Enable
                            7,                         // Software Power Mode - 0 - Normal
                            0,                         // Head Room - 0
                        },
                    },

                    Package() 
                    {
                        "NPARESOURCE",
                        Package() 
                        {
                               1,                      //Required Resource - 1 or Non Required Resource - 0
                               "/arc/client/rail_cx",
                               384,                    //vlvl Vote - RAIL_VOLTAGE_LEVEL_TUR
                            },
                        },

                    Package() 
                    {
                        "NPARESOURCE",
                        Package() 
                        {
                            1,                         //Required Resource - 1 or Non Required Resource - 0
                            "/arc/client/rail_mx",
                            384,                       //vlvl Vote - RAIL_VOLTAGE_LEVEL_TUR
                        },
                    },

                    Package() 
                    {
                        "BUSARB",
                        Package() 
                        {
                            3,                         // Req Type
							"ICBID_MASTER_IPA_CORE",   // Master
                            "ICBID_SLAVE_IPA_CORE",    // Slave
                            37400,              	   // IB= KHz ( map 37500 KHz needs to mapped to IB value )
                            0,                         // AB
                            "HLOS_DRV",                // Optional: DRV Id
                         
                        },
                    },
                },
                Package()
                {
                    "PSTATE",
                    1,

                    // removing apps vote for MSS specific votable clocks
                    // gcc_mss_gpll0_div_clk_src disable using register in subsys amss code before we go to P1 state
                    // Action:     1 == ENABLE, 2 == DISABLE, 3 == SET_FREQ, 8 == ENABLE_SET_FREQ, 9 == CONFIGURE
                    // Match_Type: 1 == CLOCK_FREQUENCY_HZ_AT_LEAST, 3 == CLOCK_FREQUENCY_HZ_CLOSEST
                    // -----------------------------------------------------------------------------------------------------
                    // CLOCK                              Clock Name        Action Freq (Hz)  MatchType
                    // -----------------------------------------------------------------------------------------------------
                    //Package() { "CLOCK", Package() { "gcc_boot_rom_ahb_clk",            2,}},
                    Package() { "CLOCK", Package() { "gcc_prng_ahb_clk",                2,}},
                    
					Package()
                    {
                        "PMICVREGVOTE",
                        Package()
                        {
                            "PPP_RESOURCE_ID_SMPS2_C", // Voltage Regulator ID - PPP_RESOURCE_ID_SMPS2_C
                            2,                         // Voltage Regulator Type - 2 - SMPS
                            0,                         // Voltage - NA
                            0,                         // Software Disable - 0 - Disable
                            0,                         // Software Power Mode - 0 - NA
                            0,                         // Head Room - 0
                        },
                    },
                    
                    Package() 
                    {
                       "NPARESOURCE",
                       Package() 
                       {
                           1,                          //Required Resource - 1 or Non Required Resource - 0
                           "/arc/client/rail_cx",
                           0,                          //vlvl Vote
                       },
                    },

                    Package() 
                    {
                       "NPARESOURCE",
                       Package() 
                       {
                           1,                          //Required Resource - 1 or Non Required Resource - 0
                           "/arc/client/rail_mx",
                           0,                          //vlvl Vote
                       },
                    },

                    Package() 
                    {
                        "BUSARB",
                        Package() 
                        {
                            3,                         // Req Type
							"ICBID_MASTER_IPA_CORE",   // Master
                            "ICBID_SLAVE_IPA_CORE",    // Slave
                            0,              	   // IB= KHz ( map 37500 KHz needs to mapped to IB value )
                            0,                         // AB
                            "HLOS_DRV",                // Optional: DRV Id
                        },
                    },
                },
                Package()
                {
                    "PSTATE",
                    2,
                    
                    // removing apps vote for MSS specific votable clocks
                    // gcc_mss_gpll0_div_clk_src disable using register in subsys amss code before we go to P1 state
                    // Action:     1 == ENABLE, 2 == DISABLE, 3 == SET_FREQ, 8 == ENABLE_SET_FREQ, 9 == CONFIGURE
                    // Match_Type: 1 == CLOCK_FREQUENCY_HZ_AT_LEAST, 3 == CLOCK_FREQUENCY_HZ_CLOSEST
                    // -----------------------------------------------------------------------------------------------------
                    // CLOCK                              Clock Name        Action Freq (Hz)  MatchType
                    // -----------------------------------------------------------------------------------------------------
                    Package() { "CLOCK", Package() { "gcc_boot_rom_ahb_clk",            2,}},
                    Package() { "CLOCK", Package() { "gcc_prng_ahb_clk",                2,}},

                    Package()
                    {
                        "PMICVREGVOTE",
                        Package()
                        {
                            "PPP_RESOURCE_ID_SMPS2_C", // Voltage Regulator ID - PPP_RESOURCE_ID_SMPS2_C
                            2,                         // Voltage Regulator Type - 2 - SMPS
                            0,                         // Voltage - NA
                            0,                         // Software Disable - 0 - Disable
                            0,                         // Software Power Mode - 0 - NA
                            0,                         // Head Room - 0
                        },
                    },
                
                },
            },
            Package()
            {
                "DSTATE",
                0x0,         // D0 state
            },
            Package()
            {
                "DSTATE",
                0x3,         // D3 state
            }
        },
        /////////////////////////////////////////////////////////////////////////////////////

        // ADSP device
        Package()
        {
            "DEVICE",
            "\\_SB.ADSP",
            Package()
            {
                "COMPONENT",
                0x0,         // Component 0.
                Package()
                {
                    "FSTATE",
                    0x0,     // f0 state
                },
                Package()
                {
                    "PSTATE",
                    0x0,     // P0 state
                },
                Package(){
                    "PSTATE",
                    1,       // P1 state
                },
            },
            Package()
            {
                "DSTATE",
                0x0,         // D0 state
            },
            Package()
            {
                "DSTATE",
                0x3,         // D3 state
            },
        },
        /////////////////////////////////////////////////////////////////////////////////////

        // SCSS (sensors subsystem bus)  device
        Package()
        {
            "DEVICE",
            "\\_SB.SCSS",
            Package()
            {
                "COMPONENT",
                0x0,         // Component 0.
                Package()
                {
                    "FSTATE",
                    0x0,     // f0 state
                },
                Package()
                {
                    "PSTATE",
                    0x0,

                    Package()
                    {
                        "PMICVREGVOTE", // PMICVREGVOTE resource
                        Package()
                        {
                            "PPP_RESOURCE_ID_LDO27_A",  // VREG ID
                            1,                          // Voltage Regulator type - LDO, 
                            752000,                     // Voltage is in micro volts - (0.752V = Nominal L27A, PM845. See http://ipcatalog.qualcomm.com/pmic/grids/chip/53/grid/98)
                            1,                          // force enable from software - enable
                            7,                          // power mode - Normal Power Mode (See go/pepuserguide for translation from mode to value)
                            0,                          // head room voltage
                        },
                    },

                    Package()
                    {
                        "PMICVREGVOTE",                 // PMICVREGVOTE resource
                        Package()
                        {
                            "PPP_RESOURCE_ID_LDO4_A",   // VREG ID
                            1,                          // Voltage Regulator type - LDO
                            800000,                     // Voltage is in micro volts - (0.8V = Nominal, L4A  PM845. See http://ipcatalog.qualcomm.com/pmic/grids/chip/53/grid/98)
                            1,                          // force enable from software - enable
                            7,                          // power mode - Normal Power Mode (See go/pepuserguide for translation from mode to value)
                            0,                          // head room voltage
                        },
                    },

                    Package()
                    {
                        "PMICVREGVOTE",                 // PMICVREGVOTE resource
                        Package()
                        {
                            "PPP_RESOURCE_ID_LVS2_A",
                            4,                          // TYPE of VREG - LVS
                            1800000,                    // 1.8V LVS2APM845 See http://ipcatalog.qualcomm.com/pmic/grids/73
                            1,                          // Force enable from s/w
                        },
                    },

                    Package()
                    { 
                        "BUSARB", 
                        Package() 
                        { 
                            3,                          // Req Type
                            "ICBID_MASTER_APPSS_PROC",  // Master
                            "ICBID_SLAVE_CLK_CTL",      // Slave
                            1,                          // IB
                            1,                          // AB
                        },
                    },
                },
                Package()
                {
                    "PSTATE",
                    0x1,

                    Package()
                    {
                        "PMICVREGVOTE",                 // PMICVREGVOTE resource
                        Package()
                        {
                            "PPP_RESOURCE_ID_LDO27_A",  // VREG ID
                            1,                          // Voltage Regulator type - LDO
                            576000,                     // Voltage is in micro volts - (0.576V = MinSVS L27A, PM845. See http://ipcatalog.qualcomm.com/hsr/213#) 
                            1,                          // force enable from software
                            5,                          // power mode - Low Power Mode  (See go/pepuserguide for translation from mode to value)
                            0,                          // head room voltage
                        },
                    },

                    Package()
                    {
                        "PMICVREGVOTE",                 // PMICVREGVOTE resource
                        Package()
                        {
                            "PPP_RESOURCE_ID_LDO4_A",   // VREG ID
                            1,                          // Voltage Regulator type - LDO
                            800000,                     // Voltage is in micro volts - (0.8V = Nominal (Lowest supported) L4A, PM845. See http://ipcatalog.qualcomm.com/hsr/213#) 
                            1,                          // force enable from software
                            5,                          // power mode - Low Power Mode  (See go/pepuserguide for translation from mode to value)
                            0,                          // head room voltage
                        },
                    },

                    Package()
                    {
                        "PMICVREGVOTE",                 // PMICVREGVOTE resource
                        Package()
                        {
                            "PPP_RESOURCE_ID_LVS2_A",
                            4,                          // TYPE of VREG - LVS
                            0,                          // 0.0V
                            0,                          // Force enable from s/w
                        },
                    },

                    Package()
                    {
                        "BUSARB", 
                        Package()
                        { 
                            3,                          // Req Type
                            "ICBID_MASTER_APPSS_PROC",  // Master
                            "ICBID_SLAVE_CLK_CTL",      // Slave
                            0,                          // IB
                            0,                          // AB
                         },
                    },
                },
                Package(){
                    "PSTATE",
                    2,

                    Package()
                    {
                        "PMICVREGVOTE",                 // PMICVREGVOTE resource
                        Package()
                        {
                            "PPP_RESOURCE_ID_LDO27_A",  // VREG ID
                            1,                          // Voltage Regulator type - LDO
                            0,                          // Voltage is in micro volts - NA
                            0,                          // force enable from software - disable
                            0,                          // power mode - NA
                            0,                          // head room voltage
                        },
                    },

                    Package()
                    {
                        "PMICVREGVOTE",                 // PMICVREGVOTE resource
                        Package()
                        {
                            "PPP_RESOURCE_ID_LDO4_A",  // VREG ID
                            1,                         // Voltage Regulator type - LDO
                            0,                         // Voltage is in micro volts - NA
                            0,                         // force enable from software - disable
                            0,                         // power mode - NA
                            0,                         // head room voltage
                        },
                    },

                    Package()
                    {
                        "PMICVREGVOTE",                 // PMICVREGVOTE resource
                        Package()
                        {
                            "PPP_RESOURCE_ID_LVS2_A",
                            4,                          // TYPE of VREG - LVS
                            0,                          // 0.0V
                            0,                          // Force enable from s/w
                        },
                    },

                    Package()
                    {
                        "BUSARB", 
                        Package()
                        { 
                            3,                          // Req Type
                            "ICBID_MASTER_APPSS_PROC",  // Master
                            "ICBID_SLAVE_CLK_CTL",      // Slave
                            0,                          // IB
                            0,                          // AB
                         },
                    },
                },
            },
            Package()
            {
                "DSTATE",
                0x0,      // D0 state
            },
            Package()
            {
                "DSTATE",
                0x3,      // D3 state
            },
        },
        /////////////////////////////////////////////////////////////////////////////////////

        // CDSP device
        Package()
        {
            "DEVICE",
            "\\_SB.CDSP",
            Package()
            {
                "COMPONENT",
                0x0, // Component 0.
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                },
                Package()
                {
                    "PSTATE",
                    0x0, // P0 state
                },
                Package(){
                    "PSTATE",
                    1,
                },
            },
            Package()
            {
                "DSTATE",
                0x0, // D0 state
            },
            Package()
            {
                "DSTATE",
                0x3, // D3 state
            },
        },
        /////////////////////////////////////////////////////////////////////////////////////
    })

}
