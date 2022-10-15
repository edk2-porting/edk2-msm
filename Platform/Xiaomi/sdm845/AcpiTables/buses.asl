//
//  Please note that not all the SE engine instances (I2C/SPI/UART) from below asl file can be used directly by icluding in the client ACPI, 
//  The corresponding Access Control needs to be enabled from TZ side to get the SE/usecase working End 2 End.
//

//
// QUPV3_ID0_SE7 (attached to BT SOC)
//
Device (UAR7)
{
    Name (_HID, "QCOM0236")
    Alias(\_SB.PSUB, _SUB)
    Name (_UID, 7)
    Name (_DEP, Package() { \_SB_.PEP0 })
    Name (_CCA, 0)

    Method (_CRS)
    {
        Name (RBUF, ResourceTemplate()
        {
            Memory32Fixed(ReadWrite, 0x00898000, 0x0004000)
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive) {639}
            GpioInt(Edge, ActiveLow, Exclusive, PullDown, 0, "\\_SB.GIO0") {48}  // UART RX,
        })
        Return (RBUF)
    }

    Method (_STA)
    {  
      Return (0xF)
    }
}

//
// QUPV3_ID1_SE2  (UART Debug port)
//
 Device (UARD)
 {
     Name (_HID, "QCOM0236")
     Alias(\_SB.PSUB, _SUB)
     Name (_UID, 10)
     Name (_DEP, Package() { \_SB_.PEP0 })
     Name (_CCA, 0)

     Method (_CRS)
     {
         Name (RBUF, ResourceTemplate()
         {
             Memory32Fixed(ReadWrite, 0x00A84000, 0x00004000)
             Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive) {386}
             GpioInt(Edge, ActiveLow, Exclusive, PullDown, 0, "\\_SB.GIO0") {5}  // UART RX
         })
         Return (RBUF)
     }
 }

//
// I2C4 - "Core I2C Bus"
//
Device (I2C4)
{
    Name (_HID, "QCOM0220")
    Alias(\_SB.PSUB, _SUB)
    Name (_UID, 4)
    Name (_DEP, Package(){\_SB_.PEP0,\_SB_.QGP0})
    Name (_CCA, 0)

    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x0088C000, 0x00004000)
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {636}
        })
        Return (RBUF)
    }
}

//
// I2C5 - "Core I2C Bus"
//
Device (I2C6)
{
    Name (_HID, "QCOM0220")
    Alias(\_SB.PSUB, _SUB)
    Name (_UID, 6)
    Name (_DEP, Package(){\_SB_.PEP0,\_SB_.QGP0})
    Name (_CCA, 0)

    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x894000, 0x00004000)
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {638}
        })
        Return (RBUF)
    }
}

//
// I2C11 - "Core I2C Bus"
//
Device (IC11)
{
    Name (_HID, "QCOM0220")
    Alias(\_SB.PSUB, _SUB)
    Name (_UID, 11)
    Name (_DEP, Package(){\_SB_.PEP0,\_SB_.QGP0})
    Name (_CCA, 0)

    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x00A88000, 0x00004000)
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {387}
        })
        Return (RBUF)
    }
}


//
// I2C15 - "Core I2C Bus"
//
Device (IC15)
{
   Name (_HID, "QCOM0220")
   Alias(\_SB.PSUB, _SUB)
   Name (_UID, 15)
   Name (_DEP, Package(){\_SB_.PEP0,\_SB_.QGP1})
   Name (_CCA, 0)

   Method (_CRS, 0x0, NotSerialized)
   {
       Name (RBUF, ResourceTemplate ()
       {
           Memory32Fixed (ReadWrite, 0x00A98000, 0x00004000)
           Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {391}
       })
       Return (RBUF)
   }
}


//SPI9 - EPM

