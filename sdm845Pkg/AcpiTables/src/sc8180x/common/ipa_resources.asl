//===========================================================================
//                           <ipa_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by ipa driver.
//
//
//   Copyright (c) 2014-2019 by Mmoclauq Technologies Inc.  All Rights Reserved.
//   Mmoclauq Confidential and Proprietary
//
//===========================================================================

//===========================================================================
// Implementation of function & perf states for IPA driver.
// Present implementation has two function states F0 & F1 
// and two perf states P0 & P1
//
// F0 = Full power mode
// F1 = Low power mode
//
// P0 = Power collapse disabled
// P1 = Power collapse enabled
//
// Resources being managed are /clk/ipa & /ipa/pc
//===========================================================================

Scope(\_SB.PEP0)
{
    Method(IPMD){
        Return(IPSC)
    }

    Name(IPSC,
    Package()
    {
        Package()
        {
            "DEVICE",
            "\\_SB.IPA",
            Package()
            {
                "COMPONENT",
                0x0,
                Package()
                {
                    "FSTATE",
					0x0,
                    package()
                    {
                        "BUSARB",
                        Package()
                        {
                            3,                         // Req Type
							"ICBID_MASTER_IPA_CORE",   // Master
                            "ICBID_SLAVE_IPA_CORE",    // Slave
                            37400,              	   // IB= KHz ( map 37500 KHz needs to mapped to IB value )
                            0,                         // AB
                            "HLOS_DRV",                // Optional: DRV Id
                        },
                    }, 
                },
                Package()
                {
                    "FSTATE",
                    0x1,
                    package()
                    {
                        "BUSARB",
                        Package()
                        {
                            3,                         // Req Type
							"ICBID_MASTER_IPA_CORE",   // Master
                            "ICBID_SLAVE_IPA_CORE",    // Slave
							0,			               // IB
                            0,           			   // AB
                            "HLOS_DRV",    			   // Optional: DRV Id
                        },
                    }, 
                },
				Package()
                {
                    "PSTATE_SET",
                    0x0, 
					Package()
					{
						"PSTATE",
						0x0,						// State ID
						Package() 
						{ 
							"NPARESOURCE",			// Resource Type
							Package() 
							{      
								1,					// Required Resource
								"/ipa/pc",			// IPA Power Collapse Resource
								0					// Resource value
							}
						},
					},
					Package()
					{
						"PSTATE",
						0x1,						// State ID
						Package() 
						{ 
							"NPARESOURCE",			// Resource Type
							Package() 
							{      
								1,					// Required Resource
								"/ipa/pc",			// IPA Power Collapse Resource
								1					// Resource value
							}
						},
					},
                    Package()
                    { 
                        "PREPARE_PSTATE",		   // Resource state before driver load
                        0,
                    },
                },
            },
        },
    })
}