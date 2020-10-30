//
// Copyright (c) 2017 - 2019 Mmoclauq Technologies, Inc. All rights reserved.
//

//
//
//  Please note that not all the SE engine instances (I2C/SPI/UART) from below asl file can be used directly by icluding in the client ACPI, 
//  The corresponding Access Control needs to be enabled from TZ side to get the SE/usecase working End 2 End.
//
//

//
// QUPV3_ID1_SE5 (UART Debug port)
//
Device (UARD)
{
    Name (_HID, "HID_UART")
    Alias(\_SB.PSUB, _SUB)
    Name (_UID, 13)
    Name (_DEP, Package() { \_SB_.PEP0 })
    Name (_CCA, 0)

    Method (_CRS)
    {
        Name (RBUF, ResourceTemplate()
        {
            Memory32Fixed(ReadWrite, 0x00a90000, 0x0004000)
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive) {389}
            GpioInt(Edge, ActiveLow, Exclusive, PullDown, 0, "\\_SB.GIO0") {86}  // UART RX,
        })
        Return (RBUF)
    }
}

//
// QUPV3_ID1_SE6  (Housekeeping UART (GPIOs 83, 84))
//
Device (UR14)
{
    Name (_HID, "HID_UART")
    Alias(\_SB.PSUB, _SUB)
    Name (_UID, 14)
    Name (_DEP, Package() { \_SB_.PEP0 })
    Name (_CCA, 0)

    Method (_CRS)
    {
        Name (RBUF, ResourceTemplate()
        {
            Memory32Fixed(ReadWrite, 0x00a94000, 0x00004000)
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive) {390}
            GpioInt(Edge, ActiveLow, Exclusive, PullDown, 0, "\\_SB.GIO0") {83}  // UART RX
        })
        Return (RBUF)
    }
}

//
// QUPV3_ID2_SE4 (attached to BT SOC)
//
Device (UR18)
{
    Name (_HID, "HID_UART")
    Alias(\_SB.PSUB, _SUB)
    Name (_UID, 18)
    Name (_DEP, Package() { \_SB_.PEP0 })
    Name (_CCA, 0)

    Method (_CRS)
    {
        Name (RBUF, ResourceTemplate()
        {
            Memory32Fixed(ReadWrite, 0x00c8c000, 0x0004000)
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive) {617}
            GpioInt(Edge, ActiveLow, Exclusive, PullDown, 0, "\\_SB.GIO0") {46}  // UART RX,
        })
        Return (RBUF)
    }

    Method (_STA)
    {  
      Return (0x0B)
    }
}

//
// QUPV3_ID2_SE6  (HS UART - 5G (GPIO 29, 30)(only for OEM Superset Platform))
//
Device (UR20)
{
    Name (_HID, "HID_UART")
    Alias(\_SB.PSUB, _SUB)
    Name (_UID, 20)
    Name (_DEP, Package() { \_SB_.PEP0 })
    Name (_CCA, 0)

    Method (_CRS)
    {
        Name (RBUF, ResourceTemplate()
        {
            Memory32Fixed(ReadWrite, 0x00c94000, 0x00004000)
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive) {619}
            GpioInt(Edge, ActiveLow, Exclusive, PullDown, 0, "\\_SB.GIO0") {30}  // UART RX
        })
        Return (RBUF)
    }
}

//
// I2C5 - "Core I2C Bus"
//
Device (I2C5)
{
    Name (_HID, "HID_I2C")
    Alias(\_SB.PSUB, _SUB)
    Name (_UID, 5)
    Name (_DEP, Package() { \_SB_.PEP0 })
//    Name (_DEP, Package(){\_SB_.PEP0,\_SB_.QGP0})
    Name (_CCA, 0)

    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x00890000, 0x00004000)
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {637}
        })
        Return (RBUF)
    }
}

//
// I2C8 - "OEM Dock I/O"
//
Device (I2C8)
{
    Name (_HID, "HID_I2C")
    Alias(\_SB.PSUB, _SUB)
    Name (_UID, 8)
    Name (_DEP, Package() { \_SB_.PEP0 })
//    Name (_DEP, Package(){\_SB_.PEP0,\_SB_.QGP0})
    Name (_CCA, 0)

    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x0089c000, 0x00004000)
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {640}
        })
        Return (RBUF)
    }
}

