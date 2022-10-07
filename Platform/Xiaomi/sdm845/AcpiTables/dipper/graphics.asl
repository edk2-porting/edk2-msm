//--------------------------------------------------------------------------------------------------
// GfxXMLToACPI Version 2.3.
//--------------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------------
// This file contains all graphics ACPI Device Configuration Information and Methods
//
// !!WARNING: This is an auto-generated file and should NOT be edited by hand!!
//            This file contains several interdependent ACPI methods that are all generated from
//            a single XML source.  Items in this file should not be updated manually, as they
//            will be overwritten by the auto-generated output.  Instead, modifications should be
//            made to the XML source, such that they are applied across all relevant tables.
//--------------------------------------------------------------------------------------------------

Device (GPU0)
{
    Name (_HID, "QCOM027E")
    Alias(\_SB.PSUB, _SUB)
    Name (_CID, "ACPI\QCOM027E")
    Name (_UID, 0)
    Name (_HRV, 0x07C)

    // Expose the internal monitor device to allow it to be used in a thermal zone
    // for thermal mitigation.
    //
    Device (MON0)
    {
        Method(_ADR)
        {
            // 0 is always the address assigned for the internal monitor.
            //
            Return(0)
        }
    }

    Name (_DEP, Package()
    {
        \_SB_.MMU0,
        \_SB_.MMU1,
        \_SB_.IMM0,
        \_SB_.IMM1,
        \_SB_.PEP0,
        \_SB_.PMIC,
        \_SB_.PILC,
        \_SB_.RPEN,
        \_SB_.TREE,
        \_SB_.SCM0,
    })
    
    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            // MDP register/memory space (IPCAT->SoC->Memory Maps->Config NOC->MMSS->MMSS_MDSS).  Address range includes RSCC
            //
            Memory32Fixed(ReadWrite, 0x0AE00000, 0x00140000)
    
            // DP PHY register/memory space (IPCAT->SoC->Memory Maps->Config NOC->PERIPH_SS_AHB2PHY_NORTH)
            //
            Memory32Fixed(ReadWrite, 0x088E0000, 0x000F4000)
    
            // MDP Interrupt, vsync (IPCAT->SoC->Interrupts->SDM850->mdp_irq)
            //
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {115}
    
            // GPU register space (IPCAT->SoC->Memory Maps->Config NOC->A6X) from SWI Browser
            //
            Memory32Fixed(ReadWrite, 0x05000000, 0x0003F010)
    
            // GPU register space (IPCAT->SoC->Memory Maps->Config NOC->A6X) from SWI Browser
            //
            Memory32Fixed(ReadWrite, 0x05060000, 0x0003F000)
    
            // GPU Interrupt (IPCAT->SoC->Interrupts->SDM850->gc_sys_irq[0]) (Source Subsystem = GPU Subsystem, Subsystem Port = gc_sys_irq[0])
            //
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {332}
    
            // GPU register space (IPCAT->SoC->Memory Maps->Config NOC->A6X) from SWI Browser
            //
            Memory32Fixed(ReadWrite, 0x0B280000, 0x0000FFFF)
    
            // GPU register space (IPCAT->SoC->Memory Maps->Config NOC->A6X) from SWI Browser
            //
            Memory32Fixed(ReadWrite, 0x0B480000, 0x00010000)
    
            // GPU register space (IPCAT->SoC->Memory Maps->Config NOC->A6X) from SWI Browser
            //
            Memory32Fixed(ReadWrite, 0x05090000, 0x00009000)
    
            // GPU RPMh CPRF register range
            //
            Memory32Fixed(ReadWrite, 0x0C200000, 0x0000FFFF)
    
            // VIDC register address space (IPCAT->SoC->Memory Maps->Config NOC->Video_SS_Wrapper)
            //
            Memory32Fixed(ReadWrite, 0x0AA00000, 0x00200000)
    
            // VIDC Interrupt (IPCAT->SoC->Interrupts->SDM850->VENUS_IRQ)
            //
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {206}
    
            // VIDC Interrupt (IPCAT->SoC->Interrupts->SDM850->VENUS_WD_IRQ)
            //
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {207}
    
            // TLMM GPIO used to reset the DSI panel
            //
            GpioIo(Exclusive, PullUp, 0, 0, , "\\_SB.GIO0", ,) {96}
    
            // TLMM GPIO used to select DSI panel mode
            //
            // GpioIo(Exclusive, PullUp, 0, 0, , "\\_SB.GIO0", ,) {52}
    
            // TLMM GPIO used to DP AUX polarity select
            //
            // GpioIo(Shared, PullUp, 0, 0, , "\\_SB.GIO0", ,) {51}
        })
        Return (RBUF)
    }
    
    //------------------------------------------------------------------------------
    // Resource Auxiliary Info
    // This method is a companion method to the main _CRS resource method.  It
    // includes information for each resource, such as the owning component, a
    // string identifier, etc.
    //------------------------------------------------------------------------------
    //
    Method (RESI, 0x0, NotSerialized)
    {
        Name (RINF, Package()
        {
            3,                               // Table Format Major Version
            0,                               // Table Format Minor Version
            
            // MDP register/memory space (IPCAT->SoC->Memory Maps->Config NOC->MMSS->MMSS_MDSS).  Address range includes RSCC
            //
            Package()
            {
                "RESOURCE",
                "MDP_REGS",                  // Resource Name
                "DISPLAY",                   // Owning Component
            },
            
            // DP PHY register/memory space (IPCAT->SoC->Memory Maps->Config NOC->PERIPH_SS_AHB2PHY_NORTH)
            //
            Package()
            {
                "RESOURCE",
                "DP_PHY_REGS",               // Resource Name
                "DISPLAY",                   // Owning Component
            },
            
            // MDP Interrupt, vsync (IPCAT->SoC->Interrupts->SDM850->mdp_irq)
            //
            Package()
            {
                "RESOURCE",
                "VSYNC_INTERRUPT",           // Resource Name
                "DISPLAY",                   // Owning Component
            },
            
            // GPU register space (IPCAT->SoC->Memory Maps->Config NOC->A6X) from SWI Browser
            //
            Package()
            {
                "RESOURCE",
                "GFX_REGS",                  // Resource Name
                "GRAPHICS",                  // Owning Component
            },
            
            // GPU register space (IPCAT->SoC->Memory Maps->Config NOC->A6X) from SWI Browser
            //
            Package()
            {
                "RESOURCE",
                "GFX_REG_CONT",              // Resource Name
                "GRAPHICS",                  // Owning Component
            },
            
            // GPU Interrupt (IPCAT->SoC->Interrupts->SDM850->gc_sys_irq[0]) (Source Subsystem = GPU Subsystem, Subsystem Port = gc_sys_irq[0])
            //
            Package()
            {
                "RESOURCE",
                "GFX_INTERRUPT",             // Resource Name
                "GRAPHICS",                  // Owning Component
            },
            
            // GPU register space (IPCAT->SoC->Memory Maps->Config NOC->A6X) from SWI Browser
            //
            Package()
            {
                "RESOURCE",
                "GPU_PDC_SEQ_MEM",           // Resource Name
                "GRAPHICS",                  // Owning Component
            },
            
            // GPU register space (IPCAT->SoC->Memory Maps->Config NOC->A6X) from SWI Browser
            //
            Package()
            {
                "RESOURCE",
                "GPU_PDC_REGS",              // Resource Name
                "GRAPHICS",                  // Owning Component
            },
            
            // GPU register space (IPCAT->SoC->Memory Maps->Config NOC->A6X) from SWI Browser
            //
            Package()
            {
                "RESOURCE",
                "GPU_CC",                    // Resource Name
                "GRAPHICS",                  // Owning Component
            },
            
            // GPU RPMh CPRF register range
            //
            Package()
            {
                "RESOURCE",
                "GPU_RPMH_CPRF",             // Resource Name
                "GRAPHICS",                  // Owning Component
            },
            
            // VIDC register address space (IPCAT->SoC->Memory Maps->Config NOC->Video_SS_Wrapper)
            //
            Package()
            {
                "RESOURCE",
                "VIDEO_REGS",                // Resource Name
                "VIDEO",                     // Owning Component
            },
            
            // VIDC Interrupt (IPCAT->SoC->Interrupts->SDM850->VENUS_IRQ)
            //
            Package()
            {
                "RESOURCE",
                "VIDC_INTERRUPT",            // Resource Name
                "VIDEO",                     // Owning Component
            },
            
            // VIDC Interrupt (IPCAT->SoC->Interrupts->SDM850->VENUS_WD_IRQ)
            //
            Package()
            {
                "RESOURCE",
                "VIDC_WD_INTERRUPT",         // Resource Name
                "VIDEO",                     // Owning Component
            },
            
            // TLMM GPIO used to reset the DSI panel
            //
            Package()
            {
                "RESOURCE",
                "DSI_PANEL_RESET",           // Resource Name
                "DISPLAY",                   // Owning Component
            },
            
            // TLMM GPIO used to select DSI panel mode
            //
            // Package()
            // {
            //     "RESOURCE",
            //     "DSI_PANEL_MODE_SELECT",      // Resource Name
            //     "DISPLAY",                   // Owning Component
            // },
            
            // TLMM GPIO used to DP AUX polarity select
            //
            // Package()
            // {
            //     "RESOURCE",
            //     "DP_AUX",                    // Resource Name
            //     "DISPLAY",                   // Owning Component
            // },
        })
        
        Return (RINF)
    }
    
    //------------------------------------------------------------------------------
    // Graphics Engines and Display Config
    // This method encapsulates all per-platform configuration data for engines and
    // the display.  This method consists of three sub-packages.  The first package
    // encapsulates all configuration information for the supported engines.  The
    // second package encapsulates all display configuration data.  The third
    // package is the list of all page tables used by the SMMUs in the engines and
    // display.
    //------------------------------------------------------------------------------
    //
    Method (ENGS)
    {
        Name (EBUF, Package()
        {
            3,           // Table Format Major Version
            2,           // Table Format Minor Version
            0x00440029,  // XML Common/Platform Source File Revision (16.16)
            
            //------------------------------------------------------------------------------
            // Graphics Engine List
            // This package enumerates all of the expected engines that should be enumerated
            // on this platform, as well as engine-specific configuration data.  This
            // includes resource assignments, power component assignments, MMU IDs,
            // and even chip family information.
            //------------------------------------------------------------------------------
            //
            Package()
            {
                "ENGINES",
                6,                          // Number of engines
                
                Package()
                {
                    "ENGINE",
                    "GRAPHICS",                   // Engine String Identifier
                    "Adreno6X",                   // Chip Family Identifier
                    1,                            // Index of Primary Power Component
                    2,                            // P-State Set Index of Footswitch override
                    0,                            // P-State Set Index of Reset
                    Package()
                    {
                        "MMUINFO",
                        "Miniport",               // SMMU managed by miniport or engine
                        "ArmSmmuV2",              // SMMU Family
                        2,                        // Number of SMMU stages
                        49,                       // Address bits
                        "V8L",                    // Address format
                        "SMMUID",             ToUUID("9833C712-3292-4FFB-B0F4-2BD20E1F7F66"),
                        "SMMUINTERFACEID",    ToUUID("00000000-0000-0000-0000-000000000000"),
                        // If default the above would be:
                        //     ToUUID("00000000-0000-0000-0000-000000000000")
                        Package()
                        {
                            "PAGETABLEUSAGE",
                            4,                       // Number of page tables
                            "GraphicsGlobalPT",     0, 0x03030000   ,
                            "GraphicsPerProcessPT", 0, 0x03030000   ,
                            "GraphicsSecurePT",     1, 0x030A0000   ,
                            "GraphicsGmuPT",        3, 0x03030002   ,
                        },
                    },
                    Package()
                    {
                        "PERF_CONTROLS",
                        Package()
                        {                                       // CX_HS_MGMT
                            1,                                  // State Set Index
                        },
                        Package()
                        {                                        // 
                            3,                                   // State Set Index
                            Package()
                            {
                                "LimitForPassiveCooling",       // Property Name
                                0x00000001,                     // Value
                            },
                        },
                        Package()
                        {                                        // GRAPHICS_BW_CONTROL
                            4,                                   // State Set Index
                            Package()
                            {
                                "LimitForPassiveCooling",       // Property Name
                                0x00000001,                     // Value
                            },
                        },
                    },
                    Package()
                    {
                        "THERMAL_DOMAINS",
                        "GPU",
                    },
                    Package()
                    {
                        "PROPERTIES",
                        3,                        // Number of properties
                        Package()
                        {
                            "GmemBaseAddr",       // Property Name
                            0x00000000,           // Value
                        },
                        Package()
                        {
                            "GmemSize",           // Property Name
                            0x00100000,           // Value
                        },
                        Package()
                        {
                            "SMMUCount",          // Property Name
                            0x00000001,           // Value
                        },
                    },
                },
                
                Package()
                {
                    "ENGINE",
                    "MDPBLT",                     // Engine String Identifier
                    "MDP5.x",                     // Chip Family Identifier
                    2,                            // Index of Primary Power Component
                    1,                            // P-State Set Index of Footswitch override
                    0,                            // P-State Set Index of Reset
                    Package()
                    {
                        "SHAREDSMMU",
                        "ROTATOR",                // Engine whose SMMU is shared
                    },
                    Package()
                    {
                        "PERF_CONTROLS",
                        Package()
                        {                                       // MDPBLT_CORE_CLOCK_CONTROL
                            2,                                  // State Set Index
                            Package()
                            {
                                "LimitForPassiveCooling",       // Property Name
                                0x00000001,                     // Value
                            },
                        },
                        Package()
                        {                                       // MDPBLT_AXI_BANDWIDTH_CONTROL
                            3,                                  // State Set Index
                            Package()
                            {
                                "LimitForPassiveCooling",       // Property Name
                                0x00000001,                     // Value
                            },
                        },
                    },
                    Package()
                    {
                        "THERMAL_DOMAINS",
                        "GPU",
                    },
                },
                
                Package()
                {
                    "ENGINE",
                    "ROTATOR",                    // Engine String Identifier
                    "MDP5.x",                     // Chip Family Identifier
                    3,                            // Index of Primary Power Component
                    1,                            // P-State Set Index of Footswitch override
                    0,                            // P-State Set Index of Reset
                    Package()
                    {
                        "MMUINFO",
                        "Miniport",               // SMMU managed by miniport or engine
                        "ArmSmmuV2",              // SMMU Family
                        2,                        // Number of SMMU stages
                        32,                       // Address bits
                        "V7S",                    // Address format
                        "SMMUID",             ToUUID("36079AE4-78E8-452D-AF50-0CFF78B2F1CA"),
                        "SMMUINTERFACEID",    ToUUID("00000000-0000-0000-0000-000000000000"),
                        // If default the above would be:
                        //     ToUUID("00000000-0000-0000-0000-000000000000")
                        Package()
                        {
                            "PAGETABLEUSAGE",
                            2,                       // Number of page tables
                            "MdpNonSecurePT",       
                            "MdpSecurePT",          
                        },
                    },
                    Package()
                    {
                        "PERF_CONTROLS",
                        Package()
                        {                                       // ROTATOR_CORE_CLOCK_CONTROL
                            2,                                  // State Set Index
                            Package()
                            {
                                "LimitForPassiveCooling",       // Property Name
                                0x00000001,                     // Value
                            },
                        },
                        Package()
                        {                                       // ROTATOR_AXI_BANDWIDTH_CONTROL
                            3,                                  // State Set Index
                            Package()
                            {
                                "LimitForPassiveCooling",       // Property Name
                                0x00000001,                     // Value
                            },
                        },
                    },
                    Package()
                    {
                        "THERMAL_DOMAINS",
                        "GPU",
                    },
                },
                
                Package()
                {
                    "ENGINE",
                    "VIDEO",                      // Engine String Identifier
                    "Venus",                      // Chip Family Identifier
                    4,                            // Index of Primary Power Component
                    1,                            // P-State Set Index of Footswitch override
                    0,                            // P-State Set Index of Reset
                    Package()
                    {
                        "MMUINFO",
                        "Engine",                 // SMMU managed by miniport or engine
                        "ArmSmmuV2",              // SMMU Family
                        2,                        // Number of SMMU stages
                        32,                       // Address bits
                        "V7S",                    // Address format
                        "SMMUID",             ToUUID("665E0F8E-ADD3-49D1-91BC-5540C5F57FBA"),
                        "SMMUINTERFACEID",    ToUUID("1C3FC0E8-0B11-4EE0-BE89-3E21420A865F"),
                        // If default the above would be:
                        //     ToUUID("00000000-0000-0000-0000-000000000000")
                        Package()
                        {
                            "PAGETABLEUSAGE",
                            5,                       // Number of page tables
                            "VideoNonSecurePT",     
                            "VideoSecurePT1",       
                            "VideoSecurePT2",       
                            "VideoSecurePT3",       
                            "VideoSecurePT4",       
                        },
                    },
                    Package()
                    {
                        "PERF_CONTROLS",
                        Package()
                        {                                       // VIDEO_CORE_CLOCK_CONTROL
                            2,                                  // State Set Index
                        },
                        Package()
                        {                                       // VIDEO_AXI_PORT_BW
                            3,                                  // State Set Index
                        },
                    },
                    Package()
                    {
                        "THERMAL_DOMAINS",
                    },
                    Package()
                    {
                        "PROPERTIES",
                        1,                        // Number of properties
                        Package()
                        {
                            "DecMaxFps",          // Property Name
                            0x0000003C,           // Value
                        },
                    },
                },
                
                Package()
                {
                    "ENGINE",
                    "CRYPTO",                     // Engine String Identifier
                    "Crypto1.0",                  // Chip Family Identifier
                    5,                            // Index of Primary Power Component
                    1,                            // P-State Set Index of Footswitch override
                    0,                            // P-State Set Index of Reset
                    Package()
                    {
                        "MMUINFO",
                        "Miniport",               // SMMU managed by miniport or engine
                        "ArmSmmuV2",              // SMMU Family
                        2,                        // Number of SMMU stages
                        32,                       // Address bits
                        "V7S",                    // Address format
                        "SMMUID",             ToUUID("36079AE4-78E8-452D-AF50-0CFF78B2F1CA"),
                        "SMMUINTERFACEID",    ToUUID("00000000-0000-0000-0000-000000000000"),
                        // If default the above would be:
                        //     ToUUID("00000000-0000-0000-0000-000000000000")
                        Package()
                        {
                            "PAGETABLEUSAGE",
                            2,                       // Number of page tables
                            "CryptoNonSecurePT",    
                            "CryptoSecurePT",       
                        },
                    },
                    Package()
                    {
                        "PERF_CONTROLS",
                        Package()
                        {                                       // CRYPTO_CORE_CLOCK_CONTROL
                            2,                                  // State Set Index
                        },
                    },
                    Package()
                    {
                        "THERMAL_DOMAINS",
                    },
                },
                
                Package()
                {
                    "ENGINE",
                    "VIDEO_ENCODER",              // Engine String Identifier
                    "Venus",                      // Chip Family Identifier
                    6,                            // Index of Primary Power Component
                    1,                            // P-State Set Index of Footswitch override
                    0,                            // P-State Set Index of Reset
                    Package()
                    {
                        "PERF_CONTROLS",
                        Package()
                        {                                       // VIDEO_ENCODER_CORE_CLOCK_CONTROL
                            2,                                  // State Set Index
                        },
                        Package()
                        {                                       // VIDEO_ENCODER_AXI_PORT_BW
                            3,                                  // State Set Index
                        },
                    },
                    Package()
                    {
                        "THERMAL_DOMAINS",
                    },
                },
            },
            
            //------------------------------------------------------------------------------
            // Display Info Package
            // This package enumerates all resources assigned to the display.  Additionally,
            // this routine includes any display configuration data, such as hotplug
            // support.
            //------------------------------------------------------------------------------
            //
            Package()
            {
                "DISPLAYS",
                "MDP5.x",                   // Chip Family Identifier
                3,                          // Number of displays
            
                Package()
                {
                    "DISPLAY",
                    "INTERNAL1",            // Display Name
                    
                    0,                      // Index of Display Power Component
                    1,                      // P-State Set Index of Footswitch override
                    0,                      // P-State Set Index of reset
                    
                    Package()
                    {
                        "PERF_CONTROLS",
                        Package()
                        {                                        // INTERNAL1_SCAN_CONTROL
                            2,                                   // State Set Index
                        },
                        Package()
                        {                                        // INTERNAL1_CORE_CLOCK_CONTROL
                            3,                                   // State Set Index
                        },
                        Package()
                        {                                        // INTERNAL1_EBI_BANDWIDTH
                            4,                                   // State Set Index
                        },
                    },
                    Package()
                    {
                        "THERMAL_DOMAINS",
                    },
                },
                Package()
                {
                    "DISPLAY",
                    "INTERNAL2",            // Display Name
                    
                    7,                      // Index of Display Power Component
                    1,                      // P-State Set Index of Footswitch override
                    0,                      // P-State Set Index of reset
                    
                    Package()
                    {
                        "PERF_CONTROLS",
                        Package()
                        {                                        // INTERNAL2_SCAN_CONTROL
                            2,                                   // State Set Index
                        },
                        Package()
                        {                                        // INTERNAL2_CORE_CLOCK_CONTROL
                            3,                                   // State Set Index
                        },
                        Package()
                        {                                        // INTERNAL2_EBI_BANDWIDTH
                            4,                                   // State Set Index
                        },
                    },
                    Package()
                    {
                        "THERMAL_DOMAINS",
                    },
                },
                Package()
                {
                    "DISPLAY",
                    "EXTERNAL1",            // Display Name
                    
                    8,                      // Index of Display Power Component
                    1,                      // P-State Set Index of Footswitch override
                    0,                      // P-State Set Index of reset
                    
                    Package()
                    {
                        "PERF_CONTROLS",
                        Package()
                        {                                        // EXTERNAL1_CORE_CLOCK_CONTROL
                            2,                                   // State Set Index
                        },
                        Package()
                        {                                        // EXTERNAL1_EBI_BANDWIDTH
                            3,                                   // State Set Index
                        },
                    },
                    Package()
                    {
                        "THERMAL_DOMAINS",
                    },
                },
            
                Package()
                {
                    "RESOURCES",
                    Package()
                    {
                        "MMUINFO",
                        "Miniport",               // SMMU managed by miniport or engine
                        "ArmSmmuV2",              // SMMU Family
                        2,                        // Number of SMMU stages
                        32,                       // Address bits
                        "V7S",                    // Address format
                        "SMMUID",             ToUUID("36079AE4-78E8-452D-AF50-0CFF78B2F1CA"),
                        "SMMUINTERFACEID",    ToUUID("00000000-0000-0000-0000-000000000000"),
                        // If default the above would be:
                        //     ToUUID("00000000-0000-0000-0000-000000000000")
                        Package()
                        {
                            "PAGETABLEUSAGE",
                            2,                       // Number of page tables
                            "MdpNonSecurePT",       
                            "MdpSecurePT",          
                        },
                    },
                },
                Package()
                {
                    "PRIMARY_SOURCE_MODES",
                    32,                           // Number of Primary source modes
                    Package()
                    {
                        640,                      // Width
                        480,                      // Height
                    },
                    Package()
                    {
                        640,                      // Width
                        360,                      // Height
                    },
                    Package()
                    {
                        800,                      // Width
                        600,                      // Height
                    },
                    Package()
                    {
                        960,                      // Width
                        540,                      // Height
                    },
                    Package()
                    {
                        1280,                     // Width
                        720,                      // Height
                    },
                    Package()
                    {
                        1280,                     // Width
                        1080,                     // Height
                    },
                    Package()
                    {
                        1024,                     // Width
                        768,                      // Height
                    },
                    Package()
                    {
                        1152,                     // Width
                        768,                      // Height
                    },
                    Package()
                    {
                        1280,                     // Width
                        768,                      // Height
                    },
                    Package()
                    {
                        1360,                     // Width
                        768,                      // Height
                    },
                    Package()
                    {
                        1366,                     // Width
                        768,                      // Height
                    },
                    Package()
                    {
                        1600,                     // Width
                        900,                      // Height
                    },
                    Package()
                    {
                        1280,                     // Width
                        1024,                     // Height
                    },
                    Package()
                    {
                        1920,                     // Width
                        1080,                     // Height
                    },
                    Package()
                    {
                        1920,                     // Width
                        1200,                     // Height
                    },
                    Package()
                    {
                        1920,                     // Width
                        1280,                     // Height
                    },
                    Package()
                    {
                        2048,                     // Width
                        1080,                     // Height
                    },
                    Package()
                    {
                        2048,                     // Width
                        1152,                     // Height
                    },
                    Package()
                    {
                        2048,                     // Width
                        1536,                     // Height
                    },
                    Package()
                    {
                        2560,                     // Width
                        1080,                     // Height
                    },
                    Package()
                    {
                        2560,                     // Width
                        1600,                     // Height
                    },
                    Package()
                    {
                        2560,                     // Width
                        1440,                     // Height
                    },
                    Package()
                    {
                        2560,                     // Width
                        2048,                     // Height
                    },
                    Package()
                    {
                        3200,                     // Width
                        1800,                     // Height
                    },
                    Package()
                    {
                        3200,                     // Width
                        2400,                     // Height
                    },
                    Package()
                    {
                        3200,                     // Width
                        2048,                     // Height
                    },
                    Package()
                    {
                        3440,                     // Width
                        1440,                     // Height
                    },
                    Package()
                    {
                        3840,                     // Width
                        1080,                     // Height
                    },
                    Package()
                    {
                        3840,                     // Width
                        1600,                     // Height
                    },
                    Package()
                    {
                        3840,                     // Width
                        2400,                     // Height
                    },
                    Package()
                    {
                        3840,                     // Width
                        2160,                     // Height
                    },
                    Package()
                    {
                        4096,                     // Width
                        2160,                     // Height
                    },
                },
            },
            
            //------------------------------------------------------------------------------
            // Page Table List
            // This package enumerates all of the page tables used by any of the displays
            // and engines. Page tables defined here may be referenced by one or more engine
            // or display.
            //------------------------------------------------------------------------------
            //
            Package()
            {
                "PAGETABLES",
                13,                         // Number of page tables
                Package()
                {
                    "GraphicsGlobalPT",           // Name
                    1,                            // Global
                    0,                            // Secure
                    1,                            // HighTTBR
                    1,                            // HiddenFromOS
                    0x8000000000,                 // VaStart
                    0x800000000,                  // VaSizeBytes
                },
                Package()
                {
                    "GraphicsPerProcessPT",       // Name
                    0,                            // Global
                    0,                            // Secure
                    0,                            // HighTTBR
                    0,                            // HiddenFromOS
                    0x00400000,                   // VaStart
                    0x7FFFC00000,                 // VaSizeBytes
                },
                Package()
                {
                    "GraphicsSecurePT",           // Name
                    0,                            // Global
                    1,                            // Secure
                    0,                            // HighTTBR
                    1,                            // HiddenFromOS
                    0x8800000000,                 // VaStart
                    0xC0000000,                   // VaSizeBytes
                },
                Package()
                {
                    "GraphicsGmuPT",              // Name
                    0,                            // Global
                    0,                            // Secure
                    0,                            // HighTTBR
                    0,                            // HiddenFromOS
                    0x60000000,                   // VaStart
                    0x20000000,                   // VaSizeBytes
                },
                Package()
                {
                    "MdpNonSecurePT",             // Name
                    0,                            // Global
                    0,                            // Secure
                    0,                            // HighTTBR
                    0,                            // HiddenFromOS
                    0x40100000,                   // VaStart
                    0xBFF00000,                   // VaSizeBytes
                },
                Package()
                {
                    "MdpSecurePT",                // Name
                    0,                            // Global
                    1,                            // Secure
                    0,                            // HighTTBR
                    1,                            // HiddenFromOS
                    0x80000000,                   // VaStart
                    0x80000000,                   // VaSizeBytes
                },
                Package()
                {
                    "VideoNonSecurePT",           // Name
                    0,                            // Global
                    0,                            // Secure
                    0,                            // HighTTBR
                    1,                            // HiddenFromOS
                    0x00100000,                   // VaStart
                    0xBFF00000,                   // VaSizeBytes
                    0x0000001B,                   // VideoBufferMask
                    0,                            // VideoCBIndex
                },
                Package()
                {
                    "VideoSecurePT1",             // Name
                    0,                            // Global
                    1,                            // Secure
                    0,                            // HighTTBR
                    1,                            // HiddenFromOS
                    0xC0000000,                   // VaStart
                    0x10000000,                   // VaSizeBytes
                    0x00000009,                   // VideoBufferMask
                    1,                            // VideoCBIndex
                },
                Package()
                {
                    "VideoSecurePT2",             // Name
                    0,                            // Global
                    1,                            // Secure
                    0,                            // HighTTBR
                    1,                            // HiddenFromOS
                    0xD0000000,                   // VaStart
                    0x10000000,                   // VaSizeBytes
                    0x00000007,                   // VideoBufferMask
                    2,                            // VideoCBIndex
                },
                Package()
                {
                    "VideoSecurePT3",             // Name
                    0,                            // Global
                    1,                            // Secure
                    0,                            // HighTTBR
                    1,                            // HiddenFromOS
                    0xE0000000,                   // VaStart
                    0x10000000,                   // VaSizeBytes
                    0x00000002,                   // VideoBufferMask
                    3,                            // VideoCBIndex
                },
                Package()
                {
                    "VideoSecurePT4",             // Name
                    0,                            // Global
                    1,                            // Secure
                    0,                            // HighTTBR
                    1,                            // HiddenFromOS
                    0xF0000000,                   // VaStart
                    0x10000000,                   // VaSizeBytes
                    0x0000002A,                   // VideoBufferMask
                    4,                            // VideoCBIndex
                },
                Package()
                {
                    "CryptoNonSecurePT",          // Name
                    0,                            // Global
                    0,                            // Secure
                    0,                            // HighTTBR
                    0,                            // HiddenFromOS
                    0x00100000,                   // VaStart
                    0x7FF00000,                   // VaSizeBytes
                },
                Package()
                {
                    "CryptoSecurePT",             // Name
                    0,                            // Global
                    1,                            // Secure
                    0,                            // HighTTBR
                    1,                            // HiddenFromOS
                    0x80000000,                   // VaStart
                    0x80000000,                   // VaSizeBytes
                },
            },
        })
        
        Return (EBUF)
    }
    
    //------------------------------------------------------------------------------
    // Graphics Thermal Management Details
    //------------------------------------------------------------------------------
    //
    Method (TMDT)
    {
        Name (RBUF, Package()
        {
            1,        // Table Format Major Version
            0,        // Table Format Minor Version
            
            // Thermal Domain Definitions
            //
            Package()
            {
                "THERMAL_DOMAINS",
                1,    // Num Thermal Domains
                
                //                          Thermal Zone
                //          Domain Name    Interface Name  Endpoints
                //          -------------  --------------  -----------------------
                Package() { "GPU",         "GPU0",         Package() { "GRAPHICS", "MDPBLT", "ROTATOR", } },
            }
        })
        
        Return (RBUF)
    }
    
    //------------------------------------------------------------------------------
    // Graphics PEP Component List
    // This method is a companion method to the graphics entries inside PEP's DCFG
    // method.  It includes the same components, generated from a single XML source,
    // with any additional information required to be passed to dxgkrnl.
    //------------------------------------------------------------------------------
    //
    Method (PMCL)
    {
        Name (RBUF, Package()
        {
            3,    // Table Format Major Version
            1,    // Table Format Minor Version
            10,   // Number of power components
            
            //----------------------------------------------------------------------------------
            //  C0 - Internal (Primary) Display Power States
            //----------------------------------------------------------------------------------
            //
            Package()
            {
                "COMPONENT",
                0,                                                      // Component Index
                Buffer()
                {
                    0x91, 0x59, 0x13, 0x2C, 0x91, 0x43, 0x33, 0x46,     // GUID: {2C135991-4391-4633-90B1-FA96F2E2CC04}
                    0x90, 0xB1, 0xFA, 0x96, 0xF2, 0xE2, 0xCC, 0x04
                },
            
                "PRIMDISPLAY_POWER_STATES",                             // Common Name
                "HW_BLOCK_MDP",                                         // Hw Block associated with this component
            
                Package()
                {
                    "DISPLAY",                                          // Dxgkrnl Component Type
                    "INTERNAL1",
                },
            
                2,                                                      // Number of F-States
                5,                                                      // Number of P-State Sets
            
                //                          Logical     Transition   Residency   Nominal
                //                    ID   Power State   Latency    Requirement   Power
                //                    ---  -----------  ----------  -----------  -------
                Package() { "FSTATE",  0,    "ALL_ON",          0,           0,       2  },
                Package() { "FSTATE",  1,   "PWR_OFF",          1,           1,       1  },
                
                //----------------------------------------------------------------------------------
                // C0.PS0 - Internal (Primary) Display: MDP Reset Control
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    0,                                                   // P-State Set Index
                    "INTERNAL1_RESET",            
                    "*",                                                 // HW Revisions
                    "RESET",                                             // Resource Type
                    2,                                                   // Num P-States in Set
                    0,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,            1,     2 },   // Do Nothing
                    Package() { "PSTATE",   1,            0,     2 },   // Reset Display Core
                },
                
                //----------------------------------------------------------------------------------
                // C0.PS1 - Internal Display: MDP Footswitch override
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    1,                                                   // P-State Set Index
                    "INTERNAL1_FOOTSWITCH_OVERRIDE",
                    "*",                                                 // HW Revisions
                    "FOOTSWITCH_OVERRIDE",                               // Resource Type
                    2,                                                   // Num P-States in Set
                    0xFFFFFFFF,                                          // Initial P-State (i.e. none)
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,            1,     2 },   // Footswitch On
                    Package() { "PSTATE",   1,            0,     2 },   // Footswitch Off
                },
                
                //----------------------------------------------------------------------------------
                // C0.PS2 - Internal (Primary) Display: Power states for MDP scan-out HW
                //
                // @Brief:
                // - Used to dynamically control MDP related clocks within a PState
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    2,                                                   // P-State Set Index
                    "INTERNAL1_SCAN_CONTROL",     
                    "*",                                                 // HW Revisions
                    "DISPLAY_SOURCE_SCAN_CTRL",                           // Resource Type
                    5,                                                   // Num P-States in Set
                    0,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,            4,     2 },   // Vote for all scan-out resources
                    Package() { "PSTATE",   1,            3,     2 },   // Vote for only MDP, DSI 0 and DSI 1 scan-out resources
                    Package() { "PSTATE",   2,            2,     2 },   // Vote for only MDP and DSI 0 scan-out resources
                    Package() { "PSTATE",   3,            1,     2 },   // Vote for only MDP and DSI 1 scan-out resources
                    Package() { "PSTATE",   4,            0,     2 },   // Remove votes for all scan-out resources
                },
                
                //----------------------------------------------------------------------------------
                // C0.PS3 - Internal (Primary) Display: MDP Core Clock Frequency
                //
                // @Brief:
                // Notes:
                // - This table reflects the frequency plan for the v1 part.
                // - All core frequency votes are based on specific clock plan values and are cast
                //   2 MHz below what we actually desire. This helps avoid potential issues with
                //   round-up when the actual clock frequency on real HW is slightly less than
                //   that which was advertized in the clock plan.
                // - [NC] Temporarily moved all AHB bandwidth votes to F-states to help work around
                //   64K size issue in the final AML.
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    3,                                                   // P-State Set Index
                    "INTERNAL1_CORE_CLOCK_CONTROL",
                    "*",                                                 // HW Revisions
                    "CORE_CLOCK",                                        // Resource Type
                    13,                                                  // Num P-States in Set
                    4,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,    430000000,     1 },
                    Package() { "PSTATE",   1,    412500000,     1 },
                    Package() { "PSTATE",   2,    344000000,     2 },
                    Package() { "PSTATE",   3,    300000000,     2 },
                    Package() { "PSTATE",   4,    275000000,     2 },
                    Package() { "PSTATE",   5,    200000000,     2 },
                    Package() { "PSTATE",   6,    171428571,     3 },
                    Package() { "PSTATE",   7,    165000000,     3 },
                    Package() { "PSTATE",   8,    150000000,     3 },
                    Package() { "PSTATE",   9,    100000000,     3 },
                    Package() { "PSTATE",  10,     85710000,     3 },
                    Package() { "PSTATE",  11,     19200000,     3 },
                    Package() { "PSTATE",  12,            0,     3 },
                },
                
                //----------------------------------------------------------------------------------
                // C0.PS4 - Internal (Primary) Display: Display Bandwidth to EBI
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    4,                                                   // P-State Set Index
                    "INTERNAL1_EBI_BANDWIDTH",    
                    "*",                                                 // HW Revisions
                    "BANDWIDTH",                                         // Resource Type
                    43,                                                  // Num P-States in Set
                    28,                                                  // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,   13326000000,     0 },
                    Package() { "PSTATE",   1,   12926000000,     0 },
                    Package() { "PSTATE",   2,   12526000000,     0 },
                    Package() { "PSTATE",   3,   12126000000,     0 },
                    Package() { "PSTATE",   4,   11726000000,     0 },
                    Package() { "PSTATE",   5,   11326000000,     0 },
                    Package() { "PSTATE",   6,   10926000000,     0 },
                    Package() { "PSTATE",   7,   10526000000,     0 },
                    Package() { "PSTATE",   8,   10126000000,     1 },
                    Package() { "PSTATE",   9,   9600000000,     1 },
                    Package() { "PSTATE",  10,   9200000000,     1 },
                    Package() { "PSTATE",  11,   8800000000,     1 },
                    Package() { "PSTATE",  12,   8400000000,     1 },
                    Package() { "PSTATE",  13,   8000000000,     1 },
                    Package() { "PSTATE",  14,   7600000000,     1 },
                    Package() { "PSTATE",  15,   7200000000,     1 },
                    Package() { "PSTATE",  16,   6800000000,     1 },
                    Package() { "PSTATE",  17,   6400000000,     1 },
                    Package() { "PSTATE",  18,   6000000000,     1 },
                    Package() { "PSTATE",  19,   5600000000,     1 },
                    Package() { "PSTATE",  20,   5200000000,     2 },
                    Package() { "PSTATE",  21,   4800000000,     2 },
                    Package() { "PSTATE",  22,   4400000000,     2 },
                    Package() { "PSTATE",  23,   4000000000,     2 },
                    Package() { "PSTATE",  24,   3600000000,     2 },
                    Package() { "PSTATE",  25,   3200000000,     2 },
                    Package() { "PSTATE",  26,   2800000000,     2 },
                    Package() { "PSTATE",  27,   2400000000,     2 },
                    Package() { "PSTATE",  28,   2000000000,     2 },
                    Package() { "PSTATE",  29,   1600000000,     2 },
                    Package() { "PSTATE",  30,   1500000000,     2 },
                    Package() { "PSTATE",  31,   1400000000,     2 },
                    Package() { "PSTATE",  32,   1300000000,     2 },
                    Package() { "PSTATE",  33,   1200000000,     2 },
                    Package() { "PSTATE",  34,   1100000000,     2 },
                    Package() { "PSTATE",  35,   1000000000,     2 },
                    Package() { "PSTATE",  36,    900000000,     2 },
                    Package() { "PSTATE",  37,    800000000,     2 },
                    Package() { "PSTATE",  38,    700000000,     2 },
                    Package() { "PSTATE",  39,    600000000,     2 },
                    Package() { "PSTATE",  40,    500000000,     2 },
                    Package() { "PSTATE",  41,    400000000,     2 },
                    Package() { "PSTATE",  42,            0,     2 },
                },
                
                
            },
            
            //----------------------------------------------------------------------------------
            //  C1 - 3D Graphics Engine Power States
            //----------------------------------------------------------------------------------
            //
            Package()
            {
                "COMPONENT",
                1,                                                      // Component Index
                Buffer()
                {
                    0xB5, 0xF1, 0xBD, 0x30, 0xF7, 0x28, 0x0C, 0x4C,     // GUID: {30BDF1B5-28F7-4C0C-AC47-273DD1401E11}
                    0xAC, 0x47, 0x27, 0x3D, 0xD1, 0x40, 0x1E, 0x11
                },
            
                "GRAPHICS_POWER_STATES",                                // Common Name
                "HW_BLOCK_GRAPHICS",                                    // Hw Block associated with this component
            
                Package()
                {
                    "ENGINE",                                           // Dxgkrnl Component Type
                    "GRAPHICS",
                },
            
                3,                                                      // Number of F-States
                5,                                                      // Number of P-State Sets
            
                //                          Logical     Transition   Residency   Nominal
                //                    ID   Power State   Latency    Requirement   Power
                //                    ---  -----------  ----------  -----------  -------
                Package() { "FSTATE",  0,    "ALL_ON",          0,           0,       3  },
                Package() { "FSTATE",  1,   "PWR_OFF",      10000,          10,       2  },
                Package() { "FSTATE",  2,   "PWR_OFF",      10001,          10,       1  },
                
                //----------------------------------------------------------------------------------
                // C1.PS0 - 3D Graphics Core P-State Set: Reset
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    0,                                                   // P-State Set Index
                    "GRAPHICS_RESET",             
                    "*",                                                 // HW Revisions
                    "RESET",                                             // Resource Type
                    2,                                                   // Num P-States in Set
                    0,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,            1,     2 },   // Do Nothing
                    Package() { "PSTATE",   1,            0,     2 },   // Reset Graphics Core
                },
                
                //----------------------------------------------------------------------------------
                // C1.PS1 - 3D Graphics Core P-State Set: CX Headswitch Management
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    1,                                                   // P-State Set Index
                    "CX_HS_MGMT",                 
                    "*",                                                 // HW Revisions
                    "INTERNAL",                                          // Resource Type
                    3,                                                   // Num P-States in Set
                    0,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,            2,     2 },   // Do Nothing
                    Package() { "PSTATE",   1,            1,     2 },   // CX Headswitch On
                    Package() { "PSTATE",   2,            0,     2 },   // CX Headswitch Off
                },
                
                //----------------------------------------------------------------------------------
                // C1.PS2 - 3D Graphics Core P-State Set: Footswitch override
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    2,                                                   // P-State Set Index
                    "GRAPHICS_FOOTSWITCH_OVERRIDE",
                    "*",                                                 // HW Revisions
                    "FOOTSWITCH_OVERRIDE",                               // Resource Type
                    2,                                                   // Num P-States in Set
                    1,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,            1,     2 },   // Footswitch On
                    Package() { "PSTATE",   1,            0,     2 },   // Footswitch Off
                },
                
                
                //----------------------------------------------------------------------------------
                // C1.PS3
                //     << Placeholder for runtime patches: P001, P002 >>
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "ENGINE_PSTATE_SET",
                    3,
                },
                
                //----------------------------------------------------------------------------------
                // C1.PS4 - 3D Graphics Core P-State Set: Bus 850
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "ENGINE_PSTATE_SET",
                    4, 
                    "GRAPHICS_BW_CONTROL",        
                    "BANDWIDTH",                                         // Resource Type
                    13,                                                  // Num P-States in Set
                    0,                                                   // Num CustomData fields in Set
                    TRUE,                                                // Has Thermal Thresholds
                    4,                                                   // Initial P-State
                    3,                                                   // Stable Power P-State
                
                    //                                        Voltage
                    //                     ID       Value      Level   Thermal Thresholds
                    //                     ---    ----------   -----   --------------------
                    Package() { "PSTATE",   0,   7216000000,    384,    Package() { "GPU", 100, } },
                    Package() { "PSTATE",   1,   6220000000,    256,    Package() { "GPU",  86, } },
                    Package() { "PSTATE",   2,   5184000000,    256,    Package() { "GPU",  72, } },
                    Package() { "PSTATE",   3,   4068000000,    192,    Package() { "GPU",  56, } },
                    Package() { "PSTATE",   4,   3072000000,    128,    Package() { "GPU",  42, } },
                    Package() { "PSTATE",   5,   2724000000,    128,    Package() { "GPU",  38, } },
                    Package() { "PSTATE",   6,   2188000000,    128,    Package() { "GPU",  30, } },
                    Package() { "PSTATE",   7,   1648000000,    64,    Package() { "GPU",  23, } },
                    Package() { "PSTATE",   8,   1200000000,    48,    Package() { "GPU",  17, } },
                    Package() { "PSTATE",   9,    800000000,    48,    Package() { "GPU",  11, } },
                    Package() { "PSTATE",  10,    600000000,    48,    Package() { "GPU",   8, } },
                    Package() { "PSTATE",  11,    400000000,    48,    Package() { "GPU",   0, } },
                    Package() { "PSTATE",  12,            0,     0,    Package() { "GPU",   0, } },
                },
                
            },
            
            //----------------------------------------------------------------------------------
            //  C2 - MDP BLT Engine Power States
            //----------------------------------------------------------------------------------
            //
            Package()
            {
                "COMPONENT",
                2,                                                      // Component Index
                Buffer()
                {
                    0xDD, 0x2A, 0xCA, 0x07, 0x87, 0xDF, 0xE1, 0x49,     // GUID: {07CA2ADD-DF87-49E1-8583-08687DC81C8E}
                    0x85, 0x83, 0x08, 0x68, 0x7D, 0xC8, 0x1C, 0x8E
                },
            
                "MDPBLT_POWER_STATES",                                  // Common Name
                "HW_BLOCK_MDP",                                         // Hw Block associated with this component
            
                Package()
                {
                    "ENGINE",                                           // Dxgkrnl Component Type
                    "MDPBLT",
                },
            
                3,                                                      // Number of F-States
                4,                                                      // Number of P-State Sets
            
                //                          Logical     Transition   Residency   Nominal
                //                    ID   Power State   Latency    Requirement   Power
                //                    ---  -----------  ----------  -----------  -------
                Package() { "FSTATE",  0,    "ALL_ON",          0,           0,       3  },
                Package() { "FSTATE",  1,   "CLK_OFF",      10000,           0,       2  },
                Package() { "FSTATE",  2,   "PWR_OFF",     100000,           0,       1  },
                
                //----------------------------------------------------------------------------------
                // C2.PS0 - MDP BLT Core P-State Set: Reset
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    0,                                                   // P-State Set Index
                    "MDPBLT_RESET",               
                    "*",                                                 // HW Revisions
                    "RESET",                                             // Resource Type
                    2,                                                   // Num P-States in Set
                    0,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,            1,     2 },   // Do Nothing
                    Package() { "PSTATE",   1,            0,     2 },   // Reset Display Core
                },
                
                //----------------------------------------------------------------------------------
                // C2.PS1 - MDP BLT Core P-State Set: Footswitch override
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    1,                                                   // P-State Set Index
                    "MDPBLT_FOOTSWITCH_OVERRIDE", 
                    "*",                                                 // HW Revisions
                    "FOOTSWITCH_OVERRIDE",                               // Resource Type
                    2,                                                   // Num P-States in Set
                    0xFFFFFFFF,                                          // Initial P-State (i.e. none)
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,            1,     2 },   // Footswitch On
                    Package() { "PSTATE",   1,            0,     2 },   // Footswitch Off
                },
                
                //----------------------------------------------------------------------------------
                // C2.PS2 - MDP Core Performance: Core Clock Frequency
                //
                // @Brief:
                // Notes:
                // - All core frequency votes are based on specific clock plan values and are cast
                //   2 MHz below what we actually desire.  This helps avoid potential issues with
                //   round-up when the actual clock frequency on real HW is slightly less than
                //   that which was advertized in the clock plan.
                // - [NC] Temporarily moved all AHB bandwidth votes to F-states to help work around
                //   64K size issue in the final AML.
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    2,                                                   // P-State Set Index
                    "MDPBLT_CORE_CLOCK_CONTROL",  
                    "*",                                                 // HW Revisions
                    "CORE_CLOCK",                                        // Resource Type
                    13,                                                  // Num P-States in Set
                    8,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level   Thermal Thresholds
                    //                     ---    ----------   -----   --------------------
                    Package() { "PSTATE",   0,    430000000,     1,    Package() { "GPU", 100, } },
                    Package() { "PSTATE",   1,    412500000,     1,    Package() { "GPU", 100, } },
                    Package() { "PSTATE",   2,    344000000,     2,    Package() { "GPU",  66, } },
                    Package() { "PSTATE",   3,    300000000,     2,    Package() { "GPU",  66, } },
                    Package() { "PSTATE",   4,    275000000,     2,    Package() { "GPU",  66, } },
                    Package() { "PSTATE",   5,    200000000,     2,    Package() { "GPU",  66, } },
                    Package() { "PSTATE",   6,    171428571,     3,    Package() { "GPU",  33, } },
                    Package() { "PSTATE",   7,    165000000,     3,    Package() { "GPU",  33, } },
                    Package() { "PSTATE",   8,    150000000,     3,    Package() { "GPU",  33, } },
                    Package() { "PSTATE",   9,    100000000,     3,    Package() { "GPU",  33, } },
                    Package() { "PSTATE",  10,     85710000,     3,    Package() { "GPU",   0, } },
                    Package() { "PSTATE",  11,     19200000,     3,    Package() { "GPU",   0, } },
                    Package() { "PSTATE",  12,            0,     3,    Package() { "GPU",   0, } },
                },
                
                //----------------------------------------------------------------------------------
                // C2.PS3 - MDP Core Performance: MDPBLT Bandwidth to EBI
                //
                // @Brief:
                // Note (TODO: Update this comment):
                // - AXI port 1 is strictly used by the BLT engine.  The BLT engine will have definite
                //   modes of operation based on surface sizes and refresh rates.  Instead of bothering
                //   to identify all possible modes, however, we simply build a table based on the
                //   possible combination of frequency levels between the core and EBI.  With
                //   arbitrated and instantaneous bandwidth requests, these frequency levels represent
                //   all of the possible system configurations that can result from any request.
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    3,                                                   // P-State Set Index
                    "MDPBLT_AXI_BANDWIDTH_CONTROL",
                    "*",                                                 // HW Revisions
                    "BANDWIDTH",                                         // Resource Type
                    50,                                                  // Num P-States in Set
                    0xFFFFFFFF,                                          // Initial P-State (i.e. none)
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level   Thermal Thresholds
                    //                     ---    ----------   -----   --------------------
                    Package() { "PSTATE",   0,   13326000000,     0,    Package() { "GPU", 100, } },
                    Package() { "PSTATE",   1,   12926000000,     0,    Package() { "GPU", 100, } },
                    Package() { "PSTATE",   2,   12526000000,     0,    Package() { "GPU", 100, } },
                    Package() { "PSTATE",   3,   12126000000,     0,    Package() { "GPU", 100, } },
                    Package() { "PSTATE",   4,   11726000000,     0,    Package() { "GPU", 100, } },
                    Package() { "PSTATE",   5,   11326000000,     0,    Package() { "GPU", 100, } },
                    Package() { "PSTATE",   6,   10926000000,     0,    Package() { "GPU", 100, } },
                    Package() { "PSTATE",   7,   10526000000,     0,    Package() { "GPU", 100, } },
                    Package() { "PSTATE",   8,   10126000000,     1,    Package() { "GPU", 100, } },
                    Package() { "PSTATE",   9,   9726000000,     1,    Package() { "GPU",  75, } },
                    Package() { "PSTATE",  10,   9326000000,     1,    Package() { "GPU",  75, } },
                    Package() { "PSTATE",  11,   8926000000,     1,    Package() { "GPU",  75, } },
                    Package() { "PSTATE",  12,   8526000000,     1,    Package() { "GPU",  75, } },
                    Package() { "PSTATE",  13,   8126000000,     1,    Package() { "GPU",  75, } },
                    Package() { "PSTATE",  14,   7726000000,     1,    Package() { "GPU",  75, } },
                    Package() { "PSTATE",  15,   7326000000,     1,    Package() { "GPU",  75, } },
                    Package() { "PSTATE",  16,   6926000000,     1,    Package() { "GPU",  50, } },
                    Package() { "PSTATE",  17,   6526000000,     1,    Package() { "GPU",  50, } },
                    Package() { "PSTATE",  18,   6126000000,     1,    Package() { "GPU",  50, } },
                    Package() { "PSTATE",  19,   5726000000,     1,    Package() { "GPU",  50, } },
                    Package() { "PSTATE",  20,   5326000000,     2,    Package() { "GPU",  50, } },
                    Package() { "PSTATE",  21,   4926000000,     2,    Package() { "GPU",  50, } },
                    Package() { "PSTATE",  22,   4526000000,     2,    Package() { "GPU",  50, } },
                    Package() { "PSTATE",  23,   4126000000,     2,    Package() { "GPU",  50, } },
                    Package() { "PSTATE",  24,   3726000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  25,   3326000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  26,   2926000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  27,   2526000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  28,   2400000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  29,   2300000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  30,   2200000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  31,   2100000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  32,   2000000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  33,   1900000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  34,   1800000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  35,   1700000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  36,   1600000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  37,   1500000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  38,   1400000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  39,   1300000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  40,   1200000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  41,   1100000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  42,   1000000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  43,    900000000,     2,    Package() { "GPU",   0, } },
                    Package() { "PSTATE",  44,    800000000,     2,    Package() { "GPU",   0, } },
                    Package() { "PSTATE",  45,    700000000,     2,    Package() { "GPU",   0, } },
                    Package() { "PSTATE",  46,    600000000,     2,    Package() { "GPU",   0, } },
                    Package() { "PSTATE",  47,    500000000,     2,    Package() { "GPU",   0, } },
                    Package() { "PSTATE",  48,    400000000,     2,    Package() { "GPU",   0, } },
                    Package() { "PSTATE",  49,            0,     2,    Package() { "GPU",   0, } },
                },
                
                
            },
            
            //----------------------------------------------------------------------------------
            //  C3 - Rotator Engine Power States
            //----------------------------------------------------------------------------------
            //
            Package()
            {
                "COMPONENT",
                3,                                                      // Component Index
                Buffer()
                {
                    0xF5, 0xFB, 0x5F, 0x4D, 0x91, 0xD7, 0xCD, 0x41,     // GUID: {4D5FFBF5-D791-41CD-89CB-0154129BA607}
                    0x89, 0xCB, 0x01, 0x54, 0x12, 0x9B, 0xA6, 0x07
                },
            
                "ROTATOR_POWER_STATES",                                 // Common Name
                "HW_BLOCK_ROTATOR",                                     // Hw Block associated with this component
            
                Package()
                {
                    "ENGINE",                                           // Dxgkrnl Component Type
                    "ROTATOR",
                },
            
                3,                                                      // Number of F-States
                4,                                                      // Number of P-State Sets
            
                //                          Logical     Transition   Residency   Nominal
                //                    ID   Power State   Latency    Requirement   Power
                //                    ---  -----------  ----------  -----------  -------
                Package() { "FSTATE",  0,    "ALL_ON",          0,           0,       3  },
                Package() { "FSTATE",  1,   "CLK_OFF",      10000,           0,       2  },
                Package() { "FSTATE",  2,   "PWR_OFF",     100000,           0,       1  },
                
                //----------------------------------------------------------------------------------
                // C3.PS0 - Rotator Core P-State Set: Reset
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    0,                                                   // P-State Set Index
                    "ROTATOR_RESET",              
                    "*",                                                 // HW Revisions
                    "RESET",                                             // Resource Type
                    2,                                                   // Num P-States in Set
                    0,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,            1,     2 },   // Do Nothing
                    Package() { "PSTATE",   1,            0,     2 },   // Reset MDP Core
                },
                
                //----------------------------------------------------------------------------------
                // C3.PS1 - Rotator Core P-State Set: Footswitch override
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    1,                                                   // P-State Set Index
                    "ROTATOR_FOOTSWITCH_OVERRIDE",
                    "*",                                                 // HW Revisions
                    "FOOTSWITCH_OVERRIDE",                               // Resource Type
                    2,                                                   // Num P-States in Set
                    0xFFFFFFFF,                                          // Initial P-State (i.e. none)
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,            1,     2 },   // Footswitch On
                    Package() { "PSTATE",   1,            0,     2 },   // Footswitch Off
                },
                
                //----------------------------------------------------------------------------------
                // C3.PS2 - Rotator Core P-State Set: Rotator Core Clock Frequency
                //
                // @Brief:
                // Notes:
                // - All core frequency votes are based on specific clock plan values and are cast
                //   2 MHz below what we actually desire.  This helps avoid potential issues with
                //   round-up when the actual clock frequency on real HW is slightly less than
                //   that which was advertised in the clock plan.
                // - This table reflects the frequency plans for the v1 and v2 parts.
                // - [NC] Temporarily moved all AHB bandwidth votes to F-states to help work around
                //   64K size issue in the final AML.
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    2,                                                   // P-State Set Index
                    "ROTATOR_CORE_CLOCK_CONTROL", 
                    "*",                                                 // HW Revisions
                    "CORE_CLOCK",                                        // Resource Type
                    8,                                                   // Num P-States in Set
                    5,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level   Thermal Thresholds
                    //                     ---    ----------   -----   --------------------
                    Package() { "PSTATE",   0,    430000000,     1,    Package() { "GPU", 100, } },
                    Package() { "PSTATE",   1,    412500000,     1,    Package() { "GPU", 100, } },
                    Package() { "PSTATE",   2,    344000000,     2,    Package() { "GPU",  66, } },
                    Package() { "PSTATE",   3,    300000000,     2,    Package() { "GPU",  66, } },
                    Package() { "PSTATE",   4,    171428571,     3,    Package() { "GPU",  33, } },
                    Package() { "PSTATE",   5,    165000000,     3,    Package() { "GPU",  33, } },
                    Package() { "PSTATE",   6,     19200000,     3,    Package() { "GPU",   0, } },
                    Package() { "PSTATE",   7,            0,     3,    Package() { "GPU",   0, } },
                },
                
                //----------------------------------------------------------------------------------
                // C3.PS3 - Rotator Core P-State Set: Rotator Bandwidth to EBI
                //
                // @Brief:
                // Note (TODO - Update comment):
                // - AXI port 1 is strictly used by the BLT engine.  The BLT engine will have definite
                //   modes of operation based on surface sizes and refresh rates.  Instead of bothering
                //   to identify all possible modes, however, we simply build a table based on the
                //   possible combination of frequency levels between the core and EBI.  With
                //   arbitrated and instantaneous bandwidth requests, these frequency levels represent
                //   all of the possible system configurations that can result from any request.
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    3,                                                   // P-State Set Index
                    "ROTATOR_AXI_BANDWIDTH_CONTROL",
                    "*",                                                 // HW Revisions
                    "BANDWIDTH",                                         // Resource Type
                    50,                                                  // Num P-States in Set
                    0xFFFFFFFF,                                          // Initial P-State (i.e. none)
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level   Thermal Thresholds
                    //                     ---    ----------   -----   --------------------
                    Package() { "PSTATE",   0,   13326000000,     0,    Package() { "GPU", 100, } },
                    Package() { "PSTATE",   1,   12926000000,     0,    Package() { "GPU", 100, } },
                    Package() { "PSTATE",   2,   12526000000,     0,    Package() { "GPU", 100, } },
                    Package() { "PSTATE",   3,   12126000000,     0,    Package() { "GPU", 100, } },
                    Package() { "PSTATE",   4,   11726000000,     0,    Package() { "GPU", 100, } },
                    Package() { "PSTATE",   5,   11326000000,     0,    Package() { "GPU", 100, } },
                    Package() { "PSTATE",   6,   10926000000,     0,    Package() { "GPU", 100, } },
                    Package() { "PSTATE",   7,   10526000000,     0,    Package() { "GPU", 100, } },
                    Package() { "PSTATE",   8,   10126000000,     1,    Package() { "GPU", 100, } },
                    Package() { "PSTATE",   9,   9726000000,     1,    Package() { "GPU",  75, } },
                    Package() { "PSTATE",  10,   9326000000,     1,    Package() { "GPU",  75, } },
                    Package() { "PSTATE",  11,   8926000000,     1,    Package() { "GPU",  75, } },
                    Package() { "PSTATE",  12,   8526000000,     1,    Package() { "GPU",  75, } },
                    Package() { "PSTATE",  13,   8126000000,     1,    Package() { "GPU",  75, } },
                    Package() { "PSTATE",  14,   7726000000,     1,    Package() { "GPU",  75, } },
                    Package() { "PSTATE",  15,   7326000000,     1,    Package() { "GPU",  75, } },
                    Package() { "PSTATE",  16,   6926000000,     1,    Package() { "GPU",  50, } },
                    Package() { "PSTATE",  17,   6526000000,     1,    Package() { "GPU",  50, } },
                    Package() { "PSTATE",  18,   6126000000,     1,    Package() { "GPU",  50, } },
                    Package() { "PSTATE",  19,   5726000000,     1,    Package() { "GPU",  50, } },
                    Package() { "PSTATE",  20,   5326000000,     2,    Package() { "GPU",  50, } },
                    Package() { "PSTATE",  21,   4926000000,     2,    Package() { "GPU",  50, } },
                    Package() { "PSTATE",  22,   4526000000,     2,    Package() { "GPU",  50, } },
                    Package() { "PSTATE",  23,   4126000000,     2,    Package() { "GPU",  50, } },
                    Package() { "PSTATE",  24,   3726000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  25,   3326000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  26,   2926000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  27,   2526000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  28,   2400000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  29,   2300000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  30,   2200000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  31,   2100000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  32,   2000000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  33,   1900000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  34,   1800000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  35,   1700000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  36,   1600000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  37,   1500000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  38,   1400000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  39,   1300000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  40,   1200000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  41,   1100000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  42,   1000000000,     2,    Package() { "GPU",  25, } },
                    Package() { "PSTATE",  43,    900000000,     2,    Package() { "GPU",   0, } },
                    Package() { "PSTATE",  44,    800000000,     2,    Package() { "GPU",   0, } },
                    Package() { "PSTATE",  45,    700000000,     2,    Package() { "GPU",   0, } },
                    Package() { "PSTATE",  46,    600000000,     2,    Package() { "GPU",   0, } },
                    Package() { "PSTATE",  47,    500000000,     2,    Package() { "GPU",   0, } },
                    Package() { "PSTATE",  48,    400000000,     2,    Package() { "GPU",   0, } },
                    Package() { "PSTATE",  49,            0,     2,    Package() { "GPU",   0, } },
                },
                
                
            },
            
            //----------------------------------------------------------------------------------
            //  C4 - Video Engine Power States
            //----------------------------------------------------------------------------------
            //
            Package()
            {
                "COMPONENT",
                4,                                                      // Component Index
                Buffer()
                {
                    0x1A, 0xBB, 0xE1, 0xD0, 0x3D, 0x70, 0xE8, 0x4B,     // GUID: {D0E1BB1A-703D-4BE8-B450-64A4FBFCA6A8}
                    0xB4, 0x50, 0x64, 0xA4, 0xFB, 0xFC, 0xA6, 0xA8
                },
            
                "VIDEO_POWER_STATES",                                   // Common Name
                "HW_BLOCK_VIDEO",                                       // Hw Block associated with this component
            
                Package()
                {
                    "ENGINE",                                           // Dxgkrnl Component Type
                    "VIDEO",
                },
            
                3,                                                      // Number of F-States
                4,                                                      // Number of P-State Sets
            
                //                          Logical     Transition   Residency   Nominal
                //                    ID   Power State   Latency    Requirement   Power
                //                    ---  -----------  ----------  -----------  -------
                Package() { "FSTATE",  0,    "ALL_ON",          0,           0,       3  },
                Package() { "FSTATE",  1,   "CLK_OFF",      10000,           0,       2  },
                Package() { "FSTATE",  2,   "PWR_OFF",     100000,           0,       1  },
                
                //----------------------------------------------------------------------------------
                // C4.PS0 - Video Core P-State Set: Reset
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    0,                                                   // P-State Set Index
                    "VIDEO_RESET",                
                    "*",                                                 // HW Revisions
                    "RESET",                                             // Resource Type
                    2,                                                   // Num P-States in Set
                    0,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,            1,     2 },   // Do Nothing
                    Package() { "PSTATE",   1,            0,     2 },   // Reset Venus Core
                },
                
                //----------------------------------------------------------------------------------
                // C4.PS1 - Video Core P-State Set: Footswitch override
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    1,                                                   // P-State Set Index
                    "VIDEO_FOOTSWITCH_OVERRIDE",  
                    "*",                                                 // HW Revisions
                    "FOOTSWITCH_OVERRIDE",                               // Resource Type
                    2,                                                   // Num P-States in Set
                    1,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,            1,     2 },   // Footswitch On
                    Package() { "PSTATE",   1,            0,     2 },   // Footswitch Off
                },
                
                //----------------------------------------------------------------------------------
                // C4.PS2 - Video Core Performance: Core Clock Frequency
                //
                // @Brief:
                // Notes:
                // - The use of a "CLOSEST" match for the highest frequency is defensive.  Any attempt
                //   to request a frequency that's even 1 Hz higher than the maximum entry in Clkrgm's
                //   table will result in a silent failure and no change in clock frequency.
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    2,                                                   // P-State Set Index
                    "VIDEO_CORE_CLOCK_CONTROL",   
                    "*",                                                 // HW Revisions
                    "CORE_CLOCK",                                        // Resource Type
                    7,                                                   // Num P-States in Set
                    4,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,    533000000,     0 },
                    Package() { "PSTATE",   1,    444000000,     1 },
                    Package() { "PSTATE",   2,    380000000,     2 },
                    Package() { "PSTATE",   3,    320000000,     2 },
                    Package() { "PSTATE",   4,    200000000,     2 },
                    Package() { "PSTATE",   5,    100000000,     2 },
                    Package() { "PSTATE",   6,            0,     3 },
                },
                
                //----------------------------------------------------------------------------------
                // C4.PS3 - Video Performance: Bandwidth to EBI
                //
                // @Brief:
                // AXI bandwidth values are represented by a max, min and step which covers all
                // possible bandwidth values requested by video core for different decode and
                // encode scenarios.
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    3,                                                   // P-State Set Index
                    "VIDEO_AXI_PORT_BW",          
                    "*",                                                 // HW Revisions
                    "BANDWIDTH",                                         // Resource Type
                    111,                                                  // Num P-States in Set
                    108,                                                  // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,   22000000000,     0 },
                    Package() { "PSTATE",   1,   21800000000,     0 },
                    Package() { "PSTATE",   2,   21600000000,     0 },
                    Package() { "PSTATE",   3,   21400000000,     0 },
                    Package() { "PSTATE",   4,   21200000000,     0 },
                    Package() { "PSTATE",   5,   21000000000,     0 },
                    Package() { "PSTATE",   6,   20800000000,     0 },
                    Package() { "PSTATE",   7,   20600000000,     0 },
                    Package() { "PSTATE",   8,   20400000000,     0 },
                    Package() { "PSTATE",   9,   20200000000,     0 },
                    Package() { "PSTATE",  10,   20000000000,     0 },
                    Package() { "PSTATE",  11,   19800000000,     0 },
                    Package() { "PSTATE",  12,   19600000000,     0 },
                    Package() { "PSTATE",  13,   19400000000,     0 },
                    Package() { "PSTATE",  14,   19200000000,     0 },
                    Package() { "PSTATE",  15,   19000000000,     0 },
                    Package() { "PSTATE",  16,   18800000000,     0 },
                    Package() { "PSTATE",  17,   18600000000,     0 },
                    Package() { "PSTATE",  18,   18400000000,     0 },
                    Package() { "PSTATE",  19,   18200000000,     0 },
                    Package() { "PSTATE",  20,   18000000000,     0 },
                    Package() { "PSTATE",  21,   17800000000,     0 },
                    Package() { "PSTATE",  22,   17600000000,     0 },
                    Package() { "PSTATE",  23,   17400000000,     0 },
                    Package() { "PSTATE",  24,   17200000000,     0 },
                    Package() { "PSTATE",  25,   17000000000,     0 },
                    Package() { "PSTATE",  26,   16800000000,     0 },
                    Package() { "PSTATE",  27,   16600000000,     0 },
                    Package() { "PSTATE",  28,   16400000000,     0 },
                    Package() { "PSTATE",  29,   16200000000,     0 },
                    Package() { "PSTATE",  30,   16000000000,     0 },
                    Package() { "PSTATE",  31,   15800000000,     0 },
                    Package() { "PSTATE",  32,   15600000000,     0 },
                    Package() { "PSTATE",  33,   15400000000,     0 },
                    Package() { "PSTATE",  34,   15200000000,     0 },
                    Package() { "PSTATE",  35,   15000000000,     0 },
                    Package() { "PSTATE",  36,   14800000000,     0 },
                    Package() { "PSTATE",  37,   14600000000,     0 },
                    Package() { "PSTATE",  38,   14400000000,     0 },
                    Package() { "PSTATE",  39,   14200000000,     0 },
                    Package() { "PSTATE",  40,   14000000000,     0 },
                    Package() { "PSTATE",  41,   13800000000,     0 },
                    Package() { "PSTATE",  42,   13600000000,     0 },
                    Package() { "PSTATE",  43,   13400000000,     0 },
                    Package() { "PSTATE",  44,   13200000000,     0 },
                    Package() { "PSTATE",  45,   13000000000,     0 },
                    Package() { "PSTATE",  46,   12800000000,     0 },
                    Package() { "PSTATE",  47,   12600000000,     0 },
                    Package() { "PSTATE",  48,   12400000000,     0 },
                    Package() { "PSTATE",  49,   12200000000,     0 },
                    Package() { "PSTATE",  50,   12000000000,     0 },
                    Package() { "PSTATE",  51,   11800000000,     0 },
                    Package() { "PSTATE",  52,   11600000000,     0 },
                    Package() { "PSTATE",  53,   11400000000,     0 },
                    Package() { "PSTATE",  54,   11200000000,     0 },
                    Package() { "PSTATE",  55,   11000000000,     0 },
                    Package() { "PSTATE",  56,   10800000000,     0 },
                    Package() { "PSTATE",  57,   10600000000,     0 },
                    Package() { "PSTATE",  58,   10400000000,     0 },
                    Package() { "PSTATE",  59,   10200000000,     0 },
                    Package() { "PSTATE",  60,   10000000000,     0 },
                    Package() { "PSTATE",  61,   9800000000,     0 },
                    Package() { "PSTATE",  62,   9600000000,     0 },
                    Package() { "PSTATE",  63,   9400000000,     0 },
                    Package() { "PSTATE",  64,   9200000000,     0 },
                    Package() { "PSTATE",  65,   9000000000,     0 },
                    Package() { "PSTATE",  66,   8800000000,     0 },
                    Package() { "PSTATE",  67,   8600000000,     0 },
                    Package() { "PSTATE",  68,   8400000000,     0 },
                    Package() { "PSTATE",  69,   8200000000,     0 },
                    Package() { "PSTATE",  70,   8000000000,     0 },
                    Package() { "PSTATE",  71,   7800000000,     0 },
                    Package() { "PSTATE",  72,   7600000000,     0 },
                    Package() { "PSTATE",  73,   7400000000,     0 },
                    Package() { "PSTATE",  74,   7200000000,     0 },
                    Package() { "PSTATE",  75,   7000000000,     0 },
                    Package() { "PSTATE",  76,   6800000000,     0 },
                    Package() { "PSTATE",  77,   6600000000,     0 },
                    Package() { "PSTATE",  78,   6400000000,     0 },
                    Package() { "PSTATE",  79,   6200000000,     0 },
                    Package() { "PSTATE",  80,   6000000000,     0 },
                    Package() { "PSTATE",  81,   5800000000,     0 },
                    Package() { "PSTATE",  82,   5600000000,     0 },
                    Package() { "PSTATE",  83,   5400000000,     0 },
                    Package() { "PSTATE",  84,   5200000000,     0 },
                    Package() { "PSTATE",  85,   5000000000,     0 },
                    Package() { "PSTATE",  86,   4800000000,     0 },
                    Package() { "PSTATE",  87,   4600000000,     0 },
                    Package() { "PSTATE",  88,   4400000000,     0 },
                    Package() { "PSTATE",  89,   4200000000,     0 },
                    Package() { "PSTATE",  90,   4000000000,     0 },
                    Package() { "PSTATE",  91,   3800000000,     0 },
                    Package() { "PSTATE",  92,   3600000000,     0 },
                    Package() { "PSTATE",  93,   3400000000,     0 },
                    Package() { "PSTATE",  94,   3200000000,     0 },
                    Package() { "PSTATE",  95,   3000000000,     0 },
                    Package() { "PSTATE",  96,   2800000000,     0 },
                    Package() { "PSTATE",  97,   2600000000,     0 },
                    Package() { "PSTATE",  98,   2400000000,     0 },
                    Package() { "PSTATE",  99,   2200000000,     0 },
                    Package() { "PSTATE",  100,   2000000000,     0 },
                    Package() { "PSTATE",  101,   1800000000,     0 },
                    Package() { "PSTATE",  102,   1600000000,     0 },
                    Package() { "PSTATE",  103,   1400000000,     0 },
                    Package() { "PSTATE",  104,   1200000000,     0 },
                    Package() { "PSTATE",  105,   1000000000,     0 },
                    Package() { "PSTATE",  106,    800000000,     1 },
                    Package() { "PSTATE",  107,    600000000,     1 },
                    Package() { "PSTATE",  108,    400000000,     2 },
                    Package() { "PSTATE",  109,    200000000,     2 },
                    Package() { "PSTATE",  110,            0,     2 },
                },
                
                
            },
            
            //----------------------------------------------------------------------------------
            //  C5 - Crypto Engine Power States
            //----------------------------------------------------------------------------------
            //
            Package()
            {
                "COMPONENT",
                5,                                                      // Component Index
                Buffer()
                {
                    0xFA, 0x73, 0x4D, 0xCC, 0xC2, 0xC3, 0x7E, 0x4C,     // GUID: {CC4D73FA-C3C2-4C7E-A217-D468F4611BBD}
                    0xA2, 0x17, 0xD4, 0x68, 0xF4, 0x61, 0x1B, 0xBD
                },
            
                "CRYPTO_POWER_STATES",                                  // Common Name
                "HW_BLOCK_NONE",                                        // Hw Block associated with this component
            
                Package()
                {
                    "ENGINE",                                           // Dxgkrnl Component Type
                    "CRYPTO",
                },
            
                2,                                                      // Number of F-States
                3,                                                      // Number of P-State Sets
            
                //                          Logical     Transition   Residency   Nominal
                //                    ID   Power State   Latency    Requirement   Power
                //                    ---  -----------  ----------  -----------  -------
                Package() { "FSTATE",  0,    "ALL_ON",          0,           0,       3  },
                Package() { "FSTATE",  1,   "PWR_OFF",     100000,           0,       1  },
                
                //----------------------------------------------------------------------------------
                // C5.PS0 - Crypto P-State Set: Reset
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    0,                                                   // P-State Set Index
                    "CRYPTO_RESET",               
                    "*",                                                 // HW Revisions
                    "RESET",                                             // Resource Type
                    2,                                                   // Num P-States in Set
                    0,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,            1,     2 },   // Do Nothing
                    Package() { "PSTATE",   1,            0,     2 },   // Do Nothing
                },
                
                //----------------------------------------------------------------------------------
                // C5.PS1 - Crypto P-State Set: Footswitch override
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    1,                                                   // P-State Set Index
                    "CRYPTO_FOOTSWITCH_OVERRIDE", 
                    "*",                                                 // HW Revisions
                    "FOOTSWITCH_OVERRIDE",                               // Resource Type
                    2,                                                   // Num P-States in Set
                    1,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,            1,     2 },   // Footswitch On
                    Package() { "PSTATE",   1,            0,     2 },   // Footswitch Off
                },
                
                //----------------------------------------------------------------------------------
                // C5.PS2 - Crypto Core Performance: Core Clock Frequency
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    2,                                                   // P-State Set Index
                    "CRYPTO_CORE_CLOCK_CONTROL",  
                    "*",                                                 // HW Revisions
                    "CORE_CLOCK",                                        // Resource Type
                    1,                                                   // Num P-States in Set
                    0,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,            0,     0 },
                },
                
                
            },
            
            //----------------------------------------------------------------------------------
            //  C6 - Video Encoder Engine Power States
            //----------------------------------------------------------------------------------
            //
            Package()
            {
                "COMPONENT",
                6,                                                      // Component Index
                Buffer()
                {
                    0x96, 0x50, 0xBE, 0xE6, 0xEC, 0x55, 0x91, 0x48,     // GUID: {E6BE5096-55EC-4891-884B-0760BFC533B6}
                    0x88, 0x4B, 0x07, 0x60, 0xBF, 0xC5, 0x33, 0xB6
                },
            
                "VIDEO_ENCODER_POWER_STATES",                           // Common Name
                "HW_BLOCK_VIDEO",                                       // Hw Block associated with this component
            
                Package()
                {
                    "ENGINE",                                           // Dxgkrnl Component Type
                    "VIDEO_ENCODER",
                },
            
                3,                                                      // Number of F-States
                4,                                                      // Number of P-State Sets
            
                //                          Logical     Transition   Residency   Nominal
                //                    ID   Power State   Latency    Requirement   Power
                //                    ---  -----------  ----------  -----------  -------
                Package() { "FSTATE",  0,    "ALL_ON",          0,           0,       3  },
                Package() { "FSTATE",  1,   "CLK_OFF",      10000,           0,       2  },
                Package() { "FSTATE",  2,   "PWR_OFF",     100000,           0,       1  },
                
                //----------------------------------------------------------------------------------
                // C6.PS0 - Video  Encoder P-State Set: Reset
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    0,                                                   // P-State Set Index
                    "VIDEO_ENCODER_RESET",        
                    "*",                                                 // HW Revisions
                    "RESET",                                             // Resource Type
                    2,                                                   // Num P-States in Set
                    0,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,            1,     2 },   // Do Nothing
                    Package() { "PSTATE",   1,            0,     2 },   // Reset Venus Core
                },
                
                //----------------------------------------------------------------------------------
                // C6.PS1 - Video Encoder P-State Set: Footswitch override
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    1,                                                   // P-State Set Index
                    "VIDEO_ENCODER_FOOTSWITCH_OVERRIDE",
                    "*",                                                 // HW Revisions
                    "FOOTSWITCH_OVERRIDE",                               // Resource Type
                    2,                                                   // Num P-States in Set
                    1,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,            1,     2 },   // Footswitch On
                    Package() { "PSTATE",   1,            0,     2 },   // Footswitch Off
                },
                
                //----------------------------------------------------------------------------------
                // C6.PS2 - Video Encoder Core Performance: Core Clock Frequency
                //
                // @Brief:
                // Notes:
                // - The use of a "CLOSEST" match for the highest frequency is defensive.  Any attempt
                //   to request a frequency that's even 1 Hz higher than the maximum entry in Clkrgm's
                //   table will result in a silent failure and no change in clock frequency.
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    2,                                                   // P-State Set Index
                    "VIDEO_ENCODER_CORE_CLOCK_CONTROL",
                    "*",                                                 // HW Revisions
                    "CORE_CLOCK",                                        // Resource Type
                    7,                                                   // Num P-States in Set
                    4,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,    533000000,     0 },
                    Package() { "PSTATE",   1,    444000000,     1 },
                    Package() { "PSTATE",   2,    404000000,     2 },
                    Package() { "PSTATE",   3,    330000000,     2 },
                    Package() { "PSTATE",   4,    200000000,     2 },
                    Package() { "PSTATE",   5,    100000000,     2 },
                    Package() { "PSTATE",   6,            0,     3 },
                },
                
                //----------------------------------------------------------------------------------
                // C6.PS3 - Video Encoder Performance: Bandwidth to EBI
                //
                // @Brief:
                // AXI bandwidth values are represented by a max, min and step which covers all
                // possible bandwidth values requested by video core for different decode and
                // encode scenarios.
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    3,                                                   // P-State Set Index
                    "VIDEO_ENCODER_AXI_PORT_BW",  
                    "*",                                                 // HW Revisions
                    "BANDWIDTH",                                         // Resource Type
                    111,                                                  // Num P-States in Set
                    108,                                                  // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,   22000000000,     0 },
                    Package() { "PSTATE",   1,   21800000000,     0 },
                    Package() { "PSTATE",   2,   21600000000,     0 },
                    Package() { "PSTATE",   3,   21400000000,     0 },
                    Package() { "PSTATE",   4,   21200000000,     0 },
                    Package() { "PSTATE",   5,   21000000000,     0 },
                    Package() { "PSTATE",   6,   20800000000,     0 },
                    Package() { "PSTATE",   7,   20600000000,     0 },
                    Package() { "PSTATE",   8,   20400000000,     0 },
                    Package() { "PSTATE",   9,   20200000000,     0 },
                    Package() { "PSTATE",  10,   20000000000,     0 },
                    Package() { "PSTATE",  11,   19800000000,     0 },
                    Package() { "PSTATE",  12,   19600000000,     0 },
                    Package() { "PSTATE",  13,   19400000000,     0 },
                    Package() { "PSTATE",  14,   19200000000,     0 },
                    Package() { "PSTATE",  15,   19000000000,     0 },
                    Package() { "PSTATE",  16,   18800000000,     0 },
                    Package() { "PSTATE",  17,   18600000000,     0 },
                    Package() { "PSTATE",  18,   18400000000,     0 },
                    Package() { "PSTATE",  19,   18200000000,     0 },
                    Package() { "PSTATE",  20,   18000000000,     0 },
                    Package() { "PSTATE",  21,   17800000000,     0 },
                    Package() { "PSTATE",  22,   17600000000,     0 },
                    Package() { "PSTATE",  23,   17400000000,     0 },
                    Package() { "PSTATE",  24,   17200000000,     0 },
                    Package() { "PSTATE",  25,   17000000000,     0 },
                    Package() { "PSTATE",  26,   16800000000,     0 },
                    Package() { "PSTATE",  27,   16600000000,     0 },
                    Package() { "PSTATE",  28,   16400000000,     0 },
                    Package() { "PSTATE",  29,   16200000000,     0 },
                    Package() { "PSTATE",  30,   16000000000,     0 },
                    Package() { "PSTATE",  31,   15800000000,     0 },
                    Package() { "PSTATE",  32,   15600000000,     0 },
                    Package() { "PSTATE",  33,   15400000000,     0 },
                    Package() { "PSTATE",  34,   15200000000,     0 },
                    Package() { "PSTATE",  35,   15000000000,     0 },
                    Package() { "PSTATE",  36,   14800000000,     0 },
                    Package() { "PSTATE",  37,   14600000000,     0 },
                    Package() { "PSTATE",  38,   14400000000,     0 },
                    Package() { "PSTATE",  39,   14200000000,     0 },
                    Package() { "PSTATE",  40,   14000000000,     0 },
                    Package() { "PSTATE",  41,   13800000000,     0 },
                    Package() { "PSTATE",  42,   13600000000,     0 },
                    Package() { "PSTATE",  43,   13400000000,     0 },
                    Package() { "PSTATE",  44,   13200000000,     0 },
                    Package() { "PSTATE",  45,   13000000000,     0 },
                    Package() { "PSTATE",  46,   12800000000,     0 },
                    Package() { "PSTATE",  47,   12600000000,     0 },
                    Package() { "PSTATE",  48,   12400000000,     0 },
                    Package() { "PSTATE",  49,   12200000000,     0 },
                    Package() { "PSTATE",  50,   12000000000,     0 },
                    Package() { "PSTATE",  51,   11800000000,     0 },
                    Package() { "PSTATE",  52,   11600000000,     0 },
                    Package() { "PSTATE",  53,   11400000000,     0 },
                    Package() { "PSTATE",  54,   11200000000,     0 },
                    Package() { "PSTATE",  55,   11000000000,     0 },
                    Package() { "PSTATE",  56,   10800000000,     0 },
                    Package() { "PSTATE",  57,   10600000000,     0 },
                    Package() { "PSTATE",  58,   10400000000,     0 },
                    Package() { "PSTATE",  59,   10200000000,     0 },
                    Package() { "PSTATE",  60,   10000000000,     0 },
                    Package() { "PSTATE",  61,   9800000000,     0 },
                    Package() { "PSTATE",  62,   9600000000,     0 },
                    Package() { "PSTATE",  63,   9400000000,     0 },
                    Package() { "PSTATE",  64,   9200000000,     0 },
                    Package() { "PSTATE",  65,   9000000000,     0 },
                    Package() { "PSTATE",  66,   8800000000,     0 },
                    Package() { "PSTATE",  67,   8600000000,     0 },
                    Package() { "PSTATE",  68,   8400000000,     0 },
                    Package() { "PSTATE",  69,   8200000000,     0 },
                    Package() { "PSTATE",  70,   8000000000,     0 },
                    Package() { "PSTATE",  71,   7800000000,     0 },
                    Package() { "PSTATE",  72,   7600000000,     0 },
                    Package() { "PSTATE",  73,   7400000000,     0 },
                    Package() { "PSTATE",  74,   7200000000,     0 },
                    Package() { "PSTATE",  75,   7000000000,     0 },
                    Package() { "PSTATE",  76,   6800000000,     0 },
                    Package() { "PSTATE",  77,   6600000000,     0 },
                    Package() { "PSTATE",  78,   6400000000,     0 },
                    Package() { "PSTATE",  79,   6200000000,     0 },
                    Package() { "PSTATE",  80,   6000000000,     0 },
                    Package() { "PSTATE",  81,   5800000000,     0 },
                    Package() { "PSTATE",  82,   5600000000,     0 },
                    Package() { "PSTATE",  83,   5400000000,     0 },
                    Package() { "PSTATE",  84,   5200000000,     0 },
                    Package() { "PSTATE",  85,   5000000000,     0 },
                    Package() { "PSTATE",  86,   4800000000,     0 },
                    Package() { "PSTATE",  87,   4600000000,     0 },
                    Package() { "PSTATE",  88,   4400000000,     0 },
                    Package() { "PSTATE",  89,   4200000000,     0 },
                    Package() { "PSTATE",  90,   4000000000,     0 },
                    Package() { "PSTATE",  91,   3800000000,     0 },
                    Package() { "PSTATE",  92,   3600000000,     0 },
                    Package() { "PSTATE",  93,   3400000000,     0 },
                    Package() { "PSTATE",  94,   3200000000,     0 },
                    Package() { "PSTATE",  95,   3000000000,     0 },
                    Package() { "PSTATE",  96,   2800000000,     0 },
                    Package() { "PSTATE",  97,   2600000000,     0 },
                    Package() { "PSTATE",  98,   2400000000,     0 },
                    Package() { "PSTATE",  99,   2200000000,     0 },
                    Package() { "PSTATE",  100,   2000000000,     0 },
                    Package() { "PSTATE",  101,   1800000000,     0 },
                    Package() { "PSTATE",  102,   1600000000,     0 },
                    Package() { "PSTATE",  103,   1400000000,     0 },
                    Package() { "PSTATE",  104,   1200000000,     0 },
                    Package() { "PSTATE",  105,   1000000000,     0 },
                    Package() { "PSTATE",  106,    800000000,     1 },
                    Package() { "PSTATE",  107,    600000000,     1 },
                    Package() { "PSTATE",  108,    400000000,     2 },
                    Package() { "PSTATE",  109,    200000000,     2 },
                    Package() { "PSTATE",  110,            0,     2 },
                },
                
                
                Package()
                {
                    "PROVIDERS",
                    1,            // Number of providers
                    Package()
                    {
                        4,        // VIDEO_POWER_STATES
                    },
                },
            },
            
            //----------------------------------------------------------------------------------
            //  C7 - Internal (Secondary) Display Power States
            //----------------------------------------------------------------------------------
            //
            Package()
            {
                "COMPONENT",
                7,                                                      // Component Index
                Buffer()
                {
                    0x28, 0xE6, 0x2B, 0xC4, 0xBC, 0xD6, 0x55, 0x47,     // GUID: {C42BE628-D6BC-4755-BFD5-5AF776797228}
                    0xBF, 0xD5, 0x5A, 0xF7, 0x76, 0x79, 0x72, 0x28
                },
            
                "SECDISPLAY_POWER_STATES",                              // Common Name
                "HW_BLOCK_MDP",                                         // Hw Block associated with this component
            
                Package()
                {
                    "DISPLAY",                                          // Dxgkrnl Component Type
                    "INTERNAL2",
                },
            
                2,                                                      // Number of F-States
                5,                                                      // Number of P-State Sets
            
                //                          Logical     Transition   Residency   Nominal
                //                    ID   Power State   Latency    Requirement   Power
                //                    ---  -----------  ----------  -----------  -------
                Package() { "FSTATE",  0,    "ALL_ON",          0,           0,       2  },
                Package() { "FSTATE",  1,   "PWR_OFF",          1,           1,       1  },
                
                //----------------------------------------------------------------------------------
                // C7.PS0 - Internal (Secondary) Display: MDP Reset Control
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    0,                                                   // P-State Set Index
                    "INTERNAL2_RESET",            
                    "*",                                                 // HW Revisions
                    "RESET",                                             // Resource Type
                    2,                                                   // Num P-States in Set
                    0,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,            1,     2 },   // Do Nothing
                    Package() { "PSTATE",   1,            0,     2 },   // Reset Display Core
                },
                
                //----------------------------------------------------------------------------------
                // C7.PS1 - Internal (Secondary) Display : MDP Footswitch override
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    1,                                                   // P-State Set Index
                    "INTERNAL2_FOOTSWITCH_OVERRIDE",
                    "*",                                                 // HW Revisions
                    "FOOTSWITCH_OVERRIDE",                               // Resource Type
                    2,                                                   // Num P-States in Set
                    0xFFFFFFFF,                                          // Initial P-State (i.e. none)
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,            1,     2 },   // Footswitch On
                    Package() { "PSTATE",   1,            0,     2 },   // Footswitch Off
                },
                
                //----------------------------------------------------------------------------------
                // C7.PS2 - Internal (Secondary) Display : Power states for MDP scan-out HW
                //
                // @Brief:
                // - Used to dynamically control MDP related clocks within a PState
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    2,                                                   // P-State Set Index
                    "INTERNAL2_SCAN_CONTROL",     
                    "*",                                                 // HW Revisions
                    "DISPLAY_SOURCE_SCAN_CTRL",                           // Resource Type
                    5,                                                   // Num P-States in Set
                    0,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,            4,     2 },   // Vote for all scan-out resources
                    Package() { "PSTATE",   1,            3,     2 },   // Vote for only MDP, DSI 0 and DSI 1 scan-out resources
                    Package() { "PSTATE",   2,            2,     2 },   // Vote for only MDP and DSI 0 scan-out resources
                    Package() { "PSTATE",   3,            1,     2 },   // Vote for only MDP and DSI 1 scan-out resources
                    Package() { "PSTATE",   4,            0,     2 },   // Remove votes for all scan-out resources
                },
                
                //----------------------------------------------------------------------------------
                // C7.PS3 - Internal (Secondary) Display : MDP Core Clock Frequency
                //
                // @Brief:
                // Notes:
                // - This table reflects the frequency plan for the v1 part.
                // - All core frequency votes are based on specific clock plan values and are cast
                //   2 MHz below what we actually desire. This helps avoid potential issues with
                //   round-up when the actual clock frequency on real HW is slightly less than
                //   that which was advertized in the clock plan.
                // - [NC] Temporarily moved all AHB bandwidth votes to F-states to help work around
                //   64K size issue in the final AML.
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    3,                                                   // P-State Set Index
                    "INTERNAL2_CORE_CLOCK_CONTROL",
                    "*",                                                 // HW Revisions
                    "CORE_CLOCK",                                        // Resource Type
                    13,                                                  // Num P-States in Set
                    4,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,    430000000,     1 },
                    Package() { "PSTATE",   1,    412500000,     1 },
                    Package() { "PSTATE",   2,    344000000,     2 },
                    Package() { "PSTATE",   3,    300000000,     2 },
                    Package() { "PSTATE",   4,    275000000,     2 },
                    Package() { "PSTATE",   5,    200000000,     2 },
                    Package() { "PSTATE",   6,    171428571,     3 },
                    Package() { "PSTATE",   7,    165000000,     3 },
                    Package() { "PSTATE",   8,    150000000,     3 },
                    Package() { "PSTATE",   9,    100000000,     3 },
                    Package() { "PSTATE",  10,     85710000,     3 },
                    Package() { "PSTATE",  11,     19200000,     3 },
                    Package() { "PSTATE",  12,            0,     3 },
                },
                
                //----------------------------------------------------------------------------------
                // C7.PS4 - Internal (Secondary) Display : Display Bandwidth to EBI
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    4,                                                   // P-State Set Index
                    "INTERNAL2_EBI_BANDWIDTH",    
                    "*",                                                 // HW Revisions
                    "BANDWIDTH",                                         // Resource Type
                    43,                                                  // Num P-States in Set
                    28,                                                  // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,   13326000000,     0 },
                    Package() { "PSTATE",   1,   12926000000,     0 },
                    Package() { "PSTATE",   2,   12526000000,     0 },
                    Package() { "PSTATE",   3,   12126000000,     0 },
                    Package() { "PSTATE",   4,   11726000000,     0 },
                    Package() { "PSTATE",   5,   11326000000,     0 },
                    Package() { "PSTATE",   6,   10926000000,     0 },
                    Package() { "PSTATE",   7,   10526000000,     0 },
                    Package() { "PSTATE",   8,   10126000000,     1 },
                    Package() { "PSTATE",   9,   9600000000,     1 },
                    Package() { "PSTATE",  10,   9200000000,     1 },
                    Package() { "PSTATE",  11,   8800000000,     1 },
                    Package() { "PSTATE",  12,   8400000000,     1 },
                    Package() { "PSTATE",  13,   8000000000,     1 },
                    Package() { "PSTATE",  14,   7600000000,     1 },
                    Package() { "PSTATE",  15,   7200000000,     1 },
                    Package() { "PSTATE",  16,   6800000000,     1 },
                    Package() { "PSTATE",  17,   6400000000,     1 },
                    Package() { "PSTATE",  18,   6000000000,     1 },
                    Package() { "PSTATE",  19,   5600000000,     1 },
                    Package() { "PSTATE",  20,   5200000000,     2 },
                    Package() { "PSTATE",  21,   4800000000,     2 },
                    Package() { "PSTATE",  22,   4400000000,     2 },
                    Package() { "PSTATE",  23,   4000000000,     2 },
                    Package() { "PSTATE",  24,   3600000000,     2 },
                    Package() { "PSTATE",  25,   3200000000,     2 },
                    Package() { "PSTATE",  26,   2800000000,     2 },
                    Package() { "PSTATE",  27,   2400000000,     2 },
                    Package() { "PSTATE",  28,   2000000000,     2 },
                    Package() { "PSTATE",  29,   1600000000,     2 },
                    Package() { "PSTATE",  30,   1500000000,     2 },
                    Package() { "PSTATE",  31,   1400000000,     2 },
                    Package() { "PSTATE",  32,   1300000000,     2 },
                    Package() { "PSTATE",  33,   1200000000,     2 },
                    Package() { "PSTATE",  34,   1100000000,     2 },
                    Package() { "PSTATE",  35,   1000000000,     2 },
                    Package() { "PSTATE",  36,    900000000,     2 },
                    Package() { "PSTATE",  37,    800000000,     2 },
                    Package() { "PSTATE",  38,    700000000,     2 },
                    Package() { "PSTATE",  39,    600000000,     2 },
                    Package() { "PSTATE",  40,    500000000,     2 },
                    Package() { "PSTATE",  41,    400000000,     2 },
                    Package() { "PSTATE",  42,            0,     2 },
                },
                
                
            },
            
            //----------------------------------------------------------------------------------
            //  C8 - Display Port Power States
            //----------------------------------------------------------------------------------
            //
            Package()
            {
                "COMPONENT",
                8,                                                      // Component Index
                Buffer()
                {
                    0xD2, 0xAE, 0x8D, 0x81, 0x63, 0x9E, 0xD5, 0x49,     // GUID: {818DAED2-9E63-49D5-BD12-B0951F7B0F6B}
                    0xBD, 0x12, 0xB0, 0x95, 0x1F, 0x7B, 0x0F, 0x6B
                },
            
                "DP_POWER_STATES",                                      // Common Name
                "HW_BLOCK_MDP",                                         // Hw Block associated with this component
            
                Package()
                {
                    "DISPLAY",                                          // Dxgkrnl Component Type
                    "EXTERNAL1",
                },
            
                2,                                                      // Number of F-States
                4,                                                      // Number of P-State Sets
            
                //                          Logical     Transition   Residency   Nominal
                //                    ID   Power State   Latency    Requirement   Power
                //                    ---  -----------  ----------  -----------  -------
                Package() { "FSTATE",  0,    "ALL_ON",          0,           0,       2  },
                Package() { "FSTATE",  1,   "PWR_OFF",          1,           1,       1  },
                
                //----------------------------------------------------------------------------------
                // C8.PS0 - DP: MDP Reset Control
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    0,                                                   // P-State Set Index
                    "EXTERNAL1_RESET",            
                    "*",                                                 // HW Revisions
                    "RESET",                                             // Resource Type
                    2,                                                   // Num P-States in Set
                    0,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,            1,     2 },   // Do Nothing
                    Package() { "PSTATE",   1,            0,     2 },   // Reset MDSS Core
                },
                
                //----------------------------------------------------------------------------------
                // C8.PS1 - External Display: MDP Footswitch override
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    1,                                                   // P-State Set Index
                    "EXTERNAL1_FOOTSWITCH_OVERRIDE",
                    "*",                                                 // HW Revisions
                    "FOOTSWITCH_OVERRIDE",                               // Resource Type
                    2,                                                   // Num P-States in Set
                    0xFFFFFFFF,                                          // Initial P-State (i.e. none)
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,            1,     2 },   // Footswitch On
                    Package() { "PSTATE",   1,            0,     2 },   // Footswitch Off
                },
                
                //----------------------------------------------------------------------------------
                // C8.PS2 - DP: MDP Core Clock Frequency
                //
                // @Brief:
                // Notes:
                // - This table reflects the frequency plan for the v1 part.
                // - All core frequency votes are based on specific clock plan values and are cast
                //   2 MHz below what we actually desire. This helps avoid potential issues with
                //   round-up when the actual clock frequency on real HW is slightly less than
                //   that which was advertized in the clock plan.
                // - [NC] Temporarily moved all AHB bandwidth votes to F-states to help work around
                //   64K size issue in the final AML.
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    2,                                                   // P-State Set Index
                    "EXTERNAL1_CORE_CLOCK_CONTROL",
                    "*",                                                 // HW Revisions
                    "CORE_CLOCK",                                        // Resource Type
                    13,                                                  // Num P-States in Set
                    4,                                                   // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,    430000000,     1 },
                    Package() { "PSTATE",   1,    412500000,     1 },
                    Package() { "PSTATE",   2,    344000000,     2 },
                    Package() { "PSTATE",   3,    300000000,     2 },
                    Package() { "PSTATE",   4,    275000000,     2 },
                    Package() { "PSTATE",   5,    200000000,     2 },
                    Package() { "PSTATE",   6,    171428571,     3 },
                    Package() { "PSTATE",   7,    165000000,     3 },
                    Package() { "PSTATE",   8,    150000000,     3 },
                    Package() { "PSTATE",   9,    100000000,     3 },
                    Package() { "PSTATE",  10,     85710000,     3 },
                    Package() { "PSTATE",  11,     19200000,     3 },
                    Package() { "PSTATE",  12,            0,     3 },
                },
                
                //----------------------------------------------------------------------------------
                // C8.PS3 - DP: Display Bandwidth to EBI
                //
                // @Brief:
                // Notes:
                // - AXI port 0 is strictly used by the scanout logic today, so the bandwidth values
                //   in this table were selected to span the full range of potential scanout needs for
                //   8064 in such a way that no request will be rounded up by more than 10%. The
                //   bottom end of the range is driven by the simple scenario of a single RGB layer on
                //   a VGA sized primary display:
                // 
                //       640 * 400 * 60Hz * 4Bytes/pixel = 73,728,000 Bytes/Sec
                // 
                //   The top end of the range is meant to support the maximum allowable primary display
                //   resolution (i.e. WUXGA) with one RGB layer and one YUV layer, plus an DP display
                //   with one RGB layer and one YUV layer:
                // 
                //         1920 * 1200 * 60Hz * 4Bytes/Pixel   = 552,960,000 Bytes/Sec
                //       + 1920 * 1200 * 60Hz * 1.5Bytes/Pixel = 207,360,000 Bytes/Sec
                //       + 1920 * 1080 * 60Hz * 4Bytes/Pixel   = 497,664,000 Bytes/Sec
                //       + 1920 * 1080 * 60Hz * 1.5Bytes/Pixel = 186,624,000 Bytes/Sec
                //       -----------------------
                //       1,444,608,000 Bytes/Sec
                // 
                //   Within the table, the arbitrated bandwidth values are each padded by 10 0.000000or
                //   headroom, and the instantaneous bandwidth values are padded by an additional 10%
                //   to help account for the bursty nature of scan-line fetches.
                //----------------------------------------------------------------------------------
                //
                Package()
                {
                    "PSTATE_SET",
                    3,                                                   // P-State Set Index
                    "EXTERNAL1_EBI_BANDWIDTH",    
                    "*",                                                 // HW Revisions
                    "BANDWIDTH",                                         // Resource Type
                    43,                                                  // Num P-States in Set
                    28,                                                  // Initial P-State
                    0,                                                   // Stable Power P-State (i.e. none)
                
                    //                                        Voltage
                    //                     ID       Value      Level
                    //                     ---    ----------   -----
                    Package() { "PSTATE",   0,   13326000000,     0 },
                    Package() { "PSTATE",   1,   12926000000,     0 },
                    Package() { "PSTATE",   2,   12526000000,     0 },
                    Package() { "PSTATE",   3,   12126000000,     0 },
                    Package() { "PSTATE",   4,   11726000000,     0 },
                    Package() { "PSTATE",   5,   11326000000,     0 },
                    Package() { "PSTATE",   6,   10926000000,     0 },
                    Package() { "PSTATE",   7,   10526000000,     0 },
                    Package() { "PSTATE",   8,   10126000000,     1 },
                    Package() { "PSTATE",   9,   9600000000,     1 },
                    Package() { "PSTATE",  10,   9200000000,     1 },
                    Package() { "PSTATE",  11,   8800000000,     1 },
                    Package() { "PSTATE",  12,   8400000000,     1 },
                    Package() { "PSTATE",  13,   8000000000,     1 },
                    Package() { "PSTATE",  14,   7600000000,     1 },
                    Package() { "PSTATE",  15,   7200000000,     1 },
                    Package() { "PSTATE",  16,   6800000000,     1 },
                    Package() { "PSTATE",  17,   6400000000,     1 },
                    Package() { "PSTATE",  18,   6000000000,     1 },
                    Package() { "PSTATE",  19,   5600000000,     1 },
                    Package() { "PSTATE",  20,   5200000000,     2 },
                    Package() { "PSTATE",  21,   4800000000,     2 },
                    Package() { "PSTATE",  22,   4400000000,     2 },
                    Package() { "PSTATE",  23,   4000000000,     2 },
                    Package() { "PSTATE",  24,   3600000000,     2 },
                    Package() { "PSTATE",  25,   3200000000,     2 },
                    Package() { "PSTATE",  26,   2800000000,     2 },
                    Package() { "PSTATE",  27,   2400000000,     2 },
                    Package() { "PSTATE",  28,   2000000000,     2 },
                    Package() { "PSTATE",  29,   1600000000,     2 },
                    Package() { "PSTATE",  30,   1500000000,     2 },
                    Package() { "PSTATE",  31,   1400000000,     2 },
                    Package() { "PSTATE",  32,   1300000000,     2 },
                    Package() { "PSTATE",  33,   1200000000,     2 },
                    Package() { "PSTATE",  34,   1100000000,     2 },
                    Package() { "PSTATE",  35,   1000000000,     2 },
                    Package() { "PSTATE",  36,    900000000,     2 },
                    Package() { "PSTATE",  37,    800000000,     2 },
                    Package() { "PSTATE",  38,    700000000,     2 },
                    Package() { "PSTATE",  39,    600000000,     2 },
                    Package() { "PSTATE",  40,    500000000,     2 },
                    Package() { "PSTATE",  41,    400000000,     2 },
                    Package() { "PSTATE",  42,            0,     2 },
                },
                
                
            },
            
            //----------------------------------------------------------------------------------
            //  C9 - Dummy Component for WP Workaround
            //----------------------------------------------------------------------------------
            //
            Package()
            {
                "COMPONENT",
                9,                                                      // Component Index
                Buffer()
                {
                    0xDF, 0x0B, 0xD4, 0x8D, 0xBD, 0x6F, 0xED, 0x45,     // GUID: {8DD40BDF-6FBD-45ED-8538-711D434B6BA1}
                    0x85, 0x38, 0x71, 0x1D, 0x43, 0x4B, 0x6B, 0xA1
                },
            
                "ALWAYS_ACTIVE_WP",                                     // Common Name
                "HW_BLOCK_NONE",                                        // Hw Block associated with this component
            
                Package()
                {
                    "UNMANAGED",                                        // Dxgkrnl Component Type
                },
            
                1,                                                      // Number of F-States
                0,                                                      // Number of P-State Sets
            
                //                          Logical     Transition   Residency   Nominal
                //                    ID   Power State   Latency    Requirement   Power
                //                    ---  -----------  ----------  -----------  -------
                Package() { "FSTATE",  0,    "ALL_ON",          0,           0,       1  },
                
                
            },
        })
        
        
        //
        //=========================================================================================
        //  Chip-Specific Patches
        //=========================================================================================
        //
        
        //-----------------------------------------------------------------------------------------
        // Patch for C1.PS3 when:
        //     ChipVersion >= 2.0
        //-----------------------------------------------------------------------------------------
        //
        Name (P001,
            //----------------------------------------------------------------------------------
            // C1.PS3 - 3D Graphics Core P-State Set: Engine Controlled Core Clock
            //
            // @Brief:
            //----------------------------------------------------------------------------------
            //
            Package()
            {
                "ENGINE_PSTATE_SET",
                3, 
                "GRAPHICS_FREQ_CONTROL",      
                "CORE_CLOCK",                                        // Resource Type
                9,                                                   // Num P-States in Set
                1,                                                   // Num CustomData fields in Set
                TRUE,                                                // Has Thermal Thresholds
                5,                                                   // Initial P-State
                3,                                                   // Stable Power P-State
            
                //                                        Voltage
                //                     ID       Value      Level   Thermal Thresholds    Custom Data Fields
                //                     ---    ----------   -----   --------------------  --------------------
                Package() { "PSTATE",   0,    710000000,     0,    Package() { "GPU", 100, },    Package() {              416            , } },
                Package() { "PSTATE",   1,    675000000,     1,    Package() { "GPU",  91, },    Package() {              384            , } },
                Package() { "PSTATE",   2,    596000000,     2,    Package() { "GPU",  81, },    Package() {              320            , } },
                Package() { "PSTATE",   3,    520000000,     3,    Package() { "GPU",  71, },    Package() {              256            , } },
                Package() { "PSTATE",   4,    414000000,     4,    Package() { "GPU",  56, },    Package() {              192            , } },
                Package() { "PSTATE",   5,    342000000,     5,    Package() { "GPU",  47, },    Package() {              128            , } },
                Package() { "PSTATE",   6,    247000000,     6,    Package() { "GPU",  35, },    Package() {              64            , } },
                Package() { "PSTATE",   7,    180000000,     7,    Package() { "GPU",   0, },    Package() {              48            , } },
                Package() { "PSTATE",   8,            0,     8,    Package() { "GPU",   0, },    Package() {              0            , } },
            }
        )
        
        //-----------------------------------------------------------------------------------------
        // Patch for C1.PS3 when:
        //     No other matching conditions
        //-----------------------------------------------------------------------------------------
        //
        Name (P002,
            //----------------------------------------------------------------------------------
            // C1.PS3 - 3D Graphics Core P-State Set: Engine Controlled Core Clock
            //
            // @Brief:
            //----------------------------------------------------------------------------------
            //
            Package()
            {
                "ENGINE_PSTATE_SET",
                3, 
                "GRAPHICS_FREQ_CONTROL",      
                "CORE_CLOCK",                                        // Resource Type
                2,                                                   // Num P-States in Set
                1,                                                   // Num CustomData fields in Set
                TRUE,                                                // Has Thermal Thresholds
                0,                                                   // Initial P-State
                0,                                                   // Stable Power P-State
            
                //                                        Voltage
                //                     ID       Value      Level   Thermal Thresholds    Custom Data Fields
                //                     ---    ----------   -----   --------------------  --------------------
                Package() { "PSTATE",   0,    280000000,     0,    Package() { "GPU",   0, },    Package() {              128            , } },
                Package() { "PSTATE",   1,            0,     1,    Package() { "GPU",   0, },    Package() {              0            , } },
            }
        )
        
        
        //
        //=========================================================================================
        //  Chip-Specific Patch Logic
        //=========================================================================================
        //
        
        // Apply C1.PS3 patch
        //
        If (LGreaterEqual(\_SB.SIDV,0x00020000))
        {
            // ChipVersion >= 2.0
            //
            Store(P001, Index(DeRefOf(Index(RBUF, 4)), 14))
        }
        Else
        {
            // All other chips
            //
            Store(P002, Index(DeRefOf(Index(RBUF, 4)), 14))
        }
        
        Return (RBUF)
    }
    
    // Include Display ACPI extensions, which include panel configuration (_ROM) method
    //
    Include("display.asl")
    
    // Include display adapter configuration for secondary display
    //
    Include("display2.asl")
    
    // Include display adapter configuration for external display
    //
    Include("displayext.asl")
    
    NAME(_DOD, Package()
    {
        0x00024321,
    })
    
    // Enumeration and device info for the AVStream child driver
    //
    Device (AVS0)
    {
        // The address for this device (Same as in _DOD, above)
        //
        Name(_ADR, 0x00024321)
    
        Method (_CRS, 0x0, NotSerialized)
        {
            Name (RBUF, ResourceTemplate ()
            {
            })
            Return (RBUF)
        }
    
        Name (_DEP, Package(0x3)
        {
             \_SB_.MMU0,
             \_SB_.IMM0,
             \_SB_.VFE0
        })
    }
    
    //------------------------------------------------------------------------------
    // _STA method
    // _STA method, would be used to enable/disable GPU device from uefi menu.
    //------------------------------------------------------------------------------
    //
    Method (_STA, 0x0)
    {
        Return (0x0f)
    }
    
    //------------------------------------------------------------------------------
    // Child Device Info
    // This method includes information for child devices
    //------------------------------------------------------------------------------
    //
    Method (CHDV)
    {
      Name (CHIF, Package()
      {
          1,                                           // Number of Child devices
          Package()
          {
              "CHILDDEV",
              0,                                       // Child ID
              0x24321,                                 // ACPI UID
              "QCOM_AVStream_850",                     // Hardware ID
              0,                                       // Instance ID
              "Qualcomm Camera AVStream Mini Driver",  // Device Text
    
              Package()
              {
                  "COMPATIBLEIDS",
                  2,                                   // Number of Compatible IDs
                  "VEN_QCOM&DEV__AVSTREAM",        // Compatible ID 1
                  "QCOM_AVSTREAM",                     // Compatible ID 2
              },
          },
      })
      Return (CHIF)
    }
    
    //------------------------------------------------------------------------------
    // DP CC status method, 0:CC1(Normal plugin), 1:CC2(Inverted plugin), 2: Open(unplugged in)
    //------------------------------------------------------------------------------
    //
    Method (DPCC, 2, NotSerialized)
    {
      // Arg0 - Panel ID
    
      // Arg1 - Data size
    
      return (\_SB_.CCST)
    }
    
    //------------------------------------------------------------------------------
    // DP Pin assignment method
    // 0x00:    No DP cable is connected
    // 0x01:    DFP_D(Downstream Facing Port DP) Pin A
    // 0x02:    DFP_D(Downstream Facing Port DP) Pin B
    // 0x03:    DFP_D(Downstream Facing Port DP) Pin C
    // 0x04:    DFP_D(Downstream Facing Port DP) Pin D
    // 0x05:    DFP_D(Downstream Facing Port DP) Pin E
    // 0x06:    DFP_D(Downstream Facing Port DP) Pin F
    // 0x07:    UFP_D(Upstream Facing Port DP)   Pin A
    // 0x08:    UFP_D(Upstream Facing Port DP)   Pin B
    // 0x09:    UFP_D(Upstream Facing Port DP)   Pin C
    // 0x0A:    UFP_D(Upstream Facing Port DP)   Pin D
    // 0x0B:    UFP_D(Upstream Facing Port DP)   Pin E
    //------------------------------------------------------------------------------
    //

    // Method (DPIN, 2, NotSerialized)
    // {
    //   // Arg0 - Panel ID
    
    //   // Arg1 - Data size
    
    //   return (\_SB_.PINA)
    // }
    
    Method (REGR)
    {
        Name (RBUF, Package()
        {
            Package()
            {
                "ForceMaxPerf",          
                0,
            },
            Package()
            {
                "ForceStablePowerSettings",
                0,
            },
            Package()
            {
                "ForceActive",           
                1,
            },
            Package()
            {
                "DeferForceActive",      
                0,
            },
            Package()
            {
                "PreventPowerCollapse",  
                0,
            },
            Package()
            {
                "DisableThermalMitigation",
                0,
            },
            Package()
            {
                "DisableTzMDSSRestore",        // 8998 Does not need TZ MDSS restore of registers.
                1,
            },
            Package()
            {
                "UseLowPTForGfxPerProcess",      // Use Low TTBR for Graphics Per-process page table.
                1,
            },
            Package()
            {
                "DisableCDI",            
                1,
            },
            Package()
            {
                "GPU64bAddrEnabled",           // Enabled GPU 64bit addressing
                1,
            },
            Package()
            {
                "MaxPreemptionOffsets",        // Maximum number of Preemption offsets.
                128,
            },
            Package()
            {
                "MaxRequiredDmaQueueEntry",      // Required DMA queue entries.
                8,
            },
            Package()
            {
                "SupportsSecureInAperture",      // Supports secure surfaces in the Aperture segment.
                1,
            },
            Package()
            {
                "ZeroFlagSupportInPTE",        // Supports zero flag in PTE
                1,
            },
            Package()
            {
                "SupportsCacheCoherency",      // Supports System wide coherency.
                1,
            },
            Package()
            {
                "SupportsSHMBridge",           // Supports SHM Bridge registration.
                0,
            },
            Package()
            {
                "SecureCarveoutSize",          // SecureCarveout Size for DRM playback
                2097152,
            },
            Package()
            {
                "UBWCEnable",                  // 0 = Disable , 1 = Enable
                0,
            },
            Package()
            {
                "allowDrmAbove1080p",          // Allow DRM playback above 1080p
                1,
            },
            Package()
            {
                "ZeroPageLowAddr",             // Lower address of zero marker page
                0x85F00000,
            },
            Package()
            {
                "ZeroPageHighAddr",            // Higher address of zero marker page
                0x0,
            },
            Package()
            {
                "KeepUefiBuffer",        
                1,
            },
            Package()
            {
                "GRAPHICS",         
                Package()
                {
                    "EnableSystemCache",           // 0 = Disable , 1 = Enable
                    1,
                },
                Package()
                {
                    "EnableSysCacheForGpuhtw",      // 0 = Disable , 1 = Enable(enable SystemCache to take effect)
                    1,
                },
                Package()
                {
                    "DCVS",             
                    Package()
                    {
                        "Enable",                      // 0 = FALSE, 1 = TRUE
                        1,
                    },
                    Package()
                    {
                        "IncreaseFilterBw",            // Hz / 65536
                        131072,
                    },
                    Package()
                    {
                        "DecreaseFilterBw",            // Hz / 65536
                        13107,
                    },
                    Package()
                    {
                        "TargetBusyPct",               // Percentage
                        85,
                    },
                    Package()
                    {
                        "SampleRate",                  // Hz
                        60,
                    },
                    Package()
                    {
                        "TargetBusyPctOffscreen",      // Percentage
                        75,
                    },
                    Package()
                    {
                        "SampleRateOffscreen",         // Hz
                        20,
                    },
                    Package()
                    {
                        "GpuResetValue",               // Hz
                        290000000,
                    },
                    Package()
                    {
                        "BusResetValue",               // MB/s
                        1200,
                    },
                },
                Package()
                {
                    "A6x",              
                    Package()
                    {
                        "DisableICG",                  // 1 = Disable GPU Clock Gating
                        0,
                    },
                    Package()
                    {
                        "DisableGmuCG",                // 1 = Disable GMU Clock Gating.  GMU CG cannot be enabled when ICG is disabled.
                        0,
                    },
                    Package()
                    {
                        "EnableFallbackToDisableSecureMode",      // 1 = Enable the fallback.  Fallback is only supported with non secure TZ.
                        0,
                    },
                    Package()
                    {
                        "DisableCPCrashDump",          // 1 = Disable the Crash Dumper
                        0,
                    },
                    Package()
                    {
                        "Preemption",                  // 1 = SW preemption, 16 (0x10) = L0, 26 (0x1A) = L1A, 27 (0x1B) = L1B, 18 (0x12) = L2
                        26,
                    },
                },
            },
            Package()
            {
                "VIDEO",            
                Package()
                {
                    "EnableSystemCache",           // 0 = Disable , 1 = Enable
                    1,
                },
            },
            Package()
            {
                "CRYPTO",           
                Package()
                {
                    "EnableCryptoVA",        
                    1,
                },
            },
            Package()
            {
                "DISPLAY",          
                Package()
                {
                    "DisableMiracast",             // Miracast Setting
                    1,
                },
                Package()
                {
                    "EnableOEMDriverDependency",      // OEM Driver Load Configuration
                    0,
                },
                Package()
                {
                    "EnableBridgeDriverDependency",      // Bridge Driver Load Configuration
                    0,
                },
                Package()
                {
                    "DisableRotator",              // Disable or Enable Rotator Engine
                    0,
                },
                Package()
                {
                    "DisableMDPBLT",               // Disable MDP BLT Engine
                    1,
                },
                Package()
                {
                    "DisableExternal",             // Disable External Display
                    3,
                },
            },
        })
        
        Return (RBUF)
    }
}
