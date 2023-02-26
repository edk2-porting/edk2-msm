//===========================================================================
//                           <pcie_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by pcie subsystem.
//
//===========================================================================


Scope(\_SB_.PEP0)
{
    // PCIe Intra-Soc ports
    Method(PEMD)
    {
        Return (PEMC)
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
                
                // PCIE Analog
                package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                      package()                             // Vote for L28 @1.0v
                      {
                        "PPP_RESOURCE_ID_LDO26_A",          // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        1200000,                            // Voltage 1.2V        : microvolts ( V )
                        1,                                  // Enable = Enable
                        1,                                  // Power Mode = NPM
                        0,                                  // Head Room
                      },
                },

                // PCIE Core
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO1_A",
                        1,           // Voltage Regulator Type, 1 = LDO
                        880000,      // Voltage (uV)
                        1,           // Enable = Enable
                        1,           // Power Mode = NPM
                        0,           // Headroom
                    },
                },
                
                //Turning on PCIe core
                Package() { "FOOTSWITCH", Package() { "pcie_0_gdsc", 1}},

                // ICB votes through PSTATE 
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_PCIE_0_CFG", 75000000, 0}},
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_PCIE_0", "ICBID_SLAVE_EBI1", 400000000, 200000000}},
				
                package() {"CLOCK", package() {"gcc_aggre_noc_pcie_tbu_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_phy_aux_clk", 1}},

                package() {"CLOCK", package() {"gcc_pcie_0_pipe_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_0_slv_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_0_slv_q2a_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_0_mstr_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_0_cfg_ahb_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_0_aux_clk", 8, 19200000, 3}},
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
                package() {"CLOCK", package() {"gcc_pcie_0_pipe_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_0_aux_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_0_slv_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_0_slv_q2a_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_0_mstr_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_0_cfg_ahb_clk", 2}},
                
                // common clocks
                package() {"CLOCK", package() {"gcc_aggre_noc_pcie_tbu_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_phy_aux_clk", 2}},
                
                // ICB votes
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_PCIE_0_CFG", 0, 0}},
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_PCIE_0", "ICBID_SLAVE_EBI1", 0, 0}},

                // Turn off PCIe core
                Package() { "FOOTSWITCH", Package() { "pcie_0_gdsc", 2}},

                // PCIE Analog
                package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                      package()                             // Vote for L28 @1.0v
                      {
                        "PPP_RESOURCE_ID_LDO26_A",          // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        0,                                  // Voltage 1.2V        : microvolts ( V )
                        0,                                  // Enable = Disable
                        0,                                  // Power Mode = NPM
                        0,                                  // Head Room
                      },
                },

                // PCIE Core
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO1_A",
                        1,           // Voltage Regulator Type, 1 = LDO
                        0,           // Voltage (uV)
                        0,           // Enable = Disable
                        0,           // Power Mode = NPM
                        0,           // Headroom
                    },
                },
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
                
                // PCIE Analog
                package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                      package()                             // Vote for L28 @1.0v
                      {
                        "PPP_RESOURCE_ID_LDO26_A",          // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        1200000,                            // Voltage 1.2V        : microvolts ( V )
                        1,                                  // Enable = Enable
                        1,                                  // Power Mode = NPM
                        0,                                  // Head Room
                      },
                },

                // PCIE Core
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO1_A",
                        1,           // Voltage Regulator Type, 1 = LDO
                        880000,      // Voltage (uV)
                        1,           // Enable = Enable
                        1,           // Power Mode = NPM
                        0,           // Headroom
                    },
                },
                
                //Turning on PCIe core
                Package() { "FOOTSWITCH", Package() { "pcie_1_gdsc", 1}},

                // ICB votes
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_PCIE_1_CFG", 75000000, 0}},
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_PCIE_1", "ICBID_SLAVE_EBI1", 400000000, 200000000}},
				
                /*
                package()
                {
                    "PMICVREGVOTE", // PMICVREGVOTE resource
                    package()
                    {
                        "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A",         // Resource ID
                        6,                                                // Voltage Regulator type = CXO Buffer
                        1,                                                // Force enable from s/w
                        0,                                                // Disable pin control
                    },
                },
                */
                package() {"CLOCK", package() {"gcc_aggre_noc_pcie_tbu_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_phy_aux_clk", 1}},

                package() {"CLOCK", package() {"gcc_pcie_1_pipe_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_1_slv_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_1_slv_q2a_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_1_mstr_axi_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_1_cfg_ahb_clk", 1}},
                package() {"CLOCK", package() {"gcc_pcie_1_aux_clk", 8, 19200000, 3}},
                package() {"CLOCK", package() {"gcc_pcie_phy_refgen_clk", 8, 100000000, 3}},
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
                package() {"CLOCK", package() {"gcc_pcie_1_pipe_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_phy_refgen_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_1_aux_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_1_slv_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_1_slv_q2a_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_1_mstr_axi_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_1_cfg_ahb_clk", 2}},

                // common clocks
                package() {"CLOCK", package() {"gcc_aggre_noc_pcie_tbu_clk", 2}},
                package() {"CLOCK", package() {"gcc_pcie_phy_aux_clk", 2}},

                // ICB votes
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_PCIE_1_CFG", 0, 0}},
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_PCIE_1", "ICBID_SLAVE_EBI1", 0, 0}},
				
                // Turn off PCIe core
                Package() { "FOOTSWITCH", Package() { "pcie_1_gdsc", 2}},
				/*
                package()
                {
                    "PMICVREGVOTE", // PMICVREGVOTE resource
                    package()
                    {
                        "PPP_RESOURCE_ID_CXO_BUFFERS_LNBBCLK1_A",         // Resource ID
                        6,                                                // Voltage Regulator type = CXO Buffer
                        0,                                                // Force enable from s/w
                        0,                                                // Disable pin control
                    },
                },
				*/
                // PCIE Analog
                package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                      package()                             // Vote for L28 @1.0v
                      {
                        "PPP_RESOURCE_ID_LDO26_A",          // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        0,                                  // Voltage 1.2V        : microvolts ( V )
                        0,                                  // Enable = Disable
                        0,                                  // Power Mode = NPM
                        0,                                  // Head Room
                      },
                },

                // PCIE Core
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO1_A",
                        1,           // Voltage Regulator Type, 1 = LDO
                        0,           // Voltage (uV)
                        0,           // Enable = Disable
                        0,           // Power Mode = NPM
                        0,           // Headroom
                    },
                },
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
    })
}