Device (SPI9)
{
    Name (_HID, "QCOM021E")
    Alias(\_SB.PSUB, _SUB)
    Name (_UID, 9)
    Name (_DEP, Package(){\_SB_.PEP0,\_SB_.QGP1})
    Name (_CCA, 0)

    Method (_CRS)
    {
        Name (RBUF, ResourceTemplate()
        {
            Memory32Fixed(ReadWrite, 0xA80000, 0x00004000)
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive) {385}
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
    
    Method(PQMD)
    {
        If (LLess(\_SB.SIDV,0x00020000))
        {
            Return(DFS1)
        }
        Else
        {
            Return(DFS2)
        }
    }
    
    Name(BSRC, Package()
    {
        // "\\_SB.UAR7"
        Package()
        {
            "DEVICE", "\\_SB.UAR7",

            Package()
            {
                "COMPONENT", 0,  // UART resources

                Package()
                {
                    "FSTATE", 0,  // enable UART clocks
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_m_ahb_clk",  1}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_s_ahb_clk",  1}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap0_s6_clk",  1}},
                    Package(){"BUSARB", Package(){3, "ICBID_MASTER_BLSP_1", "ICBID_SLAVE_EBI1", 1400000000,1666}},
                    Package(){"BUSARB", Package(){3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_BLSP_1", 148000000, 50000000}},
                },

                Package()
                {
                    "FSTATE", 1,  // disable UART clocks
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_m_ahb_clk",  2}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_s_ahb_clk",   2}},
                    Package(){"CLOCK",  Package(){"gcc_qupv3_wrap0_s6_clk", 2}},
                    Package(){"BUSARB", Package(){3, "ICBID_MASTER_BLSP_1", "ICBID_SLAVE_EBI1", 0, 0}},
                    Package(){"BUSARB", Package(){3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_BLSP_1", 0, 0}},
                },

                Package()
                {
                    "PSTATE", 0,  // enable GPIOs
                    Package(){"TLMMGPIO", Package(){ 45, 0, 1, 0, 1, 0 }},
                    Package(){"TLMMGPIO", Package(){ 46, 0, 1, 0, 0, 0 }},
                    Package(){"TLMMGPIO", Package(){ 47, 0, 1, 0, 0, 0 }},
                    Package(){"TLMMGPIO", Package(){ 48, 0, 1, 0, 1, 0 }},
                },

                Package()
                {
                    "PSTATE", 1,  // disable GPIOs
                    Package(){"TLMMGPIO", Package(){ 45, 0, 1, 0, 1, 0 }},
                    Package(){"TLMMGPIO", Package(){ 46, 0, 1, 0, 0, 0 }},
                    Package(){"TLMMGPIO", Package(){ 47, 0, 1, 0, 0, 0 }},
                    Package(){"TLMMGPIO", Package(){ 48, 0, 1, 0, 1, 0 }},
                },

                Package(){"PSTATE",  2, Package(){"CLOCK", Package(){"gcc_qupv3_wrap0_s6_clk", 3,  7372800, 4}}},
                Package(){"PSTATE",  3, Package(){"CLOCK", Package(){"gcc_qupv3_wrap0_s6_clk", 3, 14745600, 4}}},
                Package(){"PSTATE",  4, Package(){"CLOCK", Package(){"gcc_qupv3_wrap0_s6_clk", 3, 29491200, 4}}},
                Package(){"PSTATE",  5, Package(){"CLOCK", Package(){"gcc_qupv3_wrap0_s6_clk", 3, 32000000, 4}}},
                Package(){"PSTATE",  6, Package(){"CLOCK", Package(){"gcc_qupv3_wrap0_s6_clk", 3, 48000000, 4}}},
                Package(){"PSTATE",  7, Package(){"CLOCK", Package(){"gcc_qupv3_wrap0_s6_clk", 3, 64000000, 4}}},
                Package(){"PSTATE",  8, Package(){"CLOCK", Package(){"gcc_qupv3_wrap0_s6_clk", 3, 80000000, 4}}},
                Package(){"PSTATE",  9, Package(){"CLOCK", Package(){"gcc_qupv3_wrap0_s6_clk", 3, 96000000, 4}}},
                Package(){"PSTATE", 10, Package(){"CLOCK", Package(){"gcc_qupv3_wrap0_s6_clk", 3,102400000, 4}}},
                Package(){"PSTATE", 11, Package(){"CLOCK", Package(){"gcc_qupv3_wrap0_s6_clk", 3,112000000, 4}}},
                Package(){"PSTATE", 12, Package(){"CLOCK", Package(){"gcc_qupv3_wrap0_s6_clk", 3,117964800, 4}}},
                Package(){"PSTATE", 13, Package(){"CLOCK", Package(){"gcc_qupv3_wrap0_s6_clk", 3,128000000, 4}}},
            },

            Package()
            {
                "COMPONENT", 1,  // DMA resources
                Package(){"FSTATE", 0},  // enable DMA clocks
                Package(){"FSTATE", 1},  // disable DMA clocks
            },
        },

        // "\\_SB.UARD"
         Package()
         {
             "DEVICE", 0x2, //Debug device
			 "\\_SB.UARD",

             Package()
             {
                 "COMPONENT", 0,  // UART resources

                 Package()
                 {
                     "FSTATE", 0,  // enable UART clocks
                     Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_m_ahb_clk",  1}},
                     Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_s_ahb_clk",  1}},
                     Package(){"CLOCK",  Package(){"gcc_qupv3_wrap1_s1_clk",3, 7372800, 4}},
                     Package(){"CLOCK",  Package(){"gcc_qupv3_wrap1_s1_clk",     1}},

                     Package(){"BUSARB", Package(){3, "ICBID_MASTER_BLSP_2", "ICBID_SLAVE_EBI1", 1400000000,1666}},
                     Package(){"BUSARB", Package(){3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_BLSP_2", 148000000, 50000000}},
                 },

                 Package()
                 {
                     "FSTATE", 1,  // disable UART clocks
                     Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_m_ahb_clk",  2}},
                     Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_s_ahb_clk",  2}},
                     Package(){"CLOCK",  Package(){"gcc_qupv3_wrap1_s1_clk",  2}},

                     Package(){"BUSARB", Package(){3, "ICBID_MASTER_BLSP_2", "ICBID_SLAVE_EBI1", 0, 0}},
                     Package(){"BUSARB", Package(){3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_BLSP_2", 0, 0}},
                 },

                 Package()
                 {
                     "PSTATE", 0,  // enable GPIOs
                     Package(){"TLMMGPIO", Package(){ 5, 0, 1, 0, 1, 0 }},
                     Package(){"TLMMGPIO", Package(){ 4, 0, 1, 0, 0, 0 }},
                 },

                 Package()
                 {
                     "PSTATE", 1,  // disable GPIOs
                     Package(){"TLMMGPIO", Package(){ 5, 0, 1, 0, 1, 0 }},
                     Package(){"TLMMGPIO", Package(){ 4, 0, 1, 0, 0, 0 }},
                 },

                   Package(){"PSTATE",  2, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s1_clk", 3,  7372800, 4}}},
                   Package(){"PSTATE",  3, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s1_clk", 3, 14745600, 4}}},
                    Package(){"PSTATE",  4, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s1_clk", 3, 29491200, 4}}},
                    Package(){"PSTATE",  5, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s1_clk", 3, 32000000, 4}}},
                    Package(){"PSTATE",  6, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s1_clk", 3, 48000000, 4}}},
                    Package(){"PSTATE",  7, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s1_clk", 3, 64000000, 4}}},
                    Package(){"PSTATE",  8, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s1_clk", 3, 80000000, 4}}},
                    Package(){"PSTATE",  9, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s1_clk", 3, 96000000, 4}}},
                    Package(){"PSTATE", 10, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s1_clk", 3,102400000, 4}}},
                   Package(){"PSTATE", 11, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s1_clk", 3,112000000, 4}}},
                    Package(){"PSTATE", 12, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s1_clk", 3,117964800, 4}}},
                    Package(){"PSTATE", 13, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s1_clk", 3,128000000, 4}}},
             },    

             Package()
             {
                 "COMPONENT", 1,  // DMA resources
                 Package(){"FSTATE", 0},  // enable DMA clocks
                Package(){"FSTATE", 1},  // disable DMA clocks
             },
        },

        // "\\_SB.I2C4"
        Package()
        {
            "DEVICE",
            "\\_SB.I2C4",
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
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_m_ahb_clk",1}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_s_ahb_clk",1}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap0_s3_clk",8,19200000, 4}},

                Package(){"BUSARB", Package(){3, "ICBID_MASTER_BLSP_1", "ICBID_SLAVE_EBI1", 1400000000,1666}},
                Package(){"BUSARB", Package(){3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_BLSP_1", 148000000, 50000000}},

                // Configure SDA and then SCL
                package() {"TLMMGPIO", package() {41, 1, 1, 1, 3, 0}},
                package() {"TLMMGPIO", package() {42, 1, 1, 1, 3, 0}},
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
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_m_ahb_clk",2}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_s_ahb_clk",2}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap0_s3_clk",2}},

                Package() {"BUSARB", Package() {3, "ICBID_MASTER_BLSP_1", "ICBID_SLAVE_EBI1", 0, 0 }},
                Package() {"BUSARB", Package() {3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_BLSP_1", 0, 0 }},

                // Configure SCL and then SDA
                package() { "TLMMGPIO", package() {41, 0, 0, 0, 3, 0}},
                package() { "TLMMGPIO", package() {42, 0, 0, 0, 3, 0}},
            },
        },

        // "\\_SB.I2C6"
        Package()
        {
            "DEVICE",
            "\\_SB.I2C6",
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
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_m_ahb_clk",1}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_s_ahb_clk",1}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap0_s5_clk",8,19200000, 4}},

                Package(){"BUSARB", Package(){3, "ICBID_MASTER_BLSP_1", "ICBID_SLAVE_EBI1", 1400000000,1666}},
                Package(){"BUSARB", Package(){3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_BLSP_1", 148000000, 50000000}},

                // Configure SDA and then SCL
                package() {"TLMMGPIO", package() {85, 1, 1, 1, 3, 0}},
                package() {"TLMMGPIO", package() {86, 1, 1, 1, 3, 0}},
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
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_m_ahb_clk",2}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_0_s_ahb_clk",2}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap0_s5_clk",2}},

                Package() {"BUSARB", Package() {3, "ICBID_MASTER_BLSP_1", "ICBID_SLAVE_EBI1", 0, 0 }},
                Package() {"BUSARB", Package() {3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_BLSP_1", 0, 0 }},

                // Configure SCL and then SDA
                package() { "TLMMGPIO", package() {85, 0, 0, 0, 3, 0}},
                package() { "TLMMGPIO", package() {86, 0, 0, 0, 3, 0}},
            },
        },

        // "\\_SB.IC11"
        Package()
        {
            "DEVICE",
            "\\_SB.IC11",
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
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_m_ahb_clk",1}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_s_ahb_clk",1}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap1_s2_clk",8,19200000, 4}},

                Package() {"BUSARB", Package() {3, "ICBID_MASTER_BLSP_2", "ICBID_SLAVE_EBI1", 1400000000,1666}},
                Package() {"BUSARB", Package() {3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_BLSP_2", 148000000,50000000}},

                // Configure SDA and then SCL
                package() {"TLMMGPIO", package() {55, 1, 1, 1, 3, 0}},
                package() {"TLMMGPIO", package() {56, 1, 1, 1, 3, 0}},
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
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_m_ahb_clk",2}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_s_ahb_clk",2}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap1_s2_clk",2}},

                Package() {"BUSARB", Package() {3, "ICBID_MASTER_BLSP_2", "ICBID_SLAVE_EBI1", 0, 0 }},
                Package() {"BUSARB", Package() {3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_BLSP_2", 0, 0 }},

                // Configure SCL and then SDA
                package() { "TLMMGPIO", package() {55, 0, 0, 0, 3, 0}},
                package() { "TLMMGPIO", package() {56, 0, 0, 0, 3, 0}},
            },
        },

        // "\\_SB.IC15"
        Package()
        {
            "DEVICE",
            "\\_SB.IC15",
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
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_m_ahb_clk",1}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_s_ahb_clk",1}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap1_s6_clk",8,19200000, 4}},
		        Package() {"BUSARB", Package() {3, "ICBID_MASTER_BLSP_2", "ICBID_SLAVE_EBI1", 1400000000,1666 }},
                Package() {"BUSARB", Package() {3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_BLSP_2", 148000000,50000000 }},

                // Configure SDA and then SCL
                package() {"TLMMGPIO", package() {33, 1, 2, 1, 3, 0}},
                package() {"TLMMGPIO", package() {34, 1, 2, 1, 3, 0}},
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
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_m_ahb_clk",2}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_s_ahb_clk",2}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap1_s6_clk",2}},
		        Package() {"BUSARB", Package() {3, "ICBID_MASTER_BLSP_2", "ICBID_SLAVE_EBI1", 0, 0 }},
                Package() {"BUSARB", Package() {3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_BLSP_2", 0, 0 }},

                // Configure SCL and then SDA
                package() { "TLMMGPIO", package() {33, 0, 0, 0, 3, 0}},
                package() { "TLMMGPIO", package() {34, 0, 0, 0, 3, 0}},
            },
        },
    })
    
    Name(DFS1, Package()
    {    
        Package()
        {
            "DEVICE", "\\_SB.SPI9",

            Package()
            {
                "COMPONENT", 0,

                Package() {"FSTATE", 0},

                Package(){"PSTATE", 0, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s0_clk", 3, 19200000,  3}}},
                Package(){"PSTATE", 1, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s0_clk", 3, 32000000,  3}}},
                Package(){"PSTATE", 2, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s0_clk", 3, 38400000,  3}}},
                Package(){"PSTATE", 3, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s0_clk", 3, 48000000,  3}}},
                Package(){"PSTATE", 4, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s0_clk", 3, 64000000,  3}}},
                Package(){"PSTATE", 5, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s0_clk", 3, 96000000,  3}}},
                Package(){"PSTATE", 6, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s0_clk", 3, 100000000, 3}}},
            },
                
            Package()
            {
                "DSTATE", 0,  // enable clocks, enable GPIOs

                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_m_ahb_clk",1}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_s_ahb_clk",1}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap1_s0_clk",1}},

                Package() {"BUSARB", Package() {3, "ICBID_MASTER_BLSP_2", "ICBID_SLAVE_EBI1", 1400000000,1666}},
                Package() {"BUSARB", Package() {3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_BLSP_2", 148000000,50000000}},

                Package(){"TLMMGPIO", Package(){ 65, 1, 2, 0, 1, 0}},  // MISO
                Package(){"TLMMGPIO", Package(){ 66, 1, 2, 1, 1, 0}},  // MOSI
                Package(){"TLMMGPIO", Package(){ 67, 1, 2, 1, 1, 0}},  // CLK
                Package(){"TLMMGPIO", Package(){ 68, 1, 2, 1, 1, 0}},  // CS
            },

            Package() {"DSTATE", 1,},
            Package() {"DSTATE", 2,},

            Package()
            {
                "DSTATE", 3,  // disable clocks, disable GPIOs

                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_m_ahb_clk",2}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_s_ahb_clk",2}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap1_s0_clk",2}},

                Package(){"BUSARB", Package(){3, "ICBID_MASTER_BLSP_2", "ICBID_SLAVE_EBI1", 0, 0}},
		Package(){"BUSARB", Package(){3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_BLSP_2", 0, 0}},

                Package(){"TLMMGPIO", Package(){ 65, 0, 2, 0, 1, 0}},  // MOSI
                Package(){"TLMMGPIO", Package(){ 66, 0, 2, 0, 1, 0}},  // MISO
                Package(){"TLMMGPIO", Package(){ 67, 0, 2, 0, 1, 0}},  // CS
                Package(){"TLMMGPIO", Package(){ 68, 0, 2, 0, 1, 0}},  // CLK
            },
        },
    })
    
    Name(DFS2, Package()
    {
        Package()
        {
            "DEVICE", "\\_SB.SPI9",

            Package()
            {
                "COMPONENT", 0,

                Package() {"FSTATE", 0},
		
                Package(){"PSTATE", 0, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s0_clk", 3, 19200000,  3}}},
                Package(){"PSTATE", 1, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s0_clk", 3, 32000000,  3}}},
                Package(){"PSTATE", 2, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s0_clk", 3, 48000000,  3}}},
                Package(){"PSTATE", 3, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s0_clk", 3, 64000000,  3}}},
                Package(){"PSTATE", 4, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s0_clk", 3, 96000000,  3}}},
                Package(){"PSTATE", 5, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s0_clk", 3, 100000000, 3}}},
                Package(){"PSTATE", 6, Package(){"CLOCK", Package(){"gcc_qupv3_wrap1_s0_clk", 3, 120000000, 3}}},
            },

            Package()
            {
                "DSTATE", 0,  // enable clocks, enable GPIOs

                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_m_ahb_clk",1}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_s_ahb_clk",1}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap1_s0_clk",1}},

                Package() {"BUSARB", Package() {3, "ICBID_MASTER_BLSP_2", "ICBID_SLAVE_EBI1", 1400000000,1666}},
                Package() {"BUSARB", Package() {3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_BLSP_2", 148000000,50000000}},


                Package(){"TLMMGPIO", Package(){ 65, 1, 2, 0, 1, 0}},  // MISO
                Package(){"TLMMGPIO", Package(){ 66, 1, 2, 1, 1, 0}},  // MOSI
                Package(){"TLMMGPIO", Package(){ 67, 1, 2, 1, 1, 0}},  // CLK
                Package(){"TLMMGPIO", Package(){ 68, 1, 2, 1, 1, 0}},  // CS
            },

            Package() {"DSTATE", 1,},
            Package() {"DSTATE", 2,},

            Package()
            {
                "DSTATE", 3,  // disable clocks, disable GPIOs

                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_m_ahb_clk",2}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap_1_s_ahb_clk",2}},
                Package(){"CLOCK",  Package(){"gcc_qupv3_wrap1_s0_clk",2}},

                Package(){"BUSARB", Package(){3, "ICBID_MASTER_BLSP_2", "ICBID_SLAVE_EBI1", 0, 0}},
		Package(){"BUSARB", Package(){3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_BLSP_2", 0, 0}},

                Package(){"TLMMGPIO", Package(){ 65, 0, 2, 0, 1, 0}},  // MOSI
                Package(){"TLMMGPIO", Package(){ 66, 0, 2, 0, 1, 0}},  // MISO
                Package(){"TLMMGPIO", Package(){ 67, 0, 2, 0, 1, 0}},  // CS
                Package(){"TLMMGPIO", Package(){ 68, 0, 2, 0, 1, 0}},  // CLK
            },
        },
    })
}
