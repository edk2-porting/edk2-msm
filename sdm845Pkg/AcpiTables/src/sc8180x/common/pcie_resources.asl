//===========================================================================
//                           <pcie_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by pcie subsystem.
//
//
//   Copyright (c) 2017 by Mmoclauq Technologies Inc. All Rights Reserved.
//   Mmoclauq Confidential and Proprietary
//
//===========================================================================


Scope(\_SB_.PEP0)
{
    // PCIe Intra-Soc ports
    Method(PEMD)
    {
        // Check chip major revision
        If(LGreaterEqual(\_SB_.SVMJ, 0x0000000000000002)) 
        {
            Return (PEMC)
        }
        else 
        {
            Return(PEMX) //disable NVMe power management for v1 devices
        }
    }
    
    Name(PEMC,
    package()
    {
        Package()
        {
            "DEVICE",
            "\\_SB.PCI0",
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
                "DSTATE",
                0x0, // D0 state
                
                /* PCIE Analog */
                package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                      package()                             // Vote for LDO3 @1.2v
                      {
                        "PPP_RESOURCE_ID_LDO3_C",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        1200000,                            // Voltage (uV)
                        1,                                  // Enable = Enable
                        1,                                  // Power Mode = NPM
                        0,                                  // Head Room
                      },
                },

                /* PCIE Core */
                Package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package()                               // Vote for LDO5 @0.88V
                    {
                        "PPP_RESOURCE_ID_LDO5_E",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator Type = LDO
                        880000,                             // Voltage (uV)
                        1,                                  // Enable = Enable
                        1,                                  // Power Mode = NPM
                        0,                                  // Headroom
                    },
                },
                
                /* Turning on PCIe core */
                Package() { "FOOTSWITCH", Package() { "pcie_0_gdsc", 1}},

                /* ICB votes through PSTATE */
                /* vote for 75 MB/s config NOC bandwidth */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_PCIE_0_CFG", 75000000, 0}},
                /* vote for 980 MB/s SNOC bandwidth for x1 */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_PCIE_0", "ICBID_SLAVE_EBI1", 980000000, 980000000}},

                /* Votes CX to nominal */
                package() {"NPARESOURCE",Package() {1, "/arc/client/rail_cx", 256, "SUPPRESSIBLE"}},

                package() {"CLOCK", package() {"gcc_pcie_phy_aux_clk", 1}},
                package() {"CLOCK", package() {"gcc_aggre_noc_pcie_tbu_clk", 1}},
				
                package() {"CLOCK", package() {"gcc_pcie_0_pipe_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_0_slv_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_0_slv_q2a_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_0_mstr_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_0_cfg_ahb_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_0_aux_clk", 8, 19200000, 3}},
                package() {"CLOCK", package() {"gcc_pcie0_phy_refgen_clk", 8, 100000000, 3}},
				
                /* CLKREQ */
                package()
                {
                    "TLMMGPIO", // TLMM resource
                    package()
                    {
                        36, // PIN Number
                        0,  // State: 0: Low, 1: High
                        1,  // Function select: 1
                        0,  // direction 0: Input, 1: Output.
                        3,  // Pull value: 0: No Pull, 1: Pull Down, 2: Keeper, 3: Pull Up
                        0,  // Drive Strength: 0: 2mA, 1: 4mA, 2: 6mA, 3: 8mA, 4: 10mA, 5: 12mA, 6: 14mA, 7: 16mA
                        0,  // Enable low power state
                    },
                },

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

                package() {"CLOCK", package() {"gcc_pcie_0_aux_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_0_slv_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_0_slv_q2a_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_0_mstr_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_0_cfg_ahb_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie0_phy_refgen_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_0_pipe_clk", 2}},
                
                /* common clocks */
                package() {"CLOCK", package() {"gcc_pcie_phy_aux_clk", 2}},
                package() {"CLOCK", package() {"gcc_aggre_noc_pcie_tbu_clk", 2}},

                /* Suppress the votes for CX nominal */
                package() {"NPARESOURCE",Package() {1, "/arc/client/rail_cx", 16, "SUPPRESSIBLE"}},

                /* ICB votes */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_PCIE_0_CFG", 0, 0}},
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_PCIE_0", "ICBID_SLAVE_EBI1", 0, 0}},

                /* Turn off PCIe core */
                Package() { "FOOTSWITCH", Package() { "pcie_0_gdsc", 2}},

                /* PCIE Analog */
                package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                      package()                             // Vote for LDO3
                      {
                        "PPP_RESOURCE_ID_LDO3_C",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        0,                                  // Voltage (uV)
                        0,                                  // Enable = Disable
                        0,                                  // Power Mode = NPM
                        0,                                  // Head Room
                      },
                },

                /* PCIE Core */
                Package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package()                               // Vote for LDO5
                    {
                        "PPP_RESOURCE_ID_LDO5_E",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator Type = LDO
                        0,                                  // Voltage (uV)
                        0,                                  // Enable = Disable
                        0,                                  // Power Mode = NPM
                        0,                                  // Headroom
                    },
                },
            },
            
            Package()
            {
                "CRASHDUMP_EXCEPTION",                    
                Package() { "EXECUTE_FUNCTION", Package() { "ExecuteOcdPCIeExceptions"}},
            },
            
            Package()
            {
                "CRASHDUMP_DSTATE",
                0,
            },
        },

        Package()
        {
            "DEVICE",
            "\\_SB.PCI0.RP1",

            Package()
            {
                "COMPONENT",
                0x0, // Component 0
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
            "\\_SB.PCI1",
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
                "DSTATE",
                0x0, // D0 state
                
                /* NVMe power rail */
                package()
                {
                    "PMICVREGVOTE", // PMICVREGVOTE resource
                    package()
                    {	
                        "PPP_RESOURCE_ID_SMPS8_C", 
                        2,     	// Voltage Regulator type = SMPS
                        1800000,// 1.8V
                        1,      // Software enable - Enable
                        0,      // Software power mode - AUTO
                        0,      // Head room voltage
                    },
                },
                
                /* NVMe DBB1 & DBU4 */
                package()
                {
                    "PMICGPIO", 
                    package()
                    {                                                                   
                        "IOCTL_PM_GPIO_CONFIG_DIGITAL_OUTPUT", // GPIO or GPIO IOCTL
                        2, // PMIC_C
                        10,// GPIO 11
                        0, // PM_GPIO_OUT_BUFFER_CONFIG_CMOS
                        1, // PM_GPIO_VIN1
                        10,// PM_GPIO_SOURCE_HIGH
                        3, // PM_GPIO_OUT_BUFFER_HIGH
                        4, // PM_GPIO_I_SOURCE_PULL_DOWN_10uA
                    },
                },
                
                /* PCIE Analog */
                package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                      package()                             // Vote for LDO3 @1.2v
                      {
                        "PPP_RESOURCE_ID_LDO3_C",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        1200000,                            // Voltage (uV)
                        1,                                  // Enable = Enable
                        1,                                  // Power Mode = NPM
                        0,                                  // Head Room
                      },
                },

                /* PCIE Core */
                Package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package()                               // Vote for LDO5 @0.88V
                    {
                        "PPP_RESOURCE_ID_LDO5_E",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator Type = LDO
                        880000,                             // Voltage (uV)
                        1,                                  // Enable = Enable
                        1,                                  // Power Mode = NPM
                        0,                                  // Headroom
                    },
                },
                
                /* Turning on PCIe core */
                Package() { "FOOTSWITCH", Package() { "pcie_1_gdsc", 1}},

                /* ICB votes through PSTATE */
                /* vote for 75 MB/s config NOC bandwidth */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_PCIE_1_CFG", 75000000, 0}},
                /* vote for 1960 MB/s SNOC bandwidth for x2 */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_PCIE_1", "ICBID_SLAVE_EBI1", 1960000000, 1960000000}},

                /* Votes CX to nominal */
                package() {"NPARESOURCE",Package() {1, "/arc/client/rail_cx", 256, "SUPPRESSIBLE"}},

                package() {"CLOCK", package() {"gcc_pcie_phy_aux_clk", 1}},
                package() {"CLOCK", package() {"gcc_aggre_noc_pcie_tbu_clk", 1}},
			
                package() {"CLOCK", package() {"gcc_pcie_1_pipe_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_1_slv_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_1_slv_q2a_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_1_mstr_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_1_cfg_ahb_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_1_aux_clk", 8, 19200000, 3}},
                package() {"CLOCK", package() {"gcc_pcie1_phy_refgen_clk", 8, 100000000, 3}},
				
                /* CLKREQ */
                package()
                {
                    "TLMMGPIO", // TLMM resource
                    package()
                    {
                        103, // PIN Number
                        0,   // State: 0: Low, 1: High
                        1,   // Function select: 1
                        0,   // direction 0: Input, 1: Output.
                        3,   // Pull value: 0: No Pull, 1: Pull Down, 2: Keeper, 3: Pull Up
                        0,   // Drive Strength: 0: 2mA, 1: 4mA, 2: 6mA, 3: 8mA, 4: 10mA, 5: 12mA, 6: 14mA, 7: 16mA
                        0,   // Enable low power state
                    },
                },
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

                package() {"CLOCK", package() {"gcc_pcie_1_aux_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_1_slv_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_1_slv_q2a_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_1_mstr_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_1_cfg_ahb_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie1_phy_refgen_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_1_pipe_clk", 2}},
                
                /* common clocks */
                package() {"CLOCK", package() {"gcc_pcie_phy_aux_clk", 2}},
                package() {"CLOCK", package() {"gcc_aggre_noc_pcie_tbu_clk", 2}},

                /* Suppress the votes for CX nominal */
                package() {"NPARESOURCE",Package() {1, "/arc/client/rail_cx", 16, "SUPPRESSIBLE"}},

                /* ICB votes */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_PCIE_1_CFG", 0, 0}},
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_PCIE_1", "ICBID_SLAVE_EBI1", 0, 0}},

                /* Turn off PCIe core */
                Package() { "FOOTSWITCH", Package() { "pcie_1_gdsc", 2}},

                /* PCIE Analog */
                package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                      package()                             // Vote for LDO3
                      {
                        "PPP_RESOURCE_ID_LDO3_C",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        0,                                  // Voltage (uV)
                        0,                                  // Enable = Disable
                        0,                                  // Power Mode = NPM
                        0,                                  // Head Room
                      },
                },

                /* PCIE Core */
                Package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package()                               // Vote for LDO5
                    {
                        "PPP_RESOURCE_ID_LDO5_E",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator Type = LDO
                        0,                                  // Voltage (uV)
                        0,                                  // Enable = Disable
                        0,                                  // Power Mode = NPM
                        0,                                  // Headroom
                    },
                },
                
                /* NVMe power rail */
                package()
                {
                    "PMICVREGVOTE", // PMICVREGVOTE resource
                    package()
                    {	
                        "PPP_RESOURCE_ID_SMPS8_C", 
                        2,     	// Voltage Regulator type = SMPS
                        0,      // 0V
                        0,      // Software enable - Enable
                        0,      // Software power mode - AUTO
                        0,      // Head room voltage
                    },
                },
                
                /* NVMe DBB1 & DBU4 */
                package()
                {
                    "PMICGPIO", 
                    package()
                    {                                                                   
                        "IOCTL_PM_GPIO_CONFIG_DIGITAL_OUTPUT", // GPIO or GPIO IOCTL
                        2, // PMIC_C
                        10,// GPIO 11
                        0, // PM_GPIO_OUT_BUFFER_CONFIG_CMOS
                        1, // PM_GPIO_VIN1
                        0, // PM_GPIO_SOURCE_LOW
                        3, // PM_GPIO_OUT_BUFFER_HIGH
                        4, // PM_GPIO_I_SOURCE_PULL_DOWN_10uA
                    },
                },
            },
            
            Package()
            {
                "CRASHDUMP_EXCEPTION",                    
                Package() { "EXECUTE_FUNCTION", Package() { "ExecuteOcdPCIeExceptions"}},
            }, 
            
            Package()
            {
                "CRASHDUMP_DSTATE",
                0,
            },
        },

        Package()
        {
            "DEVICE",
            "\\_SB.PCI1.RP1",

            Package()
            {
                "COMPONENT",
                0x0, // Component 0
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
            "\\_SB.PCI2",
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
                "DSTATE",
                0x0, // D0 state

                /* PCIE Analog */
                package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                      package()                             // Vote for LDO3 @1.2v
                      {
                        "PPP_RESOURCE_ID_LDO3_C",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        1200000,                            // Voltage (uV)
                        1,                                  // Enable = Enable
                        1,                                  // Power Mode = NPM
                        0,                                  // Head Room
                      },
                },

                /* PCIE Core */
                Package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package()                               // Vote for LDO5 @0.88V
                    {
                        "PPP_RESOURCE_ID_LDO5_E",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator Type = LDO
                        880000,                             // Voltage (uV)
                        1,                                  // Enable = Enable
                        1,                                  // Power Mode = NPM
                        0,                                  // Headroom
                    },
                },
                
                /* Turning on PCIe core */
                Package() { "FOOTSWITCH", Package() { "pcie_2_gdsc", 1}},

                /* ICB votes through PSTATE */
                /* vote for 75 MB/s config NOC bandwidth */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_PCIE_2_CFG", 75000000, 0}},
                /* vote for 1960 MB/s SNOC bandwidth for x2 */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_PCIE_2", "ICBID_SLAVE_EBI1", 3920000000, 3920000000}},

                /* Votes CX to nominal */
                package() {"NPARESOURCE",Package() {1, "/arc/client/rail_cx", 256, "SUPPRESSIBLE"}},

                package() {"CLOCK", package() {"gcc_pcie_phy_aux_clk", 1}},
                package() {"CLOCK", package() {"gcc_aggre_noc_pcie_tbu_clk", 1}},
			
                package() {"CLOCK", package() {"gcc_pcie_2_pipe_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_2_slv_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_2_slv_q2a_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_2_mstr_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_2_cfg_ahb_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_2_aux_clk", 8, 19200000, 3}},
                package() {"CLOCK", package() {"gcc_pcie2_phy_refgen_clk", 8, 100000000, 3}},

                /* CLKREQ */
                package()
                {
                    "TLMMGPIO", // TLMM resource
                    package()
                    {
                        176, // PIN Number
                        0,   // State: 0: Low, 1: High
                        1,   // Function select: 1
                        0,   // direction 0: Input, 1: Output.
                        3,   // Pull value: 0: No Pull, 1: Pull Down, 2: Keeper, 3: Pull Up
                        0,   // Drive Strength: 0: 2mA, 1: 4mA, 2: 6mA, 3: 8mA, 4: 10mA, 5: 12mA, 6: 14mA, 7: 16mA
                        0,   // Enable low power state
                    },
                },

                /* WIGIG_EN
                package()
                {
                    "TLMMGPIO", // TLMM resource
                    package()
                    {
                        131,  // PIN Number
                        1,   // State: 0: Low, 1: High
                        0,   // Function select
                        1,   // direction 0: Input, 1: Output.
                        0,   // Pull value: 0: No Pull, 1: Pull Down, 2: Keeper, 3: Pull Up
                        0,   // Drive Strength: 0: 2mA, 1: 4mA, 2: 6mA, 3: 8mA, 4: 10mA, 5: 12mA, 6: 14mA, 7: 16mA
                        0,   // Enable low power state
                    },
                },*/
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

                package() {"CLOCK", package() {"gcc_pcie_2_aux_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_2_slv_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_2_slv_q2a_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_2_mstr_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_2_cfg_ahb_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie2_phy_refgen_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_2_pipe_clk", 2}},
                
                /* common clocks */
                package() {"CLOCK", package() {"gcc_pcie_phy_aux_clk", 2}},
                package() {"CLOCK", package() {"gcc_aggre_noc_pcie_tbu_clk", 2}},

                /* Suppress the votes for CX nominal */
                package() {"NPARESOURCE",Package() {1, "/arc/client/rail_cx", 16, "SUPPRESSIBLE"}},

                // /* ICB votes */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_PCIE_2_CFG", 0, 0}},
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_PCIE_2", "ICBID_SLAVE_EBI1", 0, 0}},

                /* Turn off PCIe core */
                Package() { "FOOTSWITCH", Package() { "pcie_2_gdsc", 2}},

                /* PCIE Analog */
                package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                      package()                             // Vote for LDO3
                      {
                        "PPP_RESOURCE_ID_LDO3_C",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        0,                                  // Voltage (uV)
                        0,                                  // Enable = Disable
                        0,                                  // Power Mode = NPM
                        0,                                  // Head Room
                      },
                },

                /* PCIE Core */
                Package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package()                               // Vote for LDO5
                    {
                        "PPP_RESOURCE_ID_LDO5_E",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator Type = LDO
                        0,                                  // Voltage (uV)
                        0,                                  // Enable = Disable
                        0,                                  // Power Mode = NPM
                        0,                                  // Headroom
                    },
                },
            },
            
            Package()
            {
                "CRASHDUMP_EXCEPTION",                    
                Package() { "EXECUTE_FUNCTION", Package() { "ExecuteOcdPCIeExceptions"}},
            },
            
            Package()
            {
                "CRASHDUMP_DSTATE",
                0,
            },
        },

        Package()
        {
            "DEVICE",
            "\\_SB.PCI2.RP1",

            Package()
            {
                "COMPONENT",
                0x0, // Component 0
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
            "\\_SB.PCI3",
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
                "DSTATE",
                0x0, // D0 state
                
                /* PCIE Analog */
                package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                      package()                             // Vote for LDO3 @1.2v
                      {
                        "PPP_RESOURCE_ID_LDO3_C",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        1200000,                            // Voltage (uV)
                        1,                                  // Enable = Enable
                        1,                                  // Power Mode = NPM
                        0,                                  // Head Room
                      },
                },

                /* PCIE Core */
                Package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package()                               // Vote for LDO5 @0.88V
                    {
                        "PPP_RESOURCE_ID_LDO5_E",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator Type = LDO
                        880000,                             // Voltage (uV)
                        1,                                  // Enable = Enable
                        1,                                  // Power Mode = NPM
                        0,                                  // Headroom
                    },
                },
                
                // /* Turning on PCIe core */
                Package() { "FOOTSWITCH", Package() { "pcie_3_gdsc", 1}},

                // /* ICB votes */
                // /* vote for 75 MB/s config NOC bandwidth */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_PCIE_3_CFG", 75000000, 0}},
                /* vote for 3920 MB/s SNOC bandwidth for x4 */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_PCIE_3", "ICBID_SLAVE_EBI1", 3920000000, 3920000000}},

                /* Votes CX to nominal */
                package() {"NPARESOURCE",Package() {1, "/arc/client/rail_cx", 256, "SUPPRESSIBLE"}},

                package() {"CLOCK", package() {"gcc_pcie_phy_aux_clk", 1}},
                package() {"CLOCK", package() {"gcc_aggre_noc_pcie_tbu_clk", 1}},

                package() {"CLOCK", package() {"gcc_pcie_3_pipe_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_3_slv_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_3_slv_q2a_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_3_mstr_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_3_cfg_ahb_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_3_aux_clk", 8, 19200000, 3}},
                package() {"CLOCK", package() {"gcc_pcie3_phy_refgen_clk", 8, 100000000, 3}},

                /* CLKREQ */
                package()
                {
                    "TLMMGPIO", // TLMM resource
                    package()
                    {
                        179, // PIN Number
                        0,   // State: 0: Low, 1: High
                        1,   // Function select: 1
                        0,   // direction 0: Input, 1: Output.
                        3,   // Pull value: 0: No Pull, 1: Pull Down, 2: Keeper, 3: Pull Up
                        0,   // Drive Strength: 0: 2mA, 1: 4mA, 2: 6mA, 3: 8mA, 4: 10mA, 5: 12mA, 6: 14mA, 7: 16mA
                        0,   // Enable low power state
                    },
                },
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

                package() {"CLOCK", package() {"gcc_pcie_3_aux_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_3_slv_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_3_slv_q2a_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_3_mstr_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_3_cfg_ahb_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie3_phy_refgen_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_3_pipe_clk", 2}},
                
                /* common clocks */
                package() {"CLOCK", package() {"gcc_pcie_phy_aux_clk", 2}},
                package() {"CLOCK", package() {"gcc_aggre_noc_pcie_tbu_clk", 2}},

                /* Suppress the votes for CX nominal */
                package() {"NPARESOURCE",Package() {1, "/arc/client/rail_cx", 16, "SUPPRESSIBLE"}},

                /* ICB votes */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_PCIE_3_CFG", 0, 0}},
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_PCIE_3", "ICBID_SLAVE_EBI1", 0, 0}},

                /* Turn off PCIe core */
                Package() { "FOOTSWITCH", Package() { "pcie_3_gdsc", 2}},

                /* PCIE Analog */
                package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                      package()                             // Vote for LDO3
                      {
                        "PPP_RESOURCE_ID_LDO3_C",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        0,                                  // Voltage (uV)
                        0,                                  // Enable = Disable
                        0,                                  // Power Mode = NPM
                        0,                                  // Head Room
                      },
                },

                /* PCIE Core */
                Package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package()                               // Vote for LDO5
                    {
                        "PPP_RESOURCE_ID_LDO5_E",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator Type = LDO
                        0,                                  // Voltage (uV)
                        0,                                  // Enable = Disable
                        0,                                  // Power Mode = NPM
                        0,                                  // Headroom
                    },
                },
            },
            
            Package()
            {
                "CRASHDUMP_EXCEPTION",                    
                Package() { "EXECUTE_FUNCTION", Package() { "ExecuteOcdPCIeExceptions"}},
            },
            
            Package()
            {
                "CRASHDUMP_DSTATE",
                0,
            },
        },

        Package()
        {
            "DEVICE",
            "\\_SB.PCI3.RP1",

            Package()
            {
                "COMPONENT",
                0x0, // Component 0
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
    })
	
    Name(PEMX,
    package()
    {
        Package()
        {
            "DEVICE",
            "\\_SB.PCI0",
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
                "DSTATE",
                0x0, // D0 state

                /* PCIE Analog */
                package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                      package()                             // Vote for LDO3 @1.2v
                      {
                        "PPP_RESOURCE_ID_LDO3_C",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        1200000,                            // Voltage (uV)
                        1,                                  // Enable = Enable
                        1,                                  // Power Mode = NPM
                        0,                                  // Head Room
                      },
                },

                /* PCIE Core */
                Package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package()                               // Vote for LDO5 @0.88V
                    {
                        "PPP_RESOURCE_ID_LDO5_E",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator Type = LDO
                        880000,                             // Voltage (uV)
                        1,                                  // Enable = Enable
                        1,                                  // Power Mode = NPM
                        0,                                  // Headroom
                    },
                },
                
                /* Turning on PCIe core */
                Package() { "FOOTSWITCH", Package() { "pcie_0_gdsc", 1}},

                /* ICB votes through PSTATE */
                /* vote for 75 MB/s config NOC bandwidth */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_PCIE_0_CFG", 75000000, 0}},
                /* vote for 980 MB/s SNOC bandwidth for x1 */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_PCIE_0", "ICBID_SLAVE_EBI1", 980000000, 980000000}},

                /* Votes CX to nominal */
                package() {"NPARESOURCE",Package() {1, "/arc/client/rail_cx", 256, "SUPPRESSIBLE"}},

                package() {"CLOCK", package() {"gcc_pcie_phy_aux_clk", 1}},
                package() {"CLOCK", package() {"gcc_aggre_noc_pcie_tbu_clk", 1}},
                /* TODO: Remove on V2 SC8180X hardware */
                package() {"CLOCK", package() {"gcc_rx2_qlink_clkref_en", 1}},
                package() {"CLOCK", package() {"gcc_ufs_mem_clkref_en", 1}},
                package() {"CLOCK", package() {"gcc_ufs_card_clkref_en", 1}},
                /* Marking Suppressible  */
                package() {"CLOCK", package() {"gcc_rx2_qlink_clkref_en", 9,8}},
                package() {"CLOCK", package() {"gcc_ufs_mem_clkref_en", 9,8}},
                package() {"CLOCK", package() {"gcc_ufs_card_clkref_en", 9,8}},
				
                package() {"CLOCK", package() {"gcc_pcie_0_pipe_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_0_slv_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_0_slv_q2a_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_0_mstr_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_0_cfg_ahb_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_0_aux_clk", 8, 19200000, 3}},
                package() {"CLOCK", package() {"gcc_pcie0_phy_refgen_clk", 8, 100000000, 3}},
				
                /* CLKREQ */
                package()
                {
                    "TLMMGPIO", // TLMM resource
                    package()
                    {
                        36, // PIN Number
                        0,  // State: 0: Low, 1: High
                        1,  // Function select: 1
                        0,  // direction 0: Input, 1: Output.
                        3,  // Pull value: 0: No Pull, 1: Pull Down, 2: Keeper, 3: Pull Up
                        0,  // Drive Strength: 0: 2mA, 1: 4mA, 2: 6mA, 3: 8mA, 4: 10mA, 5: 12mA, 6: 14mA, 7: 16mA
                        0,  // Enable low power state
                    },
                },
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

                package() {"CLOCK", package() {"gcc_pcie_0_aux_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_0_slv_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_0_slv_q2a_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_0_mstr_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_0_cfg_ahb_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie0_phy_refgen_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_0_pipe_clk", 2}},
                
                /* common clocks */
                package() {"CLOCK", package() {"gcc_pcie_phy_aux_clk", 2}},
                package() {"CLOCK", package() {"gcc_aggre_noc_pcie_tbu_clk", 2}},

                /* Suppress the votes for CX nominal */
                package() {"NPARESOURCE",Package() {1, "/arc/client/rail_cx", 16, "SUPPRESSIBLE"}},

                /* ICB votes */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_PCIE_0_CFG", 0, 0}},
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_PCIE_0", "ICBID_SLAVE_EBI1", 0, 0}},

                /* Turn off PCIe core */
                Package() { "FOOTSWITCH", Package() { "pcie_0_gdsc", 2}},

                /* PCIE Analog */
                package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                      package()                             // Vote for LDO3
                      {
                        "PPP_RESOURCE_ID_LDO3_C",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        0,                                  // Voltage (uV)
                        0,                                  // Enable = Disable
                        0,                                  // Power Mode = NPM
                        0,                                  // Head Room
                      },
                },

                /* PCIE Core */
                Package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package()                               // Vote for LDO5
                    {
                        "PPP_RESOURCE_ID_LDO5_E",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator Type = LDO
                        0,                                  // Voltage (uV)
                        0,                                  // Enable = Disable
                        0,                                  // Power Mode = NPM
                        0,                                  // Headroom
                    },
                },
            },
            
            Package()
            {
                "CRASHDUMP_EXCEPTION",                    
                Package() { "EXECUTE_FUNCTION", Package() { "ExecuteOcdPCIeExceptions"}},
            },
            
            Package()
            {
                "CRASHDUMP_DSTATE",
                0,
            },
        },

        Package()
        {
            "DEVICE",
            "\\_SB.PCI0.RP1",

            Package()
            {
                "COMPONENT",
                0x0, // Component 0
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
            "\\_SB.PCI1",
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
                "DSTATE",
                0x0, // D0 state
                
                /* PCIE Analog */
                package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                      package()                             // Vote for LDO3 @1.2v
                      {
                        "PPP_RESOURCE_ID_LDO3_C",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        1200000,                            // Voltage (uV)
                        1,                                  // Enable = Enable
                        1,                                  // Power Mode = NPM
                        0,                                  // Head Room
                      },
                },

                /* PCIE Core */
                Package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package()                               // Vote for LDO5 @0.88V
                    {
                        "PPP_RESOURCE_ID_LDO5_E",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator Type = LDO
                        880000,                             // Voltage (uV)
                        1,                                  // Enable = Enable
                        1,                                  // Power Mode = NPM
                        0,                                  // Headroom
                    },
                },
                
                /* Turning on PCIe core */
                Package() { "FOOTSWITCH", Package() { "pcie_1_gdsc", 1}},

                /* ICB votes through PSTATE */
                /* vote for 75 MB/s config NOC bandwidth */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_PCIE_1_CFG", 75000000, 0}},
                /* vote for 1960 MB/s SNOC bandwidth for x2 */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_PCIE_1", "ICBID_SLAVE_EBI1", 1960000000, 1960000000}},

                /* Votes CX to nominal */
                package() {"NPARESOURCE",Package() {1, "/arc/client/rail_cx", 256, "SUPPRESSIBLE"}},

                package() {"CLOCK", package() {"gcc_pcie_phy_aux_clk", 1}},
                package() {"CLOCK", package() {"gcc_aggre_noc_pcie_tbu_clk", 1}},
                /* TODO: Remove on V2 SC8180X hardware */
                package() {"CLOCK", package() {"gcc_rx2_qlink_clkref_en", 1}},
                package() {"CLOCK", package() {"gcc_ufs_mem_clkref_en", 1}},
                package() {"CLOCK", package() {"gcc_ufs_card_clkref_en", 1}},
                /* Marking Suppressible  */
                package() {"CLOCK", package() {"gcc_rx2_qlink_clkref_en", 9,8}},
                package() {"CLOCK", package() {"gcc_ufs_mem_clkref_en", 9,8}},
                package() {"CLOCK", package() {"gcc_ufs_card_clkref_en", 9,8}},
			
                package() {"CLOCK", package() {"gcc_pcie_1_pipe_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_1_slv_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_1_slv_q2a_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_1_mstr_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_1_cfg_ahb_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_1_aux_clk", 8, 19200000, 3}},
                package() {"CLOCK", package() {"gcc_pcie1_phy_refgen_clk", 8, 100000000, 3}},
				
                /* CLKREQ */
                package()
                {
                    "TLMMGPIO", // TLMM resource
                    package()
                    {
                        103, // PIN Number
                        0,   // State: 0: Low, 1: High
                        1,   // Function select: 1
                        0,   // direction 0: Input, 1: Output.
                        3,   // Pull value: 0: No Pull, 1: Pull Down, 2: Keeper, 3: Pull Up
                        0,   // Drive Strength: 0: 2mA, 1: 4mA, 2: 6mA, 3: 8mA, 4: 10mA, 5: 12mA, 6: 14mA, 7: 16mA
                        0,   // Enable low power state
                    },
                },
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

                package() {"CLOCK", package() {"gcc_pcie_1_aux_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_1_slv_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_1_slv_q2a_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_1_mstr_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_1_cfg_ahb_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie1_phy_refgen_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_1_pipe_clk", 2}},
                
                /* common clocks */
                package() {"CLOCK", package() {"gcc_pcie_phy_aux_clk", 2}},
                package() {"CLOCK", package() {"gcc_aggre_noc_pcie_tbu_clk", 2}},

                /* Suppress the votes for CX nominal */
                package() {"NPARESOURCE",Package() {1, "/arc/client/rail_cx", 16, "SUPPRESSIBLE"}},

                /* ICB votes */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_PCIE_1_CFG", 0, 0}},
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_PCIE_1", "ICBID_SLAVE_EBI1", 0, 0}},

                /* Turn off PCIe core */
                Package() { "FOOTSWITCH", Package() { "pcie_1_gdsc", 2}},

                /* PCIE Analog */
                package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                      package()                             // Vote for LDO3
                      {
                        "PPP_RESOURCE_ID_LDO3_C",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        0,                                  // Voltage (uV)
                        0,                                  // Enable = Disable
                        0,                                  // Power Mode = NPM
                        0,                                  // Head Room
                      },
                },

                /* PCIE Core */
                Package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package()                               // Vote for LDO5
                    {
                        "PPP_RESOURCE_ID_LDO5_E",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator Type = LDO
                        0,                                  // Voltage (uV)
                        0,                                  // Enable = Disable
                        0,                                  // Power Mode = NPM
                        0,                                  // Headroom
                    },
                },
            },
            
            Package()
            {
                "CRASHDUMP_EXCEPTION",                    
                Package() { "EXECUTE_FUNCTION", Package() { "ExecuteOcdPCIeExceptions"}},
            },             
            
            Package()
            {
                "CRASHDUMP_DSTATE",
                0,
            },
        },

        Package()
        {
            "DEVICE",
            "\\_SB.PCI1.RP1",

            Package()
            {
                "COMPONENT",
                0x0, // Component 0
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
            "\\_SB.PCI2",
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
                "DSTATE",
                0x0, // D0 state

                /* PCIE Analog */
                package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                      package()                             // Vote for LDO3 @1.2v
                      {
                        "PPP_RESOURCE_ID_LDO3_C",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        1200000,                            // Voltage (uV)
                        1,                                  // Enable = Enable
                        1,                                  // Power Mode = NPM
                        0,                                  // Head Room
                      },
                },

                /* PCIE Core */
                Package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package()                               // Vote for LDO5 @0.88V
                    {
                        "PPP_RESOURCE_ID_LDO5_E",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator Type = LDO
                        880000,                             // Voltage (uV)
                        1,                                  // Enable = Enable
                        1,                                  // Power Mode = NPM
                        0,                                  // Headroom
                    },
                },
                
                /* Turning on PCIe core */
                Package() { "FOOTSWITCH", Package() { "pcie_2_gdsc", 1}},

                /* ICB votes through PSTATE */
                /* vote for 75 MB/s config NOC bandwidth */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_PCIE_2_CFG", 75000000, 0}},
                /* vote for 1960 MB/s SNOC bandwidth for x2 */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_PCIE_2", "ICBID_SLAVE_EBI1", 1960000000, 1960000000}},

                /* Votes CX to nominal */
                package() {"NPARESOURCE",Package() {1, "/arc/client/rail_cx", 256, "SUPPRESSIBLE"}},

                package() {"CLOCK", package() {"gcc_pcie_phy_aux_clk", 1}},
                package() {"CLOCK", package() {"gcc_aggre_noc_pcie_tbu_clk", 1}},
                /* TODO: Remove on V2 SC8180X hardware */
                package() {"CLOCK", package() {"gcc_rx2_qlink_clkref_en", 1}},
                package() {"CLOCK", package() {"gcc_ufs_mem_clkref_en", 1}},
                package() {"CLOCK", package() {"gcc_ufs_card_clkref_en", 1}},
                /* Marking Suppressible  */
                package() {"CLOCK", package() {"gcc_rx2_qlink_clkref_en", 9,8}},
                package() {"CLOCK", package() {"gcc_ufs_mem_clkref_en", 9,8}},
                package() {"CLOCK", package() {"gcc_ufs_card_clkref_en", 9,8}},
			
                package() {"CLOCK", package() {"gcc_pcie_2_pipe_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_2_slv_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_2_slv_q2a_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_2_mstr_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_2_cfg_ahb_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_2_aux_clk", 8, 19200000, 3}},
                package() {"CLOCK", package() {"gcc_pcie2_phy_refgen_clk", 8, 100000000, 3}},

                /* CLKREQ */
                package()
                {
                    "TLMMGPIO", // TLMM resource
                    package()
                    {
                        176, // PIN Number
                        0,   // State: 0: Low, 1: High
                        1,   // Function select: 1
                        0,   // direction 0: Input, 1: Output.
                        3,   // Pull value: 0: No Pull, 1: Pull Down, 2: Keeper, 3: Pull Up
                        0,   // Drive Strength: 0: 2mA, 1: 4mA, 2: 6mA, 3: 8mA, 4: 10mA, 5: 12mA, 6: 14mA, 7: 16mA
                        0,   // Enable low power state
                    },
                },

                /* WIGIG_EN
                package()
                {
                    "TLMMGPIO", // TLMM resource
                    package()
                    {
                        131,  // PIN Number
                        1,   // State: 0: Low, 1: High
                        0,   // Function select
                        1,   // direction 0: Input, 1: Output.
                        0,   // Pull value: 0: No Pull, 1: Pull Down, 2: Keeper, 3: Pull Up
                        0,   // Drive Strength: 0: 2mA, 1: 4mA, 2: 6mA, 3: 8mA, 4: 10mA, 5: 12mA, 6: 14mA, 7: 16mA
                        0,   // Enable low power state
                    },
                },*/
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

                package() {"CLOCK", package() {"gcc_pcie_2_aux_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_2_slv_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_2_slv_q2a_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_2_mstr_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_2_cfg_ahb_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie2_phy_refgen_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_2_pipe_clk", 2}},
                
                /* common clocks */
                package() {"CLOCK", package() {"gcc_pcie_phy_aux_clk", 2}},
                package() {"CLOCK", package() {"gcc_aggre_noc_pcie_tbu_clk", 2}},

                /* Suppress the votes for CX nominal */
                package() {"NPARESOURCE",Package() {1, "/arc/client/rail_cx", 16, "SUPPRESSIBLE"}},

                // /* ICB votes */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_PCIE_2_CFG", 0, 0}},
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_PCIE_2", "ICBID_SLAVE_EBI1", 0, 0}},

                /* Turn off PCIe core */
                Package() { "FOOTSWITCH", Package() { "pcie_2_gdsc", 2}},

                /* PCIE Analog */
                package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                      package()                             // Vote for LDO3
                      {
                        "PPP_RESOURCE_ID_LDO3_C",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        0,                                  // Voltage (uV)
                        0,                                  // Enable = Disable
                        0,                                  // Power Mode = NPM
                        0,                                  // Head Room
                      },
                },

                /* PCIE Core */
                Package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package()                               // Vote for LDO5
                    {
                        "PPP_RESOURCE_ID_LDO5_E",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator Type = LDO
                        0,                                  // Voltage (uV)
                        0,                                  // Enable = Disable
                        0,                                  // Power Mode = NPM
                        0,                                  // Headroom
                    },
                },
            },
            
            Package()
            {
                "CRASHDUMP_EXCEPTION",                    
                Package() { "EXECUTE_FUNCTION", Package() { "ExecuteOcdPCIeExceptions"}},
            },
            
            Package()
            {
                "CRASHDUMP_DSTATE",
                0,
            },
        },

        Package()
        {
            "DEVICE",
            "\\_SB.PCI2.RP1",

            Package()
            {
                "COMPONENT",
                0x0, // Component 0
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
            "\\_SB.PCI3",
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
                "DSTATE",
                0x0, // D0 state
                
                /* PCIE Analog */
                package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                      package()                             // Vote for LDO3 @1.2v
                      {
                        "PPP_RESOURCE_ID_LDO3_C",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        1200000,                            // Voltage (uV)
                        1,                                  // Enable = Enable
                        1,                                  // Power Mode = NPM
                        0,                                  // Head Room
                      },
                },

                /* PCIE Core */
                Package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package()                               // Vote for LDO5 @0.88V
                    {
                        "PPP_RESOURCE_ID_LDO5_E",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator Type = LDO
                        880000,                             // Voltage (uV)
                        1,                                  // Enable = Enable
                        1,                                  // Power Mode = NPM
                        0,                                  // Headroom
                    },
                },
                
                // /* Turning on PCIe core */
                Package() { "FOOTSWITCH", Package() { "pcie_3_gdsc", 1}},

                // /* ICB votes */
                // /* vote for 75 MB/s config NOC bandwidth */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_PCIE_3_CFG", 75000000, 0}},
                /* vote for 3920 MB/s SNOC bandwidth for x4 */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_PCIE_3", "ICBID_SLAVE_EBI1", 3920000000, 3920000000}},

                /* Votes CX to nominal */
                package() {"NPARESOURCE",Package() {1, "/arc/client/rail_cx", 256, "SUPPRESSIBLE"}},

                package() {"CLOCK", package() {"gcc_pcie_phy_aux_clk", 1}},
                package() {"CLOCK", package() {"gcc_aggre_noc_pcie_tbu_clk", 1}},
                /* TODO: Remove on V2 SC8180X hardware */
                package() {"CLOCK", package() {"gcc_rx2_qlink_clkref_en", 1}},
                package() {"CLOCK", package() {"gcc_ufs_mem_clkref_en", 1}},
                package() {"CLOCK", package() {"gcc_ufs_card_clkref_en", 1}},
                /* Marking Suppressible  */
                package() {"CLOCK", package() {"gcc_rx2_qlink_clkref_en", 9,8}},
                package() {"CLOCK", package() {"gcc_ufs_mem_clkref_en", 9,8}},
                package() {"CLOCK", package() {"gcc_ufs_card_clkref_en", 9,8}},
				
                package() {"CLOCK", package() {"gcc_pcie_3_pipe_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_3_slv_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_3_slv_q2a_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_3_mstr_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_3_cfg_ahb_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_3_aux_clk", 8, 19200000, 3}},
                package() {"CLOCK", package() {"gcc_pcie3_phy_refgen_clk", 8, 100000000, 3}},

                /* CLKREQ */
                package()
                {
                    "TLMMGPIO", // TLMM resource
                    package()
                    {
                        179, // PIN Number
                        0,   // State: 0: Low, 1: High
                        1,   // Function select: 1
                        0,   // direction 0: Input, 1: Output.
                        3,   // Pull value: 0: No Pull, 1: Pull Down, 2: Keeper, 3: Pull Up
                        0,   // Drive Strength: 0: 2mA, 1: 4mA, 2: 6mA, 3: 8mA, 4: 10mA, 5: 12mA, 6: 14mA, 7: 16mA
                        0,   // Enable low power state
                    },
                },
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

                package() {"CLOCK", package() {"gcc_pcie_3_aux_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_3_slv_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_3_slv_q2a_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_3_mstr_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_3_cfg_ahb_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie3_phy_refgen_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_3_pipe_clk", 2}},
                
                /* common clocks */
                package() {"CLOCK", package() {"gcc_pcie_phy_aux_clk", 2}},
                package() {"CLOCK", package() {"gcc_aggre_noc_pcie_tbu_clk", 2}},

                /* Suppress the votes for CX nominal */
                package() {"NPARESOURCE",Package() {1, "/arc/client/rail_cx", 16, "SUPPRESSIBLE"}},

                /* ICB votes */
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_PCIE_3_CFG", 0, 0}},
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_PCIE_3", "ICBID_SLAVE_EBI1", 0, 0}},

                /* Turn off PCIe core */
                Package() { "FOOTSWITCH", Package() { "pcie_3_gdsc", 2}},

                /* PCIE Analog */
                package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                      package()                             // Vote for LDO3
                      {
                        "PPP_RESOURCE_ID_LDO3_C",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        0,                                  // Voltage (uV)
                        0,                                  // Enable = Disable
                        0,                                  // Power Mode = NPM
                        0,                                  // Head Room
                      },
                },

                /* PCIE Core */
                Package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package()                               // Vote for LDO5
                    {
                        "PPP_RESOURCE_ID_LDO5_E",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator Type = LDO
                        0,                                  // Voltage (uV)
                        0,                                  // Enable = Disable
                        0,                                  // Power Mode = NPM
                        0,                                  // Headroom
                    },
                },
            },
            
            Package()
            {
                "CRASHDUMP_EXCEPTION",                    
                Package() { "EXECUTE_FUNCTION", Package() { "ExecuteOcdPCIeExceptions"}},
            },
            
            Package()
            {
                "CRASHDUMP_DSTATE",
                0,
            },
        },

        Package()
        {
            "DEVICE",
            "\\_SB.PCI3.RP1",

            Package()
            {
                "COMPONENT",
                0x0, // Component 0
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
    })
}
