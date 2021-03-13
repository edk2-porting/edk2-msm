/**
 * This file contains debugger and debugger power resource information used by
 * the PEP driver.
 */
Scope(\_SB.PEP0)
{
    Method(LDBG){
        return(NDBG)
    }

    Name( NDBG,
        /**
         * The debuggers package is used by PEP to detect when a debugger is connected,
         * turn on the required power resources for a debugger and to turn off all
         * debugger related resources when not in use (this logic is encompassed in PEP).
         *
         * The expected hiearchy of this package:
         * DEBUGGERS
         *      TYPE
         *          String = SERIAL, USB2.0, USB3.0
         *          INSTANCES
         *              The instancepath of the drivers which the debugger impersonates
         *          DEBUG_ON
         *              The resources that need to be turned on for the debugger to work
         *              for the given controller type (SERIAL/USB2.0/USB3.0)
         *          DEBUG_OFF
         *              The resources to turn off when no debugger is connected for this
         *              debugger type and no HLOS driver is loaded for any one of the given
         *              HLOS types. The implementation for this feature is documented within
         *              PEP.
         *
         */
        package(){
            "DEBUGGERS",
            package()
            {
                "TYPE",
                "SERIAL",
                package()
                {
                    "INSTANCES",
                    "\\_SB.UARD",
                },

                package()
                {
                    "DEBUG_ON",
                    /**
                     *  There is a limitation with KDCOM port, if RX engine is runnign when system  
                     *  enters deeper sleep mode, the UART can result in undefined behaviour, this may
                     *  could lead to loss of Windbg connection.
                     **/
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_m_ahb_clk",  1}},// enable clock
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_m_ahb_clk",  9,8}},// mark suppressible
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_m_ahb_clk",  9,12}},// always ON

                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_s_ahb_clk",  1}},  
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_s_ahb_clk",  9,8 }},  // mark suppressible
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_s_ahb_clk",  9,12 }}, // always ON

                    //Package(){"CLOCK",  Package(){"gcc_qupv3_wrap1_s1_clk",3,7372800,4}}, //update frequency
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap1_s1_clk",  1}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap1_s1_clk",  9,8}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap1_s1_clk",  9,12}},
                    
                    Package() {"BUSARB", Package() {3, "ICBID_MASTER_BLSP_2", "ICBID_SLAVE_EBI1", 10000000,1666,"HLOS_DRV", "SUPPRESSIBLE"}},
                    Package() {"BUSARB", Package() {3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_BLSP_2", 10000000,5000000,"HLOS_DRV", "SUPPRESSIBLE"}},
                },

                package()
                {
                    "DEBUG_OFF",
                }
            },

            // Secondary USB Port Debugger
            package()
            {
                "TYPE",
                "USB2.0",
                package()
                {
                    "INSTANCES",
                    "\\_SB.USB1",
                    //URS1 specific
                    //"\\_SB.URS1",
                },

                package()
                {
                    "DEBUG_ON",

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
                        // L24 - VDDA_QUSB_HS0_3P1
                          "PMICVREGVOTE",                                   // PMIC VREG resource
                        package()                                           // Vote for L24 @ 3.075v
                        {
                            "PPP_RESOURCE_ID_LDO24_A",                      // Voltage Regulator ID
                            1,                                              // Voltage Regulator type 1 = LDO
                            3075000,                                        // Voltage = 3.075 V
                            1,                                              // SW Enable = Enable
                            7,                                              // SW Power Mode = NPM
                            0,                                              // Head Room
                        },
                    },
                    package()
                    {
                        // L26 - VDDA_USB_SS_1P2 (QMP PHY)
                       "PMICVREGVOTE",                                   // PMIC VREG resource
                       package()                                         // Vote for L2 @1.2v
                       {
                            "PPP_RESOURCE_ID_LDO26_A",                      // Voltage Regulator ID
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
                        package()                                         // Vote for L1 @ 0.88v
                        {
                            "PPP_RESOURCE_ID_LDO1_A",                       // Voltage Regulator ID
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
                            1,                  //1==Enable
                        },
                    },

                    // Mark Suppressible for USB 3.0 Sleep Clock
                    package() { "CLOCK", package() { "gcc_usb30_sec_sleep_clk", 9, 8,}},
                    // Mark Always On for USB 3.0 Sleep Clock
                    package() { "CLOCK", package() { "gcc_usb30_sec_sleep_clk", 9, 12,}},
                    // Enable USB 3.0 Sleep Clock
                    package() { "CLOCK", package() { "gcc_usb30_sec_sleep_clk", 1}},

                    // Mark Suppressible for USB PHY pipe Clock
                    package() { "CLOCK", package() { "gcc_usb3_sec_phy_pipe_clk", 9, 8,}},
                    // Mark Always ON for USB PHY pipe Clock
                    package() { "CLOCK", package() { "gcc_usb3_sec_phy_pipe_clk", 9, 12,}},
                    // Enable PHY pipe Clock
                    package() { "CLOCK", package() { "gcc_usb3_sec_phy_pipe_clk", 1}},

                    // Mark Suppressible for gcc_aggre_usb3_sec_axi_clk
                    package() { "CLOCK", package() { "gcc_aggre_usb3_sec_axi_clk", 9, 8,}},
                    // Mark Always ON for gcc_aggre_usb3_sec_axi_clk
                    package() { "CLOCK", package() { "gcc_aggre_usb3_sec_axi_clk", 9, 12,}},
                    //aggre_usb3_sec_axi Clock @ 120 MHz 8 = Set & Enable; 120,9 -> Atleast 120 Mhz
                    package() {"CLOCK", package() {"gcc_aggre_usb3_sec_axi_clk", 8, 120, 9}},

                    // Mark Suppressible for gcc_cfg_noc_usb3_sec_axi_clk
                    package() { "CLOCK", package() { "gcc_cfg_noc_usb3_sec_axi_clk", 9, 8,}},
                    // Mark Always ON for gcc_cfg_noc_usb3_sec_axi_clk
                    package() { "CLOCK", package() { "gcc_cfg_noc_usb3_sec_axi_clk", 9, 12,}},
                    // gcc_cfg_noc_usb3_sec_axi_clk should be configured to the frequency as master clock
                    // @ 120 MHz 8 = Set & Enable; 120,9 -> Atleast 120 Mhz
                    package() {"CLOCK", package() {"gcc_cfg_noc_usb3_sec_axi_clk", 8, 120, 9}},

                    // Mark Suppressible for gcc_usb30_sec_master_clk
                    package() { "CLOCK", package() { "gcc_usb30_sec_master_clk", 9, 8,}},
                    // Mark Always ON for gcc_usb30_sec_master_clk
                    package() { "CLOCK", package() { "gcc_usb30_sec_master_clk", 9, 12,}},
                    // USB 3.0 Master Clock @ 120 MHz 8 = Set & Enable; 120,9 -> Atleast 120 Mhz
                    package() {"CLOCK", package() {"gcc_usb30_sec_master_clk", 8, 120, 9}},

                    // Mark Suppressible for gcc_usb3_sec_phy_aux_clk
                    package() { "CLOCK", package() { "gcc_usb3_sec_phy_aux_clk", 9, 8,}},
                    // Mark Always ON for gcc_usb3_sec_phy_aux_clk
                    package() { "CLOCK", package() { "gcc_usb3_sec_phy_aux_clk", 9, 12,}},
                    // Phy Aux Clock @ 1.2 Mhz 8 = Set & Enable; 1.2, 7 -> Closest 1.2 Mhz
                    package() {"CLOCK", package() {"gcc_usb3_sec_phy_aux_clk", 8, 1200, 7}},

                    // Mark Suppressible for gcc_usb_phy_cfg_ahb2phy_clk
                    package() { "CLOCK", package() { "gcc_usb_phy_cfg_ahb2phy_clk", 9, 8,}},
                    // Mark Always ON for gcc_usb_phy_cfg_ahb2phy_clk
                    package() { "CLOCK", package() { "gcc_usb_phy_cfg_ahb2phy_clk", 9, 12,}},
                    // Enable gcc_usb_phy_cfg_ahb2phy_clk, Frequency need not be set since its synced to CNOC
                    package() {"CLOCK", package() {"gcc_usb_phy_cfg_ahb2phy_clk", 1}},

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
                            0,                          // AB=0 MBps
                            "HLOS_DRV",                 // Optional: DRV Id
                            "SUPPRESSIBLE",             // Optional: Set Type
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
                            671088640,              // AB=5Gbps
                            "HLOS_DRV",             // Optional: DRV Id
                            "SUPPRESSIBLE",         // Optional: Set Type
                        }
                    },

                    //Nominal==block vdd_min:
                    package() {"NPARESOURCE",Package() {1, "/arc/client/rail_cx", 256, "SUPPRESSIBLE"}},
                },
                package()
                {
                    "DEBUG_OFF",
                }
            },

            package()
            {
                "TYPE",
                "USB3.0",
                package()
                {
                    "INSTANCES",
                    "\\_SB.URS0",
                },

                package()
                {
                    "DEBUG_ON",
                    // LDO1, 26, 12, 24

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
                        // L24 - VDDA_QUSB_HS0_3P1
                          "PMICVREGVOTE",                                   // PMIC VREG resource
                        package()                                         // Vote for L24 @ 3.075v
                        {
                            "PPP_RESOURCE_ID_LDO24_A",                      // Voltage Regulator ID
                            1,                                              // Voltage Regulator type 1 = LDO
                            3075000,                                        // Voltage = 3.075 V
                            1,                                              // SW Enable = Enable
                            7,                                              // SW Power Mode = NPM
                            0,                                              // Head Room
                        },
                    },
                    package()
                    {
                        // L26 - VDDA_USB_SS_1P2 (QMP PHY)
                       "PMICVREGVOTE",                                   // PMIC VREG resource
                       package()                                         // Vote for L2 @1.2v
                       {
                          "PPP_RESOURCE_ID_LDO26_A",                       // Voltage Regulator ID
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
                        package()                                         // Vote for L1 @ 0.88v
                        {
                            "PPP_RESOURCE_ID_LDO1_A",                       // Voltage Regulator ID
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

                    // Enable PHY pipe Clock
                    package() { "CLOCK", package() { "gcc_usb3_prim_phy_pipe_clk", 1}},
                    // Mark Suppressible for USB PHY pipe Clock
                    package() { "CLOCK", package() { "gcc_usb3_prim_phy_pipe_clk", 9, 8,}},
                    // Mark Always ON for USB PHY pipe Clock
                    package() { "CLOCK", package() { "gcc_usb3_prim_phy_pipe_clk", 9, 12,}},

                    // Mark Suppressible for gcc_aggre_usb3_prim_axi_clk
                    package() { "CLOCK", package() { "gcc_aggre_usb3_prim_axi_clk", 9, 8,}},
                    // Mark Always ON for gcc_aggre_usb3_prim_axi_clk
                    package() { "CLOCK", package() { "gcc_aggre_usb3_prim_axi_clk", 9, 12,}},
                    //aggre_usb3_prim_axi Clock @ 120 MHz 8 = Set & Enable; 120,9 -> Atleast 120 Mhz
                    package() {"CLOCK", package() {"gcc_aggre_usb3_prim_axi_clk",  8, 120, 9}},

                    // Mark Suppressible for gcc_cfg_noc_usb3_prim_axi_clk
                    package() { "CLOCK", package() { "gcc_cfg_noc_usb3_prim_axi_clk", 9, 8,}},
                    // Mark Always ON for gcc_cfg_noc_usb3_prim_axi_clk
                    package() { "CLOCK", package() { "gcc_cfg_noc_usb3_prim_axi_clk", 9, 12,}},
                    // gcc_cfg_noc_usb3_prim_axi_clk should be configured to the frequency as master clock
                    // @ 120 MHz 8 = Set & Enable; 120,9 -> Atleast 120 Mhz
                    package() {"CLOCK", package() {"gcc_cfg_noc_usb3_prim_axi_clk", 8, 120, 9}},

                    // Mark Suppressible for gcc_usb30_prim_master_clk
                    package() { "CLOCK", package() { "gcc_usb30_prim_master_clk", 9, 8,}},
                    // Mark Always ON for gcc_usb30_prim_master_clk
                    package() { "CLOCK", package() { "gcc_usb30_prim_master_clk", 9, 12,}},
                    // USB 3.0 Master Clock @ 120 MHz 8 = Set & Enable; 120,9 -> Atleast 120 Mhz
                    package() {"CLOCK", package() {"gcc_usb30_prim_master_clk", 8, 120, 9}},

                    // Mark Suppressible for gcc_usb3_prim_phy_aux_clk
                    package() { "CLOCK", package() { "gcc_usb3_prim_phy_aux_clk", 9, 8,}},
                    // Mark Always ON for gcc_usb3_prim_phy_aux_clk
                    package() { "CLOCK", package() { "gcc_usb3_prim_phy_aux_clk", 9, 12,}},
                    // Phy Aux Clock @ 1.2 Mhz 8 = Set & Enable; 1.2, 7 -> Closest 1.2 Mhz
                    package() {"CLOCK", package() {"gcc_usb3_prim_phy_aux_clk", 8, 1200, 7}},

                    // Mark Suppressible for gcc_usb_phy_cfg_ahb2phy_clk
                    package() { "CLOCK", package() { "gcc_usb_phy_cfg_ahb2phy_clk", 9, 8,}},
                    // Mark Always ON for gcc_usb_phy_cfg_ahb2phy_clk
                    package() { "CLOCK", package() { "gcc_usb_phy_cfg_ahb2phy_clk", 9, 12,}},
                    // Enable gcc_usb_phy_cfg_ahb2phy_clk, Frequency need not be set since its synced to CNOC
                    package() {"CLOCK", package() {"gcc_usb_phy_cfg_ahb2phy_clk", 1}},

                    // Vote for CNOC 100 MHz - 400 MB/s IB-only (AB = 0) 
                    // Required for gcc_usb_phy_cfg_ahb2phy_clk
                    //BUS Arbiter Request (Type-3)
                    package()
                    {
                        "BUSARB",
                        package()
                        {
                            3,                           // Req Type
                            "ICBID_MASTER_APPSS_PROC",   // Master
                            "ICBID_SLAVE_USB3_0",        // Slave
                            400000000,                   // IB=400 MBps
                            0,                           // AB=0 MBps
                            "HLOS_DRV",                  // Optional: DRV Id
                            "SUPPRESSIBLE",              // Optional: Set Type
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
                            671088640,              // AB=5Gbps
                            "HLOS_DRV",             // Optional: DRV Id
                            "SUPPRESSIBLE",         // Optional: Set Type
                        }
                    },

                    //Nominal==block vdd_min:
                    package() {"NPARESOURCE",Package() {1, "/arc/client/rail_cx", 256, "SUPPRESSIBLE"}},

                },
                package()
                {
                    "DEBUG_OFF",
                }
            },
        })
}
