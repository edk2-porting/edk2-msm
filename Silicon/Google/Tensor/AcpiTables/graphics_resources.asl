//--------------------------------------------------------------------------------------------------
// GfxXMLToACPI Version 2.3.
//--------------------------------------------------------------------------------------------------

Scope(\_SB_.PEP0)
{
    //-----------------------------------------------------------------------------------------
    //  GRAPHICS, DISPLAY, and VIDEO resources
    //
    //  !!WARNING: The below table entries are auto-generated and are part of several
    //             interdependent ACPI methods that are all auto-generated from a single source.
    //             These components should NOT be edited by hand, as they must stay in sync
    //             with all other dependent graphics methods.
    //-----------------------------------------------------------------------------------------
    //  OWNING DRIVER: qcdxkm850.sys
    //
    //  HW CONTROLLED: 3D core
    //                 MDP core
    //                 Internal display circuitry
    //                 HDMI circuitry
    //                 Rotator core
    //                 Video Decode core
    //
    //  COMPONENTS:
    //                 C0 - Internal (Primary) Display Power States
    //                 C1 - 3D Graphics Engine Power States
    //                 C2 - MDP BLT Engine Power States
    //                 C3 - Rotator Engine Power States
    //                 C4 - Video Engine Power States
    //                 C5 - Crypto Engine Power States
    //                 C6 - Video Encoder Engine Power States
    //                 C7 - Internal (Secondary) Display Power States
    //                 C8 - Display Port Power States
    //                 C9 - Dummy Component for WP Workaround
    //-----------------------------------------------------------------------------------------
    //
    
    //--------------------------------------------------------------------------------------
    //  Complete list of individual component methods
    //--------------------------------------------------------------------------------------
    //
    Method (GPMD)
    {
        Name (LIST, Package()
        {
            "METHOD_LIST",
            
            // Note that the end-for-end reversal of method names in this list is deliberate.
            //
            "DM0G",
            "DM1G",
            "DM2G",
            "DM3G",
            "DM4G",
            "DM5G",
            "DM6G",
            "DM7G",
            "DM8G",
            "DM9G",
        })
        
        Return (LIST)
    }
    
    //--------------------------------------------------------------------------------------
    //  C0  (qcdxkm850.sys) - Internal (Primary) Display Power States
    //--------------------------------------------------------------------------------------
    //
    Method (G0MD)
    {
        Name (GPCC, Package()
        {
            Package()
            {
                "DEVICE",
                "\\_SB.GPU0",
            
                Package()
                {
                    "COMPONENT",
                    0,
                    
                    
                    //----------------------------------------------------------------------------------
                    //  C0.F0  (qcdxkm850.sys) - Internal (Primary) Display Power States
                    //
                    //  - Empty state
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        0,
                    },
                    
                    //----------------------------------------------------------------------------------
                    //  C0.F1  (qcdxkm850.sys) - Internal (Primary) Display Power States
                    //
                    //  o Footswitches
                    //  -- BIMC_SMMU and MDSS footswitches
                    //  o CLOCKS
                    //  -- MDSS buses AHB / AXI
                    //  -- MDSS clocks (Vsync, core)
                    //  -- Interface, escape, byte and pixel clocks
                    //  -- SMMU MDP AXI clocks
                    //  -- South REFGEN
                    //  o RAILs
                    //  -- LDO1     69.4mA@0.88V  (VDDA_MIPI_DSI_0_PLL_0P9, VDDA_MIPI_DSI_1_PLL_0P9, VDDA_MIPI_DSI0_0P9_ALT, VDDA_MIPI_DSI1_0P9_ALT)
                    //  -- LDO26    21.8mA@1.20V  (VDDA_MIPI_DSI0_1P2, VDDA_MIPI_DSI1_1P2)
                    //  -- LDO14    320mA@1.88V   (DISP_WQHD_VDDIO (4K) for panel digital IO)
                    //  -- SMPS6    33.4mA@0.8V   (VDDA_MIPI_DSI0_0P9, VDDA_MIPI_DSI1_0P9)
                    //  o GPIOs
                    //  -- MDP TE pin pull down (pin 10)
                    //  o WLED
                    //  -- WLED control
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        1,
                        
                        // Actions to take when entering this F-State
                        //
                        Package()
                        {
                            "ENTER",
                            
                            Package() { "PSTATE_SAVE" },
                            Package() { "PSTATE_ADJUST", Package() { 3, 12 }},
                            Package() { "PSTATE_ADJUST", Package() { 4, 42 }},
                            Package() { "PSTATE_ADJUST", Package() { 2, 4 }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "mdss_core_gdsc",    2    }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_disp_ahb_clk",      2   }},
                            Package() { "CLOCK", Package() { "gcc_disp_xo_clk",       2   }},
                            Package() { "CLOCK", Package() { "phy_refgen_south",      2   }},
                            
                            Package()
                            {
                                "PMICVREGVOTE",
                                Package()
                                {
                                    "PPP_RESOURCE_ID_LDO1_A",
                                    1,           // Voltage Regulator Type, 1 = LDO
                                    0,           // Voltage (uV)
                                    0,           // Enable
                                    0,           // Power Mode
                                    0,           // Headroom
                                    "HLOS_DRV",  // DRV ID
                                    "REQUIRED",  // Set type
                                },
                            },
                            
                            Package()
                            {
                                "PMICVREGVOTE",
                                Package()
                                {
                                    "PPP_RESOURCE_ID_LDO26_A",
                                    1,           // Voltage Regulator Type, 1 = LDO
                                    0,           // Voltage (uV)
                                    0,           // Enable
                                    0,           // Power Mode
                                    0,           // Headroom
                                    "HLOS_DRV",  // DRV ID
                                    "REQUIRED",  // Set type
                                },
                            },
                            
                            Package()
                            {
                                "PMICVREGVOTE",
                                Package()
                                {
                                    "PPP_RESOURCE_ID_LDO14_A",
                                    1,           // Voltage Regulator Type, 1 = LDO
                                    0,           // Voltage (uV)
                                    0,           // Enable
                                    0,           // Power Mode
                                    0,           // Headroom
                                    "HLOS_DRV",  // DRV ID
                                    "REQUIRED",  // Set type
                                },
                            },
                            
                            Package()
                            {
                                "PMICVREGVOTE",
                                Package()
                                {
                                    "PPP_RESOURCE_ID_SMPS6_A",
                                    2,           // Voltage Regulator Type, 2 = SMPS
                                    0,           // Voltage (uV)
                                    0,           // Enable
                                    0,           // Power Mode
                                    0,           // Headroom
                                    "HLOS_DRV",  // DRV ID
                                    "REQUIRED",  // Set type
                                },
                            },
                            
                            Package()
                            {
                                "PMICWLED",
                                Package()
                                {
                                    "IOCTL_PM_WLED_MODULE_ENABLE",
                                    1,       // PMI8998
                                    0,       // WLED Disabled
                                },
                            },
                            
                            Package()
                            {
                                "TLMMGPIO",
                                Package()
                                {
                                     10,  // TLMM GPIO       :  10 = Display TE pin
                                      1,  // State           :   1 = HIGH
                                      0,  // Function Select :   0 = ??
                                      0,  // Direction       :   0 = INPUT
                                      1,  // Pull Type       :   1 = PULL_DOWN
                                      0,  // Drive Strength  :   0 = 2mA
                                },
                            },
                            
                            Package()
                            {
                                "NPARESOURCE",
                                Package()
                                {
                                      0,   // 0 : Not Required, 1: Required
                                    "/arc/client/rail_cx",
                                     64,   // Resource Value
                                },
                            },
                        },
                        
                        // Actions to take when exiting this F-State
                        //
                        Package()
                        {
                            "EXIT",
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_disp_xo_clk",       1   }},
                            Package() { "CLOCK", Package() { "gcc_disp_ahb_clk",      1   }},
                            
                            // Action:       1 == ENABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "mdss_core_gdsc",    1    }},
                            
                            Package() { "PSTATE_RESTORE" },
                            Package() { "PSTATE_ADJUST", Package() { 3, 10 }},
                            
                            Package()
                            {
                                "PMICVREGVOTE",
                                Package()
                                {
                                    "PPP_RESOURCE_ID_LDO1_A",
                                    1,           // Voltage Regulator Type, 1 = LDO
                                    880000,      // Voltage (uV)
                                    1,           // Enable
                                    7,           // Power Mode
                                    0,           // Headroom
                                    "HLOS_DRV",  // DRV ID
                                    "REQUIRED",  // Set type
                                },
                            },
                            
                            Package()
                            {
                                "PMICVREGVOTE",
                                Package()
                                {
                                    "PPP_RESOURCE_ID_LDO26_A",
                                    1,           // Voltage Regulator Type, 1 = LDO
                                    1200000,     // Voltage (uV)
                                    1,           // Enable
                                    7,           // Power Mode
                                    0,           // Headroom
                                    "HLOS_DRV",  // DRV ID
                                    "REQUIRED",  // Set type
                                },
                            },
                            
                            Package()
                            {
                                "PMICVREGVOTE",
                                Package()
                                {
                                    "PPP_RESOURCE_ID_LDO14_A",
                                    1,           // Voltage Regulator Type, 1 = LDO
                                    1880000,     // Voltage (uV)
                                    1,           // Enable
                                    7,           // Power Mode
                                    0,           // Headroom
                                    "HLOS_DRV",  // DRV ID
                                    "REQUIRED",  // Set type
                                },
                            },
                            
                            Package()
                            {
                                "PMICVREGVOTE",
                                Package()
                                {
                                    "PPP_RESOURCE_ID_SMPS6_A",
                                    2,           // Voltage Regulator Type, 2 = SMPS
                                    800000,      // Voltage (uV)
                                    1,           // Enable
                                    7,           // Power Mode
                                    0,           // Headroom
                                    "HLOS_DRV",  // DRV ID
                                    "REQUIRED",  // Set type
                                },
                            },
                            
                            Package()
                            {
                                "PMICWLED",
                                Package()
                                {
                                    "IOCTL_PM_WLED_MODULE_ENABLE",
                                    1,       // PMI8998
                                    1,       // WLED Enabled
                                },
                            },
                            
                            Package()
                            {
                                "TLMMGPIO",
                                Package()
                                {
                                     10,  // TLMM GPIO       :  10 = Display TE pin
                                      1,  // State           :   1 = HIGH
                                      1,  // Function Select :   1 = ??
                                      0,  // Direction       :   0 = INPUT
                                      0,  // Pull Type       :   0 = NOPULL
                                      0,  // Drive Strength  :   0 = 2mA
                                },
                            },
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "phy_refgen_south",      1   }},
                            
                            Package()
                            {
                                "NPARESOURCE",
                                Package()
                                {
                                      1,   // 0 : Not Required, 1: Required
                                    "/arc/client/rail_cx",
                                     64,   // Resource Value
                                },
                            },
                        },
                    },
                    
                    //----------------------------------------------------------------------------------
                    // Default F-States
                    //     INIT    - Assume we're already in this state when the PEP first loads.
                    //     PRELOAD - Use this state until our driver is loaded for the first time.
                    //     ABANDON - Use this state after our driver has been unloaded.
                    //----------------------------------------------------------------------------------
                    //
                    Package() { "INIT_FSTATE", 1 },
                    Package() { "PRELOAD_FSTATE", 0 },
                    Package() { "ABANDON_FSTATE", 0 },
                    
                    //----------------------------------------------------------------------------------
                    // C0.PS0 - Internal (Primary) Display: MDP Reset Control
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        0,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        //----------------------------------------------------------------------------------
                        //  - Do Nothing
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            0,
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Reset Display Core
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            1,
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 0 },
                        Package() { "PREPARE_PSTATE", 0 },
                        Package() { "ABANDON_PSTATE", 0 },
                    },
                    //----------------------------------------------------------------------------------
                    // C0.PS1 - Internal Display: MDP Footswitch override
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        1,
                        
                        //----------------------------------------------------------------------------------
                        //  - Footswitch On
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            0,
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_disp_xo_clk",       1   }},
                            Package() { "CLOCK", Package() { "gcc_disp_ahb_clk",      1   }},
                            
                            // Action:       1 == ENABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "mdss_core_gdsc",    1    }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Footswitch Off
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            1,
                            
                            // Action:       2 == DISABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "mdss_core_gdsc",    2    }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_disp_ahb_clk",      2   }},
                            Package() { "CLOCK", Package() { "gcc_disp_xo_clk",       2   }},
                        },
                    },
                    //----------------------------------------------------------------------------------
                    // C0.PS2 - Internal (Primary) Display: Power states for MDP scan-out HW
                    //
                    // @Brief:
                    // - Used to dynamically control MDP related clocks within a PState
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        2,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        //----------------------------------------------------------------------------------
                        //  - Vote for all scan-out resources
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            0,
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_ahb_clk",        1   }},
                            Package() { "CLOCK", Package() { "gcc_disp_axi_clk",            1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_axi_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_vsync_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_ahb_clk",   1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_vsync_clk", 1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_pclk0_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_esc0_clk",       1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte0_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte0_intf_clk", 1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_pclk1_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_esc1_clk",       1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte1_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte1_intf_clk", 1   }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Vote for only MDP, DSI 0 and DSI 1 scan-out resources
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            1,
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_ahb_clk",        1   }},
                            Package() { "CLOCK", Package() { "gcc_disp_axi_clk",            1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_axi_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_vsync_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_ahb_clk",   1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_vsync_clk", 1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_pclk0_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_esc0_clk",       1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte0_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte0_intf_clk", 1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_pclk1_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_esc1_clk",       1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte1_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte1_intf_clk", 1   }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Vote for only MDP and DSI 0 scan-out resources
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            2,
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                            
                            // Action:       1 == ENABLE
                            //               2 == DISABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_ahb_clk",        1   }},
                            Package() { "CLOCK", Package() { "gcc_disp_axi_clk",            1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_axi_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_vsync_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_ahb_clk",   1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_vsync_clk", 1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_pclk0_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_esc0_clk",       1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte0_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte0_intf_clk", 1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_pclk1_clk",      2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_esc1_clk",       2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte1_clk",      2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte1_intf_clk", 2   }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Vote for only MDP and DSI 1 scan-out resources
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            3,
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                            
                            // Action:       1 == ENABLE
                            //               2 == DISABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_ahb_clk",        1   }},
                            Package() { "CLOCK", Package() { "gcc_disp_axi_clk",            1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_axi_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_vsync_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_ahb_clk",   1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_vsync_clk", 1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_pclk0_clk",      2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_esc0_clk",       2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte0_clk",      2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte0_intf_clk", 2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_pclk1_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_esc1_clk",       1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte1_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte1_intf_clk", 1   }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Remove votes for all scan-out resources
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            4,
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",        2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_vsync_clk",      2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_ahb_clk",   2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_vsync_clk", 2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_pclk0_clk",      2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_esc0_clk",       2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte0_clk",      2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte0_intf_clk", 2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_pclk1_clk",      2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_esc1_clk",       2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte1_clk",      2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte1_intf_clk", 2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_axi_clk",        2   }},
                            Package() { "CLOCK", Package() { "gcc_disp_axi_clk",            2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_ahb_clk",        2   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",          0,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 0 },
                        Package() { "PREPARE_PSTATE", 0 },
                        Package() { "ABANDON_PSTATE", 0 },
                    },
                    //----------------------------------------------------------------------------------
                    // C0.PS3 - Internal (Primary) Display: MDP Core Clock Frequency
                    //
                    // @Brief:
                    // Notes:
                    // - This table reflects the frequency plan for the v1 part.
                    // - All core frequency votes are based on specific clock plan values and are cast
                    //   2 MHz below what we actually desire. This helps avoid potential issues with
                    //   round-up when the actual clock frequency on real HW is slightly less than
                    //   that which was advertized in the clock plan.
                    // - [NC] Temporarily moved all AHB bandwidth votes to F-states to help work around
                    //   64K size issue in the final AML.
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        3,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 1
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            0,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       430000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  298000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            1,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       412500000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  298000000,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            2,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       344000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  148000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            3,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       300000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  148000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            4,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       275000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  148000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            5,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       200000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  148000000,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 3
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            6,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       171428571,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            7,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       165000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            8,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       150000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            9,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       100000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            10,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,        85710000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            11,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,        19200000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            12,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,               0,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",          0,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 4 },
                        Package() { "PREPARE_PSTATE", 4 },
                        Package() { "ABANDON_PSTATE", 4 },
                    },
                    //----------------------------------------------------------------------------------
                    // C0.PS4 - Internal (Primary) Display: Display Bandwidth to EBI
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        4,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 0
                        //----------------------------------------------------------------------------------
                        
                        //                                                          Req                                                                      IB           AB
                        //                                                          Type           Master                         Slave                    Bytes/Sec    Bytes/Sec
                        //                                                          ----   -----------------------        ----------------------           ----------   ----------
                        Package() { "PSTATE",   0, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 13326000000, 13326000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 13326000000 }},
                        },
                        Package() { "PSTATE",   1, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 12926000000, 12926000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 12926000000 }},
                        },
                        Package() { "PSTATE",   2, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 12526000000, 12526000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 12526000000 }},
                        },
                        Package() { "PSTATE",   3, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 12126000000, 12126000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 12126000000 }},
                        },
                        Package() { "PSTATE",   4, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 11726000000, 11726000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 11726000000 }},
                        },
                        Package() { "PSTATE",   5, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 11326000000, 11326000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 11326000000 }},
                        },
                        Package() { "PSTATE",   6, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 10926000000, 10926000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 10926000000 }},
                        },
                        Package() { "PSTATE",   7, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 10526000000, 10526000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 10526000000 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 1
                        //----------------------------------------------------------------------------------
                        
                        //                                                          Req                                                                      IB           AB
                        //                                                          Type           Master                         Slave                    Bytes/Sec    Bytes/Sec
                        //                                                          ----   -----------------------        ----------------------           ----------   ----------
                        Package() { "PSTATE",   8, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 10126000000, 10126000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 10126000000 }},
                        },
                        Package() { "PSTATE",   9, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 9600000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 9600000000 }},
                        },
                        Package() { "PSTATE",  10, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 9200000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 9200000000 }},
                        },
                        Package() { "PSTATE",  11, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 8800000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 8800000000 }},
                        },
                        Package() { "PSTATE",  12, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 8400000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 8400000000 }},
                        },
                        Package() { "PSTATE",  13, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 8000000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 8000000000 }},
                        },
                        Package() { "PSTATE",  14, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 7600000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 7600000000 }},
                        },
                        Package() { "PSTATE",  15, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 7200000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 7200000000 }},
                        },
                        Package() { "PSTATE",  16, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 6800000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 6800000000 }},
                        },
                        Package() { "PSTATE",  17, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 6400000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 6400000000 }},
                        },
                        Package() { "PSTATE",  18, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 6000000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 6000000000 }},
                        },
                        Package() { "PSTATE",  19, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 5600000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 5600000000 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        //                                                          Req                                                                      IB           AB
                        //                                                          Type           Master                         Slave                    Bytes/Sec    Bytes/Sec
                        //                                                          ----   -----------------------        ----------------------           ----------   ----------
                        Package() { "PSTATE",  20, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 5200000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 5200000000 }},
                        },
                        Package() { "PSTATE",  21, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 4800000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 4800000000 }},
                        },
                        Package() { "PSTATE",  22, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 4400000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 4400000000 }},
                        },
                        Package() { "PSTATE",  23, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 4000000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 4000000000 }},
                        },
                        Package() { "PSTATE",  24, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 3600000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 3600000000 }},
                        },
                        Package() { "PSTATE",  25, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 3200000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 3200000000 }},
                        },
                        Package() { "PSTATE",  26, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 8400000000, 2800000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 2800000000 }},
                        },
                        Package() { "PSTATE",  27, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 7200000000, 2400000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 2400000000 }},
                        },
                        Package() { "PSTATE",  28, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 6000000000, 2000000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 2000000000 }},
                        },
                        Package() { "PSTATE",  29, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000, 1600000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 1600000000 }},
                        },
                        Package() { "PSTATE",  30, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000, 1500000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 1500000000 }},
                        },
                        Package() { "PSTATE",  31, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000, 1400000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 1400000000 }},
                        },
                        Package() { "PSTATE",  32, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000, 1300000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 1300000000 }},
                        },
                        Package() { "PSTATE",  33, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000, 1200000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 1200000000 }},
                        },
                        Package() { "PSTATE",  34, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000, 1100000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 1100000000 }},
                        },
                        Package() { "PSTATE",  35, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000, 1000000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 1000000000 }},
                        },
                        Package() { "PSTATE",  36, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000,  900000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000,  900000000 }},
                        },
                        Package() { "PSTATE",  37, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000,  800000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000,  800000000 }},
                        },
                        Package() { "PSTATE",  38, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000,  700000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000,  700000000 }},
                        },
                        Package() { "PSTATE",  39, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000,  600000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000,  600000000 }},
                        },
                        Package() { "PSTATE",  40, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000,  500000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000,  500000000 }},
                        },
                        Package() { "PSTATE",  41, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000,  400000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000,  400000000 }},
                        },
                        Package() { "PSTATE",  42, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC",          0,          0 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",                     0,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 28 },
                        Package() { "PREPARE_PSTATE", 28 },
                        Package() { "ABANDON_PSTATE", 28 },
                    },
                },
            },
        })
        
        Return (GPCC)
    }
    
    //--------------------------------------------------------------------------------------
    //  C1  (qcdxkm850.sys) - 3D Graphics Engine Power States
    //--------------------------------------------------------------------------------------
    //
    Method (G1MD)
    {
        Name (GPCC, Package()
        {
            Package()
            {
                "DEVICE",
                "\\_SB.GPU0",
            
                Package()
                {
                    "COMPONENT",
                    1,
                    
                    
                    //----------------------------------------------------------------------------------
                    //  C1.F0  (qcdxkm850.sys) - 3D Graphics Engine Power States
                    //
                    //  State:
                    //      - Enable the AHB Clock
                    //      - Enable the BIMC Clock?
                    //      - Enable the CX Headswitch
                    //      - Enable the GMU Clock
                    //      - Set the GMU Clock to 200 MHz
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        0,
                        
                        // Actions to take when entering this F-State
                        //
                        Package()
                        {
                            "ENTER",
                            Package() { "PSTATE_ADJUST", Package() { 1, 1 }},
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gpu_cc_cxo_clk",         1   }},
                            Package() { "CLOCK", Package() { "gpu_cc_cx_gmu_clk",      1   }},
                            Package() { "CLOCK", Package() { "gcc_gpu_memnoc_gfx_clk", 1   }},
                            Package() { "CLOCK", Package() { "gpu_cc_gx_gfx3d_clk",    1   }},
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    3 == CLOCK_FREQUENCY_HZ_CLOSEST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "gpu_cc_cx_gmu_clk",     3,       200000000,       3   }},
                            
                            //                               Req                                                             IB           AB
                            //                               Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------      ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_GFX3D",       "ICBID_SLAVE_EBI1",                1,          0 }},
                        },
                    },
                    
                    //----------------------------------------------------------------------------------
                    //  C1.F1  (qcdxkm850.sys) - 3D Graphics Engine Power States
                    //
                    //  State:
                    //      - Power off / Slumber
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        1,
                        
                        // Actions to take when entering this F-State
                        //
                        Package()
                        {
                            "ENTER",
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gpu_cc_gx_gfx3d_clk",    2   }},
                            Package() { "CLOCK", Package() { "gcc_gpu_memnoc_gfx_clk", 2   }},
                            Package() { "CLOCK", Package() { "gpu_cc_cx_gmu_clk",      2   }},
                            Package() { "CLOCK", Package() { "gpu_cc_cxo_clk",         2   }},
                            Package() { "PSTATE_ADJUST", Package() { 1, 2 }},
                        },
                    },
                    
                    //----------------------------------------------------------------------------------
                    //  C1.F2  (qcdxkm850.sys) - 3D Graphics Engine Power States
                    //
                    //  State:
                    //      - Power off / Standby - All resources off
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        2,
                        
                        // Actions to take when entering this F-State
                        //
                        Package()
                        {
                            "ENTER",
                            
                            //                               Req                                                             IB           AB
                            //                               Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------      ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_GFX3D",       "ICBID_SLAVE_EBI1",                0,          0 }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gpu_cc_gx_gfx3d_clk",    2   }},
                            Package() { "CLOCK", Package() { "gcc_gpu_memnoc_gfx_clk", 2   }},
                            Package() { "CLOCK", Package() { "gpu_cc_cx_gmu_clk",      2   }},
                            Package() { "CLOCK", Package() { "gpu_cc_cxo_clk",         2   }},
                            Package() { "PSTATE_ADJUST", Package() { 1, 2 }},
                        },
                    },
                    
                    //----------------------------------------------------------------------------------
                    // Default F-States
                    //     INIT    - Assume we're already in this state when the PEP first loads.
                    //     PRELOAD - Use this state until our driver is loaded for the first time.
                    //     ABANDON - Use this state after our driver has been unloaded.
                    //----------------------------------------------------------------------------------
                    //
                    Package() { "INIT_FSTATE", 1 },
                    Package() { "PRELOAD_FSTATE", 1 },
                    Package() { "ABANDON_FSTATE", 1 },
                    
                    //----------------------------------------------------------------------------------
                    // C1.PS0 - 3D Graphics Core P-State Set: Reset
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        0,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        //----------------------------------------------------------------------------------
                        //  - Do Nothing
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            0,
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Reset Graphics Core
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            1,
                            Package() { "PSTATE_ADJUST", Package() { 1, 2 }},
                            
                            Package()
                            {
                                "DELAY",
                                Package()
                                {
                                    1,           // Delay in milliseconds
                                }
                            },
                            Package() { "PSTATE_ADJUST", Package() { 1, 1 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 0 },
                        Package() { "PREPARE_PSTATE", 0 },
                        Package() { "ABANDON_PSTATE", 0 },
                    },
                    //----------------------------------------------------------------------------------
                    // C1.PS1 - 3D Graphics Core P-State Set: CX Headswitch Management
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        1,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        //----------------------------------------------------------------------------------
                        //  - Do Nothing
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            0,
                        },
                        
                        // Action:       1 == ENABLE
                        //               2 == DISABLE
                        //
                        //                                                              Domain Name          Action
                        //                                                              ----------------     ------
                        Package() { "PSTATE",   1, 
                                                   Package() { "FOOTSWITCH", Package() { "cx_gdsc",           1    }},
                        },
                        Package() { "PSTATE",   2, 
                                                   Package() { "FOOTSWITCH", Package() { "cx_gdsc",           2    }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 0 },
                        Package() { "PREPARE_PSTATE", 0 },
                        Package() { "ABANDON_PSTATE", 0 },
                    },
                    //----------------------------------------------------------------------------------
                    // C1.PS2 - 3D Graphics Core P-State Set: Footswitch override
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        2,
                        
                        //----------------------------------------------------------------------------------
                        //  - Footswitch On
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            0,
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Footswitch Off
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            1,
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 1 },
                        Package() { "PREPARE_PSTATE", 1 },
                        Package() { "ABANDON_PSTATE", 1 },
                    },
                },
            },
        })
        
        Return (GPCC)
    }
    
    //--------------------------------------------------------------------------------------
    //  C2  (qcdxkm850.sys) - MDP BLT Engine Power States
    //--------------------------------------------------------------------------------------
    //
    Method (G2MD)
    {
        Name (GPCC, Package()
        {
            Package()
            {
                "DEVICE",
                "\\_SB.GPU0",
            
                Package()
                {
                    "COMPONENT",
                    2,
                    
                    
                    //----------------------------------------------------------------------------------
                    //  C2.F0  (qcdxkm850.sys) - MDP BLT Engine Power States
                    //
                    //  State:
                    //  - None
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        0,
                    },
                    
                    //----------------------------------------------------------------------------------
                    //  C2.F1  (qcdxkm850.sys) - MDP BLT Engine Power States
                    //
                    //  State:
                    //  - MMSS MNOC AHB resource
                    //  - DISP MDP core clock control
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        1,
                        
                        // Actions to take when entering this F-State
                        //
                        Package()
                        {
                            "ENTER",
                            
                            Package() { "PSTATE_SAVE" },
                            Package() { "PSTATE_ADJUST", Package() { 2, 12 }},
                            Package() { "PSTATE_ADJUST", Package() { 3, 49 }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_vsync_clk", 2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_ahb_clk",   2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_vsync_clk",      2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",        2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_axi_clk",        2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_ahb_clk",        2   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",          0,          0 }},
                        },
                        
                        // Actions to take when exiting this F-State
                        //
                        Package()
                        {
                            "EXIT",
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_ahb_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_axi_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_vsync_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_ahb_clk",   1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_vsync_clk", 1   }},
                            
                            Package() { "PSTATE_RESTORE" },
                        },
                    },
                    
                    //----------------------------------------------------------------------------------
                    //  C2.F2  (qcdxkm850.sys) - MDP BLT Engine Power States
                    //
                    //  State:
                    //    - MMSS MNOC AHB resource
                    //    - DISP MDP core clock control
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        2,
                        
                        // Actions to take when entering this F-State
                        //
                        Package()
                        {
                            "ENTER",
                            
                            Package() { "PSTATE_SAVE" },
                            Package() { "PSTATE_ADJUST", Package() { 2, 12 }},
                            Package() { "PSTATE_ADJUST", Package() { 3, 49 }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_vsync_clk", 2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_ahb_clk",   2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_vsync_clk",      2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",        2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_axi_clk",        2   }},
                            Package() { "CLOCK", Package() { "gcc_disp_axi_clk",            2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_ahb_clk",        2   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",          0,          0 }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "mdss_core_gdsc",    2    }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_disp_ahb_clk",      2   }},
                            Package() { "CLOCK", Package() { "gcc_disp_xo_clk",       2   }},
                        },
                        
                        // Actions to take when exiting this F-State
                        //
                        Package()
                        {
                            "EXIT",
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_disp_xo_clk",       1   }},
                            Package() { "CLOCK", Package() { "gcc_disp_ahb_clk",      1   }},
                            
                            // Action:       1 == ENABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "mdss_core_gdsc",    1    }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "gcc_disp_axi_clk",            1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_axi_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_ahb_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_vsync_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_ahb_clk",   1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_vsync_clk", 1   }},
                            
                            Package() { "PSTATE_RESTORE" },
                        },
                    },
                    
                    //----------------------------------------------------------------------------------
                    // Default F-States
                    //     INIT    - Assume we're already in this state when the PEP first loads.
                    //     PRELOAD - Use this state until our driver is loaded for the first time.
                    //     ABANDON - Use this state after our driver has been unloaded.
                    //----------------------------------------------------------------------------------
                    //
                    Package() { "INIT_FSTATE", 0 },
                    Package() { "PRELOAD_FSTATE", 2 },
                    Package() { "ABANDON_FSTATE", 2 },
                    
                    //----------------------------------------------------------------------------------
                    // C2.PS0 - MDP BLT Core P-State Set: Reset
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        0,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        //----------------------------------------------------------------------------------
                        //  - Do Nothing
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            0,
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Reset Display Core
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            1,
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 0 },
                        Package() { "PREPARE_PSTATE", 0 },
                        Package() { "ABANDON_PSTATE", 0 },
                    },
                    //----------------------------------------------------------------------------------
                    // C2.PS1 - MDP BLT Core P-State Set: Footswitch override
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        1,
                        
                        //----------------------------------------------------------------------------------
                        //  - Footswitch On
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            0,
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_disp_xo_clk",       1   }},
                            Package() { "CLOCK", Package() { "gcc_disp_ahb_clk",      1   }},
                            
                            // Action:       1 == ENABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "mdss_core_gdsc",    1    }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Footswitch Off
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            1,
                            
                            // Action:       2 == DISABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "mdss_core_gdsc",    2    }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_disp_ahb_clk",      2   }},
                            Package() { "CLOCK", Package() { "gcc_disp_xo_clk",       2   }},
                        },
                    },
                    //----------------------------------------------------------------------------------
                    // C2.PS2 - MDP Core Performance: Core Clock Frequency
                    //
                    // @Brief:
                    // Notes:
                    // - All core frequency votes are based on specific clock plan values and are cast
                    //   2 MHz below what we actually desire.  This helps avoid potential issues with
                    //   round-up when the actual clock frequency on real HW is slightly less than
                    //   that which was advertized in the clock plan.
                    // - [NC] Temporarily moved all AHB bandwidth votes to F-states to help work around
                    //   64K size issue in the final AML.
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        2,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 1
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            0,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       430000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  298000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            1,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       412500000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  298000000,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            2,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       344000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  148000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            3,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       300000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  148000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            4,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       275000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  148000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            5,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       200000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  148000000,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 3
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            6,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       171428571,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            7,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       165000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            8,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       150000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            9,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       100000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            10,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,        85710000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            11,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,        19200000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            12,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,               0,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",          0,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 8 },
                        Package() { "PREPARE_PSTATE", 8 },
                        Package() { "ABANDON_PSTATE", 8 },
                    },
                    //----------------------------------------------------------------------------------
                    // C2.PS3 - MDP Core Performance: MDPBLT Bandwidth to EBI
                    //
                    // @Brief:
                    // Note (TODO: Update this comment):
                    // - AXI port 1 is strictly used by the BLT engine.  The BLT engine will have definite
                    //   modes of operation based on surface sizes and refresh rates.  Instead of bothering
                    //   to identify all possible modes, however, we simply build a table based on the
                    //   possible combination of frequency levels between the core and EBI.  With
                    //   arbitrated and instantaneous bandwidth requests, these frequency levels represent
                    //   all of the possible system configurations that can result from any request.
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        3,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 0
                        //----------------------------------------------------------------------------------
                        
                        //                                                          Req                                                             IB           AB
                        //                                                          Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                        //                                                          ----   -----------------------    ----------------------      ----------   ----------
                        Package() { "PSTATE",   0, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       13326000000, 13326000000 }},
                        },
                        Package() { "PSTATE",   1, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       12926000000, 12926000000 }},
                        },
                        Package() { "PSTATE",   2, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       12526000000, 12526000000 }},
                        },
                        Package() { "PSTATE",   3, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       12126000000, 12126000000 }},
                        },
                        Package() { "PSTATE",   4, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       11726000000, 11726000000 }},
                        },
                        Package() { "PSTATE",   5, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       11326000000, 11326000000 }},
                        },
                        Package() { "PSTATE",   6, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       10926000000, 10926000000 }},
                        },
                        Package() { "PSTATE",   7, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       10526000000, 10526000000 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 1
                        //----------------------------------------------------------------------------------
                        
                        //                                                          Req                                                             IB           AB
                        //                                                          Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                        //                                                          ----   -----------------------    ----------------------      ----------   ----------
                        Package() { "PSTATE",   8, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       10126000000, 10126000000 }},
                        },
                        Package() { "PSTATE",   9, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       9726000000, 9726000000 }},
                        },
                        Package() { "PSTATE",  10, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       9326000000, 9326000000 }},
                        },
                        Package() { "PSTATE",  11, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       8926000000, 8926000000 }},
                        },
                        Package() { "PSTATE",  12, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       8526000000, 8526000000 }},
                        },
                        Package() { "PSTATE",  13, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       8126000000, 8126000000 }},
                        },
                        Package() { "PSTATE",  14, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       7726000000, 7726000000 }},
                        },
                        Package() { "PSTATE",  15, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       7326000000, 7326000000 }},
                        },
                        Package() { "PSTATE",  16, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       6926000000, 6926000000 }},
                        },
                        Package() { "PSTATE",  17, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       6526000000, 6526000000 }},
                        },
                        Package() { "PSTATE",  18, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       6126000000, 6126000000 }},
                        },
                        Package() { "PSTATE",  19, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       5726000000, 5726000000 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        //                                                          Req                                                             IB           AB
                        //                                                          Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                        //                                                          ----   -----------------------    ----------------------      ----------   ----------
                        Package() { "PSTATE",  20, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       5326000000, 5326000000 }},
                        },
                        Package() { "PSTATE",  21, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       4926000000, 4926000000 }},
                        },
                        Package() { "PSTATE",  22, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       4526000000, 4526000000 }},
                        },
                        Package() { "PSTATE",  23, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       4126000000, 4126000000 }},
                        },
                        Package() { "PSTATE",  24, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       3726000000, 3726000000 }},
                        },
                        Package() { "PSTATE",  25, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       3326000000, 3326000000 }},
                        },
                        Package() { "PSTATE",  26, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       2926000000, 2926000000 }},
                        },
                        Package() { "PSTATE",  27, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       2526000000, 2526000000 }},
                        },
                        Package() { "PSTATE",  28, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       2400000000, 2400000000 }},
                        },
                        Package() { "PSTATE",  29, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       2300000000, 2300000000 }},
                        },
                        Package() { "PSTATE",  30, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       2200000000, 2200000000 }},
                        },
                        Package() { "PSTATE",  31, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       2100000000, 2100000000 }},
                        },
                        Package() { "PSTATE",  32, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       2000000000, 2000000000 }},
                        },
                        Package() { "PSTATE",  33, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       1900000000, 1900000000 }},
                        },
                        Package() { "PSTATE",  34, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       1800000000, 1800000000 }},
                        },
                        Package() { "PSTATE",  35, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       1700000000, 1700000000 }},
                        },
                        Package() { "PSTATE",  36, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       1600000000, 1600000000 }},
                        },
                        Package() { "PSTATE",  37, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       1500000000, 1500000000 }},
                        },
                        Package() { "PSTATE",  38, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       1400000000, 1400000000 }},
                        },
                        Package() { "PSTATE",  39, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       1300000000, 1300000000 }},
                        },
                        Package() { "PSTATE",  40, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       1200000000, 1200000000 }},
                        },
                        Package() { "PSTATE",  41, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       1100000000, 1100000000 }},
                        },
                        Package() { "PSTATE",  42, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",       1000000000, 1000000000 }},
                        },
                        Package() { "PSTATE",  43, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",        900000000,  900000000 }},
                        },
                        Package() { "PSTATE",  44, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",        800000000,  800000000 }},
                        },
                        Package() { "PSTATE",  45, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",        700000000,  700000000 }},
                        },
                        Package() { "PSTATE",  46, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",        600000000,  600000000 }},
                        },
                        Package() { "PSTATE",  47, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",        500000000,  500000000 }},
                        },
                        Package() { "PSTATE",  48, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",        400000000,  400000000 }},
                        },
                        Package() { "PSTATE",  49, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",        "ICBID_SLAVE_EBI1",                0,          0 }},
                        },
                    },
                },
            },
        })
        
        Return (GPCC)
    }
    
    //--------------------------------------------------------------------------------------
    //  C3  (qcdxkm850.sys) - Rotator Engine Power States
    //--------------------------------------------------------------------------------------
    //
    Method (G3MD)
    {
        Name (GPCC, Package()
        {
            Package()
            {
                "DEVICE",
                "\\_SB.GPU0",
            
                Package()
                {
                    "COMPONENT",
                    3,
                    
                    
                    //----------------------------------------------------------------------------------
                    //  C3.F0  (qcdxkm850.sys) - Rotator Engine Power States
                    //
                    //  State:
                    //  - None
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        0,
                    },
                    
                    //----------------------------------------------------------------------------------
                    //  C3.F1  (qcdxkm850.sys) - Rotator Engine Power States
                    //
                    //  State:
                    //  - MMSS MNOC AHB resource
                    //  - DISP MDP core clock control
                    //  - DISP ROT core clock control
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        1,
                        
                        // Actions to take when entering this F-State
                        //
                        Package()
                        {
                            "ENTER",
                            
                            Package() { "PSTATE_SAVE" },
                            Package() { "PSTATE_ADJUST", Package() { 2, 7 }},
                            Package() { "PSTATE_ADJUST", Package() { 3, 49 }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_vsync_clk", 2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_ahb_clk",   2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_vsync_clk",      2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",        2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_axi_clk",        2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rot_clk",        2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_ahb_clk",        2   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",          0,          0 }},
                        },
                        
                        // Actions to take when exiting this F-State
                        //
                        Package()
                        {
                            "EXIT",
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_ahb_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_axi_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_vsync_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_ahb_clk",   1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_vsync_clk", 1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rot_clk",        1   }},
                            
                            Package() { "PSTATE_RESTORE" },
                            Package() { "PSTATE_ADJUST", Package() { 2, 4 }},
                        },
                    },
                    
                    //----------------------------------------------------------------------------------
                    //  C3.F2  (qcdxkm850.sys) - Rotator Engine Power States
                    //
                    //  State:
                    //    - MMSS MNOC AHB resource
                    //    - DISP MDP core clock control
                    //    - DISP ROT core clock control
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        2,
                        
                        // Actions to take when entering this F-State
                        //
                        Package()
                        {
                            "ENTER",
                            
                            Package() { "PSTATE_SAVE" },
                            Package() { "PSTATE_ADJUST", Package() { 2, 7 }},
                            Package() { "PSTATE_ADJUST", Package() { 3, 49 }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_vsync_clk", 2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_ahb_clk",   2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_vsync_clk",      2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",        2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_axi_clk",        2   }},
                            Package() { "CLOCK", Package() { "gcc_disp_axi_clk",            2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rot_clk",        2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_ahb_clk",        2   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",          0,          0 }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "mdss_core_gdsc",    2    }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_disp_ahb_clk",      2   }},
                            Package() { "CLOCK", Package() { "gcc_disp_xo_clk",       2   }},
                        },
                        
                        // Actions to take when exiting this F-State
                        //
                        Package()
                        {
                            "EXIT",
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_disp_xo_clk",       1   }},
                            Package() { "CLOCK", Package() { "gcc_disp_ahb_clk",      1   }},
                            
                            // Action:       1 == ENABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "mdss_core_gdsc",    1    }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_ahb_clk",        1   }},
                            Package() { "CLOCK", Package() { "gcc_disp_axi_clk",            1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_axi_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_vsync_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_ahb_clk",   1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_vsync_clk", 1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rot_clk",        1   }},
                            
                            Package() { "PSTATE_RESTORE" },
                            Package() { "PSTATE_ADJUST", Package() { 2, 4 }},
                        },
                    },
                    
                    //----------------------------------------------------------------------------------
                    // Default F-States
                    //     INIT    - Assume we're already in this state when the PEP first loads.
                    //     PRELOAD - Use this state until our driver is loaded for the first time.
                    //     ABANDON - Use this state after our driver has been unloaded.
                    //----------------------------------------------------------------------------------
                    //
                    Package() { "INIT_FSTATE", 0 },
                    Package() { "PRELOAD_FSTATE", 2 },
                    Package() { "ABANDON_FSTATE", 2 },
                    
                    //----------------------------------------------------------------------------------
                    // C3.PS0 - Rotator Core P-State Set: Reset
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        0,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        //----------------------------------------------------------------------------------
                        //  - Do Nothing
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            0,
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Reset MDP Core
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            1,
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 0 },
                        Package() { "PREPARE_PSTATE", 0 },
                        Package() { "ABANDON_PSTATE", 0 },
                    },
                    //----------------------------------------------------------------------------------
                    // C3.PS1 - Rotator Core P-State Set: Footswitch override
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        1,
                        
                        //----------------------------------------------------------------------------------
                        //  - Footswitch On
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            0,
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_disp_xo_clk",       1   }},
                            Package() { "CLOCK", Package() { "gcc_disp_ahb_clk",      1   }},
                            
                            // Action:       1 == ENABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "mdss_core_gdsc",    1    }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Footswitch Off
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            1,
                            
                            // Action:       2 == DISABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "mdss_core_gdsc",    2    }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_disp_ahb_clk",      2   }},
                            Package() { "CLOCK", Package() { "gcc_disp_xo_clk",       2   }},
                        },
                    },
                    //----------------------------------------------------------------------------------
                    // C3.PS2 - Rotator Core P-State Set: Rotator Core Clock Frequency
                    //
                    // @Brief:
                    // Notes:
                    // - All core frequency votes are based on specific clock plan values and are cast
                    //   2 MHz below what we actually desire.  This helps avoid potential issues with
                    //   round-up when the actual clock frequency on real HW is slightly less than
                    //   that which was advertised in the clock plan.
                    // - This table reflects the frequency plans for the v1 and v2 parts.
                    // - [NC] Temporarily moved all AHB bandwidth votes to F-states to help work around
                    //   64K size issue in the final AML.
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        2,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 1
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            0,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rot_clk",  3,       430000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  298000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            1,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rot_clk",  3,       412500000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  298000000,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            2,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rot_clk",  3,       344000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  148000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            3,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rot_clk",  3,       300000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  148000000,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 3
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            4,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rot_clk",  3,       171428571,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            5,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rot_clk",  3,       165000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            6,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rot_clk",  3,        19200000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            7,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rot_clk",  3,               0,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",          0,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 5 },
                        Package() { "PREPARE_PSTATE", 5 },
                        Package() { "ABANDON_PSTATE", 5 },
                    },
                    //----------------------------------------------------------------------------------
                    // C3.PS3 - Rotator Core P-State Set: Rotator Bandwidth to EBI
                    //
                    // @Brief:
                    // Note (TODO - Update comment):
                    // - AXI port 1 is strictly used by the BLT engine.  The BLT engine will have definite
                    //   modes of operation based on surface sizes and refresh rates.  Instead of bothering
                    //   to identify all possible modes, however, we simply build a table based on the
                    //   possible combination of frequency levels between the core and EBI.  With
                    //   arbitrated and instantaneous bandwidth requests, these frequency levels represent
                    //   all of the possible system configurations that can result from any request.
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        3,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 0
                        //----------------------------------------------------------------------------------
                        
                        //                                                          Req                                                             IB           AB
                        //                                                          Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                        //                                                          ----   -----------------------    ----------------------      ----------   ----------
                        Package() { "PSTATE",   0, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       13326000000, 13326000000 }},
                        },
                        Package() { "PSTATE",   1, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       12926000000, 12926000000 }},
                        },
                        Package() { "PSTATE",   2, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       12526000000, 12526000000 }},
                        },
                        Package() { "PSTATE",   3, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       12126000000, 12126000000 }},
                        },
                        Package() { "PSTATE",   4, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       11726000000, 11726000000 }},
                        },
                        Package() { "PSTATE",   5, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       11326000000, 11326000000 }},
                        },
                        Package() { "PSTATE",   6, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       10926000000, 10926000000 }},
                        },
                        Package() { "PSTATE",   7, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       10526000000, 10526000000 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 1
                        //----------------------------------------------------------------------------------
                        
                        //                                                          Req                                                             IB           AB
                        //                                                          Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                        //                                                          ----   -----------------------    ----------------------      ----------   ----------
                        Package() { "PSTATE",   8, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       10126000000, 10126000000 }},
                        },
                        Package() { "PSTATE",   9, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       9726000000, 9726000000 }},
                        },
                        Package() { "PSTATE",  10, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       9326000000, 9326000000 }},
                        },
                        Package() { "PSTATE",  11, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       8926000000, 8926000000 }},
                        },
                        Package() { "PSTATE",  12, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       8526000000, 8526000000 }},
                        },
                        Package() { "PSTATE",  13, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       8126000000, 8126000000 }},
                        },
                        Package() { "PSTATE",  14, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       7726000000, 7726000000 }},
                        },
                        Package() { "PSTATE",  15, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       7326000000, 7326000000 }},
                        },
                        Package() { "PSTATE",  16, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       6926000000, 6926000000 }},
                        },
                        Package() { "PSTATE",  17, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       6526000000, 6526000000 }},
                        },
                        Package() { "PSTATE",  18, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       6126000000, 6126000000 }},
                        },
                        Package() { "PSTATE",  19, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       5726000000, 5726000000 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        //                                                          Req                                                             IB           AB
                        //                                                          Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                        //                                                          ----   -----------------------    ----------------------      ----------   ----------
                        Package() { "PSTATE",  20, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       5326000000, 5326000000 }},
                        },
                        Package() { "PSTATE",  21, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       4926000000, 4926000000 }},
                        },
                        Package() { "PSTATE",  22, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       4526000000, 4526000000 }},
                        },
                        Package() { "PSTATE",  23, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       4126000000, 4126000000 }},
                        },
                        Package() { "PSTATE",  24, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       3726000000, 3726000000 }},
                        },
                        Package() { "PSTATE",  25, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       3326000000, 3326000000 }},
                        },
                        Package() { "PSTATE",  26, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       2926000000, 2926000000 }},
                        },
                        Package() { "PSTATE",  27, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       2526000000, 2526000000 }},
                        },
                        Package() { "PSTATE",  28, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       2400000000, 2400000000 }},
                        },
                        Package() { "PSTATE",  29, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       2300000000, 2300000000 }},
                        },
                        Package() { "PSTATE",  30, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       2200000000, 2200000000 }},
                        },
                        Package() { "PSTATE",  31, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       2100000000, 2100000000 }},
                        },
                        Package() { "PSTATE",  32, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       2000000000, 2000000000 }},
                        },
                        Package() { "PSTATE",  33, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       1900000000, 1900000000 }},
                        },
                        Package() { "PSTATE",  34, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       1800000000, 1800000000 }},
                        },
                        Package() { "PSTATE",  35, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       1700000000, 1700000000 }},
                        },
                        Package() { "PSTATE",  36, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       1600000000, 1600000000 }},
                        },
                        Package() { "PSTATE",  37, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       1500000000, 1500000000 }},
                        },
                        Package() { "PSTATE",  38, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       1400000000, 1400000000 }},
                        },
                        Package() { "PSTATE",  39, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       1300000000, 1300000000 }},
                        },
                        Package() { "PSTATE",  40, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       1200000000, 1200000000 }},
                        },
                        Package() { "PSTATE",  41, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       1100000000, 1100000000 }},
                        },
                        Package() { "PSTATE",  42, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",       1000000000, 1000000000 }},
                        },
                        Package() { "PSTATE",  43, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",        900000000,  900000000 }},
                        },
                        Package() { "PSTATE",  44, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",        800000000,  800000000 }},
                        },
                        Package() { "PSTATE",  45, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",        700000000,  700000000 }},
                        },
                        Package() { "PSTATE",  46, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",        600000000,  600000000 }},
                        },
                        Package() { "PSTATE",  47, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",        500000000,  500000000 }},
                        },
                        Package() { "PSTATE",  48, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",        400000000,  400000000 }},
                        },
                        Package() { "PSTATE",  49, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP1",        "ICBID_SLAVE_EBI1",                0,          0 }},
                        },
                    },
                },
            },
        })
        
        Return (GPCC)
    }
    
    //--------------------------------------------------------------------------------------
    //  C4  (qcdxkm850.sys) - Video Engine Power States
    //--------------------------------------------------------------------------------------
    //
    Method (G4MD)
    {
        Name (GPCC, Package()
        {
            Package()
            {
                "DEVICE",
                "\\_SB.GPU0",
            
                Package()
                {
                    "COMPONENT",
                    4,
                    
                    
                    //----------------------------------------------------------------------------------
                    //  C4.F0  (qcdxkm850.sys) - Video Engine Power States
                    //
                    //  When in this state:
                    //  - Video footswitch is enabled
                    //  - AHB and AXI interface clocks are enabled and have frequencies > 0 Hz
                    //  - Video core clock is enabled and has a frequency > 0 Hz
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        0,
                    },
                    
                    //----------------------------------------------------------------------------------
                    //  C4.F1  (qcdxkm850.sys) - Video Engine Power States
                    //
                    //  When in this state:
                    //  - AHB and AXI interface clocks are disabled
                    //  - Video core clock is disabled
                    //  - XO Shutdown generally precluded because BW vote still in place
                    //  - Video footswitch is enabled
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        1,
                        
                        // Actions to take when entering this F-State
                        //
                        Package()
                        {
                            "ENTER",
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   2   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_axi_clk",    2   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   2   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_axi_clk",    2   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 2   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_axi_clk",  2   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ahb_clk",      2   }},
                            Package() { "CLOCK", Package() { "gcc_video_ahb_clk",           2   }},
                        },
                        
                        // Actions to take when exiting this F-State
                        //
                        Package()
                        {
                            "EXIT",
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "gcc_video_ahb_clk",           1   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ahb_clk",      1   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_axi_clk",  1   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 1   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_axi_clk",    1   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   1   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_axi_clk",    1   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   1   }},
                        },
                    },
                    
                    //----------------------------------------------------------------------------------
                    //  C4.F2  (qcdxkm850.sys) - Video Engine Power States
                    //
                    //  When in this state:
                    //  - Video footswitch may be disabled by RPM before XO shutdown
                    //  - AHB and AXI interface clocks are disabled
                    //  - Video core clock is disabled
                    //  - AHB freq vote removed (via PSTATE_ADJUST)
                    //  - EBI Bandwidth vote removed (via PSTATE_ADJUST)
                    //  - OCMEM Bandwidth vote removed (via PSTATE_ADJUST)
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        2,
                        
                        // Actions to take when entering this F-State
                        //
                        Package()
                        {
                            "ENTER",
                            
                            Package() { "PSTATE_SAVE" },
                            Package() { "PSTATE_ADJUST", Package() { 2, 6 }},
                            Package() { "PSTATE_ADJUST", Package() { 3, 110 }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   2   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_axi_clk",    2   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   2   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_axi_clk",    2   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 2   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_axi_clk",  2   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ahb_clk",      2   }},
                            
                            // Action:       2 == DISABLE
                            //               4 == HW_CTRL_DISABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "vcodec1_gdsc",      4    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec1_gdsc",      2    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec0_gdsc",      4    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec0_gdsc",      2    }},
                            Package() { "FOOTSWITCH", Package() { "venus_gdsc",        2    }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_video_ahb_clk",     2   }},
                            Package() { "CLOCK", Package() { "gcc_video_axi_clk",     2   }},
                            Package() { "CLOCK", Package() { "gcc_video_xo_clk",      2   }},
                        },
                        
                        // Actions to take when exiting this F-State
                        //
                        Package()
                        {
                            "EXIT",
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_video_xo_clk",      1   }},
                            Package() { "CLOCK", Package() { "gcc_video_axi_clk",     1   }},
                            Package() { "CLOCK", Package() { "gcc_video_ahb_clk",     1   }},
                            
                            // Action:       1 == ENABLE
                            //               3 == HW_CTRL_ENABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "venus_gdsc",        1    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec0_gdsc",      1    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec0_gdsc",      3    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec1_gdsc",      1    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec1_gdsc",      3    }},
                            Package() { "PSTATE_ADJUST", Package() { 0, 0 }},
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "video_cc_venus_ahb_clk",      1   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_axi_clk",  1   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 1   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_axi_clk",    1   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   1   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_axi_clk",    1   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   1   }},
                            
                            // Action:       9 == CONFIGURE
                            // Sub-Action:   18 == CLOCK_CONFIG_FOOTSWITCH_CORE_FORCE_ON
                            //               20 == CLOCK_CONFIG_FOOTSWITCH_PERIPHERAL_FORCE_ON
                            //
                            //                              Clock Name                    Action    Sub-Action
                            //                              --------------------          ------    ----------
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   9,        18   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   9,        18   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 9,        18   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   9,        20   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   9,        20   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 9,        20   }},
                            
                            Package() { "PSTATE_RESTORE" },
                        },
                    },
                    
                    //----------------------------------------------------------------------------------
                    // Default F-States
                    //     INIT    - Assume we're already in this state when the PEP first loads.
                    //     PRELOAD - Use this state until our driver is loaded for the first time.
                    //     ABANDON - Use this state after our driver has been unloaded.
                    //----------------------------------------------------------------------------------
                    //
                    Package() { "INIT_FSTATE", 0 },
                    Package() { "PRELOAD_FSTATE", 2 },
                    Package() { "ABANDON_FSTATE", 2 },
                    
                    //----------------------------------------------------------------------------------
                    // C4.PS0 - Video Core P-State Set: Reset
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        0,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        //----------------------------------------------------------------------------------
                        //  - Do Nothing
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            0,
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Reset Venus Core
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            1,
                            
                            // Action:       10 == RESETCLOCK_ASSERT
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",  10   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_axi_clk",   10   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",  10   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_axi_clk",   10   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk",10   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_axi_clk", 10   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ahb_clk",     10   }},
                            
                            Package()
                            {
                                "DELAY",
                                Package()
                                {
                                    1,           // Delay in milliseconds
                                }
                            },
                            
                            // Action:       11 == RESETCLOCK_DEASSERT
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "video_cc_venus_ahb_clk",     11   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_axi_clk", 11   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk",11   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_axi_clk",   11   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",  11   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_axi_clk",   11   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",  11   }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 1 },
                        Package() { "PREPARE_PSTATE", 0 },
                        Package() { "ABANDON_PSTATE", 1 },
                    },
                    //----------------------------------------------------------------------------------
                    // C4.PS1 - Video Core P-State Set: Footswitch override
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        1,
                        
                        //----------------------------------------------------------------------------------
                        //  - Footswitch On
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            0,
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_video_xo_clk",      1   }},
                            Package() { "CLOCK", Package() { "gcc_video_axi_clk",     1   }},
                            Package() { "CLOCK", Package() { "gcc_video_ahb_clk",     1   }},
                            
                            // Action:       1 == ENABLE
                            //               3 == HW_CTRL_ENABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "venus_gdsc",        1    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec0_gdsc",      1    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec0_gdsc",      3    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec1_gdsc",      1    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec1_gdsc",      3    }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Footswitch Off
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            1,
                            
                            // Action:       2 == DISABLE
                            //               4 == HW_CTRL_DISABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "vcodec1_gdsc",      4    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec1_gdsc",      2    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec0_gdsc",      4    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec0_gdsc",      2    }},
                            Package() { "FOOTSWITCH", Package() { "venus_gdsc",        2    }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_video_ahb_clk",     2   }},
                            Package() { "CLOCK", Package() { "gcc_video_axi_clk",     2   }},
                            Package() { "CLOCK", Package() { "gcc_video_xo_clk",      2   }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 1 },
                        Package() { "PREPARE_PSTATE", 1 },
                        Package() { "ABANDON_PSTATE", 1 },
                    },
                    //----------------------------------------------------------------------------------
                    // C4.PS2 - Video Core Performance: Core Clock Frequency
                    //
                    // @Brief:
                    // Notes:
                    // - The use of a "CLOSEST" match for the highest frequency is defensive.  Any attempt
                    //   to request a frequency that's even 1 Hz higher than the maximum entry in Clkrgm's
                    //   table will result in a silent failure and no change in clock frequency.
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        2,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 0
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            0,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    3 == CLOCK_FREQUENCY_HZ_CLOSEST
                            //
                            //                              Clock Name                    Action    Frequency   MatchType
                            //                              --------------------          ------    ----------  ---------
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 3,       533000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   3,       533000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   3,       533000000,       3   }},
                            
                            //                               Req                                                             IB           AB
                            //                               Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------      ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_VENUS_CFG",   300000000,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 1
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            1,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    3 == CLOCK_FREQUENCY_HZ_CLOSEST
                            //
                            //                              Clock Name                    Action    Frequency   MatchType
                            //                              --------------------          ------    ----------  ---------
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 3,       444000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   3,       444000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   3,       444000000,       3   }},
                            
                            //                               Req                                                             IB           AB
                            //                               Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------      ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_VENUS_CFG",   300000000,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            2,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    3 == CLOCK_FREQUENCY_HZ_CLOSEST
                            //
                            //                              Clock Name                    Action    Frequency   MatchType
                            //                              --------------------          ------    ----------  ---------
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 3,       380000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   3,       380000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   3,       380000000,       3   }},
                            
                            //                               Req                                                             IB           AB
                            //                               Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------      ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_VENUS_CFG",   150000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            3,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    3 == CLOCK_FREQUENCY_HZ_CLOSEST
                            //
                            //                              Clock Name                    Action    Frequency   MatchType
                            //                              --------------------          ------    ----------  ---------
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 3,       320000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   3,       320000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   3,       320000000,       3   }},
                            
                            //                               Req                                                             IB           AB
                            //                               Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------      ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_VENUS_CFG",   150000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            4,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    3 == CLOCK_FREQUENCY_HZ_CLOSEST
                            //
                            //                              Clock Name                    Action    Frequency   MatchType
                            //                              --------------------          ------    ----------  ---------
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 3,       200000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   3,       200000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   3,       200000000,       3   }},
                            
                            //                               Req                                                             IB           AB
                            //                               Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------      ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_VENUS_CFG",    75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            5,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    3 == CLOCK_FREQUENCY_HZ_CLOSEST
                            //
                            //                              Clock Name                    Action    Frequency   MatchType
                            //                              --------------------          ------    ----------  ---------
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 3,       100000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   3,       100000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   3,       100000000,       3   }},
                            
                            //                               Req                                                             IB           AB
                            //                               Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------      ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_VENUS_CFG",    75000000,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 3
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            6,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    3 == CLOCK_FREQUENCY_HZ_CLOSEST
                            //
                            //                              Clock Name                    Action    Frequency   MatchType
                            //                              --------------------          ------    ----------  ---------
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 3,               0,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   3,               0,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   3,               0,       3   }},
                            
                            //                               Req                                                             IB           AB
                            //                               Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------      ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_VENUS_CFG",           0,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 4 },
                        Package() { "PREPARE_PSTATE", 4 },
                        Package() { "ABANDON_PSTATE", 4 },
                    },
                    //----------------------------------------------------------------------------------
                    // C4.PS3 - Video Performance: Bandwidth to EBI
                    //
                    // @Brief:
                    // AXI bandwidth values are represented by a max, min and step which covers all
                    // possible bandwidth values requested by video core for different decode and
                    // encode scenarios.
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        3,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 0
                        //----------------------------------------------------------------------------------
                        
                        //                                                          Req                                                             IB           AB
                        //                                                          Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                        //                                                          ----   -----------------------    ----------------------      ----------   ----------
                        Package() { "PSTATE",   0, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       22000000000, 22000000000 }},
                        },
                        Package() { "PSTATE",   1, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       21800000000, 21800000000 }},
                        },
                        Package() { "PSTATE",   2, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       21600000000, 21600000000 }},
                        },
                        Package() { "PSTATE",   3, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       21400000000, 21400000000 }},
                        },
                        Package() { "PSTATE",   4, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       21200000000, 21200000000 }},
                        },
                        Package() { "PSTATE",   5, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       21000000000, 21000000000 }},
                        },
                        Package() { "PSTATE",   6, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       20800000000, 20800000000 }},
                        },
                        Package() { "PSTATE",   7, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       20600000000, 20600000000 }},
                        },
                        Package() { "PSTATE",   8, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       20400000000, 20400000000 }},
                        },
                        Package() { "PSTATE",   9, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       20200000000, 20200000000 }},
                        },
                        Package() { "PSTATE",  10, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       20000000000, 20000000000 }},
                        },
                        Package() { "PSTATE",  11, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       19800000000, 19800000000 }},
                        },
                        Package() { "PSTATE",  12, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       19600000000, 19600000000 }},
                        },
                        Package() { "PSTATE",  13, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       19400000000, 19400000000 }},
                        },
                        Package() { "PSTATE",  14, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       19200000000, 19200000000 }},
                        },
                        Package() { "PSTATE",  15, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       19000000000, 19000000000 }},
                        },
                        Package() { "PSTATE",  16, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       18800000000, 18800000000 }},
                        },
                        Package() { "PSTATE",  17, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       18600000000, 18600000000 }},
                        },
                        Package() { "PSTATE",  18, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       18400000000, 18400000000 }},
                        },
                        Package() { "PSTATE",  19, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       18200000000, 18200000000 }},
                        },
                        Package() { "PSTATE",  20, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       18000000000, 18000000000 }},
                        },
                        Package() { "PSTATE",  21, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       17800000000, 17800000000 }},
                        },
                        Package() { "PSTATE",  22, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       17600000000, 17600000000 }},
                        },
                        Package() { "PSTATE",  23, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       17400000000, 17400000000 }},
                        },
                        Package() { "PSTATE",  24, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       17200000000, 17200000000 }},
                        },
                        Package() { "PSTATE",  25, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       17000000000, 17000000000 }},
                        },
                        Package() { "PSTATE",  26, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       16800000000, 16800000000 }},
                        },
                        Package() { "PSTATE",  27, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       16600000000, 16600000000 }},
                        },
                        Package() { "PSTATE",  28, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       16400000000, 16400000000 }},
                        },
                        Package() { "PSTATE",  29, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       16200000000, 16200000000 }},
                        },
                        Package() { "PSTATE",  30, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       16000000000, 16000000000 }},
                        },
                        Package() { "PSTATE",  31, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       15800000000, 15800000000 }},
                        },
                        Package() { "PSTATE",  32, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       15600000000, 15600000000 }},
                        },
                        Package() { "PSTATE",  33, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       15400000000, 15400000000 }},
                        },
                        Package() { "PSTATE",  34, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       15200000000, 15200000000 }},
                        },
                        Package() { "PSTATE",  35, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       15000000000, 15000000000 }},
                        },
                        Package() { "PSTATE",  36, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       14800000000, 14800000000 }},
                        },
                        Package() { "PSTATE",  37, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       14600000000, 14600000000 }},
                        },
                        Package() { "PSTATE",  38, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       14400000000, 14400000000 }},
                        },
                        Package() { "PSTATE",  39, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       14200000000, 14200000000 }},
                        },
                        Package() { "PSTATE",  40, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       14000000000, 14000000000 }},
                        },
                        Package() { "PSTATE",  41, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       13800000000, 13800000000 }},
                        },
                        Package() { "PSTATE",  42, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       13600000000, 13600000000 }},
                        },
                        Package() { "PSTATE",  43, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       13400000000, 13400000000 }},
                        },
                        Package() { "PSTATE",  44, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       13200000000, 13200000000 }},
                        },
                        Package() { "PSTATE",  45, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       13000000000, 13000000000 }},
                        },
                        Package() { "PSTATE",  46, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       12800000000, 12800000000 }},
                        },
                        Package() { "PSTATE",  47, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       12600000000, 12600000000 }},
                        },
                        Package() { "PSTATE",  48, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       12400000000, 12400000000 }},
                        },
                        Package() { "PSTATE",  49, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       12200000000, 12200000000 }},
                        },
                        Package() { "PSTATE",  50, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       12000000000, 12000000000 }},
                        },
                        Package() { "PSTATE",  51, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       11800000000, 11800000000 }},
                        },
                        Package() { "PSTATE",  52, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       11600000000, 11600000000 }},
                        },
                        Package() { "PSTATE",  53, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       11400000000, 11400000000 }},
                        },
                        Package() { "PSTATE",  54, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       11200000000, 11200000000 }},
                        },
                        Package() { "PSTATE",  55, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       11000000000, 11000000000 }},
                        },
                        Package() { "PSTATE",  56, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       10800000000, 10800000000 }},
                        },
                        Package() { "PSTATE",  57, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       10600000000, 10600000000 }},
                        },
                        Package() { "PSTATE",  58, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       10400000000, 10400000000 }},
                        },
                        Package() { "PSTATE",  59, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       10200000000, 10200000000 }},
                        },
                        Package() { "PSTATE",  60, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       10000000000, 10000000000 }},
                        },
                        Package() { "PSTATE",  61, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       9800000000, 9800000000 }},
                        },
                        Package() { "PSTATE",  62, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       9600000000, 9600000000 }},
                        },
                        Package() { "PSTATE",  63, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       9400000000, 9400000000 }},
                        },
                        Package() { "PSTATE",  64, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       9200000000, 9200000000 }},
                        },
                        Package() { "PSTATE",  65, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       9000000000, 9000000000 }},
                        },
                        Package() { "PSTATE",  66, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       8800000000, 8800000000 }},
                        },
                        Package() { "PSTATE",  67, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       8600000000, 8600000000 }},
                        },
                        Package() { "PSTATE",  68, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       8400000000, 8400000000 }},
                        },
                        Package() { "PSTATE",  69, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       8200000000, 8200000000 }},
                        },
                        Package() { "PSTATE",  70, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       8000000000, 8000000000 }},
                        },
                        Package() { "PSTATE",  71, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       7800000000, 7800000000 }},
                        },
                        Package() { "PSTATE",  72, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       7600000000, 7600000000 }},
                        },
                        Package() { "PSTATE",  73, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       7400000000, 7400000000 }},
                        },
                        Package() { "PSTATE",  74, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       7200000000, 7200000000 }},
                        },
                        Package() { "PSTATE",  75, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       7000000000, 7000000000 }},
                        },
                        Package() { "PSTATE",  76, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       6800000000, 6800000000 }},
                        },
                        Package() { "PSTATE",  77, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       6600000000, 6600000000 }},
                        },
                        Package() { "PSTATE",  78, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       6400000000, 6400000000 }},
                        },
                        Package() { "PSTATE",  79, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       6200000000, 6200000000 }},
                        },
                        Package() { "PSTATE",  80, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       6000000000, 6000000000 }},
                        },
                        Package() { "PSTATE",  81, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       5800000000, 5800000000 }},
                        },
                        Package() { "PSTATE",  82, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       5600000000, 5600000000 }},
                        },
                        Package() { "PSTATE",  83, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       5400000000, 5400000000 }},
                        },
                        Package() { "PSTATE",  84, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       5200000000, 5200000000 }},
                        },
                        Package() { "PSTATE",  85, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       5000000000, 5000000000 }},
                        },
                        Package() { "PSTATE",  86, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       4800000000, 4800000000 }},
                        },
                        Package() { "PSTATE",  87, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       4600000000, 4600000000 }},
                        },
                        Package() { "PSTATE",  88, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       4400000000, 4400000000 }},
                        },
                        Package() { "PSTATE",  89, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       4200000000, 4200000000 }},
                        },
                        Package() { "PSTATE",  90, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       4000000000, 4000000000 }},
                        },
                        Package() { "PSTATE",  91, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       3800000000, 3800000000 }},
                        },
                        Package() { "PSTATE",  92, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       3600000000, 3600000000 }},
                        },
                        Package() { "PSTATE",  93, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       3400000000, 3400000000 }},
                        },
                        Package() { "PSTATE",  94, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       3200000000, 3200000000 }},
                        },
                        Package() { "PSTATE",  95, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       3000000000, 3000000000 }},
                        },
                        Package() { "PSTATE",  96, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       2800000000, 2800000000 }},
                        },
                        Package() { "PSTATE",  97, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       2600000000, 2600000000 }},
                        },
                        Package() { "PSTATE",  98, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       2400000000, 2400000000 }},
                        },
                        Package() { "PSTATE",  99, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       2200000000, 2200000000 }},
                        },
                        Package() { "PSTATE",  100, 
                                                    Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       2000000000, 2000000000 }},
                        },
                        Package() { "PSTATE",  101, 
                                                    Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       1800000000, 1800000000 }},
                        },
                        Package() { "PSTATE",  102, 
                                                    Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       1600000000, 1600000000 }},
                        },
                        Package() { "PSTATE",  103, 
                                                    Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       1400000000, 1400000000 }},
                        },
                        Package() { "PSTATE",  104, 
                                                    Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       1200000000, 1200000000 }},
                        },
                        Package() { "PSTATE",  105, 
                                                    Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",       1000000000, 1000000000 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 1
                        //----------------------------------------------------------------------------------
                        
                        //                                                          Req                                                             IB           AB
                        //                                                          Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                        //                                                          ----   -----------------------    ----------------------      ----------   ----------
                        Package() { "PSTATE",  106, 
                                                    Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",        800000000,  800000000 }},
                        },
                        Package() { "PSTATE",  107, 
                                                    Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",        600000000,  600000000 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        //                                                          Req                                                             IB           AB
                        //                                                          Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                        //                                                          ----   -----------------------    ----------------------      ----------   ----------
                        Package() { "PSTATE",  108, 
                                                    Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",        400000000,  400000000 }},
                        },
                        Package() { "PSTATE",  109, 
                                                    Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",        200000000,  200000000 }},
                        },
                        Package() { "PSTATE",  110, 
                                                    Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P0",    "ICBID_SLAVE_EBI1",                0,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 108 },
                        Package() { "PREPARE_PSTATE", 108 },
                        Package() { "ABANDON_PSTATE", 108 },
                    },
                },
            },
        })
        
        Return (GPCC)
    }
    
    //--------------------------------------------------------------------------------------
    //  C5  (qcdxkm850.sys) - Crypto Engine Power States
    //--------------------------------------------------------------------------------------
    //
    Method (G5MD)
    {
        Name (GPCC, Package()
        {
            Package()
            {
                "DEVICE",
                "\\_SB.GPU0",
            
                Package()
                {
                    "COMPONENT",
                    5,
                    
                    
                    //----------------------------------------------------------------------------------
                    //  C5.F0  (qcdxkm850.sys) - Crypto Engine Power States
                    //
                    //  State:
                    //  - Crypto Engine is Active(Crypto HW is not controlled by Crypto Engine)
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        0,
                    },
                    
                    //----------------------------------------------------------------------------------
                    //  C5.F1  (qcdxkm850.sys) - Crypto Engine Power States
                    //
                    //  State:
                    //  - Crypto Engine is not Active(Crypto HW is not controlled by Crypto Engine)
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        1,
                    },
                    
                    //----------------------------------------------------------------------------------
                    // Default F-States
                    //     INIT    - Assume we're already in this state when the PEP first loads.
                    //     PRELOAD - Use this state until our driver is loaded for the first time.
                    //     ABANDON - Use this state after our driver has been unloaded.
                    //----------------------------------------------------------------------------------
                    //
                    Package() { "INIT_FSTATE", 0 },
                    Package() { "PRELOAD_FSTATE", 0 },
                    Package() { "ABANDON_FSTATE", 0 },
                    
                    //----------------------------------------------------------------------------------
                    // C5.PS0 - Crypto P-State Set: Reset
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        0,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        //----------------------------------------------------------------------------------
                        //  - Do Nothing
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            0,
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Do Nothing
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            1,
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 0 },
                        Package() { "PREPARE_PSTATE", 0 },
                        Package() { "ABANDON_PSTATE", 0 },
                    },
                    //----------------------------------------------------------------------------------
                    // C5.PS1 - Crypto P-State Set: Footswitch override
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        1,
                        
                        //----------------------------------------------------------------------------------
                        //  - Footswitch On
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            0,
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Footswitch Off
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            1,
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 0 },
                        Package() { "PREPARE_PSTATE", 1 },
                        Package() { "ABANDON_PSTATE", 0 },
                    },
                    //----------------------------------------------------------------------------------
                    // C5.PS2 - Crypto Core Performance: Core Clock Frequency
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        2,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 0
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            0,
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 0 },
                        Package() { "PREPARE_PSTATE", 0 },
                        Package() { "ABANDON_PSTATE", 0 },
                    },
                },
            },
        })
        
        Return (GPCC)
    }
    
    //--------------------------------------------------------------------------------------
    //  C6  (qcdxkm850.sys) - Video Encoder Engine Power States
    //--------------------------------------------------------------------------------------
    //
    Method (G6MD)
    {
        Name (GPCC, Package()
        {
            Package()
            {
                "DEVICE",
                "\\_SB.GPU0",
            
                Package()
                {
                    "COMPONENT",
                    6,
                    
                    
                    //----------------------------------------------------------------------------------
                    //  C6.F0  (qcdxkm850.sys) - Video Encoder Engine Power States
                    //
                    //  When in this state:
                    //  - Video footswitch is enabled
                    //  - AHB and AXI interface clocks are enabled and have frequencies > 0 Hz
                    //  - Video core clock is enabled and has a frequency > 0 Hz
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        0,
                    },
                    
                    //----------------------------------------------------------------------------------
                    //  C6.F1  (qcdxkm850.sys) - Video Encoder Engine Power States
                    //
                    //  When in this state:
                    //  - AHB and AXI interface clocks are disabled
                    //  - Video core clock is disabled
                    //  - XO Shutdown generally precluded because BW vote still in place
                    //  - Video footswitch is enabled
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        1,
                        
                        // Actions to take when entering this F-State
                        //
                        Package()
                        {
                            "ENTER",
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   2   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_axi_clk",    2   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   2   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_axi_clk",    2   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 2   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_axi_clk",  2   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ahb_clk",      2   }},
                            Package() { "CLOCK", Package() { "gcc_video_ahb_clk",           2   }},
                        },
                        
                        // Actions to take when exiting this F-State
                        //
                        Package()
                        {
                            "EXIT",
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "gcc_video_ahb_clk",           1   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ahb_clk",      1   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_axi_clk",  1   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 1   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_axi_clk",    1   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   1   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_axi_clk",    1   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   1   }},
                        },
                    },
                    
                    //----------------------------------------------------------------------------------
                    //  C6.F2  (qcdxkm850.sys) - Video Encoder Engine Power States
                    //
                    //  When in this state:
                    //  - Video footswitch may be disabled by RPM before XO shutdown
                    //  - AHB and AXI interface clocks are disabled
                    //  - Video core clock is disabled
                    //  - AHB freq vote removed (via PSTATE_ADJUST)
                    //  - EBI Bandwidth vote removed (via PSTATE_ADJUST)
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        2,
                        
                        // Actions to take when entering this F-State
                        //
                        Package()
                        {
                            "ENTER",
                            
                            Package() { "PSTATE_SAVE" },
                            Package() { "PSTATE_ADJUST", Package() { 2, 6 }},
                            Package() { "PSTATE_ADJUST", Package() { 3, 110 }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   2   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_axi_clk",    2   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   2   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_axi_clk",    2   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 2   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_axi_clk",  2   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ahb_clk",      2   }},
                            
                            // Action:       2 == DISABLE
                            //               4 == HW_CTRL_DISABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "vcodec1_gdsc",      4    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec1_gdsc",      2    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec0_gdsc",      4    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec0_gdsc",      2    }},
                            Package() { "FOOTSWITCH", Package() { "venus_gdsc",        2    }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_video_ahb_clk",     2   }},
                            Package() { "CLOCK", Package() { "gcc_video_axi_clk",     2   }},
                            Package() { "CLOCK", Package() { "gcc_video_xo_clk",      2   }},
                        },
                        
                        // Actions to take when exiting this F-State
                        //
                        Package()
                        {
                            "EXIT",
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_video_xo_clk",      1   }},
                            Package() { "CLOCK", Package() { "gcc_video_axi_clk",     1   }},
                            Package() { "CLOCK", Package() { "gcc_video_ahb_clk",     1   }},
                            
                            // Action:       1 == ENABLE
                            //               3 == HW_CTRL_ENABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "venus_gdsc",        1    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec0_gdsc",      1    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec0_gdsc",      3    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec1_gdsc",      1    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec1_gdsc",      3    }},
                            Package() { "PSTATE_ADJUST", Package() { 0, 0 }},
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "video_cc_venus_ahb_clk",      1   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_axi_clk",  1   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 1   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_axi_clk",    1   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   1   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_axi_clk",    1   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   1   }},
                            
                            // Action:       9 == CONFIGURE
                            // Sub-Action:   18 == CLOCK_CONFIG_FOOTSWITCH_CORE_FORCE_ON
                            //               20 == CLOCK_CONFIG_FOOTSWITCH_PERIPHERAL_FORCE_ON
                            //
                            //                              Clock Name                    Action    Sub-Action
                            //                              --------------------          ------    ----------
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   9,        18   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   9,        18   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 9,        18   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   9,        20   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   9,        20   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 9,        20   }},
                            
                            Package() { "PSTATE_RESTORE" },
                        },
                    },
                    
                    //----------------------------------------------------------------------------------
                    // Default F-States
                    //     INIT    - Assume we're already in this state when the PEP first loads.
                    //     PRELOAD - Use this state until our driver is loaded for the first time.
                    //     ABANDON - Use this state after our driver has been unloaded.
                    //----------------------------------------------------------------------------------
                    //
                    Package() { "INIT_FSTATE", 0 },
                    Package() { "PRELOAD_FSTATE", 2 },
                    Package() { "ABANDON_FSTATE", 2 },
                    
                    //----------------------------------------------------------------------------------
                    // C6.PS0 - Video  Encoder P-State Set: Reset
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        0,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        //----------------------------------------------------------------------------------
                        //  - Do Nothing
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            0,
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Reset Venus Core
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            1,
                            
                            // Action:       10 == RESETCLOCK_ASSERT
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",  10   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_axi_clk",   10   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",  10   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_axi_clk",   10   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk",10   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_axi_clk", 10   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ahb_clk",     10   }},
                            
                            Package()
                            {
                                "DELAY",
                                Package()
                                {
                                    1,           // Delay in milliseconds
                                }
                            },
                            
                            // Action:       11 == RESETCLOCK_DEASSERT
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "video_cc_venus_ahb_clk",     11   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_axi_clk", 11   }},
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk",11   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_axi_clk",   11   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",  11   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_axi_clk",   11   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",  11   }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 1 },
                        Package() { "PREPARE_PSTATE", 0 },
                        Package() { "ABANDON_PSTATE", 1 },
                    },
                    //----------------------------------------------------------------------------------
                    // C6.PS1 - Video Encoder P-State Set: Footswitch override
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        1,
                        
                        //----------------------------------------------------------------------------------
                        //  - Footswitch On
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            0,
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_video_xo_clk",      1   }},
                            Package() { "CLOCK", Package() { "gcc_video_axi_clk",     1   }},
                            Package() { "CLOCK", Package() { "gcc_video_ahb_clk",     1   }},
                            
                            // Action:       1 == ENABLE
                            //               3 == HW_CTRL_ENABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "venus_gdsc",        1    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec0_gdsc",      1    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec0_gdsc",      3    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec1_gdsc",      1    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec1_gdsc",      3    }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Footswitch Off
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            1,
                            
                            // Action:       2 == DISABLE
                            //               4 == HW_CTRL_DISABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "vcodec1_gdsc",      4    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec1_gdsc",      2    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec0_gdsc",      4    }},
                            Package() { "FOOTSWITCH", Package() { "vcodec0_gdsc",      2    }},
                            Package() { "FOOTSWITCH", Package() { "venus_gdsc",        2    }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_video_ahb_clk",     2   }},
                            Package() { "CLOCK", Package() { "gcc_video_axi_clk",     2   }},
                            Package() { "CLOCK", Package() { "gcc_video_xo_clk",      2   }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 1 },
                        Package() { "PREPARE_PSTATE", 1 },
                        Package() { "ABANDON_PSTATE", 1 },
                    },
                    //----------------------------------------------------------------------------------
                    // C6.PS2 - Video Encoder Core Performance: Core Clock Frequency
                    //
                    // @Brief:
                    // Notes:
                    // - The use of a "CLOSEST" match for the highest frequency is defensive.  Any attempt
                    //   to request a frequency that's even 1 Hz higher than the maximum entry in Clkrgm's
                    //   table will result in a silent failure and no change in clock frequency.
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        2,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 0
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            0,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    3 == CLOCK_FREQUENCY_HZ_CLOSEST
                            //
                            //                              Clock Name                    Action    Frequency   MatchType
                            //                              --------------------          ------    ----------  ---------
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 3,       533000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   3,       533000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   3,       533000000,       3   }},
                            
                            //                               Req                                                             IB           AB
                            //                               Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------      ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_VENUS_CFG",   300000000,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 1
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            1,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    3 == CLOCK_FREQUENCY_HZ_CLOSEST
                            //
                            //                              Clock Name                    Action    Frequency   MatchType
                            //                              --------------------          ------    ----------  ---------
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 3,       444000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   3,       444000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   3,       444000000,       3   }},
                            
                            //                               Req                                                             IB           AB
                            //                               Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------      ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_VENUS_CFG",   300000000,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            2,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    3 == CLOCK_FREQUENCY_HZ_CLOSEST
                            //
                            //                              Clock Name                    Action    Frequency   MatchType
                            //                              --------------------          ------    ----------  ---------
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 3,       404000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   3,       404000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   3,       404000000,       3   }},
                            
                            //                               Req                                                             IB           AB
                            //                               Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------      ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_VENUS_CFG",   150000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            3,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    3 == CLOCK_FREQUENCY_HZ_CLOSEST
                            //
                            //                              Clock Name                    Action    Frequency   MatchType
                            //                              --------------------          ------    ----------  ---------
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 3,       330000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   3,       330000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   3,       330000000,       3   }},
                            
                            //                               Req                                                             IB           AB
                            //                               Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------      ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_VENUS_CFG",   150000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            4,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    3 == CLOCK_FREQUENCY_HZ_CLOSEST
                            //
                            //                              Clock Name                    Action    Frequency   MatchType
                            //                              --------------------          ------    ----------  ---------
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 3,       200000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   3,       200000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   3,       200000000,       3   }},
                            
                            //                               Req                                                             IB           AB
                            //                               Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------      ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_VENUS_CFG",    75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            5,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    3 == CLOCK_FREQUENCY_HZ_CLOSEST
                            //
                            //                              Clock Name                    Action    Frequency   MatchType
                            //                              --------------------          ------    ----------  ---------
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 3,       100000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   3,       100000000,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   3,       100000000,       3   }},
                            
                            //                               Req                                                             IB           AB
                            //                               Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------      ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_VENUS_CFG",    75000000,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 3
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            6,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    3 == CLOCK_FREQUENCY_HZ_CLOSEST
                            //
                            //                              Clock Name                    Action    Frequency   MatchType
                            //                              --------------------          ------    ----------  ---------
                            Package() { "CLOCK", Package() { "video_cc_venus_ctl_core_clk", 3,               0,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec0_core_clk",   3,               0,       3   }},
                            Package() { "CLOCK", Package() { "video_cc_vcodec1_core_clk",   3,               0,       3   }},
                            
                            //                               Req                                                             IB           AB
                            //                               Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------      ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_VENUS_CFG",           0,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 4 },
                        Package() { "PREPARE_PSTATE", 4 },
                        Package() { "ABANDON_PSTATE", 4 },
                    },
                    //----------------------------------------------------------------------------------
                    // C6.PS3 - Video Encoder Performance: Bandwidth to EBI
                    //
                    // @Brief:
                    // AXI bandwidth values are represented by a max, min and step which covers all
                    // possible bandwidth values requested by video core for different decode and
                    // encode scenarios.
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        3,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 0
                        //----------------------------------------------------------------------------------
                        
                        //                                                          Req                                                             IB           AB
                        //                                                          Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                        //                                                          ----   -----------------------    ----------------------      ----------   ----------
                        Package() { "PSTATE",   0, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       22000000000,          0 }},
                        },
                        Package() { "PSTATE",   1, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       21800000000,          0 }},
                        },
                        Package() { "PSTATE",   2, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       21600000000,          0 }},
                        },
                        Package() { "PSTATE",   3, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       21400000000,          0 }},
                        },
                        Package() { "PSTATE",   4, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       21200000000,          0 }},
                        },
                        Package() { "PSTATE",   5, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       21000000000,          0 }},
                        },
                        Package() { "PSTATE",   6, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       20800000000,          0 }},
                        },
                        Package() { "PSTATE",   7, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       20600000000,          0 }},
                        },
                        Package() { "PSTATE",   8, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       20400000000,          0 }},
                        },
                        Package() { "PSTATE",   9, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       20200000000,          0 }},
                        },
                        Package() { "PSTATE",  10, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       20000000000,          0 }},
                        },
                        Package() { "PSTATE",  11, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       19800000000,          0 }},
                        },
                        Package() { "PSTATE",  12, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       19600000000,          0 }},
                        },
                        Package() { "PSTATE",  13, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       19400000000,          0 }},
                        },
                        Package() { "PSTATE",  14, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       19200000000,          0 }},
                        },
                        Package() { "PSTATE",  15, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       19000000000,          0 }},
                        },
                        Package() { "PSTATE",  16, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       18800000000,          0 }},
                        },
                        Package() { "PSTATE",  17, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       18600000000,          0 }},
                        },
                        Package() { "PSTATE",  18, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       18400000000,          0 }},
                        },
                        Package() { "PSTATE",  19, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       18200000000,          0 }},
                        },
                        Package() { "PSTATE",  20, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       18000000000,          0 }},
                        },
                        Package() { "PSTATE",  21, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       17800000000,          0 }},
                        },
                        Package() { "PSTATE",  22, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       17600000000,          0 }},
                        },
                        Package() { "PSTATE",  23, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       17400000000,          0 }},
                        },
                        Package() { "PSTATE",  24, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       17200000000,          0 }},
                        },
                        Package() { "PSTATE",  25, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       17000000000,          0 }},
                        },
                        Package() { "PSTATE",  26, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       16800000000,          0 }},
                        },
                        Package() { "PSTATE",  27, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       16600000000,          0 }},
                        },
                        Package() { "PSTATE",  28, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       16400000000,          0 }},
                        },
                        Package() { "PSTATE",  29, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       16200000000,          0 }},
                        },
                        Package() { "PSTATE",  30, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       16000000000,          0 }},
                        },
                        Package() { "PSTATE",  31, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       15800000000,          0 }},
                        },
                        Package() { "PSTATE",  32, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       15600000000,          0 }},
                        },
                        Package() { "PSTATE",  33, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       15400000000,          0 }},
                        },
                        Package() { "PSTATE",  34, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       15200000000,          0 }},
                        },
                        Package() { "PSTATE",  35, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       15000000000,          0 }},
                        },
                        Package() { "PSTATE",  36, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       14800000000,          0 }},
                        },
                        Package() { "PSTATE",  37, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       14600000000,          0 }},
                        },
                        Package() { "PSTATE",  38, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       14400000000,          0 }},
                        },
                        Package() { "PSTATE",  39, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       14200000000,          0 }},
                        },
                        Package() { "PSTATE",  40, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       14000000000,          0 }},
                        },
                        Package() { "PSTATE",  41, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       13800000000,          0 }},
                        },
                        Package() { "PSTATE",  42, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       13600000000,          0 }},
                        },
                        Package() { "PSTATE",  43, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       13400000000,          0 }},
                        },
                        Package() { "PSTATE",  44, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       13200000000,          0 }},
                        },
                        Package() { "PSTATE",  45, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       13000000000,          0 }},
                        },
                        Package() { "PSTATE",  46, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       12800000000,          0 }},
                        },
                        Package() { "PSTATE",  47, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       12600000000,          0 }},
                        },
                        Package() { "PSTATE",  48, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       12400000000,          0 }},
                        },
                        Package() { "PSTATE",  49, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       12200000000,          0 }},
                        },
                        Package() { "PSTATE",  50, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       12000000000,          0 }},
                        },
                        Package() { "PSTATE",  51, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       11800000000,          0 }},
                        },
                        Package() { "PSTATE",  52, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       11600000000,          0 }},
                        },
                        Package() { "PSTATE",  53, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       11400000000,          0 }},
                        },
                        Package() { "PSTATE",  54, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       11200000000,          0 }},
                        },
                        Package() { "PSTATE",  55, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       11000000000,          0 }},
                        },
                        Package() { "PSTATE",  56, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       10800000000,          0 }},
                        },
                        Package() { "PSTATE",  57, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       10600000000,          0 }},
                        },
                        Package() { "PSTATE",  58, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       10400000000,          0 }},
                        },
                        Package() { "PSTATE",  59, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       10200000000,          0 }},
                        },
                        Package() { "PSTATE",  60, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       10000000000,          0 }},
                        },
                        Package() { "PSTATE",  61, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       9800000000,          0 }},
                        },
                        Package() { "PSTATE",  62, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       9600000000,          0 }},
                        },
                        Package() { "PSTATE",  63, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       9400000000,          0 }},
                        },
                        Package() { "PSTATE",  64, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       9200000000,          0 }},
                        },
                        Package() { "PSTATE",  65, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       9000000000,          0 }},
                        },
                        Package() { "PSTATE",  66, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       8800000000,          0 }},
                        },
                        Package() { "PSTATE",  67, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       8600000000,          0 }},
                        },
                        Package() { "PSTATE",  68, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       8400000000,          0 }},
                        },
                        Package() { "PSTATE",  69, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       8200000000,          0 }},
                        },
                        Package() { "PSTATE",  70, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       8000000000,          0 }},
                        },
                        Package() { "PSTATE",  71, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       7800000000,          0 }},
                        },
                        Package() { "PSTATE",  72, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       7600000000,          0 }},
                        },
                        Package() { "PSTATE",  73, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       7400000000,          0 }},
                        },
                        Package() { "PSTATE",  74, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       7200000000,          0 }},
                        },
                        Package() { "PSTATE",  75, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       7000000000,          0 }},
                        },
                        Package() { "PSTATE",  76, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       6800000000,          0 }},
                        },
                        Package() { "PSTATE",  77, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       6600000000,          0 }},
                        },
                        Package() { "PSTATE",  78, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       6400000000,          0 }},
                        },
                        Package() { "PSTATE",  79, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       6200000000,          0 }},
                        },
                        Package() { "PSTATE",  80, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       6000000000,          0 }},
                        },
                        Package() { "PSTATE",  81, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       5800000000,          0 }},
                        },
                        Package() { "PSTATE",  82, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       5600000000,          0 }},
                        },
                        Package() { "PSTATE",  83, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       5400000000,          0 }},
                        },
                        Package() { "PSTATE",  84, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       5200000000,          0 }},
                        },
                        Package() { "PSTATE",  85, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       5000000000,          0 }},
                        },
                        Package() { "PSTATE",  86, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       4800000000,          0 }},
                        },
                        Package() { "PSTATE",  87, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       4600000000,          0 }},
                        },
                        Package() { "PSTATE",  88, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       4400000000,          0 }},
                        },
                        Package() { "PSTATE",  89, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       4200000000,          0 }},
                        },
                        Package() { "PSTATE",  90, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       4000000000,          0 }},
                        },
                        Package() { "PSTATE",  91, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       3800000000,          0 }},
                        },
                        Package() { "PSTATE",  92, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       3600000000,          0 }},
                        },
                        Package() { "PSTATE",  93, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       3400000000,          0 }},
                        },
                        Package() { "PSTATE",  94, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       3200000000,          0 }},
                        },
                        Package() { "PSTATE",  95, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       3000000000,          0 }},
                        },
                        Package() { "PSTATE",  96, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       2800000000,          0 }},
                        },
                        Package() { "PSTATE",  97, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       2600000000,          0 }},
                        },
                        Package() { "PSTATE",  98, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       2400000000,          0 }},
                        },
                        Package() { "PSTATE",  99, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       2200000000,          0 }},
                        },
                        Package() { "PSTATE",  100, 
                                                    Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       2000000000,          0 }},
                        },
                        Package() { "PSTATE",  101, 
                                                    Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       1800000000,          0 }},
                        },
                        Package() { "PSTATE",  102, 
                                                    Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       1600000000,          0 }},
                        },
                        Package() { "PSTATE",  103, 
                                                    Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       1400000000,          0 }},
                        },
                        Package() { "PSTATE",  104, 
                                                    Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       1200000000,          0 }},
                        },
                        Package() { "PSTATE",  105, 
                                                    Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",       1000000000,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 1
                        //----------------------------------------------------------------------------------
                        
                        //                                                          Req                                                             IB           AB
                        //                                                          Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                        //                                                          ----   -----------------------    ----------------------      ----------   ----------
                        Package() { "PSTATE",  106, 
                                                    Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",        800000000,          0 }},
                        },
                        Package() { "PSTATE",  107, 
                                                    Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",        600000000,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        //                                                          Req                                                             IB           AB
                        //                                                          Type           Master                     Slave               Bytes/Sec    Bytes/Sec
                        //                                                          ----   -----------------------    ----------------------      ----------   ----------
                        Package() { "PSTATE",  108, 
                                                    Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",        400000000,          0 }},
                        },
                        Package() { "PSTATE",  109, 
                                                    Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",        200000000,          0 }},
                        },
                        Package() { "PSTATE",  110, 
                                                    Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_VIDEO_P1",    "ICBID_SLAVE_EBI1",                0,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 108 },
                        Package() { "PREPARE_PSTATE", 108 },
                        Package() { "ABANDON_PSTATE", 108 },
                    },
                },
            },
        })
        
        Return (GPCC)
    }
    
    //--------------------------------------------------------------------------------------
    //  C7  (qcdxkm850.sys) - Internal (Secondary) Display Power States
    //--------------------------------------------------------------------------------------
    //
    Method (G7MD)
    {
        Name (GPCC, Package()
        {
            Package()
            {
                "DEVICE",
                "\\_SB.GPU0",
            
                Package()
                {
                    "COMPONENT",
                    7,
                    
                    
                    //----------------------------------------------------------------------------------
                    //  C7.F0  (qcdxkm850.sys) - Internal (Secondary) Display Power States
                    //
                    //  - Empty state
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        0,
                    },
                    
                    //----------------------------------------------------------------------------------
                    //  C7.F1  (qcdxkm850.sys) - Internal (Secondary) Display Power States
                    //
                    //  o Footswitches
                    //  -- BIMC_SMMU and MDSS footswitches
                    //  o CLOCKS
                    //  -- MDSS buses AHB / AXI
                    //  -- MDSS clocks (Vsync, core)
                    //  -- Interface, escape, byte and pixel clocks
                    //  -- SMMU MDP AXI clocks
                    //  -- South REFGEN
                    //  o RAILs
                    //  -- None
                    //  o GPIOs
                    //  -- None
                    //  o WLED
                    //  -- None
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        1,
                        
                        // Actions to take when entering this F-State
                        //
                        Package()
                        {
                            "ENTER",
                            
                            Package() { "PSTATE_SAVE" },
                            Package() { "PSTATE_ADJUST", Package() { 3, 12 }},
                            Package() { "PSTATE_ADJUST", Package() { 4, 42 }},
                            Package() { "PSTATE_ADJUST", Package() { 2, 4 }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "mdss_core_gdsc",    2    }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_disp_ahb_clk",      2   }},
                            Package() { "CLOCK", Package() { "gcc_disp_xo_clk",       2   }},
                            Package() { "CLOCK", Package() { "phy_refgen_south",      2   }},
                            
                            Package()
                            {
                                "NPARESOURCE",
                                Package()
                                {
                                      0,   // 0 : Not Required, 1: Required
                                    "/arc/client/rail_cx",
                                     64,   // Resource Value
                                },
                            },
                        },
                        
                        // Actions to take when exiting this F-State
                        //
                        Package()
                        {
                            "EXIT",
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_disp_xo_clk",       1   }},
                            Package() { "CLOCK", Package() { "gcc_disp_ahb_clk",      1   }},
                            
                            // Action:       1 == ENABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "mdss_core_gdsc",    1    }},
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "phy_refgen_south",      1   }},
                            
                            Package()
                            {
                                "NPARESOURCE",
                                Package()
                                {
                                      1,   // 0 : Not Required, 1: Required
                                    "/arc/client/rail_cx",
                                     64,   // Resource Value
                                },
                            },
                            
                            Package() { "PSTATE_RESTORE" },
                            Package() { "PSTATE_ADJUST", Package() { 3, 10 }},
                        },
                    },
                    
                    //----------------------------------------------------------------------------------
                    // Default F-States
                    //     INIT    - Assume we're already in this state when the PEP first loads.
                    //     PRELOAD - Use this state until our driver is loaded for the first time.
                    //     ABANDON - Use this state after our driver has been unloaded.
                    //----------------------------------------------------------------------------------
                    //
                    Package() { "INIT_FSTATE", 1 },
                    Package() { "PRELOAD_FSTATE", 0 },
                    Package() { "ABANDON_FSTATE", 0 },
                    
                    //----------------------------------------------------------------------------------
                    // C7.PS0 - Internal (Secondary) Display: MDP Reset Control
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        0,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        //----------------------------------------------------------------------------------
                        //  - Do Nothing
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            0,
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Reset Display Core
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            1,
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 0 },
                        Package() { "PREPARE_PSTATE", 0 },
                        Package() { "ABANDON_PSTATE", 0 },
                    },
                    //----------------------------------------------------------------------------------
                    // C7.PS1 - Internal (Secondary) Display : MDP Footswitch override
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        1,
                        
                        //----------------------------------------------------------------------------------
                        //  - Footswitch On
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            0,
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_disp_xo_clk",       1   }},
                            Package() { "CLOCK", Package() { "gcc_disp_ahb_clk",      1   }},
                            
                            // Action:       1 == ENABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "mdss_core_gdsc",    1    }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Footswitch Off
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            1,
                            
                            // Action:       2 == DISABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "mdss_core_gdsc",    2    }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_disp_ahb_clk",      2   }},
                            Package() { "CLOCK", Package() { "gcc_disp_xo_clk",       2   }},
                        },
                    },
                    //----------------------------------------------------------------------------------
                    // C7.PS2 - Internal (Secondary) Display : Power states for MDP scan-out HW
                    //
                    // @Brief:
                    // - Used to dynamically control MDP related clocks within a PState
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        2,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        //----------------------------------------------------------------------------------
                        //  - Vote for all scan-out resources
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            0,
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_ahb_clk",        1   }},
                            Package() { "CLOCK", Package() { "gcc_disp_axi_clk",            1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_axi_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_vsync_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_ahb_clk",   1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_vsync_clk", 1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_pclk0_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_esc0_clk",       1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte0_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte0_intf_clk", 1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_pclk1_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_esc1_clk",       1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte1_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte1_intf_clk", 1   }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Vote for only MDP, DSI 0 and DSI 1 scan-out resources
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            1,
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_ahb_clk",        1   }},
                            Package() { "CLOCK", Package() { "gcc_disp_axi_clk",            1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_axi_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_vsync_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_ahb_clk",   1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_vsync_clk", 1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_pclk0_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_esc0_clk",       1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte0_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte0_intf_clk", 1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_pclk1_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_esc1_clk",       1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte1_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte1_intf_clk", 1   }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Vote for only MDP and DSI 0 scan-out resources
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            2,
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                            
                            // Action:       1 == ENABLE
                            //               2 == DISABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_ahb_clk",        1   }},
                            Package() { "CLOCK", Package() { "gcc_disp_axi_clk",            1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_axi_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_vsync_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_ahb_clk",   1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_vsync_clk", 1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_pclk0_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_esc0_clk",       1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte0_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte0_intf_clk", 1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_pclk1_clk",      2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_esc1_clk",       2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte1_clk",      2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte1_intf_clk", 2   }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Vote for only MDP and DSI 1 scan-out resources
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            3,
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                            
                            // Action:       1 == ENABLE
                            //               2 == DISABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_ahb_clk",        1   }},
                            Package() { "CLOCK", Package() { "gcc_disp_axi_clk",            1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_axi_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_vsync_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_ahb_clk",   1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_vsync_clk", 1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_pclk0_clk",      2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_esc0_clk",       2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte0_clk",      2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte0_intf_clk", 2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_pclk1_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_esc1_clk",       1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte1_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte1_intf_clk", 1   }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Remove votes for all scan-out resources
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            4,
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name                    Action
                            //                              --------------------          ------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",        2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_vsync_clk",      2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_ahb_clk",   2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_vsync_clk", 2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_pclk0_clk",      2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_esc0_clk",       2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte0_clk",      2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte0_intf_clk", 2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_pclk1_clk",      2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_esc1_clk",       2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte1_clk",      2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_byte1_intf_clk", 2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_axi_clk",        2   }},
                            Package() { "CLOCK", Package() { "gcc_disp_axi_clk",            2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_ahb_clk",        2   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",          0,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 0 },
                        Package() { "PREPARE_PSTATE", 0 },
                        Package() { "ABANDON_PSTATE", 0 },
                    },
                    //----------------------------------------------------------------------------------
                    // C7.PS3 - Internal (Secondary) Display : MDP Core Clock Frequency
                    //
                    // @Brief:
                    // Notes:
                    // - This table reflects the frequency plan for the v1 part.
                    // - All core frequency votes are based on specific clock plan values and are cast
                    //   2 MHz below what we actually desire. This helps avoid potential issues with
                    //   round-up when the actual clock frequency on real HW is slightly less than
                    //   that which was advertized in the clock plan.
                    // - [NC] Temporarily moved all AHB bandwidth votes to F-states to help work around
                    //   64K size issue in the final AML.
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        3,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 1
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            0,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       430000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  298000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            1,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       412500000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  298000000,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            2,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       344000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  148000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            3,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       300000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  148000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            4,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       275000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  148000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            5,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       200000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  148000000,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 3
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            6,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       171428571,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            7,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       165000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            8,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       150000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            9,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       100000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            10,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,        85710000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            11,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,        19200000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            12,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,               0,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",          0,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 4 },
                        Package() { "PREPARE_PSTATE", 4 },
                        Package() { "ABANDON_PSTATE", 4 },
                    },
                    //----------------------------------------------------------------------------------
                    // C7.PS4 - Internal (Secondary) Display : Display Bandwidth to EBI
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        4,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 0
                        //----------------------------------------------------------------------------------
                        
                        //                                                          Req                                                                      IB           AB
                        //                                                          Type           Master                         Slave                    Bytes/Sec    Bytes/Sec
                        //                                                          ----   -----------------------        ----------------------           ----------   ----------
                        Package() { "PSTATE",   0, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 13326000000, 13326000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 13326000000 }},
                        },
                        Package() { "PSTATE",   1, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 12926000000, 12926000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 12926000000 }},
                        },
                        Package() { "PSTATE",   2, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 12526000000, 12526000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 12526000000 }},
                        },
                        Package() { "PSTATE",   3, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 12126000000, 12126000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 12126000000 }},
                        },
                        Package() { "PSTATE",   4, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 11726000000, 11726000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 11726000000 }},
                        },
                        Package() { "PSTATE",   5, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 11326000000, 11326000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 11326000000 }},
                        },
                        Package() { "PSTATE",   6, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 10926000000, 10926000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 10926000000 }},
                        },
                        Package() { "PSTATE",   7, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 10526000000, 10526000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 10526000000 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 1
                        //----------------------------------------------------------------------------------
                        
                        //                                                          Req                                                                      IB           AB
                        //                                                          Type           Master                         Slave                    Bytes/Sec    Bytes/Sec
                        //                                                          ----   -----------------------        ----------------------           ----------   ----------
                        Package() { "PSTATE",   8, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 10126000000, 10126000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 10126000000 }},
                        },
                        Package() { "PSTATE",   9, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 9600000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 9600000000 }},
                        },
                        Package() { "PSTATE",  10, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 9200000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 9200000000 }},
                        },
                        Package() { "PSTATE",  11, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 8800000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 8800000000 }},
                        },
                        Package() { "PSTATE",  12, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 8400000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 8400000000 }},
                        },
                        Package() { "PSTATE",  13, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 8000000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 8000000000 }},
                        },
                        Package() { "PSTATE",  14, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 7600000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 7600000000 }},
                        },
                        Package() { "PSTATE",  15, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 7200000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 7200000000 }},
                        },
                        Package() { "PSTATE",  16, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 6800000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 6800000000 }},
                        },
                        Package() { "PSTATE",  17, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 6400000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 6400000000 }},
                        },
                        Package() { "PSTATE",  18, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 6000000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 6000000000 }},
                        },
                        Package() { "PSTATE",  19, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 5600000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 5600000000 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        //                                                          Req                                                                      IB           AB
                        //                                                          Type           Master                         Slave                    Bytes/Sec    Bytes/Sec
                        //                                                          ----   -----------------------        ----------------------           ----------   ----------
                        Package() { "PSTATE",  20, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 5200000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 5200000000 }},
                        },
                        Package() { "PSTATE",  21, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 4800000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 4800000000 }},
                        },
                        Package() { "PSTATE",  22, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 4400000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 4400000000 }},
                        },
                        Package() { "PSTATE",  23, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 4000000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 4000000000 }},
                        },
                        Package() { "PSTATE",  24, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 3600000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 3600000000 }},
                        },
                        Package() { "PSTATE",  25, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 3200000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 3200000000 }},
                        },
                        Package() { "PSTATE",  26, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 8400000000, 2800000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 2800000000 }},
                        },
                        Package() { "PSTATE",  27, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 7200000000, 2400000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 2400000000 }},
                        },
                        Package() { "PSTATE",  28, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 6000000000, 2000000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 2000000000 }},
                        },
                        Package() { "PSTATE",  29, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000, 1600000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 1600000000 }},
                        },
                        Package() { "PSTATE",  30, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000, 1500000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 1500000000 }},
                        },
                        Package() { "PSTATE",  31, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000, 1400000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 1400000000 }},
                        },
                        Package() { "PSTATE",  32, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000, 1300000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 1300000000 }},
                        },
                        Package() { "PSTATE",  33, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000, 1200000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 1200000000 }},
                        },
                        Package() { "PSTATE",  34, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000, 1100000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 1100000000 }},
                        },
                        Package() { "PSTATE",  35, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000, 1000000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 1000000000 }},
                        },
                        Package() { "PSTATE",  36, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000,  900000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000,  900000000 }},
                        },
                        Package() { "PSTATE",  37, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000,  800000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000,  800000000 }},
                        },
                        Package() { "PSTATE",  38, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000,  700000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000,  700000000 }},
                        },
                        Package() { "PSTATE",  39, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000,  600000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000,  600000000 }},
                        },
                        Package() { "PSTATE",  40, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000,  500000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000,  500000000 }},
                        },
                        Package() { "PSTATE",  41, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000,  400000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000,  400000000 }},
                        },
                        Package() { "PSTATE",  42, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC",          0,          0 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",                     0,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 28 },
                        Package() { "PREPARE_PSTATE", 28 },
                        Package() { "ABANDON_PSTATE", 28 },
                    },
                },
            },
        })
        
        Return (GPCC)
    }
    
    //--------------------------------------------------------------------------------------
    //  C8  (qcdxkm850.sys) - Display Port Power States
    //--------------------------------------------------------------------------------------
    //
    Method (G8MD)
    {
        Name (GPCC, Package()
        {
            Package()
            {
                "DEVICE",
                "\\_SB.GPU0",
            
                Package()
                {
                    "COMPONENT",
                    8,
                    
                    
                    //----------------------------------------------------------------------------------
                    //  C8.F0  (qcdxkm850.sys) - Display Port Power States
                    //
                    //  - Empty state
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        0,
                    },
                    
                    //----------------------------------------------------------------------------------
                    //  C8.F1  (qcdxkm850.sys) - Display Port Power States
                    //
                    //  o Footswitches
                    //  -- BIMC_SMMU and MDSS footswitches
                    //  o Clocks
                    //  -- MDSS core/Vsync clocks
                    //  -- MDSS bus AHB / AXI
                    //  -- MDSS DP interface, pixel clocks
                    //  -- SMMU MDP axi clocks
                    //  o GPIOs
                    //  -- DP CC Out GPIO (Pin 38)
                    //  o Rails
                    //  -- LDO_1A  (VDDA_USB1_SS_DP_CON_CORE 0.88@68.6mA )
                    //  -- LDO_24A (PMI8998_VDD_PDPHY 3.075V@2.5mA)
                    //  -- LDO_26A (VDDA_USB1_SS_DP_CON_1P2 1.2v@30mA)
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        1,
                        
                        // Actions to take when entering this F-State
                        //
                        Package()
                        {
                            "ENTER",
                            
                            // Package()
                            // {
                            //     "TLMMGPIO",
                            //     Package()
                            //     {
                            //          38,  // TLMM GPIO       :  38 = DP CC OUT
                            //           1,  // State           :   1 = HIGH
                            //           0,  // Function Select :   0 = ??
                            //           0,  // Direction       :   0 = INPUT
                            //           0,  // Pull Type       :   0 = NOPULL
                            //           0,  // Drive Strength  :   0 = 2mA
                            //     },
                            // },
                            
                            Package()
                            {
                                "PMICVREGVOTE",
                                Package()
                                {
                                    "PPP_RESOURCE_ID_LDO1_A",
                                    1,           // Voltage Regulator Type, 1 = LDO
                                    0,           // Voltage (uV)
                                    0,           // Enable
                                    0,           // Power Mode
                                    0,           // Headroom
                                    "HLOS_DRV",  // DRV ID
                                    "REQUIRED",  // Set type
                                },
                            },
                            
                            Package()
                            {
                                "PMICVREGVOTE",
                                Package()
                                {
                                    "PPP_RESOURCE_ID_LDO24_A",
                                    1,           // Voltage Regulator Type, 1 = LDO
                                    0,           // Voltage (uV)
                                    0,           // Enable
                                    0,           // Power Mode
                                    0,           // Headroom
                                    "HLOS_DRV",  // DRV ID
                                    "REQUIRED",  // Set type
                                },
                            },
                            
                            Package()
                            {
                                "PMICVREGVOTE",
                                Package()
                                {
                                    "PPP_RESOURCE_ID_LDO26_A",
                                    1,           // Voltage Regulator Type, 1 = LDO
                                    0,           // Voltage (uV)
                                    0,           // Enable
                                    0,           // Power Mode
                                    0,           // Headroom
                                    "HLOS_DRV",  // DRV ID
                                    "REQUIRED",  // Set type
                                },
                            },
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name                      Action
                            //                              --------------------            ------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_ahb_clk",          2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_axi_clk",          2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",          2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_vsync_clk",        2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_ahb_clk",     2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_vsync_clk",   2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_dp_pixel_clk",     2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_dp_link_clk",      2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_dp_crypto_clk",    2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_dp_aux_clk",       2   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_dp_link_intf_clk", 2   }},
                            Package() { "CLOCK", Package() { "gcc_usb3_prim_clkref_en",       2   }},
                            Package() { "CLOCK", Package() { "gcc_usb_phy_cfg_ahb2phy_clk",   2   }},
                            
                            Package() { "PSTATE_SAVE" },
                            Package() { "PSTATE_ADJUST", Package() { 2, 12 }},
                            Package() { "PSTATE_ADJUST", Package() { 3, 42 }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",          0,          0 }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "mdss_core_gdsc",    2    }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_disp_ahb_clk",      2   }},
                            Package() { "CLOCK", Package() { "gcc_disp_xo_clk",       2   }},
                        },
                        
                        // Actions to take when exiting this F-State
                        //
                        Package()
                        {
                            "EXIT",
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_disp_xo_clk",       1   }},
                            Package() { "CLOCK", Package() { "gcc_disp_ahb_clk",      1   }},
                            
                            // Action:       1 == ENABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "mdss_core_gdsc",    1    }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name                      Action
                            //                              --------------------            ------
                            Package() { "CLOCK", Package() { "gcc_usb_phy_cfg_ahb2phy_clk",   1   }},
                            Package() { "CLOCK", Package() { "gcc_usb3_prim_clkref_en",       1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_ahb_clk",          1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_axi_clk",          1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",          1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_vsync_clk",        1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_ahb_clk",     1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_rscc_vsync_clk",   1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_dp_pixel_clk",     1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_dp_link_clk",      1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_dp_crypto_clk",    1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_dp_aux_clk",       1   }},
                            Package() { "CLOCK", Package() { "disp_cc_mdss_dp_link_intf_clk", 1   }},
                            
                            // Package()
                            // {
                            //     "TLMMGPIO",
                            //     Package()
                            //     {
                            //          38,  // TLMM GPIO       :  38 = DP CC OUT
                            //           1,  // State           :   1 = HIGH
                            //           1,  // Function Select :   1 = ??
                            //           1,  // Direction       :   1 = OUTPUT
                            //           0,  // Pull Type       :   0 = NOPULL
                            //           0,  // Drive Strength  :   0 = 2mA
                            //     },
                            // },
                            
                            Package()
                            {
                                "PMICVREGVOTE",
                                Package()
                                {
                                    "PPP_RESOURCE_ID_LDO26_A",
                                    1,           // Voltage Regulator Type, 1 = LDO
                                    1200000,     // Voltage (uV)
                                    1,           // Enable
                                    7,           // Power Mode
                                    0,           // Headroom
                                    "HLOS_DRV",  // DRV ID
                                    "REQUIRED",  // Set type
                                },
                            },
                            
                            Package()
                            {
                                "PMICVREGVOTE",
                                Package()
                                {
                                    "PPP_RESOURCE_ID_LDO24_A",
                                    1,           // Voltage Regulator Type, 1 = LDO
                                    3075000,     // Voltage (uV)
                                    1,           // Enable
                                    7,           // Power Mode
                                    0,           // Headroom
                                    "HLOS_DRV",  // DRV ID
                                    "REQUIRED",  // Set type
                                },
                            },
                            
                            Package()
                            {
                                "PMICVREGVOTE",
                                Package()
                                {
                                    "PPP_RESOURCE_ID_LDO1_A",
                                    1,           // Voltage Regulator Type, 1 = LDO
                                    880000,      // Voltage (uV)
                                    1,           // Enable
                                    7,           // Power Mode
                                    0,           // Headroom
                                    "HLOS_DRV",  // DRV ID
                                    "REQUIRED",  // Set type
                                },
                            },
                            
                            Package() { "PSTATE_RESTORE" },
                            Package() { "PSTATE_ADJUST", Package() { 2, 10 }},
                        },
                    },
                    
                    //----------------------------------------------------------------------------------
                    // Default F-States
                    //     INIT    - Assume we're already in this state when the PEP first loads.
                    //     PRELOAD - Use this state until our driver is loaded for the first time.
                    //     ABANDON - Use this state after our driver has been unloaded.
                    //----------------------------------------------------------------------------------
                    //
                    Package() { "INIT_FSTATE", 1 },
                    Package() { "PRELOAD_FSTATE", 0 },
                    Package() { "ABANDON_FSTATE", 0 },
                    
                    //----------------------------------------------------------------------------------
                    // C8.PS0 - DP: MDP Reset Control
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        0,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        //----------------------------------------------------------------------------------
                        //  - Do Nothing
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            0,
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Reset MDSS Core
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            1,
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 0 },
                        Package() { "PREPARE_PSTATE", 0 },
                        Package() { "ABANDON_PSTATE", 0 },
                    },
                    //----------------------------------------------------------------------------------
                    // C8.PS1 - External Display: MDP Footswitch override
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        1,
                        
                        //----------------------------------------------------------------------------------
                        //  - Footswitch On
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            0,
                            
                            // Action:       1 == ENABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_disp_xo_clk",       1   }},
                            Package() { "CLOCK", Package() { "gcc_disp_ahb_clk",      1   }},
                            
                            // Action:       1 == ENABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "mdss_core_gdsc",    1    }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        //  - Footswitch Off
                        //----------------------------------------------------------------------------------
                        //
                        Package()
                        {
                            "PSTATE",
                            1,
                            
                            // Action:       2 == DISABLE
                            //
                            //                                   Domain Name          Action
                            //                                   ----------------     ------
                            Package() { "FOOTSWITCH", Package() { "mdss_core_gdsc",    2    }},
                            
                            // Action:       2 == DISABLE
                            //
                            //                              Clock Name               Action
                            //                              --------------------     ------
                            Package() { "CLOCK", Package() { "gcc_disp_ahb_clk",      2   }},
                            Package() { "CLOCK", Package() { "gcc_disp_xo_clk",       2   }},
                        },
                    },
                    //----------------------------------------------------------------------------------
                    // C8.PS2 - DP: MDP Core Clock Frequency
                    //
                    // @Brief:
                    // Notes:
                    // - This table reflects the frequency plan for the v1 part.
                    // - All core frequency votes are based on specific clock plan values and are cast
                    //   2 MHz below what we actually desire. This helps avoid potential issues with
                    //   round-up when the actual clock frequency on real HW is slightly less than
                    //   that which was advertized in the clock plan.
                    // - [NC] Temporarily moved all AHB bandwidth votes to F-states to help work around
                    //   64K size issue in the final AML.
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        2,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 1
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            0,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       430000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  298000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            1,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       412500000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  298000000,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            2,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       344000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  148000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            3,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       300000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  148000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            4,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       275000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  148000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            5,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       200000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",  148000000,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 3
                        //----------------------------------------------------------------------------------
                        
                        Package()
                        {
                            "PSTATE",
                            6,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       171428571,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            7,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       165000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            8,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       150000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            9,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,       100000000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            10,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,        85710000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            11,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,        19200000,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",   75000000,          0 }},
                        },
                        
                        Package()
                        {
                            "PSTATE",
                            12,
                            
                            // Action:       3 == SETFREQUENCY
                            // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                            //
                            //                              Clock Name               Action    Frequency   MatchType
                            //                              --------------------     ------    ----------  ---------
                            Package() { "CLOCK", Package() { "disp_cc_mdss_mdp_clk",  3,               0,       1   }},
                            
                            //                               Req                                                              IB           AB
                            //                               Type           Master                     Slave                Bytes/Sec    Bytes/Sec
                            //                               ----   -----------------------    ----------------------       ----------   ----------
                            Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_APPSS_PROC",  "ICBID_SLAVE_DISPLAY_CFG",          0,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 4 },
                        Package() { "PREPARE_PSTATE", 4 },
                        Package() { "ABANDON_PSTATE", 4 },
                    },
                    //----------------------------------------------------------------------------------
                    // C8.PS3 - DP: Display Bandwidth to EBI
                    //
                    // @Brief:
                    // Notes:
                    // - AXI port 0 is strictly used by the scanout logic today, so the bandwidth values
                    //   in this table were selected to span the full range of potential scanout needs for
                    //   8064 in such a way that no request will be rounded up by more than 10%. The
                    //   bottom end of the range is driven by the simple scenario of a single RGB layer on
                    //   a VGA sized primary display:
                    // 
                    //       640 * 400 * 60Hz * 4Bytes/pixel = 73,728,000 Bytes/Sec
                    // 
                    //   The top end of the range is meant to support the maximum allowable primary display
                    //   resolution (i.e. WUXGA) with one RGB layer and one YUV layer, plus an DP display
                    //   with one RGB layer and one YUV layer:
                    // 
                    //         1920 * 1200 * 60Hz * 4Bytes/Pixel   = 552,960,000 Bytes/Sec
                    //       + 1920 * 1200 * 60Hz * 1.5Bytes/Pixel = 207,360,000 Bytes/Sec
                    //       + 1920 * 1080 * 60Hz * 4Bytes/Pixel   = 497,664,000 Bytes/Sec
                    //       + 1920 * 1080 * 60Hz * 1.5Bytes/Pixel = 186,624,000 Bytes/Sec
                    //       -----------------------
                    //       1,444,608,000 Bytes/Sec
                    // 
                    //   Within the table, the arbitrated bandwidth values are each padded by 10 0.000000or
                    //   headroom, and the instantaneous bandwidth values are padded by an additional 10%
                    //   to help account for the bursty nature of scan-line fetches.
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "PSTATE_SET",
                        3,
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 0
                        //----------------------------------------------------------------------------------
                        
                        //                                                          Req                                                                      IB           AB
                        //                                                          Type           Master                         Slave                    Bytes/Sec    Bytes/Sec
                        //                                                          ----   -----------------------        ----------------------           ----------   ----------
                        Package() { "PSTATE",   0, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 13326000000, 13326000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 13326000000 }},
                        },
                        Package() { "PSTATE",   1, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 12926000000, 12926000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 12926000000 }},
                        },
                        Package() { "PSTATE",   2, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 12526000000, 12526000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 12526000000 }},
                        },
                        Package() { "PSTATE",   3, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 12126000000, 12126000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 12126000000 }},
                        },
                        Package() { "PSTATE",   4, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 11726000000, 11726000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 11726000000 }},
                        },
                        Package() { "PSTATE",   5, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 11326000000, 11326000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 11326000000 }},
                        },
                        Package() { "PSTATE",   6, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 10926000000, 10926000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 10926000000 }},
                        },
                        Package() { "PSTATE",   7, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 10526000000, 10526000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 10526000000 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 1
                        //----------------------------------------------------------------------------------
                        
                        //                                                          Req                                                                      IB           AB
                        //                                                          Type           Master                         Slave                    Bytes/Sec    Bytes/Sec
                        //                                                          ----   -----------------------        ----------------------           ----------   ----------
                        Package() { "PSTATE",   8, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 10126000000, 10126000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 10126000000 }},
                        },
                        Package() { "PSTATE",   9, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 9600000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 9600000000 }},
                        },
                        Package() { "PSTATE",  10, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 9200000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 9200000000 }},
                        },
                        Package() { "PSTATE",  11, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 8800000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 8800000000 }},
                        },
                        Package() { "PSTATE",  12, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 8400000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 8400000000 }},
                        },
                        Package() { "PSTATE",  13, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 8000000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 8000000000 }},
                        },
                        Package() { "PSTATE",  14, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 7600000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 7600000000 }},
                        },
                        Package() { "PSTATE",  15, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 7200000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 7200000000 }},
                        },
                        Package() { "PSTATE",  16, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 6800000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 6800000000 }},
                        },
                        Package() { "PSTATE",  17, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 6400000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 6400000000 }},
                        },
                        Package() { "PSTATE",  18, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 6000000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 6000000000 }},
                        },
                        Package() { "PSTATE",  19, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 5600000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 5600000000 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // P-States at Voltage Level = 2
                        //----------------------------------------------------------------------------------
                        
                        //                                                          Req                                                                      IB           AB
                        //                                                          Type           Master                         Slave                    Bytes/Sec    Bytes/Sec
                        //                                                          ----   -----------------------        ----------------------           ----------   ----------
                        Package() { "PSTATE",  20, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 5200000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 5200000000 }},
                        },
                        Package() { "PSTATE",  21, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 4800000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 4800000000 }},
                        },
                        Package() { "PSTATE",  22, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 4400000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 4400000000 }},
                        },
                        Package() { "PSTATE",  23, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 4000000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 4000000000 }},
                        },
                        Package() { "PSTATE",  24, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 3600000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 3600000000 }},
                        },
                        Package() { "PSTATE",  25, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 9600000000, 3200000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 3200000000 }},
                        },
                        Package() { "PSTATE",  26, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 8400000000, 2800000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 2800000000 }},
                        },
                        Package() { "PSTATE",  27, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 7200000000, 2400000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 2400000000 }},
                        },
                        Package() { "PSTATE",  28, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 6000000000, 2000000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 2000000000 }},
                        },
                        Package() { "PSTATE",  29, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000, 1600000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 1600000000 }},
                        },
                        Package() { "PSTATE",  30, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000, 1500000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 1500000000 }},
                        },
                        Package() { "PSTATE",  31, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000, 1400000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 1400000000 }},
                        },
                        Package() { "PSTATE",  32, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000, 1300000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 1300000000 }},
                        },
                        Package() { "PSTATE",  33, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000, 1200000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 1200000000 }},
                        },
                        Package() { "PSTATE",  34, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000, 1100000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 1100000000 }},
                        },
                        Package() { "PSTATE",  35, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000, 1000000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000, 1000000000 }},
                        },
                        Package() { "PSTATE",  36, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000,  900000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000,  900000000 }},
                        },
                        Package() { "PSTATE",  37, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000,  800000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000,  800000000 }},
                        },
                        Package() { "PSTATE",  38, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000,  700000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000,  700000000 }},
                        },
                        Package() { "PSTATE",  39, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000,  600000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000,  600000000 }},
                        },
                        Package() { "PSTATE",  40, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000,  500000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000,  500000000 }},
                        },
                        Package() { "PSTATE",  41, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 4800000000,  400000000 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",             800000000,  400000000 }},
                        },
                        Package() { "PSTATE",  42, 
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MDP0",            "ICBID_SLAVE_MNOC_HF_MEM_NOC",          0,          0 }},
                                                   Package() { "BUSARB", Package() { 3,     "ICBID_MASTER_MNOC_HF_MEM_NOC", "ICBID_SLAVE_EBI1",                     0,          0 }},
                        },
                        
                        //----------------------------------------------------------------------------------
                        // Default P-States:
                        //     PRELOAD - Use this state until our driver is loaded for the first time.
                        //     PREPARE - Use this state when our driver is about to load.
                        //     ABANDON - Use this state after our driver has been unloaded.
                        //----------------------------------------------------------------------------------
                        //
                        Package() { "PRELOAD_PSTATE", 28 },
                        Package() { "PREPARE_PSTATE", 28 },
                        Package() { "ABANDON_PSTATE", 28 },
                    },
                },
            },
        })
        
        Return (GPCC)
    }
    
    //--------------------------------------------------------------------------------------
    //  C9  (qcdxkm850.sys) - Dummy Component for WP Workaround
    //
    //  This component does nothing, but is currently required on WP because of an
    //  apparent OS bug.
    //  
    //  In the previous power framework, there were several components that existed only
    //  only to house P-states. These components were voted active at the beginning of
    //  time, and never went idle. As a side-effect of having always-active components,
    //  our driver never left D0.
    //  
    //  In the new power framework, all components have an actual purpose and their
    //  active/idle states have meaning. When the power button is hit and the last of our
    //  components goes idle, we now receive notification of a transition to D3. The
    //  problem, however, is that our display never comes back after this. Once we've
    //  reached this state, we see no VidPn activity from the OS and no attempts to
    //  return the display component to F0.
    //  
    //  As a workaround, we need to keep at least one component active at all times such
    //  that we keep ourselves in D0. If the runtime code finds a component with the name
    //  "ALWAYS_ACTIVE_WP", it adds an additional active vote that is never removed.
    //--------------------------------------------------------------------------------------
    //
    Method (G9MD)
    {
        Name (GPCC, Package()
        {
            Package()
            {
                "DEVICE",
                "\\_SB.GPU0",
            
                Package()
                {
                    "COMPONENT",
                    9,
                    
                    
                    //----------------------------------------------------------------------------------
                    //  C9.F0  (qcdxkm850.sys) - Dummy Component for WP Workaround
                    //----------------------------------------------------------------------------------
                    //
                    Package()
                    {
                        "FSTATE",
                        0,
                    },
                    
                    //----------------------------------------------------------------------------------
                    // Default F-States
                    //     INIT    - Assume we're already in this state when the PEP first loads.
                    //     PRELOAD - Use this state until our driver is loaded for the first time.
                    //     ABANDON - Use this state after our driver has been unloaded.
                    //----------------------------------------------------------------------------------
                    //
                    Package() { "INIT_FSTATE", 0 },
                    Package() { "PRELOAD_FSTATE", 0 },
                    Package() { "ABANDON_FSTATE", 0 },
                    
                },
            },
        })
        
        Return (GPCC)
    }
}
