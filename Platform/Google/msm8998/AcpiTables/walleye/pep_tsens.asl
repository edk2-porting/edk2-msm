Scope (\_SB.PEP0)
{
    Method (CTSN, 0, NotSerialized)
    {
        Return (THSD) /* \_SB_.PEP0.THSD */
    }

    Method (PEPH, 0, NotSerialized)
    {
        Return (Package (One)
        {
            "ACPI\\VEN_QCOM&DEV_0035"
        })
    }

    Method (BCLH, 0, NotSerialized)
    {
        Return (Package (One)
        {
            "ACPI\\VEN_QCOM&DEV_0093"
        })
    }

    // Thermal sensors PL specific configurations
    Name (THSD, Package (0x08)
    {
        //	Below package contains a list of all the identified physical thermal sensors mapped to unique HIDs
		//	
        Package (0x17)
        {
            0x16, //Total number of thermal physical sensors
            Package (0x02)
            {
                "ACPI\\VEN_QCOM&DEV_007D", 
                Zero
            }, 

            Package (0x02)
            {
                "ACPI\\VEN_QCOM&DEV_007E", 
                One
            }, 

            Package (0x02)
            {
                "ACPI\\VEN_QCOM&DEV_007F", 
                0x02
            }, 

            Package (0x02)
            {
                "ACPI\\VEN_QCOM&DEV_0080", 
                0x03
            }, 

            Package (0x02)
            {
                "ACPI\\VEN_QCOM&DEV_0081", 
                0x04
            }, 

            Package (0x02)
            {
                "ACPI\\VEN_QCOM&DEV_0082", 
                0x05
            }, 

            Package (0x02)
            {
                "ACPI\\VEN_QCOM&DEV_0083", 
                0x06
            }, 

            Package (0x02)
            {
                "ACPI\\VEN_QCOM&DEV_0084", 
                0x07
            }, 

            Package (0x02)
            {
                "ACPI\\VEN_QCOM&DEV_0085", 
                0x08
            }, 

            Package (0x02)
            {
                "ACPI\\VEN_QCOM&DEV_0086", 
                0x09
            }, 

            Package (0x02)
            {
                "ACPI\\VEN_QCOM&DEV_0087", 
                0x0A
            }, 

            Package (0x02)
            {
                "ACPI\\VEN_QCOM&DEV_00AD", 
                0x0B
            }, 

            Package (0x02)
            {
                "ACPI\\VEN_QCOM&DEV_00AE", 
                0x0C
            }, 

            Package (0x02)
            {
                "ACPI\\VEN_QCOM&DEV_00AF", 
                0x0D
            }, 

            Package (0x02)
            {
                "ACPI\\VEN_QCOM&DEV_00B0", 
                0x0E
            }, 

            Package (0x02)
            {
                "ACPI\\VEN_QCOM&DEV_00B1", 
                0x0F
            }, 

            Package (0x02)
            {
                "ACPI\\VEN_QCOM&DEV_00CD", 
                0x10
            }, 

            Package (0x02)
            {
                "ACPI\\VEN_QCOM&DEV_00CE", 
                0x11
            }, 

            Package (0x02)
            {
                "ACPI\\VEN_QCOM&DEV_00CF", 
                0x12
            }, 

            Package (0x02)
            {
                "ACPI\\VEN_QCOM&DEV_00D0", 
                0x13
            }, 

            Package (0x02)
            {
                "ACPI\\VEN_QCOM&DEV_00D1", 
                0x14
            }, 

            Package (0x02)
            {
                "ACPI\\VEN_QCOM&DEV_00DF", 
                0x15
            }
        }, 

        // TSENSLIST Package
        // This package contains "lists" of thermal sensors
        // each list maps to a virtual thermal sensor
        // Always the first package should be BIG CPU, second one is LITTLE CPU and third one is ALL CPU SENSOR lists. 
        // Do not interchage inside packages. Always add new sensor list package at the end.

        Package (0x04)
        {
            0x03, 
            Package (0x04)
            {
                "ACPI\\VEN_QCOM&DEV_00B2", 
                0x16, 
                0x05, 
                Package (0x05)
                {
                    One, 
                    0x02, 
                    0x03, 
                    0x04, 
                    0x05
                }
            }, 

            Package (0x04)
            {
                "ACPI\\VEN_QCOM&DEV_00B3", 
                0x17, 
                0x06, 
                Package (0x06)
                {
                    0x06, 
                    0x07, 
                    0x08, 
                    0x09, 
                    0x0A, 
                    0x0B
                }
            }, 

            Package (0x04)
            {
                "ACPI\\VEN_QCOM&DEV_00B4", 
                0x18, 
                0x16, 
                Package (0x16)
                {
                    Zero, 
                    One, 
                    0x02, 
                    0x03, 
                    0x04, 
                    0x05, 
                    0x06, 
                    0x07, 
                    0x08, 
                    0x09, 
                    0x0A, 
                    0x0B, 
                    0x0C, 
                    0x0D, 
                    0x0E, 
                    0x0F, 
                    0x10, 
                    0x11, 
                    0x12, 
                    0x13, 
                    0x14, 
                    0x15
                }
            }
        }, 

        // Sensor HID to Vadc thermistor mapping package
        // INX and this needs to be in sync 
        // channel list/names need to obtained from tsens team
        Package (0x07)
        {
            0x06, 
            Package (0x04)
            {
                "SYS_THERM1", 
                "ACPI\\VEN_QCOM&DEV_0099", 
                Zero, 
                Zero
            }, 

            Package (0x04)
            {
                "SYS_THERM2", 
                "ACPI\\VEN_QCOM&DEV_009A", 
                One, 
                Zero
            }, 

            Package (0x04)
            {
                "PA_THERM", 
                "ACPI\\VEN_QCOM&DEV_009B", 
                0x02, 
                Zero
            }, 

            Package (0x04)
            {
                "PA_THERM1", 
                "ACPI\\VEN_QCOM&DEV_009C", 
                0x03, 
                Zero
            }, 

            Package (0x04)
            {
                "SYS_THERM3", 
                "ACPI\\VEN_QCOM&DEV_009D", 
                0x04, 
                Zero
            }, 

            Package (0x04)
            {
                "PMIC_THERM", 
                "ACPI\\VEN_QCOM&DEV_009E", 
                0x05, 
                Zero
            }
        }, 

        Package (0x02)
        {
            One, // number of Thermal Restrictions
            Package (0x05)
            {
                0x02, 
                0x0ADC, 
                0x0B0E, 
                0x02, 
                One
            }
        }, 

        //QMI clients
        Package (0x02)
        {
            One, // Number Of QMI Clients.
            Package (0x03)
            {
                "cpuv_restriction_cold", 
                One, 
                Zero
            }
        }, 

        // PPP PMIC VREG clients: ACPI is being parsed in the order defined in PEP_Thermal_Common.h
        // Client info will be parsed incorrectly, if this package is removed.   
        Package (0x03)
        {
            0x02, 
            Package (0x13)
            {
                0x02, 
                "PPP_RESOURCE_ID_SMPS1_C", 
                One, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                "RAIL_VOLTAGE_LEVEL_NOMINAL", 
                Zero, 
                Zero
            }, 

            Package (0x13)
            {
                0x07, 
                "PPP_RESOURCE_ID_SMPS8_A", 
                One, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                "RAIL_VOLTAGE_LEVEL_SVS_HIGH", 
                Zero, 
                Zero
            }
        }, 

        Package (0x05)
        {
            0x04, 
            Package (0x06)
            {
                One, 
                "PPP_RESOURCE_ID_RWAY_CX", 
                0x0E, 
                Zero, 
                "RAIL_VOLTAGE_LEVEL_OFF", 
                "RAIL_VOLTAGE_LEVEL_NOMINAL"
            }, 

            Package (0x06)
            {
                0x05, 
                "PPP_RESOURCE_ID_RWAY_MX", 
                0x0E, 
                Zero, 
                "RAIL_VOLTAGE_LEVEL_OFF", 
                "RAIL_VOLTAGE_LEVEL_NOMINAL"
            }, 

            Package (0x06)
            {
                0x06, 
                "PPP_RESOURCE_ID_RWAY_SSC_CX", 
                0x0E, 
                Zero, 
                "RAIL_VOLTAGE_LEVEL_OFF", 
                "RAIL_VOLTAGE_LEVEL_NOMINAL"
            }, 

            Package (0x06)
            {
                0x08, 
                "PPP_RESOURCE_ID_RWAY_SSC_MX", 
                0x0E, 
                Zero, 
                "RAIL_VOLTAGE_LEVEL_OFF", 
                "RAIL_VOLTAGE_LEVEL_NOMINAL"
            }
        }, 

        //	LTVR Package having 3 sub-packages:
        //	1) Rail type from enum RAIL_TYPE in PEP_Thermal_Common.h
        //	2) Voting type - available options are EnableKraitVFC(0), VoteViaPPP(1), VoteViaQMI(2), VoteViaAOP(3) and VoteViaCallBackObj(4)
        //  3) Client subpackage number for Voting type clients package
        //  VoteViaAOP
        //      AOP does not require rail type to vote during LTVR. 
        //      It just needs an event with value on or off and it places NOM vote on cx, mx & ebi. 
        //      Only cx is added to get callback in LTVR.
        //  VoteViaCallBackObj
        //      LTVR callback notifies to all the registered clients. it is independent of rail type and voting type.
        //
        Package (0x09)
        {
            0x08, 
            Package (0x03)
            {
                Zero, 
                Zero, 
                Zero
            }, 

            Package (0x03)
            {
                One, 
                0x03, 
                Zero
            }, 

            Package (0x03)
            {
                0x02, 
                One, 
                Zero
            }, 

            Package (0x03)
            {
                0x03, 
                0x02, 
                Zero
            }, 

            Package (0x03)
            {
                0x05, 
                0x03, 
                One
            }, 

            Package (0x03)
            {
                0x06, 
                0x03, 
                0x02
            }, 

            Package (0x03)
            {
                0x07, 
                One, 
                One
            }, 

            Package (0x03)
            {
                0x08, 
                0x03, 
                0x03
            }
        }
    })
}
