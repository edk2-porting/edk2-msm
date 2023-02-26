Scope(\_SB.PEP0)
{

    Method(UIDL)
    {
        Return(NIDL)
    }    

    Name(NIDL,
    package(){
        "MICROPEP_IDLE",
        0x1, 
        
        package(){
            "LPR",
            "KryoSilver0", // LPR Name
            0x0, // LPR Core Mask (0xFFFFFFFF is coordinated)
            0x0, //LastMan Adder             
            
            package(){
                "MODE",
                "C1", // Mode name
                0, // Mode Latency
                0, // Mode BreakEven
                0, // Mode Flags
                0, // Mode Clock Flags
                0x00000000, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C2d", // Mode name
                1000, // Mode Latency
                4000, // Mode BreakEven
                0x0, // Mode Flags
                0, // Mode Clock Flags
                0x00000002, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C3", // Mode name
                3000, // Mode Latency
                4500, // Mode BreakEven
                0x3, // Mode Flags
                0, // Mode Clock Flags
                0x40000003, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C3_NI", // Mode name
                3000, // Mode Latency
                4500, // Mode BreakEven
                0x13, // Mode Flags
                0, // Mode Clock Flags
                0x40000004, // Mode PSCI Flags 
                
            },
    
        },
    
        package(){
            "LPR",
            "KryoSilver1", // LPR Name
            0x1, // LPR Core Mask (0xFFFFFFFF is coordinated)
            0x0, //LastMan Adder             
            
            package(){
                "MODE",
                "C1", // Mode name
                0, // Mode Latency
                0, // Mode BreakEven
                0, // Mode Flags
                0, // Mode Clock Flags
                0x00000000, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C2d", // Mode name
                1000, // Mode Latency
                4000, // Mode BreakEven
                0x0, // Mode Flags
                0, // Mode Clock Flags
                0x00000002, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C3", // Mode name
                3000, // Mode Latency
                4500, // Mode BreakEven
                0x3, // Mode Flags
                0, // Mode Clock Flags
                0x40000003, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C3_NI", // Mode name
                3000, // Mode Latency
                4500, // Mode BreakEven
                0x13, // Mode Flags
                0, // Mode Clock Flags
                0x40000004, // Mode PSCI Flags 
                
            },
    
        },
    
        package(){
            "LPR",
            "KryoSilver2", // LPR Name
            0x2, // LPR Core Mask (0xFFFFFFFF is coordinated)
            0x0, //LastMan Adder             
            
            package(){
                "MODE",
                "C1", // Mode name
                0, // Mode Latency
                0, // Mode BreakEven
                0, // Mode Flags
                0, // Mode Clock Flags
                0x00000000, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C2d", // Mode name
                1000, // Mode Latency
                4000, // Mode BreakEven
                0x0, // Mode Flags
                0, // Mode Clock Flags
                0x00000002, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C3", // Mode name
                3000, // Mode Latency
                4500, // Mode BreakEven
                0x3, // Mode Flags
                0, // Mode Clock Flags
                0x40000003, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C3_NI", // Mode name
                3000, // Mode Latency
                4500, // Mode BreakEven
                0x13, // Mode Flags
                0, // Mode Clock Flags
                0x40000004, // Mode PSCI Flags 
                
            },
    
        },
    
        package(){
            "LPR",
            "KryoSilver3", // LPR Name
            0x3, // LPR Core Mask (0xFFFFFFFF is coordinated)
            0x0, //LastMan Adder             
            
            package(){
                "MODE",
                "C1", // Mode name
                0, // Mode Latency
                0, // Mode BreakEven
                0, // Mode Flags
                0, // Mode Clock Flags
                0x00000000, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C2d", // Mode name
                1000, // Mode Latency
                4000, // Mode BreakEven
                0x0, // Mode Flags
                0, // Mode Clock Flags
                0x00000002, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C3", // Mode name
                3000, // Mode Latency
                4500, // Mode BreakEven
                0x3, // Mode Flags
                0, // Mode Clock Flags
                0x40000003, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C3_NI", // Mode name
                3000, // Mode Latency
                4500, // Mode BreakEven
                0x13, // Mode Flags
                0, // Mode Clock Flags
                0x40000004, // Mode PSCI Flags 
                
            },
    
        },
    
        package(){
            "LPR",
            "KryoGold0", // LPR Name
            0x4, // LPR Core Mask (0xFFFFFFFF is coordinated)
            0x0, //LastMan Adder             
            
            package(){
                "MODE",
                "C1", // Mode name
                0, // Mode Latency
                0, // Mode BreakEven
                0, // Mode Flags
                0, // Mode Clock Flags
                0x00000000, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C2d", // Mode name
                800, // Mode Latency
                6000, // Mode BreakEven
                0x10, // Mode Flags
                0, // Mode Clock Flags
                0x00000002, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C3", // Mode name
                900, // Mode Latency
                70000, // Mode BreakEven
                0x13, // Mode Flags
                0, // Mode Clock Flags
                0x40000003, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C3_NI", // Mode name
                900, // Mode Latency
                70000, // Mode BreakEven
                0x13, // Mode Flags
                0, // Mode Clock Flags
                0x40000004, // Mode PSCI Flags 
                
            },
    
        },
    
        package(){
            "LPR",
            "KryoGold1", // LPR Name
            0x5, // LPR Core Mask (0xFFFFFFFF is coordinated)
            0x0, //LastMan Adder             
            
            package(){
                "MODE",
                "C1", // Mode name
                0, // Mode Latency
                0, // Mode BreakEven
                0, // Mode Flags
                0, // Mode Clock Flags
                0x00000000, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C2d", // Mode name
                800, // Mode Latency
                6000, // Mode BreakEven
                0x10, // Mode Flags
                0, // Mode Clock Flags
                0x00000002, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C3", // Mode name
                900, // Mode Latency
                70000, // Mode BreakEven
                0x13, // Mode Flags
                0, // Mode Clock Flags
                0x40000003, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C3_NI", // Mode name
                900, // Mode Latency
                70000, // Mode BreakEven
                0x13, // Mode Flags
                0, // Mode Clock Flags
                0x40000004, // Mode PSCI Flags 
                
            },
    
        },
    
        package(){
            "LPR",
            "KryoGold2", // LPR Name
            0x6, // LPR Core Mask (0xFFFFFFFF is coordinated)
            0x0, //LastMan Adder             
            
            package(){
                "MODE",
                "C1", // Mode name
                0, // Mode Latency
                0, // Mode BreakEven
                0, // Mode Flags
                0, // Mode Clock Flags
                0x00000000, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C2d", // Mode name
                800, // Mode Latency
                6000, // Mode BreakEven
                0x10, // Mode Flags
                0, // Mode Clock Flags
                0x00000002, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C3", // Mode name
                900, // Mode Latency
                70000, // Mode BreakEven
                0x13, // Mode Flags
                0, // Mode Clock Flags
                0x40000003, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C3_NI", // Mode name
                900, // Mode Latency
                70000, // Mode BreakEven
                0x13, // Mode Flags
                0, // Mode Clock Flags
                0x40000004, // Mode PSCI Flags 
                
            },
    
        },
    
        package(){
            "LPR",
            "KryoGold3", // LPR Name
            0x7, // LPR Core Mask (0xFFFFFFFF is coordinated)
            0x0, //LastMan Adder             
            
            package(){
                "MODE",
                "C1", // Mode name
                0, // Mode Latency
                0, // Mode BreakEven
                0, // Mode Flags
                0, // Mode Clock Flags
                0x00000000, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C2d", // Mode name
                800, // Mode Latency
                6000, // Mode BreakEven
                0x10, // Mode Flags
                0, // Mode Clock Flags
                0x00000002, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C3", // Mode name
                900, // Mode Latency
                70000, // Mode BreakEven
                0x13, // Mode Flags
                0, // Mode Clock Flags
                0x40000003, // Mode PSCI Flags 
                
            },
    
            package(){
                "MODE",
                "C3_NI", // Mode name
                900, // Mode Latency
                70000, // Mode BreakEven
                0x13, // Mode Flags
                0, // Mode Clock Flags
                0x40000004, // Mode PSCI Flags 
                
            },
    
        },
    
        package(){
            "LPR",
            "L2_Silver", // LPR Name
            0xFFFFFFFF, // LPR Core Mask (0xFFFFFFFF is coordinated)
            0x1000000, //LastMan Adder             
            
            package(){
                "MODE",
                "D2d", // Mode name
                1300, // Mode Latency
                3000, // Mode BreakEven
                0x10, // Mode Flags
                0, // Mode Clock Flags
                0x20, // Mode PSCI Flags 
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver0", // Dependency LPR
                        "C1", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver0", // Dependency LPR
                        "C2d", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver0", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver0", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver1", // Dependency LPR
                        "C1", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver1", // Dependency LPR
                        "C2d", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver1", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver1", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver2", // Dependency LPR
                        "C1", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver2", // Dependency LPR
                        "C2d", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver2", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver2", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver3", // Dependency LPR
                        "C1", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver3", // Dependency LPR
                        "C2d", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver3", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver3", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                
            },
    
            package(){
                "MODE",
                "D2e", // Mode name
                1500, // Mode Latency
                3500, // Mode BreakEven
                0x10, // Mode Flags
                0, // Mode Clock Flags
                0x30, // Mode PSCI Flags 
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver0", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver0", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver1", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver1", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver2", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver2", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver3", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver3", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                
            },
    
            package(){
                "MODE",
                "D4", // Mode name
                9000, // Mode Latency
                64000, // Mode BreakEven
                0x10, // Mode Flags
                0, // Mode Clock Flags
                0x40, // Mode PSCI Flags 
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver0", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver0", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver1", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver1", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver2", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver2", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver3", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoSilver3", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                
            },
    
        },
    
        package(){
            "LPR",
            "L2_Gold", // LPR Name
            0xFFFFFFFF, // LPR Core Mask (0xFFFFFFFF is coordinated)
            0x1000000, //LastMan Adder             
            
            package(){
                "MODE",
                "D2d", // Mode name
                2000, // Mode Latency
                9000, // Mode BreakEven
                0x10, // Mode Flags
                0, // Mode Clock Flags
                0x20, // Mode PSCI Flags 
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoGold0", // Dependency LPR
                        "C1", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoGold0", // Dependency LPR
                        "C2d", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoGold0", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoGold0", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoGold1", // Dependency LPR
                        "C1", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoGold0", // Dependency LPR
                        "C2d", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoGold1", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoGold1", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoGold2", // Dependency LPR
                        "C1", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoGold0", // Dependency LPR
                        "C2d", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoGold2", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoGold2", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoGold3", // Dependency LPR
                        "C1", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoGold0", // Dependency LPR
                        "C2d", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoGold3", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoGold3", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                
            },
    
            package(){
                "MODE",
                "D2e", // Mode name
                4000, // Mode Latency
                10000, // Mode BreakEven
                0x10, // Mode Flags
                0, // Mode Clock Flags
                0x30, // Mode PSCI Flags 
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoGold0", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoGold0", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoGold1", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoGold1", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoGold2", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoGold2", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoGold3", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoGold3", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                
            },
    
            package(){
                "MODE",
                "D4", // Mode name
                12000, // Mode Latency
                60000, // Mode BreakEven
                0x10, // Mode Flags
                0, // Mode Clock Flags
                0x40, // Mode PSCI Flags 
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoGold0", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoGold0", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoGold1", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoGold1", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoGold2", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoGold2", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "KryoGold3", // Dependency LPR
                        "C3", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "KryoGold3", // Dependency LPR
                        "C3_NI", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                
            },
    
        },
    
        package(){
            "LPR",
            "CCI", // LPR Name
            0xFFFFFFFF, // LPR Core Mask (0xFFFFFFFF is coordinated)
            0x2000000, //LastMan Adder             
            
            package(){
                "MODE",
                "E1", // Mode name
                5000, // Mode Latency
                26000, // Mode BreakEven
                0x10, // Mode Flags
                0, // Mode Clock Flags
                0x100, // Mode PSCI Flags 
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "L2_Silver", // Dependency LPR
                        "D2e", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "L2_Silver", // Dependency LPR
                        "D4", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "L2_Gold", // Dependency LPR
                        "D2e", // Dependency Mode
                        7, // Dependency Type
                    },
    
                    package(){
                        "DEPENDENCY",
                        "L2_Gold", // Dependency LPR
                        "D4", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                
            },
    
            package(){
                "MODE",
                "E3", // Mode name
                11000, // Mode Latency
                30000, // Mode BreakEven
                0x10, // Mode Flags
                0, // Mode Clock Flags
                0x400, // Mode PSCI Flags 
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "L2_Silver", // Dependency LPR
                        "D4", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "L2_Gold", // Dependency LPR
                        "D4", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                
            },
    
            package(){
                "MODE",
                "E3+RPM", // Mode name
                11500, // Mode Latency
                35000, // Mode BreakEven
                0x10, // Mode Flags
                0, // Mode Clock Flags
                0x500, // Mode PSCI Flags 
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "L2_Silver", // Dependency LPR
                        "D4", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "L2_Gold", // Dependency LPR
                        "D4", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                
            },
    
        },
    
        package(){
            "LPR",
            "platform", // LPR Name
            0xFFFFFFFF, // LPR Core Mask (0xFFFFFFFF is coordinated)
            0x0, //LastMan Adder             
            
            package(){
                "MODE",
                "xo", // Mode name
                5000, // Mode Latency
                330000, // Mode BreakEven
                32, // Mode Flags
                0x10, // Mode Clock Flags
                0xFFFFFE00, // Mode PSCI Flags 
                package(){
                    "DEPENDENCY_CONTAINER",
                    
                    package(){
                        "DEPENDENCY",
                        "CCI", // Dependency LPR
                        "E3+RPM", // Dependency Mode
                        7, // Dependency Type
                    },
    
                },
    
                
            },
    
        },
    
    })
    
}
