//===========================================================================
//                           <HoyaSmmu_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by SMMU driver.
//
//===========================================================================
Scope(\_SB.PEP0){
    // SMMU
    Method(SMMD){
        Return(SMMC)
    }
    Name(SMMC,
    Package(){

        // SMMU MNOC Resources
        Package(){
            "DEVICE",
            "\\_SB.MMU0",
            //--------------------------------------------------------------------------------------
            //  Component 0   -
            //--------------------------------------------------------------------------------------
            //
            Package(){
                "COMPONENT",
                0,
                Package(){
                    "FSTATE",
                    0,

                    // Action:       1 == ENABLE
                    //
                    //                                   Domain Name                 		Action
                    //                                   ----------------            		------
                    // Package() { "FOOTSWITCH", Package() { "gcc_hlos1_vote_mmu_tcu_gds",               1,         },},  

                    // Action:       1 == ENABLE
                    // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                    //
                    //                              Clock Name                 Action 
                    //                              --------------------       ------ 
                    Package() { "CLOCK", Package() { "gcc_hlos1_vote_mmu_tcu_clk",   1 }}

                },
                Package(){
                    "FSTATE",
                    1,

                    // Action:       2 == DISABLE
                    // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                    //
                    //                              Clock Name                 Action 
                    //                              --------------------       ------ 
                    Package() { "CLOCK", Package() { "gcc_hlos1_vote_mmu_tcu_clk",       2 }},

                    // Action:       2 == DISABLE
                    //
                    //                                   Domain Name                           Action
                    //                                   ----------------                      ------
                    // Package() { "FOOTSWITCH", Package() { "gcc_hlos1_vote_mmu_tcu_gds",                 2,         },}, 

                },
            },
        },

        // A5x/GFX SMMU Resources
        Package(){
            "DEVICE",
            "\\_SB.MMU1",
            //--------------------------------------------------------------------------------------
            //  Component 0   -
            //--------------------------------------------------------------------------------------
            //
            Package(){
                "COMPONENT",
                0,
                Package(){
                    "FSTATE",
                    0,

                    // Vote for the frequencies we need otherwise these clocks may not be configured properly

                    // Action:       1 == ENABLE
                    //
                    //                                   Domain Name             Action
                    //                                   ----------------        ------
                    Package() { "FOOTSWITCH", Package() { "gcc_hlos1_vote_gpu_smmu_gds",   1 }},

                    // Action:       1 == ENABLE
                    // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                    //
                    //                              Clock Name                     Action 
                    //                              --------------------           ------ 
                    Package() { "CLOCK", Package() { "gcc_hlos1_vote_gpu_smmu_clk",   1 }},

                },
                Package(){
                    "FSTATE",
                    1,

                    // Action:       2 == DISABLE
                    // MatchType:    1 == CLOCK_FREQUENCY_HZ_AT_LEAST
                    //
                    //                              Clock Name                     Action
                    //                              --------------------           ------
                    Package() { "CLOCK", Package() { "gcc_hlos1_vote_gpu_smmu_clk",   2 }},
                    
                                        
                    // Action:       2 == DISABLE
                    //
                    //                                   Domain Name                 Action
                    //                                   ----------------            ------
                    Package() { "FOOTSWITCH", Package() { "gcc_hlos1_vote_gpu_smmu_gds",   2 }},

                },
            },
        },
    })
}
