//
// The PEP Device & Driver Related Configuration
//

Device (PEP0)
{
    Name (_HID, "HID_PEP0")
    Name (_CID, "PNP0D80")
    //Alias(\_SB.PSUB, _SUB)
    Include("thz.asl")

    Method(_SUB)
    {
        If (LEqual(\_SB.PSUB, "MTP08180")) {
        
            If (LEqual(PPID, 0x1)){
                Return("HAZD8180")
            }
            Else {
                If(Lequal(\_SB_.SOID, 404) && Lequal(\_SB_.PLST,1)){
                    Return("MTPC8180")
                }
                Else {
                    Return("MTP08180")
                }
            }
            		
        }
        ElseIf (LEqual(\_SB.PSUB, "CLS08180")){
            If (LEqual(_BID, 0x0)) {
			    If(Lequal(\_SB_.SOID, 404) && Lequal(\_SB_.PLST,1)){
					Return("CLS28180")
				}
				Else {
					Return("CLS08180")
				}
			}
            Else {
				If(Lequal(\_SB_.SOID, 404) && Lequal(\_SB_.PLST,1)){
					Return("CLS38180")
				}
				Else {
					Return("CLS18180")
				}
            }
        }
        ElseIf (LEqual(\_SB.PSUB, "CDP08180")){
            Return("CDP08180")
        }        
    }

    Method(_CRS)
    {
        // List interrupt resources in the order they are used in PEP_Driver.c
            Return
            (
                ResourceTemplate ()
                {
                    // TSENS threshold interrupts
                    // Controller 0: Low / high
                    Interrupt(ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake, , , ) {538}
                    // Controller 0: Critical
                    Interrupt(ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake, , , ) {540}
                    // Controller 1: Low / high
                    Interrupt(ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake, , , ) {539}
                    // Controller 1: Critical
                    Interrupt(ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake, , , ) {541}

                    // apss amc finish irq
                    Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {37}
                    // apss epcb timeout irq
                    //Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {34}
                    // mdss amc finish irq
                    Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {161}
                    // mdss epcb timeout irq
                    //Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {160}

                    // Inbound interrupt from AOP to Apps PEP Glink:
                    //SYS_apssQgicSPI[389] = 421
                    Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {421}

                    //rpm_to_kpss_ipc_irq0 = SYSApcsQgicSpi169 = 201   (MPM)
                    //Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {201}

                    //rpm_to_kpss_ipc_irq0 = SYSApcsQgicSpi171 = 203   (wakeup)
                    //Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {203}

                    //o_pwr_dcvsh_interrupt or silver_dcvsh_interrupt: LMH debug interrupt for power cluster
                                        Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {64}

                    //o_perf_dcvsh_interrupt or gold_dcvsh_interrupt: LMH debug interrupt for perf cluster
                                        Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {65}

                    //8998v1BU +
                    // CPR HMSS
                    //Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {80}
                    // CPR GFX
                    //Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {198}
                    //8998v1BU -

                    //o_bimc_intr: BIMC BWMON
                    Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {613}
                }
            )
        }


    // need 20 char and 1 D state info
    Field(\_SB.ABD.ROP1, BufferAcc, NoLock, Preserve)
    {
        /* Connection Object  - 0x007C is the unique identifier */
        Connection(I2CSerialBus( 0x0001,,0x0,, "\\_SB.ABD",,,,)),
        AccessAs(BufferAcc, AttribRawBytes(21)),
        FLD0, 168
    }
    //Get port to connect to
    Method(GEPT)
    {
        Name(BUFF, Buffer(4){})
        CreateByteField(BUFF, 0x00, STAT)
        CreateWordField(BUFF, 0x02, DATA)
        Store(0x1, DATA) //in this example we will connect to ABDO
        Return(DATA)
    }

        Name(ROST, 0x0)
    // Number of CPUs to Park
    Method(NPUR, 0x1, NotSerialized)
    {
        Store(Arg0, Index(\_SB_.AGR0._PUR, 1))
        Notify(\_SB_.AGR0, 0x80)
    }


    // ACPI method to return intr descriptor
    Method(INTR, 0x0, NotSerialized) {
      Name(RBUF, Package()
          {
          // Version
          0x00000002,
          // Number of hosts
          0x00000001,
          // number of memory regions
          0x00000003,
          // number of IPC registers
          0x00000001,

          // Rpm: APCS_IPC(0)
          // Host = SMEM_RPM
          0x00000006,
          // Physical address
          0x17911008,
          // Value
          0x00000001,
          // Reserved
          0x00000000,

          // Shared memory
          // Start address
          0x86000000,
          // Size
          0x00200000,
          // Reserved
          0x00000000,
          // Reserved
          0x00000000,

          // MSG RAM
          // Start address
          0x0C300000,
          // Size
          0x00001000,
          // Reserved
          0x00000000,
          // Reserved
          0x00000000,

          // IMEM or TZ_WONCE
          // Start address
          0x01fd4000,
          // Size
          0x00000008,
          // Reserved
          0x00000000,
          // Reserved
          0x00000000,

          // IPC register 1
          // Physical addr
          0x17C0000C,
          // Reserved
          0x00000000,
          // Reserved
          0x00000000,
          // Reserved
          0x00000000,
          })
      Return (RBUF)
    }

    Method(STND)
    {
        return (STNX)
    }

    Name(STNX,
        Package()
        {
            // Power resources for devices
            // Names are reversed (so method OCMD becomes DMCO)
            //
            // Following format must be followed for name:
            // DMxx -- Exists on QCOM SoC. Will use normal PoFX for power mgmt
            // XMxx -- Exists off QCOM SoC and uses legacy power mgmt (_PS1, _PS2, etc)
            //
            // The files where these methods are declared must be included
            // at the bottom of this file and must exists inside the scope: \_SB.PEP0
            "DMPO",        //oem dummy
            "MMVD",         // Discrete Vreg Mapping Package
            "DMSB",     // buses resources
            "DMMS",     // SMMU
            "DMPA",     //AUDIO
            "DM0C",     //CAMERA JPGE
            "DM1C",     //CAMERA MPCS
            "DM2C",     //CAMERA VFE0
            "DMPB",     //COREBSP_STORAGE-UFS primary
            "DMUS",     //COREBSP_STORAGE-UFS secondary
            "DMDS",     //COREBSP_STORAGE-SD
            "DM0G",     //GRAPHICS
            "DM1G",     //GRAPHICS
            "DM2G",     //GRAPHICS
            "DM3G",     //GRAPHICS
            "DM4G",     //GRAPHICS
            "DM5G",     //GRAPHICS
            "DM6G",     //GRAPHICS
            "DM7G",     //GRAPHICS
            "DM8G",     //GRAPHICS
            "DM9G",     //GRAPHICS
            "DMKG",     //GRAPHICS
            "DMLG",     //GRAPHICS
            "DMMG",     //GRAPHICS
            "DMPL",     // PLATFORM
            //"DMTB",     //BAMTestClient
            "DMDQ",     //QDSS
            //"DMMT",     //SMMUTestClient
            "DMPI",     //IPA
            "DMWE",     //EXTERNAL WIRELESS CONNECTIVITY
            "XMPC",     //CAMERA
            "XMPL",     // PLATFORM
            "XMPN",     //SENSORS
            "DMEP",     //PCIE-Resources
        }
    )
    //
    // Core topology
    //
    Method(CTPM){
        Name( CTPN, package(){
                        "CORE_TOPOLOGY",
            8   // Kyro cores
        })

        return(CTPN)
    }

    // CPU cap for DCVS Packages
    Name(DCVS,0x0)

    // Method to return CPU cap for DCVS Package
    Method(PGDS)
    {
        Return(DCVS)
    }

    // PPP Supported Resources Package
    Name (PPPP,
    Package()
    {
                // Resource ID
                //------------------------
                Package () { "PPP_RESOURCE_ID_SMPS5_A" },
                Package () { "PPP_RESOURCE_ID_SMPS10_A" },

                Package () { "PPP_RESOURCE_ID_SMPS1_C" },
                Package () { "PPP_RESOURCE_ID_SMPS2_C" },
                Package () { "PPP_RESOURCE_ID_SMPS3_C" },
                Package () { "PPP_RESOURCE_ID_SMPS5_C" },
                Package () { "PPP_RESOURCE_ID_SMPS6_C" },
                Package () { "PPP_RESOURCE_ID_SMPS7_C" },
                Package () { "PPP_RESOURCE_ID_SMPS8_C" },

                Package () { "PPP_RESOURCE_ID_SMPS3_E" },
                Package () { "PPP_RESOURCE_ID_SMPS4_E" },
                Package () { "PPP_RESOURCE_ID_SMPS5_E" },

                Package () { "PPP_RESOURCE_ID_LDO1_A" },
                Package () { "PPP_RESOURCE_ID_LDO2_A" },
                Package () { "PPP_RESOURCE_ID_LDO3_A" },
                Package () { "PPP_RESOURCE_ID_LDO5_A" },
                Package () { "PPP_RESOURCE_ID_LDO6_A" },
                Package () { "PPP_RESOURCE_ID_LDO7_A" },
                Package () { "PPP_RESOURCE_ID_LDO9_A" },
                Package () { "PPP_RESOURCE_ID_LDO10_A" },
                Package () { "PPP_RESOURCE_ID_LDO11_A" },
                Package () { "PPP_RESOURCE_ID_LDO12_A" },
                Package () { "PPP_RESOURCE_ID_LDO13_A" },
                Package () { "PPP_RESOURCE_ID_LDO14_A" },
                Package () { "PPP_RESOURCE_ID_LDO15_A" },
                Package () { "PPP_RESOURCE_ID_LDO16_A" },
                Package () { "PPP_RESOURCE_ID_LDO17_A" },
                Package () { "PPP_RESOURCE_ID_LDO18_A" },

                Package () { "PPP_RESOURCE_ID_LDO1_C" },
                Package () { "PPP_RESOURCE_ID_LDO2_C" },
                Package () { "PPP_RESOURCE_ID_LDO3_C" },
                Package () { "PPP_RESOURCE_ID_LDO4_C" },
                Package () { "PPP_RESOURCE_ID_LDO6_C" },
                Package () { "PPP_RESOURCE_ID_LDO7_C" },
                Package () { "PPP_RESOURCE_ID_LDO8_C" },
                Package () { "PPP_RESOURCE_ID_LDO9_C" },
                Package () { "PPP_RESOURCE_ID_LDO10_C" },
                Package () { "PPP_RESOURCE_ID_LDO11_C" },

                Package () { "PPP_RESOURCE_ID_LDO1_E" },
                Package () { "PPP_RESOURCE_ID_LDO2_E" },
                Package () { "PPP_RESOURCE_ID_LDO4_E" },
                Package () { "PPP_RESOURCE_ID_LDO5_E" },
                Package () { "PPP_RESOURCE_ID_LDO7_E" },
                Package () { "PPP_RESOURCE_ID_LDO8_E" },
                Package () { "PPP_RESOURCE_ID_LDO9_E" },
                Package () { "PPP_RESOURCE_ID_LDO10_E" },
                Package () { "PPP_RESOURCE_ID_LDO12_E" },
                Package () { "PPP_RESOURCE_ID_LDO13_E" },
                Package () { "PPP_RESOURCE_ID_LDO14_E" },
                Package () { "PPP_RESOURCE_ID_LDO15_E" },
                Package () { "PPP_RESOURCE_ID_LDO16_E" },
                Package () { "PPP_RESOURCE_ID_LDO17_E" },

                Package () { "PPP_RESOURCE_ID_CXO_BUFFERS_BBCLK1_A" },
                Package () { "PPP_RESOURCE_ID_CXO_BUFFERS_BBCLK2_A" },
                Package () { "PPP_RESOURCE_ID_CXO_BUFFERS_BBCLK3_A" },

                Package () { "PPP_RESOURCE_ID_CXO_BUFFERS_RFCLK1_D" },
                Package () { "PPP_RESOURCE_ID_CXO_BUFFERS_RFCLK2_D" },
                Package () { "PPP_RESOURCE_ID_CXO_BUFFERS_RFCLK3_D" },
                Package () { "PPP_RESOURCE_ID_CXO_BUFFERS_RFCLK4_D" },

                Package () { "PPP_RESOURCE_ID_CXO_BUFFERS_DIVCLK1_A" },
                Package () { "PPP_RESOURCE_ID_CXO_BUFFERS_DIVCLK2_A" },

                Package () { "PPP_RESOURCE_ID_CXO_BUFFERS_DIVCLK1_C" },

                Package () { "PPP_RESOURCE_ID_BUCK_BOOST1_C" },

                Package () { "PPP_RESOURCE_ID_PMIC_GPIO_DV1" },
                Package () { "PPP_RESOURCE_ID_PMIC_GPIO_DV2" },
                Package () { "PPP_RESOURCE_ID_PMIC_GPIO_DV3" },

                Package () { "PPP_RESOURCE_ID_TLMM_GPIO_DV1" },
                Package () { "PPP_RESOURCE_ID_TLMM_GPIO_DV2" },
                Package () { "PPP_RESOURCE_ID_TLMM_GPIO_DV3" },
    })


    // Method to return PPP Package
    Method(PPPM)
    {
        Return (PPPP)
    }

    // Method to return System Default config packages
    Name (PRRP,
    Package()
    {
        // Resource type range                     Initial supported resource                  Last supported resource
        //--------------------                     --------------------------                  -------------------------
        "PPP_RESOURCE_RANGE_INFO_SMPS_A",          "PPP_RESOURCE_ID_SMPS1_A",                  "PPP_RESOURCE_ID_SMPS10_A",
        "PPP_RESOURCE_RANGE_INFO_SMPS_C",          "PPP_RESOURCE_ID_SMPS1_C",                  "PPP_RESOURCE_ID_SMPS8_C",
        "PPP_RESOURCE_RANGE_INFO_SMPS_E",          "PPP_RESOURCE_ID_SMPS1_E",                  "PPP_RESOURCE_ID_SMPS10_E",
        "PPP_RESOURCE_RANGE_INFO_LDO_A",           "PPP_RESOURCE_ID_LDO1_A",                   "PPP_RESOURCE_ID_LDO18_A",
        "PPP_RESOURCE_RANGE_INFO_LDO_C",           "PPP_RESOURCE_ID_LDO1_C",                   "PPP_RESOURCE_ID_LDO11_C",
        "PPP_RESOURCE_RANGE_INFO_LDO_E",           "PPP_RESOURCE_ID_LDO1_E",                   "PPP_RESOURCE_ID_LDO18_E",
        "PPP_RESOURCE_RANGE_INFO_CXO_BUFFERS_A",   "PPP_RESOURCE_ID_CXO_BUFFERS_BBCLK1_A",     "PPP_RESOURCE_ID_CXO_BUFFERS_DIVCLK2_A",
        "PPP_RESOURCE_RANGE_INFO_CXO_BUFFERS_C",   "PPP_RESOURCE_ID_CXO_BUFFERS_DIVCLK1_C",    "PPP_RESOURCE_ID_CXO_BUFFERS_DIVCLK1_C",
        "PPP_RESOURCE_RANGE_INFO_CXO_BUFFERS_D",   "PPP_RESOURCE_ID_CXO_BUFFERS_BBCLK1_D",     "PPP_RESOURCE_ID_CXO_BUFFERS_DIVCLK1_D",
        "PPP_RESOURCE_RANGE_INFO_BUCK_BOOST_C",    "PPP_RESOURCE_ID_BUCK_BOOST1_C",            "PPP_RESOURCE_ID_BUCK_BOOST1_C",
        "PPP_RESOURCE_RANGE_INFO_PMIC_GPIO_DV",    "PPP_RESOURCE_ID_PMIC_GPIO_DV1",            "PPP_RESOURCE_ID_PMIC_GPIO_DV3",
        "PPP_RESOURCE_RANGE_INFO_TLMM_GPIO_DV",    "PPP_RESOURCE_ID_TLMM_GPIO_DV1",            "PPP_RESOURCE_ID_TLMM_GPIO_DV3",
    })

    // Method to return Pep Ppp Resource Range Package
    Method(PPRR)
    {
        Return (PRRP)
    }

    // Full PEP Device Package
    Name(FPDP,0x0)

    // Method to return Full PEP Managed Device List Package
    Method(FPMD)
    {
        Return(FPDP)
    }

        // Methods to read USB DP & DM interrupts polarity
        // The return names should match with buffers
        // declared and defined in usb.asl file.

        // This method allows PEP to read Polarity of
    // eud_p0_dmse_int_mx & eud_p0_dpse_int_mx
        // interrupts which belong to Primary USB Port (P0)
    Method(DPRF) {
        // Return DPRF
        Return(\_SB.DPP0)
    }

        // This method allows PEP to read Polarity of
    // eud_p1_dmse_int_mx & eud_p1_dpse_int_mx
        // interrupts which belong to Secondary USB Port (P1)
    Method(DMRF) {
        // Return DMRF
        Return(\_SB.DPP1)
    }

        // This method allows PEP to read Polarity of
        // usb2_dmse & usb2_dpse
        // interrupts which belong to USB Multiport 0
    Method(MPRF) {
        // Return MPRF
        Return(\_SB.MPP0)
    }

        // This method allows PEP to read Polarity of
        // usb2_dmse & usb2_dpse
        // interrupts which belong to USB Multiport 1
    Method(MMRF) {
        // Return MMRF
        Return(\_SB.MPP1)
    }
}

        //// need 20 char and 1 D state info
//    Field(\_SB.ABD.ROP1, BufferAcc, NoLock, Preserve)
//    {
        ///* Connection Object  - 0x007C is the unique identifier */
//        Connection(I2CSerialBus( 0x0001,,0x0,, "\\_SB.ABD",,,,)),
//        AccessAs(BufferAcc, AttribRawBytes(21)),
//        FLD0, 168
//    }
    ////Get port to connect to
//    Method(GEPT)
//    {
//        Name(BUFF, Buffer(4){})
//        CreateByteField(BUFF, 0x00, STAT)
//        CreateWordField(BUFF, 0x02, DATA)
//        Store(0x1, DATA)
//        Return(DATA)
//    }
//}

// DO NOT comment next line, since pep_tsens.asl is needed for PEP DeviceAdd
Include("pep_tsens.asl")
Include("pep_dvreg.asl")

// Resources by area
Include("audio_resources.asl")
Include("graphics_resources.asl")
Include("msft_resources.asl")
Include("oem_resources.asl")
Include("usb_resources.asl")
Include("corebsp_resources.asl")
Include("ipa_resources.asl")
Include("wcnss_resources.asl")
Include("cust_wcnss_resources.asl")
Include("pcie_resources.asl")