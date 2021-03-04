//===========================================================================
//                           <Qdss.asl>
// DESCRIPTION
//   This file contans the resources needed by qdss driver.
//
//
//===========================================================================

//
// QDSS device
//
Device (QDSS)
{
    Name (_DEP, Package () { \_SB_.PEP0 })

    Name (_HID, "HID_QDSS")
	Alias(\_SB.PSUB, _SUB)
    Name (_UID, 0)

    Method (_CRS, 0x0, NotSerialized)
    {
        Return
        (
            ResourceTemplate ()
            {
                // Software uses QDSSETRIRQCTRL to set a byte count threshold for a counter that counts 
                // the number of bytes of trace data the ETR has moved on its AXI interface. When the 
                // threshold is reached an IRQ is fired.
                // reference : http://ipcatalog.qualcomm.com/irqs/chip/53/map/438
                //qdss_etrbytecnt_irq = SYS_apssQgicSPI[270] = 302
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {302}   // The ETR byte counter interrupt
                // reference : http://ipcatalog.qualcomm.com/memmap/chip/99/map/367#block=866956
                Memory32Fixed (ReadWrite, 0x06000000, 0x00049000)                       // The QDSS_QDSS address space 
                // reference : http://ipcatalog.qualcomm.com/memmap/chip/99/map/367
                Memory32Fixed (ReadWrite, 0x16000000, 0x1000000)                       // The QDSS_STM address 0x1000000 = 16777216d  (~16MB)
                // Following memory resource is required starting from 8994. In such case, QDSS driver expects
                // OFF2 control method which defines register block offsets within this address space.
                //reference : http://ipcatalog.qualcomm.com/swi/module/1385017             
                Memory32Fixed (ReadWrite, 0x07000000, 0x00901000)                      // The QDSS_CPU address space. 
	        Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {67}   // L3 fault interrupt
            }
        )
    }

    // The QBAL method returns QDSS Base Address Length as needed for configuring all QDSS registers.
    // Reason for returning length through seperate method is BAM driver address range conflicts with QDSS adress range.
    // Due to this OS does not enumerate QDSS driver if whole length defined in CRS method.
    // QDSS cfg is of total 32MB address space. 0x06000000 - 0x06C2B000 is used to configure QDSS registers. See http://ipcatalog.qualcomm.com/memmap/chip/53/map/307#block=871326
    Method (QBAL)
    {
        Return (0x0C2B000)
    }
    Method (XULC)
    {
        Return (0x2)
    }

    Method (XUPC)
    {
        Return (0x8)
    }

    Method (X3LN)
    {
        Return (0x1)
    }
    METHOD (CPID)
    {
        Return (\_SB_.SOID)
    }

    // The CHPD method returns a 32-bit value that allows us to tweak things on
    // a chip-by-chip basis. Goal is not to use this, but it's handy during
    // bring up.

    Method (CHPD)
    {
        Return (0x00000000)
    }
	
    // The PSIL method returns a boolean value to indicate platform is a Pre-silicon or real SOC.
    // Value 1 if we are using Pre-silicon platform for validation.
    // Value 0 if we are using real SOC platform.
    // If this method is not present, driver assumes the platform as a real SOC (default value 0).
    Method (PSIL)
    {
        Return (0)
    }

    // The PWRV method returns the version of the power model that is in use by
    // this chip. If 0 (or this method is missing), the QDSS driver will use
    // the default F-state-only power model. If 1, the QDSS driver will use the
    // F-state-and-P-state model.

    Method (PWRV)
    {
        Return (0x1)
    }

    // The ETMV method returns value indicating how to program the ETM registers that is in use by
    // this SoC. Following version numbers are in sync with QDSS_ETM_VER_ENUM as defined in
    // halqdss_ptm.h .
    // If 0 (or this method is missing), the QDSS driver will use the default way of 
    // writing/reading ETM registers, eg. co-processor commands. This version works for cortex (8974).
    // If 1, the QDSS driver will use the memory map model. This version works for A7 (8x26).
    // When co-processor command is used, PEP driver needs to save/restore the register values
    // across power collapse; With memory map model, PEP driver needs to keep QDSS clocks on 
    // during power collapse (This is not ideal, and it is being discussed with ARM). 
    // If 4, the Apps CPU supports ETMv4.

    Method (ETMV)
    {
        Return (0x4)
    }

    // The OFFS method returns the offset and size of each register block
    // within the QDSS_QDSS address space. This also returns the type of register block
    // the block types can be 0 - nonCTI; 1 - CTI
    // Block name as defined here has to exist in QdssDeviceOffsets.h; in future we will
    // do this differently, but for now, this is an implicit contract. 
    // Block Type: 0 -NORMAL_BLOCK,
    //             1 -CTI_BLOCK,
    //             2 -ETM_BLOCK,
    //             3 -FUNNEL_BLOCK,
    // Address Base: Since now some projects' qdss has some base address spaces for block 
    // pls refer :Method _CRS and put the block's base address space into "Address Base" area.
    // references: 
    // http://ipcatalog.qualcomm.com/memmap/chip/99/map/367#block=993378
    // http://sew-napali.runq-sd-a-sm.qualcomm.com/prj/qct/chips/napali/sandiego/docs/SWI/HTML/latest_2.0/napali.index.html
    
    Method (OFFS)
    {
        Return
        (
            Package ()
            {
                //         { "Block Name",  Offset,     Size,       Block Type, Address Base },
                Package () { "CSR",         0x00001000, 0x00001000, 0x0,        0x06000000}, //QDSS Coresight CSR Slave
                Package () { "STM",         0x00002000, 0x00001000, 0x0,        0x06000000},
                Package () { "QATB_FUNNEL", 0x00005000, 0x00001000, 0x3,        0x06000000}, // QDSS QATB Funnel
                Package () { "TGU",         0x0000E000, 0x00001000, 0x0,        0x06000000},
                Package () { "CTI0",        0x00010000, 0x00001000, 0x1,        0x06000000}, 
                Package () { "CTI1",        0x00011000, 0x00001000, 0x1,        0x06000000},
                Package () { "CTI2",        0x00012000, 0x00001000, 0x1,        0x06000000},
                Package () { "CTI3",        0x00013000, 0x00001000, 0x1,        0x06000000},
                Package () { "CTI4",        0x00014000, 0x00001000, 0x1,        0x06000000},
                Package () { "CTI5",        0x00015000, 0x00001000, 0x1,        0x06000000},
                Package () { "CTI6",        0x00016000, 0x00001000, 0x1,        0x06000000}, 
                Package () { "CTI7",        0x00017000, 0x00001000, 0x1,        0x06000000},
                Package () { "CTI8",        0x00018000, 0x00001000, 0x1,        0x06000000},
                Package () { "CTI9",        0x00019000, 0x00001000, 0x1,        0x06000000},
                Package () { "CTI10",       0x0001A000, 0x00001000, 0x1,        0x06000000},
                Package () { "CTI11",       0x0001B000, 0x00001000, 0x1,        0x06000000},
                Package () { "CTI12",       0x0001C000, 0x00001000, 0x1,        0x06000000},
                Package () { "CTI13",       0x0001D000, 0x00001000, 0x1,        0x06000000},
                Package () { "CTI14",       0x0001E000, 0x00001000, 0x1,        0x06000000},                        
                Package () { "CTI15",       0x0001F000, 0x00001000, 0x1,        0x06000000},
                Package () { "TPIU",        0x00040000, 0x00001000, 0x0,        0x06000000},
                Package () { "IN_FUN0",        0x00041000, 0x00001000, 0x3,        0x06000000}, // QDSS FUN_IN0
                Package () { "IN_FUN1",        0x00042000, 0x00001000, 0x3,        0x06000000}, // QDSS FUN_IN1
                Package () { "IN_FUN2",        0x00043000, 0x00001000, 0x3,        0x06000000}, // QDSS FUN_IN2
                Package () { "MERG_FUN",       0x00045000, 0x00001000, 0x3,        0x06000000}, // QDSS Merg_Fun
                Package () { "ETR",         0x00048000, 0x00001000, 0x0,        0x06000000},
                Package () { "MSS_QATBFUN",    0x00832000, 0x00001000, 0x3,        0x06000000}, // Modem DL Funnel
                Package () { "LPASS_QATBFUN",  0x00845000, 0x00001000, 0x3,        0x06000000}, // LPASS DL Funnel
                Package () { "TURING_QATBFUN", 0x00861000, 0x00001000, 0x3,        0x06000000}, // Turing DL Funnel
                Package () { "SPSS_QATBFUN",   0x00883000, 0x00001000, 0x3,        0x06000000}, // Secure Processor DL Funnel
                Package () { "GPU_FUN",        0x00943000, 0x00001000, 0x3,        0x06000000},
                Package () { "GPU_QATBFUN",    0x00944000, 0x00001000, 0x3,        0x06000000}, // GPU DL Funnel
                Package () { "WCSS_FUN",       0x0099E000, 0x00001000, 0x3,        0x06000000}, // WCSS Funnel
                Package () { "DLST_QATBFUN",   0x009C1000, 0x00001000, 0x3,        0x06000000}, // DL South Funnel
                Package () { "DL0_QATBFUNNEL", 0x009E2000, 0x00001000, 0x3,        0x06000000}, // DDR_0 DL Funnel
                Package () { "DL1_QATBFUNNEL", 0x009E7000, 0x00001000, 0x3,        0x06000000}, // DDR_1 DL Funnel
                Package () { "SWAO_CTI0",      0x00B04000, 0x00001000, 0x1,        0x06000000},
                Package () { "SWAO_CTI1",      0x00B05000, 0x00001000, 0x1,        0x06000000},
                Package () { "SWAO_CTI2",      0x00B06000, 0x00001000, 0x1,        0x06000000},
                Package () { "SWAO_CTI3",      0x00B07000, 0x00001000, 0x1,        0x06000000},
                Package () { "SWAO_FUN0",      0x00B08000, 0x00001000, 0x3,        0x06000000}, // AOSS Funnel
                Package () { "SWAO_CSR",       0x00B0E000, 0x00001000, 0x0,        0x06000000},
                Package () { "SSC_FUN0",       0x00B14000, 0x00001000, 0x3,        0x06000000}, // SSC Funnel
                Package () { "DLMM_QATBFUN",   0x00C0B000, 0x00001000, 0x3,        0x06000000}, // DL MM Funnel

                // reference: http://ipcatalog.qualcomm.com/swi/module/1279554
                //  ETM_0 to ETM_3 blocks QDSS_APSS_APSS_SILVER_APB_APSS_SILVER_APB_A53_APB.
                //  ETM_4 to ETM_7 blocks QDSS_APSS_APSS_GOLD_APB_APSS_GOLD_APB_A53_APB.
                Package () { "ETM_0",          0x00440000, 0x00001000, 0x2,        0x07000000}, // 0x07440000 QDSS_APSS_APSS_SILVER_APB_APSS_SILVER_APB_A53_APB
                Package () { "ETM_1",          0x00540000, 0x00001000, 0x2,        0x07000000}, // 0x07540000 QDSS_APSS_APSS_SILVER_APB_APSS_SILVER_APB_A53_APB
                Package () { "ETM_2",          0x00640000, 0x00001000, 0x2,        0x07000000}, // 0x07640000 QDSS_APSS_APSS_SILVER_APB_APSS_SILVER_APB_A53_APB
                Package () { "ETM_3",          0x00740000, 0x00001000, 0x2,        0x07000000}, // 0x07740000 QDSS_APSS_APSS_SILVER_APB_APSS_SILVER_APB_A53_APB                  
                Package () { "ETM_4",          0x00040000, 0x00001000, 0x2,        0x07000000}, // 0x07040000 QDSS_APSS_APSS_GOLD_APB_APSS_GOLD_APB_A53_APB
                Package () { "ETM_5",          0x00140000, 0x00001000, 0x2,        0x07000000}, // 0x07140000 QDSS_APSS_APSS_GOLD_APB_APSS_GOLD_APB_A53_APB
                Package () { "ETM_6",          0x00240000, 0x00001000, 0x2,        0x07000000}, // 0x07240000 QDSS_APSS_APSS_GOLD_APB_APSS_GOLD_APB_A53_APB
                Package () { "ETM_7",          0x00340000, 0x00001000, 0x2,        0x07000000}, // 0x07340000 QDSS_APSS_APSS_GOLD_APB_APSS_GOLD_APB_A53_APB

                Package () { "CPU_FUN0",       0x00800000, 0x00001000, 0x3,        0x07000000}, // APSS CPU trace funnel, QDSS_APSS_FUN_ATB_FUN_ATB_CXATBFUNNEL_128W8SP 
                Package () { "CPU_FUN1",       0x00810000, 0x00001000, 0x3,        0x07000000}, // APSS Top Funnel, QDSS_APSS_FUN_FUN_CXATBFUNNEL_128W8SP
                
                Package () { "APSS_CTI0",      0x008E0000, 0x00001000, 0x1,        0x07000000},
                Package () { "APSS_CTI1",      0x008F0000, 0x00001000, 0x1,        0x07000000},
                Package () { "APSS_CTI2",      0x00900000, 0x00001000, 0x1,        0x07000000},   
            }
        )
    }

    // The S2FP (Source To Funnel Port) method maps a source to the funnel and port.
    // references: 
    // https://sharepoint.qualcomm.com/qct/DHW/Projects/Napali/Documents/Design/debug/SOC%20DEBUG/Napali_ATB_Structure.xlsx
    // https://sharepoint.qualcomm.com/qct/DHW/Projects/Napali/Documents/Design/debug/SOC%20DEBUG/Napali_ATB_APB_TS_Infrastructure.vsd
    Method (S2FP)
    {
        Return
        (
            Package ()
            {
                Package ()
                {
                    "STM",
                    Package () { "MERG_FUN",    0 },
                    Package () { "IN_FUN0",     7 },
                },
                Package ()
                {
                    "ETM",
                    Package () { "MERG_FUN",    2 },
                    Package () { "IN_FUN2",     5 },
                    Package () { "CPU_FUN1",    0 }, // top funnel   APSS PWR CPU0 ATB
                    Package () { "CPU_FUN0",    0 }, // trace funnel APSS PWR CPU0 ATB 
                    Package () { "CPU_FUN0",    1 }, // trace funnel APSS PWR CPU1 ATB
                    Package () { "CPU_FUN0",    2 }, // trace funnel APSS PWR CPU2 ATB
                    Package () { "CPU_FUN0",    3 }, // trace funnel APSS PWR CPU3 ATB
                    Package () { "CPU_FUN0",    4 }, // trace funnel APSS PERF CPU4 ATB
                    Package () { "CPU_FUN0",    5 }, // trace funnel APSS PERF CPU5 ATB
                    Package () { "CPU_FUN0",    6 }, // trace funnel APSS PERF CPU6 ATB
                    Package () { "CPU_FUN0",    7 }, // trace funnel APSS PERF CPU7 ATB
                    Package () { "CPU_FUN1",    1 }, // top funnel APSS GNoC (CCI) ATB
                },
                Package ()
                {
                    "BUS",                    
                    Package () { "MERG_FUN",       0 },
                    Package () { "IN_FUN0",        6 },
                    Package () { "QATB_FUNNEL",    2 },
                    Package () { "GPU_QATBFUN",    1 }, // GPU DL VBIF ATB
                    Package () { "QATB_FUNNEL",    3 },
                    Package () { "DLMM_QATBFUN",   2 }, // MMNoC ATB
                    Package () { "DLMM_QATBFUN",   3 }, // Venus ATB
                    Package () { "DLMM_QATBFUN",   4 }, // MDSS MDP ATB
                    Package () { "DLMM_QATBFUN",   5 }, // MDSS NRT ATB
                    Package () { "DLMM_QATBFUN",   6 }, // TITAN ATB
                    Package () { "DLMM_QATBFUN",   7 }, // Cam NoC ATB

                    Package () { "QATB_FUNNEL",    4 },
                    Package () { "DL0_QATBFUNNEL", 1 }, // DDR DL_0 LLC0 ATB
                    Package () { "DL0_QATBFUNNEL", 2 }, // DDR DL_0 LLC1 ATB
                    Package () { "DL0_QATBFUNNEL", 3 }, // DDR DL_0 LLC2 ATB
                    Package () { "DL0_QATBFUNNEL", 4 }, // DDR DL_0 LLC3 ATB
                    Package () { "DL0_QATBFUNNEL", 5 }, // DDR DL_0 CH0 CABO ATB
                    Package () { "DL0_QATBFUNNEL", 6 }, // DDR DL_0 CH1 CABO ATB
                    Package () { "DL0_QATBFUNNEL", 7 }, // DDR DL_1 QATB

                    Package () { "DL1_QATBFUNNEL", 0 }, // DDR DL_1 CH2 CABO ATB
                    Package () { "DL1_QATBFUNNEL", 1 }, // DDR DL_1 CH3 CABO ATB
                    Package () { "DL1_QATBFUNNEL", 2 }, // DDR DL_1 Mem NoC ATB

                    Package () { "QATB_FUNNEL",    5 },
                    Package () { "DLST_QATBFUN",   1 }, // A1NoC ATB
                    Package () { "WCSS_FUN",       0 }, 
                    Package () { "DLST_QATBFUN",   2 }, // WCSS NoC ATB

                    Package () { "QATB_FUNNEL",    6 },
                    Package () { "LPASS_QATBFUN",  1 }, // LPASS DL Q6 ATB

                    Package () { "QATB_FUNNEL",    7 },
                    Package () { "TURING_QATBFUN", 1 }, // Turing DL Q6 ATB
                    Package () { "IN_FUN0",        2 }, // System NoC ATB
                                                   
                    Package () { "IN_FUN0",        3 },
                    Package () { "SPSS_QATBFUN",   2 }, // Secure Processor NoC ATB
                                                   
                    Package () { "IN_FUN0",        5 }, // A2NoC ATB
                                                   
                    Package () { "MERG_FUN",    1 },                    
                    Package () { "IN_FUN1",        2 }, // NAV ATB

                    Package () { "MERG_FUN",    2 },
                    Package () { "IN_FUN2",        0 }, // Modem Q6 ATB
                                                   
                    Package () { "IN_FUN2",        1 },
                    Package () { "SWAO_FUN0",      1 }, // AOSS AOP ITM ATB
                                                   
                    Package () { "SWAO_FUN0",      6 },
                    Package () { "SSC_FUN0",       1 }, // SSC STM ATB
                    Package () { "SSC_FUN0",       3 }, // SSC SDC ITM ATB
                    Package () { "SSC_FUN0",       4 }, // SSC NOC
                                                   
                    Package () { "IN_FUN2",        5 },
                    Package () { "CPU_FUN1",       3 }, // DBG_UI ATB
                    Package () { "CPU_FUN1",       4 }, // HWE DL ATB
                    Package () { "CPU_FUN1",       5 }, // LLM Silver Cluster ATB
                    Package () { "CPU_FUN1",       6 }, // LLM Gold Cluster ATB
                },
                Package ()
                {
                    "GFX",                    
                    Package () { "MERG_FUN",       2 },
                    Package () { "IN_FUN2",        6 }, // GPU

                    Package () { "MERG_FUN",       0 },
                    Package () { "IN_FUN0",        6 },
                    Package () { "QATB_FUNNEL",    2 },
                    Package () { "GPU_QATBFUN",    1 }, // GPU DL VBIF ATB
                },
                Package ()
                {
                    "MODEMQ6ETM",
                    Package () { "MERG_FUN",       2 },
                    Package () { "IN_FUN2",        0 }, // Modem Q6 ATB
                },
                Package ()
                {
                    "QDSS",      
                    Package () { "MERG_FUN",       0 },
                    Package () { "IN_FUN0",        6 },
                    Package () { "QATB_FUNNEL",    0 }, // VSENSE TPDM, DCC TPDM, PRNG TPDM, QM TPDM, PIMEM TPDM, QDSS internal DSB TPDM
					
                    Package () { "GPU_QATBFUN",    0 }, // GPU DL VBIF ATB
					
                    Package () { "DLMM_QATBFUN",   1 }, // DL MM QATB TPDM
					
                    Package () { "DL0_QATBFUNNEL", 0 }, // DDR DL_0 QATB TPDM
					
                    Package () { "LPASS_QATBFUN",  0 }, // LPASS DL QATB TPDM
					
                    Package () { "TURING_QATBFUN", 0 }, // Turing DL QATB TPDM
					
                },
                Package ()
                {
                    "APSS",      
                    Package () { "MERG_FUN",       2 },
                    Package () { "IN_FUN2",        5 },
                    Package () { "CPU_FUN1",       0 }, // APSS Top Funnel
                    Package () { "CPU_FUN1",       1 },
                    Package () { "CPU_FUN1",       2 },
                    Package () { "CPU_FUN1",       3 },
                    Package () { "CPU_FUN1",       4 },
                    Package () { "CPU_FUN1",       5 },
                    Package () { "CPU_FUN1",       6 },
                    Package () { "CPU_FUN0",       0 }, // APSS CPU Trace Funnel
                    Package () { "CPU_FUN0",       1 },
                    Package () { "CPU_FUN0",       2 },
                    Package () { "CPU_FUN0",       3 },
                    Package () { "CPU_FUN0",       4 },
                    Package () { "CPU_FUN0",       5 },
                    Package () { "CPU_FUN0",       6 },
                    Package () { "CPU_FUN0",       7 },
                },
                Package ()
                {
                    "MSS",                              // Modem RFFE TPDM / TPDA ATB
                    Package () { "MERG_FUN",       2 },
                    Package () { "IN_FUN2",        2 },
                    Package () { "MSS_QATBFUN",    1 }, // Modem DL Funnel
                },
                Package ()
                {
                    "NAV",                              // NAV ATB
                    Package () { "MERG_FUN",       1 },
                    Package () { "IN_FUN1",        2 },
                },
                Package ()
                {
                    "OLC",                              // APSS OLC (LMH) TPDM / TPDA ATB
                    Package () { "MERG_FUN",       2 },
                    Package () { "IN_FUN2",        5 },
                    Package () { "CPU_FUN1",       2 }, // APSS Top Funnel
                },
                Package ()
                {
                    "SP",                               // Secure Processor TPDM ATB
                    Package () { "MERG_FUN",       0 },
                    Package () { "IN_FUN0",        3 },
                    Package () { "SPSS_QATBFUN",   0 }, // Secure Processor DL Funnel
                },
                Package ()
                {
                    "SWAO",                             // AOSS TPDM 0 ATB, AOSS TPDM 1 ATB
                    Package () { "MERG_FUN",       2 },
                    Package () { "IN_FUN2",        1 },
                    Package () { "SWAO_FUN0",      7 }, // AOSS Funnel
                },
                Package ()
                {
                    "LLMGOLD",                          // LLM Gold Cluster ATB
                    Package () { "MERG_FUN",       2 },
                    Package () { "IN_FUN2",        5 },
                    Package () { "CPU_FUN1",       6 }, // APSS Top Funnel
                },
                Package ()
                {
                    "LLMSILVER",                        // LLM Silver Cluster ATB
                    Package () { "MERG_FUN",       2 },
                    Package () { "IN_FUN2",        5 },
                    Package () { "CPU_FUN1",       5 }, // APSS Top Funnel
                },
                Package ()
                {
                    "MSSDL",                            // Modem DL HWE TPDM ATB
                    Package () { "MERG_FUN",       2 },
                    Package () { "IN_FUN2",        2 },
                    Package () { "MSS_QATBFUN",    0 }, // Modem DL Funnel
                },
            }
        )
    }

    // The HWEV method holds the base addresses and the sizes of the subsystems
    // muxes that are needed to be turned on for collecting the hardware events
    // from the corresponding subsystems.
    // "Address" and "Length" are used to validate if address from QTF is in range
    // "Set" value must match the enum QDSS_HWEVT_PSTATES_ENUM defined in qdssPower.h
    //   0xFF means this mux block has the clock already turned on and doesnt need p-state
    //   It takes values in increments of 2 as in {0,2,4,6,8,... ,etc}
    // "Qdss-Csr" - 1 if it is a Qdss CSR register block or 0 if it is a subsystem block
    // reference : 
    // "\\char\tools\Installers\QTF\hwe_db_do_not_export\850_hw_event.xml" timestamp : Mon Feb 06 18:34:45 2017
    Method (HWEV)
    {
        Return
        (
            Package ()
            {
                //              Address, Length, Set, Qdss-Csr
                Package () { 0x06001020,  0x10,  0x0,   1}, // QDSS_CS_QDSSCSR_STMEXTHWCTLn - GLOBAL SYS MUX base address 
                Package () { 0x010BA020,  0x80,  0x0,   0}, 
            }
        )
    }
}

// Inclusion for enabling QDSS QPMDA ACPI
Include("qdss_qpmda.asl")
// Inclusion for enabling QDSS ETB/ETF and ETR ACPI
Include("qdss_tmc.asl")
// Inclusion for enabling QDSS Replicator ACPI
Include("qdss_replicator.asl")
// Inclusion for enabling QDSS TGU ACPI
Include("qdss_tgu.asl")
// Inclusion for enabling QDSS REMOTE ETM ACPI
Include("qdss_remote_etm.asl")
Include("qdss_verifyclocks.asl")
