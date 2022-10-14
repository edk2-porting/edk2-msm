Device (GPU0)
{
    Name (_HID, "QCOM007C")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_CID, "ACPIQCOM007C")  // _CID: Compatible ID
    Name (_UID, Zero)  // _UID: Unique ID
    Name (_HRV, 0x7C)  // _HRV: Hardware Revision
    Device (MON0)
    {
        Method (_ADR, 0, NotSerialized)  // _ADR: Address
        {
            Return (Zero)
        }
    }

    Name (_DEP, Package (0x08)  // _DEP: Dependencies
    {
        \_SB.MMU0, 
        \_SB.MMU1, 
        \_SB.PEP0, 
        \_SB.PMIC, 
        \_SB.PILC, 
        \_SB.RPEN, 
        \_SB.TREE, 
        \_SB.SCM0
    })
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x0C900000,         // Address Base
                0x000BA008,         // Address Length
                )
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x00000073,
            }
            Memory32Fixed (ReadWrite,
                0x05000000,         // Address Base
                0x0003F000,         // Address Length
                )
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x0000014C,
            }
            Memory32Fixed (ReadWrite,
                0x0CC00000,         // Address Base
                0x00100000,         // Address Length
                )
            Memory32Fixed (ReadWrite,
                0x0C880000,         // Address Base
                0x00000800,         // Address Length
                )
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x0000013F,
            }
            Memory32Fixed (ReadWrite,
                0x0C9E0000,         // Address Base
                0x0000002C,         // Address Length
                )
            GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionNone,
                "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x005E
                }
        })
        Return (RBUF) /* \_SB_.GPU0._CRS.RBUF */
    }

    Method (RESI, 0, NotSerialized)
    {
        Name (RINF, Package (0x0B)
        {
            0x03, 
            Zero, 
            Package (0x03)
            {
                "RESOURCE", 
                "MDP_REGS", 
                "DISPLAY"
            }, 

            Package (0x03)
            {
                "RESOURCE", 
                "VSYNC_INTERRUPT", 
                "DISPLAY"
            }, 

            Package (0x03)
            {
                "RESOURCE", 
                "GFX_REGS", 
                "GRAPHICS"
            }, 

            Package (0x03)
            {
                "RESOURCE", 
                "GFX_INTERRUPT", 
                "GRAPHICS"
            }, 

            Package (0x03)
            {
                "RESOURCE", 
                "VIDEO_REGS", 
                "VIDEO"
            }, 

            Package (0x03)
            {
                "RESOURCE", 
                "VIDEO_VMEM_REGS", 
                "VIDEO"
            }, 

            Package (0x03)
            {
                "RESOURCE", 
                "VIDC_INTERRUPT", 
                "VIDEO"
            }, 

            Package (0x03)
            {
                "RESOURCE", 
                "SE_CTRL_REGS", 
                "DISPLAY"
            }, 

            Package (0x03)
            {
                "RESOURCE", 
                "DSI_PANEL_EN", 
                "DISPLAY"
            }
        })
        Return (RINF) /* \_SB_.GPU0.RESI.RINF */
    }

    Method (ENGS, 0, NotSerialized)
    {
        Name (EBUF, Package (0x06)
        {
            0x03, 
            0x02, 
            0x0033000A, 
            Package (0x08)
            {
                "ENGINES", 
                0x06, 
                Package (0x0A)
                {
                    "ENGINE", 
                    "GRAPHICS", 
                    "Adreno5X", 
                    One, 
                    One, 
                    Zero, 
                    Package (0x0B)
                    {
                        "MMUINFO", 
                        "Miniport", 
                        "ArmSmmuV2", 
                        0x02, 
                        0x31, 
                        "V8L", 
                        "SMMUID", 
                        ToUUID ("9833c712-3292-4ffb-b0f4-2bd20e1f7f66"), 
                        "SMMUINTERFACEID", 
                        Buffer (0x10)
                        {
                            /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                        }, 

                        Package (0x05)
                        {
                            "PAGETABLEUSAGE", 
                            0x03, 
                            "GraphicsGlobalPT", 
                            "GraphicsPerProcessPT", 
                            "GraphicsSecurePT"
                        }
                    }, 

                    Package (0x03)
                    {
                        "PERF_CONTROLS", 
                        Package (0x02)
                        {
                            0x02, 
                            Package (0x02)
                            {
                                "LimitForPassiveCooling", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            0x03, 
                            Package (0x02)
                            {
                                "LimitForPassiveCooling", 
                                One
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "THERMAL_DOMAINS", 
                        "GPU"
                    }, 

                    Package (0x05)
                    {
                        "PROPERTIES", 
                        0x03, 
                        Package (0x02)
                        {
                            "GmemBaseAddr", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "GmemSize", 
                            0x00100000
                        }, 

                        Package (0x02)
                        {
                            "SMMUCount", 
                            One
                        }
                    }
                }, 

                Package (0x09)
                {
                    "ENGINE", 
                    "MDPBLT", 
                    "MDP5.x", 
                    0x02, 
                    One, 
                    Zero, 
                    Package (0x02)
                    {
                        "SHAREDSMMU", 
                        "ROTATOR"
                    }, 

                    Package (0x03)
                    {
                        "PERF_CONTROLS", 
                        Package (0x02)
                        {
                            0x02, 
                            Package (0x02)
                            {
                                "LimitForPassiveCooling", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            0x03, 
                            Package (0x02)
                            {
                                "LimitForPassiveCooling", 
                                One
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "THERMAL_DOMAINS", 
                        "GPU"
                    }
                }, 

                Package (0x09)
                {
                    "ENGINE", 
                    "ROTATOR", 
                    "MDP5.x", 
                    0x03, 
                    One, 
                    Zero, 
                    Package (0x0B)
                    {
                        "MMUINFO", 
                        "Miniport", 
                        "ArmSmmuV2", 
                        0x02, 
                        0x20, 
                        "V7S", 
                        "SMMUID", 
                        ToUUID ("665e0f8e-add3-49d1-91bc-5540c5f57fba"), 
                        "SMMUINTERFACEID", 
                        Buffer (0x10)
                        {
                            /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                        }, 

                        Package (0x04)
                        {
                            "PAGETABLEUSAGE", 
                            0x02, 
                            "MdpNonSecurePT", 
                            "MdpSecurePT"
                        }
                    }, 

                    Package (0x03)
                    {
                        "PERF_CONTROLS", 
                        Package (0x02)
                        {
                            0x02, 
                            Package (0x02)
                            {
                                "LimitForPassiveCooling", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            0x03, 
                            Package (0x02)
                            {
                                "LimitForPassiveCooling", 
                                One
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "THERMAL_DOMAINS", 
                        "GPU"
                    }
                }, 

                Package (0x0A)
                {
                    "ENGINE", 
                    "VIDEO", 
                    "Venus", 
                    0x04, 
                    One, 
                    Zero, 
                    Package (0x0B)
                    {
                        "MMUINFO", 
                        "Engine", 
                        "ArmSmmuV2", 
                        0x02, 
                        0x20, 
                        "V7S", 
                        "SMMUID", 
                        ToUUID ("665e0f8e-add3-49d1-91bc-5540c5f57fba"), 
                        "SMMUINTERFACEID", 
                        ToUUID ("1c3fc0e8-0b11-4ee0-be89-3e21420a865f"), 
                        Package (0x07)
                        {
                            "PAGETABLEUSAGE", 
                            0x05, 
                            "VideoNonSecurePT", 
                            "VideoSecurePT1", 
                            "VideoSecurePT2", 
                            "VideoSecurePT3", 
                            "VideoSecurePT4"
                        }
                    }, 

                    Package (0x03)
                    {
                        "PERF_CONTROLS", 
                        Package (0x01)
                        {
                            0x02
                        }, 

                        Package (0x01)
                        {
                            0x03
                        }
                    }, 

                    Package (0x01)
                    {
                        "THERMAL_DOMAINS"
                    }, 

                    Package (0x06)
                    {
                        "PROPERTIES", 
                        0x04, 
                        Package (0x02)
                        {
                            "DecMaxFps", 
                            0x3C
                        }, 

                        Package (0x02)
                        {
                            "VmemBaseAddr", 
                            0x14800000
                        }, 

                        Package (0x02)
                        {
                            "VmemSize", 
                            0x00080000
                        }, 

                        Package (0x02)
                        {
                            "VmemNumBanks", 
                            0x04
                        }
                    }
                }, 

                Package (0x08)
                {
                    "ENGINE", 
                    "CRYPTO", 
                    "Crypto1.0", 
                    0x05, 
                    One, 
                    Zero, 
                    Package (0x02)
                    {
                        "PERF_CONTROLS", 
                        Package (0x01)
                        {
                            0x02
                        }
                    }, 

                    Package (0x01)
                    {
                        "THERMAL_DOMAINS"
                    }
                }, 

                Package (0x08)
                {
                    "ENGINE", 
                    "VIDEO_ENCODER", 
                    "Venus", 
                    0x06, 
                    One, 
                    Zero, 
                    Package (0x03)
                    {
                        "PERF_CONTROLS", 
                        Package (0x01)
                        {
                            0x02
                        }, 

                        Package (0x01)
                        {
                            0x03
                        }
                    }, 

                    Package (0x01)
                    {
                        "THERMAL_DOMAINS"
                    }
                }
            }, 

            Package (0x08)
            {
                "DISPLAYS", 
                "MDP5.x", 
                0x03, 
                Package (0x07)
                {
                    "DISPLAY", 
                    "INTERNAL1", 
                    Zero, 
                    One, 
                    Zero, 
                    Package (0x04)
                    {
                        "PERF_CONTROLS", 
                        Package (0x01)
                        {
                            0x02
                        }, 

                        Package (0x01)
                        {
                            0x03
                        }, 

                        Package (0x01)
                        {
                            0x04
                        }
                    }, 

                    Package (0x01)
                    {
                        "THERMAL_DOMAINS"
                    }
                }, 

                Package (0x07)
                {
                    "DISPLAY", 
                    "INTERNAL2", 
                    0x07, 
                    One, 
                    Zero, 
                    Package (0x04)
                    {
                        "PERF_CONTROLS", 
                        Package (0x01)
                        {
                            0x02
                        }, 

                        Package (0x01)
                        {
                            0x03
                        }, 

                        Package (0x01)
                        {
                            0x04
                        }
                    }, 

                    Package (0x01)
                    {
                        "THERMAL_DOMAINS"
                    }
                }, 

                Package (0x07)
                {
                    "DISPLAY", 
                    "EXTERNAL1", 
                    0x08, 
                    One, 
                    Zero, 
                    Package (0x03)
                    {
                        "PERF_CONTROLS", 
                        Package (0x01)
                        {
                            0x02
                        }, 

                        Package (0x01)
                        {
                            0x03
                        }
                    }, 

                    Package (0x01)
                    {
                        "THERMAL_DOMAINS"
                    }
                }, 

                Package (0x03)
                {
                    "RESOURCES", 
                    Package (0x0B)
                    {
                        "MMUINFO", 
                        "Miniport", 
                        "ArmSmmuV2", 
                        0x02, 
                        0x20, 
                        "V7S", 
                        "SMMUID", 
                        ToUUID ("665e0f8e-add3-49d1-91bc-5540c5f57fba"), 
                        "SMMUINTERFACEID", 
                        Buffer (0x10)
                        {
                            /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                        }, 

                        Package (0x04)
                        {
                            "PAGETABLEUSAGE", 
                            0x02, 
                            "MdpNonSecurePT", 
                            "MdpSecurePT"
                        }
                    }, 

                    Package (0x03)
                    {
                        "PROPERTIES", 
                        One, 
                        Package (0x02)
                        {
                            "DisableHDMI", 
                            Zero
                        }
                    }
                }, 

                Package (0x0A)
                {
                    "PRIMARY_SOURCE_MODES", 
                    0x08,
                    Package (0x02)
                    {
                        1080, 
                        1920
                    },
                    
                    Package (0x02)
                    {
                        1080, 
                        1400
                    },
                    
                    Package (0x02)
                    {
                        720, 
                        1280
                    }, 
                    
                    Package (0x02)
                    {
                        720, 
                        960
                    }, 
                    
                    Package (0x02)
                    {
                        600, 
                        1066
                    }, 
                    
                    Package (0x02)
                    {
                        600, 
                        800
                    },
                    
                    Package (0x02)
                    {
                        480, 
                        854
                    }, 

                    Package (0x02)
                    {
                        480, 
                        640
                    }
                }
            }, 

            Package (0x0C)
            {
                "PAGETABLES", 
                0x0A, 
                Package (0x07)
                {
                    "GraphicsGlobalPT", 
                    One, 
                    Zero, 
                    One, 
                    One, 
                    0x0000008000000000, 
                    0x0000000800000000
                }, 

                Package (0x07)
                {
                    "GraphicsPerProcessPT", 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x00400000, 
                    0x0000007FFFC00000
                }, 

                Package (0x07)
                {
                    "GraphicsSecurePT", 
                    Zero, 
                    One, 
                    Zero, 
                    One, 
                    0x0000008800000000, 
                    0x40000000
                }, 

                Package (0x07)
                {
                    "MdpNonSecurePT", 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x00100000, 
                    0xDFF00000
                }, 

                Package (0x07)
                {
                    "MdpSecurePT", 
                    Zero, 
                    One, 
                    Zero, 
                    One, 
                    0xE0000000, 
                    0x20000000
                }, 

                Package (0x09)
                {
                    "VideoNonSecurePT", 
                    Zero, 
                    Zero, 
                    Zero, 
                    One, 
                    0x00100000, 
                    0xBFF00000, 
                    0x1B, 
                    Zero
                }, 

                Package (0x09)
                {
                    "VideoSecurePT1", 
                    Zero, 
                    One, 
                    Zero, 
                    One, 
                    0xC0000000, 
                    0x10000000, 
                    0x09, 
                    One
                }, 

                Package (0x09)
                {
                    "VideoSecurePT2", 
                    Zero, 
                    One, 
                    Zero, 
                    One, 
                    0xD0000000, 
                    0x10000000, 
                    0x07, 
                    0x02
                }, 

                Package (0x09)
                {
                    "VideoSecurePT3", 
                    Zero, 
                    One, 
                    Zero, 
                    One, 
                    0xE0000000, 
                    0x10000000, 
                    0x02, 
                    0x03
                }, 

                Package (0x09)
                {
                    "VideoSecurePT4", 
                    Zero, 
                    One, 
                    Zero, 
                    One, 
                    0xF0000000, 
                    0x10000000, 
                    0x2A, 
                    0x04
                }
            }
        })
        Return (EBUF) /* \_SB_.GPU0.ENGS.EBUF */
    }

    Method (TMDT, 0, NotSerialized)
    {
        Name (RBUF, Package (0x03)
        {
            One, 
            Zero, 
            Package (0x03)
            {
                "THERMAL_DOMAINS", 
                One, 
                Package (0x03)
                {
                    "GPU", 
                    "GPU0", 
                    Package (0x03)
                    {
                        "GRAPHICS", 
                        "MDPBLT", 
                        "ROTATOR"
                    }
                }
            }
        })
        Return (RBUF) /* \_SB_.GPU0.TMDT.RBUF */
    }

    Method (PMCL, 0, NotSerialized)
    {
        Name (RBUF, Package (0x0E)
        {
            0x03, 
            One, 
            0x0B, 
            Package (0x10)
            {
                "COMPONENT", 
                Zero, 
                ToUUID ("2c135991-4391-4633-90b1-fa96f2e2cc04"), 
                "PRIMDISPLAY_POWER_STATES", 
                "HW_BLOCK_MDP", 
                Package (0x02)
                {
                    "DISPLAY", 
                    "INTERNAL1"
                }, 

                0x02, 
                0x05, 
                Package (0x06)
                {
                    "FSTATE", 
                    Zero, 
                    "ALL_ON", 
                    Zero, 
                    Zero, 
                    0x02
                }, 

                Package (0x06)
                {
                    "FSTATE", 
                    One, 
                    "PWR_OFF", 
                    One, 
                    One, 
                    One
                }, 

                Package (0x09)
                {
                    "PSTATE_SET", 
                    Zero, 
                    "INTERNAL1_RESET", 
                    "*", 
                    "RESET", 
                    One, 
                    Zero, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        One, 
                        0x02
                    }
                }, 

                Package (0x0A)
                {
                    "PSTATE_SET", 
                    One, 
                    "INTERNAL1_FOOTSWITCH_OVERRIDE", 
                    "*", 
                    "FOOTSWITCH_OVERRIDE", 
                    0x02, 
                    0xFFFFFFFF, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        One, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        Zero, 
                        0x02
                    }
                }, 

                Package (0x0D)
                {
                    "PSTATE_SET", 
                    0x02, 
                    "INTERNAL1_SCAN_CONTROL", 
                    "*", 
                    "DISPLAY_SOURCE_SCAN_CTRL", 
                    0x05, 
                    Zero, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        0x04, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        0x03, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x02, 
                        0x02, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x03, 
                        One, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x04, 
                        Zero, 
                        0x02
                    }
                }, 

                Package (0x12)
                {
                    "PSTATE_SET", 
                    0x03, 
                    "INTERNAL1_CORE_CLOCK_CONTROL", 
                    "*", 
                    "CORE_CLOCK", 
                    0x0A, 
                    0x03, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        0x18964020, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        0x13AB6680, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x02, 
                        0x11E1A300, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x03, 
                        0x10642AC0, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x04, 
                        0x0BEBC200, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x05, 
                        0x0A37CADB, 
                        0x03
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x06, 
                        0x08F0D180, 
                        0x03
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x07, 
                        0x05F5E100, 
                        0x03
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x08, 
                        0x051BE56E, 
                        0x03
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x09, 
                        Zero, 
                        0x03
                    }
                }, 

                Package (0x32)
                {
                    "PSTATE_SET", 
                    0x04, 
                    "INTERNAL1_EBI_BANDWIDTH", 
                    "*", 
                    "BANDWIDTH", 
                    0x2A, 
                    0x21, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        0x000000025A01C500, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        0x00000002422A4100, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x02, 
                        0x000000022A52BD00, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x03, 
                        0x00000002127B3900, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x04, 
                        0x00000001FAA3B500, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x05, 
                        0x00000001E2CC3100, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x06, 
                        0x00000001CAF4AD00, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x07, 
                        0x00000001B31D2900, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x08, 
                        0x000000019B45A500, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x09, 
                        0x00000001836E2100, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0A, 
                        0x000000016B969D00, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0B, 
                        0x0000000153BF1900, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0C, 
                        0x000000013BE79500, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0D, 
                        0x0000000124101100, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0E, 
                        0x000000010C388D00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0F, 
                        0xF4610900, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x10, 
                        0xDC898500, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x11, 
                        0xC4B20100, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x12, 
                        0xACDA7D00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x13, 
                        0x9502F900, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x14, 
                        0x8F0D1800, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x15, 
                        0x89173700, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x16, 
                        0x83215600, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x17, 
                        0x7D2B7500, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x18, 
                        0x77359400, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x19, 
                        0x713FB300, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1A, 
                        0x6B49D200, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1B, 
                        0x6553F100, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1C, 
                        0x5F5E1000, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1D, 
                        0x59682F00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1E, 
                        0x53724E00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1F, 
                        0x4D7C6D00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x20, 
                        0x47868C00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x21, 
                        0x4190AB00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x22, 
                        0x3B9ACA00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x23, 
                        0x35A4E900, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x24, 
                        0x2FAF0800, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x25, 
                        0x29B92700, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x26, 
                        0x23C34600, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x27, 
                        0x1DCD6500, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x28, 
                        0x17D78400, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x29, 
                        Zero, 
                        0x02
                    }
                }, 

                Package (0x03)
                {
                    "PROVIDERS", 
                    One, 
                    Package (0x01)
                    {
                        0x09
                    }
                }
            }, 

            Package (0x0E)
            {
                "COMPONENT", 
                One, 
                ToUUID ("30bdf1b5-28f7-4c0c-ac47-273dd1401e11"), 
                "GRAPHICS_POWER_STATES", 
                "HW_BLOCK_GRAPHICS", 
                Package (0x02)
                {
                    "ENGINE", 
                    "GRAPHICS"
                }, 

                0x02, 
                0x04, 
                Package (0x06)
                {
                    "FSTATE", 
                    Zero, 
                    "ALL_ON", 
                    Zero, 
                    Zero, 
                    0x02
                }, 

                Package (0x06)
                {
                    "FSTATE", 
                    One, 
                    "PWR_OFF", 
                    0x000186A0, 
                    Zero, 
                    One
                }, 

                Package (0x0A)
                {
                    "PSTATE_SET", 
                    Zero, 
                    "GRAPHICS_RESET", 
                    "*", 
                    "RESET", 
                    0x02, 
                    Zero, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        One, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        Zero, 
                        0x02
                    }
                }, 

                Package (0x0A)
                {
                    "PSTATE_SET", 
                    One, 
                    "GRAPHICS_FOOTSWITCH_OVERRIDE", 
                    "*", 
                    "FOOTSWITCH_OVERRIDE", 
                    0x02, 
                    One, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        One, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        Zero, 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "PSTATE_SET", 
                    0x02
                }, 

                Package (0x02)
                {
                    "PSTATE_SET", 
                    0x03
                }
            }, 

            Package (0x0F)
            {
                "COMPONENT", 
                0x02, 
                ToUUID ("07ca2add-df87-49e1-8583-08687dc81c8e"), 
                "MDPBLT_POWER_STATES", 
                "HW_BLOCK_MDP", 
                Package (0x02)
                {
                    "ENGINE", 
                    "MDPBLT"
                }, 

                0x03, 
                0x04, 
                Package (0x06)
                {
                    "FSTATE", 
                    Zero, 
                    "ALL_ON", 
                    Zero, 
                    Zero, 
                    0x03
                }, 

                Package (0x06)
                {
                    "FSTATE", 
                    One, 
                    "CLK_OFF", 
                    0x2710, 
                    Zero, 
                    0x02
                }, 

                Package (0x06)
                {
                    "FSTATE", 
                    0x02, 
                    "PWR_OFF", 
                    0x000186A0, 
                    Zero, 
                    One
                }, 

                Package (0x09)
                {
                    "PSTATE_SET", 
                    Zero, 
                    "MDPBLT_RESET", 
                    "*", 
                    "RESET", 
                    One, 
                    Zero, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        One, 
                        0x02
                    }
                }, 

                Package (0x0A)
                {
                    "PSTATE_SET", 
                    One, 
                    "MDPBLT_FOOTSWITCH_OVERRIDE", 
                    "*", 
                    "FOOTSWITCH_OVERRIDE", 
                    0x02, 
                    0xFFFFFFFF, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        One, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        Zero, 
                        0x02
                    }
                }, 

                Package (0x12)
                {
                    "PSTATE_SET", 
                    0x02, 
                    "MDPBLT_CORE_CLOCK_CONTROL", 
                    "*", 
                    "CORE_CLOCK", 
                    0x0A, 
                    0x06, 
                    Zero, 
                    Package (0x05)
                    {
                        "PSTATE", 
                        Zero, 
                        0x18964020, 
                        Zero, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x64
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        One, 
                        0x13AB6680, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x4B
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x02, 
                        0x11E1A300, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x4B
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x03, 
                        0x10642AC0, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x32
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x04, 
                        0x0BEBC200, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x32
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x05, 
                        0x0A37CADB, 
                        0x03, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x06, 
                        0x08F0D180, 
                        0x03, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x07, 
                        0x05F5E100, 
                        0x03, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x08, 
                        0x051BE56E, 
                        0x03, 
                        Package (0x02)
                        {
                            "GPU", 
                            Zero
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x09, 
                        Zero, 
                        0x03, 
                        Package (0x02)
                        {
                            "GPU", 
                            Zero
                        }
                    }
                }, 

                Package (0x32)
                {
                    "PSTATE_SET", 
                    0x03, 
                    "MDPBLT_AXI_BANDWIDTH_CONTROL", 
                    "*", 
                    "BANDWIDTH", 
                    0x2A, 
                    0xFFFFFFFF, 
                    Zero, 
                    Package (0x05)
                    {
                        "PSTATE", 
                        Zero, 
                        0x000000025A01C500, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x64
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        One, 
                        0x00000002422A4100, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x4B
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x02, 
                        0x000000022A52BD00, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x4B
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x03, 
                        0x00000002127B3900, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x4B
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x04, 
                        0x00000001FAA3B500, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x4B
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x05, 
                        0x00000001E2CC3100, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x4B
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x06, 
                        0x00000001CAF4AD00, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x4B
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x07, 
                        0x00000001B31D2900, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x4B
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x08, 
                        0x000000019B45A500, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x32
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x09, 
                        0x00000001836E2100, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x32
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x0A, 
                        0x000000016B969D00, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x32
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x0B, 
                        0x0000000153BF1900, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x32
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x0C, 
                        0x000000013BE79500, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x32
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x0D, 
                        0x0000000124101100, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x32
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x0E, 
                        0x000000010C388D00, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x32
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x0F, 
                        0xF4610900, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x32
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x10, 
                        0xDC898500, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x11, 
                        0xC4B20100, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x12, 
                        0xACDA7D00, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x13, 
                        0x9502F900, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x14, 
                        0x8F0D1800, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x15, 
                        0x89173700, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x16, 
                        0x83215600, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x17, 
                        0x7D2B7500, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x18, 
                        0x77359400, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x19, 
                        0x713FB300, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x1A, 
                        0x6B49D200, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x1B, 
                        0x6553F100, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x1C, 
                        0x5F5E1000, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x1D, 
                        0x59682F00, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x1E, 
                        0x53724E00, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x1F, 
                        0x4D7C6D00, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x20, 
                        0x47868C00, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x21, 
                        0x4190AB00, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x22, 
                        0x3B9ACA00, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x23, 
                        0x35A4E900, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            Zero
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x24, 
                        0x2FAF0800, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            Zero
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x25, 
                        0x29B92700, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            Zero
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x26, 
                        0x23C34600, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            Zero
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x27, 
                        0x1DCD6500, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            Zero
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x28, 
                        0x17D78400, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            Zero
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x29, 
                        Zero, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            Zero
                        }
                    }
                }
            }, 

            Package (0x0F)
            {
                "COMPONENT", 
                0x03, 
                ToUUID ("4d5ffbf5-d791-41cd-89cb-0154129ba607"), 
                "ROTATOR_POWER_STATES", 
                "HW_BLOCK_MDP", 
                Package (0x02)
                {
                    "ENGINE", 
                    "ROTATOR"
                }, 

                0x03, 
                0x04, 
                Package (0x06)
                {
                    "FSTATE", 
                    Zero, 
                    "ALL_ON", 
                    Zero, 
                    Zero, 
                    0x03
                }, 

                Package (0x06)
                {
                    "FSTATE", 
                    One, 
                    "CLK_OFF", 
                    0x2710, 
                    Zero, 
                    0x02
                }, 

                Package (0x06)
                {
                    "FSTATE", 
                    0x02, 
                    "PWR_OFF", 
                    0x000186A0, 
                    Zero, 
                    One
                }, 

                Package (0x09)
                {
                    "PSTATE_SET", 
                    Zero, 
                    "ROTATOR_RESET", 
                    "*", 
                    "RESET", 
                    One, 
                    Zero, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        One, 
                        0x02
                    }
                }, 

                Package (0x0A)
                {
                    "PSTATE_SET", 
                    One, 
                    "ROTATOR_FOOTSWITCH_OVERRIDE", 
                    "*", 
                    "FOOTSWITCH_OVERRIDE", 
                    0x02, 
                    0xFFFFFFFF, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        One, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        Zero, 
                        0x02
                    }
                }, 

                Package (0x0D)
                {
                    "PSTATE_SET", 
                    0x02, 
                    "ROTATOR_CORE_CLOCK_CONTROL", 
                    "*", 
                    "CORE_CLOCK", 
                    0x05, 
                    0x03, 
                    Zero, 
                    Package (0x05)
                    {
                        "PSTATE", 
                        Zero, 
                        0x18964020, 
                        Zero, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x64
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        One, 
                        0x13AB6680, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x4B
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x02, 
                        0x10642AC0, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x32
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x03, 
                        0x0A37CADB, 
                        0x03, 
                        Package (0x02)
                        {
                            "GPU", 
                            Zero
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x04, 
                        Zero, 
                        0x03, 
                        Package (0x02)
                        {
                            "GPU", 
                            Zero
                        }
                    }
                }, 

                Package (0x32)
                {
                    "PSTATE_SET", 
                    0x03, 
                    "ROTATOR_AXI_BANDWIDTH_CONTROL", 
                    "*", 
                    "BANDWIDTH", 
                    0x2A, 
                    0xFFFFFFFF, 
                    Zero, 
                    Package (0x05)
                    {
                        "PSTATE", 
                        Zero, 
                        0x000000025A01C500, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x64
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        One, 
                        0x00000002422A4100, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x4B
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x02, 
                        0x000000022A52BD00, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x4B
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x03, 
                        0x00000002127B3900, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x4B
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x04, 
                        0x00000001FAA3B500, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x4B
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x05, 
                        0x00000001E2CC3100, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x4B
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x06, 
                        0x00000001CAF4AD00, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x4B
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x07, 
                        0x00000001B31D2900, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x4B
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x08, 
                        0x000000019B45A500, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x32
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x09, 
                        0x00000001836E2100, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x32
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x0A, 
                        0x000000016B969D00, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x32
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x0B, 
                        0x0000000153BF1900, 
                        One, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x32
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x0C, 
                        0x000000013BE79500, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x32
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x0D, 
                        0x0000000124101100, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x32
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x0E, 
                        0x000000010C388D00, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x32
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x0F, 
                        0xF4610900, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x32
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x10, 
                        0xDC898500, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x11, 
                        0xC4B20100, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x12, 
                        0xACDA7D00, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x13, 
                        0x9502F900, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x14, 
                        0x8F0D1800, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x15, 
                        0x89173700, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x16, 
                        0x83215600, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x17, 
                        0x7D2B7500, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x18, 
                        0x77359400, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x19, 
                        0x713FB300, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x1A, 
                        0x6B49D200, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x1B, 
                        0x6553F100, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x1C, 
                        0x5F5E1000, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x1D, 
                        0x59682F00, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x1E, 
                        0x53724E00, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x1F, 
                        0x4D7C6D00, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x20, 
                        0x47868C00, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x21, 
                        0x4190AB00, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x22, 
                        0x3B9ACA00, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            0x19
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x23, 
                        0x35A4E900, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            Zero
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x24, 
                        0x2FAF0800, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            Zero
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x25, 
                        0x29B92700, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            Zero
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x26, 
                        0x23C34600, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            Zero
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x27, 
                        0x1DCD6500, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            Zero
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x28, 
                        0x17D78400, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            Zero
                        }
                    }, 

                    Package (0x05)
                    {
                        "PSTATE", 
                        0x29, 
                        Zero, 
                        0x02, 
                        Package (0x02)
                        {
                            "GPU", 
                            Zero
                        }
                    }
                }
            }, 

            Package (0x0F)
            {
                "COMPONENT", 
                0x04, 
                ToUUID ("d0e1bb1a-703d-4be8-b450-64a4fbfca6a8"), 
                "VIDEO_POWER_STATES", 
                "HW_BLOCK_VIDEO", 
                Package (0x02)
                {
                    "ENGINE", 
                    "VIDEO"
                }, 

                0x03, 
                0x04, 
                Package (0x06)
                {
                    "FSTATE", 
                    Zero, 
                    "ALL_ON", 
                    Zero, 
                    Zero, 
                    0x03
                }, 

                Package (0x06)
                {
                    "FSTATE", 
                    One, 
                    "CLK_OFF", 
                    0x2710, 
                    Zero, 
                    0x02
                }, 

                Package (0x06)
                {
                    "FSTATE", 
                    0x02, 
                    "PWR_OFF", 
                    0x000186A0, 
                    Zero, 
                    One
                }, 

                Package (0x0A)
                {
                    "PSTATE_SET", 
                    Zero, 
                    "VIDEO_RESET", 
                    "*", 
                    "RESET", 
                    0x02, 
                    Zero, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        One, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        Zero, 
                        0x02
                    }
                }, 

                Package (0x0A)
                {
                    "PSTATE_SET", 
                    One, 
                    "VIDEO_FOOTSWITCH_OVERRIDE", 
                    "*", 
                    "FOOTSWITCH_OVERRIDE", 
                    0x02, 
                    One, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        One, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        Zero, 
                        0x02
                    }
                }, 

                Package (0x0E)
                {
                    "PSTATE_SET", 
                    0x02, 
                    "VIDEO_CORE_CLOCK_CONTROL", 
                    "*", 
                    "CORE_CLOCK", 
                    0x06, 
                    0x04, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        0x1FC4EF40, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        0x1A76E700, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x02, 
                        0x1528DEC0, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x03, 
                        0x10089D40, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x04, 
                        0x0BEBC200, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x05, 
                        Zero, 
                        0x03
                    }
                }, 

                Package (0x45)
                {
                    "PSTATE_SET", 
                    0x03, 
                    "VIDEO_AXI_PORT_BW", 
                    "*", 
                    "BANDWIDTH", 
                    0x3D, 
                    0x3A, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        0x00000002CB417800, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        0x00000002BF55B600, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x02, 
                        0x00000002B369F400, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x03, 
                        0x00000002A77E3200, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x04, 
                        0x000000029B927000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x05, 
                        0x000000028FA6AE00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x06, 
                        0x0000000283BAEC00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x07, 
                        0x0000000277CF2A00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x08, 
                        0x000000026BE36800, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x09, 
                        0x000000025FF7A600, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0A, 
                        0x00000002540BE400, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0B, 
                        0x0000000248202200, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0C, 
                        0x000000023C346000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0D, 
                        0x0000000230489E00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0E, 
                        0x00000002245CDC00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0F, 
                        0x0000000218711A00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x10, 
                        0x000000020C855800, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x11, 
                        0x0000000200999600, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x12, 
                        0x00000001F4ADD400, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x13, 
                        0x00000001E8C21200, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x14, 
                        0x00000001DCD65000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x15, 
                        0x00000001D0EA8E00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x16, 
                        0x00000001C4FECC00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x17, 
                        0x00000001B9130A00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x18, 
                        0x00000001AD274800, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x19, 
                        0x00000001A13B8600, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1A, 
                        0x00000001954FC400, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1B, 
                        0x0000000189640200, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1C, 
                        0x000000017D784000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1D, 
                        0x00000001718C7E00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1E, 
                        0x0000000165A0BC00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1F, 
                        0x0000000159B4FA00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x20, 
                        0x000000014DC93800, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x21, 
                        0x0000000141DD7600, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x22, 
                        0x0000000135F1B400, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x23, 
                        0x000000012A05F200, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x24, 
                        0x000000011E1A3000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x25, 
                        0x00000001122E6E00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x26, 
                        0x000000010642AC00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x27, 
                        0xFA56EA00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x28, 
                        0xEE6B2800, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x29, 
                        0xE27F6600, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x2A, 
                        0xD693A400, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x2B, 
                        0xCAA7E200, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x2C, 
                        0xBEBC2000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x2D, 
                        0xB2D05E00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x2E, 
                        0xA6E49C00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x2F, 
                        0x9AF8DA00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x30, 
                        0x8F0D1800, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x31, 
                        0x83215600, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x32, 
                        0x77359400, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x33, 
                        0x6B49D200, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x34, 
                        0x5F5E1000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x35, 
                        0x53724E00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x36, 
                        0x47868C00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x37, 
                        0x3B9ACA00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x38, 
                        0x2FAF0800, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x39, 
                        0x23C34600, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x3A, 
                        0x17D78400, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x3B, 
                        0x0BEBC200, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x3C, 
                        Zero, 
                        0x02
                    }
                }
            }, 

            Package (0x0D)
            {
                "COMPONENT", 
                0x05, 
                ToUUID ("cc4d73fa-c3c2-4c7e-a217-d468f4611bbd"), 
                "CRYPTO_POWER_STATES", 
                "HW_BLOCK_NONE", 
                Package (0x02)
                {
                    "ENGINE", 
                    "CRYPTO"
                }, 

                0x02, 
                0x03, 
                Package (0x06)
                {
                    "FSTATE", 
                    Zero, 
                    "ALL_ON", 
                    Zero, 
                    Zero, 
                    0x03
                }, 

                Package (0x06)
                {
                    "FSTATE", 
                    One, 
                    "PWR_OFF", 
                    0x000186A0, 
                    Zero, 
                    One
                }, 

                Package (0x0A)
                {
                    "PSTATE_SET", 
                    Zero, 
                    "CRYPTO_RESET", 
                    "*", 
                    "RESET", 
                    0x02, 
                    Zero, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        One, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        Zero, 
                        0x02
                    }
                }, 

                Package (0x0A)
                {
                    "PSTATE_SET", 
                    One, 
                    "CRYPTO_FOOTSWITCH_OVERRIDE", 
                    "*", 
                    "FOOTSWITCH_OVERRIDE", 
                    0x02, 
                    One, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        One, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        Zero, 
                        0x02
                    }
                }, 

                Package (0x09)
                {
                    "PSTATE_SET", 
                    0x02, 
                    "CRYPTO_CORE_CLOCK_CONTROL", 
                    "*", 
                    "CORE_CLOCK", 
                    One, 
                    Zero, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        Zero, 
                        Zero
                    }
                }
            }, 

            Package (0x10)
            {
                "COMPONENT", 
                0x06, 
                ToUUID ("e6be5096-55ec-4891-884b-0760bfc533b6"), 
                "VIDEO_ENCODER_POWER_STATES", 
                "HW_BLOCK_VIDEO", 
                Package (0x02)
                {
                    "ENGINE", 
                    "VIDEO_ENCODER"
                }, 

                0x03, 
                0x04, 
                Package (0x06)
                {
                    "FSTATE", 
                    Zero, 
                    "ALL_ON", 
                    Zero, 
                    Zero, 
                    0x03
                }, 

                Package (0x06)
                {
                    "FSTATE", 
                    One, 
                    "CLK_OFF", 
                    0x2710, 
                    Zero, 
                    0x02
                }, 

                Package (0x06)
                {
                    "FSTATE", 
                    0x02, 
                    "PWR_OFF", 
                    0x000186A0, 
                    Zero, 
                    One
                }, 

                Package (0x0A)
                {
                    "PSTATE_SET", 
                    Zero, 
                    "VIDEO_ENCODER_RESET", 
                    "*", 
                    "RESET", 
                    0x02, 
                    Zero, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        One, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        Zero, 
                        0x02
                    }
                }, 

                Package (0x0A)
                {
                    "PSTATE_SET", 
                    One, 
                    "VIDEO_ENCODER_FOOTSWITCH_OVERRIDE", 
                    "*", 
                    "FOOTSWITCH_OVERRIDE", 
                    0x02, 
                    One, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        One, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        Zero, 
                        0x02
                    }
                }, 

                Package (0x0E)
                {
                    "PSTATE_SET", 
                    0x02, 
                    "VIDEO_ENCODER_CORE_CLOCK_CONTROL", 
                    "*", 
                    "CORE_CLOCK", 
                    0x06, 
                    0x04, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        0x1FC4EF40, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        0x1A76E700, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x02, 
                        0x1528DEC0, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x03, 
                        0x10089D40, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x04, 
                        0x0BEBC200, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x05, 
                        Zero, 
                        0x03
                    }
                }, 

                Package (0x45)
                {
                    "PSTATE_SET", 
                    0x03, 
                    "VIDEO_ENCODER_AXI_PORT_BW", 
                    "*", 
                    "BANDWIDTH", 
                    0x3D, 
                    0x3A, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        0x00000002CB417800, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        0x00000002BF55B600, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x02, 
                        0x00000002B369F400, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x03, 
                        0x00000002A77E3200, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x04, 
                        0x000000029B927000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x05, 
                        0x000000028FA6AE00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x06, 
                        0x0000000283BAEC00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x07, 
                        0x0000000277CF2A00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x08, 
                        0x000000026BE36800, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x09, 
                        0x000000025FF7A600, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0A, 
                        0x00000002540BE400, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0B, 
                        0x0000000248202200, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0C, 
                        0x000000023C346000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0D, 
                        0x0000000230489E00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0E, 
                        0x00000002245CDC00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0F, 
                        0x0000000218711A00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x10, 
                        0x000000020C855800, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x11, 
                        0x0000000200999600, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x12, 
                        0x00000001F4ADD400, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x13, 
                        0x00000001E8C21200, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x14, 
                        0x00000001DCD65000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x15, 
                        0x00000001D0EA8E00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x16, 
                        0x00000001C4FECC00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x17, 
                        0x00000001B9130A00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x18, 
                        0x00000001AD274800, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x19, 
                        0x00000001A13B8600, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1A, 
                        0x00000001954FC400, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1B, 
                        0x0000000189640200, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1C, 
                        0x000000017D784000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1D, 
                        0x00000001718C7E00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1E, 
                        0x0000000165A0BC00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1F, 
                        0x0000000159B4FA00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x20, 
                        0x000000014DC93800, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x21, 
                        0x0000000141DD7600, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x22, 
                        0x0000000135F1B400, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x23, 
                        0x000000012A05F200, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x24, 
                        0x000000011E1A3000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x25, 
                        0x00000001122E6E00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x26, 
                        0x000000010642AC00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x27, 
                        0xFA56EA00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x28, 
                        0xEE6B2800, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x29, 
                        0xE27F6600, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x2A, 
                        0xD693A400, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x2B, 
                        0xCAA7E200, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x2C, 
                        0xBEBC2000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x2D, 
                        0xB2D05E00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x2E, 
                        0xA6E49C00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x2F, 
                        0x9AF8DA00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x30, 
                        0x8F0D1800, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x31, 
                        0x83215600, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x32, 
                        0x77359400, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x33, 
                        0x6B49D200, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x34, 
                        0x5F5E1000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x35, 
                        0x53724E00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x36, 
                        0x47868C00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x37, 
                        0x3B9ACA00, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x38, 
                        0x2FAF0800, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x39, 
                        0x23C34600, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x3A, 
                        0x17D78400, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x3B, 
                        0x0BEBC200, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x3C, 
                        Zero, 
                        0x02
                    }
                }, 

                Package (0x03)
                {
                    "PROVIDERS", 
                    One, 
                    Package (0x01)
                    {
                        0x04
                    }
                }
            }, 

            Package (0x0F)
            {
                "COMPONENT", 
                0x07, 
                ToUUID ("c42be628-d6bc-4755-bfd5-5af776797228"), 
                "SECDISPLAY_POWER_STATES", 
                "HW_BLOCK_MDP", 
                Package (0x02)
                {
                    "DISPLAY", 
                    "INTERNAL2"
                }, 

                0x02, 
                0x05, 
                Package (0x06)
                {
                    "FSTATE", 
                    Zero, 
                    "ALL_ON", 
                    Zero, 
                    Zero, 
                    0x02
                }, 

                Package (0x06)
                {
                    "FSTATE", 
                    One, 
                    "PWR_OFF", 
                    One, 
                    One, 
                    One
                }, 

                Package (0x09)
                {
                    "PSTATE_SET", 
                    Zero, 
                    "INTERNAL2_RESET", 
                    "*", 
                    "RESET", 
                    One, 
                    Zero, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        One, 
                        0x02
                    }
                }, 

                Package (0x0A)
                {
                    "PSTATE_SET", 
                    One, 
                    "INTERNAL2_FOOTSWITCH_OVERRIDE", 
                    "*", 
                    "FOOTSWITCH_OVERRIDE", 
                    0x02, 
                    0xFFFFFFFF, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        One, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        Zero, 
                        0x02
                    }
                }, 

                Package (0x0D)
                {
                    "PSTATE_SET", 
                    0x02, 
                    "INTERNAL2_SCAN_CONTROL", 
                    "*", 
                    "DISPLAY_SOURCE_SCAN_CTRL", 
                    0x05, 
                    Zero, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        0x04, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        0x03, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x02, 
                        0x02, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x03, 
                        One, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x04, 
                        Zero, 
                        0x02
                    }
                }, 

                Package (0x12)
                {
                    "PSTATE_SET", 
                    0x03, 
                    "INTERNAL2_CORE_CLOCK_CONTROL", 
                    "*", 
                    "CORE_CLOCK", 
                    0x0A, 
                    0x03, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        0x18964020, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        0x13AB6680, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x02, 
                        0x11E1A300, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x03, 
                        0x10642AC0, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x04, 
                        0x0BEBC200, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x05, 
                        0x0A37CADB, 
                        0x03
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x06, 
                        0x08F0D180, 
                        0x03
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x07, 
                        0x05F5E100, 
                        0x03
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x08, 
                        0x051BE56E, 
                        0x03
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x09, 
                        Zero, 
                        0x03
                    }
                }, 

                Package (0x32)
                {
                    "PSTATE_SET", 
                    0x04, 
                    "INTERNAL2_EBI_BANDWIDTH", 
                    "*", 
                    "BANDWIDTH", 
                    0x2A, 
                    0x21, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        0x000000025A01C500, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        0x00000002422A4100, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x02, 
                        0x000000022A52BD00, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x03, 
                        0x00000002127B3900, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x04, 
                        0x00000001FAA3B500, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x05, 
                        0x00000001E2CC3100, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x06, 
                        0x00000001CAF4AD00, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x07, 
                        0x00000001B31D2900, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x08, 
                        0x000000019B45A500, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x09, 
                        0x00000001836E2100, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0A, 
                        0x000000016B969D00, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0B, 
                        0x0000000153BF1900, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0C, 
                        0x000000013BE79500, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0D, 
                        0x0000000124101100, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0E, 
                        0x000000010C388D00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0F, 
                        0xF4610900, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x10, 
                        0xDC898500, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x11, 
                        0xC4B20100, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x12, 
                        0xACDA7D00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x13, 
                        0x9502F900, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x14, 
                        0x8F0D1800, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x15, 
                        0x89173700, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x16, 
                        0x83215600, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x17, 
                        0x7D2B7500, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x18, 
                        0x77359400, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x19, 
                        0x713FB300, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1A, 
                        0x6B49D200, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1B, 
                        0x6553F100, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1C, 
                        0x5F5E1000, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1D, 
                        0x59682F00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1E, 
                        0x53724E00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1F, 
                        0x4D7C6D00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x20, 
                        0x47868C00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x21, 
                        0x4190AB00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x22, 
                        0x3B9ACA00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x23, 
                        0x35A4E900, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x24, 
                        0x2FAF0800, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x25, 
                        0x29B92700, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x26, 
                        0x23C34600, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x27, 
                        0x1DCD6500, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x28, 
                        0x17D78400, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x29, 
                        Zero, 
                        0x02
                    }
                }
            }, 

            Package (0x0F)
            {
                "COMPONENT", 
                0x08, 
                ToUUID ("1a134877-a115-49b8-bda1-382b78bba62d"), 
                "HDMI_POWER_STATES", 
                "HW_BLOCK_MDP", 
                Package (0x02)
                {
                    "DISPLAY", 
                    "EXTERNAL1"
                }, 

                0x02, 
                0x04, 
                Package (0x06)
                {
                    "FSTATE", 
                    Zero, 
                    "ALL_ON", 
                    Zero, 
                    Zero, 
                    0x02
                }, 

                Package (0x06)
                {
                    "FSTATE", 
                    One, 
                    "PWR_OFF", 
                    One, 
                    One, 
                    One
                }, 

                Package (0x09)
                {
                    "PSTATE_SET", 
                    Zero, 
                    "EXTERNAL1_RESET", 
                    "*", 
                    "RESET", 
                    One, 
                    Zero, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        One, 
                        0x02
                    }
                }, 

                Package (0x0A)
                {
                    "PSTATE_SET", 
                    One, 
                    "EXTERNAL1_FOOTSWITCH_OVERRIDE", 
                    "*", 
                    "FOOTSWITCH_OVERRIDE", 
                    0x02, 
                    0xFFFFFFFF, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        One, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        Zero, 
                        0x02
                    }
                }, 

                Package (0x12)
                {
                    "PSTATE_SET", 
                    0x02, 
                    "EXTERNAL1_CORE_CLOCK_CONTROL", 
                    "*", 
                    "CORE_CLOCK", 
                    0x0A, 
                    0x03, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        0x18964020, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        0x13AB6680, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x02, 
                        0x11E1A300, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x03, 
                        0x10642AC0, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x04, 
                        0x0BEBC200, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x05, 
                        0x0A37CADB, 
                        0x03
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x06, 
                        0x08F0D180, 
                        0x03
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x07, 
                        0x05F5E100, 
                        0x03
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x08, 
                        0x051BE56E, 
                        0x03
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x09, 
                        Zero, 
                        0x03
                    }
                }, 

                Package (0x32)
                {
                    "PSTATE_SET", 
                    0x03, 
                    "EXTERNAL1_EBI_BANDWIDTH", 
                    "*", 
                    "BANDWIDTH", 
                    0x2A, 
                    0x21, 
                    Zero, 
                    Package (0x04)
                    {
                        "PSTATE", 
                        Zero, 
                        0x000000025A01C500, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        One, 
                        0x00000002422A4100, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x02, 
                        0x000000022A52BD00, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x03, 
                        0x00000002127B3900, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x04, 
                        0x00000001FAA3B500, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x05, 
                        0x00000001E2CC3100, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x06, 
                        0x00000001CAF4AD00, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x07, 
                        0x00000001B31D2900, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x08, 
                        0x000000019B45A500, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x09, 
                        0x00000001836E2100, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0A, 
                        0x000000016B969D00, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0B, 
                        0x0000000153BF1900, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0C, 
                        0x000000013BE79500, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0D, 
                        0x0000000124101100, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0E, 
                        0x000000010C388D00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x0F, 
                        0xF4610900, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x10, 
                        0xDC898500, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x11, 
                        0xC4B20100, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x12, 
                        0xACDA7D00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x13, 
                        0x9502F900, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x14, 
                        0x8F0D1800, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x15, 
                        0x89173700, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x16, 
                        0x83215600, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x17, 
                        0x7D2B7500, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x18, 
                        0x77359400, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x19, 
                        0x713FB300, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1A, 
                        0x6B49D200, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1B, 
                        0x6553F100, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1C, 
                        0x5F5E1000, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1D, 
                        0x59682F00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1E, 
                        0x53724E00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x1F, 
                        0x4D7C6D00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x20, 
                        0x47868C00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x21, 
                        0x4190AB00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x22, 
                        0x3B9ACA00, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x23, 
                        0x35A4E900, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x24, 
                        0x2FAF0800, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x25, 
                        0x29B92700, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x26, 
                        0x23C34600, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x27, 
                        0x1DCD6500, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x28, 
                        0x17D78400, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "PSTATE", 
                        0x29, 
                        Zero, 
                        0x02
                    }
                }, 

                Package (0x03)
                {
                    "PROVIDERS", 
                    One, 
                    Package (0x01)
                    {
                        0x09
                    }
                }
            }, 

            Package (0x0A)
            {
                "COMPONENT", 
                0x09, 
                ToUUID ("2feff049-f0c7-46fd-a9d8-6cf70e83ec9b"), 
                "HDMI_HOTPLUG_DETECT", 
                "HW_BLOCK_NONE", 
                Package (0x01)
                {
                    "UNMANAGED"
                }, 

                0x02, 
                Zero, 
                Package (0x06)
                {
                    "FSTATE", 
                    Zero, 
                    "ALL_ON", 
                    Zero, 
                    Zero, 
                    0x02
                }, 

                Package (0x06)
                {
                    "FSTATE", 
                    One, 
                    "PWR_OFF", 
                    One, 
                    One, 
                    One
                }
            }, 

            Package (0x09)
            {
                "COMPONENT", 
                0x0A, 
                ToUUID ("8dd40bdf-6fbd-45ed-8538-711d434b6ba1"), 
                "ALWAYS_ACTIVE_WP", 
                "HW_BLOCK_NONE", 
                Package (0x01)
                {
                    "UNMANAGED"
                }, 

                One, 
                Zero, 
                Package (0x06)
                {
                    "FSTATE", 
                    Zero, 
                    "ALL_ON", 
                    Zero, 
                    Zero, 
                    One
                }
            }
        })
        Name (P001, Package (0x0F)
        {
            "PSTATE_SET", 
            0x02, 
            "GRAPHICS_FREQ_CONTROL", 
            "*", 
            "CORE_CLOCK", 
            0x07, 
            0x03, 
            0x02, 
            Package (0x05)
            {
                "PSTATE", 
                Zero, 
                0x26BE3680, 
                Zero, 
                Package (0x02)
                {
                    "GPU", 
                    0x64
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                One, 
                0x1E0A6E00, 
                One, 
                Package (0x02)
                {
                    "GPU", 
                    0x4E
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x02, 
                0x18054AC0, 
                One, 
                Package (0x02)
                {
                    "GPU", 
                    0x3E
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x03, 
                0x13C9EB00, 
                0x02, 
                Package (0x02)
                {
                    "GPU", 
                    0x33
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x04, 
                0x0EF5F4C0, 
                0x03, 
                Package (0x02)
                {
                    "GPU", 
                    0x26
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x05, 
                0x0A3140C0, 
                0x04, 
                Package (0x02)
                {
                    "GPU", 
                    Zero
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x06, 
                Zero, 
                0x05, 
                Package (0x02)
                {
                    "GPU", 
                    Zero
                }
            }
        })
        Name (P002, Package (0x11)
        {
            "PSTATE_SET", 
            0x02, 
            "GRAPHICS_FREQ_CONTROL", 
            "*", 
            "CORE_CLOCK", 
            0x09, 
            0x05, 
            0x03, 
            Package (0x05)
            {
                "PSTATE", 
                Zero, 
                0x2A51BD80, 
                Zero, 
                Package (0x02)
                {
                    "GPU", 
                    0x64
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                One, 
                0x27EF6380, 
                One, 
                Package (0x02)
                {
                    "GPU", 
                    0x5E
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x02, 
                0x23863D00, 
                0x02, 
                Package (0x02)
                {
                    "GPU", 
                    0x54
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x03, 
                0x1EB246C0, 
                0x03, 
                Package (0x02)
                {
                    "GPU", 
                    0x49
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x04, 
                0x18AD2380, 
                0x04, 
                Package (0x02)
                {
                    "GPU", 
                    0x3A
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x05, 
                0x14628180, 
                0x05, 
                Package (0x02)
                {
                    "GPU", 
                    0x30
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x06, 
                0x0F518240, 
                0x06, 
                Package (0x02)
                {
                    "GPU", 
                    0x25
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x07, 
                0x0ABA9500, 
                0x07, 
                Package (0x02)
                {
                    "GPU", 
                    Zero
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x08, 
                Zero, 
                0x08, 
                Package (0x02)
                {
                    "GPU", 
                    Zero
                }
            }
        })
        Name (P003, Package (0x15)
        {
            "PSTATE_SET", 
            0x03, 
            "GRAPHICS_BW_CONTROL", 
            "*", 
            "BANDWIDTH", 
            0x0D, 
            0x05, 
            One, 
            Package (0x05)
            {
                "PSTATE", 
                Zero, 
                0x000000035C988000, 
                Zero, 
                Package (0x02)
                {
                    "GPU", 
                    0x64
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                One, 
                0x00000002E593C000, 
                One, 
                Package (0x02)
                {
                    "GPU", 
                    0x55
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x02, 
                0x0000000269FB2000, 
                One, 
                Package (0x02)
                {
                    "GPU", 
                    0x4A
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x03, 
                0x00000001E53AC000, 
                One, 
                Package (0x02)
                {
                    "GPU", 
                    0x3E
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x04, 
                0x000000016E360000, 
                One, 
                Package (0x02)
                {
                    "GPU", 
                    0x36
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x05, 
                0x0000000145032000, 
                0x02, 
                Package (0x02)
                {
                    "GPU", 
                    0x2F
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x06, 
                0x0000000104ECE000, 
                0x02, 
                Package (0x02)
                {
                    "GPU", 
                    0x26
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x07, 
                0xC4D6A000, 
                0x02, 
                Package (0x02)
                {
                    "GPU", 
                    0x20
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x08, 
                0x8F0D1800, 
                0x02, 
                Package (0x02)
                {
                    "GPU", 
                    0x1C
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x09, 
                0x5F5E1000, 
                0x03, 
                Package (0x02)
                {
                    "GPU", 
                    0x18
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x0A, 
                0x47868C00, 
                0x03, 
                Package (0x02)
                {
                    "GPU", 
                    0x14
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x0B, 
                0x2FAF0800, 
                0x03, 
                Package (0x02)
                {
                    "GPU", 
                    0x0F
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x0C, 
                Zero, 
                0x03, 
                Package (0x02)
                {
                    "GPU", 
                    Zero
                }
            }
        })
        Name (P004, Package (0x15)
        {
            "PSTATE_SET", 
            0x03, 
            "GRAPHICS_BW_CONTROL", 
            "*", 
            "BANDWIDTH", 
            0x0D, 
            0x05, 
            One, 
            Package (0x05)
            {
                "PSTATE", 
                Zero, 
                0x000000035C988000, 
                Zero, 
                Package (0x02)
                {
                    "GPU", 
                    0x64
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                One, 
                0x00000002E593C000, 
                One, 
                Package (0x02)
                {
                    "GPU", 
                    0x55
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x02, 
                0x0000000269FB2000, 
                One, 
                Package (0x02)
                {
                    "GPU", 
                    0x4A
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x03, 
                0x00000001E53AC000, 
                One, 
                Package (0x02)
                {
                    "GPU", 
                    0x3E
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x04, 
                0x000000016E360000, 
                One, 
                Package (0x02)
                {
                    "GPU", 
                    0x36
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x05, 
                0x0000000145032000, 
                0x02, 
                Package (0x02)
                {
                    "GPU", 
                    0x2F
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x06, 
                0x0000000104ECE000, 
                0x02, 
                Package (0x02)
                {
                    "GPU", 
                    0x26
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x07, 
                0xC4D6A000, 
                0x02, 
                Package (0x02)
                {
                    "GPU", 
                    0x20
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x08, 
                0x8F0D1800, 
                0x02, 
                Package (0x02)
                {
                    "GPU", 
                    0x1C
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x09, 
                0x5F5E1000, 
                0x03, 
                Package (0x02)
                {
                    "GPU", 
                    0x18
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x0A, 
                0x47868C00, 
                0x03, 
                Package (0x02)
                {
                    "GPU", 
                    0x14
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x0B, 
                0x2FAF0800, 
                0x03, 
                Package (0x02)
                {
                    "GPU", 
                    0x0F
                }
            }, 

            Package (0x05)
            {
                "PSTATE", 
                0x0C, 
                Zero, 
                0x03, 
                Package (0x02)
                {
                    "GPU", 
                    Zero
                }
            }
        })
        If ((\_SB.SIDV < 0x00020000))
        {
            DerefOf (RBUF [0x04]) [0x0C] = P001 /* \_SB_.GPU0.PMCL.P001 */
        }
        Else
        {
            DerefOf (RBUF [0x04]) [0x0C] = P002 /* \_SB_.GPU0.PMCL.P002 */
        }

        If ((\_SB.SIDV < 0x00020000))
        {
            DerefOf (RBUF [0x04]) [0x0D] = P003 /* \_SB_.GPU0.PMCL.P003 */
        }
        Else
        {
            DerefOf (RBUF [0x04]) [0x0D] = P004 /* \_SB_.GPU0.PMCL.P004 */
        }

        Return (RBUF) /* \_SB_.GPU0.PMCL.RBUF */
    }

    Method (_ROM, 3, NotSerialized)  // _ROM: Read-Only Memory
    {
        Include("panelcfg.asl")
        
        Local2 = PCFG /* \_SB_.GPU0._ROM.PCFG */
        If ((Arg0 >= SizeOf (Local2)))
        {
            Return (Buffer (One)
            {
                    0x00                                             // .
            })
        }
        Else
        {
            Local0 = Arg0
        }

        If ((Arg1 > 0x1000))
        {
            Local1 = 0x1000
        }
        Else
        {
            Local1 = Arg1
        }

        If (((Local0 + Local1) > SizeOf (Local2)))
        {
            Local1 = (SizeOf (Local2) - Local0)
        }

        CreateField (Local2, (0x08 * Local0), (0x08 * Local1), RBUF)
        Return (RBUF) /* \_SB_.GPU0._ROM.RBUF */
    }

    Method (PIGC, 2, NotSerialized)
    {
        Name (RBUF, Buffer (One)
        {
                0x00                                             // .
        })
        Return (RBUF) /* \_SB_.GPU0.PIGC.RBUF */
    }

    Method (PPCC, 2, NotSerialized)
    {
        Name (RBUF, Buffer (One)
        {
                0x00                                             // .
        })
        Return (RBUF) /* \_SB_.GPU0.PPCC.RBUF */
    }

    Method (PGCT, 2, NotSerialized)
    {
        Name (RBUF, Buffer (One)
        {
                0x00                                             // .
        })
        Return (RBUF) /* \_SB_.GPU0.PGCT.RBUF */
    }

    Method (PLGC, 3, NotSerialized)
    {
        Name (TBUF, Buffer (One)
        {
                0x00                                             // .
        })
        If ((Arg1 >= SizeOf (TBUF)))
        {
            Return (Buffer (One)
            {
                    0x00                                             // .
            })
        }
        Else
        {
            Local1 = Arg1
        }

        If ((Arg2 > 0x1000))
        {
            Local2 = 0x1000
        }
        Else
        {
            Local2 = Arg2
        }

        If (((Local1 + Local2) > SizeOf (TBUF)))
        {
            Local2 = (SizeOf (TBUF) - Local1)
        }

        CreateField (TBUF, (0x08 * Local1), (0x08 * Local2), RBUF)
        Return (RBUF) /* \_SB_.GPU0.PLGC.RBUF */
    }

    Method (HSIC, 2, NotSerialized)
    {
        Name (RBUF, Buffer (One)
        {
                0x00                                             // .
        })
        Return (RBUF) /* \_SB_.GPU0.HSIC.RBUF */
    }

    Method (PGMT, 2, NotSerialized)
    {
        Name (TBUF, Buffer (One)
        {
                0x00                                             // .
        })
        If ((Arg0 >= SizeOf (TBUF)))
        {
            Return (Buffer (One)
            {
                    0x00                                             // .
            })
        }
        Else
        {
            Local0 = Arg0
        }

        If ((Arg1 > 0x1000))
        {
            Local1 = 0x1000
        }
        Else
        {
            Local1 = Arg1
        }

        If (((Local0 + Local1) > SizeOf (TBUF)))
        {
            Local1 = (SizeOf (TBUF) - Local0)
        }

        CreateField (TBUF, (0x08 * Local0), (0x08 * Local1), RBUF)
        Return (RBUF) /* \_SB_.GPU0.PGMT.RBUF */
    }

    Method (PWGM, 2, NotSerialized)
    {
        Name (TBUF, Buffer (One)
        {
                0x00                                             // .
        })
        If ((Arg0 >= SizeOf (TBUF)))
        {
            Return (Buffer (One)
            {
                    0x00                                             // .
            })
        }
        Else
        {
            Local0 = Arg0
        }

        If ((Arg1 > 0x1000))
        {
            Local1 = 0x1000
        }
        Else
        {
            Local1 = Arg1
        }

        If (((Local0 + Local1) > SizeOf (TBUF)))
        {
            Local1 = (SizeOf (TBUF) - Local0)
        }

        CreateField (TBUF, (0x08 * Local0), (0x08 * Local1), RBUF)
        Return (RBUF) /* \_SB_.GPU0.PWGM.RBUF */
    }

    Method (PGRT, 2, NotSerialized)
    {
        Name (RBUF, Buffer (One)
        {
                0x00                                             // .
        })
        Return (RBUF) /* \_SB_.GPU0.PGRT.RBUF */
    }

    Method (PBRT, 2, NotSerialized)
    {
        Name (RBUF, Buffer (One)
        {
                0x00                                             // .
        })
        Return (RBUF) /* \_SB_.GPU0.PBRT.RBUF */
    }

    Method (DITH, 2, NotSerialized)
    {
        Name (RBUF, Buffer (One)
        {
                0x00                                             // .
        })
        Return (RBUF) /* \_SB_.GPU0.DITH.RBUF */
    }

    Name (BLOK, Zero)
    Name (BLBK, Zero)
    ///
    // BLCP Method - Backlight control packet method, returns a 
    //               command buffer for a specific backlight level
    //
    // Input Parameters
    //    Backlight level - Integer from 0% to 100%
    //
    // Output Parameters
    //
    // Packet format:
    //   +--32bits--+-----variable (8bit alignment)--+
    //   |  Header  |       Packet payload           |
    //   +----------+--------------------------------+
    //
    //  For DSI Command packets, payload data must be in this format
    //
    //  +-- 8 bits-+----variable (8bit alignment)----+
    //  | Cmd Type |           Packet Data           |
    //  +----------+---------------------------------+
    //
    //  For I2C Command packets, payload data must be in this format
    //
    //  +-- 16 bits-+----variable (8bit alignment)----+
    //  |  Address  |         Command Data            |
    //  +-----------+---------------------------------+
    //
    //  All packets must follow with a DWORD header with 0x0
    //
    Method (BLCP, 1, NotSerialized) {
    
        // Create Response buffer
        Name(RBUF, Buffer(0x100){})

        // Details to be populated by OEM based on the platform requirements

        // Return the packet data
        Return(RBUF)
    }

    Method (ROM2, 3, NotSerialized)
    {
        Name (PCFG, Buffer (One)
        {
                0x00                                             // .
        })
        While (One)
        {
            If (One)
            {
                Local2 = PCFG /* \_SB_.GPU0.ROM2.PCFG */
            }

            Break
        }

        If ((Arg0 >= SizeOf (Local2)))
        {
            Return (Buffer (One)
            {
                    0x00                                             // .
            })
        }
        Else
        {
            Local0 = Arg0
        }

        If ((Arg1 > 0x1000))
        {
            Local1 = 0x1000
        }
        Else
        {
            Local1 = Arg1
        }

        If (((Local0 + Local1) > SizeOf (Local2)))
        {
            Local1 = (SizeOf (Local2) - Local0)
        }

        CreateField (Local2, (0x08 * Local0), (0x08 * Local1), RBUF)
        Return (RBUF) /* \_SB_.GPU0.ROM2.RBUF */
    }

    Method (IGC2, 2, NotSerialized)
    {
        Name (RBUF, Buffer (One)
        {
                0x00                                             // .
        })
        Return (RBUF) /* \_SB_.GPU0.IGC2.RBUF */
    }

    Method (PCC2, 2, NotSerialized)
    {
        Name (RBUF, Buffer (One)
        {
                0x00                                             // .
        })
        Return (RBUF) /* \_SB_.GPU0.PCC2.RBUF */
    }

    Method (GCT2, 2, NotSerialized)
    {
        Name (RBUF, Buffer (One)
        {
                0x00                                             // .
        })
        Return (RBUF) /* \_SB_.GPU0.GCT2.RBUF */
    }

    Method (LGC2, 3, NotSerialized)
    {
        Name (TBUF, Buffer (One)
        {
                0x00                                             // .
        })
        If ((Arg1 >= SizeOf (TBUF)))
        {
            Return (Buffer (One)
            {
                    0x00                                             // .
            })
        }
        Else
        {
            Local1 = Arg1
        }

        If ((Arg2 > 0x1000))
        {
            Local2 = 0x1000
        }
        Else
        {
            Local2 = Arg2
        }

        If (((Local1 + Local2) > SizeOf (TBUF)))
        {
            Local2 = (SizeOf (TBUF) - Local1)
        }

        CreateField (TBUF, (0x08 * Local1), (0x08 * Local2), RBUF)
        Return (RBUF) /* \_SB_.GPU0.LGC2.RBUF */
    }

    Method (HSI2, 2, NotSerialized)
    {
        Name (RBUF, Buffer (One)
        {
                0x00                                             // .
        })
        Return (RBUF) /* \_SB_.GPU0.HSI2.RBUF */
    }

    Method (GMT2, 2, NotSerialized)
    {
        Name (TBUF, Buffer (One)
        {
                0x00                                             // .
        })
        If ((Arg0 >= SizeOf (TBUF)))
        {
            Return (Buffer (One)
            {
                    0x00                                             // .
            })
        }
        Else
        {
            Local0 = Arg0
        }

        If ((Arg1 > 0x1000))
        {
            Local1 = 0x1000
        }
        Else
        {
            Local1 = Arg1
        }

        If (((Local0 + Local1) > SizeOf (TBUF)))
        {
            Local1 = (SizeOf (TBUF) - Local0)
        }

        CreateField (TBUF, (0x08 * Local0), (0x08 * Local1), RBUF)
        Return (RBUF) /* \_SB_.GPU0.GMT2.RBUF */
    }

    Method (WGM2, 2, NotSerialized)
    {
        Name (TBUF, Buffer (One)
        {
                0x00                                             // .
        })
        If ((Arg0 >= SizeOf (TBUF)))
        {
            Return (Buffer (One)
            {
                    0x00                                             // .
            })
        }
        Else
        {
            Local0 = Arg0
        }

        If ((Arg1 > 0x1000))
        {
            Local1 = 0x1000
        }
        Else
        {
            Local1 = Arg1
        }

        If (((Local0 + Local1) > SizeOf (TBUF)))
        {
            Local1 = (SizeOf (TBUF) - Local0)
        }

        CreateField (TBUF, (0x08 * Local0), (0x08 * Local1), RBUF)
        Return (RBUF) /* \_SB_.GPU0.WGM2.RBUF */
    }

    Method (GRT2, 2, NotSerialized)
    {
        Name (RBUF, Buffer (One)
        {
                0x00                                             // .
        })
        Return (RBUF) /* \_SB_.GPU0.GRT2.RBUF */
    }

    Method (BRT2, 2, NotSerialized)
    {
        Name (RBUF, Buffer (One)
        {
                0x00                                             // .
        })
        Return (RBUF) /* \_SB_.GPU0.BRT2.RBUF */
    }

    Method (DIT2, 2, NotSerialized)
    {
        Name (RBUF, Buffer (One)
        {
                0x00                                             // .
        })
        Return (RBUF) /* \_SB_.GPU0.DIT2.RBUF */
    }

    Method (BLC2, 1, NotSerialized)
    {
        Name (RBUF, Buffer (0x0100){})
        Return (RBUF) /* \_SB_.GPU0.BLC2.RBUF */
    }

    Method (ROE1, 3, NotSerialized)
    {
        Name (PCFG, Buffer (0x4A)
        {
            /* 0000 */  0x3C, 0x3F, 0x78, 0x6D, 0x6C, 0x20, 0x76, 0x65,  // <?xml ve
            /* 0008 */  0x72, 0x73, 0x69, 0x6F, 0x6E, 0x3D, 0x27, 0x31,  // rsion='1
            /* 0010 */  0x2E, 0x30, 0x27, 0x20, 0x65, 0x6E, 0x63, 0x6F,  // .0' enco
            /* 0018 */  0x64, 0x69, 0x6E, 0x67, 0x3D, 0x27, 0x75, 0x74,  // ding='ut
            /* 0020 */  0x66, 0x2D, 0x38, 0x27, 0x3F, 0x3E, 0x0A, 0x3C,  // f-8'?>.<
            /* 0028 */  0x47, 0x72, 0x6F, 0x75, 0x70, 0x20, 0x69, 0x64,  // Group id
            /* 0030 */  0x3D, 0x27, 0x48, 0x44, 0x4D, 0x49, 0x20, 0x44,  // ='HDMI D
            /* 0038 */  0x69, 0x73, 0x70, 0x6C, 0x61, 0x79, 0x27, 0x3E,  // isplay'>
            /* 0040 */  0x0A, 0x3C, 0x2F, 0x47, 0x72, 0x6F, 0x75, 0x70,  // .</Group
            /* 0048 */  0x3E, 0x00                                       // >.
        })
        Local2 = PCFG /* \_SB_.GPU0.ROE1.PCFG */
        If ((Arg0 >= SizeOf (Local2)))
        {
            Return (Buffer (One)
            {
                    0x00                                             // .
            })
        }
        Else
        {
            Local0 = Arg0
        }

        If ((Arg1 > 0x1000))
        {
            Local1 = 0x1000
        }
        Else
        {
            Local1 = Arg1
        }

        If (((Local0 + Local1) > SizeOf (Local2)))
        {
            Local1 = (SizeOf (Local2) - Local0)
        }

        CreateField (Local2, (0x08 * Local0), (0x08 * Local1), RBUF)
        Return (RBUF) /* \_SB_.GPU0.ROE1.RBUF */
    }

    Method (BLK1, 0, NotSerialized)
    {
        Name (RBUF, Buffer (0x20){})
        CreateDWordField (RBUF, Zero, WMAX)
        WMAX = Zero
        CreateDWordField (RBUF, 0x04, HMAX)
        HMAX = Zero
        CreateDWordField (RBUF, 0x08, HZ)
        HZ = Zero
        CreateDWordField (RBUF, 0x0C, FLGS)
        FLGS = Zero
        CreateQWordField (RBUF, 0x10, LRAT)
        LRAT = 0x00000001017DF800
        CreateDWordField (RBUF, 0x18, NLNS)
        NLNS = 0x02
        CreateDWordField (RBUF, 0x1C, RSVD)
        RSVD = Zero
        Return (RBUF) /* \_SB_.GPU0.BLK1.RBUF */
    }

    Name (_DOD, Package (0x01)  // _DOD: Display Output Devices
    {
        0x00024321
    })
    Device (AVS0)
    {
        Name (_ADR, 0x00024321)  // _ADR: Address
        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            Name (RBUF, Buffer (0x02)
            {
                    0x79, 0x00                                       // y.
            })
            Return (RBUF) /* \_SB_.GPU0.AVS0._CRS.RBUF */
        }

        Name (_DEP, Package (0x02)  // _DEP: Dependencies
        {
            \_SB.MMU1, 
            \_SB.VFE0
        })
    }

    Method (CHDV, 0, NotSerialized)
    {
        Name (CHIF, Package (0x02)
        {
            One, 
            Package (0x07)
            {
                "CHILDDEV", 
                Zero, 
                0x00024321, 
                "QCOM_AVStream_8998_CLS", 
                Zero, 
                "Qualcomm Camera AVStream Mini Driver", 
                Package (0x04)
                {
                    "COMPATIBLEIDS", 
                    0x02, 
                    "VEN_QCOM&DEV__AVSTREAM", 
                    "QCOM_AVSTREAM"
                }
            }
        })
        Return (CHIF) /* \_SB_.GPU0.CHDV.CHIF */
    }

    Method (REGR, 0, NotSerialized)
    {
        Name (RBUF, Package (0x14)
        {
            Package (0x02)
            {
                "ForceMaxPerf", 
                Zero
            }, 

            Package (0x02)
            {
                "ForceStablePowerSettings", 
                Zero
            }, 

            Package (0x02)
            {
                "ForceActive", 
                Zero
            }, 

            Package (0x02)
            {
                "PreventPowerCollapse", 
                Zero
            }, 

            Package (0x02)
            {
                "DisableThermalMitigation", 
                Zero
            }, 

            Package (0x02)
            {
                "DisableTzMDSSRestore", 
                One
            }, 

            Package (0x02)
            {
                "UseLowPTForGfxPerProcess", 
                One
            }, 

            Package (0x02)
            {
                "DisableCDI", 
                Zero
            }, 

            Package (0x02)
            {
                "GPU64bAddrEnabled", 
                One
            }, 

            Package (0x02)
            {
                "MaxPreemptionOffsets", 
                0x80
            }, 

            Package (0x02)
            {
                "MaxRequiredDmaQueueEntry", 
                0x08
            }, 

            Package (0x02)
            {
                "SupportsSecureInAperture", 
                One
            }, 

            Package (0x02)
            {
                "ZeroFlagSupportInPTE", 
                One
            }, 

            Package (0x02)
            {
                "SecureCarveoutSize", 
                0x04C00000
            }, 

            Package (0x02)
            {
                "SupportsCacheCoherency", 
                One
            }, 

            Package (0x02)
            {
                "KeepUefiBuffer", 
                One
            }, 

            Package (0x03)
            {
                "GRAPHICS", 
                Package (0x0A)
                {
                    "DCVS", 
                    Package (0x02)
                    {
                        "Enable", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "IncreaseFilterBw", 
                        0x00020000
                    }, 

                    Package (0x02)
                    {
                        "DecreaseFilterBw", 
                        0x3333
                    }, 

                    Package (0x02)
                    {
                        "TargetBusyPct", 
                        0x55
                    }, 

                    Package (0x02)
                    {
                        "SampleRate", 
                        0x3C
                    }, 

                    Package (0x02)
                    {
                        "TargetBusyPctOffscreen", 
                        0x4B
                    }, 

                    Package (0x02)
                    {
                        "SampleRateOffscreen", 
                        0x14
                    }, 

                    Package (0x02)
                    {
                        "GpuResetValue", 
                        0x11490C80
                    }, 

                    Package (0x02)
                    {
                        "BusResetValue", 
                        0x08FC
                    }
                }, 

                Package (0x07)
                {
                    "A5x", 
                    Package (0x02)
                    {
                        "DisableSpCollapse", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DisableRbCcuCollapse", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DisableDCS", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DisableICG", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DisableGpmuCG", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "EnableFallbackToDisableSecureMode", 
                        Zero
                    }
                }
            }, 

            Package (0x03)
            {
                "VIDEO", 
                Package (0x02)
                {
                    "ForceActive", 
                    Zero
                }, 

                Package (0x02)
                {
                    "PreventPowerCollapse", 
                    Zero
                }
            }, 

            Package (0x03)
            {
                "VIDEO_ENCODER", 
                Package (0x02)
                {
                    "ForceActive", 
                    Zero
                }, 

                Package (0x02)
                {
                    "PreventPowerCollapse", 
                    Zero
                }
            }, 

            Package (0x06)
            {
                "DISPLAY", 
                Package (0x02)
                {
                    "DisableMiracast", 
                    One
                }, 

                Package (0x02)
                {
                    "EnableOEMDriverDependency", 
                    Zero
                }, 

                Package (0x02)
                {
                    "EnableBridgeDriverDependency", 
                    Zero
                }, 

                Package (0x02)
                {
                    "DisableRotator", 
                    Zero
                }, 

                Package (0x02)
                {
                    "DisableMDPBLT", 
                    One
                }
            }
        })
        Return (RBUF) /* \_SB_.GPU0.REGR.RBUF */
    }
}
