// PEP resources for WCNSS
Scope(\_SB_.PEP0)
{
    //Wireless Connectivity Devices
    Method(EWMD)
    {
        Return(WBRC)
    }

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

                package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_SMPS7_A",     // Resource ID
                        2,                             // Voltage Regulator type 2 = SMPS
                        1028000,                       // Voltage = 1.028 V
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
                        "PPP_RESOURCE_ID_LDO5_A",      // Resource ID
                        1,                             // Voltage Regulator type 1 = LDO
                        800000,                        // Voltage = 0.8 V
                        1,                             // Software Enable = Enable
                        7,                             // Software Power Mode = NPM
                        0,                             // Head Room
                    },
                },
                package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO7_A",      // Resource ID
                        1,                             // Voltage Regulator type 1 = LDO
                        1800000,                        // Voltage = 1.8 V
                        1,                             // Software Enable = Enable
                        7,                             // Software Power Mode = NPM
                        0,                             // Head Room
                    },
                },
                package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO17_A",      // Resource ID
                        1,                             // Voltage Regulator type 1 = LDO
                        1304000,                        // Voltage = 1.3 V
                        1,                             // Software Enable = Enable
                        7,                             // Software Power Mode = NPM
                        0,                             // Head Room
                    },
                },
                package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO25_A",      // Resource ID
                        1,                             // Voltage Regulator type 1 = LDO
                        3104000,                        // Voltage = 3.1 V
                        1,                             // Software Enable = Enable
                        7,                             // Software Power Mode = NPM
                        0,                             // Head Room
                    },
                },
            },
            Package()
            {
                "DSTATE",
                0x2, // D2 state

                package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO25_A",      // Resource ID
                        1,                             // Voltage Regulator type 1 = LDO
                        0,                             // Voltage = 0 V
                        0,                             // Software Enable = Disable
                        5,                             // Software Power Mode = LPM
                        0,                             // Head Room
                    },
                },
                package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO17_A",      // Resource ID
                        1,                             // Voltage Regulator type 1 = LDO
                        0,                             // Voltage = 0 V
                        0,                             // Software Enable = Disable
                        5,                             // Software Power Mode = LPM
                        0,                             // Head Room
                    },
                },
                package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO7_A",      // Resource ID
                        1,                             // Voltage Regulator type 1 = LDO
                        0,                             // Voltage = 0 V
                        0,                             // Software Enable = Disable
                        5,                             // Software Power Mode = LPM
                        0,                             // Head Room
                    },
                },
                Package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO5_A",      // Resource ID
                        1,                             // Voltage Regulator type 1 = LDO
                        0,                             // Voltage = 0 V
                        0,                             // Software Enable = Disable
                        5,                             // Software Power Mode = LPM
                        0,                             // Head Room
                    },
                },
                package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_SMPS7_A",     // Resource ID
                        2,                             // Voltage Regulator type 2 = SMPS
                        0,                             // Voltage = 0 V
                        0,                             // Software Enable = Disable
                        5,                             // Software Power Mode = LPM
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
                        "PPP_RESOURCE_ID_LDO25_A",      // Resource ID
                        1,                             // Voltage Regulator type 1 = LDO
                        0,                             // Voltage = 0 V
                        0,                             // Software Enable = Disable
                        5,                             // Software Power Mode = LPM
                        0,                             // Head Room
                    },
                },
                package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO17_A",      // Resource ID
                        1,                             // Voltage Regulator type 1 = LDO
                        0,                             // Voltage = 0 V
                        0,                             // Software Enable = Disable
                        5,                             // Software Power Mode = LPM
                        0,                             // Head Room
                    },
                },
                package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO7_A",      // Resource ID
                        1,                             // Voltage Regulator type 1 = LDO
                        0,                             // Voltage = 0 V
                        0,                             // Software Enable = Disable
                        5,                             // Software Power Mode = LPM
                        0,                             // Head Room
                    },
                },

                Package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO5_A",      // Resource ID
                        1,                             // Voltage Regulator type 1 = LDO
                        0,                             // Voltage = 0 V
                        0,                             // Software Enable = Disable
                        5,                             // Software Power Mode = LPM
                        0,                             // Head Room
                    },
                },
                package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_SMPS7_A",     // Resource ID
                        2,                             // Voltage Regulator type 2 = SMPS
                        0,                             // Voltage = 0 V
                        0,                             // Software Enable = Disable
                        5,                             // Software Power Mode = LPM
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
							"PPP_RESOURCE_ID_SMPS7_A",     // Resource ID
							2,                             // Voltage Regulator type 2 = SMPS
							1028000,                       // Voltage = 1.028 V
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
                            "PPP_RESOURCE_ID_LDO5_A",      // Resource ID
                            1,                             // Voltage Regulator type 1 = LDO
                            800000,                        // Voltage = 0.8 V
                            1,                             // Software Enable = Enable
                            7,                             // Software Power Mode = NPM
                            0,                             // Head Room
                        },
                    },
                    package()
                    {
                        "PMICVREGVOTE",
                        package()
                        {
                            "PPP_RESOURCE_ID_LDO7_A",      // Resource ID
                            1,                             // Voltage Regulator type 1 = LDO
                            1800000,                        // Voltage = 1.8 V
                            1,                             // Software Enable = Enable
                            7,                             // Software Power Mode = NPM
                            0,                             // Head Room
                        },
                    },
                    package()
                    {
                        "PMICVREGVOTE",
                        package()
                        {
                            "PPP_RESOURCE_ID_LDO17_A",      // Resource ID
                            1,                             // Voltage Regulator type 1 = LDO
                            1304000,                        // Voltage = 1.3 V
                            1,                             // Software Enable = Enable
                            7,                             // Software Power Mode = NPM
                            0,                             // Head Room
                        },
                    },
                    package()
                    {
                        "PMICVREGVOTE",
                        package()
                        {
                            "PPP_RESOURCE_ID_LDO25_A",      // Resource ID
                            1,                             // Voltage Regulator type 1 = LDO
                            3104000,                        // Voltage = 3.1 V
                            1,                             // Software Enable = Enable
                            7,                             // Software Power Mode = NPM
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
                            "PPP_RESOURCE_ID_LDO25_A",      // Resource ID
                            1,                             // Voltage Regulator type 1 = LDO
                            0,                             // Voltage = 0 V
                            0,                             // Software Enable = Disable
                            5,                             // Software Power Mode = LPM
                            0,                             // Head Room
                        },
                    },
                    package()
                    {
                        "PMICVREGVOTE",
                        package()
                        {
                            "PPP_RESOURCE_ID_LDO17_A",      // Resource ID
                            1,                             // Voltage Regulator type 1 = LDO
                            0,                             // Voltage = 0 V
                            0,                             // Software Enable = Disable
                            5,                             // Software Power Mode = LPM
                            0,                             // Head Room
                        },
                    },
                    package()
                    {
                        "PMICVREGVOTE",
                        package()
                        {
                            "PPP_RESOURCE_ID_LDO7_A",      // Resource ID
                            1,                             // Voltage Regulator type 1 = LDO
                            0,                             // Voltage = 0 V
                            0,                             // Software Enable = Disable
                            5,                             // Software Power Mode = LPM
                            0,                             // Head Room
                        },
                    },

                    Package()
                    {
                        "PMICVREGVOTE",
                        package()
                        {
                            "PPP_RESOURCE_ID_LDO5_A",      // Resource ID
                            1,                             // Voltage Regulator type 1 = LDO
                            0,                             // Voltage = 0 V
                            0,                             // Software Enable = Disable
                            5,                             // Software Power Mode = LPM
                            0,                             // Head Room
                        },
                    },
					package()
					{
						"PMICVREGVOTE",
						package()
						{
							"PPP_RESOURCE_ID_SMPS7_A",     // Resource ID
							2,                             // Voltage Regulator type 2 = SMPS
							0,                             // Voltage = 0 V
							0,                             // Software Enable = Disable
							5,                             // Software Power Mode = LPM
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

                package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_SMPS3_A",     // Resource ID
                        2,                             // Voltage Regulator type 2 = SMPS
                        1352000,                       // Voltage = 1.352 V
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
                        "PPP_RESOURCE_ID_SMPS5_A",     // Resource ID
                        2,                             // Voltage Regulator type 2 = SMPS
                        2040000,                       // Voltage = 2.04 V
                        1,                             // Software Enable = Enable
                        6,                             // Software Power Mode = Auto
                        0,                             // Head Room
                    },
                },
                Package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO7_A",      // Resource ID
                        1,                             // Voltage Regulator type 1 = LDO
                        1800000,                       // Voltage = 1.8 V
                        1,                             // Software Enable = Enable
                        5,                             // Software Power Mode = LPM
                        0,                             // Head Room
                    },
                },
                Package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO17_A",     // Resource ID
                        1,                             // Voltage Regulator type 1 = LDO
                        1304000,                       // Voltage = 1.304 V
                        1,                             // Software Enable = Enable
                        5,                             // Software Power Mode = LPM
                        0,                             // Head Room
                    },
                },
                Package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO25_A",     // Resource ID
                        1,                             // Voltage Regulator type 1 = LDO
                        3104000,                       // Voltage = 3.104 V
                        1,                             // Software Enable = Enable
                        5,                             // Software Power Mode = LPM
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
                        0,                             // Voltage = 0 V
                        0,                             // Software Enable = Disable
                        5,                             // Software Power Mode = LPM
                        0,                             // Head Room
                    },
                },
                Package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO17_A",     // Resource ID
                        1,                             // Voltage Regulator type 1 = LDO
                        0,                             // Voltage = 0 V
                        0,                             // Software Enable = Disable
                        5,                             // Software Power Mode = LPM
                        0,                             // Head Room
                    },
                },
                Package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_LDO25_A",    // Resource ID
                        1,                            // Voltage Regulator type 1 = LDO
                        0,                            // Voltage = 0 V
                        0,                            // Software Enable = Disable
                        5,                            // Software Power Mode = LPM
                        0,                            // Head Room
                    },
                },
                package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_SMPS3_A",     // Resource ID
                        2,                             // Voltage Regulator type 2 = SMPS
                        0,                             // Voltage = 0 V
                        0,                             // Software Enable = Disable
                        5,                             // Software Power Mode = LPM
                        0,                             // Head Room
                    },
                },
                package()
                {
                    "PMICVREGVOTE",
                    package()
                    {
                        "PPP_RESOURCE_ID_SMPS5_A",     // Resource ID
                        2,                             // Voltage Regulator type 2 = SMPS
                        0,                             // Voltage = 0 V
                        0,                             // Software Enable = Disable
                        5,                             // Software Power Mode = LPM
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
