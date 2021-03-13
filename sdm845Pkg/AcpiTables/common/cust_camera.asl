//==============================================================================
//                           <cust_camera.asl>
// DESCRIPTION
//   This file contains resources (such as memory address, GPIOs, etc.) and
//   methods needed by camera drivers.
//
//==============================================================================

Include("cust_camera_exasoc.asl")

//
// CAMERA MIPI CSI (based on Titan 170 v1 hardware)
//
Device (MPCS)
{
    Name (_DEP, Package(0x1)
    {
        \_SB_.CAMP
    })

    Name (_HID, "QCOM02E8")
    Name (_UID, 24)

    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x0AC65000, 0x00000900)                           // PHY 0 memory
            Memory32Fixed (ReadWrite, 0x0AC66000, 0x00000900)                           // PHY 1 memory
            Memory32Fixed (ReadWrite, 0x0AC67000, 0x00000900)                           // PHY 2 memory

            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {509}      // PHY 0 interrupt, csiphy_0_irq
            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {510}      // PHY 1 interrupt, csiphy_1_irq
            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {511}      // PHY 2 interrupt, csiphy_2_irq
        })

        Return (RBUF)
    }

    // PERF, EBUF left blank intentionally as only F state support required at this point.
    // PEP Proxy is not needed as it is there for D state support.
}

//
// JPEG ENCODER (JPGE)
//   JPEG 0: a dedicated JPEG encode instance;
//   JPEG 3: a DMA instance (for downscaling only, not for encoding).
//   Each JPEG instance is controlled indpendently; having its own set of
//   registers for control and hardware operation, and its own core clock.
//
Device (JPGE)
{
    Name (_DEP, Package(0x2)
    {
        \_SB_.CAMP,
        \_SB_.MMU0
    })

    Name (_HID, "QCOM0276")
    Name (_UID, 23)

    Method (_CRS, 0x0, NotSerialized) 
    {
        Name (RBUF, ResourceTemplate ()
        {
            // TITAN_A_JPEG_0
            Memory32Fixed ( ReadWrite, 0x0AC4E000, 0x0340 )
                    
            // TITAN_A_JPEG_3
            Memory32Fixed ( ReadWrite, 0x0AC52000, 0x01B4 )

            // titan_jpeg_0_irq (Destination Subsystem: Application Processor)
            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) { 506 }

            // titan_jpeg_3_irq (Destination Subsystem: Application Processor)
            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) { 507 }
        })

        Return (RBUF)
    }

    Method (PERF)
    {
        Name (EBUF, Package()
        {
            Package()                                                   // JPEG instance 0 PSET_0
            {
                "COMPONENT",
                0,                                                      // Component ID: JPEG_0 = 0, JPEG_3/DMA = 1

                Package()
                {
                    "PSTATE_SET",
                    0,                                                  // P_Set Index
                    0,                                                  // CLK = 0, BW = 1
                    "JPEG0_CLK",

                    Package()
                    {
                        "PSTATE",
                        0,                                              // Chipversion list availabiliy
                        600000000,                                      // cam_cc_jpeg_clk supported configurations (TURBO = NOM / SVS / Low SVS)
                        600000000,
                        404000000,
                        200000000,
                    },
                 },
            },

            Package()                                                   // JPEG instance 3 PSET_0
            {
                "COMPONENT",
                1,

                Package() { "PSTATE_SET", 0, 0, "DMA_CLK", Package() { "PSTATE", 0, 600000000, 600000000, 200000000,    }, },   // cam_cc_jpeg_clk: Turbo / Nominal / LowSVS
            },
        })

        Return (EBUF)
    }
}

