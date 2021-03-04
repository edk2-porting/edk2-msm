//===========================================================================
//                           <tmm_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by SMMU test driver.
//
//
//
//===========================================================================

Scope(\_SB_.PEP0){
    // SMMU
    Method(TMMD){
        Return(TMMC)
    }
    Name(TMMC, 
    Package(){
        Package(){
            "DEVICE", 
            "\\_SB.TMM0", 
            Package(){
                "COMPONENT", 
                0, 
                Package(){
                    "FSTATE", 
                    0, 
                    package(){ 
                        "FOOTSWITCH", 
                        package(){ 
                            "VDD_CAMSS_VFE", // Footswitch Name - VDD_CAMSS_VFE
                            1, // Action - 1 - Enable
                        },
                    },
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "camss_vfe_cpp_ahb_clk", // Clock Name - camss_vfe_cpp_ahb_clk
                            1, // Action - 1 - Enable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "camss_vfe_cpp_clk", // Clock Name - camss_vfe_cpp_clk
                            1, // Action - 1 - Enable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "camss_vfe_vfe0_clk", // Clock Name - camss_vfe_vfe0_clk
                            1, // Action - 1 - Enable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "camss_vfe_vfe1_clk", // Clock Name - camss_vfe_vfe1_clk
                            1, // Action - 1 - Enable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "camss_vfe_vfe_ahb_clk", // Clock Name - camss_vfe_vfe_ahb_clk
                            1, // Action - 1 - Enable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "camss_vfe_vfe_axi_clk", // Clock Name - camss_vfe_vfe_axi_clk
                            1, // Action - 1 - Enable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "camss_top_ahb_clk", // Clock Name - camss_top_ahb_clk
                            1, // Action - 1 - Enable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
					package(){ 
                        "CLOCK", 
                        package(){ 
                            "camss_ahb_clk", // Clock Name - camss_ahb_clk
                            1, // Action - 1 - Enable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                    package(){ 
                        "FOOTSWITCH", 
                        package(){ 
                            "VDD_VENUS0", // Footswitch Name - VDD_VENUS0
                            1, // Action - 1 - Enable
                        },
                    },
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "venus0_vcodec0_clk", // Clock Name - venus0_vcodec0_clk
                            1, // Action - 1 - Enable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "venus0_axi_clk", // Clock Name - venus0_axi_clk
                            1, // Action - 1 - Enable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "venus0_ahb_clk", // Clock Name - venus0_ahb_clk
                            1, // Action - 1 - Enable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "venus0_ocmemnoc_clk", // Clock Name - venus0_ocmemnoc_clk
                            1, // Action - 1 - Enable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "ocmemcx_ocmemnoc_clk", // Clock Name - ocmemcx_ocmemnoc_clk
                            1, // Action - 1 - Enable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                },
                Package(){
                    "FSTATE", 
                    1, 
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "camss_vfe_cpp_ahb_clk", // Clock Name - camss_vfe_cpp_ahb_clk
                            2, // Action - 2 - Disable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "camss_vfe_cpp_clk", // Clock Name - camss_vfe_cpp_clk
                            2, // Action - 2 - Disable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "camss_vfe_vfe0_clk", // Clock Name - camss_vfe_vfe0_clk
                            2, // Action - 2 - Disable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "camss_vfe_vfe1_clk", // Clock Name - camss_vfe_vfe1_clk
                            2, // Action - 2 - Disable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "camss_vfe_vfe_ahb_clk", // Clock Name - camss_vfe_vfe_ahb_clk
                            2, // Action - 2 - Disable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "camss_vfe_vfe_axi_clk", // Clock Name - camss_vfe_vfe_axi_clk
                            2, // Action - 2 - Disable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "camss_top_ahb_clk", // Clock Name - camss_top_ahb_clk
                            2, // Action - 2 - Disable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
					package(){ 
                        "CLOCK", 
                        package(){ 
                            "camss_ahb_clk", // Clock Name - camss_ahb_clk
                            2, // Action - 2 - Disable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                    package(){ 
                        "FOOTSWITCH", 
                        package(){ 
                            "VDD_CAMSS_VFE", // Footswitch Name - VDD_CAMSS_VFE
                            2, // Action - 2 - Disable
                        },
                    },
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "venus0_vcodec0_clk", // Clock Name - venus0_vcodec0_clk
                            2, // Action - 2 - Disable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "venus0_axi_clk", // Clock Name - venus0_axi_clk
                            2, // Action - 2 - Disable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "venus0_ahb_clk", // Clock Name - venus0_ahb_clk
                            2, // Action - 2 - Disable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "venus0_ocmemnoc_clk", // Clock Name - venus0_ocmemnoc_clk
                            2, // Action - 2 - Disable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                    package(){ 
                        "CLOCK", 
                        package(){ 
                            "ocmemcx_ocmemnoc_clk", // Clock Name - ocmemcx_ocmemnoc_clk
                            2, // Action - 2 - Disable
                            0, // Frequency - 0
                            1, // Match Type - At Least (Hz)
                        },
                    },
                    package(){ 
                        "FOOTSWITCH", 
                        package(){ 
                            "VDD_VENUS0", // Footswitch Name - VDD_VENUS0
                            2, // Action - 2 - Disable
                        },
                    },
                },
            },
        },
    })
}