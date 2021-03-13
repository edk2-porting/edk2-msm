//===========================================================================
//                       <cust_camera_resources.asl>
// DESCRIPTION
//   This file contains the resources needed by camera drivers.
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

Include("cust_camera_exasoc_resources.asl")

Scope(\_SB_.PEP0)
{
    // CAMERA
    Method(CPMD)
    {
        Return(CPCC)
    }

    Name(CPCC, Package()
    {
        // JPEG ENCODER (JPGE)
        Package()
        {
            "DEVICE",
            "\\_SB.JPGE",

            Package()
            {
                "COMPONENT",
                0x0,                    // Component 0; JPEG 0 Encoder

                Package()
                {
                    "FSTATE",
                    0x0,                // F0 State

                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   1} },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  1} },
                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      1} },

                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  1} },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     1 } },  // AHB clock for all register access within the JPEG core; SVS
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    1 } },  // Same as above; SVS
                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  1} },  // For DDR access through CAMNOC 
                    
                    package() { "CLOCK", package() { "cam_cc_jpeg_clk",        1} },  // For core processing on JPEG instance 0 and 3; SVS

                    package() { "PSTATE_ADJUST", Package() { 0, 2 } },                                  // Pstate adjustment for clock frequencies. Set to SVS
                },

                Package()
                {
                    "FSTATE",
                    0x1,                // F1 State

                    package() { "CLOCK", package() { "cam_cc_jpeg_clk",        2 } },
                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  2 } },
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    2 } },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     2 } },
                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  2 } },

                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      2 } },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  2 } },
                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   2 } },
                },

                Package()
                {
                    "PSTATE_SET",       // PSET 0: Clock frequency adjustments
                    0,

                    Package() { "PSTATE", 0, Package() { "CLOCK", Package() { "cam_cc_jpeg_clk", 3, 600000000, 3, } }, },       // TURBO   for driver turbo
                    Package() { "PSTATE", 1, Package() { "CLOCK", Package() { "cam_cc_jpeg_clk", 3, 600000000, 3, } }, },       // NOMINAL for driver nominal
                    Package() { "PSTATE", 2, Package() { "CLOCK", Package() { "cam_cc_jpeg_clk", 3, 404000000, 3, } }, },       // SVS only used in driver (revisit)
                    Package() { "PSTATE", 3, Package() { "CLOCK", Package() { "cam_cc_jpeg_clk", 3, 200000000, 3, } }, },       // LowSVS  for driver Standby
                },
            },
 
            Package()
            {
                "COMPONENT",
                0x1,                    // Component 2; JPEG_3/DMA. Note that this is normally indexed as JPEG core "3" in diagrams, but the ACPI entry index is 2 here

                Package()
                {
                    "FSTATE",
                    0x0,                // F0 State

                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   1} },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  1} },
                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      1} },

                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  1} },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     1 } },  // AHB clock for all register access within the JPEG core; SVS
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    1 } },  // Same as above; SVS
                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  1} },  // For DDR access through CAMNOC 

                    package() { "CLOCK", package() { "cam_cc_jpeg_clk",        1} },  // LowSVS for standby (JPEG3 ONLY)

                    package() { "PSTATE_ADJUST", Package() { 0, 2 }},
                },

                Package()
                {
                    "FSTATE",
                    0x1,                // F1 State

                    package() { "CLOCK", package() { "cam_cc_jpeg_clk",        2 } },
                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  2 } },
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    2 } },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     2 } },
                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  2 } },

                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      2 } },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  2 } },
                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   2 } },
                },

                Package()
                {
                    "PSTATE_SET",
                    0,

                    Package() { "PSTATE", 0, Package() { "CLOCK", Package() { "cam_cc_jpeg_clk", 3, 600000000, 3, } }, },       // Turbo
                    Package() { "PSTATE", 1, Package() { "CLOCK", Package() { "cam_cc_jpeg_clk", 3, 600000000, 3, } }, },       // Nominal
                    Package() { "PSTATE", 2, Package() { "CLOCK", Package() { "cam_cc_jpeg_clk", 3, 200000000, 3, } }, },       // LowSVS for Standby
                },
            },
        },


        // Device MPCS Data (DEVICE/COMPONENT/STATE)
        Package()
        {
            "DEVICE",
            "\\_SB.MPCS",

            Package()
            {
                "COMPONENT",
                0x0,                // Component 0 (CSIPHY_0)

                Package()
                {
                    "FSTATE",
                    0x0,

                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   1} },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  1} },
                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      1} },

                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  1} },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     1 } },  // AHB clock for all register access within the JPEG core; SVS
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    1 } },  // Same as above; SVS
                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  1} },  // For DDR access through CAMNOC 

                    Package() { "CLOCK",      Package() { "phy_refgen_south",    1} },     //To enable REFGEN SOUTH

                    package() { "CLOCK", package() { "cam_cc_csi0phytimer_clk",  8,  269330000,  3, }},        // SVS = NOM = TURBO
                    package() { "CLOCK", package() { "cam_cc_csiphy0_clk",       8,  384000000,  3, }},        // SVS = NOM = TURBO
                },

                Package()
                {
                    "FSTATE",
                    0x1,

                    package() { "CLOCK", package() { "cam_cc_csiphy0_clk",       2}},
                    package() { "CLOCK", package() { "cam_cc_csi0phytimer_clk",  2}},

                    Package() { "CLOCK", Package() { "phy_refgen_south",       2 }},     //To disable REFGEN SOUTH
                    
                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  2 } },
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    2 } },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     2 } },
                    package() { "CLOCK", package() { "gcc_camera_axi_clk",  2 } },

                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      2 } },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  2 } },
                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   2 } },
                },
            },

            Package()
            {
                "COMPONENT",
                0x1,                // Component 1 (CSIPHY_1)

                Package()
                {
                    "FSTATE",
                    0x0,

                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   1} },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  1} },
                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      1} },

                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  1} },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     1 } },  // AHB clock for all register access within the JPEG core; SVS
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    1 } },  // Same as above; SVS
                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  1} },  // For DDR access through CAMNOC 
                    
                    Package() { "CLOCK",      Package() { "phy_refgen_south",    1} },     //To enable REFGEN SOUTH

                    package() { "CLOCK", package() { "cam_cc_csi1phytimer_clk",  8,  269330000,  3, }},
                    package() { "CLOCK", package() { "cam_cc_csiphy1_clk",       8,  384000000,  3, }},
                },

                Package()
                {
                    "FSTATE",
                    0x1,

                    package() { "CLOCK", package() { "cam_cc_csiphy1_clk",       2}},
                    package() { "CLOCK", package() { "cam_cc_csi1phytimer_clk",  2}},

                    Package() { "CLOCK", Package() { "phy_refgen_south",       2 }},     //To disable REFGEN SOUTH
                    
                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  2 } },
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    2 } },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     2 } },
                    package() { "CLOCK", package() { "gcc_camera_axi_clk",  2 } },

                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      2 } },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  2 } },
                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   2 } },
                },
            },

            Package()
            {
                "COMPONENT",
                0x2,                // Component 2 (CSIPHY_2)

                Package()
                {
                    "FSTATE",
                    0x0,

                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   1} },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  1} },
                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      1} },

                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  1} },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     1 } },  // AHB clock for all register access within the JPEG core; SVS
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    1 } },  // Same as above; SVS
                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  1} },  // For DDR access through CAMNOC 
                    
                    Package() { "CLOCK",      Package() { "phy_refgen_south",    1} },     //To enable REFGEN SOUTH

                    package() { "CLOCK", package() { "cam_cc_csi2phytimer_clk",  8,  269330000,  3, }},
                    package() { "CLOCK", package() { "cam_cc_csiphy2_clk",       8,  384000000,  3, }},
                },

                Package()
                {
                    "FSTATE",
                    0x1,

                    package() { "CLOCK", package() { "cam_cc_csiphy2_clk",       2}},
                    package() { "CLOCK", package() { "cam_cc_csi2phytimer_clk",  2}},


                    Package() { "CLOCK", Package() { "phy_refgen_south",       2 }},     //To disable REFGEN SOUTH

                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  2 } },
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    2 } },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     2 } },
                    package() { "CLOCK", package() { "gcc_camera_axi_clk",  2 } },

                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      2 } },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  2 } },
                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   2 } },
                },
            },
        },

        //Device VFE0 Data
        Package()
        {
            "DEVICE",
            "\\_SB.VFE0",
            Package()
            {
                "COMPONENT",
                0x0, // Component 0.  //IFE0 component
                Package()
                {
                    "FSTATE",
                    0x0, // F0 state

                    // Footswitch Name; Action (1 == Enable; 2 == Disable; 3 = HW_CONTROL enable, 4 = HW_CONTROL disable)

                    // Action:       1 == ENABLE 2 == DISABLE 3 == SET_FREQ 8 == EN_SETFREQ
                    // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST 3 == CLOCK_FREQUENCY_HZ_CLOSEST

                    //                                Clock Name                 Action    Frequency   MatchType
                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   1} },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  1} },
                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      1} },

                    Package(){"PSTATE_ADJUST", Package () { 1, 10 }}, // bw voting
                    Package(){"PSTATE_ADJUST", Package () { 2, 10 }}, // bw voting

                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  1} },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     1 } },  // AHB clock for all register access within the JPEG core; SVS
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    1 } },  // Same as above; SVS
                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  1} },  // For DDR access through CAMNOC 
                    
                    Package() { "FOOTSWITCH", Package() { "ife_0_gdsc",       1 } },

                    //IFE0 Clocks
                    package() { "PSTATE_ADJUST", Package() { 0, 1 } },                                  // Pstate adjustment for clock frequencies. Set to SVS
                    package(){ "CLOCK", package(){ "cam_cc_ife_0_clk",             1 } },
                    package(){ "CLOCK", package(){ "cam_cc_ife_0_cphy_rx_clk",     8,     384000000,    3, } }, // SVS
                    package(){ "CLOCK", package(){ "cam_cc_ife_0_csid_clk",        8,     384000000,    3, } }, // SVS
                    package(){ "CLOCK", package(){ "cam_cc_ife_0_dsp_clk",         1} }, 

                    package(){ "CLOCK", package(){ "cam_cc_ife_0_axi_clk",         1} },

                },
                Package()
                {
                    "FSTATE",
                    0x1, // F1 state

                    package(){ "CLOCK", package(){ "cam_cc_ife_0_axi_clk",        2}},

                    package(){ "CLOCK", package(){ "cam_cc_ife_0_dsp_clk",        2}},
                    package(){ "CLOCK", package(){ "cam_cc_ife_0_csid_clk",       2}},
                    package(){ "CLOCK", package(){ "cam_cc_ife_0_cphy_rx_clk",    2}},
                    //package() { "PSTATE_ADJUST", Package() { 0, 4 } },

                    package(){ "CLOCK", package(){ "cam_cc_ife_0_clk",            2}},

                    Package() { "FOOTSWITCH", Package() { "ife_0_gdsc",          2  } },

                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  2 } },
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    2 } },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     2 } },
                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  2 } },

                    Package(){"PSTATE_ADJUST", Package () { 2, 29 }}, // bw voting
                    Package(){"PSTATE_ADJUST", Package () { 1, 29 }}, // bw voting

                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      2 } },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  2 } },
                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   2 } },

                },

                // Clk Freq
                Package()
                {
                    "PSTATE_SET",
                    0,
                    // TURBO, NOM
                    Package()
                    { 
                        "PSTATE", 
                        0,
                        Package(){ "CLOCK", Package(){ "cam_cc_ife_0_clk",              3,       600000000,       3,     }},
                    },
                    // SVS_L1
                    Package()
                    { 
                        "PSTATE", 
                        1,
                        Package(){ "CLOCK", Package(){ "cam_cc_ife_0_clk",              3,       480000000,       3,     }},
                    },
                    // SVS
                    Package()
                    { 
                        "PSTATE", 
                        2,
                        Package(){ "CLOCK", Package(){ "cam_cc_ife_0_clk",              3,       404000000,       3,     }},
                    },
                    // Off
                    Package()
                    { 
                        "PSTATE", 
                        3,
                        Package(){ "CLOCK", Package(){ "cam_cc_ife_0_clk",              3,       0,       3,     }},
                    },
                },
                

                // BW - Uncompressed
                Package()
                {
                    "PSTATE_SET",
                    1,

                    //                                                          Req                                                                            IB           AB
                    //                                                          Type           Master                             Slave                        Bytes/Sec    Bytes/Sec
                    //                                                          ----   -----------------------    ----------------------      ----------   ----------
                    Package() { "PSTATE",  0,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",     38000000000,   38000000000 } } },
                    Package() { "PSTATE",  1,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",     35000000000,   35000000000 } } },
                    Package() { "PSTATE",  2,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",     28000000000,   28000000000 } } },
                    Package() { "PSTATE",  3,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",     23000000000,   23000000000 } } },
                    Package() { "PSTATE",  4,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",     20000000000,   20000000000 } } },
                    Package() { "PSTATE",  5,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",     16000000000,   16000000000 } } },
                    Package() { "PSTATE",  6,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",     14000000000,   14000000000 } } },
                    Package() { "PSTATE",  7,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",     12000000000,   12000000000 } } },
                    Package() { "PSTATE",  8,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      4000000000,    4000000000 } } },
                    Package() { "PSTATE",  9,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      3500000000,    3500000000 } } },
                    Package() { "PSTATE", 10,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      3300000000,    3300000000 } } },
                    Package() { "PSTATE", 11,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      3100000000,    3100000000 } } },
                    Package() { "PSTATE", 12,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      2900000000,    2900000000 } } },
                    Package() { "PSTATE", 13,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      2700000000,    2700000000 } } },
                    Package() { "PSTATE", 14,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      2500000000,    2500000000 } } },
                    Package() { "PSTATE", 15,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      2300000000,    2300000000 } } },
                    Package() { "PSTATE", 16,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      2100000000,    2100000000 } } },
                    Package() { "PSTATE", 17,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      1900000000,    1900000000 } } },
                    Package() { "PSTATE", 18,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      1700000000,    1700000000 } } },
                    Package() { "PSTATE", 19,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      1500000000,    1500000000 } } },
                    Package() { "PSTATE", 20,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      1300000000,    1300000000 } } },
                    Package() { "PSTATE", 21,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      1100000000,    1100000000 } } },
                    Package() { "PSTATE", 22,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",       900000000,     900000000 } } },
                    Package() { "PSTATE", 23,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",       700000000,     700000000 } } },
                    Package() { "PSTATE", 24,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",       500000000,     500000000 } } },
                    Package() { "PSTATE", 25,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",       400000000,     400000000 } } },
                    Package() { "PSTATE", 26,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",       300000000,     300000000 } } },
                    Package() { "PSTATE", 27,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",       200000000,     200000000 } } },
                    Package() { "PSTATE", 28,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",       100000000,     100000000 } } },
                    Package() { "PSTATE", 29,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",               0,             0 } } },
                },
                // BW - compressed
                Package()
                {
                    "PSTATE_SET",
                    2,

                    //                                                          Req                                                                            IB           AB
                    //                                                          Type           Master                             Slave                        Bytes/Sec    Bytes/Sec
                    //                                                          ----   -----------------------    ----------------------      ----------   ----------
                    Package() { "PSTATE",  0,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",     38000000000,   38000000000 } } },
                    Package() { "PSTATE",  1,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",     35000000000,   35000000000 } } },
                    Package() { "PSTATE",  2,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",     28000000000,   28000000000 } } },
                    Package() { "PSTATE",  3,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",     23000000000,   23000000000 } } },
                    Package() { "PSTATE",  4,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",     20000000000,   20000000000 } } },
                    Package() { "PSTATE",  5,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",     16000000000,   16000000000 } } },
                    Package() { "PSTATE",  6,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",     14000000000,   14000000000 } } },
                    Package() { "PSTATE",  7,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",     12000000000,   12000000000 } } },
                    Package() { "PSTATE",  8,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",      4000000000,    4000000000 } } },
                    Package() { "PSTATE",  9,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",      3500000000,    3500000000 } } },
                    Package() { "PSTATE", 10,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",      3300000000,    3300000000 } } },
                    Package() { "PSTATE", 11,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",      3100000000,    3100000000 } } },
                    Package() { "PSTATE", 12,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",      2900000000,    2900000000 } } },
                    Package() { "PSTATE", 13,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",      2700000000,    2700000000 } } },
                    Package() { "PSTATE", 14,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",      2500000000,    2500000000 } } },
                    Package() { "PSTATE", 15,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",      2300000000,    2300000000 } } },
                    Package() { "PSTATE", 16,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",      2100000000,    2100000000 } } },
                    Package() { "PSTATE", 17,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",      1900000000,    1900000000 } } },
                    Package() { "PSTATE", 18,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",      1700000000,    1700000000 } } },
                    Package() { "PSTATE", 19,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",      1500000000,    1500000000 } } },
                    Package() { "PSTATE", 20,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",      1300000000,    1300000000 } } },
                    Package() { "PSTATE", 21,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",      1100000000,    1100000000 } } },
                    Package() { "PSTATE", 22,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",       900000000,     900000000 } } },
                    Package() { "PSTATE", 23,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",       700000000,     700000000 } } },
                    Package() { "PSTATE", 24,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",       500000000,     500000000 } } },
                    Package() { "PSTATE", 25,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",       400000000,     400000000 } } },
                    Package() { "PSTATE", 26,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",       300000000,     300000000 } } },
                    Package() { "PSTATE", 27,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",       200000000,     200000000 } } },
                    Package() { "PSTATE", 28,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",       100000000,     100000000 } } },
                    Package() { "PSTATE", 29,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF0",    "ICBID_SLAVE_EBI1",               0,             0 } } },
                },

                // CSID Clk Freq: TODO

            },

            Package()
            {
                "COMPONENT",
                0x1, // Component 1.  //IFE1 component
                Package()
                {
                    "FSTATE",
                    0x0, // F0 state

                    // Footswitch Name; Action (1 == Enable; 2 == Disable; 3 = HW_CONTROL enable, 4 = HW_CONTROL disable)
                    // Action:       1 == ENABLE 2 == DISABLE 3 == SET_FREQ 8 == EN_SETFREQ
                    // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST 3 == CLOCK_FREQUENCY_HZ_CLOSEST

                    //                                Clock Name                 Action    Frequency   MatchType
                    Package(){"PSTATE_ADJUST", Package () { 1, 10 }}, // bw voting
                    Package(){"PSTATE_ADJUST", Package () { 2, 10 }}, // bw voting

                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   1} },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  1} },
                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      1} },

                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  1} },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     1 } },  // AHB clock for all register access within the JPEG core; SVS
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    1 } },  // Same as above; SVS
                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  1} },  // For DDR access through CAMNOC 
                    
                    Package() { "FOOTSWITCH", Package() { "ife_1_gdsc",       1 } },

                    //IFE1 Clocks
                    package() { "PSTATE_ADJUST", Package() { 0, 2 } },                                  // Pstate adjustment for clock frequencies. Set to SVS
                    package() { "CLOCK", package(){ "cam_cc_ife_1_clk",             1} },

                    package() { "CLOCK", package(){ "cam_cc_ife_1_cphy_rx_clk",     8,     384000000,    3, } }, // SVS
                    package() { "CLOCK", package(){ "cam_cc_ife_1_csid_clk",        8,     384000000,    3, } }, // SVS
                    package() { "CLOCK", package(){ "cam_cc_ife_1_dsp_clk",         1} },

                    package() { "CLOCK", package(){ "cam_cc_ife_1_axi_clk",         1} },

                },
                Package()
                {
                    "FSTATE",
                    0x1, // F1 state

                    package(){ "CLOCK", package(){ "cam_cc_ife_1_axi_clk",        2} },

                    package(){ "CLOCK", package(){ "cam_cc_ife_1_dsp_clk",        2} },
                    package(){ "CLOCK", package(){ "cam_cc_ife_1_csid_clk",       2} },
                    package(){ "CLOCK", package(){ "cam_cc_ife_1_cphy_rx_clk",    2} },

                    //package() { "PSTATE_ADJUST", Package() { 0, 4 } },
                    package(){ "CLOCK", package(){ "cam_cc_ife_1_clk",            2} },

                    Package(){ "FOOTSWITCH",  Package(){ "ife_1_gdsc",           2 } },

                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  2 } },
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    2 } },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     2 } },
                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  2 } },

                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      2 } },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  2 } },
                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   2 } },

                    Package(){"PSTATE_ADJUST", Package () { 2, 29 }}, // bw voting
                    Package(){"PSTATE_ADJUST", Package () { 1, 29 }}, // bw voting

                },

                // Clk Freq
                Package()
                {
                    "PSTATE_SET",
                    0,
                    // TURBO, NOM
                    Package()
                    { 
                        "PSTATE", 
                        0,
                        Package(){ "CLOCK", Package(){ "cam_cc_ife_1_clk",              3,       600000000,       3,     }},
                    },
                    // SVS_L1
                    Package()
                    { 
                        "PSTATE", 
                        1,
                        Package(){ "CLOCK", Package(){ "cam_cc_ife_1_clk",              3,       480000000,       3,     }},
                    },
                    // SVS
                    Package()
                    { 
                        "PSTATE", 
                        2,
                        Package(){ "CLOCK", Package(){ "cam_cc_ife_1_clk",              3,       404000000,       3,     }},
                    },
                    // Off
                    Package()
                    { 
                        "PSTATE", 
                        3,
                        Package(){ "CLOCK", Package(){ "cam_cc_ife_1_clk",              3,       0,       3,     }},
                    },
                },
                
                // BW - Uncompressed
                Package()
                {
                    "PSTATE_SET",
                    1,

                    //                                                          Req                                                                            IB           AB
                    //                                                          Type           Master                             Slave                        Bytes/Sec    Bytes/Sec
                    //                                                          ----   -----------------------    ----------------------      ----------   ----------
                    Package() { "PSTATE",  0,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",     38000000000,   38000000000 } } },
                    Package() { "PSTATE",  1,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",     35000000000,   35000000000 } } },
                    Package() { "PSTATE",  2,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",     28000000000,   28000000000 } } },
                    Package() { "PSTATE",  3,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",     23000000000,   23000000000 } } },
                    Package() { "PSTATE",  4,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",     20000000000,   20000000000 } } },
                    Package() { "PSTATE",  5,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",     16000000000,   16000000000 } } },
                    Package() { "PSTATE",  6,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",     14000000000,   14000000000 } } },
                    Package() { "PSTATE",  7,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",     12000000000,   12000000000 } } },
                    Package() { "PSTATE",  8,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      4000000000,    4000000000 } } },
                    Package() { "PSTATE",  9,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      3500000000,    3500000000 } } },
                    Package() { "PSTATE", 10,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      3300000000,    3300000000 } } },
                    Package() { "PSTATE", 11,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      3100000000,    3100000000 } } },
                    Package() { "PSTATE", 12,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      2900000000,    2900000000 } } },
                    Package() { "PSTATE", 13,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      2700000000,    2700000000 } } },
                    Package() { "PSTATE", 14,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      2500000000,    2500000000 } } },
                    Package() { "PSTATE", 15,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      2300000000,    2300000000 } } },
                    Package() { "PSTATE", 16,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      2100000000,    2100000000 } } },
                    Package() { "PSTATE", 17,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      1900000000,    1900000000 } } },
                    Package() { "PSTATE", 18,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      1700000000,    1700000000 } } },
                    Package() { "PSTATE", 19,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      1500000000,    1500000000 } } },
                    Package() { "PSTATE", 20,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      1300000000,    1300000000 } } },
                    Package() { "PSTATE", 21,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",      1100000000,    1100000000 } } },
                    Package() { "PSTATE", 22,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",       900000000,     900000000 } } },
                    Package() { "PSTATE", 23,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",       700000000,     700000000 } } },
                    Package() { "PSTATE", 24,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",       500000000,     500000000 } } },
                    Package() { "PSTATE", 25,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",       400000000,     400000000 } } },
                    Package() { "PSTATE", 26,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",       300000000,     300000000 } } },
                    Package() { "PSTATE", 27,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",       200000000,     200000000 } } },
                    Package() { "PSTATE", 28,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",       100000000,     100000000 } } },
                    Package() { "PSTATE", 29,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1_UNCOMP",    "ICBID_SLAVE_CAMNOC_UNCOMP",               0,             0 } } },
                },
                // BW - compressed
                Package()
                {
                    "PSTATE_SET",
                    2,

                    //                                                          Req                                                                            IB           AB
                    //                                                          Type           Master                             Slave                        Bytes/Sec    Bytes/Sec
                    //                                                          ----   -----------------------    ----------------------      ----------   ----------
                    Package() { "PSTATE",  0,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",     38000000000,   38000000000 } } },
                    Package() { "PSTATE",  1,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",     35000000000,   35000000000 } } },
                    Package() { "PSTATE",  2,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",     28000000000,   28000000000 } } },
                    Package() { "PSTATE",  3,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",     23000000000,   23000000000 } } },
                    Package() { "PSTATE",  4,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",     20000000000,   20000000000 } } },
                    Package() { "PSTATE",  5,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",     16000000000,   16000000000 } } },
                    Package() { "PSTATE",  6,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",     14000000000,   14000000000 } } },
                    Package() { "PSTATE",  7,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",     12000000000,   12000000000 } } },
                    Package() { "PSTATE",  8,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",      4000000000,    4000000000 } } },
                    Package() { "PSTATE",  9,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",      3500000000,    3500000000 } } },
                    Package() { "PSTATE", 10,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",      3300000000,    3300000000 } } },
                    Package() { "PSTATE", 11,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",      3100000000,    3100000000 } } },
                    Package() { "PSTATE", 12,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",      2900000000,    2900000000 } } },
                    Package() { "PSTATE", 13,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",      2700000000,    2700000000 } } },
                    Package() { "PSTATE", 14,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",      2500000000,    2500000000 } } },
                    Package() { "PSTATE", 15,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",      2300000000,    2300000000 } } },
                    Package() { "PSTATE", 16,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",      2100000000,    2100000000 } } },
                    Package() { "PSTATE", 17,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",      1900000000,    1900000000 } } },
                    Package() { "PSTATE", 18,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",      1700000000,    1700000000 } } },
                    Package() { "PSTATE", 19,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",      1500000000,    1500000000 } } },
                    Package() { "PSTATE", 20,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",      1300000000,    1300000000 } } },
                    Package() { "PSTATE", 21,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",      1100000000,    1100000000 } } },
                    Package() { "PSTATE", 22,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",       900000000,     900000000 } } },
                    Package() { "PSTATE", 23,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",       700000000,     700000000 } } },
                    Package() { "PSTATE", 24,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",       500000000,     500000000 } } },
                    Package() { "PSTATE", 25,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",       400000000,     400000000 } } },
                    Package() { "PSTATE", 26,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",       300000000,     300000000 } } },
                    Package() { "PSTATE", 27,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",       200000000,     200000000 } } },
                    Package() { "PSTATE", 28,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",       100000000,     100000000 } } },
                    Package() { "PSTATE", 29,  Package() { "BUSARB", Package() { 3,    "ICBID_MASTER_CAMNOC_HF1",    "ICBID_SLAVE_EBI1",               0,             0 } } },
                },
              
            },
            
            Package()
            {
                "COMPONENT",
                0x2, // Component 2.  //IFE LITE component
                Package()
                {
                    "FSTATE",
                    0x0, // F0 state

                    // Footswitch Name; Action (1 == Enable; 2 == Disable; 3 = HW_CONTROL enable, 4 = HW_CONTROL disable)
                   
                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   1} },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  1} },
                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      1} },

                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  1} },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     1 } },  // AHB clock for all register access within the JPEG core; SVS
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    1 } },  // Same as above; SVS
                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  1} },  // For DDR access through CAMNOC 

                    //IFE Lite Clocks
                    package(){ "CLOCK", package(){ "cam_cc_ife_lite_clk",             1          } },
                    package() { "PSTATE_ADJUST", Package() { 0, 2 } },                                  // Pstate adjustment for clock frequencies. Set to SVS
 
                    package(){ "CLOCK", package(){ "cam_cc_ife_lite_cphy_rx_clk",     8,     384000000,    3, } }, // SVS
                    package(){ "CLOCK", package(){ "cam_cc_ife_lite_csid_clk",        8,     384000000,    3, } }, // SVS

                },
                Package()
                {
                    "FSTATE",
                    0x1, // F1 state

                    package(){ "CLOCK", package(){ "cam_cc_ife_lite_csid_clk",     2 } },
                    package(){ "CLOCK", package(){ "cam_cc_ife_lite_cphy_rx_clk",  2 } },

                    package() { "PSTATE_ADJUST", Package() { 0, 4 } },
                    package(){ "CLOCK", package(){ "cam_cc_ife_lite_clk",            2 } },

                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  2 } },
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    2 } },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     2 } },
                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  2 } },

                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      2 } },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  2 } },
                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   2 } },
                },

                // Clk Freq
                Package()
                {
                    "PSTATE_SET",
                    0,
                    // TURBO, NOM
                    Package()
                    { 
                        "PSTATE", 
                        0,
                        Package(){ "CLOCK", Package(){ "cam_cc_ife_lite_clk",              3,       600000000,       3,     }},
                    },
                    // SVS_L1
                    Package()
                    { 
                        "PSTATE", 
                        1,
                        Package(){ "CLOCK", Package(){ "cam_cc_ife_lite_clk",              3,       480000000,       3,     }},
                    },
                    // SVS
                    Package()
                    { 
                        "PSTATE", 
                        2,
                        Package(){ "CLOCK", Package(){ "cam_cc_ife_lite_clk",              3,       404000000,       3,     }},
                    },
                    // Off
                    Package()
                    { 
                        "PSTATE", 
                        3,
                        Package(){ "CLOCK", Package(){ "cam_cc_ife_lite_clk",              3,       0,       3,     }},
                    },
                },
                
                // BW: ICBID_MASTER_CAMNOC_HF1_UNCOMP is used for both ife1 & ife_lite
            },

            Package()
            {
                "COMPONENT",
                0x3, // Component 3.  //ICP component
                Package()
                {
                    "FSTATE",
                    0x0, // F0 state
                    
                    // Vote for QDSS to enable the following AOP clocks:
                    //    cam_cc_icp_apb_clk : gcc_mmss_icp_apb_clk : gcc_apb_clk
                    //    cam_cc_icp_atb_clk : gcc_mmss_icp_atb_clk : gcc_mmss_at_clk
                    //    cam_cc_icp_cti_clk : gcc_mmss_icp_cti_clk : gcc_mmss_trig_clk
                    //    cam_cc_icp_ts_clk  : gcc_mmss_icp_ts_clk  : gcc_qdss_tsctr_clk
                    //
                    package() {"NPARESOURCE", package() {1, "/clk/qdss", 1},},

                    // Footswitch Name; Action (1 == Enable; 2 == Disable)
                              
                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   1} },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  1} },
                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      1} },

                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  1} },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     1 } },  // AHB clock for all register access within the JPEG core; SVS
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    1 } },  // Same as above; SVS
                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  1} },  // For DDR access through CAMNOC 

                    package() { "CLOCK", package() { "cam_cc_icp_apb_clk",      1          } },

                    package() { "CLOCK", package() { "cam_cc_icp_clk",             1 } },   // SVS. DCVS recommendation
                    package() { "PSTATE_ADJUST", Package() { 0, 1 } },           // Pstate adjustment for clock frequencies. Set to SVS

                    package() { "CLOCK", package() { "cam_cc_icp_atb_clk",      1          } },
                    package() { "CLOCK", package() { "cam_cc_icp_cti_clk",      1          } },
                    package() { "CLOCK", package() { "cam_cc_icp_ts_clk",      1          } },
                },
                Package()
                {
                    "FSTATE",
                    0x1, // F1 state
                    package(){ "CLOCK", package(){ "cam_cc_icp_ts_clk",               2  } },
                    package(){ "CLOCK", package(){ "cam_cc_icp_cti_clk",               2  } },
                    package(){ "CLOCK", package(){ "cam_cc_icp_atb_clk",               2  } },

                    package() { "PSTATE_ADJUST", Package() { 0, 2 } },
                    package(){ "CLOCK", package(){ "cam_cc_icp_clk",               2  } },
                    package(){ "CLOCK", package(){ "cam_cc_icp_apb_clk",       2 } },

                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  2 } },
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    2 } },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     2 } },
                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  2 } },

                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      2 } },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  2 } },
                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   2 } },
                    
                    // Remove the QDSS vote to disable the following AOP clocks:
                    //    cam_cc_icp_apb_clk : gcc_mmss_icp_apb_clk : gcc_apb_clk
                    //    cam_cc_icp_atb_clk : gcc_mmss_icp_atb_clk : gcc_mmss_at_clk
                    //    cam_cc_icp_cti_clk : gcc_mmss_icp_cti_clk : gcc_mmss_trig_clk
                    //    cam_cc_icp_ts_clk  : gcc_mmss_icp_ts_clk  : gcc_qdss_tsctr_clk
                    //
                    package() {"NPARESOURCE", package() {1, "/clk/qdss", 0},},
                },

                Package()
                {
                    "PSTATE_SET",
                    0,

                    // NOM
                    Package()
                    { 
                        "PSTATE", 
                        0,
                        package() { "CLOCK", package() { "cam_cc_icp_clk",             3,    600000000,    3, } },

                    },

                    // SVS
                    Package()
                    { 
                        "PSTATE", 
                        1,
                        package() { "CLOCK", package() { "cam_cc_icp_clk",             3,    400000000,    3, } },

                     },

                    // Off
                    Package()
                    { 
                        "PSTATE", 
                        2,
                        package() { "CLOCK", package() { "cam_cc_icp_clk",             3,    0,    3, } }, 

                     },
                },
            },

           Package()
           {
                "COMPONENT",
                0x4, // Component 4.  //IPE0/1 component
                Package()
                {
                    "FSTATE",
                    0x0, // F0 state

                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   1} },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  1} },
                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      1} },

                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  1} },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     1 } },  // AHB clock for all register access within the JPEG core; SVS
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    1 } },  // Same as above; SVS
                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  1} },  // For DDR access through CAMNOC 
  
                    // IPE0 clocks
                    Package() { "FOOTSWITCH", Package() { "ipe_0_gdsc",       1 } },

                    package() { "CLOCK", package() { "cam_cc_ipe_0_ahb_clk",       1 } },

                    package() { "CLOCK", package() { "cam_cc_ipe_0_clk",           1          } },
                    package() { "PSTATE_ADJUST", Package() { 0, 2 } },                                  // Pstate adjustment for clock frequencies. Set to SVS

                    package() { "CLOCK", package() { "cam_cc_ipe_0_areg_clk",      1 } },
                    package() { "CLOCK", package() { "cam_cc_ipe_0_axi_clk",       1          } },

                    Package() { "FOOTSWITCH", Package() { "ipe_0_gdsc",       3 } }, // HW control (TODO: need to enable by ES)


                    // IPE1 clocks
                    Package() { "FOOTSWITCH", Package() { "ipe_1_gdsc",       1 } },

                    package() { "CLOCK", package() { "cam_cc_ipe_1_ahb_clk",       1 } },

                    package() { "CLOCK", package() { "cam_cc_ipe_1_clk",           1          } },
                    package() { "PSTATE_ADJUST", Package() { 1, 2 } },           // Pstate adjustment for clock frequencies. Set to SVS

                    package() { "CLOCK", package() { "cam_cc_ipe_1_areg_clk",      1 } },
                    package() { "CLOCK", package() { "cam_cc_ipe_1_axi_clk",       1          } },
                    
                    Package() { "FOOTSWITCH", Package() { "ipe_1_gdsc",       3 } },  // HW control (TODO: need to enable by ES)

               },
               Package()
               {
                   "FSTATE",
                   0x1, // F1 state


                   Package() { "FOOTSWITCH", Package() { "ipe_1_gdsc",      4 } },  // HW control (TODO: need to enable by ES)
                   
                   package() { "CLOCK", package() { "cam_cc_ipe_1_axi_clk",         2 } },
                   package() { "CLOCK", package() { "cam_cc_ipe_1_areg_clk",        2 } },

                    package() { "PSTATE_ADJUST", Package() { 1, 4 } },
                   package() { "CLOCK", package() { "cam_cc_ipe_1_clk",             2 } },

                   package() { "CLOCK", package() { "cam_cc_ipe_1_ahb_clk",         2 } },

                   Package() { "FOOTSWITCH", Package() { "ipe_1_gdsc",      2 } },
                  
                   Package() { "FOOTSWITCH", Package() { "ipe_0_gdsc",      4 } },  // HW control (TODO: need to enable by ES)
                   
                   package() { "CLOCK", package() { "cam_cc_ipe_0_axi_clk",         2 } },
                   package() { "CLOCK", package() { "cam_cc_ipe_0_areg_clk",       2 } },

                   package() { "PSTATE_ADJUST", Package() { 0, 4 } },
                   package() { "CLOCK", package() { "cam_cc_ipe_0_clk",             2 } },

                   package() { "CLOCK", package() { "cam_cc_ipe_0_ahb_clk",         2 } },

                   Package() { "FOOTSWITCH", Package() { "ipe_0_gdsc",      2 } },
                   

                   package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  2 } },
                   package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    2 } },
                   package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     2 } },
                   package() { "CLOCK",      package() { "gcc_camera_axi_clk",  2 } },

                   Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      2 } },
                   package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  2 } },
                   package() { "CLOCK",      package() { "gcc_camera_xo_clk",   2 } },
               },
              
                // Clk Freq
                Package()
                {
                    "PSTATE_SET",
                    0,
                    Package() // Turbo
                    { 
                        "PSTATE", 
                        0,
                        Package(){ "CLOCK", Package(){ "cam_cc_ipe_0_clk",            3,       600000000,       3,     }},
                    },
                    Package() // SVS_L1
                    { 
                        "PSTATE", 
                        1,
                        Package(){ "CLOCK", Package(){ "cam_cc_ipe_0_clk",            3,       480000000,       3,     }},
                    },
                    Package() // SVS
                    { 
                        "PSTATE", 
                        2,
                        Package(){ "CLOCK", Package(){ "cam_cc_ipe_0_clk",            3,       404000000,       3,     }},
                    },
                    Package() // Off
                    { 
                        "PSTATE", 
                        3,
                        Package(){ "CLOCK", Package(){ "cam_cc_ipe_0_clk",            3,       0,       3,     }},
                    },
                },
                
                // Clk Freq
                Package()
                {
                    "PSTATE_SET",
                    1,
                    Package() // Turbo
                    { 
                        "PSTATE", 
                        0,
                        Package(){ "CLOCK", Package(){ "cam_cc_ipe_1_clk",            3,       600000000,       3,     }},
                    },
                    Package() // SVS_L1
                    { 
                        "PSTATE", 
                        1,
                        Package(){ "CLOCK", Package(){ "cam_cc_ipe_1_clk",            3,       480000000,       3,     }},
                    },
                    Package() // SVS
                    { 
                        "PSTATE", 
                        2,
                        Package(){ "CLOCK", Package(){ "cam_cc_ipe_1_clk",            3,       404000000,       3,     }},
                    },
                    Package() // Off
                    { 
                        "PSTATE", 
                        3,
                        Package(){ "CLOCK", Package(){ "cam_cc_ipe_1_clk",            3,       0,       3,     }},
                    },
                },

                // IPE0/1 AHB & AREG Freq: TODO
            },

            Package()
            {
                "COMPONENT",
                0x5, // Component 5.  //BPS component
                Package()
                {
                    "FSTATE",
                    0x0, // F0 state
                    // Footswitch Name; Action (1 == Enable; 2 == Disable; 3 = HW_CONTROL enable, 4 = HW_CONTROL disable)
                    
                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   1} },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  1} },
                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      1} },

                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  1} },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     1 } },  // AHB clock for all register access within the JPEG core; SVS
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    1 } },  // Same as above; SVS
                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  1} },  // For DDR access through CAMNOC 
  
                    // BPS clocks
                    Package() { "FOOTSWITCH", Package() { "bps_gdsc",      1 } },

                    package() { "CLOCK", package() { "cam_cc_bps_ahb_clk",      1 } },      // SVS

                    package() { "CLOCK", package() { "cam_cc_bps_clk",          1          } },
                    package() { "PSTATE_ADJUST", Package() { 0, 2 } },                                  // Pstate adjustment for clock frequencies. Set to SVS

                    package() { "CLOCK", package() { "cam_cc_bps_areg_clk",      1 } },      // SVS
                    package() { "CLOCK", package() { "cam_cc_bps_axi_clk",       1          } },
                    
                    Package() { "FOOTSWITCH", Package() { "bps_gdsc",      3 } },   // HW control (TODO: need to enable by ES)


                },
                Package()
                {
                    "FSTATE",
                    0x1, // F1 state

                    Package() { "FOOTSWITCH", Package() { "bps_gdsc",      4 } },   // HW control (TODO: need to enable by ES)
                    
                    package() { "CLOCK", package() { "cam_cc_bps_axi_clk",        2  } },
                    package() { "CLOCK", package() { "cam_cc_bps_areg_clk",        2  } },

                    package() { "PSTATE_ADJUST", Package() { 0, 4 } },
                    package() { "CLOCK", package() { "cam_cc_bps_clk",             2  } },

                    package() { "CLOCK", package() { "cam_cc_bps_ahb_clk",         2  } },

                    Package() { "FOOTSWITCH", Package() { "bps_gdsc",      2 } },
                    

                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  2 } },
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    2 } },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     2 } },
                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  2 } },

                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      2 } },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  2 } },
                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   2 } },
                },

                // Clk Freq
                Package()
                {
                    "PSTATE_SET",
                    0,
                    Package() // Turbo
                    {
                        "PSTATE", 
                        0,
                        Package(){ "CLOCK", Package(){ "cam_cc_bps_clk",            3,       600000000,       3,     }},
                    },
                    Package() // SVS_L1
                    { 
                        "PSTATE", 
                        1,
                        Package(){ "CLOCK", Package(){ "cam_cc_bps_clk",            3,       480000000,       3,     }},
                    },
                    Package() // SVS
                    { 
                        "PSTATE", 
                        2,
                        Package(){ "CLOCK", Package(){ "cam_cc_bps_clk",            3,       404000000,       3,     }},
                    },
                    Package() // Off
                    { 
                        "PSTATE", 
                        3,
                        Package(){ "CLOCK", Package(){ "cam_cc_bps_clk",            3,       0,       3,     }},
                    },
                 },
                // BPS AHB & AREG Freq: TODO
            },

            Package() 
            { 
                "COMPONENT", 
                0x6, // Component 6.  //LRME component 
                Package() 
                { 
                    "FSTATE", 
                    0x0, // F0 state 

                    // Footswitch Name; Action (1 == Enable; 2 == Disable; ) 
                     
                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   1} },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  1} },
                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      1} },

                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  1} },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     1 } },  // AHB clock for all register access within the JPEG core; SVS
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    1 } },  // Same as above; SVS
                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  1} },  // For DDR access through CAMNOC 
             
                    // LRME clocks 
                    package() { "CLOCK", package() { "cam_cc_lrme_clk",           1 } },
                    package() { "PSTATE_ADJUST", Package() { 0, 2 } },                     // Pstate adjustment for clock frequencies. Set to SVS
                }, 
                Package() 
                { 
                    "FSTATE", 
                    0x1, // F1 state 

                    package() { "PSTATE_ADJUST", Package() { 0, 4 } },
                    package() { "CLOCK", package() { "cam_cc_lrme_clk",          2  } },
   
                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  2 } },
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    2 } },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     2 } },
                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  2 } },

                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      2 } },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  2 } },
                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   2 } },
                },
                
                // Clk Freq
                Package()
                {
                    "PSTATE_SET",
                    0,
                    Package() // Turbo, NOM
                    {
                        "PSTATE", 
                        0,
                        Package(){ "CLOCK", Package(){ "cam_cc_lrme_clk",            3,       400000000,       3,     }},
                    },
                    Package() // SVS_L1
                    { 
                        "PSTATE", 
                        1,
                        Package(){ "CLOCK", Package(){ "cam_cc_lrme_clk",            3,       320000000,       3,     }},
                    },
                    Package() // SVS
                    { 
                        "PSTATE", 
                        2,
                        Package(){ "CLOCK", Package(){ "cam_cc_lrme_clk",            3,       269000000,       3,     }},
                    },
                    Package() // Off
                    { 
                        "PSTATE", 
                        3,
                        Package(){ "CLOCK", Package(){ "cam_cc_lrme_clk",            3,       0,       3,     }},
                    },                    
                 },
            },


            Package()
            {
                "COMPONENT",
                0x7, // Component 7.  //FD component
                Package()
                {
                    "FSTATE",
                    0x0, // F0 state
                    
                    // Footswitch Name; Action (1 == Enable; 2 == Disable; ) 
                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   1} },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  1} },
                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      1} },

                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  1} },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     1 } },  // AHB clock for all register access within the JPEG core; SVS
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    1 } },  // Same as above; SVS
                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  1} },  // For DDR access through CAMNOC 

                    // FD clocks 
                    Package() { "CLOCK", Package(){ "cam_cc_fd_core_clk",          1 }},    // SVS.  DCVS recommendation
                    package() { "PSTATE_ADJUST", Package() { 0, 2 } },                      // Pstate adjustment for clock frequencies. Set to SVS

                },
                Package()
                {
                    "FSTATE",
                    0x1, // F1 state

                    package() { "PSTATE_ADJUST", Package() { 0, 4 } },
                    package() { "CLOCK", package() { "cam_cc_fd_core_clk",         2  } },
   
                    package() { "CLOCK", package() { "cam_cc_camnoc_axi_clk",  2 } },
                    package() { "CLOCK", package() { "cam_cc_cpas_ahb_clk",    2 } },
                    package() { "CLOCK", package() { "cam_cc_soc_ahb_clk",     2 } },
                    package() { "CLOCK",      package() { "gcc_camera_axi_clk",  2 } },

                    Package() { "FOOTSWITCH", Package() { "titan_top_gdsc",      2 } },
                    package() { "CLOCK",      package() { "gcc_camera_ahb_clk",  2 } },
                    package() { "CLOCK",      package() { "gcc_camera_xo_clk",   2 } },
                },

                // Clk Freq
                Package()
                {
                    "PSTATE_SET",
                    0,
                    Package() // Turbo, NOM
                    {
                        "PSTATE", 
                        0,
                        Package(){ "CLOCK", Package(){ "cam_cc_fd_core_clk",            3,       600000000,       3,     }},
                    },
                    Package() // SVS_L1
                    { 
                        "PSTATE", 
                        1,
                        Package(){ "CLOCK", Package(){ "cam_cc_fd_core_clk",            3,       538000000,       3,     }},
                    },
                    Package() // SVS
                    { 
                        "PSTATE", 
                        2,
                        Package(){ "CLOCK", Package(){ "cam_cc_fd_core_clk",            3,       400000000,       3,     }},
                    },
                    Package() // Off
                    { 
                        "PSTATE", 
                        3,
                        Package(){ "CLOCK", Package(){ "cam_cc_fd_core_clk",            3,       0,       3,     }},
                    },                    
                 },
           },
        },
    })
}
