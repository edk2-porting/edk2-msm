//--------------------------------------------------------------------------------------------------
// Copyright (c) 2017~2018 Mmoclauq Technologies, Inc.
// All Rights Reserved.
// Confidential and Proprietary - Mmoclauq Technologies, Inc.
//--------------------------------------------------------------------------------------------------


// PEP resources for WCNSS
Scope(\_SB_.PEP0)
{
    //Wireless Connectivity Devices
    Method(EWMD)
    {	
		If (Lequal(\_SB_.PSUB,"MTP08180")) // MTP
		{ 
		    If (Lequal(\_SB_.PLST, 1) || Lequal(\_SB_.PLST, 4)) // Hastings
			{
				Return(WBRX)
			}
			else
			{
				Return(WBRC)
			}
		}
		ElseIf (Lequal(\_SB_.PSUB,"CLS08180")) // CLS
		{
			If(Lequal(\_SB_.SOID, 404) && ( LEqual(BSID, 0x2) || LEqual(BSID, 0x3) )) // Hastings
			{
				Return(WBRX)
			}
			else
			{
				Return(WBRC)
			}
		}
		else
		{
			Return(WBRC)
		}
    }

    Name(WBRX,
    Package()
    {
        // PEP settings for Bluetooth SOC
        Package()
        {
            "DEVICE",
            "\\_SB.BTH0",
            Package()
            {
                "COMPONENT",
                0x0, // Component 0.
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
				
                package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_SMPS5_A",     // Resource ID
                        2,                             // Voltage Regulator type 2 = SMPS
                        1950000,                       // Voltage = 1.95 V
                        1,                             // Software Enable = Enable
                        6,                             // Software Power Mode = Auto
                        0,                             // Head Room
                    },
                },
                package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_SMPS6_C",     // Resource ID
                        2,                             // Voltage Regulator type 2 = SMPS
                        1350000,                       // Voltage = 1.35 V
                        1,                             // Software Enable = Enable
                        6,                             // Software Power Mode = Auto
                        0,                             // Head Room
                    },
                },
                package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_SMPS7_C",     // Resource ID
                        2,                             // Voltage Regulator type 2 = SMPS
                        950000,                       // Voltage = 0.95 V
                        1,                             // Software Enable = Enable
                        6,                             // Software Power Mode = Auto
                        0,                             // Head Room
                    },
                }, 
                
            },
            Package()
            {
                "DSTATE",
                0x3, // D3 state				 
				 
                package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_SMPS5_A",     // Resource ID
                        2,                             // Voltage Regulator type 2 = SMPS
                        0,                             // Voltage = 0 V
                        0,                             // Software Enable = Disable
                        4,                             // Software Power Mode = RM
                        0,                             // Head Room
                    },
                },
                package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_SMPS6_C",     // Resource ID
                        2,                             // Voltage Regulator type 2 = SMPS
                        0,                             // Voltage = 0 V
                        0,                             // Software Enable = Disable
                        4,                             // Software Power Mode = RM
                        0,                             // Head Room
                    },
                },
                package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_SMPS7_C",     // Resource ID
                        2,                             // Voltage Regulator type 2 = SMPS
                        0,                             // Voltage = 0 V
                        0,                             // Software Enable = Disable
                        4,                             // Software Power Mode = RM
                        0,                             // Head Room
                    },
                },
            },
        },
        // END BTH0

        // PEP settings for FM SOC
        // END FM

    }) // END WBRX

    Name(WBRC,
    Package()
    {
        // PEP settings for Wlan iHelium
        Package()
        {
            "DEVICE",
            "\\_SB.AMSS.QWLN",

            Package()
            {
                "COMPONENT",
                0x0, // Component 0

                Package()
                {
                    "FSTATE",
                    0x0, // F0 state
                },
            },

            Package()
            {
                "DSTATE",
                0x0, // D0 state
				//Dummy Bus BW Vote to block SLPM until WLAN enters D2/D3
				package() {"BUSARB", Package() { 3, "ICBID_MASTER_PCIE_0", "ICBID_SLAVE_EBI1", 1000000, 1000000}},
                package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO1_E",      // Resource ID
                        1,                             // Voltage Regulator type 1 = LDO
                        752000,                        // Voltage = 0.752 V
                        1,                             // Software Enable = Enable
                        4,                             // Software Power Mode = LPM
                        0,                             // Head Room
                    },
                },
            },
            Package()
            {
                "DSTATE",
                0x2, // D2 state
                package() {"BUSARB", Package() { 3, "ICBID_MASTER_PCIE_0", "ICBID_SLAVE_EBI1", 0, 0}},
                package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO1_E",      // Resource ID
                        1,                             // Voltage Regulator type 1 = LDO
                        0,                             // Voltage = 0 V
                        0,                             // Software Enable = Disable
                        4,                             // Software Power Mode = LPM
                        0,                             // Head Room
                    },
                },
            },
            Package()
            {
                "DSTATE",
                0x3, // D3 state
				package() {"BUSARB", Package() { 3, "ICBID_MASTER_PCIE_0", "ICBID_SLAVE_EBI1", 0, 0}},
                package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO1_E",      // Resource ID
                        1,                             // Voltage Regulator type 1 = LDO
                        0,                             // Voltage = 0 V
                        0,                             // Software Enable = Disable
                        4,                             // Software Power Mode = LPM
                        0,                             // Head Room
                    },
                },
            },

            package()
            {
              "ABANDON_DSTATE",
              2                                        // Abandon D state defined as D2
            },
        },
        // END AMSS.QWLN

        // PEP settings for Ltecoex device
        Package()
        {
            "DEVICE",
            "\\_SB.COEX",
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

                    package()
                    {
                        "PMICVREGVOTE",
                        package()
                        {
                            "PPP_RESOURCE_ID_LDO1_E",      // Resource ID
                            1,                             // Voltage Regulator type 1 = LDO
                            752000,                        // Voltage = 0.752 V
                            1,                             // Software Enable = Enable
                            4,                             // Software Power Mode = LPM
                            0,                             // Head Room
                        },
                    },
                },
                Package()
                {
                    "PSTATE",
                    0x1, // P1 state

                    package()
                    {
                        "PMICVREGVOTE",
                        package()
                        {
                            "PPP_RESOURCE_ID_LDO1_E",      // Resource ID
                            1,                             // Voltage Regulator type 1 = LDO
                            0,                             // Voltage = 0 V
                            0,                             // Software Enable = Disable
                            4,                             // Software Power Mode = LPM
                            0,                             // Head Room
                        },
                    },
                },
            },
        },
        // END _SB.COEX

        // PEP settings for Bluetooth SOC
        Package()
        {
            "DEVICE",
            "\\_SB.BTH0",
            Package()
            {
                "COMPONENT",
                0x0, // Component 0.
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
				
                Package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO7_A",      // Resource ID
                        1,                             // Voltage Regulator type = LDO
                        1800000,                       // Voltage = 1.8V
                        1,                             // Software Enable = Enable
                        4,                             // Software Power Mode: 7-NPM,4-LPM
                        0,                             // Head Room
                    },
                },
                Package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO9_A",      // Resource ID
                        1,                             // Voltage Regulator type = LDO
                        1304000,                       // Voltage = 1.304 V
                        1,                             // Software Enable = Enable
                        4,                             // Software Power Mode: 7-NPM,4-LPM
                        0,                             // Head Room
                    },
                },
                Package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO11_C",     // Resource ID
                        1,                             // Voltage Regulator type = LDO
                        3312000,                       // Voltage = 3.312 V
                        1,                             // Software Enable = Enable
                        4,                             // Software Power Mode: 7-NPM,4-LPM
                        0,                             // Head Room
                    },
                },
            },
            Package()
            {
                "DSTATE",
                0x3, // D3 state

                Package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO7_A",      // Resource ID
                        1,                             // Voltage Regulator type 1 = LDO
                        0,                             // Voltage = 0V
                        0,                             // Software Enable = Disable
                        4,                             // Software Power Mode = LPM
                        0,                             // Head Room
                    },
                },
                Package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO9_A",      // Resource ID
                        1,                             // Voltage Regulator type = LDO
                        0,                             // Voltage = 0V
                        0,                             // Software Enable = Disable
                        4,                             // Software Power Mode = LPM
                        0,                             // Head Room
                    },
                },
                Package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO11_C",     // Resource ID
                        1,                             // Voltage Regulator type = LDO
                        0,                             // Voltage = 0V
                        0,                             // Software Enable = Disable
                        4,                             // Software Power Mode = LPM
                        0,                             // Head Room
                    },
                },
            },
        },
        // END BTH0

        // PEP settings for FM SOC
        // END FM

    }) // END WBRC
}

