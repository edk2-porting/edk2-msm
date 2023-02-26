//===========================================================================
//                           <ipa_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by ipa driver.
//
//===========================================================================

//===========================================================================
// Implementation of function states for IPA driver.
// Present implementation has two function states F0 and F1.
//
// F0 = Full power mode.
// F1 = Low power mode.
//
// Resource being managed is /clk/ipa
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
            },
        },
    })
}
