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

Scope (\_SB.PEP0)
{
    Method (IPMD, 0, NotSerialized)
    {
        Return (IPSC) /* \_SB_.PEP0.IPSC */
    }

    Name (IPSC, Package (0x01)
    {
        Package (0x03)
        {
            "DEVICE", 
            "\\_SB.IPA", 
            Package (0x04)
            {
                "COMPONENT", 
                Zero, 
                Package (0x03)
                {
                    "FSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "BUSARB", 
                        Package (0x06)
                        {
                            0x03,                       // Req Type
                            "ICBID_MASTER_IPA_CORE",    // Master 
                            "ICBID_SLAVE_IPA_CORE",     // Slave
                            0x9218,                     // IB= KHz 
                            Zero,                       // AB
                            "HLOS_DRV"                  // Optional: DRV Id
                        }
                    }
                }, 

                Package (0x03)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "BUSARB", 
                        Package (0x06)
                        {
                            0x03, 
                            "ICBID_MASTER_IPA_CORE", 
                            "ICBID_SLAVE_IPA_CORE", 
                            Zero, 
                            Zero, 
                            "HLOS_DRV"
                        }
                    }
                }
            }
        }
    })
}