//
// VFE
//
Device (VFE0)
{
    Name (_DEP, Package(0x3)
    {
        \_SB_.MMU0,
        \_SB_.PEP0,
        \_SB_.CAMP
    })

    Name (_HID, "QCOM0243")
    Name (_UID, 22)

    Method (_CRS, 0x0, NotSerialized) 
    {
        Name (RBUF, ResourceTemplate ()
        {
            // ICP 
            Memory32Fixed (ReadWrite, 0xAC00000, 0x20000)
                    
            //CPASS_CDM
            Memory32Fixed (ReadWrite, 0xAC48000, 0x1000)

           //FD_WRAPPER
            Memory32Fixed (ReadWrite, 0xAC5A000, 0x4000)
                    
            // LRME
            Memory32Fixed (ReadWrite, 0xAC6B000, 0x1000)
                    
            //BPS
            Memory32Fixed (ReadOnly, 0xAC6F000, 0x8000)
                    
            // IPE0 
            Memory32Fixed (ReadOnly, 0xAC87000, 0xA000)
                    
            // IPE1
            Memory32Fixed (ReadOnly, 0xAC91000, 0xA000)
                    
            // IFE0 
            Memory32Fixed (ReadWrite, 0xACAF000, 0x5000)
                    
            //IFE1
            Memory32Fixed (ReadWrite, 0xACB6000, 0x5000)
                    
            //IFE_LITE
            Memory32Fixed (ReadWrite, 0xACC4000, 0x5000)
            
            //ICP FW
            Memory32Fixed (ReadWrite, 0x8BF00000, 0x500000)

            
            // CDM interrupt
            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {493}

            // ICP interrupt
            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {495}
            

            // IFE0 interrupt
            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {497} 

            // IFE1 interrupt
            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {499}

            // IFE LITE interrupt
            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {501}

            // FD interrupt
            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {494}

            // IFE0 CSID interrupt
            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {496}

            // IFE1 CSID interrupt
            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {498}

            // IFE LITE CSDI interrupt
            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {500}


        })
        Return (RBUF)
    }
    Method (PERF)
    {
            Name (EBUF, Package()
            {
            //------------------------------------------------------------------------------
            // VFE and CPP P-state values listed here specific to Platform
            // These packages enumerates all of the expected P-state values that should be used
            // for the P-state transitions decision by VFE/CPP cores
            // Package format is mentioned below.
            //------------------------------------------------------------------------------

            // Package()
            // {
            //    "COMPONENT"
            //    INTEGER,                   VFE0/JPEG = 0,VFE1 = 1,CPP = 2 
            //    Package()
            //    { 
            //       "PSTATE_SET",
            //       PSTATE_INDEX_INTEGER,    PStateIndex to access clocktable by index that contains Clock
            //                                having PState.                  
            //       PSTATESET_TYPE_INTEGER,  CLK = 0 , BW = 1
            //       STRING,                  ResourceName       
            //       Package()
            //       {
            //          "PSTATE" ,            Package type mentioned in ACPIPackageNames
            //          INTEGER,              Chipversion list availabiliy
            //      
            //          Clock values ,        Chipversion supported,
            //          Clock values ,        Chipversion supported,
            //          Clock values ,        Chipversion supported,
            //        },
            //    },
            // },

            Package()
            {
                "COMPONENT",
                0,                           // IFE0
                 // Clk Freq
                Package()
                { 
                    "PSTATE_SET",
                    0,                       // PStateSet Index
                    0,                       // CLK = 0 , BW = 1
                    "IFE0_CLK",
                    Package()
                    {
                            "PSTATE",
                            0,               // Chipversion list availabiliy
                            // Clock value       Chipversion supported
                            600000000,
                            480000000,
                            404000000,
                            0,
                    },
                },

                 // BW: TODO
                Package()
                { 
                    "PSTATE_SET",
                    1,                       // PStateSet Index
                    1,                       // CLK =0 , BW =1
                    "HF0_UNCOMP_BANDWIDTH",
                    Package()
                    {
                           "PSTATE",
                           0,                 // Chipversion list availabiliy
                           38000000000,
                           35000000000,
                           28000000000,
                           23000000000,
                           20000000000,
                           16000000000,
                           14000000000,
                           12000000000,
                            4000000000,
                            3500000000,
                            3300000000,
                            3100000000,
                            2900000000,
                            2700000000,
                            2500000000,
                            2300000000,
                            2100000000,
                            1900000000,
                            1700000000,
                            1500000000,
                            1300000000,
                            1100000000,
                            900000000, 
                            700000000, 
                            500000000, 
                            400000000, 
                            300000000, 
                            200000000, 
                            100000000, 
                            0,
                    },
                },
                Package()
                { 
                    "PSTATE_SET",
                    2,                       // PStateSet Index
                    1,                       // CLK =0 , BW =1
                    "HF0_BANDWIDTH",
                    Package()
                    {
                            "PSTATE",
                            0,                 // Chipversion list availabiliy
                           38000000000,
                           35000000000,
                           28000000000,
                           23000000000,
                           20000000000,
                           16000000000,
                           14000000000,
                           12000000000,
                            4000000000,
                            3500000000,
                            3300000000,
                            3100000000,
                            2900000000,
                            2700000000,
                            2500000000,
                            2300000000,
                            2100000000,
                            1900000000,
                            1700000000,
                            1500000000,
                            1300000000,
                            1100000000,
                            900000000, 
                            700000000, 
                            500000000, 
                            400000000, 
                            300000000, 
                            200000000, 
                            100000000, 
                            0,
                    },
                },

                 // CSID Clk Freq: TODO
            },
            
            Package()
            {
                "COMPONENT",
                1,                            // IFE1
                // Clk Freq
                Package()
                { 
                    "PSTATE_SET",
                    0,                       // PStateSet Index
                    0,                       // CLK = 0 , BW = 1
                    "IFE1_CLK",
                    Package()
                    {
                            "PSTATE",
                            0,               // Chipversion list availabiliy
                            // Clock value       Chipversion supported
                            600000000,
                            480000000,
                            404000000,
                            0,
                    },
                },

                 // BW: TODO
                Package()
                { 
                    "PSTATE_SET",
                    1,                       // PStateSet Index
                    1,                       // CLK =0 , BW =1
                    "HF1_UNCOMP_BANDWIDTH",
                    Package()
                    {
                           "PSTATE",
                           0,                 // Chipversion list availabiliy
                           38000000000,
                           35000000000,
                           28000000000,
                           23000000000,
                           20000000000,
                           16000000000,
                           14000000000,
                           12000000000,
                            4000000000,
                            3500000000,
                            3300000000,
                            3100000000,
                            2900000000,
                            2700000000,
                            2500000000,
                            2300000000,
                            2100000000,
                            1900000000,
                            1700000000,
                            1500000000,
                            1300000000,
                            1100000000,
                            900000000, 
                            700000000, 
                            500000000, 
                            400000000, 
                            300000000, 
                            200000000, 
                            100000000, 
                            0,
                    },
                },
                Package()
                { 
                    "PSTATE_SET",
                    2,                       // PStateSet Index
                    1,                       // CLK =0 , BW =1
                    "HF1_BANDWIDTH",
                    Package()
                    {
                           "PSTATE",
                           0,                 // Chipversion list availabiliy
                           38000000000,
                           35000000000,
                           28000000000,
                           23000000000,
                           20000000000,
                           16000000000,
                           14000000000,
                           12000000000,
                            4000000000,
                            3500000000,
                            3300000000,
                            3100000000,
                            2900000000,
                            2700000000,
                            2500000000,
                            2300000000,
                            2100000000,
                            1900000000,
                            1700000000,
                            1500000000,
                            1300000000,
                            1100000000,
                            900000000, 
                            700000000, 
                            500000000, 
                            400000000, 
                            300000000, 
                            200000000, 
                            100000000, 
                            0,
                    },
                },

                 // CSID Clk Freq: TODO
            },

            Package()
            {
                "COMPONENT",
                2,                            // IFE_LITE
                // Clk Freq
                Package()
                { 
                    "PSTATE_SET",
                    0,                       // PStateSet Index
                    0,                       // CLK = 0 , BW = 1
                    "IFE_LITE_CLK",
                    Package()
                    {
                            "PSTATE",
                            0,               // Chipversion list availabiliy
                            // Clock value       Chipversion supported
                            600000000,
                            480000000,
                            404000000,
                            0,
                    },
                },

                 // BW: ICBID_MASTER_CAMNOC_HF1_UNCOMP is used for both ife1 & ife_lite

                 // CSID Clk Freq: TODO
               
            },

            Package()
            {
                "COMPONENT",
                3,                               // ICP
                Package()
                { 
                    "PSTATE_SET",
                    0,                          // PStateSet Index
                    0,                          // CLK =0 , BW =1
                    "ICP_CLK",
                    Package()
                    {
                            "PSTATE",
                            0,                  // Chipversion list availabiliy 
                            // Clock value        Chipversion supported
                            600000000,
                            400000000,
                            0,
                    },
                },

                // AHB Clk: TODO
            },

            Package()
            {
                "COMPONENT",
                4,                               // IPE
                Package()
                { 
                    "PSTATE_SET",
                    0,                          // PStateSet Index
                    0,                          // CLK =0 , BW =1
                    "IPE0_CLK",
                    Package()
                    {
                            "PSTATE",
                            0,                  // Chipversion list availabiliy 
                            // Clock value        Chipversion supported
                            600000000,
                            480000000,
                            404000000,
                            0,
                    },
                },
                Package()
                { 
                    "PSTATE_SET",
                    1,                          // PStateSet Index
                    0,                          // CLK =0 , BW =1
                    "IPE1_CLK",
                    Package()
                    {
                            "PSTATE",
                            0,                  // Chipversion list availabiliy 
                            // Clock value        Chipversion supported
                            600000000,
                            480000000,
                            404000000,
                            0,
                    },
                },

                // BW: ICBID_MASTER_CAMNOC_SF_UNCOMP is used for ipe, bps, jepg, fd, icp, lrme

                // AHB Clk : TODO
                
            },

            Package()
            {
                "COMPONENT",
                5,                               // BPS
                Package()
                { 
                    "PSTATE_SET",
                    0,                          // PStateSet Index
                    0,                          // CLK =0 , BW =1
                    "BPS_CLK",
                    Package()
                    {
                            "PSTATE",
                            0,                  // Chipversion list availabiliy 
                            // Clock value        Chipversion supported
                            600000000,
                            480000000,
                            404000000,
                            0,
                    },
                },

                // BW: ICBID_MASTER_CAMNOC_SF_UNCOMP is used for ipe, bps, jepg, fd, icp, lrme

                // AHB Clk : TODO
            },

            Package()
            {
                "COMPONENT",
                6,                               // LRME
                Package()
                { 
                    "PSTATE_SET",
                    0,                          // PStateSet Index
                    0,                          // CLK =0 , BW =1
                    "LRME_CLK",
                    Package()
                    {
                            "PSTATE",
                            0,                  // Chipversion list availabiliy 
                            // Clock value        Chipversion supported
                            400000000,
                            320000000,
                            269000000,
                            0,
                    },
                },

                // BW: ICBID_MASTER_CAMNOC_SF_UNCOMP is used for ipe, bps, jepg, fd, icp, lrme

            },

            Package()
            {
                "COMPONENT",
                7,                               // FD
                Package()
                { 
                    "PSTATE_SET",
                    0,                          // PStateSet Index
                    0,                          // CLK =0 , BW =1
                    "FD_CLK",
                    Package()
                    {
                            "PSTATE",
                            0,                  // Chipversion list availabiliy 
                            // Clock value        Chipversion supported
                            600000000,
                            538000000,
                            400000000,
                            0,
                    },
                },

                // BW: ICBID_MASTER_CAMNOC_SF_UNCOMP is used for ipe, bps, jepg, fd, icp, lrme

            },
                    
        })
        
        Return (EBUF)
    }
}
