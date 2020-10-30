//===========================================================================
//                           <crypto_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by pep drivers.
//
//
//   Copyright (c) 2010-2011 by Mmoclauq Technologies Inc.  All Rights Reserved.
//   Mmoclauq Confidential and Proprietary
//
//===========================================================================



Scope(\_SB_.PEP0) 
{
    // CRYPTO 
    Method(SSMD)
    {
        Return(CSCC)
    }   
   
    Name(CSCC,
    Package ()
    { 
        Package()
        {
            "DEVICE",
            "\\_SB.SSM",
            Package()
            {
                   "COMPONENT",
                   0x0, // Component 0.
                   Package()
                   {
                       "FSTATE",
                       0x0, // f0 state
                       package() { "BUSARB", Package() { 3, "ICBID_MASTER_CRYPTO_CORE0", "ICBID_SLAVE_EBI1", 200000000, 200000000}},
                       package(){ "REQUIRED_RESOURCE", package(){ 1, "/clk/ce1", 100000000 } },
                   },

                   Package()
                   {
                       "FSTATE",
                       0x1, // f1 state
                       //package() {"REQUIRED_RESOURCE", package() { 0, "/clk/snoc", 0x0}},
                       //package() {"REQUIRED_RESOURCE", package() { 0, "/clk/cnoc", 0x0}},
                       package() { "BUSARB", Package() { 3, "ICBID_MASTER_CRYPTO_CORE0", "ICBID_SLAVE_EBI1", 0, 0}},
                       package(){ "REQUIRED_RESOURCE", package(){ 1, "/clk/ce1", 0 } },         
                   },    
            },

            Package()
            {
               "COMPONENT",
                0x1, // Component 1.
                Package()
                {
                    "FSTATE",
                    0x0, // f0 state
                        //package() {"REQUIRED_RESOURCE", package() { 1, "/clk/snoc", 0xffffffff}},
                        //package() {"REQUIRED_RESOURCE", package() { 1, "/clk/cnoc", 0xffffffff}},
                        package() { "BUSARB", Package() { 3, "ICBID_MASTER_CRYPTO_CORE1", "ICBID_SLAVE_EBI1", 200000000, 200000000}},         
                        package(){ "REQUIRED_RESOURCE", package(){ 1, "/clk/ce2", 100000000 } },
                },

                Package()
                {
                    "FSTATE",
                    0x1, // f1 state
                        //package() {"REQUIRED_RESOURCE", package() { 0, "/clk/snoc", 0x0}},
                        //package() {"REQUIRED_RESOURCE", package() { 0, "/clk/cnoc", 0x0}},      
                        package() { "BUSARB", Package() { 3, "ICBID_MASTER_CRYPTO_CORE1", "ICBID_SLAVE_EBI1", 0, 0}},
                        package(){ "REQUIRED_RESOURCE", package(){ 1, "/clk/ce2", 0 } },
                },
            },
        },
        /////////////////////////////////////////////////////////////////////////////////////
    })      
   
}