//
// I2C10 - "NFC Sensor"
//
Device (IC10)
{
    Name (_HID, "HID_I2C")
    Alias(\_SB.PSUB, _SUB)
    Name (_UID, 10)
    Name (_DEP, Package() { \_SB_.PEP0 })
//    Name (_DEP, Package(){\_SB_.PEP0,\_SB_.QGP0})
    Name (_CCA, 0)

    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x00a84000, 0x00004000)
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {386}
        })
        Return (RBUF)
    }
}


//SPI4 - (CODEC-WCD936x / WCD9340 SPI)

Device (SPI4)
{
    Name (_HID, "HID_SPI")
    Alias(\_SB.PSUB, _SUB)
    Name (_UID, 4)
    Name (_DEP, Package(){\_SB_.PEP0,\_SB_.QGP0,\_SB_.MMU0})
    Name (_CCA, 0)

    Method (_CRS)
    {
        Name (RBUF, ResourceTemplate()
        {
            Memory32Fixed(ReadWrite, 0x0088c000, 0x00004000)
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive) {636}
        })
        Return (RBUF)
    }
}

//
//  PEP resources for buses
//
Scope(\_SB_.PEP0)
{
    Method(BSMD)
    {
        Return(BSRC)
    }
    
    Name(BSRC, Package()
    {
        // "\\_SB.UARD"
        Package()
        {
            "DEVICE", 
            0x2, //Debug device
            "\\_SB.UARD",

            Package()
            {
                "COMPONENT", 0,  // UART resources

                Package()
                {
                    "FSTATE", 0,  // enable UART clocks
                    Package(){"BUSARB", Package(){3, "ICBID_MASTER_QUP_1", "ICBID_SLAVE_EBI1", 153600000, 1666}},
                    Package(){"BUSARB", Package(){3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_QUP_1", 148000000, 50000000}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_m_ahb_clk",  1}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_s_ahb_clk",  1}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap1_s4_clk",  1}},
                },

                Package()
                {
                    "FSTATE", 1,  // disable UART clocks
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap1_s4_clk", 2}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_s_ahb_clk",   2}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_m_ahb_clk",  2}},
                    Package(){"BUSARB", Package(){3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_QUP_1", 0, 0}},
                    Package(){"BUSARB", Package(){3, "ICBID_MASTER_QUP_1", "ICBID_SLAVE_EBI1", 0, 0}},
                },

                Package()
                {
                    "PSTATE", 0,  // enable GPIOs
                    Package(){"TLMMGPIO", Package(){ 85, 0, 1, 0, 1, 0 }},
                    Package(){"TLMMGPIO", Package(){ 86, 0, 1, 0, 0, 0 }},
                },

                Package()
                {
                    "PSTATE", 1,  // disable GPIOs
                    Package(){"TLMMGPIO", Package(){ 85, 0, 1, 0, 1, 0 }},
                    Package(){"TLMMGPIO", Package(){ 86, 0, 1, 0, 0, 0 }},
                },

                Package(){"PSTATE",  2, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s4_clk", 3,  7372800, 4}}},
                Package(){"PSTATE",  3, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s4_clk", 3, 14745600, 4}}},
                Package(){"PSTATE",  4, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s4_clk", 3, 29491200, 4}}},
                Package(){"PSTATE",  5, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s4_clk", 3, 32000000, 4}}},
                Package(){"PSTATE",  6, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s4_clk", 3, 48000000, 4}}},
                Package(){"PSTATE",  7, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s4_clk", 3, 64000000, 4}}},
                Package(){"PSTATE",  8, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s4_clk", 3, 80000000, 4}}},
                Package(){"PSTATE",  9, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s4_clk", 3, 96000000, 4}}},
                Package(){"PSTATE", 10, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s4_clk", 3,102400000, 4}}},
                Package(){"PSTATE", 11, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s4_clk", 3,112000000, 4}}},
                Package(){"PSTATE", 12, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s4_clk", 3,117964800, 4}}},
                Package(){"PSTATE", 13, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s4_clk", 3,128000000, 4}}},
            },

            Package()
            {
                "COMPONENT", 1,  // DMA resources
                Package(){"FSTATE", 0},  // enable DMA clocks
                Package(){"FSTATE", 1},  // disable DMA clocks
            },
        },

        // "\\_SB.UR14"
        Package()
        {
            "DEVICE", "\\_SB.UR14",

            Package()
            {
                "COMPONENT", 0,  // UART resources

                Package()
                {
                    "FSTATE", 0,  // enable UART clocks
                    Package(){"BUSARB", Package(){3, "ICBID_MASTER_QUP_1", "ICBID_SLAVE_EBI1", 153600000, 1666}},
                    Package(){"BUSARB", Package(){3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_QUP_1", 148000000, 50000000}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_m_ahb_clk",  1}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_s_ahb_clk",  1}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap1_s5_clk",3, 7372800, 4}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap1_s5_clk",     1}},
                },

                Package()
                {
                    "FSTATE", 1,  // disable UART clocks
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap1_s5_clk",  2}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_s_ahb_clk",  2}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_m_ahb_clk",  2}},
                    Package(){"BUSARB", Package(){3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_QUP_1", 0, 0}},
                    Package(){"BUSARB", Package(){3, "ICBID_MASTER_QUP_1", "ICBID_SLAVE_EBI1", 0, 0}},
                },

                Package()
                {
                    "PSTATE", 0,  // enable GPIOs
                    Package(){"TLMMGPIO", Package(){ 83, 0, 1, 0, 1, 0 }},
                    Package(){"TLMMGPIO", Package(){ 84, 0, 1, 0, 0, 0 }},
                },

                Package()
                {
                    "PSTATE", 1,  // disable GPIOs
                    Package(){"TLMMGPIO", Package(){ 83, 0, 1, 0, 1, 0 }},
                    Package(){"TLMMGPIO", Package(){ 84, 0, 1, 0, 0, 0 }},
                },

                   Package(){"PSTATE",  2, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s5_clk", 3,  7372800, 4}}},
                   Package(){"PSTATE",  3, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s5_clk", 3, 14745600, 4}}},
                   Package(){"PSTATE",  4, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s5_clk", 3, 29491200, 4}}},
                   Package(){"PSTATE",  5, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s5_clk", 3, 32000000, 4}}},
                   Package(){"PSTATE",  6, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s5_clk", 3, 48000000, 4}}},
                   Package(){"PSTATE",  7, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s5_clk", 3, 64000000, 4}}},
                   Package(){"PSTATE",  8, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s5_clk", 3, 80000000, 4}}},
                   Package(){"PSTATE",  9, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s5_clk", 3, 96000000, 4}}},
                   Package(){"PSTATE", 10, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s5_clk", 3,102400000, 4}}},
                   Package(){"PSTATE", 11, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s5_clk", 3,112000000, 4}}},
                   Package(){"PSTATE", 12, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s5_clk", 3,117964800, 4}}},
                   Package(){"PSTATE", 13, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s5_clk", 3,128000000, 4}}},
            },    

            Package()
            {
                "COMPONENT", 1,  // DMA resources
                Package(){"FSTATE", 0},  // enable DMA clocks
                Package(){"FSTATE", 1},  // disable DMA clocks
            },
        },

        // "\\_SB.UR18"
        Package()
        {
            "DEVICE", "\\_SB.UR18",

            Package()
            {
                "COMPONENT", 0,  // UART resources

                Package()
                {
                    "FSTATE", 0,  // enable UART clocks
                    Package(){"BUSARB", Package(){3, "ICBID_MASTER_QUP_2", "ICBID_SLAVE_EBI1", 153600000, 1666}},
                    Package(){"BUSARB", Package(){3,"ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_QUP_2", 148000000, 50000000}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_2_m_ahb_clk",  1}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_2_s_ahb_clk",  1}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap2_s3_clk",  1}},
                },

                Package()
                {
                    "FSTATE", 1,  // disable UART clocks
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap2_s3_clk", 2}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_2_s_ahb_clk",   2}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_2_m_ahb_clk",  2}},
                    Package(){"BUSARB", Package(){3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_QUP_2", 0, 0}},
                    Package(){"BUSARB", Package(){3, "ICBID_MASTER_QUP_2", "ICBID_SLAVE_EBI1", 0, 0}},
                },

                Package()
                {
                    "PSTATE", 0,  // enable GPIOs
                    Package(){"TLMMGPIO", Package(){ 43, 0, 1, 0, 1, 0 }},
                    Package(){"TLMMGPIO", Package(){ 44, 0, 1, 0, 0, 0 }},
                    Package(){"TLMMGPIO", Package(){ 45, 0, 1, 0, 0, 0 }},
                    Package(){"TLMMGPIO", Package(){ 46, 0, 1, 0, 1, 0 }},
                },

                Package()
                {
                    "PSTATE", 1,  // disable GPIOs
                    Package(){"TLMMGPIO", Package(){ 43, 0, 1, 0, 1, 0 }},
                    Package(){"TLMMGPIO", Package(){ 44, 0, 1, 0, 0, 0 }},
                    Package(){"TLMMGPIO", Package(){ 45, 0, 1, 0, 0, 0 }},
                    Package(){"TLMMGPIO", Package(){ 46, 0, 1, 0, 1, 0 }},
                },

                Package(){"PSTATE",  2, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s3_clk", 3,  7372800, 4}}},
                Package(){"PSTATE",  3, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s3_clk", 3, 14745600, 4}}},
                Package(){"PSTATE",  4, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s3_clk", 3, 29491200, 4}}},
                Package(){"PSTATE",  5, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s3_clk", 3, 32000000, 4}}},
                Package(){"PSTATE",  6, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s3_clk", 3, 48000000, 4}}},
                Package(){"PSTATE",  7, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s3_clk", 3, 64000000, 4}}},
                Package(){"PSTATE",  8, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s3_clk", 3, 80000000, 4}}},
                Package(){"PSTATE",  9, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s3_clk", 3, 96000000, 4}}},
                Package(){"PSTATE", 10, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s3_clk", 3,102400000, 4}}},
                Package(){"PSTATE", 11, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s3_clk", 3,112000000, 4}}},
                Package(){"PSTATE", 12, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s3_clk", 3,117964800, 4}}},
                Package(){"PSTATE", 13, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s3_clk", 3,128000000, 4}}},
            },

            Package()
            {
                "COMPONENT", 1,  // DMA resources
                Package(){"FSTATE", 0},  // enable DMA clocks
                Package(){"FSTATE", 1},  // disable DMA clocks
            },
        },

        // "\\_SB.UR20"
        Package()
        {
            "DEVICE", "\\_SB.UR20",

            Package()
            {
                "COMPONENT", 0,  // UART resources

                Package()
                {
                    "FSTATE", 0,  // enable UART clocks
                    Package(){"BUSARB", Package(){3, "ICBID_MASTER_QUP_2", "ICBID_SLAVE_EBI1", 153600000, 1666}},
                    Package(){"BUSARB", Package(){3,"ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_QUP_2", 148000000, 50000000}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_2_m_ahb_clk",  1}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_2_s_ahb_clk",  1}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap2_s5_clk",3, 7372800, 4}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap2_s5_clk",     1}},
                },

                Package()
                {
                    "FSTATE", 1,  // disable UART clocks
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap2_s5_clk",  2}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_2_s_ahb_clk",  2}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_2_m_ahb_clk",  2}},
                    Package(){"BUSARB", Package(){3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_QUP_2", 0, 0}},
                    Package(){"BUSARB", Package(){3, "ICBID_MASTER_QUP_2", "ICBID_SLAVE_EBI1", 0, 0}},
                },

                Package()
                {
                    "PSTATE", 0,  // enable GPIOs
                    Package(){"TLMMGPIO", Package(){ 29, 0, 1, 0, 1, 0 }},
                    Package(){"TLMMGPIO", Package(){ 30, 0, 1, 0, 0, 0 }},  
                },

                Package()
                {
                    "PSTATE", 1,  // disable GPIOs
                    Package(){"TLMMGPIO", Package(){ 29, 0, 1, 0, 1, 0 }},
                    Package(){"TLMMGPIO", Package(){ 30, 0, 1, 0, 0, 0 }},
                },

                   Package(){"PSTATE",  2, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s5_clk", 3,  7372800, 4}}},
                   Package(){"PSTATE",  3, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s5_clk", 3, 14745600, 4}}},
                   Package(){"PSTATE",  4, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s5_clk", 3, 29491200, 4}}},
                   Package(){"PSTATE",  5, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s5_clk", 3, 32000000, 4}}},
                   Package(){"PSTATE",  6, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s5_clk", 3, 48000000, 4}}},
                   Package(){"PSTATE",  7, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s5_clk", 3, 64000000, 4}}},
                   Package(){"PSTATE",  8, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s5_clk", 3, 80000000, 4}}},
                   Package(){"PSTATE",  9, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s5_clk", 3, 96000000, 4}}},
                   Package(){"PSTATE", 10, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s5_clk", 3,102400000, 4}}},
                   Package(){"PSTATE", 11, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s5_clk", 3,112000000, 4}}},
                   Package(){"PSTATE", 12, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s5_clk", 3,117964800, 4}}},
                   Package(){"PSTATE", 13, Package(){"CLOCK", Package(){"gcc_qupv3_wrap2_s5_clk", 3,128000000, 4}}},
            },    

            Package()
            {
                "COMPONENT", 1,  // DMA resources
                Package(){"FSTATE", 0},  // enable DMA clocks
                Package(){"FSTATE", 1},  // disable DMA clocks
            },
        },

        // "\\_SB.I2C5"
        Package()
        {
            "DEVICE",
            "\\_SB.I2C5",
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
                Package(){"BUSARB", Package(){3,"ICBID_MASTER_QUP_0", "ICBID_SLAVE_EBI1", 153600000, 1666}},
                Package(){"BUSARB", Package(){3,"ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_QUP_0", 148000000, 50000000}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_m_ahb_clk",1}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_s_ahb_clk",1}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap0_s4_clk",8,19200000, 4}},

                // Configure SDA and then SCL
                package() {"TLMMGPIO", package() {51, 1, 1, 1, 3, 0}},
                package() {"TLMMGPIO", package() {52, 1, 1, 1, 3, 0}},
            },
            Package()
            {
                "DSTATE",
                0x1, // D1 state
            },
            Package()
            {
                "DSTATE",
                0x2, // D2 state
            },
            Package()
            {
                "DSTATE",
                0x3, // D3 state
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap0_s4_clk",2}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_s_ahb_clk",2}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_m_ahb_clk",2}},
                Package(){"BUSARB", Package(){3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_QUP_0", 0, 0}},
                Package(){"BUSARB", Package(){3, "ICBID_MASTER_QUP_0", "ICBID_SLAVE_EBI1", 0, 0 }},

                // Configure SCL and then SDA
                package() { "TLMMGPIO", package() {51, 0, 0, 0, 3, 0}},
                package() { "TLMMGPIO", package() {52, 0, 0, 0, 3, 0}},
            },
        },
        
        Package()
        {
            "DEVICE", "\\_SB.SPI4",

            Package()
            {
                "COMPONENT", 0,

                Package() {"FSTATE", 0},

                Package(){"DISCOVERABLE_PSTATE", "CLOCK", "gcc_qupv3_wrap0_s3_clk"},
            },
                
            Package()
            {
                "DSTATE", 0,  // enable clocks, enable GPIOs

                Package(){"BUSARB", Package(){3, "ICBID_MASTER_QUP_0", "ICBID_SLAVE_EBI1", 153600000, 1666}},
                Package(){"BUSARB", Package(){3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_QUP_0", 148000000, 50000000}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_m_ahb_clk",1}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_s_ahb_clk",1}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap0_s3_clk",1}},

                Package(){"TLMMGPIO", Package(){ 144, 1, 2, 0, 1, 0}},  // MISO
                Package(){"TLMMGPIO", Package(){ 145, 1, 2, 1, 1, 0}},  // MOSI
                Package(){"TLMMGPIO", Package(){ 146, 1, 2, 1, 1, 0}},  // CLK
                Package(){"TLMMGPIO", Package(){ 147, 1, 2, 1, 1, 0}},  // CS
            },

            Package() {"DSTATE", 1,},
            Package() {"DSTATE", 2,},

            Package()
            {
                "DSTATE", 3,  // disable clocks, disable GPIOs

                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap0_s3_clk",2}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_s_ahb_clk",2}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_m_ahb_clk",2}},
                Package(){"BUSARB", Package(){3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_QUP_0", 0, 0}},
                Package(){"BUSARB", Package(){3, "ICBID_MASTER_QUP_0", "ICBID_SLAVE_EBI1", 0, 0}},

                Package(){"TLMMGPIO", Package(){ 144, 0, 2, 0, 1, 0}},  // MOSI
                Package(){"TLMMGPIO", Package(){ 145, 0, 2, 0, 1, 0}},  // MISO
                Package(){"TLMMGPIO", Package(){ 146, 0, 2, 0, 1, 0}},  // CS
                Package(){"TLMMGPIO", Package(){ 147, 0, 2, 0, 1, 0}},  // CLK
            },
        },

        // "\\_SB.I2C8"
        Package()
        {
            "DEVICE",
            "\\_SB.I2C8",
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
                Package(){"BUSARB", Package(){3, "ICBID_MASTER_QUP_0", "ICBID_SLAVE_EBI1", 153600000, 1666}},
                Package(){"BUSARB", Package(){3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_QUP_0", 148000000, 50000000}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_m_ahb_clk",1}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_s_ahb_clk",1}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap0_s7_clk",8,19200000, 4}},

                // Configure SDA and then SCL
                package() {"TLMMGPIO", package() {98, 1, 1, 1, 3, 0}},
                package() {"TLMMGPIO", package() {99, 1, 1, 1, 3, 0}},
            },
            Package()
            {
                "DSTATE",
                0x1, // D1 state
            },
            Package()
            {
                "DSTATE",
                0x2, // D2 state
            },
            Package()
            {
                "DSTATE",
                0x3, // D3 state
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap0_s7_clk",2}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_s_ahb_clk",2}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_m_ahb_clk",2}},
                Package(){"BUSARB", Package(){3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_QUP_0", 0, 0}},
                Package(){"BUSARB", Package(){3, "ICBID_MASTER_QUP_0", "ICBID_SLAVE_EBI1", 0, 0 }},

                // Configure SCL and then SDA
                package() { "TLMMGPIO", package() {98, 0, 0, 0, 3, 0}},
                package() { "TLMMGPIO", package() {99, 0, 0, 0, 3, 0}},
            },
        },

        // "\\_SB.IC10"
        Package()
        {
            "DEVICE",
            "\\_SB.IC10",
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
                Package(){"BUSARB", Package(){3, "ICBID_MASTER_QUP_1", "ICBID_SLAVE_EBI1", 153600000, 1666}},
                Package(){"BUSARB", Package(){3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_QUP_1", 148000000, 50000000}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_m_ahb_clk",1}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_s_ahb_clk",1}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap1_s1_clk",8,19200000, 4}},

                // Configure SDA and then SCL
                package() {"TLMMGPIO", package() {39, 1, 1, 1, 3, 0}},
                package() {"TLMMGPIO", package() {40, 1, 1, 1, 3, 0}},
            },
            Package()
            {
                "DSTATE",
                0x1, // D1 state
            },
            Package()
            {
                "DSTATE",
                0x2, // D2 state
            },
            Package()
            {
                "DSTATE",
                0x3, // D3 state
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap1_s1_clk",2}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_s_ahb_clk",2}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_m_ahb_clk",2}},
                Package(){"BUSARB", Package(){3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_QUP_1", 0, 0}},
                Package(){"BUSARB", Package(){3, "ICBID_MASTER_QUP_1", "ICBID_SLAVE_EBI1", 0, 0 }},

                // Configure SCL and then SDA
                package() { "TLMMGPIO", package() {39, 0, 0, 0, 3, 0}},
                package() { "TLMMGPIO", package() {40, 0, 0, 0, 3, 0}},
            },
        },
    })
}

