//===========================================================================
//                           <corebsp_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by core BSP drivers.
//
//
//   Copyright (c) 2010-2019 by Mmoclauq Technologies Inc.  All Rights Reserved.
//   Mmoclauq Confidential and Proprietary
//
//===========================================================================


Scope(\_SB_.PEP0)
{

    Method(BPMD)
    {
        if(LEqual(STOR, 1)) {
            if(LEqual(PUS3, 1)) {
                Return (CPCC) // booting from UFS 3.0 or later 
            }
            else {
                Return (BPCC) // booting from UFS 2.1 or earlier 
            }
        }
        else {
            Return (FPCC) // disabling select primary UFS resources for NVMe boot 
        }
    }

    Method(SUMD) 
    {
        if(LEqual(STOR, 1)) {
            if(LEqual(SUS3, 1)) {
                Return (EPCC) // secondary UFS 3.0 or later
            }
            else {
                Return (DPCC) // secondary UFS 2.1 or earlier 
            }
        }
        else {
            Return (GPCC) // disabling select secondary UFS resources for NVMe boot
        }
    }

    Method(SDMD)
    {
        Return (SDCC)
    }

    Name(BPCC,
    Package ()
    {
        Package()
        {
            "DEVICE",
            "\\_SB.UFS0",
            Package()
            {
                "COMPONENT",
                0x0, // Component 0.
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                    Package() { "PSTATE_ADJUST", Package() { 0, 0 } },
                    Package() { "PSTATE_ADJUST", Package() { 1, 0 } },
                    Package() { "PSTATE_ADJUST", Package() { 2, 0 } },
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
                    Package() { "PSTATE_ADJUST", Package() { 2, 1 } },
                    Package() { "PSTATE_ADJUST", Package() { 1, 1 } },
                    Package() { "PSTATE_ADJUST", Package() { 0, 1 } },
                },

                Package()
                {
                    "PSTATE_SET",
                    0x0,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        Package() { "FOOTSWITCH", Package() { "ufs_phy_gdsc", 1 }},
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,
                        Package() { "FOOTSWITCH", Package() { "ufs_phy_gdsc", 2 }},
                    },
                },

                Package()
                {
                    "PSTATE_SET",
                    0x1,

                    Package()
                    {
                        "PSTATE",
                        0x0,

                        Package() {"CLOCK", package() {"gcc_ufs_phy_axi_clk", 8, 300000000, 2}},    
                        package() {"CLOCK", package() {"gcc_ufs_phy_unipro_core_clk", 8, 300000000, 2}}, 
                        package() {"CLOCK", package() {"gcc_ufs_phy_ice_core_clk", 8, 300000000, 2}},

                        Package() {"CLOCK", Package() {"gcc_aggre_ufs_phy_axi_clk", 1,}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_ahb_clk", 1,}},    
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_phy_aux_clk", 1,}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_tx_symbol_0_clk", 1,}}, 
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_rx_symbol_0_clk", 1,}}, 
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_rx_symbol_1_clk", 1,}}, 
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,

                        Package() {"CLOCK", Package() {"gcc_aggre_ufs_phy_axi_clk", 2,}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_ahb_clk", 2,}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_phy_aux_clk", 2,}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_tx_symbol_0_clk", 2,}}, 
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_rx_symbol_0_clk", 2,}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_rx_symbol_1_clk", 2,}},
                        package() {"CLOCK", package() {"gcc_ufs_phy_ice_core_clk", 2,}},
                        package() {"CLOCK", package() {"gcc_ufs_phy_unipro_core_clk", 2,}},
                        package() {"CLOCK", package() {"gcc_ufs_phy_axi_clk", 2,}}, 
                    },
                },

                Package()
                {
                    "PSTATE_SET",
                    0x2,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        Package() {"BUSARB", Package() { 3, "ICBID_MASTER_UFS_MEM",   "ICBID_SLAVE_EBI1",   1200000000,   1200000000}},
                        Package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC",   "ICBID_SLAVE_UFS_MEM_CFG",   299000000,   0}},
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,
                        Package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC",   "ICBID_SLAVE_UFS_MEM_CFG",   0,   0}},
                        Package() {"BUSARB", Package() { 3, "ICBID_MASTER_UFS_MEM",   "ICBID_SLAVE_EBI1",   0,   0}},
                    },
                },
            },

            Package()
            {
                "DSTATE",
                0x0, // D0 state

                Package() {"PSTATE_ADJUST", Package() { 2, 0 } },

                Package() {"PSTATE_ADJUST", Package() { 0, 0 } },

                // Vcc supply = L9        
                Package()    
                {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO9_C",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             2904000,                       // Voltage is in micro volts
                             1,                             // force enable from software
                             7,                             // power mode - Normal Power Mode
                             0,                             // head room voltage
                         },
                },

                // Vccq supply = L2 
                Package()    
                 {
                         "PMICVREGVOTE",   
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO2_C",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             1200000,                       // Voltage is in micro volts
                             1,                             // force enable from software
                             7,                             // power mode - Normal Power Mode
                             0,                             // head room voltage
                         },
                },

                // Vccq2 supply = L15 
                Package()
                {
                         "PMICVREGVOTE", 
                         Package()
                         {    
                             "PPP_RESOURCE_ID_LDO15_E",        // VREG ID 
                             1,                                // Voltage Regulator type = LDO
                             1800000,                          // Voltage is in micro volts
                             1,                                // Force enable from software
                             7,                                // Power mode - Normal Power Mode
                             0,                                // head room voltage
                         },
                },

                // PHY VDDA supply: L3
                Package()    
                {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO3_C",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             1200000,                       // Voltage is in micro volts
                             1,                             // force enable from software
                             7,                             // power mode - Normal Power Mode
                             0,                             // head room voltage
                         },
                 },

                 // VDDA_UFS_CORE supply: L5
                 Package()    
                 {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                            "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
                            1,                             // Voltage Regulator type = LDO
                            880000,                        // Voltage is in micro volts
                            1,                             // force enable from software
                            7,                             // power mode - Normal Power Mode
                            0,                             // head room voltage
                        },
                },

                Package() {"DELAY", package() { 35 }},

                Package() {"PSTATE_ADJUST", Package() { 1, 0 } },
            },
            Package()
            {
                "DSTATE",
                0x3, // D3 state

                Package() {"PSTATE_ADJUST", Package() { 1, 1 } },

                Package()    
                 {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                            "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
                            1,                             // Voltage Regulator type = LDO
                            880000,                        // Voltage is in micro volts
                            1,                             // force enable from software
                            4,                             // power mode - Low Power Mode
                            0,                             // head room voltage
                        },
                },

                Package()    
                {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO3_C",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             0,                             // Voltage is in micro volts
                             0,                             // force enable from software
                             0,                             // power mode - Normal Power Mode
                             0,                             // head room voltage
                         },
                },

                Package()
                {
                         "PMICVREGVOTE", 
                         Package()
                         {    
                             "PPP_RESOURCE_ID_LDO15_E",        // VREG ID 
                             1,                                // Voltage Regulator type = LDO
                             1800000,                          // Voltage is in micro volts
                             1,                                // Force enable from software
                             4,                                // Power mode - Low Power Mode
                             0,                                // head room voltage
                         },
                },

                Package()    
                 {
                         "PMICVREGVOTE",   
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO2_C",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             1200000,                       // Voltage is in micro volts
                             1,                             // force enable from software
                             4,                             // power mode - Low Power Mode
                             0,                             // head room voltage
                         },
                },

                Package()    
                {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO9_C",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             0,                             // Voltage is in micro volts
                             0,                             // force enable from software
                             0,                             // power mode - Normal Power Mode
                             0,                             // head room voltage
                         },
                },

                Package() {"PSTATE_ADJUST", Package() { 0, 1 } },
                Package() {"PSTATE_ADJUST", Package() { 2, 1 } },                   
            },
            
            Package()
            {
                "CRASHDUMP_DSTATE",
                0,
            },
        },   
    })

    Name(CPCC,
    Package ()
    {
        Package()
        {
            "DEVICE",
            "\\_SB.UFS0",
            Package()
            {
                "COMPONENT",
                0x0, // Component 0.
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                    Package() { "PSTATE_ADJUST", Package() { 0, 0 } },
                    Package() { "PSTATE_ADJUST", Package() { 1, 0 } },
                    Package() { "PSTATE_ADJUST", Package() { 2, 0 } },
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
                    Package() { "PSTATE_ADJUST", Package() { 2, 1 } },
                    Package() { "PSTATE_ADJUST", Package() { 1, 1 } },
                    Package() { "PSTATE_ADJUST", Package() { 0, 1 } },
                },

                Package()
                {
                    "PSTATE_SET",
                    0x0,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        Package() { "FOOTSWITCH", Package() { "ufs_phy_gdsc", 1 }},
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,
                        Package() { "FOOTSWITCH", Package() { "ufs_phy_gdsc", 2 }},
                    },
                },

                Package()
                {
                    "PSTATE_SET",
                    0x1,

                    Package()
                    {
                        "PSTATE",
                        0x0,

                        Package() {"CLOCK", package() {"gcc_ufs_phy_axi_clk", 8, 300000000, 2}},    
                        package() {"CLOCK", package() {"gcc_ufs_phy_unipro_core_clk", 8, 300000000, 2}}, 
                        package() {"CLOCK", package() {"gcc_ufs_phy_ice_core_clk", 8, 300000000, 2}},

                        Package() {"CLOCK", Package() {"gcc_aggre_ufs_phy_axi_clk", 1,}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_ahb_clk", 1,}},    
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_phy_aux_clk", 1,}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_tx_symbol_0_clk", 1,}}, 
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_rx_symbol_0_clk", 1,}}, 
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_rx_symbol_1_clk", 1,}}, 
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,

                        Package() {"CLOCK", Package() {"gcc_aggre_ufs_phy_axi_clk", 2,}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_ahb_clk", 2,}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_phy_aux_clk", 2,}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_tx_symbol_0_clk", 2,}}, 
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_rx_symbol_0_clk", 2,}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_rx_symbol_1_clk", 2,}},
                        package() {"CLOCK", package() {"gcc_ufs_phy_ice_core_clk", 2,}},
                        package() {"CLOCK", package() {"gcc_ufs_phy_unipro_core_clk", 2,}},
                        package() {"CLOCK", package() {"gcc_ufs_phy_axi_clk", 2,}}, 
                    },
                },

                Package()
                {
                    "PSTATE_SET",
                    0x2,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        Package() {"BUSARB", Package() { 3, "ICBID_MASTER_UFS_MEM",   "ICBID_SLAVE_EBI1",   2400000000,   2400000000}},
                        Package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC",   "ICBID_SLAVE_UFS_MEM_CFG",   299000000,   0}},
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,
                        Package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC",   "ICBID_SLAVE_UFS_MEM_CFG",   0,   0}},
                        Package() {"BUSARB", Package() { 3, "ICBID_MASTER_UFS_MEM",   "ICBID_SLAVE_EBI1",   0,   0}},
                    },
                },
            },

            Package()
            {
                "DSTATE",
                0x0, // D0 state

                Package() {"PSTATE_ADJUST", Package() { 2, 0 } },

                Package() {"PSTATE_ADJUST", Package() { 0, 0 } },

                // Vcc supply = L9        
                Package()    
                {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO9_C",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             2504000,                       // Voltage is in micro volts
                             1,                             // force enable from software
                             7,                             // power mode - Normal Power Mode
                             0,                             // head room voltage
                         },
                },

                // Vccq supply = L2 
                Package()    
                 {
                         "PMICVREGVOTE",   
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO2_C",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             1200000,                       // Voltage is in micro volts
                             1,                             // force enable from software
                             7,                             // power mode - Normal Power Mode
                             0,                             // head room voltage
                         },
                },

                // Vccq2 supply = L15 
                Package()
                {
                         "PMICVREGVOTE", 
                         Package()
                         {    
                             "PPP_RESOURCE_ID_LDO15_E",        // VREG ID 
                             1,                                // Voltage Regulator type = LDO
                             1800000,                          // Voltage is in micro volts
                             1,                                // Force enable from software
                             7,                                // Power mode - Normal Power Mode
                             0,                                // head room voltage
                         },
                },

                // PHY VDDA supply: L3
                Package()    
                {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO3_C",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             1200000,                       // Voltage is in micro volts
                             1,                             // force enable from software
                             7,                             // power mode - Normal Power Mode
                             0,                             // head room voltage
                         },
                 },

                 // VDDA_UFS_CORE supply: L5
                 Package()    
                 {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                            "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
                            1,                             // Voltage Regulator type = LDO
                            880000,                        // Voltage is in micro volts
                            1,                             // force enable from software
                            7,                             // power mode - Normal Power Mode
                            0,                             // head room voltage
                        },
                },

                Package() {"DELAY", package() { 35 }},

                Package() {"PSTATE_ADJUST", Package() { 1, 0 } },
            },
            Package()
            {
                "DSTATE",
                0x3, // D3 state

                Package() {"PSTATE_ADJUST", Package() { 1, 1 } },

                Package()    
                 {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                            "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
                            1,                             // Voltage Regulator type = LDO
                            880000,                        // Voltage is in micro volts
                            1,                             // force enable from software
                            4,                             // power mode - Low Power Mode
                            0,                             // head room voltage
                        },
                },

                Package()    
                {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO3_C",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             0,                             // Voltage is in micro volts
                             0,                             // force enable from software
                             0,                             // power mode - Normal Power Mode
                             0,                             // head room voltage
                         },
                },

                Package()
                {
                         "PMICVREGVOTE", 
                         Package()
                         {    
                             "PPP_RESOURCE_ID_LDO15_E",        // VREG ID 
                             1,                                // Voltage Regulator type = LDO
                             1800000,                          // Voltage is in micro volts
                             1,                                // Force enable from software
                             4,                                // Power mode - Low Power Mode
                             0,                                // head room voltage
                         },
                },

                Package()    
                 {
                         "PMICVREGVOTE",   
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO2_C",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             1200000,                       // Voltage is in micro volts
                             1,                             // force enable from software
                             4,                             // power mode - Low Power Mode
                             0,                             // head room voltage
                         },
                },

                Package()    
                {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO9_C",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             0,                             // Voltage is in micro volts
                             0,                             // force enable from software
                             0,                             // power mode - Normal Power Mode
                             0,                             // head room voltage
                         },
                },

                Package() {"PSTATE_ADJUST", Package() { 0, 1 } },
                Package() {"PSTATE_ADJUST", Package() { 2, 1 } },                   
            },
            
            Package()
            {
                "CRASHDUMP_DSTATE",
                0,
            },
        },
    })

    Name(DPCC,
    Package ()
    {      
        Package()
        {
            "DEVICE",
            "\\_SB.UFS1",
            Package()
            {
                "COMPONENT",
                0x0, // Component 0.
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                    Package() { "PSTATE_ADJUST", Package() { 0, 0 } },
                    Package() { "PSTATE_ADJUST", Package() { 1, 0 } },
                    Package() { "PSTATE_ADJUST", Package() { 2, 0 } },
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
                    Package() { "PSTATE_ADJUST", Package() { 2, 1 } },
                    Package() { "PSTATE_ADJUST", Package() { 1, 1 } },
                    Package() { "PSTATE_ADJUST", Package() { 0, 1 } },
                },

                Package()
                {
                    "PSTATE_SET",
                    0x0,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        Package() { "FOOTSWITCH", Package() { "ufs_card_2_gdsc", 1 }},
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,
                        Package() { "FOOTSWITCH", Package() { "ufs_card_2_gdsc", 2 }},
                    },
                },

                Package()
                {
                    "PSTATE_SET",
                    0x1,

                    Package()
                    {
                        "PSTATE",
                        0x0,

                        Package() {"CLOCK", package() {"gcc_ufs_card_2_axi_clk", 8, 300000000, 2}},    
                        package() {"CLOCK", package() {"gcc_ufs_card_2_unipro_core_clk", 8, 300000000, 2}}, 
                        package() {"CLOCK", package() {"gcc_ufs_card_2_ice_core_clk", 8, 300000000, 2}},

                        Package() {"CLOCK", Package() {"gcc_aggre_ufs_card_2_axi_clk", 1,}},
                        Package() {"CLOCK", Package() {"gcc_ufs_card_2_ahb_clk", 1,}},    
                        Package() {"CLOCK", Package() {"gcc_ufs_card_2_phy_aux_clk", 1,}},
                        Package() {"CLOCK", Package() {"gcc_ufs_card_2_tx_symbol_0_clk", 1,}}, 
                        Package() {"CLOCK", Package() {"gcc_ufs_card_2_rx_symbol_0_clk", 1,}}, 
                        Package() {"CLOCK", Package() {"gcc_ufs_card_2_rx_symbol_1_clk", 1,}}, 
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,

                        Package() {"CLOCK", Package() {"gcc_aggre_ufs_card_2_axi_clk", 2,}},
                        Package() {"CLOCK", Package() {"gcc_ufs_card_2_ahb_clk", 2,}},
                        Package() {"CLOCK", Package() {"gcc_ufs_card_2_phy_aux_clk", 2,}},
                        Package() {"CLOCK", Package() {"gcc_ufs_card_2_tx_symbol_0_clk", 2,}}, 
                        Package() {"CLOCK", Package() {"gcc_ufs_card_2_rx_symbol_0_clk", 2,}},
                        Package() {"CLOCK", Package() {"gcc_ufs_card_2_rx_symbol_1_clk", 2,}},
                        package() {"CLOCK", package() {"gcc_ufs_card_2_ice_core_clk", 2,}},
                        package() {"CLOCK", package() {"gcc_ufs_card_2_unipro_core_clk", 2,}},
                        package() {"CLOCK", package() {"gcc_ufs_card_2_axi_clk", 2,}}, 
                    },
                },

                Package()
                {
                    "PSTATE_SET",
                    0x2,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        Package() {"BUSARB", Package() { 3, "ICBID_MASTER_UFS_GEN4",   "ICBID_SLAVE_EBI1",   1200000000,   1200000000}},
                        Package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC",   "ICBID_SLAVE_UFS_MEM_1_CFG",   299000000,   0}},
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,
                        Package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC",   "ICBID_SLAVE_UFS_MEM_1_CFG",   0,   0}},
                        Package() {"BUSARB", Package() { 3, "ICBID_MASTER_UFS_GEN4",   "ICBID_SLAVE_EBI1",   0,   0}},
                    },
                },
            },

            Package()
            {
                "DSTATE",
                0x0, // D0 state

                Package() {"PSTATE_ADJUST", Package() { 2, 0 } },

                Package() {"PSTATE_ADJUST", Package() { 0, 0 } },

                // Vcc supply = L10      
                Package()    
                {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO10_E",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             2904000,                       // Voltage is in micro volts
                             1,                             // force enable from software
                             7,                             // power mode - Normal Power Mode
                             0,                             // head room voltage
                         },
                },

                // Vccq supply = L6
                Package()    
                 {
                         "PMICVREGVOTE",   
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO6_A",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             1200000,                       // Voltage is in micro volts
                             1,                             // force enable from software
                             7,                             // power mode - Normal Power Mode
                             0,                             // head room voltage
                         },
                },

                // Vccq2 supply = L7
                Package()
                {
                         "PMICVREGVOTE", 
                         Package()
                         {    
                             "PPP_RESOURCE_ID_LDO7_E",        // VREG ID 
                             1,                                // Voltage Regulator type = LDO
                             1800000,                          // Voltage is in micro volts
                             1,                                // Force enable from software
                             7,                                // Power mode - Normal Power Mode
                             0,                                // head room voltage
                         },
                },

                // PHY VDDA supply: L3
                Package()    
                {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO3_C",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             1200000,                       // Voltage is in micro volts
                             1,                             // force enable from software
                             7,                             // power mode - Normal Power Mode
                             0,                             // head room voltage
                         },
                 },

                 // VDDA_UFS_CORE supply: L5
                 Package()    
                 {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                            "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
                            1,                             // Voltage Regulator type = LDO
                            880000,                        // Voltage is in micro volts
                            1,                             // force enable from software
                            7,                             // power mode - Normal Power Mode
                            0,                             // head room voltage
                        },
                },

                Package() {"DELAY", package() { 35 }},

                Package() {"PSTATE_ADJUST", Package() { 1, 0 } },
            },
            Package()
            {
                "DSTATE",
                0x3, // D3 state

                Package() {"PSTATE_ADJUST", Package() { 1, 1 } },

                Package()    
                 {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                            "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
                            1,                             // Voltage Regulator type = LDO
                            880000,                        // Voltage is in micro volts
                            1,                             // force enable from software
                            4,                             // power mode - Low Power Mode
                            0,                             // head room voltage
                        },
                },

                Package()    
                {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO3_C",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             0,                             // Voltage is in micro volts
                             0,                             // force enable from software
                             0,                             // power mode - Normal Power Mode
                             0,                             // head room voltage
                         },
                },

                Package()
                {
                         "PMICVREGVOTE", 
                         Package()
                         {    
                             "PPP_RESOURCE_ID_LDO7_E",         // VREG ID 
                             1,                                // Voltage Regulator type = LDO
                             1800000,                          // Voltage is in micro volts
                             1,                                // Force enable from software
                             4,                                // Power mode - Low Power Mode
                             0,                                // head room voltage
                         },
                },

                Package()    
                {
                         "PMICVREGVOTE",   
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO6_A",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             1200000,                       // Voltage is in micro volts
                             1,                             // force enable from software
                             4,                             // power mode - Low Power Mode
                             0,                             // head room voltage
                         },
                },

                Package()    
                {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO10_E",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             0,                             // Voltage is in micro volts
                             0,                             // force enable from software
                             0,                             // power mode - Normal Power Mode
                             0,                             // head room voltage
                         },
                },

                Package() {"PSTATE_ADJUST", Package() { 0, 1 } },
                Package() {"PSTATE_ADJUST", Package() { 2, 1 } },                   
            },
        },      
    })

    Name(EPCC,
    Package ()
    {     
        Package()
        {
            "DEVICE",
            "\\_SB.UFS1",
            Package()
            {
                "COMPONENT",
                0x0, // Component 0.
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                    Package() { "PSTATE_ADJUST", Package() { 0, 0 } },
                    Package() { "PSTATE_ADJUST", Package() { 1, 0 } },
                    Package() { "PSTATE_ADJUST", Package() { 2, 0 } },
                },
                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
                    Package() { "PSTATE_ADJUST", Package() { 2, 1 } },
                    Package() { "PSTATE_ADJUST", Package() { 1, 1 } },
                    Package() { "PSTATE_ADJUST", Package() { 0, 1 } },
                },

                Package()
                {
                    "PSTATE_SET",
                    0x0,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        Package() { "FOOTSWITCH", Package() { "ufs_card_2_gdsc", 1 }},
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,
                        Package() { "FOOTSWITCH", Package() { "ufs_card_2_gdsc", 2 }},
                    },
                },

                Package()
                {
                    "PSTATE_SET",
                    0x1,

                    Package()
                    {
                        "PSTATE",
                        0x0,

                        Package() {"CLOCK", package() {"gcc_ufs_card_2_axi_clk", 8, 300000000, 2}},    
                        package() {"CLOCK", package() {"gcc_ufs_card_2_unipro_core_clk", 8, 300000000, 2}}, 
                        package() {"CLOCK", package() {"gcc_ufs_card_2_ice_core_clk", 8, 300000000, 2}},

		       	        Package() {"CLOCK", Package() {"gcc_aggre_ufs_card_2_axi_clk", 1,}},
                        Package() {"CLOCK", Package() {"gcc_ufs_card_2_ahb_clk", 1,}},    
                        Package() {"CLOCK", Package() {"gcc_ufs_card_2_phy_aux_clk", 1,}},
                        Package() {"CLOCK", Package() {"gcc_ufs_card_2_tx_symbol_0_clk", 1,}}, 
                        Package() {"CLOCK", Package() {"gcc_ufs_card_2_rx_symbol_0_clk", 1,}}, 
                        Package() {"CLOCK", Package() {"gcc_ufs_card_2_rx_symbol_1_clk", 1,}}, 
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,

                        Package() {"CLOCK", Package() {"gcc_aggre_ufs_card_2_axi_clk", 2,}},
                        Package() {"CLOCK", Package() {"gcc_ufs_card_2_ahb_clk", 2,}},
                        Package() {"CLOCK", Package() {"gcc_ufs_card_2_phy_aux_clk", 2,}},
                        Package() {"CLOCK", Package() {"gcc_ufs_card_2_tx_symbol_0_clk", 2,}}, 
                        Package() {"CLOCK", Package() {"gcc_ufs_card_2_rx_symbol_0_clk", 2,}},
		        		Package() {"CLOCK", Package() {"gcc_ufs_card_2_rx_symbol_1_clk", 2,}},
                        package() {"CLOCK", package() {"gcc_ufs_card_2_ice_core_clk", 2,}},
                        package() {"CLOCK", package() {"gcc_ufs_card_2_unipro_core_clk", 2,}},
                        package() {"CLOCK", package() {"gcc_ufs_card_2_axi_clk", 2,}}, 
                    },
                },

                Package()
                {
                    "PSTATE_SET",
                    0x2,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        Package() {"BUSARB", Package() { 3, "ICBID_MASTER_UFS_GEN4",   "ICBID_SLAVE_EBI1",   2400000000,   2400000000}},
                        Package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC",   "ICBID_SLAVE_UFS_MEM_1_CFG",   299000000,   0}},
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,
                        Package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC",   "ICBID_SLAVE_UFS_MEM_1_CFG",   0,   0}},
                        Package() {"BUSARB", Package() { 3, "ICBID_MASTER_UFS_GEN4",   "ICBID_SLAVE_EBI1",   0,   0}},
                    },
                },
            },

            Package()
            {
                "DSTATE",
                0x0, // D0 state

				Package() {"PSTATE_ADJUST", Package() { 2, 0 } },

                Package() {"PSTATE_ADJUST", Package() { 0, 0 } },

                // Vcc supply = L10      
                Package()    
                {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO10_E",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             2504000,                       // Voltage is in micro volts
                             1,                             // force enable from software
                             7,                             // power mode - Normal Power Mode
                             0,                             // head room voltage
                         },
                },

                // Vccq supply = L6
                Package()    
                 {
                         "PMICVREGVOTE",   
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO6_A",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             1200000,                       // Voltage is in micro volts
                             1,                             // force enable from software
                             7,                             // power mode - Normal Power Mode
                             0,                             // head room voltage
                         },
                },

                // Vccq2 supply = L7
                Package()
                {
                         "PMICVREGVOTE", 
                         Package()
                         {    
                             "PPP_RESOURCE_ID_LDO7_E",        // VREG ID 
                             1,                                // Voltage Regulator type = LDO
                             1800000,                          // Voltage is in micro volts
                             1,                                // Force enable from software
                             7,                                // Power mode - Normal Power Mode
                             0,                                // head room voltage
                         },
                },

                // PHY VDDA supply: L3
                Package()    
                {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO3_C",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             1200000,                       // Voltage is in micro volts
                             1,                             // force enable from software
                             7,                             // power mode - Normal Power Mode
                             0,                             // head room voltage
                         },
                 },

                 // VDDA_UFS_CORE supply: L5
                 Package()    
                 {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                            "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
                            1,                             // Voltage Regulator type = LDO
                            880000,                        // Voltage is in micro volts
                            1,                             // force enable from software
                            7,                             // power mode - Normal Power Mode
                            0,                             // head room voltage
                        },
                },

                Package() {"DELAY", package() { 35 }},

                Package() {"PSTATE_ADJUST", Package() { 1, 0 } },
            },
            Package()
            {
                "DSTATE",
                0x3, // D3 state

                Package() {"PSTATE_ADJUST", Package() { 1, 1 } },

                Package()    
                 {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                            "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
                            1,                             // Voltage Regulator type = LDO
                            880000,                        // Voltage is in micro volts
                            1,                             // force enable from software
                            4,                             // power mode - Low Power Mode
                            0,                             // head room voltage
                        },
                },

                Package()    
                {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO3_C",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             0,                             // Voltage is in micro volts
                             0,                             // force enable from software
                             0,                             // power mode - Normal Power Mode
                             0,                             // head room voltage
                         },
                },

                Package()
                {
                         "PMICVREGVOTE", 
                         Package()
                         {    
                             "PPP_RESOURCE_ID_LDO7_E",         // VREG ID 
                             1,                                // Voltage Regulator type = LDO
                             1800000,                          // Voltage is in micro volts
                             1,                                // Force enable from software
                             4,                                // Power mode - Low Power Mode
                             0,                                // head room voltage
                         },
                },

                Package()    
                {
                         "PMICVREGVOTE",   
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO6_A",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             1200000,                       // Voltage is in micro volts
                             1,                             // force enable from software
                             4,                             // power mode - Low Power Mode
                             0,                             // head room voltage
                         },
                },

                Package()    
                {
                         "PMICVREGVOTE",    
                         Package()
                         {                                    
                             "PPP_RESOURCE_ID_LDO10_E",      // VREG ID
                             1,                             // Voltage Regulator type = LDO
                             0,                             // Voltage is in micro volts
                             0,                             // force enable from software
                             0,                             // power mode - Normal Power Mode
                             0,                             // head room voltage
                         },
                },

                Package() {"PSTATE_ADJUST", Package() { 0, 1 } },
				Package() {"PSTATE_ADJUST", Package() { 2, 1 } },       			
            },
        },		
    })

    Name(FPCC,
    Package ()
    {
        Package()
        {
            "DEVICE",
            "\\_SB.UFS0",
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
                    "FSTATE",
                    0x1, // f1 state
                },
            },          
            
            Package()
            {
                "PRELOAD_DSTATE",
                3,
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

             
                // Vccq2 supply = L15
                Package()    
                {
                    "PMICVREGVOTE",    
                    Package()
                    {                                    
                        "PPP_RESOURCE_ID_LDO15_E",     // VREG ID
                        1,                             // Voltage Regulator type = LDO
                        0,                             // Voltage is in micro volts
                        0,                             // force enable from software
                        0,                             // power mode - Low Power Mode
                        0,                             // head room voltage
                    },
                },

                // Vccq supply = L2 
                Package()    
                {
                    "PMICVREGVOTE",   
                    Package()
                    {                                    
                        "PPP_RESOURCE_ID_LDO2_C",      // VREG ID
                        1,                             // Voltage Regulator type = LDO
                        0,                             // Voltage is in micro volts
                        0,                             // force enable from software
                        0,                             // power mode - Low Power Mode
                        0,                             // head room voltage
                    },
                },              
                
                // Vcc supply = L9 
                Package()    
                {
                    "PMICVREGVOTE",    
                    Package()
                    {                                    
                        "PPP_RESOURCE_ID_LDO9_C",      // VREG ID
                        1,                             // Voltage Regulator type = LDO
                        0,                             // Voltage is in micro volts
                        0,                             // force enable from software
                        0,                             // power mode - Low Power Mode
                        0,                             // head room voltage
                    },
                },              
            },
        },
    })

    Name(GPCC,
    Package ()
    {
        Package()
        {
            "DEVICE",
            "\\_SB.UFS1",
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
                    "FSTATE",
                    0x1, // f1 state
                },
            },          
            
            Package()
            {
                "PRELOAD_DSTATE",
                3,
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
                
                // Vccq2 supply = L7
                Package()    
                {
                    "PMICVREGVOTE",    
                    Package()
                    {                                    
                        "PPP_RESOURCE_ID_LDO7_E",      // VREG ID
                        1,                             // Voltage Regulator type = LDO
                        0,                             // Voltage is in micro volts
                        0,                             // force enable from software
                        0,                             // power mode - Low Power Mode
                        0,                             // head room voltage
                    },
                },

                // Vccq supply = L6 
                Package()    
                {
                    "PMICVREGVOTE",   
                    Package()
                    {                                    
                        "PPP_RESOURCE_ID_LDO6_A",      // VREG ID
                        1,                             // Voltage Regulator type = LDO
                        0,                             // Voltage is in micro volts
                        0,                             // force enable from software
                        0,                             // power mode - Low Power Mode
                        0,                             // head room voltage
                    },
                },              
                
                // Vcc supply = L10 
                Package()    
                {
                    "PMICVREGVOTE",    
                    Package()
                    {                                    
                        "PPP_RESOURCE_ID_LDO10_E",     // VREG ID
                        1,                             // Voltage Regulator type = LDO
                        0,                             // Voltage is in micro volts
                        0,                             // force enable from software
                        0,                             // power mode - Low Power Mode
                        0,                             // head room voltage
                    },
                },              
            },
        },
    })

    Name(SDCC,
    Package ()
    {
        Package()
        {
            "DEVICE",
            "\\_SB.SDC2",
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
                    "FSTATE",
                    0x1, // f1 state
                },

                Package()
                {
                    "PSTATE_SET",
                    0x0,

                    //
                    // Contract with SDBUS for card frequencies
                    //
                    // P-State      Note
                    // --------     -----
                    // 0 - 19       Reserved (Legacy)
                    // 20           Reset to 3.3v signal voltage (max fixed at 2.95v)
                    // 21           1.8v signal voltage (max fixed at 1.85v)
                    Package(){"PSTATE",       0, Package(){"DELAY", package() { 1 }}},
                    Package(){"PSTATE",       1, Package(){"DELAY", package() { 1 }}},
                    Package(){"PSTATE",       2, Package(){"DELAY", package() { 1 }}},
                    Package(){"PSTATE",       3, Package(){"DELAY", package() { 1 }}},
                    Package(){"PSTATE",       4, Package(){"DELAY", package() { 1 }}},
                    Package(){"PSTATE",       5, Package(){"DELAY", package() { 1 }}},
                    Package(){"PSTATE",       6, Package(){"DELAY", package() { 1 }}},
                    Package(){"PSTATE",       7, Package(){"DELAY", package() { 1 }}},
                    Package(){"PSTATE",       8, Package(){"DELAY", package() { 1 }}},
                    Package(){"PSTATE",       9, Package(){"DELAY", package() { 1 }}},
                    Package(){"PSTATE",      11, Package(){"DELAY", package() { 1 }}},
                    Package(){"PSTATE",      12, Package(){"DELAY", package() { 1 }}},
                    Package(){"PSTATE",      13, Package(){"DELAY", package() { 1 }}},
                    Package(){"PSTATE",      14, Package(){"DELAY", package() { 1 }}},
                    Package(){"PSTATE",      15, Package(){"DELAY", package() { 1 }}},
                    Package(){"PSTATE",      16, Package(){"DELAY", package() { 1 }}},
                    Package(){"PSTATE",      17, Package(){"DELAY", package() { 1 }}},
                    Package(){"PSTATE",      18, Package(){"DELAY", package() { 1 }}},
                    Package(){"PSTATE",      19, Package(){"DELAY", package() { 1 }}},
                    Package(){"PSTATE",      20,
                        Package()
                        {
                            "PMICVREGVOTE",    // PMICVREGVOTE resource
                            Package()
                            {
                                "PPP_RESOURCE_ID_LDO17_E",     // VREG ID
                                1,                             // Voltage Regulator type = LDO
                                0,                             // Voltage is in micro volts
                                0,                             // force disable from software
                                0,                             // power mode - Low Power Mode
                                0,                             // head room voltage
                            },
                        },
                        Package()
                        {
                            "PMICVREGVOTE",    // PMICVREGVOTE resource
                            Package()
                            {
                                "PPP_RESOURCE_ID_LDO6_C",     // VREG ID
                                1,                             // Voltage Regulator type = LDO
                                0,                             // Voltage is in micro volts
                                0,                             // force disable from software
                                0,                             // power mode - Low Power Mode
                                0,                             // head room voltage
                            },
                        },
                        Package() {"DELAY", package() { 35 }},
                        Package()
                        {
                            "PMICVREGVOTE",    // PMICVREGVOTE resource
                            Package()
                            {
                                "PPP_RESOURCE_ID_LDO17_E",     // VREG ID
                                1,                             // Voltage Regulator type = LDO
                                2960000,                       // Voltage is in micro volts
                                1,                             // force enable from software
                                7,                             // power mode - Normal Power Mode
                                0,                             // head room voltage
                            },
                        },
                        Package()
                        {
                            "PMICVREGVOTE",    // PMICVREGVOTE resource
                            Package()
                            {
                                "PPP_RESOURCE_ID_LDO6_C",     // VREG ID
                                1,                             // Voltage Regulator type = LDO
                                2950000,                       // Voltage is in micro volts
                                1,                             // force enable from software
                                7,                             // power mode - Normal Power Mode
                                0,                             // head room voltage
                            },
                        },
                        Package() {"DELAY", package() { 35 }},
                    },
                    Package(){"PSTATE",      21,
                        Package()
                        {
                            "PMICVREGVOTE",    // PMICVREGVOTE resource
                            Package()
                            {
                                "PPP_RESOURCE_ID_LDO6_C",  // VREG ID
                                1,                          // Voltage Regulator type = LDO
                                1800000,                    // Voltage is in micro volts
                                1,                          // force enable from software
                                7,                          // power mode - Normal Power Mode
                                0,                          // head room voltage
                            },
                        },
                        Package() {"DELAY", package() { 35 }},
                    },
                    Package(){"PSTATE",      22,
                        Package()
                        {
                            "PMICVREGVOTE",    // PMICVREGVOTE resource
                            Package()
                            {
                                "PPP_RESOURCE_ID_LDO17_E",     // VREG ID
                                1,                             // Voltage Regulator type = LDO
                                2960000,                       // Voltage is in micro volts
                                1,                             // force enable from software
                                7,                             // power mode - Normal Power Mode
                                0,                             // head room voltage
                            },
                        },
                        Package()
                        {
                            "PMICVREGVOTE",    // PMICVREGVOTE resource
                            Package()
                            {
                                "PPP_RESOURCE_ID_LDO6_C",     // VREG ID
                                1,                             // Voltage Regulator type = LDO
                                2950000,                       // Voltage is in micro volts
                                1,                             // force enable from software
                                7,                             // power mode - Normal Power Mode
                                0,                             // head room voltage
                            },
                        },
                        Package() {"DELAY", package() { 35 }},
                    },
                    Package(){"PSTATE",      23,
                        Package()
                        {
                            "PMICVREGVOTE",    // PMICVREGVOTE resource
                            Package()
                            {
                                "PPP_RESOURCE_ID_LDO17_E",     // VREG ID
                                1,                             // Voltage Regulator type = LDO
                                0,                             // Voltage is in micro volts
                                0,                             // force disable from software
                                0,                             // power mode - Low Power Mode
                                0,                             // head room voltage
                            },
                        },
                        Package()
                        {
                            "PMICVREGVOTE",    // PMICVREGVOTE resource
                            Package()
                            {
                                "PPP_RESOURCE_ID_LDO6_C",     // VREG ID
                                1,                             // Voltage Regulator type = LDO
                                0,                             // Voltage is in micro volts
                                0,                             // force disable from software
                                0,                             // power mode - Low Power Mode
                                0,                             // head room voltage
                            },
                        },
                        Package() {"DELAY", package() { 35 }},
                    },
                },

                 // P-state set 1: APPS Clock frequencies
                 // 0:  Disable
                 // 1:   20 MHz (SVS2)
                 // 2:  100 MHz (SVS)
                 // 3:  202 MHz (Nominal)
                 Package()
                 {
                     "PSTATE_SET",
                     0x1,

                     Package()
                     {
                         "PSTATE",
                         0x0,
                         package() {"CLOCK", package() {"gcc_sdcc2_apps_clk", 2}},
                     },
                     Package()
                     {
                         "PSTATE",
                         0x1,
                         package() {"CLOCK", package() {"gcc_sdcc2_apps_clk", 8, 20000000, 2}},
                     },
                     Package()
                     {
                         "PSTATE",
                         0x2,
                         package() {"CLOCK", package() {"gcc_sdcc2_apps_clk", 8, 100000000, 2}},
                     },
                     Package()
                     {
                         "PSTATE",
                         0x3,
                         package() {"CLOCK", package() {"gcc_sdcc2_apps_clk", 8, 202000000, 2}},
                     },
                },

                // P-state set 2: Bus Bandwidth requests
                // P0: IB = 400 MBps, AB = 200 MBps
                // P1: IB = 200 MBps, AB = 100 MBps
                // P2: IB =  40 MBps, AB =  20 MBps
                // P3: IB =   0 MBps, AB =   0 MBps
                Package()
                {
                    "PSTATE_SET",
                    0x2,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        package() {"BUSARB", Package() { 3,     "ICBID_MASTER_SDCC_2",   "ICBID_SLAVE_EBI1",   400000000,   200000000}},
                    },

                    Package()
                    {
                        "PSTATE",
                        0x1,
                        package() {"BUSARB", Package() { 3,     "ICBID_MASTER_SDCC_2",   "ICBID_SLAVE_EBI1",   200000000,   100000000}},
                    },

                    Package()
                    {
                        "PSTATE",
                        0x2,
                        package() {"BUSARB", Package() { 3,     "ICBID_MASTER_SDCC_2",   "ICBID_SLAVE_EBI1",   40000000,   20000000}},
                    },

                    Package()
                    {
                        "PSTATE",
                        0x3,
                        package() {"BUSARB", Package() { 3,     "ICBID_MASTER_SDCC_2",   "ICBID_SLAVE_EBI1",   0,   0}},
                    },
                },

                // P-state set 3: MSFT P-states
                // P0: Clk = 200 MHz, IB = 400 MBps, AB = 200 MBps
                // P1: Clk = 100 MHz, IB = 200 MBps, AB = 100 MBps
                // P2: Clk = 20 MHz,  IB =  40 MBps, AB =  20 MBps
                Package()
                {
                    "PSTATE_SET",
                    0x3,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        Package() { "PSTATE_ADJUST", Package() { 1, 3 } },
                        Package() { "PSTATE_ADJUST", Package() { 2, 0 } },
                    },
                    Package()
                    {
                       "PSTATE",
                        0x1,
                        Package() { "PSTATE_ADJUST", Package() { 1, 2 } },
                        Package() { "PSTATE_ADJUST", Package() { 2, 1 } },
                    },
                    Package()
                    {
                        "PSTATE",
                        0x2,
                        Package() { "PSTATE_ADJUST", Package() { 1, 1 } },
                        Package() { "PSTATE_ADJUST", Package() { 2, 2 } },
                    },
                },


                // P-state set 4: AHB clock
                Package()
                {
                    "PSTATE_SET",
                    0x4,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        package() {"CLOCK", package() {"gcc_sdcc2_ahb_clk", 1,}},   // AHB freq should be 100 MHz
                    },
                    Package()
                    {
                       "PSTATE",
                        0x1,
                        package() {"CLOCK", package() {"gcc_sdcc2_ahb_clk", 2}},
                    },
                },
            },

            Package()
            {
                "DSTATE",
                0x0, // D0 state

                Package() {"PSTATE_ADJUST", Package () { 0, 22 }},
                package() {"TLMMPORT", package() { 0x9B2000, 0x7FFF, 0x1FE4 }},
                Package() {"PSTATE_ADJUST", Package() { 2, 0 }},
                Package() {"PSTATE_ADJUST", Package() { 4, 0 }},
                Package() {"PSTATE_ADJUST", Package() { 1, 3 }},
            },
            Package()
            {
                "DSTATE",
                0x3, // D3 state

                Package() {"PSTATE_ADJUST", Package() { 1, 0 }},
                Package() {"PSTATE_ADJUST", Package() { 4, 1 }},
                Package() {"PSTATE_ADJUST", Package() { 2, 3 }},
                package() {"TLMMPORT", package() { 0x9B2000, 0x7FFF, 0xA00 }},
                Package() {"PSTATE_ADJUST", Package () { 0, 23 }},
            },

            // Consider Abandon state as D3 state. This is executed by PEP when the driver unloads.
            Package() { "ABANDON_DSTATE", 3 },

            Package()
            {
                "CRASHDUMP_EXCEPTION",                    
                Package() { "EXECUTE_FUNCTION", Package() { "ExecuteOcdSdCardExceptions"}},
            },            
            
            Package()
            {
                "CRASHDUMP_DSTATE",
                0,
            },

        },
        ///////////////////////////////////////////////////////////////////////////////////////

        Package()
        {
            "DEVICE",
            "\\_SB.ADSP.SLM1",
            Package()
            {
                "COMPONENT",
                0x0, // Component 0
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
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
                0x1, // D1 state
            },
            Package()
            {
                "DSTATE",
                0x2, // D2 state
            },
            Package()
            {
                "DSTATE",
                0x3, // D3 state
            },
        },
        Package()
        {
            "DEVICE",
            "\\_SB.ADSP.SLM2",
            Package()
            {
                "COMPONENT",
                0x0, // Component 0
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
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
                0x1, // D1 state
            },
            Package()
            {
                "DSTATE",
                0x2, // D2 state
            },
            Package()
            {
                "DSTATE",
                0x3, // D3 state
            },
        },
        /////////////////////////////////////////////////////////////////////////////////////
    })

   Name(LPCC,
    package ()
    {

       //UCSI Type-C resources
       Package()
       {
          "DEVICE",
          "\\_SB.UCS0",
          Package()
          {
              "COMPONENT",0, //Component 0: USB HS Rails for Charger Detection
              Package(){"FSTATE", 0 }, //Dummy F-State, required for P-State operation        
              Package()
              {
                  "PSTATE", 0, // P0 state - Component ON     
                  //Nominal==block vdd_min:
                  package()
                  {
                      "NPARESOURCE",
                      Package() {1, "/arc/client/rail_cx", 256}
                  },           

                // Enable usb30_prim_gdsc power domain
                package()
                {
                    "FOOTSWITCH",       // Footswitch
                    package()
                    {
                        "usb30_prim_gdsc",   // USB 3.0 Core Power domain
                        1,                   //1==Enable
                    },
                },

                // Enable USB 3.0 Sleep Clock
                package() { "CLOCK", package() { "gcc_usb30_prim_sleep_clk", 1}},
                // Mark Suppressible for USB 3.0 Sleep Clock
                package() { "CLOCK", package() { "gcc_usb30_prim_sleep_clk", 9, 8,}},
                // Mark Always On for USB 3.0 Sleep Clock
                package() { "CLOCK", package() { "gcc_usb30_prim_sleep_clk", 9, 12,}},
                //Select external source action for gcc_usb3_prim_phy_pipe_clk, Sourced by QMP Phy PLL
                // package() {"CLOCK", package() {"gcc_usb3_prim_phy_pipe_clk", 6, 0, 0, 0x0}},
                // Enable PHY pipe Clock
                package() { "CLOCK", package() { "gcc_usb3_prim_phy_pipe_clk", 1}},
                // Mark Suppressible for USB PHY pipe Clock
                package() { "CLOCK", package() { "gcc_usb3_prim_phy_pipe_clk", 9, 8,}},
                // Now Enable all the clocks
                //aggre_usb3_prim_axi Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
                package() {"CLOCK", package() {"gcc_aggre_usb3_prim_axi_clk",  8, 200, 9}},
                // gcc_cfg_noc_usb3_prim_axi_clk should be configured to the frequency as master clock
                // @ 120 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
                package() {"CLOCK", package() {"gcc_cfg_noc_usb3_prim_axi_clk", 8, 200, 9}},
                // USB 3.0 Master Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
                package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 8, 200, 9}},
                // Phy Aux Clock @ 1.2 Mhz 8 = Set & Enable; 1.2, 7 -> Closest 1.2 Mhz
                package() {"CLOCK", package() {"gcc_usb3_prim_phy_aux_clk", 8, 1200, 7}},
                // Phy Com Aux Clock @ 19.2 Mhz 8 = Set & Enable; 19.2, 7 -> Closest 19.2 Mhz
                package() {"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 8, 19200, 7}},
                // Mark Suppressible for Phy Com Aux Clock
                package() {"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 9, 8,}},

                // Enable usb30_sec_gdsc power domain
                package()
                {
                "FOOTSWITCH",       // Footswitch
                package()
                  {
                    "usb30_sec_gdsc",   // USB 3.0 Core Power domain
                    1,                   //1==Enable
                  },
                },

                // Enable USB 3.0 Sleep Clock
                package() { "CLOCK", package() { "gcc_usb30_sec_sleep_clk", 1}},
                // Mark Suppressible for USB 3.0 Sleep Clock
                package() { "CLOCK", package() { "gcc_usb30_sec_sleep_clk", 9, 8,}},
                // Mark Always On for USB 3.0 Sleep Clock
                package() { "CLOCK", package() { "gcc_usb30_sec_sleep_clk", 9, 12,}},
                //Select external source action for gcc_usb3_sec_phy_pipe_clk, Sourced by QMP Phy PLL
                // package() {"CLOCK", package() {"gcc_usb3_sec_phy_pipe_clk", 6, 0, 0, 0x0}},
                // Enable PHY pipe Clock
                package() { "CLOCK", package() { "gcc_usb3_sec_phy_pipe_clk", 1}},
                // Mark Suppressible for USB PHY pipe Clock
                package() { "CLOCK", package() { "gcc_usb3_sec_phy_pipe_clk", 9, 8,}},
                // Now Enable all the clocks
                //aggre_usb3_sec_axi Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
                package() {"CLOCK", package() {"gcc_aggre_usb3_sec_axi_clk",  8, 200, 9}},
                // gcc_cfg_noc_usb3_sec_axi_clk should be configured to the frequency as master clock
                // @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
                package() {"CLOCK", package() {"gcc_cfg_noc_usb3_sec_axi_clk", 8, 200, 9}},
                // USB 3.0 Master Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
                package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 8, 200, 9}},
                // Phy Aux Clock @ 1.2 Mhz 8 = Set & Enable; 1.2, 7 -> Closest 1.2 Mhz
                package() {"CLOCK", package() {"gcc_usb3_sec_phy_aux_clk", 8, 1200, 7}},
                // Phy Com Aux Clock @ 19.2 Mhz 8 = Set & Enable; 19.2, 7 -> Closest 19.2 Mhz
                package() {"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 8, 19200, 7}},
                // Mark Suppressible for Phy Com Aux Clock
                package() {"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 9, 8,}},

                // Vote for CNOC 100 MHz - 400 MB/s IB-only (AB = 0) 
                // Required for gcc_usb_phy_cfg_ahb2phy_clk
                //BUS Arbiter Request (Type-3)
                package()
                {
                    "BUSARB",
                    package()
                    {
                      3,                          // Req Type
                      "ICBID_MASTER_APPSS_PROC",  // Master
                      "ICBID_SLAVE_USB3_0",       // Slave
                      400000000,                  // IB=400 MBps
                      0                           // AB=0 MBps
                    }
                },
                package()
                {
                    "BUSARB",
                    package()
                    {
                      3,                          // Req Type
                      "ICBID_MASTER_APPSS_PROC",  // Master
                      "ICBID_SLAVE_USB3_1",       // Slave
                      400000000,                  // IB=400 MBps
                      0                           // AB=0 MBps
                    }
                },
                // Enable SS Phy Reference Clock (diff clock) 1 = Enable (Source controlled by RPMH clock/ LNBBCLK)
                package() {"CLOCK", package() {"gcc_usb3_prim_clkref_en", 1}},
                // Enable SS Phy Reference Clock (diff clock) 1 = Enable (Source controlled by RPMH clock/ LNBBCLK)
                package() {"CLOCK", package() {"gcc_usb3_sec_clkref_en", 1}},
              },
              Package()
              {
                "PSTATE", 1, // P1 state - Component OFF
                // Remove Vote for CNOC 100 MHz
                // Required for gcc_usb_phy_cfg_ahb2phy_clk
                // BUS Arbiter Request (Type-3)
                // Vote for 0 freq
                package()
                {
                    "BUSARB",
                    package()
                    {
                        3,                          // Req Type
                        "ICBID_MASTER_APPSS_PROC",  // Master
                        "ICBID_SLAVE_USB3_0",       // Slave
                        0,                          // IB=0 MBps
                        0                           // AB=0 MBps
                    }
                },
                package()
                {
                    "BUSARB",
                    package()
                    {
                        3,                          // Req Type
                        "ICBID_MASTER_APPSS_PROC",  // Master
                        "ICBID_SLAVE_USB3_1",       // Slave
                        0,                          // IB=0 MBps
                        0                           // AB=0 MBps
                    }
                },

                //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
                package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 3, 9600000, 1}},
                // Disable USB 3.0 Master Clock  2 = Disable
                package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 2}},
                // gcc_cfg_noc_usb3_prim_axi_clk should be configured to the frequency as master clock
                package() {"CLOCK", package() {"gcc_cfg_noc_usb3_prim_axi_clk", 2}},
                // Disable aggre_usb3_prim_axi
                package() {"CLOCK", package() {"gcc_aggre_usb3_prim_axi_clk", 2}},
                // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
                package(){"CLOCK", package() {"gcc_usb3_prim_phy_aux_clk", 2 }},
                // Disable SS Phy Reference Clock (diff clock) 2 = Disable
                package() {"CLOCK", package() {"gcc_usb3_prim_clkref_en", 2}},
				// Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
                package(){"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 2 }},
                
                package()
                {
                  "FOOTSWITCH",       // Footswitch
                  package()
                  {
                    "usb30_prim_gdsc",   // USB 3.0 Core Power domain
                    2,                   //2==Disable
                  },
                },

                //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
                package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 3, 9600000, 1}},
                // Disable USB 3.0 Master Clock  2 = Disable
                package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 2}},
                // gcc_cfg_noc_usb3_sec_axi_clk should be configured to the frequency as master clock
                package() {"CLOCK", package() {"gcc_cfg_noc_usb3_sec_axi_clk", 2}},
                // Disable aggre_usb3_sec_axi
                package() {"CLOCK", package() {"gcc_aggre_usb3_sec_axi_clk", 2}},
                // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
                package(){"CLOCK", package() {"gcc_usb3_sec_phy_aux_clk", 2 }},
                // Disable SS Phy Reference Clock (diff clock) 2 = Disable
                package() {"CLOCK", package() {"gcc_usb3_sec_clkref_en", 2}},
                // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
                package(){"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 2 }},

                package()
                {
                    "FOOTSWITCH",       // Footswitch
                    package()
                    {
                        "usb30_sec_gdsc",   // USB 3.0 Core Power domain
                        2,                   //2==Disable
                    },
                },

                //Enable vdd_min:
                package()
                {
                    "NPARESOURCE",
                    Package() {1, "/arc/client/rail_cx", 0}
                },  
            },
          },
          //D states
          package() { 
              "DSTATE", 0x0, // D0 state          
          },
          package() { 
              "DSTATE", 0x1, // D1 state 
          },
          package() { 
              "DSTATE", 0x2, // D2 state 
          },
          package() { 
              "DSTATE", 0x3, // D3 state 
          },  
      },//UCS0

      Package()
      {
        "DEVICE",
        "\\_SB.URS0",
        Package()
        {
          "COMPONENT",
          Zero,
          Package() {"FSTATE", 0},
          Package() {"PSTATE", 0},
          Package() {"PSTATE", 1}
        },
        Package() {"DSTATE", 0 },
        Package() {"DSTATE", 1 },
        Package() {"DSTATE", 2 },
        Package() {"DSTATE", 3 }
      },
  
      
      //USB SS/HS1 core (Host Stack)
      Package()
      {
        "DEVICE",
        "\\_SB.URS0.USB0",
        Package()
        {
          "COMPONENT",
          0x0, // Component 0.
          Package() { "FSTATE", 0x0, },
          package()
          {
            "PSTATE",
            0x0,
          },
          package()
          {
            "PRELOAD_PSTATE",
            0,
          },// index 0 is P-state 0 here
        },
        //D states
        Package()
        { // HOST D0
          "DSTATE",
          0x0,
          //Power Grid for SDM1000
          package()
          {
            // L12 - VDDA_QUSB_HS0_1P8 (QUSB2 PHY)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L12 @1.8v
            {
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage 1.8V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          package()
          {
          // L16E - VDDA_QUSB_HS0_3P1
          "PMICVREGVOTE",                                   // PMIC VREG resource
          package()                                         // Vote for L16 @3.072v
          {
            "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
            1,                                              // Voltage Regulator type 1 = LDO
            3072000,                                        // Voltage = 3.072 V
            1,                                              // SW Enable = Enable
            7,                                              // SW Power Mode = NPM
            0,                                              // Head Room
          },
          },
          package()
          {
            // L3C - VDDA_USB_SS_1P2 (QMP PHY)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // VDDA_USB_SS_CORE & VDDA_QUSB0_HS
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L5 @ 0.88v
            {
              "PPP_RESOURCE_ID_LDO5_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              880000,                                         // Voltage (microvolts)
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },

          // Enable usb30_prim_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_prim_gdsc",   // USB 3.0 Core Power domain
              1,                   //1==Enable
            },
          },
          
          // Enable USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_prim_sleep_clk", 1}},
          // Mark Suppressible for USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_prim_sleep_clk", 9, 8,}},
          // Mark Always On for USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_prim_sleep_clk", 9, 12,}},
          //Select external source action for gcc_usb3_prim_phy_pipe_clk, Sourced by QMP Phy PLL
          // package() {"CLOCK", package() {"gcc_usb3_prim_phy_pipe_clk", 6, 0, 0, 0x0}},
          // Enable PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_prim_phy_pipe_clk", 1}},
          // Mark Suppressible for USB PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_prim_phy_pipe_clk", 9, 8,}},
            
          // Now Enable all the clocks

          //aggre_usb3_prim_axi Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
          package() {"CLOCK", package() {"gcc_aggre_usb3_prim_axi_clk",  8, 200, 9}},

          // gcc_cfg_noc_usb3_prim_axi_clk should be configured to the frequency as master clock
          // @ 120 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_prim_axi_clk", 8, 200, 9}},

          // USB 3.0 Master Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
          package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 8, 200, 9}},

          //enable UTMI clk @19.2 MHz 8 = Set & Enable; 19.2, 7 -> Closest 19.2 Mhz
          package() {"CLOCK", package() {"gcc_usb30_prim_mock_utmi_clk", 8, 19200, 7}},

          // Phy Aux Clock @ 1.2 Mhz 8 = Set & Enable; 1.2, 7 -> Closest 1.2 Mhz
          package() {"CLOCK", package() {"gcc_usb3_prim_phy_aux_clk", 8, 1200, 7}},
          
          // Phy Com Aux Clock @ 19.2 Mhz 8 = Set & Enable; 19.2, 7 -> Closest 19.2 Mhz
          package() {"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 8, 19200, 7}},
          // Mark Suppressible for Phy Com Aux Clock
          package() {"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 9, 8,}},

          //Vote for max freq: BUS Arbiter Request (Type-3)
          // Instantaneous BW BytesPerSec = 671088640;
          // Arbitrated BW BytesPerSec = 671088640 (5  x 1024 X 1024 x 1024)/8
          package()
          {
            "BUSARB",
            Package()
            {
              3,                      // Req Type
              "ICBID_MASTER_USB3_0",  // Master
              "ICBID_SLAVE_EBI1",     // Slave
              671088640,              // IB=5Gbps
              671088640               // AB=5Gbps
            }
          },

          //Nominal==block vdd_min:
          package()
          {
            "NPARESOURCE",
            Package() {1, "/arc/client/rail_cx", 256}
          },

          // Vote for CNOC 100 MHz - 400 MB/s IB-only (AB = 0) 
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          //BUS Arbiter Request (Type-3)
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_0",       // Slave
              400000000,                  // IB=400 MBps
              0                           // AB=0 MBps
            }
          },

         // Enable SS Phy Reference Clock (diff clock) 1 = Enable (Source controlled by RPMH clock/ LNBBCLK)
          package() {"CLOCK", package() {"gcc_usb3_prim_clkref_en", 1}},
        },
        package()
        { // HOST D1
          "DSTATE", // D1 state (Suspend State - HS Suspend + SS disconnect /SS Suspend + HS disconnect/ HS + SS suspend)
          0x1,

          // Enable usb30_prim_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_prim_gdsc",   // USB 3.0 Core Power domain
              1,                   //1==Enable
            },
          },

          //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 3, 9600, 5}},

          // Disable USB 3.0 Master Clock  2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 2}},

          // gcc_cfg_noc_usb3_prim_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_prim_axi_clk", 2}},

          //Disable aggre_usb3_prim_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_prim_axi_clk", 2}},

          // Disable UTMI clk 2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_prim_mock_utmi_clk", 2}},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_0",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
          package() {"CLOCK", package() { "gcc_usb3_prim_phy_aux_clk", 2}},
		  
		  // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package() {"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 2}},

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          package() {"CLOCK", package() {"gcc_usb3_prim_clkref_en", 2}},
      
          //BUS Arbiter Request (Type-3)
          //Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                    // Req Type
              "ICBID_MASTER_USB3_0",// Master
              "ICBID_SLAVE_EBI1",   // Slave
              0,                    // IB=0 Mbps
              0                     // AB=0Mbps
            }
          },

          //enable vdd_min
          package()
          {
            "NPARESOURCE",
            package() { 1, "/arc/client/rail_cx", 0}
          },

          package()
          {
            "PMICVREGVOTE",
            package()                                         //Vote for L12 @1.8v
            {
              // L12 - VDDA_QUSB_HS0_1P8
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage         : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            "PMICVREGVOTE",                                   // PMICVREGVOTE resource
            package()                                         // Vote for L16 @3.072v
            {
              // L16E - VDDA_QUSB_HS0_3P1
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              3072000,                                        // Voltage = 3.072 V
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            // L3C is used for QMP PHY
            // VDDA_USB_SS_1P2 (V_L2A_USB_SS_1P2)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // VDDA_USB_SS_CORE & VDDA_QUSB0_HS
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L5 @ 0.88v
            {
              "PPP_RESOURCE_ID_LDO5_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              880000,                                         // Voltage (microvolts)
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
        },
        package()
        { // HOST D2
          "DSTATE",
          0x2,  // Slave device disconnect (host cable is still connected)

          //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 3, 9600000, 1}},

          // Disable USB 3.0 Master Clock  2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 2}},

          // gcc_cfg_noc_usb3_prim_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_prim_axi_clk", 2}},

          // Disable aggre_usb3_prim_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_prim_axi_clk", 2}},

          // Disable UTMI clk 2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_prim_mock_utmi_clk", 2}},

          // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_prim_phy_aux_clk", 2 }},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 2 }},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_0",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          package() {"CLOCK", package() {"gcc_usb3_prim_clkref_en", 2}},


          // Enable usb30_prim_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_prim_gdsc",   // USB 3.0 Core Power domain
              1,                   //1==Enable
            },
          },

          //Vote for 0 freq
          package()
          {
            "BUSARB",
            Package()
            {
              3,                      // Req Type
              "ICBID_MASTER_USB3_0",  // Master
              "ICBID_SLAVE_EBI1",     // Slave
               0,                     // IB=0 Mbps
               0                      // AB=0Mbps
            }
          },

          //enable vdd_min
          package()
          {
            "NPARESOURCE",
            package() { 1, "/arc/client/rail_cx", 0}
          },

          //Power Grid for SDM1000
          package()
          {
            "PMICVREGVOTE",
            package()                                         //Vote for L12 @1.8v
            {
              // L12 - VDDA_QUSB_HS0_1P8
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage         : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            "PMICVREGVOTE",                                   // PMICVREGVOTE resource
            package()                                         // Vote for L16 @3.072v
            {
              // L16E - VDDA_QUSB_HS0_3P1
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              3072000,                                        // Voltage = 3.072 V
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            // L3C is used for QMP PHY
            // VDDA_USB_SS_1P2 (V_L2A_USB_SS_1P2)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // VDDA_USB_SS_CORE & VDDA_QUSB0_HS
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L5 @ 0.88v
            {
              "PPP_RESOURCE_ID_LDO5_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              880000,                                         // Voltage (microvolts)
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

        },
        package()
        { // HOST D3
          "DSTATE",
          0x3, // Abandon state

          //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 3, 9600000, 1}},

          // Disable USB 3.0 Master Clock  2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 2}},

          // gcc_cfg_noc_usb3_prim_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_prim_axi_clk", 2}},

          // Disable aggre_usb3_prim_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_prim_axi_clk", 2}},

          // Disable UTMI clk 2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_prim_mock_utmi_clk", 2}},

          // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_prim_phy_aux_clk", 2 }},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 2 }},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_0",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          package() {"CLOCK", package() {"gcc_usb3_prim_clkref_en", 2}},

          // Disable usb30_prim_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_prim_gdsc",   // USB 3.0 Core Power domain
              2,                   // 2==Disable
            },
          },

          //Vote for 0 freq
          package()
          {
            "BUSARB",
             package()
             {
               3,                    // Req Type
               "ICBID_MASTER_USB3_0",// Master
               "ICBID_SLAVE_EBI1",   // Slave
               0,                    // IB=0 Mbps
               0                     // AB=0Mbps
             }
           },

          //enable vdd_min
          package() {"NPARESOURCE", package() {1, "/arc/client/rail_cx", 0}},

          //Power Grid for SDM1000
          package()
          {
            "PMICVREGVOTE",                                   // PMICVREGVOTE resource
            package()                                         // Vote for L16 @ 0V - VDDA_QUSB_HS0_3P1
            {
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              0,                                              // Voltage = 0 V
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",
            package()                                         // Vote for L12 @ 0V - VDDA_QUSB_HS0_1P8
            {
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              0,                                              // Voltage         : 0 microvolts ( V )
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @ 0v - VDDA_USB_SS_1P2
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              0,                                              // Voltage 0 V        : microvolts ( V )
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",                                   // PMIC VREG resource - VDDA_USB_SS_CORE & VDDA_QUSB0_HS
            package()                                         // Vote for L5 @ 0 v
            {
              "PPP_RESOURCE_ID_LDO5_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              0,                                              // Voltage (microvolts)
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
        },
        // Define Abandon State for USB0 (host) stack ie. Power State invoked when stack unloads/tears down
        package()
        {
          "ABANDON_DSTATE",
          3                                                   // Abandon D state defined as D3
        },
      },  //End USB0

      //
      //************************* USB3.0 SS/HS0 core (Peripheral Stack) ****************************
      //
      package()
      {
        "DEVICE",
        "\\_SB.URS0.UFN0",
        package()
        {
          "COMPONENT",
          0x0,
          // F-State placeholders
          package()
          {
            "FSTATE",
            0x0,
          },
          package()
          {
            "PSTATE",
            0x0,
          },
          package()
          {
            "PRELOAD_PSTATE",
            0,
          },// index 0 is P-state 0 here
        },

        package()
        { // PERIPH D0
          "DSTATE",
          0x0,
          //Power Grid for SDM1000
          package()
          {
            // L12 - VDDA_QUSB_HS0_1P8
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L12 @1.8v
            {
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage 1.8V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // L16E - VDDA_QUSB_HS0_3P1
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L16 @3.072v
            {
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              3072000,                                        // Voltage = 3.072 V
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // L3C - VDDA_USB_SS_1P2 (QMP PHY)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // VDDA_USB_SS_CORE & VDDA_QUSB0_HS
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L5 @ 0.88v
            {
              "PPP_RESOURCE_ID_LDO5_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              880000,                                         // Voltage (microvolts)
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },

          // Enable usb30_prim_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
              {
                "usb30_prim_gdsc",   // USB 3.0 Core Power domain
                1,                   //1==Enable
              },
          },
          
          // Enable USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_prim_sleep_clk", 1}},
          // Mark Suppressible for USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_prim_sleep_clk", 9, 8,}},
          // Mark Always On for USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_prim_sleep_clk", 9, 12,}},
          //Select external source action for gcc_usb3_prim_phy_pipe_clk, Sourced by QMP Phy PLL
          // package() {"CLOCK", package() {"gcc_usb3_prim_phy_pipe_clk", 6, 0, 0, 0x0}},
          // Enable PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_prim_phy_pipe_clk", 1}},
          // Mark Suppressible for USB PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_prim_phy_pipe_clk", 9, 8,}},

          //aggre_usb3_prim_axi Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz
          package() {"CLOCK", package() {"gcc_aggre_usb3_prim_axi_clk",  8, 200, 9}},

          // gcc_cfg_noc_usb3_prim_axi_clk should be configured to the frequency as master clock
          // @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_prim_axi_clk", 8, 200, 9}},

          // USB 3.0 Master Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz
          package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 8, 200, 9}},

          // Phy Aux Clock @ 1.2 Mhz 8 = Set & Enable; 1.2, 7 -> Closest 1.2 Mhz
          package() {"CLOCK", package() {"gcc_usb3_prim_phy_aux_clk", 8, 1200, 7}},
          
          // Phy Com Aux Clock @ 19.2 Mhz 8 = Set & Enable; 19.2, 7 -> Closest 19.2 Mhz
          package() {"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 8, 19200, 7}},
          // Mark Suppressible for Phy Com Aux Clock
          package() {"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 9, 8,}},

          // Vote for CNOC 100 MHz - 400 MB/s IB-only (AB = 0) 
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          //BUS Arbiter Request (Type-3)
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_0",       // Slave
              400000000,                  // IB=400 MBps
              0                           // AB=0 MBps
            }
          },

          //Vote for max freq: BUS Arbiter Request (Type-3)
          // Instantaneous BW BytesPerSec = 671088640;
          // Arbitrated BW BytesPerSec = 671088640 (5  x 1024 X 1024 x 1024)/8
          package()
          {
            "BUSARB",
            Package()
            {
              3,                      // Req Type
              "ICBID_MASTER_USB3_0",  // Master
              "ICBID_SLAVE_EBI1",     // Slave
              671088640,              // IB=5Gbps
              671088640               // AB=5Gbps
            }
          },

          //Nominal==block vdd_min:
          package()
          {
            "NPARESOURCE",
            Package() {1, "/arc/client/rail_cx", 256}
          },

         // Enable SS Phy Reference Clock (diff clock) 1 = Enable (Source controlled by RPMH clock/ LNBBCLK)
          package() {"CLOCK", package() {"gcc_usb3_prim_clkref_en", 1}},
        },
        package()
        {
          // PERIPH D1: Not supported by USBFN driver
          "DSTATE",     //USB SS+HS suspend state
          0x1,
        },
        package()
        { // PERIPH D2
          "DSTATE",     //USB DCP/HVDCP charger state
          0x2,

          // Set frequency @9.6Mhz before disabling to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          // Set USB 3.0 Master Clock @ 9.6 MHz 3 = Set ; 9600,9 -> Atleast 9.6 Mhz
          package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 3, 9600, 5}},

          // Disable USB 3.0 Master Clock  2 = Disable ;
          package() {"CLOCK", package() { "gcc_usb30_prim_master_clk", 2 } },

          // gcc_cfg_noc_usb3_prim_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_prim_axi_clk", 2}},

          //Disable aggre_usb3_prim_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_prim_axi_clk", 2}},

          //Disable  gcc_usb3_prim_phy_aux_clk
          package() {"CLOCK", package() {"gcc_usb3_prim_phy_aux_clk", 2}},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 2 }},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_0",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          package() {"CLOCK", package() {"gcc_usb3_prim_clkref_en", 2}},


          //BUS Arbiter Request (Type-3)
          //Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                      // Req Type
              "ICBID_MASTER_USB3_0",  // Master
              "ICBID_SLAVE_EBI1",     // Slave
              0,                      // IB=0 MBps
              0                       // AB=0 MBps
            }
          },

          package()
          {
            "PMICVREGVOTE",
            package()                                         //Vote for L12 @1.8v
            {
              // L12 - VDDA_QUSB_HS0_1P8
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage         : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            "PMICVREGVOTE",                                   // PMICVREGVOTE resource
            package()                                         // Vote for L16 @3.072v
            {
              // L16E - VDDA_QUSB_HS0_3P1
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              3072000,                                        // Voltage = 3.072 V
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            // L3C is used for QMP PHY
            // VDDA_USB_SS_1P2 (V_L2A_USB_SS_1P2)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // VDDA_USB_SS_CORE & VDDA_QUSB0_HS
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L5 @ 0.88v
            {
              "PPP_RESOURCE_ID_LDO5_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              880000,                                         // Voltage (microvolts)
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
        },
        package()
        {
          // PERIPH D3
          "DSTATE",
          0x3,                                              // Detach State

          //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 3, 9600000, 1}},

          // Disable USB 3.0 Master Clock  2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 2}},

          // gcc_cfg_noc_usb3_prim_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_prim_axi_clk", 2}},

          //Disable aggre_usb3_prim_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_prim_axi_clk", 2}},

          // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_prim_phy_aux_clk", 2 }},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 2 }},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_0",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // GCC_USB_SS_PHY_LDO_EN is being enabled once in Clock Driver during initilization
          // No option of enabling it through ACPI

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          package() {"CLOCK", package() {"gcc_usb3_prim_clkref_en", 2}},


          // Disable usb30_prim_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
              {
                "usb30_prim_gdsc",   // USB 3.0 Core Power domain
                2,                   // 2==Disable
              },
          },

          //Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                    // Req Type
              "ICBID_MASTER_USB3_0",// Master
              "ICBID_SLAVE_EBI1",   // Slave
              0,                    // IB=0 MBps
              0                     // AB=0 Mbps
            }
          },

          //enable vdd_min
          package()
          {
            "NPARESOURCE",
            package() { 1, "/arc/client/rail_cx", 0}
          },

          package()
          {
            "PMICVREGVOTE",                                   // PMICVREGVOTE resource
            package()                                         // Vote for L16 @ 0V - VDDA_QUSB_HS0_3P1
            {
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              0,                                              // Voltage = 0 V
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",
            package()                                         // Vote for L12 @ 0V - VDDA_QUSB_HS0_1P8
            {
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              0,                                              // Voltage         : 0 microvolts ( V )
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @ 0v - VDDA_USB_SS_1P2
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              0,                                              // Voltage 0 V        : microvolts ( V )
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",                                   // PMIC VREG resource - VDDA_USB_SS_CORE & VDDA_QUSB0_HS
            package()                                         // Vote for L5 @ 0 v
            {
              "PPP_RESOURCE_ID_LDO5_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              0,                                              // Voltage (microvolts)
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
        },
        // Define Abandon State for UFN0 (peripheral) stack ie. Power State invoked when stack unloads/tears down
        package()
        {
          "ABANDON_DSTATE",
          3                                                   // Abandon D state defined as D3
        },
      },    //End UFN0




      //////////////////////////////////////////////////////////////////
      //USB Secondary Core (Host Stack)
      Package()
      {
        "DEVICE",
        "\\_SB.URS1",
        Package()
        {
          "COMPONENT",
          Zero,
          Package() {"FSTATE", 0},
          Package() {"PSTATE", 0},
          Package() {"PSTATE", 1}
        },
        Package() {"DSTATE", 0 },
        Package() {"DSTATE", 1 },
        Package() {"DSTATE", 2 },
        Package() {"DSTATE", 3 }
      },

      Package()
      {
        "DEVICE",
        "\\_SB.URS1.USB1",
        Package()
        {
          "COMPONENT",
          0x0, // Component 0.
          Package() { "FSTATE", 0x0, },
          package()
          {
            "PSTATE",
            0x0,           
          },
          package()
          {
            "PRELOAD_PSTATE",
            0,
          },// index 0 is P-state 0 here
        },
        //D states
        Package()
        { // HOST D0
          "DSTATE",
          0x0,
          //Power Grid for SDM1000
          package()
          {
            // L12 - VDDA_QUSB_HS0_1P8 (QUSB2 PHY)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L12 @1.8v
            {
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage 1.8V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          package()
          {
          // L16E - VDDA_QUSB_HS0_3P1
          "PMICVREGVOTE",                                   // PMIC VREG resource
          package()                                         // Vote for L16 @3.072v
          {
            "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
            1,                                              // Voltage Regulator type 1 = LDO
            3072000,                                        // Voltage = 3.072 V
            1,                                              // SW Enable = Enable
            7,                                              // SW Power Mode = NPM
            0,                                              // Head Room
          },
          },
          package()
          {
            // L3C - VDDA_USB_SS_1P2 (QMP PHY)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // VDDA_USB_SS_CORE & VDDA_QUSB0_HS
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L5 @ 0.88v
            {
              "PPP_RESOURCE_ID_LDO5_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              880000,                                         // Voltage (microvolts)
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },

          // Enable usb30_sec_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_sec_gdsc",   // USB 3.0 Core Power domain
              1,                   //1==Enable
            },
          },

          // Enable USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_sec_sleep_clk", 1}},
          // Mark Suppressible for USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_sec_sleep_clk", 9, 8,}},
          // Mark Always On for USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_sec_sleep_clk", 9, 12,}},
 
          //Select external source action for gcc_usb3_sec_phy_pipe_clk, Sourced by QMP Phy PLL
          // package() {"CLOCK", package() {"gcc_usb3_sec_phy_pipe_clk", 6, 0, 0, 0x0}},
          // Enable PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_sec_phy_pipe_clk", 1}},
          // Mark Suppressible for USB PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_sec_phy_pipe_clk", 9, 8,}},

          // Now Enable all the clocks

          //aggre_usb3_sec_axi Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
          package() {"CLOCK", package() {"gcc_aggre_usb3_sec_axi_clk",  8, 200, 9}},

          // gcc_cfg_noc_usb3_sec_axi_clk should be configured to the frequency as master clock
          // @ 120 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_sec_axi_clk", 8, 200, 9}},

          // USB 3.0 Master Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
          package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 8, 200, 9}},

          //enable UTMI clk @19.2 MHz 8 = Set & Enable; 19.2, 7 -> Closest 19.2 Mhz
          package() {"CLOCK", package() {"gcc_usb30_sec_mock_utmi_clk", 8, 19200, 7}},

          // Phy Aux Clock @ 1.2 Mhz 8 = Set & Enable; 1.2, 7 -> Closest 1.2 Mhz
          package() {"CLOCK", package() {"gcc_usb3_sec_phy_aux_clk", 8, 1200, 7}},

          // Phy Com Aux Clock @ 19.2 Mhz 8 = Set & Enable; 19.2, 7 -> Closest 19.2 Mhz
          package() {"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 8, 19200, 7}},
          // Mark Suppressible for Phy Com Aux Clock
          package() {"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 9, 8,}},

          //Vote for max freq: BUS Arbiter Request (Type-3)
          // Instantaneous BW BytesPerSec = 671088640;
          // Arbitrated BW BytesPerSec = 671088640 (5  x 1024 X 1024 x 1024)/8
          package()
          {
            "BUSARB",
            Package()
            {
              3,                      // Req Type
              "ICBID_MASTER_USB3_1",  // Master
              "ICBID_SLAVE_EBI1",     // Slave
              671088640,              // IB=5Gbps
              671088640               // AB=5Gbps
            }
          },

          //Nominal==block vdd_min:
          package()
          {
            "NPARESOURCE",
            Package() {1, "/arc/client/rail_cx", 256}
          },

          // Vote for CNOC 100 MHz - 400 MB/s IB-only (AB = 0) 
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          //BUS Arbiter Request (Type-3)
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_1",       // Slave
              400000000,                  // IB=400 MBps
              0                           // AB=0 MBps
            }
          },

         // Enable SS Phy Reference Clock (diff clock) 1 = Enable (Source controlled by RPMH clock/ LNBBCLK)
          package() {"CLOCK", package() {"gcc_usb3_sec_clkref_en", 1}},
        },
        package()
        { // HOST D1
          "DSTATE", // D1 state (Suspend State - HS Suspend + SS disconnect /SS Suspend + HS disconnect/ HS + SS suspend)
          0x1,

          // Enable usb30_sec_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_sec_gdsc",   // USB 3.0 Core Power domain
              1,                   //1==Enable
            },
          },

          //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 3, 9600, 5}},

          // Disable USB 3.0 Master Clock  2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 2}},

          // gcc_cfg_noc_usb3_sec_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_sec_axi_clk", 2}},

          //Disable aggre_usb3_sec_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_sec_axi_clk", 2}},

          // Disable UTMI clk 2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_sec_mock_utmi_clk", 2}},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_1",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_sec_phy_aux_clk", 2 }},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 2 }},

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          package() {"CLOCK", package() {"gcc_usb3_sec_clkref_en", 2}},

          //BUS Arbiter Request (Type-3)
          //Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                    // Req Type
              "ICBID_MASTER_USB3_1",// Master
              "ICBID_SLAVE_EBI1",   // Slave
              0,                    // IB=0 Mbps
              0                     // AB=0Mbps
            }
          },

          //enable vdd_min
          package()
          {
            "NPARESOURCE",
            package() { 1, "/arc/client/rail_cx", 0}
          },

          package()
          {
            "PMICVREGVOTE",
            package()                                         //Vote for L12 @1.8v
            {
              // L12 - VDDA_QUSB_HS0_1P8
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage         : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            "PMICVREGVOTE",                                   // PMICVREGVOTE resource
            package()                                         // Vote for L16 @3.072v
            {
              // L16E - VDDA_QUSB_HS0_3P1
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              3072000,                                        // Voltage = 3.072 V
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            // L3C is used for QMP PHY
            // VDDA_USB_SS_1P2 (V_L2A_USB_SS_1P2)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // VDDA_USB_SS_CORE & VDDA_QUSB0_HS
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L5 @ 0.88v
            {
              "PPP_RESOURCE_ID_LDO5_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              880000,                                         // Voltage (microvolts)
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
        },
        package()
        { // HOST D2
          "DSTATE",
          0x2,  // Slave device disconnect (host cable is still connected)

          //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 3, 9600000, 1}},

          // Disable USB 3.0 Master Clock  2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 2}},

          // gcc_cfg_noc_usb3_sec_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_sec_axi_clk", 2}},

          // Disable aggre_usb3_sec_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_sec_axi_clk", 2}},

          // Disable UTMI clk 2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_sec_mock_utmi_clk", 2}},

          // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_sec_phy_aux_clk", 2 }},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 2 }},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_1",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // GCC_USB_SS_PHY_LDO_EN is being enabled once in Clock Driver during  initialization
          // No option of enabling it through ACPI

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          package() {"CLOCK", package() {"gcc_usb3_sec_clkref_en", 2}},


          // Enable usb30_sec_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_sec_gdsc",   // USB 3.0 Core Power domain
              1,                   //1==Enable
            },
          },

          //Vote for 0 freq
          package()
          {
            "BUSARB",
            Package()
            {
              3,                      // Req Type
              "ICBID_MASTER_USB3_1",  // Master
              "ICBID_SLAVE_EBI1",     // Slave
               0,                     // IB=0 Mbps
               0                      // AB=0Mbps
            }
          },

          //enable vdd_min
          package()
          {
            "NPARESOURCE",
            package() { 1, "/arc/client/rail_cx", 0}
          },

          //Power Grid for SDM1000
          package()
          {
            "PMICVREGVOTE",
            package()                                         //Vote for L12 @1.8v
            {
              // L12 - VDDA_QUSB_HS0_1P8
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage         : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            "PMICVREGVOTE",                                   // PMICVREGVOTE resource
            package()                                         // Vote for L16 @3.072v
            {
              // L16E - VDDA_QUSB_HS0_3P1
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              3072000,                                        // Voltage = 3.072 V
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            // L3C is used for QMP PHY
            // VDDA_USB_SS_1P2 (V_L2A_USB_SS_1P2)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // VDDA_USB_SS_CORE & VDDA_QUSB0_HS
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L5 @ 0.88v
            {
              "PPP_RESOURCE_ID_LDO5_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              880000,                                         // Voltage (microvolts)
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
        },
        package()
        { // HOST D3
          "DSTATE",
          0x3, // Abandon state

          //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 3, 9600000, 1}},

          // Disable USB 3.0 Master Clock  2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 2}},

          // gcc_cfg_noc_usb3_sec_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_sec_axi_clk", 2}},

          // Disable aggre_usb3_sec_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_sec_axi_clk", 2}},

          // Disable UTMI clk 2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_sec_mock_utmi_clk", 2}},

          // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_sec_phy_aux_clk", 2 }},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 2 }},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_1",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // GCC_USB_SS_PHY_LDO_EN is being enabled once in Clock Driver during initilization
          // No option of enabling it through ACPI

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          package() {"CLOCK", package() {"gcc_usb3_sec_clkref_en", 2}},


          // Disable usb30_sec_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_sec_gdsc",   // USB 3.0 Core Power domain
              2,                   // 2==Disable
            },
          },

          //Vote for 0 freq
          package()
          {
            "BUSARB",
             package()
             {
               3,                    // Req Type
               "ICBID_MASTER_USB3_1",// Master
               "ICBID_SLAVE_EBI1",   // Slave
               0,                    // IB=0 Mbps
               0                     // AB=0Mbps
             }
           },

          //enable vdd_min
          package() {"NPARESOURCE", package() {1, "/arc/client/rail_cx", 0}},

          //Power Grid for SDM1000
          package()
          {
            "PMICVREGVOTE",                                   // PMICVREGVOTE resource
            package()                                         // Vote for L16 @ 0V - VDDA_QUSB_HS0_3P1
            {
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              0,                                              // Voltage = 0 V
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",
            package()                                         // Vote for L12 @ 0V - VDDA_QUSB_HS0_1P8
            {
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              0,                                              // Voltage         : 0 microvolts ( V )
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @ 0v - VDDA_USB_SS_1P2
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              0,                                              // Voltage 0 V        : microvolts ( V )
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",                                   // PMIC VREG resource - VDDA_USB_SS_CORE & VDDA_QUSB0_HS
            package()                                         // Vote for L5 @ 0 v
            {
              "PPP_RESOURCE_ID_LDO5_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              0,                                              // Voltage (microvolts)
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
        },
        // Define Abandon State for URS1 (host) stack ie. Power State invoked when stack unloads/tears down
        package()
        {
          "ABANDON_DSTATE",
          3                                                   // Abandon D state defined as D3
        },
      },  //End URS1.USB1

//
      //************************* USB3.0 SS/HS 1 core (Peripheral Stack) ****************************
      //
      package()
      {
        "DEVICE",
        "\\_SB.URS1.UFN1",
        package()
        {
          "COMPONENT",
          0x0,
          // F-State placeholders
          package()
          {
            "FSTATE",
            0x0,
          },
          package()
          {
            "PSTATE",
            0x0,
          },
          package()
          {
            "PRELOAD_PSTATE",
            0,
          },// index 0 is P-state 0 here
        },

        package()
        { // PERIPH D0
          "DSTATE",
          0x0,
          //Power Grid for SDM1000
          package()
          {
            // L12 - VDDA_QUSB_HS0_1P8
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L12 @1.8v
            {
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage 1.8V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // L16E - VDDA_QUSB_HS0_3P1
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L16 @3.072v
            {
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              3072000,                                        // Voltage = 3.072 V
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // L3C - VDDA_USB_SS_1P2 (QMP PHY)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          
          // VDDA_QUSB0_HS
          Package()    
          {
             "PMICVREGVOTE",    
             Package()
             {                                    
                "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
                1,                             // Voltage Regulator type = LDO
                880000,                        // Voltage is in micro volts
                1,                             // force enable from software
                7,                             // power mode - Normal Power Mode
                0,                             // head room voltage
            },
          },

          // Enable usb30_sec_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
              {
                "usb30_sec_gdsc",   // USB 3.0 Core Power domain
                1,                   //1==Enable
              },
          },
          
          // Enable USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_sec_sleep_clk", 1}},
          // Mark Suppressible for USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_sec_sleep_clk", 9, 8,}},
          // Mark Always On for USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_sec_sleep_clk", 9, 12,}},
          //Select external source action for gcc_usb3_sec_phy_pipe_clk, Sourced by QMP Phy PLL
          // package() {"CLOCK", package() {"gcc_usb3_sec_phy_pipe_clk", 6, 0, 0, 0x0}},
          // Enable PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_sec_phy_pipe_clk", 1}},
          // Mark Suppressible for USB PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_sec_phy_pipe_clk", 9, 8,}},

          //aggre_usb3_sec_axi Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz
          package() {"CLOCK", package() {"gcc_aggre_usb3_sec_axi_clk",  8, 200, 9}},

          // gcc_cfg_noc_usb3_sec_axi_clk should be configured to the frequency as master clock
          // @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_sec_axi_clk", 8, 200, 9}},

          // USB 3.0 Master Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz
          package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 8, 200, 9}},

          // Phy Aux Clock @ 1.2 Mhz 8 = Set & Enable; 1.2, 7 -> Closest 1.2 Mhz
          package() {"CLOCK", package() {"gcc_usb3_sec_phy_aux_clk", 8, 1200, 7}},
          
          // Phy Com Aux Clock @ 19.2 Mhz 8 = Set & Enable; 19.2, 7 -> Closest 19.2 Mhz
          package() {"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 8, 19200, 7}},
          // Mark Suppressible for Phy Com Aux Clock
          package() {"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 9, 8,}},

          // Vote for CNOC 100 MHz - 400 MB/s IB-only (AB = 0) 
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          //BUS Arbiter Request (Type-3)
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_1",       // Slave
              400000000,                  // IB=400 MBps
              0                           // AB=0 MBps
            }
          },

          //Vote for max freq: BUS Arbiter Request (Type-3)
          // Instantaneous BW BytesPerSec = 671088640;
          // Arbitrated BW BytesPerSec = 671088640 (5  x 1024 X 1024 x 1024)/8
          package()
          {
            "BUSARB",
            Package()
            {
              3,                      // Req Type
              "ICBID_MASTER_USB3_1",  // Master
              "ICBID_SLAVE_EBI1",     // Slave
              671088640,              // IB=5Gbps
              671088640               // AB=5Gbps
            }
          },

          //Nominal==block vdd_min:
          package()
          {
            "NPARESOURCE",
            Package() {1, "/arc/client/rail_cx", 256}
          },

         // Enable SS Phy Reference Clock (diff clock) 1 = Enable (Source controlled by RPMH clock/ LNBBCLK)
          package() {"CLOCK", package() {"gcc_usb3_sec_clkref_en", 1}},
        },
        package()
        {
          // PERIPH D1: Not supported by USBFN driver
          "DSTATE",     //USB SS+HS suspend state
          0x1,
        },
        package()
        { // PERIPH D2
          "DSTATE",     //USB DCP/HVDCP charger state
          0x2,

          // Set frequency @9.6Mhz before disabling to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          // Set USB 3.0 Master Clock @ 9.6 MHz 3 = Set ; 9600,9 -> Atleast 9.6 Mhz
          package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 3, 9600, 5}},

          // Disable USB 3.0 Master Clock  2 = Disable ;
          package() {"CLOCK", package() { "gcc_usb30_sec_master_clk", 2 } },

          // gcc_cfg_noc_usb3_sec_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_sec_axi_clk", 2}},

          //Disable aggre_usb3_sec_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_sec_axi_clk", 2}},

          //Disable  gcc_usb3_sec_phy_aux_clk
          package() {"CLOCK", package() {"gcc_usb3_sec_phy_aux_clk", 2}},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package() {"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 2}},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_1",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          package() {"CLOCK", package() {"gcc_usb3_sec_clkref_en", 2}},


          //BUS Arbiter Request (Type-3)
          //Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                      // Req Type
              "ICBID_MASTER_USB3_1",  // Master
              "ICBID_SLAVE_EBI1",     // Slave
              0,                      // IB=0 MBps
              0                       // AB=0 MBps
            }
          },

          package()
          {
            "PMICVREGVOTE",
            package()                                         //Vote for L12 @1.8v
            {
              // L12 - VDDA_QUSB_HS0_1P8
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage         : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            "PMICVREGVOTE",                                   // PMICVREGVOTE resource
            package()                                         // Vote for L16 @3.072v
            {
              // L16E - VDDA_QUSB_HS0_3P1
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              3072000,                                        // Voltage = 3.072 V
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            // L3C is used for QMP PHY
            // VDDA_USB_SS_1P2 (V_L2A_USB_SS_1P2)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          
          // VDDA_QUSB0_HS
          Package()    
          {
             "PMICVREGVOTE",    
             Package()
             {                                    
                "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
                1,                             // Voltage Regulator type = LDO
                880000,                        // Voltage is in micro volts
                1,                             // force enable from software
                4,                             // power mode - Normal Power Mode
                0,                             // head room voltage
             },
          },
        },
        package()
        {
          // PERIPH D3
          "DSTATE",
          0x3,                                              // Detach State

          //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 3, 9600000, 1}},

          // Disable USB 3.0 Master Clock  2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 2}},

          // gcc_cfg_noc_usb3_sec_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_sec_axi_clk", 2}},

          //Disable aggre_usb3_sec_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_sec_axi_clk", 2}},

          // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_sec_phy_aux_clk", 2 }},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package() {"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 2}},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_1",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // GCC_USB_SS_PHY_LDO_EN is being enabled once in Clock Driver during initilization
          // No option of enabling it through ACPI

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          package() {"CLOCK", package() {"gcc_usb3_sec_clkref_en", 2}},


          // Disable usb30_sec_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
              {
                "usb30_sec_gdsc",   // USB 3.0 Core Power domain
                2,                   // 2==Disable
              },
          },

          //Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                    // Req Type
              "ICBID_MASTER_USB3_1",// Master
              "ICBID_SLAVE_EBI1",   // Slave
              0,                    // IB=0 MBps
              0                     // AB=0 Mbps
            }
          },

          //enable vdd_min
          package()
          {
            "NPARESOURCE",
            package() { 1, "/arc/client/rail_cx", 0}
          },

          package()
          {
            "PMICVREGVOTE",                       // PMICVREGVOTE resource
            package()                                         // Vote for L16 @ 0V - VDDA_QUSB_HS0_3P1
            {
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                  // Voltage Regulator type 1 = LDO
              0,                                  // Voltage = 0 V
              0,                                  // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                  // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",
            package()                                         // Vote for L12 @ 0V - VDDA_QUSB_HS0_1P8
            {
              "PPP_RESOURCE_ID_LDO12_A",          // Voltage Regulator ID
              1,                                  // Voltage Regulator type = LDO
              0,                                  // Voltage         : 0 microvolts ( V )
              0,                                  // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                  // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",                       // PMIC VREG resource
            package()                                         // Vote for L3 @ 0v - VDDA_USB_SS_1P2
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                  // Voltage Regulator type = LDO
              0,                                              // Voltage 0 V        : microvolts ( V )
              0,                                  // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                  // Head Room
            },
          },
          // VDDA_QUSB0_HS
          Package()    
          {
             "PMICVREGVOTE",    
             Package()
             {                                    
                "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
                1,                             // Voltage Regulator type = LDO
                0,                             // Voltage is in micro volts
                0,                             // force enable from software
                4,                             // power mode - Normal Power Mode
                0,                             // head room voltage
             },
          },
        },
        // Define Abandon State for UFN1 (peripheral) stack ie. Power State invoked when stack unloads/tears down
        package()
        {
          "ABANDON_DSTATE",
          3                                                   // Abandon D state defined as D3
        },
      },    //End UFN1
      
      // Empty Test Device
      /*Package()
      {
        "DEVICE",
        "\\_SB.USB2",
        Package()
        {
          "COMPONENT",
          Zero,
          Package() {"FSTATE", 0},
          Package() {"PSTATE", 0},
          Package() {"PSTATE", 1}
        },
        Package() {"DSTATE", 0 },
        Package() {"DSTATE", 1 },
        Package() {"DSTATE", 2 },
        Package() {"DSTATE", 3 }
      },
      */
  
      //USB Multiport core (Host Stack)
      Package()
      {
        "DEVICE",
        "\\_SB.USB2",
        Package()
        {
          "COMPONENT",
          0x0, // Component 0.
          Package() { "FSTATE", 0x0, },
          package()
          {
            "PSTATE",
            0x0,
          },
          package()
          {
            "PRELOAD_PSTATE",
            0,
          },// index 0 is P-state 0 here
        },
        //D states
        Package()
        { // HOST D0
          "DSTATE",
          0x0,
          //Power Grid for SDM1000
          package()
          {
            // L12 - VDDA_QUSB_HS0_1P8 (QUSB2 PHY)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L12 @1.8v
            {
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage 1.8V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          package()
          {
          // L16E - VDDA_QUSB_HS0_3P1
          "PMICVREGVOTE",                                   // PMIC VREG resource
          package()                                         // Vote for L16 @3.072v
          {
            "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
            1,                                              // Voltage Regulator type 1 = LDO
            3072000,                                        // Voltage = 3.072 V
            1,                                              // SW Enable = Enable
            7,                                              // SW Power Mode = NPM
            0,                                              // Head Room
          },
          },
          package()
          {
            // L3C - VDDA_USB_SS_1P2 (QMP PHY)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // VDDA_USB_SS_CORE & VDDA_QUSB0_HS
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L5 @ 0.88v
            {
              "PPP_RESOURCE_ID_LDO5_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              880000,                                         // Voltage (microvolts)
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },

          // Enable usb30_mp_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_mp_gdsc",   // USB 3.0 Core Power domain
              1,                   //1==Enable
            },
          },
          
          // Enable USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_mp_sleep_clk", 1}},
          // Mark Suppressible for USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_mp_sleep_clk", 9, 8,}},
          // Mark Always On for USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_mp_sleep_clk", 9, 12,}},
          //Select external source action for gcc_usb3_mp_phy_pipe_0_clk, Sourced by QMP Phy PLL
          //package() {"CLOCK", package() {"gcc_usb3_mp_phy_pipe_0_clk", 6, 0, 0, 0x0}},
          // Enable MP0 PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_mp_phy_pipe_0_clk", 1}},
          // Mark Suppressible for USB MP0 PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_mp_phy_pipe_0_clk", 9, 8,}},
          // Enable MP1 PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_mp_phy_pipe_1_clk", 1}},
          // Mark Suppressible for USB MP1 PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_mp_phy_pipe_1_clk", 9, 8,}},
            
          // Now Enable all the clocks

          //aggre_usb3_mp_axi Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz
          package() {"CLOCK", package() {"gcc_aggre_usb3_mp_axi_clk",  8, 200, 9}},

          // gcc_cfg_noc_usb3_mp_axi_clk should be configured to the frequency as master clock
          // @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_mp_axi_clk", 8, 200, 9}},

          // USB 3.0 Master Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz
          package() {"CLOCK", package() {"gcc_usb30_mp_master_clk", 8, 200, 9}},

          //enable UTMI clk @19.2 MHz 8 = Set & Enable; 19.2, 7 -> Closest 19.2 Mhz
          package() {"CLOCK", package() {"gcc_usb30_mp_mock_utmi_clk", 8, 19200, 7}},

          // Phy Aux Clock @ 1.2 Mhz 8 = Set & Enable; 1.2, 7 -> Closest 1.2 Mhz
          package() {"CLOCK", package() {"gcc_usb3_mp_phy_aux_clk", 8, 1200, 7}},
          
          // Phy Com Aux Clock @ 19.2 Mhz 8 = Set & Enable; 19.2, 7 -> Closest 19.2 Mhz
          package() {"CLOCK", package() {"gcc_usb3_mp_phy_com_aux_clk", 8, 19200, 7}},
          // Mark Suppressible for Phy Com Aux Clock
          package() {"CLOCK", package() {"gcc_usb3_mp_phy_com_aux_clk", 9, 8,}},

          //Vote for max freq: BUS Arbiter Request (Type-3)
          // Instantaneous BW BytesPerSec = 671088640;
          // Arbitrated BW BytesPerSec = 671088640 (5  x 1024 X 1024 x 1024)/8
          package()
          {
            "BUSARB",
            Package()
            {
              3,                      // Req Type
              "ICBID_MASTER_USB3_2",  // Master
              "ICBID_SLAVE_EBI1",     // Slave
              671088640,              // IB=5Gbps
              671088640               // AB=5Gbps
            }
          },

          //Nominal==block vdd_min:
          package()
          {
            "NPARESOURCE",
            Package() {1, "/arc/client/rail_cx", 256}
          },

          // Vote for CNOC 100 MHz - 400 MB/s IB-only (AB = 0) 
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          //BUS Arbiter Request (Type-3)
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_2",       // Slave
              400000000,                  // IB=400 MBps
              0                           // AB=0 MBps
            }
          },

         // Enable SS Phy Reference Clock (diff clock) 1 = Enable (Source controlled by RPMH clock/ LNBBCLK)
          //package() {"CLOCK", package() {"gcc_usb3_mp_clkref_en", 1}},
        },
        package()
        { // HOST D1
          "DSTATE", // D1 state (Suspend State - HS Suspend + SS disconnect /SS Suspend + HS disconnect/ HS + SS suspend)
          0x1,

          // Enable usb30_mp_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_mp_gdsc",   // USB 3.0 Core Power domain
              1,                   //1==Enable
            },
          },

          //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          package() {"CLOCK", package() {"gcc_usb30_mp_master_clk", 3, 9600, 5}},

          // Disable USB 3.0 Master Clock  2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_mp_master_clk", 2}},

          // gcc_cfg_noc_usb3_mp_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_mp_axi_clk", 2}},

          //Disable aggre_usb3_mp_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_mp_axi_clk", 2}},

          // Disable UTMI clk 2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_mp_mock_utmi_clk", 2}},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_2",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
          package() {"CLOCK", package() { "gcc_usb3_mp_phy_aux_clk", 2}},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_mp_phy_com_aux_clk", 2 }},

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          //package() {"CLOCK", package() {"gcc_usb3_mp_clkref_en", 2}},
      
          //BUS Arbiter Request (Type-3)
          //Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                    // Req Type
              "ICBID_MASTER_USB3_2",// Master
              "ICBID_SLAVE_EBI1",   // Slave
              0,                    // IB=0 Mbps
              0                     // AB=0Mbps
            }
          },

          //enable vdd_min
          package()
          {
            "NPARESOURCE",
            package() { 1, "/arc/client/rail_cx", 0}
          },

          package()
          {
            "PMICVREGVOTE",
            package()                                         //Vote for L12 @1.8v
            {
              // L12 - VDDA_QUSB_HS0_1P8
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage         : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            "PMICVREGVOTE",                                   // PMICVREGVOTE resource
            package()                                         // Vote for L16 @3.072v
            {
              // L16E - VDDA_QUSB_HS0_3P1
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              3072000,                                        // Voltage = 3.072 V
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            // L3C is used for QMP PHY
            // VDDA_USB_SS_1P2 (V_L2A_USB_SS_1P2)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // VDDA_USB_SS_CORE & VDDA_QUSB0_HS
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L5 @ 0.88v
            {
              "PPP_RESOURCE_ID_LDO5_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              880000,                                         // Voltage (microvolts)
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
        },
        package()
        { // HOST D2
          "DSTATE",
          0x2,  // Slave device disconnect (host cable is still connected)

          //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          package() {"CLOCK", package() {"gcc_usb30_mp_master_clk", 3, 9600000, 1}},

          // Disable USB 3.0 Master Clock  2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_mp_master_clk", 2}},

          // gcc_cfg_noc_usb3_mp_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_mp_axi_clk", 2}},

          // Disable aggre_usb3_mp_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_mp_axi_clk", 2}},

          // Disable UTMI clk 2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_mp_mock_utmi_clk", 2}},

          // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_mp_phy_aux_clk", 2 }},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_mp_phy_com_aux_clk", 2 }},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_2",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          //package() {"CLOCK", package() {"gcc_usb3_mp_clkref_en", 2}},


          // Enable usb30_mp_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_mp_gdsc",   // USB 3.0 Core Power domain
              1,                   //1==Enable
            },
          },

          //Vote for 0 freq
          package()
          {
            "BUSARB",
            Package()
            {
              3,                      // Req Type
              "ICBID_MASTER_USB3_2",  // Master
              "ICBID_SLAVE_EBI1",     // Slave
               0,                     // IB=0 Mbps
               0                      // AB=0Mbps
            }
          },

          //enable vdd_min
          package()
          {
            "NPARESOURCE",
            package() { 1, "/arc/client/rail_cx", 0}
          },

          //Power Grid for SDM1000
          package()
          {
            "PMICVREGVOTE",
            package()                                         //Vote for L12 @1.8v
            {
              // L12 - VDDA_QUSB_HS0_1P8
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage         : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            "PMICVREGVOTE",                                   // PMICVREGVOTE resource
            package()                                         // Vote for L16 @3.072v
            {
              // L16E - VDDA_QUSB_HS0_3P1
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              3072000,                                        // Voltage = 3.072 V
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            // L3C is used for QMP PHY
            // VDDA_USB_SS_1P2 (V_L2A_USB_SS_1P2)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // VDDA_USB_SS_CORE & VDDA_QUSB0_HS
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L5 @ 0.88v
            {
              "PPP_RESOURCE_ID_LDO5_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              880000,                                         // Voltage (microvolts)
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
        },
        package()
        { // HOST D3
          "DSTATE",
          0x3, // Abandon state

          //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          package() {"CLOCK", package() {"gcc_usb30_mp_master_clk", 3, 9600000, 1}},

          // Disable USB 3.0 Master Clock  2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_mp_master_clk", 2}},

          // gcc_cfg_noc_usb3_mp_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_mp_axi_clk", 2}},

          // Disable aggre_usb3_mp_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_mp_axi_clk", 2}},

          // Disable UTMI clk 2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_mp_mock_utmi_clk", 2}},

          // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_mp_phy_aux_clk", 2 }},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_mp_phy_com_aux_clk", 2 }},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_2",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          //package() {"CLOCK", package() {"gcc_usb3_mp_clkref_en", 2}},

          // Disable usb30_mp_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_mp_gdsc",   // USB 3.0 Core Power domain
              2,                   // 2==Disable
            },
          },

          //Vote for 0 freq
          package()
          {
            "BUSARB",
             package()
             {
               3,                    // Req Type
               "ICBID_MASTER_USB3_2",// Master
               "ICBID_SLAVE_EBI1",   // Slave
               0,                    // IB=0 Mbps
               0                     // AB=0Mbps
             }
           },

          //enable vdd_min
          package() {"NPARESOURCE", package() {1, "/arc/client/rail_cx", 0}},

          //Power Grid for SDM1000
          package()
          {
            "PMICVREGVOTE",                                   // PMICVREGVOTE resource
            package()                                         // Vote for L16 @ 0V - VDDA_QUSB_HS0_3P1
            {
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              0,                                              // Voltage = 0 V
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",
            package()                                         // Vote for L12 @ 0V - VDDA_QUSB_HS0_1P8
            {
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              0,                                              // Voltage         : 0 microvolts ( V )
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @ 0v - VDDA_USB_SS_1P2
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              0,                                              // Voltage 0 V        : microvolts ( V )
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",                                   // PMIC VREG resource - VDDA_USB_SS_CORE & VDDA_QUSB0_HS
            package()                                         // Vote for L5 @ 0 v
            {
              "PPP_RESOURCE_ID_LDO5_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              0,                                              // Voltage (microvolts)
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
        },
        // Define Abandon State for MP0 (host) stack ie. Power State invoked when stack unloads/tears down
        package()
        {
          "ABANDON_DSTATE",
          3                                                   // Abandon D state defined as D3
        },
      },  //End USB2

    })
    
    // Added LPCD method similar to LPCC except it uses L9E in place of L5E.
    // ACPI needs to vote for differently resource in case of MTP V2 and CLS with board revision >= 4
    Name(LPCD,
    package ()
    {
       //UCSI Type-C resources
       Package()
       {
          "DEVICE",
          "\\_SB.UCS0",
          Package()
          {
              "COMPONENT",0, //Component 0: USB HS Rails for Charger Detection
              Package(){"FSTATE", 0 }, //Dummy F-State, required for P-State operation        
              Package()
              {
                  "PSTATE", 0, // P0 state - Component ON     
                  //Nominal==block vdd_min:
                  package()
                  {
                      "NPARESOURCE",
                      Package() {1, "/arc/client/rail_cx", 256}
                  },           

                // Enable usb30_prim_gdsc power domain
                package()
                {
                    "FOOTSWITCH",       // Footswitch
                    package()
                    {
                        "usb30_prim_gdsc",   // USB 3.0 Core Power domain
                        1,                   //1==Enable
                    },
                },

                // Enable USB 3.0 Sleep Clock
                package() { "CLOCK", package() { "gcc_usb30_prim_sleep_clk", 1}},
                // Mark Suppressible for USB 3.0 Sleep Clock
                package() { "CLOCK", package() { "gcc_usb30_prim_sleep_clk", 9, 8,}},
                // Mark Always On for USB 3.0 Sleep Clock
                package() { "CLOCK", package() { "gcc_usb30_prim_sleep_clk", 9, 12,}},
                //Select external source action for gcc_usb3_prim_phy_pipe_clk, Sourced by QMP Phy PLL
                // package() {"CLOCK", package() {"gcc_usb3_prim_phy_pipe_clk", 6, 0, 0, 0x0}},
                // Enable PHY pipe Clock
                package() { "CLOCK", package() { "gcc_usb3_prim_phy_pipe_clk", 1}},
                // Mark Suppressible for USB PHY pipe Clock
                package() { "CLOCK", package() { "gcc_usb3_prim_phy_pipe_clk", 9, 8,}},
                // Now Enable all the clocks
                //aggre_usb3_prim_axi Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
                package() {"CLOCK", package() {"gcc_aggre_usb3_prim_axi_clk",  8, 200, 9}},
                // gcc_cfg_noc_usb3_prim_axi_clk should be configured to the frequency as master clock
                // @ 120 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
                package() {"CLOCK", package() {"gcc_cfg_noc_usb3_prim_axi_clk", 8, 200, 9}},
                // USB 3.0 Master Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
                package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 8, 200, 9}},
                // Phy Aux Clock @ 1.2 Mhz 8 = Set & Enable; 1.2, 7 -> Closest 1.2 Mhz
                package() {"CLOCK", package() {"gcc_usb3_prim_phy_aux_clk", 8, 1200, 7}},
                // Phy Com Aux Clock @ 19.2 Mhz 8 = Set & Enable; 19.2, 7 -> Closest 19.2 Mhz
                package() {"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 8, 19200, 7}},
                // Mark Suppressible for Phy Com Aux Clock
                package() {"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 9, 8,}},

                // Enable usb30_sec_gdsc power domain
                package()
                {
                "FOOTSWITCH",       // Footswitch
                package()
                  {
                    "usb30_sec_gdsc",   // USB 3.0 Core Power domain
                    1,                   //1==Enable
                  },
                },

                // Enable USB 3.0 Sleep Clock
                package() { "CLOCK", package() { "gcc_usb30_sec_sleep_clk", 1}},
                // Mark Suppressible for USB 3.0 Sleep Clock
                package() { "CLOCK", package() { "gcc_usb30_sec_sleep_clk", 9, 8,}},
                // Mark Always On for USB 3.0 Sleep Clock
                package() { "CLOCK", package() { "gcc_usb30_sec_sleep_clk", 9, 12,}},
                //Select external source action for gcc_usb3_sec_phy_pipe_clk, Sourced by QMP Phy PLL
                // package() {"CLOCK", package() {"gcc_usb3_sec_phy_pipe_clk", 6, 0, 0, 0x0}},
                // Enable PHY pipe Clock
                package() { "CLOCK", package() { "gcc_usb3_sec_phy_pipe_clk", 1}},
                // Mark Suppressible for USB PHY pipe Clock
                package() { "CLOCK", package() { "gcc_usb3_sec_phy_pipe_clk", 9, 8,}},
                // Now Enable all the clocks
                //aggre_usb3_sec_axi Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
                package() {"CLOCK", package() {"gcc_aggre_usb3_sec_axi_clk",  8, 200, 9}},
                // gcc_cfg_noc_usb3_sec_axi_clk should be configured to the frequency as master clock
                // @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
                package() {"CLOCK", package() {"gcc_cfg_noc_usb3_sec_axi_clk", 8, 200, 9}},
                // USB 3.0 Master Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
                package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 8, 200, 9}},
                // Phy Aux Clock @ 1.2 Mhz 8 = Set & Enable; 1.2, 7 -> Closest 1.2 Mhz
                package() {"CLOCK", package() {"gcc_usb3_sec_phy_aux_clk", 8, 1200, 7}},
                // Phy Com Aux Clock @ 19.2 Mhz 8 = Set & Enable; 19.2, 7 -> Closest 19.2 Mhz
                package() {"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 8, 19200, 7}},
                // Mark Suppressible for Phy Com Aux Clock
                package() {"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 9, 8,}},

                // Vote for CNOC 100 MHz - 400 MB/s IB-only (AB = 0) 
                // Required for gcc_usb_phy_cfg_ahb2phy_clk
                //BUS Arbiter Request (Type-3)
                package()
                {
                    "BUSARB",
                    package()
                    {
                      3,                          // Req Type
                      "ICBID_MASTER_APPSS_PROC",  // Master
                      "ICBID_SLAVE_USB3_0",       // Slave
                      400000000,                  // IB=400 MBps
                      0                           // AB=0 MBps
                    }
                },
                package()
                {
                    "BUSARB",
                    package()
                    {
                      3,                          // Req Type
                      "ICBID_MASTER_APPSS_PROC",  // Master
                      "ICBID_SLAVE_USB3_1",       // Slave
                      400000000,                  // IB=400 MBps
                      0                           // AB=0 MBps
                    }
                },
                // Enable SS Phy Reference Clock (diff clock) 1 = Enable (Source controlled by RPMH clock/ LNBBCLK)
                package() {"CLOCK", package() {"gcc_usb3_prim_clkref_en", 1}},
                // Enable SS Phy Reference Clock (diff clock) 1 = Enable (Source controlled by RPMH clock/ LNBBCLK)
                package() {"CLOCK", package() {"gcc_usb3_sec_clkref_en", 1}},
              },
              Package()
              {
                "PSTATE", 1, // P1 state - Component OFF
                // Remove Vote for CNOC 100 MHz
                // Required for gcc_usb_phy_cfg_ahb2phy_clk
                // BUS Arbiter Request (Type-3)
                // Vote for 0 freq
                package()
                {
                    "BUSARB",
                    package()
                    {
                        3,                          // Req Type
                        "ICBID_MASTER_APPSS_PROC",  // Master
                        "ICBID_SLAVE_USB3_0",       // Slave
                        0,                          // IB=0 MBps
                        0                           // AB=0 MBps
                    }
                },
                package()
                {
                    "BUSARB",
                    package()
                    {
                        3,                          // Req Type
                        "ICBID_MASTER_APPSS_PROC",  // Master
                        "ICBID_SLAVE_USB3_1",       // Slave
                        0,                          // IB=0 MBps
                        0                           // AB=0 MBps
                    }
                },

                //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
                package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 3, 9600000, 1}},
                // Disable USB 3.0 Master Clock  2 = Disable
                package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 2}},
                // gcc_cfg_noc_usb3_prim_axi_clk should be configured to the frequency as master clock
                package() {"CLOCK", package() {"gcc_cfg_noc_usb3_prim_axi_clk", 2}},
                // Disable aggre_usb3_prim_axi
                package() {"CLOCK", package() {"gcc_aggre_usb3_prim_axi_clk", 2}},
                // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
                package(){"CLOCK", package() {"gcc_usb3_prim_phy_aux_clk", 2 }},
                // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
                package(){"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 2 }},
                // Disable SS Phy Reference Clock (diff clock) 2 = Disable
                package() {"CLOCK", package() {"gcc_usb3_prim_clkref_en", 2}},
                
                package()
                {
                  "FOOTSWITCH",       // Footswitch
                  package()
                  {
                    "usb30_prim_gdsc",   // USB 3.0 Core Power domain
                    2,                   //2==Disable
                  },
                },

                //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
                package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 3, 9600000, 1}},
                // Disable USB 3.0 Master Clock  2 = Disable
                package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 2}},
                // gcc_cfg_noc_usb3_sec_axi_clk should be configured to the frequency as master clock
                package() {"CLOCK", package() {"gcc_cfg_noc_usb3_sec_axi_clk", 2}},
                // Disable aggre_usb3_sec_axi
                package() {"CLOCK", package() {"gcc_aggre_usb3_sec_axi_clk", 2}},
                // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
                package(){"CLOCK", package() {"gcc_usb3_sec_phy_aux_clk", 2 }},
                // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
                package(){"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 2 }},
                // Disable SS Phy Reference Clock (diff clock) 2 = Disable
                package() {"CLOCK", package() {"gcc_usb3_sec_clkref_en", 2}},

                package()
                {
                    "FOOTSWITCH",       // Footswitch
                    package()
                    {
                        "usb30_sec_gdsc",   // USB 3.0 Core Power domain
                        2,                   //2==Disable
                    },
                },

                //Enable vdd_min:
                package()
                {
                    "NPARESOURCE",
                    Package() {1, "/arc/client/rail_cx", 0}
                },  
            },
          },
          //D states
          package() { 
              "DSTATE", 0x0, // D0 state          
          },
          package() { 
              "DSTATE", 0x1, // D1 state 
          },
          package() { 
              "DSTATE", 0x2, // D2 state 
          },
          package() { 
              "DSTATE", 0x3, // D3 state 
          },  
      }, //UCS0

      Package()
      {
        "DEVICE",
        "\\_SB.URS0",
        Package()
        {
          "COMPONENT",
          Zero,
          Package() {"FSTATE", 0},
          Package() {"PSTATE", 0},
          Package() {"PSTATE", 1}
        },
        Package() {"DSTATE", 0 },
        Package() {"DSTATE", 1 },
        Package() {"DSTATE", 2 },
        Package() {"DSTATE", 3 }
      },
  
      
      //USB SS/HS1 core (Host Stack)
      Package()
      {
        "DEVICE",
        "\\_SB.URS0.USB0",
        Package()
        {
          "COMPONENT",
          0x0, // Component 0.
          Package() { "FSTATE", 0x0, },
          package()
          {
            "PSTATE",
            0x0,
          },
          package()
          {
            "PRELOAD_PSTATE",
            0,
          },// index 0 is P-state 0 here
        },
        //D states
        Package()
        { // HOST D0
          "DSTATE",
          0x0,
          //Power Grid for SDM1000
          package()
          {
            // L12 - VDDA_QUSB_HS0_1P8 (QUSB2 PHY)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L12 @1.8v
            {
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage 1.8V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          package()
          {
          // L16E - VDDA_QUSB_HS0_3P1
          "PMICVREGVOTE",                                   // PMIC VREG resource
          package()                                         // Vote for L16 @3.072v
          {
            "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
            1,                                              // Voltage Regulator type 1 = LDO
            3072000,                                        // Voltage = 3.072 V
            1,                                              // SW Enable = Enable
            7,                                              // SW Power Mode = NPM
            0,                                              // Head Room
          },
          },
          package()
          {
            // L3C - VDDA_USB_SS_1P2 (QMP PHY)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // VDDA_USB_SS_CORE
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L9 @ 0.912v
            {
              "PPP_RESOURCE_ID_LDO9_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              912000,                                         // Voltage (microvolts)
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },

         // VDDA_QUSB0_HS
         Package()    
         {
           "PMICVREGVOTE",    
           Package()
           {                                    
              "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
              1,                             // Voltage Regulator type = LDO
              880000,                        // Voltage is in micro volts
              1,                             // force enable from software
              7,                             // power mode - Normal Power Mode
              0,                             // head room voltage
          },
        },
                
          // Enable usb30_prim_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_prim_gdsc",   // USB 3.0 Core Power domain
              1,                   //1==Enable
            },
          },
          
          // Enable USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_prim_sleep_clk", 1}},
          // Mark Suppressible for USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_prim_sleep_clk", 9, 8,}},
          // Mark Always On for USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_prim_sleep_clk", 9, 12,}},
          //Select external source action for gcc_usb3_prim_phy_pipe_clk, Sourced by QMP Phy PLL
          // package() {"CLOCK", package() {"gcc_usb3_prim_phy_pipe_clk", 6, 0, 0, 0x0}},
          // Enable PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_prim_phy_pipe_clk", 1}},
          // Mark Suppressible for USB PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_prim_phy_pipe_clk", 9, 8,}},
            
          // Now Enable all the clocks

          //aggre_usb3_prim_axi Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
          package() {"CLOCK", package() {"gcc_aggre_usb3_prim_axi_clk",  8, 200, 9}},

          // gcc_cfg_noc_usb3_prim_axi_clk should be configured to the frequency as master clock
          // @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_prim_axi_clk", 8, 200, 9}},

          // USB 3.0 Master Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
          package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 8, 200, 9}},

          //enable UTMI clk @19.2 MHz 8 = Set & Enable; 19.2, 7 -> Closest 19.2 Mhz
          package() {"CLOCK", package() {"gcc_usb30_prim_mock_utmi_clk", 8, 19200, 7}},

          // Phy Aux Clock @ 1.2 Mhz 8 = Set & Enable; 1.2, 7 -> Closest 1.2 Mhz
          package() {"CLOCK", package() {"gcc_usb3_prim_phy_aux_clk", 8, 1200, 7}},
          
          // Phy Com Aux Clock @ 19.2 Mhz 8 = Set & Enable; 19.2, 7 -> Closest 19.2 Mhz
          package() {"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 8, 19200, 7}},
          // Mark Suppressible for Phy Com Aux Clock
          package() {"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 9, 8,}},

          //Vote for max freq: BUS Arbiter Request (Type-3)
          // Instantaneous BW BytesPerSec = 671088640;
          // Arbitrated BW BytesPerSec = 671088640 (5  x 1024 X 1024 x 1024)/8
          package()
          {
            "BUSARB",
            Package()
            {
              3,                      // Req Type
              "ICBID_MASTER_USB3_0",  // Master
              "ICBID_SLAVE_EBI1",     // Slave
              671088640,              // IB=5Gbps
              671088640               // AB=5Gbps
            }
          },

          //Nominal==block vdd_min:
          package()
          {
            "NPARESOURCE",
            Package() {1, "/arc/client/rail_cx", 256}
          },

          // Vote for CNOC 100 MHz - 400 MB/s IB-only (AB = 0) 
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          //BUS Arbiter Request (Type-3)
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_0",       // Slave
              400000000,                  // IB=400 MBps
              0                           // AB=0 MBps
            }
          },

         // Enable SS Phy Reference Clock (diff clock) 1 = Enable (Source controlled by RPMH clock/ LNBBCLK)
          package() {"CLOCK", package() {"gcc_usb3_prim_clkref_en", 1}},
        },
        package()
        { // HOST D1
          "DSTATE", // D1 state (Suspend State - HS Suspend + SS disconnect /SS Suspend + HS disconnect/ HS + SS suspend)
          0x1,

          // Enable usb30_prim_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_prim_gdsc",   // USB 3.0 Core Power domain
              1,                   //1==Enable
            },
          },

          //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 3, 9600, 5}},

          // Disable USB 3.0 Master Clock  2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 2}},

          // gcc_cfg_noc_usb3_prim_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_prim_axi_clk", 2}},

          //Disable aggre_usb3_prim_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_prim_axi_clk", 2}},

          // Disable UTMI clk 2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_prim_mock_utmi_clk", 2}},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_0",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
          package() {"CLOCK", package() { "gcc_usb3_prim_phy_aux_clk", 2}},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package() {"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 2}},

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          package() {"CLOCK", package() {"gcc_usb3_prim_clkref_en", 2}},
      
          //BUS Arbiter Request (Type-3)
          //Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                    // Req Type
              "ICBID_MASTER_USB3_0",// Master
              "ICBID_SLAVE_EBI1",   // Slave
              0,                    // IB=0 Mbps
              0                     // AB=0Mbps
            }
          },

          //enable vdd_min
          package()
          {
            "NPARESOURCE",
            package() { 1, "/arc/client/rail_cx", 0}
          },

          package()
          {
            "PMICVREGVOTE",
            package()                                         //Vote for L12 @1.8v
            {
              // L12 - VDDA_QUSB_HS0_1P8
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage         : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            "PMICVREGVOTE",                                   // PMICVREGVOTE resource
            package()                                         // Vote for L16 @3.072v
            {
              // L16E - VDDA_QUSB_HS0_3P1
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              3072000,                                        // Voltage = 3.072 V
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            // L3C is used for QMP PHY
            // VDDA_USB_SS_1P2 (V_L2A_USB_SS_1P2)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // VDDA_USB_SS_CORE
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L9 @ 0.912v
            {
              "PPP_RESOURCE_ID_LDO9_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              912000,                                         // Voltage (microvolts)
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
        
           // VDDA_QUSB0_HS
          Package()    
          {
             "PMICVREGVOTE",    
             Package()
             {                                    
                "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
                1,                             // Voltage Regulator type = LDO
                880000,                        // Voltage is in micro volts
                1,                             // force enable from software
                4,                             // power mode - LPM
                0,                             // head room voltage
             },
          },
        },
        package()
        { // HOST D2
          "DSTATE",
          0x2,  // Slave device disconnect (host cable is still connected)

          //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 3, 9600000, 1}},

          // Disable USB 3.0 Master Clock  2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 2}},

          // gcc_cfg_noc_usb3_prim_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_prim_axi_clk", 2}},

          // Disable aggre_usb3_prim_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_prim_axi_clk", 2}},

          // Disable UTMI clk 2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_prim_mock_utmi_clk", 2}},

          // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_prim_phy_aux_clk", 2 }},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package() {"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 2}},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_0",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          package() {"CLOCK", package() {"gcc_usb3_prim_clkref_en", 2}},


          // Enable usb30_prim_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_prim_gdsc",   // USB 3.0 Core Power domain
              1,                   //1==Enable
            },
          },

          //Vote for 0 freq
          package()
          {
            "BUSARB",
            Package()
            {
              3,                      // Req Type
              "ICBID_MASTER_USB3_0",  // Master
              "ICBID_SLAVE_EBI1",     // Slave
               0,                     // IB=0 Mbps
               0                      // AB=0Mbps
            }
          },

          //enable vdd_min
          package()
          {
            "NPARESOURCE",
            package() { 1, "/arc/client/rail_cx", 0}
          },

          //Power Grid for SDM1000
          package()
          {
            "PMICVREGVOTE",
            package()                                         //Vote for L12 @1.8v
            {
              // L12 - VDDA_QUSB_HS0_1P8
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage         : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            "PMICVREGVOTE",                                   // PMICVREGVOTE resource
            package()                                         // Vote for L16 @3.072v
            {
              // L16E - VDDA_QUSB_HS0_3P1
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              3072000,                                        // Voltage = 3.072 V
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            // L3C is used for QMP PHY
            // VDDA_USB_SS_1P2 (V_L2A_USB_SS_1P2)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // VDDA_USB_SS_CORE
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L9 @ 0.912v
            {
              "PPP_RESOURCE_ID_LDO9_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              912000,                                         // Voltage (microvolts)
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

           // VDDA_QUSB0_HS
           Package()    
           {
             "PMICVREGVOTE",    
             Package()
             {                                    
                "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
                1,                             // Voltage Regulator type = LDO
                880000,                        // Voltage is in micro volts
                1,                             // force enable from software
                4,                             // power mode - Normal Power Mode
                0,                             // head room voltage
             },
           },
        },
        package()
        { // HOST D3
          "DSTATE",
          0x3, // Abandon state

          //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 3, 9600000, 1}},

          // Disable USB 3.0 Master Clock  2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 2}},

          // gcc_cfg_noc_usb3_prim_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_prim_axi_clk", 2}},

          // Disable aggre_usb3_prim_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_prim_axi_clk", 2}},

          // Disable UTMI clk 2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_prim_mock_utmi_clk", 2}},

          // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_prim_phy_aux_clk", 2 }},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package() {"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 2}},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_0",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          package() {"CLOCK", package() {"gcc_usb3_prim_clkref_en", 2}},

          // Disable usb30_prim_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_prim_gdsc",   // USB 3.0 Core Power domain
              2,                   // 2==Disable
            },
          },

          //Vote for 0 freq
          package()
          {
            "BUSARB",
             package()
             {
               3,                    // Req Type
               "ICBID_MASTER_USB3_0",// Master
               "ICBID_SLAVE_EBI1",   // Slave
               0,                    // IB=0 Mbps
               0                     // AB=0Mbps
             }
           },

          //enable vdd_min
          package() {"NPARESOURCE", package() {1, "/arc/client/rail_cx", 0}},

          //Power Grid for SDM1000
          package()
          {
            "PMICVREGVOTE",                                   // PMICVREGVOTE resource
            package()                                         // Vote for L16 @ 0V - VDDA_QUSB_HS0_3P1
            {
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              0,                                              // Voltage = 0 V
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",
            package()                                         // Vote for L12 @ 0V - VDDA_QUSB_HS0_1P8
            {
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              0,                                              // Voltage         : 0 microvolts ( V )
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @ 0v - VDDA_USB_SS_1P2
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              0,                                              // Voltage 0 V        : microvolts ( V )
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",                                   // PMIC VREG resource - VDDA_USB_SS_CORE
            package()                                         // Vote for L9 @ 0 v
            {
              "PPP_RESOURCE_ID_LDO9_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              0,                                              // Voltage (microvolts)
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          
           // VDDA_QUSB0_HS
           Package()    
           {
             "PMICVREGVOTE",    
             Package()
             {                                    
              "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
              1,                             // Voltage Regulator type = LDO
              0,                        // Voltage is in micro volts
              0,                             // force enable from software
              4,                             // power mode - LPM
              0,                             // head room voltage
            },
          },
        },
        // Define Abandon State for USB0 (host) stack ie. Power State invoked when stack unloads/tears down
        package()
        {
          "ABANDON_DSTATE",
          3                                                   // Abandon D state defined as D3
        },
      },  //End USB0

      //
      //************************* USB3.0 SS/HS0 core (Peripheral Stack) ****************************
      //
      package()
      {
        "DEVICE",
        "\\_SB.URS0.UFN0",
        package()
        {
          "COMPONENT",
          0x0,
          // F-State placeholders
          package()
          {
            "FSTATE",
            0x0,
          },
          package()
          {
            "PSTATE",
            0x0,
          },
          package()
          {
            "PRELOAD_PSTATE",
            0,
          },// index 0 is P-state 0 here
        },

        package()
        { // PERIPH D0
          "DSTATE",
          0x0,
          //Power Grid for SDM1000
          package()
          {
            // L12 - VDDA_QUSB_HS0_1P8
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L12 @1.8v
            {
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage 1.8V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // L16E - VDDA_QUSB_HS0_3P1
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L16 @3.072v
            {
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              3072000,                                        // Voltage = 3.072 V
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // L3C - VDDA_USB_SS_1P2 (QMP PHY)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // VDDA_USB_SS_CORE
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L9 @ 0.912v
            {
              "PPP_RESOURCE_ID_LDO9_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              912000,                                         // Voltage (microvolts)
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          
          // VDDA_QUSB0_HS
          Package()    
          {
             "PMICVREGVOTE",    
             Package()
             {                                    
                "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
                1,                             // Voltage Regulator type = LDO
                880000,                        // Voltage is in micro volts
                1,                             // force enable from software
                7,                             // power mode - Normal Power Mode
                0,                             // head room voltage
            },
          },

          // Enable usb30_prim_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
              {
                "usb30_prim_gdsc",   // USB 3.0 Core Power domain
                1,                   //1==Enable
              },
          },
          
          // Enable USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_prim_sleep_clk", 1}},
          // Mark Suppressible for USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_prim_sleep_clk", 9, 8,}},
          // Mark Always On for USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_prim_sleep_clk", 9, 12,}},
          //Select external source action for gcc_usb3_prim_phy_pipe_clk, Sourced by QMP Phy PLL
          // package() {"CLOCK", package() {"gcc_usb3_prim_phy_pipe_clk", 6, 0, 0, 0x0}},
          // Enable PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_prim_phy_pipe_clk", 1}},
          // Mark Suppressible for USB PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_prim_phy_pipe_clk", 9, 8,}},

          //aggre_usb3_prim_axi Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz
          package() {"CLOCK", package() {"gcc_aggre_usb3_prim_axi_clk",  8, 200, 9}},

          // gcc_cfg_noc_usb3_prim_axi_clk should be configured to the frequency as master clock
          // @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_prim_axi_clk", 8, 200, 9}},

          // USB 3.0 Master Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz
          package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 8, 200, 9}},

          // Phy Aux Clock @ 1.2 Mhz 8 = Set & Enable; 1.2, 7 -> Closest 1.2 Mhz
          package() {"CLOCK", package() {"gcc_usb3_prim_phy_aux_clk", 8, 1200, 7}},
          
          // Phy Com Aux Clock @ 19.2 Mhz 8 = Set & Enable; 19.2, 7 -> Closest 19.2 Mhz
          package() {"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 8, 19200, 7}},
          // Mark Suppressible for Phy Com Aux Clock
          package() {"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 9, 8,}},

          // Vote for CNOC 100 MHz - 400 MB/s IB-only (AB = 0) 
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          //BUS Arbiter Request (Type-3)
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_0",       // Slave
              400000000,                  // IB=400 MBps
              0                           // AB=0 MBps
            }
          },

          //Vote for max freq: BUS Arbiter Request (Type-3)
          // Instantaneous BW BytesPerSec = 671088640;
          // Arbitrated BW BytesPerSec = 671088640 (5  x 1024 X 1024 x 1024)/8
          package()
          {
            "BUSARB",
            Package()
            {
              3,                      // Req Type
              "ICBID_MASTER_USB3_0",  // Master
              "ICBID_SLAVE_EBI1",     // Slave
              671088640,              // IB=5Gbps
              671088640               // AB=5Gbps
            }
          },

          //Nominal==block vdd_min:
          package()
          {
            "NPARESOURCE",
            Package() {1, "/arc/client/rail_cx", 256}
          },

         // Enable SS Phy Reference Clock (diff clock) 1 = Enable (Source controlled by RPMH clock/ LNBBCLK)
          package() {"CLOCK", package() {"gcc_usb3_prim_clkref_en", 1}},
        },
        package()
        {
          // PERIPH D1: Not supported by USBFN driver
          "DSTATE",     //USB SS+HS suspend state
          0x1,
        },
        package()
        { // PERIPH D2
          "DSTATE",     //USB DCP/HVDCP charger state
          0x2,

          // Set frequency @9.6Mhz before disabling to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          // Set USB 3.0 Master Clock @ 9.6 MHz 3 = Set ; 9600,9 -> Atleast 9.6 Mhz
          package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 3, 9600, 5}},

          // Disable USB 3.0 Master Clock  2 = Disable ;
          package() {"CLOCK", package() { "gcc_usb30_prim_master_clk", 2 } },

          // gcc_cfg_noc_usb3_prim_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_prim_axi_clk", 2}},

          //Disable aggre_usb3_prim_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_prim_axi_clk", 2}},

          //Disable  gcc_usb3_prim_phy_aux_clk
          package() {"CLOCK", package() {"gcc_usb3_prim_phy_aux_clk", 2}},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package() {"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 2}},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_0",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          package() {"CLOCK", package() {"gcc_usb3_prim_clkref_en", 2}},


          //BUS Arbiter Request (Type-3)
          //Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                      // Req Type
              "ICBID_MASTER_USB3_0",  // Master
              "ICBID_SLAVE_EBI1",     // Slave
              0,                      // IB=0 MBps
              0                       // AB=0 MBps
            }
          },

          package()
          {
            "PMICVREGVOTE",
            package()                                         //Vote for L12 @1.8v
            {
              // L12 - VDDA_QUSB_HS0_1P8
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage         : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            "PMICVREGVOTE",                                   // PMICVREGVOTE resource
            package()                                         // Vote for L16 @3.072v
            {
              // L16E - VDDA_QUSB_HS0_3P1
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              3072000,                                        // Voltage = 3.072 V
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            // L3C is used for QMP PHY
            // VDDA_USB_SS_1P2 (V_L2A_USB_SS_1P2)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // VDDA_USB_SS_CORE
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L9 @ 0.912v
            {
              "PPP_RESOURCE_ID_LDO9_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              912000,                                         // Voltage (microvolts)
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          
          // VDDA_QUSB0_HS
          Package()    
          {
             "PMICVREGVOTE",    
             Package()
             {                                    
                "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
                1,                             // Voltage Regulator type = LDO
                880000,                        // Voltage is in micro volts
                1,                             // force enable from software
                4,                             // power mode - Normal Power Mode
                0,                             // head room voltage
             },
          },
        },
        package()
        {
          // PERIPH D3
          "DSTATE",
          0x3,                                              // Detach State

          //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 3, 9600000, 1}},

          // Disable USB 3.0 Master Clock  2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 2}},

          // gcc_cfg_noc_usb3_prim_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_prim_axi_clk", 2}},

          //Disable aggre_usb3_prim_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_prim_axi_clk", 2}},

          // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_prim_phy_aux_clk", 2 }},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package() {"CLOCK", package() {"gcc_usb3_prim_phy_com_aux_clk", 2}},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_0",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // GCC_USB_SS_PHY_LDO_EN is being enabled once in Clock Driver during initilization
          // No option of enabling it through ACPI

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          package() {"CLOCK", package() {"gcc_usb3_prim_clkref_en", 2}},


          // Disable usb30_prim_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
              {
                "usb30_prim_gdsc",   // USB 3.0 Core Power domain
                2,                   // 2==Disable
              },
          },

          //Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                    // Req Type
              "ICBID_MASTER_USB3_0",// Master
              "ICBID_SLAVE_EBI1",   // Slave
              0,                    // IB=0 MBps
              0                     // AB=0 Mbps
            }
          },

          //enable vdd_min
          package()
          {
            "NPARESOURCE",
            package() { 1, "/arc/client/rail_cx", 0}
          },

          package()
          {
            "PMICVREGVOTE",                       // PMICVREGVOTE resource
            package()                                         // Vote for L16 @ 0V - VDDA_QUSB_HS0_3P1
            {
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                  // Voltage Regulator type 1 = LDO
              0,                                  // Voltage = 0 V
              0,                                  // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                  // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",
            package()                                         // Vote for L12 @ 0V - VDDA_QUSB_HS0_1P8
            {
              "PPP_RESOURCE_ID_LDO12_A",          // Voltage Regulator ID
              1,                                  // Voltage Regulator type = LDO
              0,                                  // Voltage         : 0 microvolts ( V )
              0,                                  // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                  // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",                       // PMIC VREG resource
            package()                                         // Vote for L3 @ 0v - VDDA_USB_SS_1P2
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                  // Voltage Regulator type = LDO
              0,                                              // Voltage 0 V        : microvolts ( V )
              0,                                  // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                  // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",                       // PMIC VREG resource - VDDA_USB_SS_CORE
            package()                             // Vote for L9 @ 0 v
            {
              "PPP_RESOURCE_ID_LDO9_E",           // Voltage Regulator ID
              1,                                  // Voltage Regulator type = LDO
              0,                                  // Voltage (microvolts)
              0,                                  // SW Enable = Disable
              4,                                  // SW Power Mode = LPM
              0,                                  // Head Room
            },
          },
          // VDDA_QUSB0_HS
          Package()    
          {
             "PMICVREGVOTE",    
             Package()
             {                                    
                "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
                1,                             // Voltage Regulator type = LDO
                0,                             // Voltage is in micro volts
                0,                             // force enable from software
                4,                             // power mode - Normal Power Mode
                0,                             // head room voltage
             },
          },
        },
        // Define Abandon State for UFN0 (peripheral) stack ie. Power State invoked when stack unloads/tears down
        package()
        {
          "ABANDON_DSTATE",
          3                                                   // Abandon D state defined as D3
        },
      },    //End UFN0

      //////////////////////////////////////////////////////////////////
      //USB Secondary Core (Host Stack)
      Package()
      {
        "DEVICE",
        "\\_SB.URS1",
        Package()
        {
          "COMPONENT",
          Zero,
          Package() {"FSTATE", 0},
          Package() {"PSTATE", 0},
          Package() {"PSTATE", 1}
        },
        Package() {"DSTATE", 0 },
        Package() {"DSTATE", 1 },
        Package() {"DSTATE", 2 },
        Package() {"DSTATE", 3 }
      },

      Package()
      {
        "DEVICE",
        "\\_SB.URS1.USB1",
        Package()
        {
          "COMPONENT",
          0x0, // Component 0.
          Package() { "FSTATE", 0x0, },
          package()
          {
            "PSTATE",
            0x0,           
          },
          package()
          {
            "PRELOAD_PSTATE",
            0,
          },// index 0 is P-state 0 here
        },
        //D states
        Package()
        { // HOST D0
          "DSTATE",
          0x0,
          //Power Grid for SDM1000
          package()
          {
            // L12 - VDDA_QUSB_HS0_1P8 (QUSB2 PHY)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L12 @1.8v
            {
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage 1.8V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          package()
          {
          // L16E - VDDA_QUSB_HS0_3P1
          "PMICVREGVOTE",                                   // PMIC VREG resource
          package()                                         // Vote for L16 @3.072v
          {
            "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
            1,                                              // Voltage Regulator type 1 = LDO
            3072000,                                        // Voltage = 3.072 V
            1,                                              // SW Enable = Enable
            7,                                              // SW Power Mode = NPM
            0,                                              // Head Room
          },
          },
          package()
          {
            // L3C - VDDA_USB_SS_1P2 (QMP PHY)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // VDDA_USB_SS_CORE
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L9 @ 0.912v
            {
              "PPP_RESOURCE_ID_LDO9_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              912000,                                         // Voltage (microvolts)
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },

           // VDDA_QUSB0_HS
           Package()    
           {
             "PMICVREGVOTE",    
             Package()
             {                                    
                "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
                1,                             // Voltage Regulator type = LDO
                880000,                        // Voltage is in micro volts
                1,                             // force enable from software
                7,                             // power mode - Normal Power Mode
                0,                             // head room voltage
            },
          },
                
          // Enable usb30_sec_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_sec_gdsc",   // USB 3.0 Core Power domain
              1,                   //1==Enable
            },
          },

          // Enable USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_sec_sleep_clk", 1}},
          // Mark Suppressible for USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_sec_sleep_clk", 9, 8,}},
          // Mark Always On for USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_sec_sleep_clk", 9, 12,}},
 
          //Select external source action for gcc_usb3_sec_phy_pipe_clk, Sourced by QMP Phy PLL
          // package() {"CLOCK", package() {"gcc_usb3_sec_phy_pipe_clk", 6, 0, 0, 0x0}},
          // Enable PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_sec_phy_pipe_clk", 1}},
          // Mark Suppressible for USB PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_sec_phy_pipe_clk", 9, 8,}},

          // Now Enable all the clocks

          //aggre_usb3_sec_axi Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
          package() {"CLOCK", package() {"gcc_aggre_usb3_sec_axi_clk",  8, 200, 9}},

          // gcc_cfg_noc_usb3_sec_axi_clk should be configured to the frequency as master clock
          // @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_sec_axi_clk", 8, 200, 9}},

          // USB 3.0 Master Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz (Nominal for SS+)
          package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 8, 200, 9}},

          //enable UTMI clk @19.2 MHz 8 = Set & Enable; 19.2, 7 -> Closest 19.2 Mhz
          package() {"CLOCK", package() {"gcc_usb30_sec_mock_utmi_clk", 8, 19200, 7}},

          // Phy Aux Clock @ 1.2 Mhz 8 = Set & Enable; 1.2, 7 -> Closest 1.2 Mhz
          package() {"CLOCK", package() {"gcc_usb3_sec_phy_aux_clk", 8, 1200, 7}},

          // Phy Com Aux Clock @ 19.2 Mhz 8 = Set & Enable; 19.2, 7 -> Closest 19.2 Mhz
          package() {"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 8, 19200, 7}},
          // Mark Suppressible for Phy Com Aux Clock
          package() {"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 9, 8,}},

          //Vote for max freq: BUS Arbiter Request (Type-3)
          // Instantaneous BW BytesPerSec = 671088640;
          // Arbitrated BW BytesPerSec = 671088640 (5  x 1024 X 1024 x 1024)/8
          package()
          {
            "BUSARB",
            Package()
            {
              3,                      // Req Type
              "ICBID_MASTER_USB3_1",  // Master
              "ICBID_SLAVE_EBI1",     // Slave
              671088640,              // IB=5Gbps
              671088640               // AB=5Gbps
            }
          },

          //Nominal==block vdd_min:
          package()
          {
            "NPARESOURCE",
            Package() {1, "/arc/client/rail_cx", 256}
          },

          // Vote for CNOC 100 MHz - 400 MB/s IB-only (AB = 0) 
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          //BUS Arbiter Request (Type-3)
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_1",       // Slave
              400000000,                  // IB=400 MBps
              0                           // AB=0 MBps
            }
          },

         // Enable SS Phy Reference Clock (diff clock) 1 = Enable (Source controlled by RPMH clock/ LNBBCLK)
          package() {"CLOCK", package() {"gcc_usb3_sec_clkref_en", 1}},
        },
        package()
        { // HOST D1
          "DSTATE", // D1 state (Suspend State - HS Suspend + SS disconnect /SS Suspend + HS disconnect/ HS + SS suspend)
          0x1,

          // Enable usb30_sec_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_sec_gdsc",   // USB 3.0 Core Power domain
              1,                   //1==Enable
            },
          },

          //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 3, 9600, 5}},

          // Disable USB 3.0 Master Clock  2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 2}},

          // gcc_cfg_noc_usb3_sec_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_sec_axi_clk", 2}},

          //Disable aggre_usb3_sec_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_sec_axi_clk", 2}},

          // Disable UTMI clk 2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_sec_mock_utmi_clk", 2}},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_1",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_sec_phy_aux_clk", 2 }},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package() {"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 2}},

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          package() {"CLOCK", package() {"gcc_usb3_sec_clkref_en", 2}},

          //BUS Arbiter Request (Type-3)
          //Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                    // Req Type
              "ICBID_MASTER_USB3_1",// Master
              "ICBID_SLAVE_EBI1",   // Slave
              0,                    // IB=0 Mbps
              0                     // AB=0Mbps
            }
          },

          //enable vdd_min
          package()
          {
            "NPARESOURCE",
            package() { 1, "/arc/client/rail_cx", 0}
          },

          package()
          {
            "PMICVREGVOTE",
            package()                                         //Vote for L12 @1.8v
            {
              // L12 - VDDA_QUSB_HS0_1P8
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage         : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            "PMICVREGVOTE",                                   // PMICVREGVOTE resource
            package()                                         // Vote for L16 @3.072v
            {
              // L16E - VDDA_QUSB_HS0_3P1
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              3072000,                                        // Voltage = 3.072 V
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            // L3C is used for QMP PHY
            // VDDA_USB_SS_1P2 (V_L2A_USB_SS_1P2)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // VDDA_USB_SS_CORE
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L9 @ 0.912v
            {
              "PPP_RESOURCE_ID_LDO9_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              912000,                                         // Voltage (microvolts)
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          
           // VDDA_QUSB0_HS
           Package()    
           {
             "PMICVREGVOTE",    
             Package()
             {                                    
              "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
              1,                             // Voltage Regulator type = LDO
              880000,                        // Voltage is in micro volts
              1,                             // force enable from software
              4,                             // power mode - LPM
              0,                             // head room voltage
            },
          },
        },
        package()
        { // HOST D2
          "DSTATE",
          0x2,  // Slave device disconnect (host cable is still connected)

          //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 3, 9600000, 1}},

          // Disable USB 3.0 Master Clock  2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 2}},

          // gcc_cfg_noc_usb3_sec_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_sec_axi_clk", 2}},

          // Disable aggre_usb3_sec_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_sec_axi_clk", 2}},

          // Disable UTMI clk 2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_sec_mock_utmi_clk", 2}},

          // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_sec_phy_aux_clk", 2 }},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package() {"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 2}},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_1",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // GCC_USB_SS_PHY_LDO_EN is being enabled once in Clock Driver during  initialization
          // No option of enabling it through ACPI

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          package() {"CLOCK", package() {"gcc_usb3_sec_clkref_en", 2}},


          // Enable usb30_sec_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_sec_gdsc",   // USB 3.0 Core Power domain
              1,                   //1==Enable
            },
          },

          //Vote for 0 freq
          package()
          {
            "BUSARB",
            Package()
            {
              3,                      // Req Type
              "ICBID_MASTER_USB3_1",  // Master
              "ICBID_SLAVE_EBI1",     // Slave
               0,                     // IB=0 Mbps
               0                      // AB=0Mbps
            }
          },

          //enable vdd_min
          package()
          {
            "NPARESOURCE",
            package() { 1, "/arc/client/rail_cx", 0}
          },

          //Power Grid for SDM1000
          package()
          {
            "PMICVREGVOTE",
            package()                                         //Vote for L12 @1.8v
            {
              // L12 - VDDA_QUSB_HS0_1P8
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage         : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            "PMICVREGVOTE",                                   // PMICVREGVOTE resource
            package()                                         // Vote for L16 @3.072v
            {
              // L16E - VDDA_QUSB_HS0_3P1
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              3072000,                                        // Voltage = 3.072 V
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            // L3C is used for QMP PHY
            // VDDA_USB_SS_1P2 (V_L2A_USB_SS_1P2)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // VDDA_USB_SS_CORE
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L9 @ 0.912v
            {
              "PPP_RESOURCE_ID_LDO9_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              912000,                                         // Voltage (microvolts)
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          
          // VDDA_QUSB0_HS
          Package()    
          {
            "PMICVREGVOTE",    
            Package()
            {                                    
              "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
              1,                             // Voltage Regulator type = LDO
              880000,                        // Voltage is in micro volts
              1,                             // force enable from software
              4,                             // power mode - LPM
              0,                             // head room voltage
            },
          },
        },
        package()
        { // HOST D3
          "DSTATE",
          0x3, // Abandon state

          //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 3, 9600000, 1}},

          // Disable USB 3.0 Master Clock  2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 2}},

          // gcc_cfg_noc_usb3_sec_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_sec_axi_clk", 2}},

          // Disable aggre_usb3_sec_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_sec_axi_clk", 2}},

          // Disable UTMI clk 2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_sec_mock_utmi_clk", 2}},

          // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_sec_phy_aux_clk", 2 }},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package() {"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 2}},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_1",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // GCC_USB_SS_PHY_LDO_EN is being enabled once in Clock Driver during initilization
          // No option of enabling it through ACPI

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          package() {"CLOCK", package() {"gcc_usb3_sec_clkref_en", 2}},


          // Disable usb30_sec_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_sec_gdsc",   // USB 3.0 Core Power domain
              2,                   // 2==Disable
            },
          },

          //Vote for 0 freq
          package()
          {
            "BUSARB",
             package()
             {
               3,                    // Req Type
               "ICBID_MASTER_USB3_1",// Master
               "ICBID_SLAVE_EBI1",   // Slave
               0,                    // IB=0 Mbps
               0                     // AB=0Mbps
             }
           },

          //enable vdd_min
          package() {"NPARESOURCE", package() {1, "/arc/client/rail_cx", 0}},

          //Power Grid for SDM1000
          package()
          {
            "PMICVREGVOTE",                                   // PMICVREGVOTE resource
            package()                                         // Vote for L16 @ 0V - VDDA_QUSB_HS0_3P1
            {
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              0,                                              // Voltage = 0 V
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",
            package()                                         // Vote for L12 @ 0V - VDDA_QUSB_HS0_1P8
            {
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              0,                                              // Voltage         : 0 microvolts ( V )
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @ 0v - VDDA_USB_SS_1P2
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              0,                                              // Voltage 0 V        : microvolts ( V )
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",                                   // PMIC VREG resource - VDDA_USB_SS_CORE
            package()                                         // Vote for L9 @ 0 v
            {
              "PPP_RESOURCE_ID_LDO9_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              0,                                              // Voltage (microvolts)
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          
          // VDDA_QUSB0_HS
          Package()    
          {
            "PMICVREGVOTE",    
            Package()
            {                                    
              "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
              1,                             // Voltage Regulator type = LDO
              0,                             // Voltage is in micro volts
              0,                             // force enable from software
              4,                             // power mode - LPM
              0,                             // head room voltage
            },
          },
        },
        // Define Abandon State for USB1 (host) stack ie. Power State invoked when stack unloads/tears down
        package()
        {
          "ABANDON_DSTATE",
          3                                                   // Abandon D state defined as D3
        },
      },  //End USB1
      
      //
      //************************* USB3.0 SS/HS 1 core (Peripheral Stack) ****************************
      //
      package()
      {
        "DEVICE",
        "\\_SB.URS1.UFN1",
        package()
        {
          "COMPONENT",
          0x0,
          // F-State placeholders
          package()
          {
            "FSTATE",
            0x0,
          },
          package()
          {
            "PSTATE",
            0x0,
          },
          package()
          {
            "PRELOAD_PSTATE",
            0,
          },// index 0 is P-state 0 here
        },

        package()
        { // PERIPH D0
          "DSTATE",
          0x0,
          //Power Grid for SDM1000
          package()
          {
            // L12 - VDDA_QUSB_HS0_1P8
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L12 @1.8v
            {
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage 1.8V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // L16E - VDDA_QUSB_HS0_3P1
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L16 @3.072v
            {
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              3072000,                                        // Voltage = 3.072 V
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // L3C - VDDA_USB_SS_1P2 (QMP PHY)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // VDDA_USB_SS_CORE
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L9 @ 0.912v
            {
              "PPP_RESOURCE_ID_LDO9_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              912000,                                         // Voltage (microvolts)
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          
          // VDDA_QUSB0_HS
          Package()    
          {
             "PMICVREGVOTE",    
             Package()
             {                                    
                "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
                1,                             // Voltage Regulator type = LDO
                880000,                        // Voltage is in micro volts
                1,                             // force enable from software
                7,                             // power mode - Normal Power Mode
                0,                             // head room voltage
            },
          },

          // Enable usb30_sec_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
              {
                "usb30_sec_gdsc",   // USB 3.0 Core Power domain
                1,                   //1==Enable
              },
          },
          
          // Enable USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_sec_sleep_clk", 1}},
          // Mark Suppressible for USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_sec_sleep_clk", 9, 8,}},
          // Mark Always On for USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_sec_sleep_clk", 9, 12,}},
          //Select external source action for gcc_usb3_sec_phy_pipe_clk, Sourced by QMP Phy PLL
          // package() {"CLOCK", package() {"gcc_usb3_sec_phy_pipe_clk", 6, 0, 0, 0x0}},
          // Enable PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_sec_phy_pipe_clk", 1}},
          // Mark Suppressible for USB PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_sec_phy_pipe_clk", 9, 8,}},

          //aggre_usb3_sec_axi Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz
          package() {"CLOCK", package() {"gcc_aggre_usb3_sec_axi_clk",  8, 200, 9}},

          // gcc_cfg_noc_usb3_sec_axi_clk should be configured to the frequency as master clock
          // @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_sec_axi_clk", 8, 200, 9}},

          // USB 3.0 Master Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz
          package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 8, 200, 9}},

          // Phy Aux Clock @ 1.2 Mhz 8 = Set & Enable; 1.2, 7 -> Closest 1.2 Mhz
          package() {"CLOCK", package() {"gcc_usb3_sec_phy_aux_clk", 8, 1200, 7}},
          
          // Phy Com Aux Clock @ 19.2 Mhz 8 = Set & Enable; 19.2, 7 -> Closest 19.2 Mhz
          package() {"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 8, 19200, 7}},
          // Mark Suppressible for Phy Com Aux Clock
          package() {"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 9, 8,}},

          // Vote for CNOC 100 MHz - 400 MB/s IB-only (AB = 0) 
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          //BUS Arbiter Request (Type-3)
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_1",       // Slave
              400000000,                  // IB=400 MBps
              0                           // AB=0 MBps
            }
          },

          //Vote for max freq: BUS Arbiter Request (Type-3)
          // Instantaneous BW BytesPerSec = 671088640;
          // Arbitrated BW BytesPerSec = 671088640 (5  x 1024 X 1024 x 1024)/8
          package()
          {
            "BUSARB",
            Package()
            {
              3,                      // Req Type
              "ICBID_MASTER_USB3_1",  // Master
              "ICBID_SLAVE_EBI1",     // Slave
              671088640,              // IB=5Gbps
              671088640               // AB=5Gbps
            }
          },

          //Nominal==block vdd_min:
          package()
          {
            "NPARESOURCE",
            Package() {1, "/arc/client/rail_cx", 256}
          },

         // Enable SS Phy Reference Clock (diff clock) 1 = Enable (Source controlled by RPMH clock/ LNBBCLK)
          package() {"CLOCK", package() {"gcc_usb3_sec_clkref_en", 1}},
        },
        package()
        {
          // PERIPH D1: Not supported by USBFN driver
          "DSTATE",     //USB SS+HS suspend state
          0x1,
        },
        package()
        { // PERIPH D2
          "DSTATE",     //USB DCP/HVDCP charger state
          0x2,

          // Set frequency @9.6Mhz before disabling to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          // Set USB 3.0 Master Clock @ 9.6 MHz 3 = Set ; 9600,9 -> Atleast 9.6 Mhz
          package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 3, 9600, 5}},

          // Disable USB 3.0 Master Clock  2 = Disable ;
          package() {"CLOCK", package() { "gcc_usb30_sec_master_clk", 2 } },

          // gcc_cfg_noc_usb3_sec_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_sec_axi_clk", 2}},

          //Disable aggre_usb3_sec_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_sec_axi_clk", 2}},

          //Disable  gcc_usb3_sec_phy_aux_clk
          package() {"CLOCK", package() {"gcc_usb3_sec_phy_aux_clk", 2}},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package() {"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 2}},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_1",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          package() {"CLOCK", package() {"gcc_usb3_sec_clkref_en", 2}},


          //BUS Arbiter Request (Type-3)
          //Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                      // Req Type
              "ICBID_MASTER_USB3_1",  // Master
              "ICBID_SLAVE_EBI1",     // Slave
              0,                      // IB=0 MBps
              0                       // AB=0 MBps
            }
          },

          package()
          {
            "PMICVREGVOTE",
            package()                                         //Vote for L12 @1.8v
            {
              // L12 - VDDA_QUSB_HS0_1P8
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage         : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            "PMICVREGVOTE",                                   // PMICVREGVOTE resource
            package()                                         // Vote for L16 @3.072v
            {
              // L16E - VDDA_QUSB_HS0_3P1
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              3072000,                                        // Voltage = 3.072 V
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            // L3C is used for QMP PHY
            // VDDA_USB_SS_1P2 (V_L2A_USB_SS_1P2)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // VDDA_USB_SS_CORE
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L9 @ 0.912v
            {
              "PPP_RESOURCE_ID_LDO9_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              912000,                                         // Voltage (microvolts)
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          
          // VDDA_QUSB0_HS
          Package()    
          {
             "PMICVREGVOTE",    
             Package()
             {                                    
                "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
                1,                             // Voltage Regulator type = LDO
                880000,                        // Voltage is in micro volts
                1,                             // force enable from software
                4,                             // power mode - Normal Power Mode
                0,                             // head room voltage
             },
          },
        },
        package()
        {
          // PERIPH D3
          "DSTATE",
          0x3,                                              // Detach State

          //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 3, 9600000, 1}},

          // Disable USB 3.0 Master Clock  2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 2}},

          // gcc_cfg_noc_usb3_sec_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_sec_axi_clk", 2}},

          //Disable aggre_usb3_sec_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_sec_axi_clk", 2}},

          // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_sec_phy_aux_clk", 2 }},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package() {"CLOCK", package() {"gcc_usb3_sec_phy_com_aux_clk", 2}},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_1",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // GCC_USB_SS_PHY_LDO_EN is being enabled once in Clock Driver during initilization
          // No option of enabling it through ACPI

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          package() {"CLOCK", package() {"gcc_usb3_sec_clkref_en", 2}},


          // Disable usb30_sec_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
              {
                "usb30_sec_gdsc",   // USB 3.0 Core Power domain
                2,                   // 2==Disable
              },
          },

          //Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                    // Req Type
              "ICBID_MASTER_USB3_1",// Master
              "ICBID_SLAVE_EBI1",   // Slave
              0,                    // IB=0 MBps
              0                     // AB=0 Mbps
            }
          },

          //enable vdd_min
          package()
          {
            "NPARESOURCE",
            package() { 1, "/arc/client/rail_cx", 0}
          },

          package()
          {
            "PMICVREGVOTE",                       // PMICVREGVOTE resource
            package()                                         // Vote for L16 @ 0V - VDDA_QUSB_HS0_3P1
            {
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                  // Voltage Regulator type 1 = LDO
              0,                                  // Voltage = 0 V
              0,                                  // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                  // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",
            package()                                         // Vote for L12 @ 0V - VDDA_QUSB_HS0_1P8
            {
              "PPP_RESOURCE_ID_LDO12_A",          // Voltage Regulator ID
              1,                                  // Voltage Regulator type = LDO
              0,                                  // Voltage         : 0 microvolts ( V )
              0,                                  // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                  // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",                       // PMIC VREG resource
            package()                                         // Vote for L3 @ 0v - VDDA_USB_SS_1P2
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                  // Voltage Regulator type = LDO
              0,                                              // Voltage 0 V        : microvolts ( V )
              0,                                  // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                  // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",                       // PMIC VREG resource - VDDA_USB_SS_CORE
            package()                             // Vote for L9 @ 0 v
            {
              "PPP_RESOURCE_ID_LDO9_E",           // Voltage Regulator ID
              1,                                  // Voltage Regulator type = LDO
              0,                                  // Voltage (microvolts)
              0,                                  // SW Enable = Disable
              4,                                  // SW Power Mode = LPM
              0,                                  // Head Room
            },
          },
          // VDDA_QUSB0_HS
          Package()    
          {
             "PMICVREGVOTE",    
             Package()
             {                                    
                "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
                1,                             // Voltage Regulator type = LDO
                0,                             // Voltage is in micro volts
                0,                             // force enable from software
                4,                             // power mode - Normal Power Mode
                0,                             // head room voltage
             },
          },
        },
        // Define Abandon State for UFN1 (peripheral) stack ie. Power State invoked when stack unloads/tears down
        package()
        {
          "ABANDON_DSTATE",
          3                                                   // Abandon D state defined as D3
        },
      },    //End UFN1

      
      // Empty Test Device
      /*Package()
      {
        "DEVICE",
        "\\_SB.USB2",
        Package()
        {
          "COMPONENT",
          Zero,
          Package() {"FSTATE", 0},
          Package() {"PSTATE", 0},
          Package() {"PSTATE", 1}
        },
        Package() {"DSTATE", 0 },
        Package() {"DSTATE", 1 },
        Package() {"DSTATE", 2 },
        Package() {"DSTATE", 3 }
      },
      */
  
      //USB Multiport core (Host Stack)
      Package()
      {
        "DEVICE",
        "\\_SB.USB2",
        Package()
        {
          "COMPONENT",
          0x0, // Component 0.
          Package() { "FSTATE", 0x0, },
          package()
          {
            "PSTATE",
            0x0,
          },
          package()
          {
            "PRELOAD_PSTATE",
            0,
          },// index 0 is P-state 0 here
        },
        //D states
        Package()
        { // HOST D0
          "DSTATE",
          0x0,
          //Power Grid for SDM1000
          package()
          {
            // L12 - VDDA_QUSB_HS0_1P8 (QUSB2 PHY)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L12 @1.8v
            {
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage 1.8V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          package()
          {
          // L16E - VDDA_QUSB_HS0_3P1
          "PMICVREGVOTE",                                   // PMIC VREG resource
          package()                                         // Vote for L16 @3.072v
          {
            "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
            1,                                              // Voltage Regulator type 1 = LDO
            3072000,                                        // Voltage = 3.072 V
            1,                                              // SW Enable = Enable
            7,                                              // SW Power Mode = NPM
            0,                                              // Head Room
          },
          },
          package()
          {
            // L3C - VDDA_USB_SS_1P2 (QMP PHY)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // VDDA_USB_SS_CORE
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L9 @ 0.912v
            {
              "PPP_RESOURCE_ID_LDO9_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              912000,                                         // Voltage (microvolts)
              1,                                              // SW Enable = Enable
              7,                                              // SW Power Mode = NPM
              0,                                              // Head Room
            },
          },

          // VDDA_QUSB0_HS
          Package()    
          {
             "PMICVREGVOTE",    
             Package()
             {                                    
                "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
                1,                             // Voltage Regulator type = LDO
                880000,                        // Voltage is in micro volts
                1,                             // force enable from software
                7,                             // power mode - Normal Power Mode
                0,                             // head room voltage
             },
          },
        
          // Enable usb30_mp_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_mp_gdsc",   // USB 3.0 Core Power domain
              1,                   //1==Enable
            },
          },
          
          // Enable USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_mp_sleep_clk", 1}},
          // Mark Suppressible for USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_mp_sleep_clk", 9, 8,}},
          // Mark Always On for USB 3.0 Sleep Clock
          package() { "CLOCK", package() { "gcc_usb30_mp_sleep_clk", 9, 12,}},
          //Select external source action for gcc_usb3_mp_phy_pipe_0_clk, Sourced by QMP Phy PLL
          // package() {"CLOCK", package() {"gcc_usb3_mp_phy_pipe_0_clk", 6, 0, 0, 0x0}},
          // Enable MP0 PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_mp_phy_pipe_0_clk", 1}},
          // Mark Suppressible for USB MP0 PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_mp_phy_pipe_0_clk", 9, 8,}},
          // Enable MP1 PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_mp_phy_pipe_1_clk", 1}},
          // Mark Suppressible for USB MP1 PHY pipe Clock
          package() { "CLOCK", package() { "gcc_usb3_mp_phy_pipe_1_clk", 9, 8,}},
            
          // Now Enable all the clocks

          //aggre_usb3_mp_axi Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz
          package() {"CLOCK", package() {"gcc_aggre_usb3_mp_axi_clk",  8, 200, 9}},

          // gcc_cfg_noc_usb3_mp_axi_clk should be configured to the frequency as master clock
          // @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_mp_axi_clk", 8, 200, 9}},

          // USB 3.0 Master Clock @ 200 MHz 8 = Set & Enable; 200,9 -> Atleast 200 Mhz
          package() {"CLOCK", package() {"gcc_usb30_mp_master_clk", 8, 200, 9}},

          //enable UTMI clk @19.2 MHz 8 = Set & Enable; 19.2, 7 -> Closest 19.2 Mhz
          package() {"CLOCK", package() {"gcc_usb30_mp_mock_utmi_clk", 8, 19200, 7}},

          // Phy Aux Clock @ 1.2 Mhz 8 = Set & Enable; 1.2, 7 -> Closest 1.2 Mhz
          package() {"CLOCK", package() {"gcc_usb3_mp_phy_aux_clk", 8, 1200, 7}},
          
          // Phy Com Aux Clock @ 19.2 Mhz 8 = Set & Enable; 19.2, 7 -> Closest 19.2 Mhz
          package() {"CLOCK", package() {"gcc_usb3_mp_phy_com_aux_clk", 8, 19200, 7}},
          // Mark Suppressible for Phy Com Aux Clock
          package() {"CLOCK", package() {"gcc_usb3_mp_phy_com_aux_clk", 9, 8,}},

          //Vote for max freq: BUS Arbiter Request (Type-3)
          // Instantaneous BW BytesPerSec = 671088640;
          // Arbitrated BW BytesPerSec = 671088640 (5  x 1024 X 1024 x 1024)/8
          package()
          {
            "BUSARB",
            Package()
            {
              3,                      // Req Type
              "ICBID_MASTER_USB3_2",  // Master
              "ICBID_SLAVE_EBI1",     // Slave
              671088640,              // IB=5Gbps
              671088640               // AB=5Gbps
            }
          },

          //Nominal==block vdd_min:
          package()
          {
            "NPARESOURCE",
            Package() {1, "/arc/client/rail_cx", 256}
          },

          // Vote for CNOC 100 MHz - 400 MB/s IB-only (AB = 0) 
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          //BUS Arbiter Request (Type-3)
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_2",       // Slave
              400000000,                  // IB=400 MBps
              0                           // AB=0 MBps
            }
          },

         // Enable SS Phy Reference Clock (diff clock) 1 = Enable (Source controlled by RPMH clock/ LNBBCLK)
         package() {"CLOCK", package() {"gcc_usb3_mp0_clkref_en", 1}},
         package() {"CLOCK", package() {"gcc_usb3_mp1_clkref_en", 1}},
        },
        package()
        { // HOST D1
          "DSTATE", // D1 state (Suspend State - HS Suspend + SS disconnect /SS Suspend + HS disconnect/ HS + SS suspend)
          0x1,

          // Enable usb30_mp_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_mp_gdsc",   // USB 3.0 Core Power domain
              1,                   //1==Enable
            },
          },

          //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          package() {"CLOCK", package() {"gcc_usb30_mp_master_clk", 3, 9600, 5}},

          // Disable USB 3.0 Master Clock  2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_mp_master_clk", 2}},

          // gcc_cfg_noc_usb3_mp_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_mp_axi_clk", 2}},

          //Disable aggre_usb3_mp_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_mp_axi_clk", 2}},

          // Disable UTMI clk 2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_mp_mock_utmi_clk", 2}},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_2",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
          package() {"CLOCK", package() { "gcc_usb3_mp_phy_aux_clk", 2}},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package() {"CLOCK", package() {"gcc_usb3_mp_phy_com_aux_clk", 2}},

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          package() {"CLOCK", package() {"gcc_usb3_mp0_clkref_en", 2}},
          package() {"CLOCK", package() {"gcc_usb3_mp1_clkref_en", 2}},
      
          //BUS Arbiter Request (Type-3)
          //Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                    // Req Type
              "ICBID_MASTER_USB3_2",// Master
              "ICBID_SLAVE_EBI1",   // Slave
              0,                    // IB=0 Mbps
              0                     // AB=0Mbps
            }
          },

          //enable vdd_min
          package()
          {
            "NPARESOURCE",
            package() { 1, "/arc/client/rail_cx", 0}
          },

          package()
          {
            "PMICVREGVOTE",
            package()                                         //Vote for L12 @1.8v
            {
              // L12 - VDDA_QUSB_HS0_1P8
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage         : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            "PMICVREGVOTE",                                   // PMICVREGVOTE resource
            package()                                         // Vote for L16 @3.072v
            {
              // L16E - VDDA_QUSB_HS0_3P1
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              3072000,                                        // Voltage = 3.072 V
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            // L3C is used for QMP PHY
            // VDDA_USB_SS_1P2 (V_L2A_USB_SS_1P2)
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @1.2v
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1200000,                                        // Voltage 1.2V        : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            // VDDA_USB_SS_CORE
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L9 @ 0.912v
            {
              "PPP_RESOURCE_ID_LDO9_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              912000,                                         // Voltage (microvolts)
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          // VDDA_QUSB0_HS
          Package()    
          {
             "PMICVREGVOTE",    
             Package()
             {                                    
              "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
              1,                             // Voltage Regulator type = LDO
              880000,                        // Voltage is in micro volts
              1,                             // force enable from software
              4,                             // power mode - LPM
              0,                             // head room voltage
             },
          },
        },
        package()
        { // HOST D2
          "DSTATE",
          0x2,  // Slave device disconnect (host cable is still connected)

          //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          package() {"CLOCK", package() {"gcc_usb30_mp_master_clk", 3, 9600000, 1}},

          // Disable USB 3.0 Master Clock  2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_mp_master_clk", 2}},

          // gcc_cfg_noc_usb3_mp_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_mp_axi_clk", 2}},

          // Disable aggre_usb3_mp_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_mp_axi_clk", 2}},

          // Disable UTMI clk 2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_mp_mock_utmi_clk", 2}},

          // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_mp_phy_aux_clk", 2 }},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package() {"CLOCK", package() {"gcc_usb3_mp_phy_com_aux_clk", 2}},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_2",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          package() {"CLOCK", package() {"gcc_usb3_mp0_clkref_en", 2}},
          package() {"CLOCK", package() {"gcc_usb3_mp1_clkref_en", 2}},


          // Enable usb30_mp_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_mp_gdsc",   // USB 3.0 Core Power domain
              1,                   //1==Enable
            },
          },

          //Vote for 0 freq
          package()
          {
            "BUSARB",
            Package()
            {
              3,                      // Req Type
              "ICBID_MASTER_USB3_2",  // Master
              "ICBID_SLAVE_EBI1",     // Slave
               0,                     // IB=0 Mbps
               0                      // AB=0Mbps
            }
          },

          //enable vdd_min
          package()
          {
            "NPARESOURCE",
            package() { 1, "/arc/client/rail_cx", 0}
          },

          //Power Grid for SDM1000
          package()
          {
            "PMICVREGVOTE",
            package()                                         //Vote for L12 @1.8v
            {
              // L12 - VDDA_QUSB_HS0_1P8
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              1800000,                                        // Voltage         : microvolts ( V )
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            "PMICVREGVOTE",                                   // PMICVREGVOTE resource
            package()                                         // Vote for L16 @3.072v
            {
              // L16E - VDDA_QUSB_HS0_3P1
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              3072000,                                        // Voltage = 3.072 V
              1,                                              // SW Enable = Enable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },

          package()
          {
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @ 0v - VDDA_USB_SS_1P2
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              0,                                              // Voltage 0 V        : microvolts ( V )
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",                                   // PMIC VREG resource - VDDA_USB_SS_CORE
            package()                                         // Vote for L5 @ 0 v
            {
              "PPP_RESOURCE_ID_LDO9_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              0,                                              // Voltage (microvolts)
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          // VDDA_QUSB0_HS
          Package()    
          {
             "PMICVREGVOTE",    
             Package()
             {                                    
              "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
              1,                             // Voltage Regulator type = LDO
              880000,                        // Voltage is in micro volts
              1,                             // force enable from software
              4,                             // power mode - LPM
              0,                             // head room voltage
             },
          },
        },
        package()
        { // HOST D3
          "DSTATE",
          0x3, // Abandon state

          //set frequency @9.6Mhz to avoid issues w/ sync gcc_snoc_bus_timeout2_ahb_clk in SVS
          package() {"CLOCK", package() {"gcc_usb30_mp_master_clk", 3, 9600000, 1}},

          // Disable USB 3.0 Master Clock  2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_mp_master_clk", 2}},

          // gcc_cfg_noc_usb3_mp_axi_clk should be configured to the frequency as master clock
          package() {"CLOCK", package() {"gcc_cfg_noc_usb3_mp_axi_clk", 2}},

          // Disable aggre_usb3_mp_axi
          package() {"CLOCK", package() {"gcc_aggre_usb3_mp_axi_clk", 2}},

          // Disable UTMI clk 2 = Disable
          package() {"CLOCK", package() {"gcc_usb30_mp_mock_utmi_clk", 2}},

          // Disable Phy Aux Clock @ 1.2 Mhz 2 = Disable;
          package(){"CLOCK", package() {"gcc_usb3_mp_phy_aux_clk", 2 }},

          // Disable Phy Com Aux Clock @ 19.2 Mhz 2 = Disable;
          package() {"CLOCK", package() {"gcc_usb3_mp_phy_com_aux_clk", 2}},

          // Remove Vote for CNOC 100 MHz
          // Required for gcc_usb_phy_cfg_ahb2phy_clk
          // BUS Arbiter Request (Type-3)
          // Vote for 0 freq
          package()
          {
            "BUSARB",
            package()
            {
              3,                          // Req Type
              "ICBID_MASTER_APPSS_PROC",  // Master
              "ICBID_SLAVE_USB3_2",       // Slave
              0,                          // IB=0 MBps
              0                           // AB=0 MBps
            }
          },

          // Disable SS Phy Reference Clock (diff clock) 2 = Disable
          package() {"CLOCK", package() {"gcc_usb3_mp0_clkref_en", 2}},
          package() {"CLOCK", package() {"gcc_usb3_mp1_clkref_en", 2}},

          // Disable usb30_mp_gdsc power domain
          package()
          {
            "FOOTSWITCH",       // Footswitch
            package()
            {
              "usb30_mp_gdsc",   // USB 3.0 Core Power domain
              2,                   // 2==Disable
            },
          },

          //Vote for 0 freq
          package()
          {
            "BUSARB",
             package()
             {
               3,                    // Req Type
               "ICBID_MASTER_USB3_2",// Master
               "ICBID_SLAVE_EBI1",   // Slave
               0,                    // IB=0 Mbps
               0                     // AB=0Mbps
             }
           },

          //enable vdd_min
          package() {"NPARESOURCE", package() {1, "/arc/client/rail_cx", 0}},

          //Power Grid for SDM1000
          package()
          {
            "PMICVREGVOTE",                                   // PMICVREGVOTE resource
            package()                                         // Vote for L16 @ 0V - VDDA_QUSB_HS0_3P1
            {
              "PPP_RESOURCE_ID_LDO16_E",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type 1 = LDO
              0,                                              // Voltage = 0 V
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",
            package()                                         // Vote for L12 @ 0V - VDDA_QUSB_HS0_1P8
            {
              "PPP_RESOURCE_ID_LDO12_A",                      // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              0,                                              // Voltage         : 0 microvolts ( V )
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",                                   // PMIC VREG resource
            package()                                         // Vote for L3 @ 0v - VDDA_USB_SS_1P2
            {
              "PPP_RESOURCE_ID_LDO3_C",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              0,                                              // Voltage 0 V        : microvolts ( V )
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          package()
          {
            "PMICVREGVOTE",                                   // PMIC VREG resource - VDDA_USB_SS_CORE
            package()                                         // Vote for L5 @ 0 v
            {
              "PPP_RESOURCE_ID_LDO9_E",                       // Voltage Regulator ID
              1,                                              // Voltage Regulator type = LDO
              0,                                              // Voltage (microvolts)
              0,                                              // SW Enable = Disable
              4,                                              // SW Power Mode = LPM
              0,                                              // Head Room
            },
          },
          // VDDA_QUSB0_HS
          Package()    
          {
             "PMICVREGVOTE",    
             Package()
             {                                    
              "PPP_RESOURCE_ID_LDO5_E",      // VREG ID
              1,                             // Voltage Regulator type = LDO
              0,                             // Voltage is in micro volts
              0,                             // SW Enable = Disable
              4,                             // power mode - LPM
              0,                             // head room voltage
             },
          },
        },
        // Define Abandon State for MP0 (host) stack ie. Power State invoked when stack unloads/tears down
        package()
        {
          "ABANDON_DSTATE",
          3                                                   // Abandon D state defined as D3
        },
      },  //End USB2

    })
}