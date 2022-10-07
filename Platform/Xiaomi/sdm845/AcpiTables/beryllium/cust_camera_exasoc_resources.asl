//===========================================================================
//                       <cust_camera_exasoc_resources.asl>
// DESCRIPTION
//   This file contains the resources needed by camera drivers for external components like sensors,flash etc.
//   Customers can update these files for different external components.
//
//   [1] Refer Table 3-10 "Titan 170 Power Use Cases" in "Titan Camera
//       Hardware Architecture Specification" for the detailed information on
//       the operating points under different use case scenarios. Based on
//       the information in the table, this ACPI planned to support SVS and
//       NOM frequencies.
//
//   [2] Refer Chapter 2 "Defintions of Terms" in the ACPI Specification for
//       the definitions of D, F, and P states. Refer the manual of PEP
//       driver for the syntax of defining the power and clock resources.
//
//   [3] ACPI keeps 2 mA for most GPIO pins by setting the field of
//       "PullDriveStrength" to 0 on TLMMGPIO. For high frequency clock pins
//       (such as cam_mclk0/1/2/3 running at 24 MHz), the strength shall be
//       set to 6 mA to meet the timing requirement.
//
//===========================================================================

Scope(\_SB_.PEP0)
{
    // Exa-SoC Devices
    Method(CPMX)
    {
        Return (CPXC)
    }

    Name(CPXC,
    Package ()
    {
        // Flash device (ISRC_R/G/B_LED, ISRC_FLASH_1/2/3)
        Package()
        {
            "DEVICE",
            "\\_SB.FLSH",

            Package() 
            { 
                "COMPONENT", 
                0x0,                            // Component ID
                Package() { "FSTATE", 0x0, },   // Dummy F0 
                Package() { "FSTATE", 0x1, },   // Dummy F1
            },
        },
        
        // Device CAMP Data
        Package()
        {
            "DEVICE",
            "\\_SB.CAMP",

            Package()
            {
                "COMPONENT",
                0x0,            // Component 0
 
                Package()
                {
                    "FSTATE",
                    0x0,        // F0 state (fully on)
                        
                    // FORMAT: FOOTSWITCH NAME; ACTION: 1 == ENABLE, 2 == DISABLE, 3 == HW_CONTROL_ENABLE, 4 == HW_CONTROL_
                    // DISABLE. When the ACTION field is set to 1, the CLOCK driver shall set SW_COLLAPSE bit to 1 (which
                    // means DISABLING/NO SW_COLLAPSE) and poll PWR_ON bit on TITAN_CAM_CC_TITAN_TOP_GDSCR register (as
                    // inidicated in "$2.3.1.4 Core Power On Sequence" of Titan HPG). The CLOCK driver MUST ensure that
                    // the power domain has been enabled before returning. It shall be a blocking operation. If a HW block
                    // (e.g., IPE) is involved, use 3/4 to enable/disable it. HW ENABLING always overrides other settings.
                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   1} },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  1} },
					
					Package() { "PSTATE_ADJUST", Package() { 1, 35 } },                                 // Set to 2nd lowest BW, need revisit
                    Package() { "PSTATE_ADJUST", Package() { 2, 35 } },                                 // Set to 2nd lowest BW, need revisit
					
                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      1} },

                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  1} },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     1 } },  // AHB clock for all register access within the JPEG core; SVS
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    1 } },  // Same as above; SVS
                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  1} },  // For DDR access through CAMNOC 

                    // Action:     1 == ENABLE, 2 == DISABLE, 3 == SET_FREQ, 8 == ENABLE_SET_FREQ, 9 == CONFIGURE, 
                    //             12 == Disable and Set Frequency (combines actions 2 & 3)(must pair with 8)
                    // Match_Type: 1 == CLOCK_FREQUENCY_HZ_AT_LEAST, 3 == CLOCK_FREQUENCY_HZ_CLOSEST
                    // -----------------------------------------------------------------------------------------------------
                    // CLOCK                              Clock Name        Action Freq (Hz)  MatchType
                    // -----------------------------------------------------------------------------------------------------
                   package() { "CLOCK", package() { "cam_cc_cci_clk",         1} },   // Func: CCI. For CCI operations.

                    // Valid only in F-State; Used to adjust one or more current P-State within their respective P-State
                    // Sets. In this case, it will adjust to P state 0 in PSET 0 (to set cam_cc_cci_clk to 37.5 MHz).
                    Package() { "PSTATE_ADJUST", Package() { 0, 0 } },
                   
                    // -----------------------------------------------------------------------------------------------------
                    // GPIO PIN (Refer CAMS TLMMGPIO)  Pin|State|FuncSel|Dirc|PullType|DriveStrength  
                    // -----------------------------------------------------------------------------------------------------
                    // Camera CCI 0/1
                    package() { "TLMMGPIO", package() { 17,    1,    1,    1,    3,    0, }, },         // cci_i2c_sda0
                    package() { "TLMMGPIO", package() { 18,    1,    1,    1,    3,    0, }, },         // cci_i2c_scl0
                    package() { "TLMMGPIO", package() { 19,    1,    1,    1,    3,    0, }, },         // cci_i2c_sda1
                    package() { "TLMMGPIO", package() { 20,    1,    1,    1,    3,    0, }, },         // cci_i2c_scl1

                    // Camera MCLK
                    package() { "TLMMGPIO", package() { 13,    1,    1,    1,    0,    2, }, },         // cam_mclk0, for CAM0/RFC/IMX318
                    package() { "TLMMGPIO", package() { 14,    1,    1,    1,    0,    2, }, },         // cam_mclk1, for CAM1/FFC/IMX258
                    package() { "TLMMGPIO", package() { 15,    1,    1,    1,    0,    2, }, },         // cam_mclk2, unused
                    package() { "TLMMGPIO", package() { 16,    1,    1,    1,    0,    2, }, },         // cam_mclk3, for CAM2/IRIS/OV2281
                },

                Package()
                {
                    "FSTATE",
                    0x1,        // F1 state (OFF)

                    package() { "TLMMGPIO", package() { 16,    0,    0,    0,    1,    2, }, },
                    package() { "TLMMGPIO", package() { 15,    0,    0,    0,    1,    2, }, },
                    package() { "TLMMGPIO", package() { 14,    0,    0,    0,    1,    2, }, },
                    package() { "TLMMGPIO", package() { 13,    0,    0,    0,    1,    2, }, },

                    package() { "TLMMGPIO", package() { 20,    0,    0,    0,    1,    0, }, },
                    package() { "TLMMGPIO", package() { 19,    0,    0,    0,    1,    0, }, },
                    package() { "TLMMGPIO", package() { 18,    0,    0,    0,    1,    0, }, },
                    package() { "TLMMGPIO", package() { 17,    0,    0,    0,    1,    0, }, },

                    package() { "CLOCK", package() { "cam_cc_cci_clk",         2 } },

                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  2 } },
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    2 } },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     2 } },
                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  2 } },

                    Package() { "PSTATE_ADJUST", Package() { 2, 37 } },
                    Package() { "PSTATE_ADJUST", Package() { 1, 37 } },

                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      2 } },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  2 } },
                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   2 } },
                },

                // This packet contains P state power setting used by the PEP driver. The clock presented here
                // MUST be consistent with the clock values under the PERF method in the file of cust_camera_exasoc.asl.
                Package()
                {
                    "PSTATE_SET",
                    0,

                    // Format: name / action / freq / match_type. The driver shall select the lowest frequency required to perform the task at the acceptable performance
                    // point. HPG recommends to limit the freq under 50 MHz. It is allowed to have multiple clock resources in one PSTATE package. The indexes and  
                    // frequencies MUST be consistent with CCICLKFrqIdx in CCIResourceType.h and CAMP_CLK in cust_camera_exasoc.asl.
                    Package() { "PSTATE", 0, package() { "CLOCK", package() { "cam_cc_cci_clk", 3, 37500000, 3, } }, },  // LowSVS for all speeds from 100 KHz to 1 MHz.
                    Package() { "PSTATE", 1, package() { "CLOCK", package() { "cam_cc_cci_clk", 3, 19200000, 3, } }, },  // MinSVS, not used.
                },

                Package()
                {
                    "PSTATE_SET",       // PSET 1: Bandwidth adjustments (Type 3: Instantaneous and Arbitrated bandwidth); Driver limits the MaxComponentNameLen number as 40.
                    1,
                    
                    // Format:                             Type-3 Bus Arbiter Req |          Master Name          |        Slave Name      | IB in bytes/sec |     AB
                    Package() { "PSTATE",  0, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP", 12000000000, 12000000000 } }, },
                    Package() { "PSTATE",  1, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP", 11500000000, 11500000000 } }, },
                    Package() { "PSTATE",  2, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP", 11000000000, 11000000000 } }, },
                    Package() { "PSTATE",  3, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP", 10500000000, 10500000000 } }, },
                    Package() { "PSTATE",  4, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP", 10000000000, 10000000000 } }, },
                    Package() { "PSTATE",  5, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  9500000000,  9500000000 } }, },
                    Package() { "PSTATE",  6, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  9000000000,  9000000000 } }, },
                    Package() { "PSTATE",  7, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  8500000000,  8500000000 } }, },
                    Package() { "PSTATE",  8, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  8000000000,  8000000000 } }, },
                    Package() { "PSTATE",  9, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  7500000000,  7500000000 } }, },
                    Package() { "PSTATE", 10, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  7000000000,  7000000000 } }, },
                    Package() { "PSTATE", 11, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  6500000000,  6500000000 } }, },
                    Package() { "PSTATE", 12, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  6000000000,  6000000000 } }, },
                    Package() { "PSTATE", 13, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  5500000000,  5500000000 } }, },
                    Package() { "PSTATE", 14, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  5000000000,  5000000000 } }, },
                    Package() { "PSTATE", 15, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  4500000000,  4500000000 } }, },
                    Package() { "PSTATE", 16, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  4000000000,  4000000000 } }, },
                    Package() { "PSTATE", 17, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  3500000000,  3500000000 } }, },
                    Package() { "PSTATE", 18, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  3300000000,  3300000000 } }, },
                    Package() { "PSTATE", 19, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  3100000000,  3100000000 } }, },
                    Package() { "PSTATE", 20, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  2900000000,  2900000000 } }, },
                    Package() { "PSTATE", 21, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  2700000000,  2700000000 } }, },
                    Package() { "PSTATE", 22, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  2500000000,  2500000000 } }, },
                    Package() { "PSTATE", 23, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  2300000000,  2300000000 } }, },
                    Package() { "PSTATE", 24, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  2100000000,  2100000000 } }, },
                    Package() { "PSTATE", 25, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  1900000000,  1900000000 } }, },
                    Package() { "PSTATE", 26, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  1700000000,  1700000000 } }, },
                    Package() { "PSTATE", 27, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  1500000000,  1500000000 } }, },
                    Package() { "PSTATE", 28, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  1300000000,  1300000000 } }, },
                    Package() { "PSTATE", 29, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  1100000000,  1100000000 } }, },
                    Package() { "PSTATE", 30, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",   900000000,   900000000 } }, },
                    Package() { "PSTATE", 31, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",   700000000,   700000000 } }, },
                    Package() { "PSTATE", 32, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",   500000000,   500000000 } }, },
                    Package() { "PSTATE", 33, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",   400000000,   400000000 } }, },
                    Package() { "PSTATE", 34, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",   300000000,   300000000 } }, },
                    Package() { "PSTATE", 35, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",   200000000,   200000000 } }, },
                    Package() { "PSTATE", 36, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",   100000000,   100000000 } }, },
                    Package() { "PSTATE", 37, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",           0,           0 } }, },
                },

                Package()
                {
                    "PSTATE_SET",       // PSET 2: Bandwidth adjustments (Type 3: Instantaneous and Arbitrated bandwidth)
                    2,
                    
                    // Format:                             Type-3 Bus Arbiter Req |          Master Name          |        Slave Name      | IB in bytes/sec |     AB
                    Package() { "PSTATE",  0, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1", 12000000000, 12000000000 } }, },
                    Package() { "PSTATE",  1, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1", 11500000000, 11500000000 } }, },
                    Package() { "PSTATE",  2, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1", 11000000000, 11000000000 } }, },
                    Package() { "PSTATE",  3, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1", 10500000000, 10500000000 } }, },
                    Package() { "PSTATE",  4, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1", 10000000000, 10000000000 } }, },
                    Package() { "PSTATE",  5, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  9500000000,  9500000000 } }, },
                    Package() { "PSTATE",  6, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  9000000000,  9000000000 } }, },
                    Package() { "PSTATE",  7, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  8500000000,  8500000000 } }, },
                    Package() { "PSTATE",  8, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  8000000000,  8000000000 } }, },
                    Package() { "PSTATE",  9, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  7500000000,  7500000000 } }, },
                    Package() { "PSTATE", 10, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  7000000000,  7000000000 } }, },
                    Package() { "PSTATE", 11, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  6500000000,  6500000000 } }, },
                    Package() { "PSTATE", 12, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  6000000000,  6000000000 } }, },
                    Package() { "PSTATE", 13, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  5500000000,  5500000000 } }, },
                    Package() { "PSTATE", 14, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  5000000000,  5000000000 } }, },
                    Package() { "PSTATE", 15, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  4500000000,  4500000000 } }, },
                    Package() { "PSTATE", 16, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  4000000000,  4000000000 } }, },
                    Package() { "PSTATE", 17, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  3500000000,  3500000000 } }, },
                    Package() { "PSTATE", 18, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  3300000000,  3300000000 } }, },
                    Package() { "PSTATE", 19, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  3100000000,  3100000000 } }, },
                    Package() { "PSTATE", 20, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  2900000000,  2900000000 } }, },
                    Package() { "PSTATE", 21, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  2700000000,  2700000000 } }, },
                    Package() { "PSTATE", 22, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  2500000000,  2500000000 } }, },
                    Package() { "PSTATE", 23, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  2300000000,  2300000000 } }, },
                    Package() { "PSTATE", 24, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  2100000000,  2100000000 } }, },
                    Package() { "PSTATE", 25, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  1900000000,  1900000000 } }, },
                    Package() { "PSTATE", 26, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  1700000000,  1700000000 } }, },
                    Package() { "PSTATE", 27, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  1500000000,  1500000000 } }, },
                    Package() { "PSTATE", 28, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  1300000000,  1300000000 } }, },
                    Package() { "PSTATE", 29, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  1100000000,  1100000000 } }, },
                    Package() { "PSTATE", 30, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",   900000000,   900000000 } }, },
                    Package() { "PSTATE", 31, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",   700000000,   700000000 } }, },
                    Package() { "PSTATE", 32, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",   500000000,   500000000 } }, },
                    Package() { "PSTATE", 33, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",   400000000,   400000000 } }, },
                    Package() { "PSTATE", 34, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",   300000000,   300000000 } }, },
                    Package() { "PSTATE", 35, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",   200000000,   200000000 } }, },
                    Package() { "PSTATE", 36, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",   100000000,   100000000 } }, },
                    Package() { "PSTATE", 37, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",           0,           0 } }, },
                },
            },
            
            Package()
            {
                "COMPONENT",
                0x1,            // Component 1
 
                Package()
                {
                    "FSTATE",
                    0x0,        // F0 state (fully on)
                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   1} },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  1} },
                    
                    Package() { "PSTATE_ADJUST", Package() { 3, 4 } },
                    Package() { "PSTATE_ADJUST", Package() { 2, 4 } },
                    Package() { "PSTATE_ADJUST", Package() { 1, 4 } },
                    Package() { "PSTATE_ADJUST", Package() { 0, 4 } },
                    
                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      1} },
                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  1} },
                    
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     1 } },  // AHB clock for all register access within the JPEG core; SVS
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    1 } },  // Same as above; SVS
                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  1} },  // For DDR access through CAMNOC 
                    package() { "CLOCK", package() { "cam_cc_cci_clk",         1} },   // Func: CCI. For CCI operations.
                },

                Package()
                {
                    "FSTATE",
                    0x1,        // F1 state (OFF)

                    package() { "CLOCK", package() { "cam_cc_cci_clk",         2 } },
                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  2 } },
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    2 } },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     2 } },
                    
                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  2 } },
                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      2 } },
                    
                    Package() { "PSTATE_ADJUST", Package() { 0, 5 } },
                    Package() { "PSTATE_ADJUST", Package() { 1, 5 } },
                    Package() { "PSTATE_ADJUST", Package() { 2, 5 } },
                    Package() { "PSTATE_ADJUST", Package() { 3, 5 } },

                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  2 } },
                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   2} },
                },
                Package()
                {
                    "PSTATE_SET",
                    0,
                    Package() { "PSTATE", 0,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      1100000000,    1100000000 } } },
                    Package() { "PSTATE", 1,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",       400000000,     400000000 } } },
                    Package() { "PSTATE", 2,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",       300000000,     300000000 } } },
                    Package() { "PSTATE", 3,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",       200000000,     200000000 } } },
                    Package() { "PSTATE", 4,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",       100000000,     100000000 } } },
                    Package() { "PSTATE", 5,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",               0,             0 } } },
                },
                                // BW - compressed
                Package()
                {
                    "PSTATE_SET",
                    1,
                    Package() { "PSTATE", 0,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",      1100000000,    1100000000 } } },
                    Package() { "PSTATE", 1,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",       400000000,     400000000 } } },
                    Package() { "PSTATE", 2,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",       300000000,     300000000 } } },
                    Package() { "PSTATE", 3,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",       200000000,     200000000 } } },
                    Package() { "PSTATE", 4,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",       100000000,     100000000 } } },
                    Package() { "PSTATE", 5,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",               0,             0 } } },
                },

                // Moved BW from CAMP to here. this is temporary. 
                Package()
                {
                    "PSTATE_SET",       // PSET 3: Bandwidth adjustments (Type 3: Instantaneous and Arbitrated bandwidth)
                    2,
                    Package() { "PSTATE", 0, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",  1100000000,  1100000000 } }, },
                    Package() { "PSTATE", 1, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",   400000000,   400000000 } }, },
                    Package() { "PSTATE", 2, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",   300000000,   300000000 } }, },
                    Package() { "PSTATE", 3, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",   200000000,   200000000 } }, },
                    Package() { "PSTATE", 4, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",   100000000,   100000000 } }, },
                    Package() { "PSTATE", 5, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF_UNCOMP", "ICBID_SLAVE_CAMNOC_UNCOMP",           0,           0 } }, },
                },

                // Moved BW from CAMP to here. this is temporary. 
                Package()
                {
                    "PSTATE_SET",       // PSET 3: Bandwidth adjustments (Type 3: Instantaneous and Arbitrated bandwidth)
                    3,
                    Package() { "PSTATE", 0, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",  1100000000,  1100000000 } }, },
                    Package() { "PSTATE", 1, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",   400000000,   400000000 } }, },
                    Package() { "PSTATE", 2, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",   300000000,   300000000 } }, },
                    Package() { "PSTATE", 3, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",   200000000,   200000000 } }, },
                    Package() { "PSTATE", 4, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",   100000000,   100000000 } }, },
                    Package() { "PSTATE", 5, Package() { "BUSARB", Package() { 3, "ICBID_MASTER_CAMNOC_SF", "ICBID_SLAVE_EBI1",           0,           0 } }, },
                },
            },

            Package()
            {
                "COMPONENT",
                0x2,            // Component 2 (SHARED_RES: AFVDD)
                Package()
                {
                    "FSTATE",
                    0x0,        // F0 state (fully on)

                    // CAM1_STBY_N / CAM_ELDO3_EN (AF_VDD LDO Enable All Cameras)
                    // VIN_PM8998 - VIN_PMI8998 - BOB - ELDO3 - AF_VDD; LD20-NE182-7-C6;
                    // Format: Pin|State|FuncSel|Dirc|PullType|DriveStrength
                    package() { "TLMMGPIO", package() { 27, 1, 0, 1, 0, 0, }, },
                    package() { "DELAY", package() { 1, }, },
                },

                Package()
                {
                    "FSTATE",
                    0x1,        // F1 state (OFF)

                    // AF_VDD OFF
                    package() { "TLMMGPIO", package() { 27, 0, 0, 1, 0, 0, }, },
                    package() { "DELAY", package() { 1, }, },
                },
            },
        },
        
        // Primary RFC (IMX318) Power Setting Array from imx318_lib.h (sensor vendor supplied). Mapping
        // between lib and IP_CAT: VDIG (DVDD), VIO (DOVDD), VANA (AVDD), VAF (AF_VDD). Sony IMX318
        // Application Note (AN): During power on, VANA, VDIG, and VIF may rise in any order. The XCLR
        // pin needs to be LOW until all power supplies complete power-on. During power off, VANA, VDIG,
        // and VIF may fall in any order. For delays, refer AN "Startup sequence timing constraints"
        // and "Power down sequence timing constraints".
        Package()
        {
            "DEVICE",
            "\\_SB.CAMS",

            Package()
            {
                "DSTATE",
                0x0,                                    // D0 state (ON)

                package() { "CLOCK",      package() { "gcc_camera_xo_clk",   1} },
                package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  1} },
                Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      1} },

                package() { "CLOCK",      package() { "gcc_camera_axi_clk",  1} },
                package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     1} },
                package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    1} },
                package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  1} },  // For DDR access through CAMNOC 

                // [1] TLMM_GPIO: set CAM0_RST_N to LOW; LD20-NE182-8-C5
                package()
                {
                    "TLMMGPIO",                         // Identifier: PMIC GPIO. Top Level Mode Mux (TLMM)
                    package()
                    {
                        80,                             // Pin Number: CAM0_RST_N (Primary RFC)
                        0,                              // State / OutVal: 0 == Low, 1 == High
                        0,                              // Function Select: 0 == Generic I/O Pin, non-zero == Alternate Function
                        1,                              // Direction: 0 == Input, 1 == Output
                        0,                              // Pull Type: 0 == No Pull, 1 == Pull Down, 2 == Keeper, 3 == Pull Up
                        0,                              // Strength: 0 == 2 mA, 1 == 4 mA, 2 == 6 mA, 3 == 8 mA, 4 == 10 mA, 5 == 12 mA, 4 == 14 mA, 7 == 16 mA
                    },
                },
                package() { "DELAY", package() { 1, }, },       // 1 ms(millisecond) delay

                // [2] TLMM_GPIO: VIN_PM8998 - VIN_PMI8998 - BOB - ELDO9 - AVDD (VANA); CAM0_STBY_N / CAM_ELDO9_EN;
                //     Primary Rear Camera AVDD LDO Enable. LD20-NE182-8-C5. L22A, IMX318_AVDD_ALT is not used.
                package() { "TLMMGPIO", package() { 79, 1, 0, 1, 0, 0, }, },
                package() { "DELAY", package() { 1, }, },

                // [3] PMIC_GPIO: VIN_PM8998 - S3A - ELDO1 - DVDD; LD20-NE182-27-A6/41-D7
                package()
                {
                    "PMICGPIO",
                    package()
                    {
                        "IOCTL_PM_GPIO_CONFIG_DIGITAL_OUTPUT",
                        0,                              // PMIC Number: 0 == PM8998, 1 == PMI8998, 2 == PM8005
                        11,                             // GPIO Number: PM_GPIO_12 / CAM_ELDO1_EN
                        0,                              // Out Buffer Config: 0 == PM_GPIO_OUT_BUFFER_CONFIG_CMOS, 1 == NMOS, 2 == CMOS
                        1,                              // VIN: 0 == PM_GPIO_VIN0, 1 == VIN1
                        1,                              // Source: 0 == PM_GPIO_SOURCE_LOW, 1 == HIGH, 2 == PAIRED_GPIO, 3-4 == SPECIAL_FUNCTION1-2, 5-8 == DTEST1-4
                        3,                              // Out Buffer Strength: 0 == PM_GPIO_OUT_BUFFER_RESERVED, 1 == LOW, 2 == MEDIUM, 3 == HIGH
                        0,                              // I Source Pull: 0 == PM_GPIO_I_SOURCE_PULL_UP_30uA, 1 == UP_1_5uA, 2 == UP_31_5uA, 3 == UP_1_5uA_PLUS_30uA_BOOST, 4 == DOWN_10uA, 5 == NO_PULL
                    },
                },
                package() { "DELAY", package() { 1, }, },

                // [4] PMIC_VREG_VOTE: VIN_PM8998 - S4A - VIN_LVS1_LVS2 - LVS1A - DOVDD. LD20-NE182-41-B4.
                //     Regulator name from //deploy/qcom/qct/platform/wpci/prod/woa/QCDK/main/latest/inc/pmic/PmicIVreg.h
                package()
                {
                    "PMICVREGVOTE",                     // Identifier: PMIC VREG Resource
                    package()
                    {
                        "PPP_RESOURCE_ID_LVS1_A",       // Voltage Regulator ID (Type VS)
                        4,                              // TYPE of VREG: 4 == LVS (Low Voltage Switch), 5 == MVS (Medium Voltage Switch)
                        1800000,                        // Voltage: 1.8 V
                        1,                              // Software Enable: 0 == Disable, 1 == Enable (Recommended)
                     // "HLOS_DRV",                     // Optional: DRV ID            (Default: HLOS_DRV; Valid: HLOS_DRV / DISPLAY_DRV)
                     // "REQUIRED",                     // Optional: Suppressible Type (Default: REQUIRED; Valid: REQUIRED / SUPPRESSIBLE)
                    },
                },

                // [5] CLOCK; LD20-NE182-45-D4
                package() { "CLOCK", package() { "cam_cc_mclk0_clk", 8, 24000000, 3, } },       // Frequency from imx318_lib.h
                package() { "DELAY", package() { 1, }, },

                // [6] TLMM_GPIO: set CAM0_RST_N to HIGH
                package() { "TLMMGPIO", package() { 80, 1, 0, 1, 0, 0, }, },
                package() { "DELAY", package() { 18, }, },                                      // 18 ms wait time between XCLR rising and sending streaming command
            },

            Package()
            {
                "DSTATE",
                0x3,                                    // D3 state (OFF)

                // [1] CLOCK OFF
                package() { "CLOCK", package() { "cam_cc_mclk0_clk", 2} },
                package() { "DELAY", package() { 1, }, },

                // [2] CAM0_RST_N LOW
                package() { "TLMMGPIO", package() { 80, 0, 0, 1, 0, 0, }, },
                package() { "DELAY", package() { 1, }, },

                // [3] DOVDD OFF
                package() { "PMICVREGVOTE", package() { "PPP_RESOURCE_ID_LVS1_A", 4, 0, 0, }, },

                // [4] DVDD OFF
                package() { "PMICGPIO", package() { "IOCTL_PM_GPIO_CONFIG_DIGITAL_OUTPUT", 0, 11, 0, 1, 0, 3, 0, }, },
                package() { "DELAY", package() { 1, }, },

                // [5] AVDD (VANA) OFF
                package() { "TLMMGPIO", package() { 79, 0, 0, 1, 0, 0, }, },
                package() { "DELAY", package() { 1, }, },

                package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  2 } },
                package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    2 } },
                package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     2 } },
                package() { "CLOCK",      package() { "gcc_camera_axi_clk",  2 } },

                Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      2 } },
                package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  2 } },
                package() { "CLOCK",      package() { "gcc_camera_xo_clk",   2 } },
            },
        },

        // Primary FFC (IMX258) Power Setting Array from imx258_lib.h. Sony IMX258 Application Note: During
        // power on, VANA, VDIG, and VIF may rise in any order. The XCLR pin is set to "LOW" and the power
        // suppliers are brought up. Then the XCLR pin should be set to "HIGH" after INCK supplied. During
        // power off, VANA, VDIG, and VIF may fall in any order. For delays, refer AN "Startup sequence
        // timing constraints" and "Power down sequence timing constraints".
        Package()
        {
            "DEVICE",
            "\\_SB.CAMF",

            Package()
            {
                "DSTATE",
                0x0,

                package() { "CLOCK",      package() { "gcc_camera_xo_clk",   1} },
                package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  1} },
                Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      1} },

                package() { "CLOCK",      package() { "gcc_camera_axi_clk",  1} },
                package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     1} },
                package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    1} },
                package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  1} },  // For DDR access through CAMNOC 

                // [1] TLMM_GPIO: set CAM1_RST_N to LOW; LD20-NE182-7-C6
                package() { "TLMMGPIO", package() { 28, 0, 0, 1, 0, 0, }, },
                package() { "DELAY", package() { 1, }, },

                // [2] TLMM_GPIO: VIN_PM8998 - VIN_PMI8998 - BOB - ELDO2 (GPIO_8 / CAM_ELDO2_EN / Front Camera AVDD LDO Enable) - AVDD (VANA); LD20-NE182-41-C7
                package() { "TLMMGPIO", package() { 8, 1, 0, 1, 0, 0, }, },
                package() { "DELAY", package() { 1, }, },

                // [3] PM_IC_GPIO: VIN_PM8998 - S3A - ELDO4 ( PM_GPIO_09 / CAM_ELDO4_EN / Camera Front DVDD LDO Enable) - DVDD; LD20-NE182-41-B6
                package() { "PMICGPIO", package() { "IOCTL_PM_GPIO_CONFIG_DIGITAL_OUTPUT", 0, 8, 0, 1, 1, 3, 0, }, },
                package() { "DELAY", package() { 1, }, },

                // [4] PM_IC_VREG_VOTE: VIN_PM8998 - S4A - VIN_LVS1_LVS2 - LVS1A - DOVDD; LD20-NE182-41-B4
                package() { "PMICVREGVOTE", package() { "PPP_RESOURCE_ID_LVS1_A", 4, 1800000, 1, }, },

                // [5] CLOCK; LD20-NE182-43-C2
                package() { "CLOCK", package() { "cam_cc_mclk1_clk", 8, 24000000, 3, } },
                package() { "DELAY", package() { 1, }, },

                // [6] TLMM_GPIO: set CAM1_RST_N to HIGH; LD20-NE182-7-C6
                package() { "TLMMGPIO", package() { 28, 1, 0, 1, 0, 0, }, },
                package() { "DELAY", package() { 12, }, },      // Delay between INCK-start-and-XCLR-rising and Sending-streaming-command
            },

            Package()
            {
                "DSTATE",
                0x3,

                // [1] CAM1_RST_N LOW
                package() { "TLMMGPIO", package() { 28, 0, 0, 1, 0, 0, }, },
                package() { "DELAY", package() { 1, }, },

                // [2] CLOCK OFF
                package(){ "CLOCK", package(){ "cam_cc_mclk1_clk", 2} },
                package() { "DELAY", package() { 1, }, },

                // [3] DOVDD OFF
                package() { "PMICVREGVOTE", package() { "PPP_RESOURCE_ID_LVS1_A", 4, 0, 0, }, },

                // [4] DVDD OFF
                package() { "PMICGPIO", package() { "IOCTL_PM_GPIO_CONFIG_DIGITAL_OUTPUT", 0, 8, 0, 1, 0, 3, 0, }, },
                package() { "DELAY", package() { 1, }, },

                // [5] AVDD (VANA) OFF
                package() { "TLMMGPIO", package() { 8, 0, 0, 1, 0, 0, }, },
                package() { "DELAY", package() { 1, }, },

                package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  2 } },
                package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    2 } },
                package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     2 } },
                package() { "CLOCK",      package() { "gcc_camera_axi_clk",  2 } },

                Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      2 } },
                package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  2 } },
                package() { "CLOCK",      package() { "gcc_camera_xo_clk",   2 } },
            },
        },

        // FFC Auxiliary (OV2281) Power Setting Array from ov2281_lib.h. Refer OV2281 datasheet 
        // "power up sequence", figure 2-3, "power down sequence", and figure 2-6 for more 
        // information.
        Package()
        {
            "DEVICE",
            "\\_SB.CAMI",

            Package()
            {
                "DSTATE",
                0x0,

                package() { "CLOCK",      package() { "gcc_camera_xo_clk",   1} },
                package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  1} },
                Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      1} },

                package() { "CLOCK",      package() { "gcc_camera_axi_clk",  1} },
                package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     1 } },  // AHB clock for all register access within the JPEG core; SVS
                package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    1 } },  // Same as above; SVS
                package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  1} },  // For DDR access through CAMNOC 

                // [1] VIO / DOVDD - VREG_LVS1A_1P8 (All camera 1.8 V IO); PM_IC_VREG_VOTE; LD20-NE182-41-B4, 42-D6
                package() { "PMICVREGVOTE", package() { "PPP_RESOURCE_ID_LVS1_A", 4, 1800000, 1, }, },

                // [2] AVDD 2.8 V - P2V85_AVDD_CAM1_2; LD20-NE182-41-C5, 42-D6; TLMM_GPIO: ELDO2 (GPIO_8 / CAM_ELDO2_EN / Front Camera AVDD LDO Enable / CAM2_STBY_N)
                package() { "TLMMGPIO", package() { 8, 1, 0, 1, 0, 0, }, },

                // [3] VDD 1.2 V - P1V2_DVDD_CAM1_2; PM_IC_GPIO: ELDO4 ( PM_GPIO_09 / CAM_ELDO4_EN / Camera Front DVDD LDO Enable) - DVDD; LD20-NE182-41-B6
                package() { "PMICGPIO", package() { "IOCTL_PM_GPIO_CONFIG_DIGITAL_OUTPUT", 0, 8, 0, 1, 1, 3, 0, }, },

                // [4] CAM2_RST_N LOW (AUX1, 3rd camera in system); LD20-NE182-7-D6
                package() { "TLMMGPIO", package() { 9, 0, 0, 1, 0, 0, }, },
                package() { "DELAY", package() { 1, }, },

                // [5] CAM2_RST_N HIGH
                package() { "TLMMGPIO", package() { 9, 1, 0, 1, 0, 0, }, },
                package() { "DELAY", package() { 1, }, },

                // [6] CLOCK; LD20-NE182-42-C6
                package() { "CLOCK", package() { "cam_cc_mclk3_clk", 8, 24000000, 3, } },
                package() { "DELAY", package() { 1, }, },
            },

            Package()
            {
                "DSTATE",
                0x3,

                // [1] CLOCK OFF
                package(){ "CLOCK", package(){ "cam_cc_mclk3_clk", 2} },
                package() { "DELAY", package() { 1, }, },

                // [2] CAM2_RST_N HIGH
                package() { "TLMMGPIO", package() { 9, 1, 0, 1, 0, 0, }, },
                package() { "DELAY", package() { 1, }, },

                // [3] CAM2_RST_N LOW
                package() { "TLMMGPIO", package() { 9, 0, 0, 1, 0, 0, }, },
                package() { "DELAY", package() { 1, }, },

                // [4] VDD OFF
                package() { "PMICGPIO", package() { "IOCTL_PM_GPIO_CONFIG_DIGITAL_OUTPUT", 0, 8, 0, 1, 0, 3, 0, }, },

                // [5] AVDD OFF
                package() { "TLMMGPIO", package() { 8, 0, 0, 1, 0, 0, }, },

                // [6] DOVDD OFF
                package() { "PMICVREGVOTE", package() { "PPP_RESOURCE_ID_LVS1_A", 4, 0, 0, }, },

                package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  2 } },
                package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    2 } },
                package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     2 } },
                package() { "CLOCK",      package() { "gcc_camera_axi_clk",  2 } },

                Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      2 } },
                package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  2 } },
                package() { "CLOCK",      package() { "gcc_camera_xo_clk",   2 } },
            },
        }
    })
}
