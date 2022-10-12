//
// The PEP Device & Driver Related Configuration
//

Device (PEP0)
{
    Name (_HID, "QCOM0237")
    Name (_CID, "PNP0D80")

	Include("thz.asl")
	
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
					//Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {47}
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

                    //o_pwr_dcvsh_interrupt: LMH debug interrupt for power cluster
						Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {64}
					
                    //o_perf_dcvsh_interrupt: LMH debug interrupt for perf cluster
						Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {65}					

                    //ddrss_apps_interrupt[1]: BIMC BWMON
					Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {613}
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
          0x1799000C,
          // Reserved
          0x00000000,
          // Reserved
          0x00000000,
          // Reserved
          0x00000000,
          })
      Return (RBUF)
    }

    Method(CRTC)
    {
        return (CTRX)
    }

    Name(CTRX,
        Package()
        {
            // Methods (names are reversed) that are critical to
            // system boot
            "NSTC",         // critical thermal sensors
            "HLCB",	        // BCL sensor HID 
            "MMVD",         // Discrete Vreg Mapping Package
            "DSGP",         //System Default Configuration, SDFR            
            "CCGP",         // CPU Configuration
            "MTPS",         //Read the speaker calibration related parameters
            "CPGP",         // CPU cap for DCVS Package
            "DMPP",         // PEP resources (usually dummy devices required for power mgmt)
			"VRDL",         // DRV ID List
            "GBDL",         // Debugger configuration -- must be below DSGP (reading SDFR)
            "SRDL",         // Default resources -- must be below DSGP (reading SDFR)
        }
    )

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
            "DMSB",     // buses resources
            "DMQP",     // dfs Resources
            "DMMS",     // SMMU
            "DMPA",     //AUDIO
            "DMPC",     //CAMERA
            "DMPB",     //COREBSP
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
            "DMPS",     //SUBSYSTEMDRIVERS
            // "DMRC",     //CRYPTO
            "DMPL",     // PLATFORM
            // "DMTB",     //BAMTestClient
            "DMDQ",     //QDSS
            // "DMMT",     //SMMUTestClient
            "DMPI",     //IPA
            "DMWE",     //EXTERNAL WIRELESS CONNECTIVITY
            "XMPC",     //CAMERA
            "XMPL",     // PLATFORM
            // "XMPN",     //SENSORS
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

    // CPU/Core Configurations Packages
    Name(CCFG,
        Package ()
        {
            //  Post computex cpu names
            Package ()
            {
                "\\_SB.SYSM.CLUS.CPU0", 
                0x10, // CPU0.
            },
            Package ()
            {
                "\\_SB.SYSM.CLUS.CPU1",
                0x11, // CPU1.
            },
            Package ()
            {
                "\\_SB.SYSM.CLUS.CPU2",
                0x12, // CPU2.
            },
            Package ()
            {
                "\\_SB.SYSM.CLUS.CPU3",
                0x13, // CPU3.
            },
			Package ()
            {
                "\\_SB.SYSM.CLUS.CPU4",
                0x14, // CPU4.
            },
			Package ()
            {
                "\\_SB.SYSM.CLUS.CPU5",
                0x15, // CPU5.
            },
			Package ()
            {
                "\\_SB.SYSM.CLUS.CPU6",
                0x16, // CPU6.
            },
			Package ()
            {
                "\\_SB.SYSM.CLUS.CPU7",
                0x17, // CPU7.
            },
        })


    // Method to return CPU configuration packages
    // PEP Get CPU Configuration
    Method(PGCC)
    {
        Return(CCFG)
    }
	
	// DRV ID Configurations Packages
    Name(DRVC,
        Package ()
        {
            //  PEP Supported DRV List
            Package ()
            {
                "HLOS_DRV",
                0x2,              // HLOS Subsystem DRV ID.
				"/icb/arbiter",   // HLOS ICB resource node
            },
            Package ()
            {
                "DISPLAY_DRV",
                0x9,                      // Display Subsystem DRV ID.
				"/icb/arbiter/display",   //Display ICB resource node
            },            
        })
		
	// Method to return DRV Id list packages
    // PEP Get DRV Id list
    Method(LDRV)
    {
        Return(DRVC)
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
		// Resource ID								            // Set Interface Type                           // Get Interface Type
		//------------------------					            ----------------------------------------------  ----------------------------------------------
		Package () { "PPP_RESOURCE_ID_SMPS1_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_SMPS2_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_SMPS3_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_SMPS4_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_SMPS5_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_SMPS6_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
        
		Package () { "PPP_RESOURCE_ID_SMPS7_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_SMPS9_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },

		Package () { "PPP_RESOURCE_ID_SMPS1_C",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_SMPS2_C",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_SMPS3_C",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },

		Package () { "PPP_RESOURCE_ID_LDO1_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO2_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO3_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO4_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO5_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO6_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO7_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO8_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO9_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO10_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO11_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO12_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO13_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO14_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO15_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO16_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO17_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO18_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO19_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO20_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO21_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO22_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO23_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO24_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO25_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO26_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO27_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LDO28_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },

		Package () { "PPP_RESOURCE_ID_LVS1_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_LVS2_A",					"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		
		Package () { "PPP_RESOURCE_ID_CXO_BUFFERS_BBCLK2_A",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_CXO_BUFFERS_BBCLK3_A",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		
		Package () { "PPP_RESOURCE_ID_CXO_BUFFERS_RFCLK1_A",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_CXO_BUFFERS_RFCLK2_A",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_CXO_BUFFERS_RFCLK3_A",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		
		Package () { "PPP_RESOURCE_ID_CXO_BUFFERS_DIVCLK1_A",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_CXO_BUFFERS_DIVCLK2_A",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
		Package () { "PPP_RESOURCE_ID_CXO_BUFFERS_DIVCLK3_A",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
        
        Package () { "PPP_RESOURCE_ID_BUCK_BOOST1_B",	        "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPMH",	"PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF" },
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
        // Resource type range                  Initial supported resource                  Last supported resource
        //--------------------                  --------------------------                  -------------------------
        "PPP_RESOURCE_RANGE_INFO_SMPS_A",          "PPP_RESOURCE_ID_SMPS1_A",                  "PPP_RESOURCE_ID_SMPS13_A",
        "PPP_RESOURCE_RANGE_INFO_SMPS_C",          "PPP_RESOURCE_ID_SMPS1_C",                  "PPP_RESOURCE_ID_SMPS4_C",
        "PPP_RESOURCE_RANGE_INFO_LDO_A",           "PPP_RESOURCE_ID_LDO1_A",                   "PPP_RESOURCE_ID_LDO28_A",
        "PPP_RESOURCE_RANGE_INFO_LVS_A",           "PPP_RESOURCE_ID_LVS1_A",                   "PPP_RESOURCE_ID_LVS2_A",
        "PPP_RESOURCE_RANGE_INFO_CXO_BUFFERS_A",   "PPP_RESOURCE_ID_CXO_BUFFERS_BBCLK2_A",     "PPP_RESOURCE_ID_CXO_BUFFERS_DIVCLK3_A",
        "PPP_RESOURCE_RANGE_INFO_BUCK_BOOST_B",    "PPP_RESOURCE_ID_BUCK_BOOST1_B",            "PPP_RESOURCE_ID_BUCK_BOOST1_B",
    })

    // Method to return Pep Ppp Resource Range Package
    Method(PPRR)
    {
        Return (PRRP)
    }

    // Method to return System Default config packages
    // PEP Get System Default package
    Method(PGSD)
    {
        Return(SDFR)
    }

    // Full PEP Device Package
    Name(FPDP,0x0)

    // Method to return Full PEP Managed Device List Package
    Method(FPMD)
    {
        Return(FPDP)
    }


    //
    // PEP Processor Performance configuration
    // CPU cap for DCVS Packages
    Name(PPPC,0x0)

    // Method to return CPU cap for DCVS Package
    Method(PGPC)
    {
        Return(PPPC)
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
    // Method(DMRF) {
    //         // Return DMRF
    //         Return(\_SB.DPP1)
    // }

}

// Data required by PEP
Include("pep_libPdc.asl")
Include("pep_libPCU.asl")
Include("pep_vddresources.asl")
Include("pep_lmh.asl")
Include("pep_dvreg.asl")
Include("pep_dbgSettings.asl")
Include("pep_defaults.asl")
Include("pep_idle.asl")
Include("pep_cprh.asl")
Include("pep_dcvscfg.asl")
// DO NOT comment next line, since pep_tsens.asl is needed for PEP DeviceAdd
Include("pep_tsens.asl")

// Resources by area
Include("audio_resources.asl")
Include("graphics_resources.asl")
Include("HoyaSmmu_resources.asl")
Include("oem_resources.asl")
Include("subsys_resources.asl")
Include("pep_resources.asl")
Include("corebsp_resources.asl")
Include("ipa_resources.asl")
Include("wcnss_resources.asl")
Include("qdss_resources.asl")
Include("pcie_resources.asl")
