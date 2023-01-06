Device (SYSM)
{
    Name (_HID, "ACPI0010" /* Processor Container Device */)  // _HID: Hardware ID
    Name (_UID, 0x00100000)  // _UID: Unique ID
    Device (APC0)
    {
        Name (_HID, "ACPI0010" /* Processor Container Device */)  // _HID: Hardware ID
        Name (_UID, 0x0100)  // _UID: Unique ID
        Name (_LPI, Package (0x06)  // _LPI: Low Power Idle States
        {
            Zero, 
            0x02000000, 
            0x03, 
            Package (0x0A)
            {
                0x0BB8, 
                0x044C, 
                One, 
                Zero, 
                Zero, 
                Zero, 
                0x0400, 
                ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                "CCI.E3"
            }, 

            Package (0x0A)
            {
                0x0DAC, 
                0x047E, 
                One, 
                Zero, 
                Zero, 
                Zero, 
                0x0500, 
                ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                "CCI.E3+RPM"
            }, 

            Package (0x0A)
            {
                0x80E8, 
                0x01F4, 
                One, 
                0x20, 
                Zero, 
                Zero, 
                0x0300, 
                ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                "platform.xo"
            }
        })
        Device (CL0)
        {
            Name (_HID, "ACPI0010" /* Processor Container Device */)  // _HID: Hardware ID
            Name (_UID, 0x10)  // _UID: Unique ID
            Name (_LPI, Package (0x06)  // _LPI: Low Power Idle States
            {
                Zero, 
                0x01000000, 
                0x03, 
                Package (0x0A)
                {
                    0x012C, 
                    0x82, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x20, 
                    ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                    ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                    "L2_Silver.D2d"
                }, 

                Package (0x0A)
                {
                    0x015E, 
                    0x96, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x30, 
                    ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                    ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                    "L2_Silver.D2e"
                }, 

                Package (0x0A)
                {
                    0x1900, 
                    0x0384, 
                    One, 
                    Zero, 
                    Zero, 
                    0x03, 
                    0x40, 
                    ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                    ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                    "L2_Silver.D4"
                }
            })
            Device (CPU0)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, Zero)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (_LPI, Package (0x07)  // _LPI: Low Power Idle States
                {
                    Zero, 
                    Zero, 
                    0x04, 
                    Package (0x0A)
                    {
                        Zero, 
                        Zero, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x00000000FFFFFFFF, 3)}, // Register entry method <= WFI
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoSilver0.C1"
                    }, 

                    Package (0x0A)
                    {
                        0x0190, 
                        0x64, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x0000000000000002, 3)}, // Register entry method 
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoSilver0.C2d"
                    }, 

                    Package (0x0A)
                    {
                        0x01C2, 
                        0x012C, 
                        One, 
                        One, 
                        Zero, 
                        0x03, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000003,3)}, // Core collapse.
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoSilver0.C3"
                    }, 

                    Package (0x0A)
                    {
                        0x01C2, 
                        0x012C, 
                        Zero, 
                        One, 
                        Zero, 
                        0x03, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000004,3)}, // Core collapse.
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoSilver0.C3_NI"
                    }
                })
            }

            Device (CPU1)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, One)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (_LPI, Package (0x07)  // _LPI: Low Power Idle States
                {
                    Zero, 
                    Zero, 
                    0x04, 
                    Package (0x0A)
                    {
                        Zero, 
                        Zero, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x00000000FFFFFFFF, 4)}, // Register entry method <= WFI
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoSilver1.C1"
                    }, 

                    Package (0x0A)
                    {
                        0x0190, 
                        0x64, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x0000000000000002, 3)}, // Register entry method 
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoSilver1.C2d"
                    }, 

                    Package (0x0A)
                    {
                        0x01C2, 
                        0x012C, 
                        One, 
                        One, 
                        Zero, 
                        0x03, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000003,3)}, // Core collapse.
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoSilver1.C3"
                    }, 

                    Package (0x0A)
                    {
                        0x01C2, 
                        0x012C, 
                        Zero, 
                        One, 
                        Zero, 
                        0x03, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000004,3)}, // Core collapse.
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoSilver1.C3_NI"
                    }
                })
            }

            Device (CPU2)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x02)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (_LPI, Package (0x07)  // _LPI: Low Power Idle States
                {
                    Zero, 
                    Zero, 
                    0x04, 
                    Package (0x0A)
                    {
                        Zero, 
                        Zero, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x00000000FFFFFFFF, 4)}, // Register entry method <= WFI
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoSilver2.C1"
                    }, 

                    Package (0x0A)
                    {
                        0x0190, 
                        0x64, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x0000000000000002, 3)}, // Register entry method 
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoSilver2.C2d"
                    }, 

                    Package (0x0A)
                    {
                        0x01C2, 
                        0x012C, 
                        One, 
                        One, 
                        Zero, 
                        0x03, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000003,3)}, // Core collapse.
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoSilver2.C3"
                    }, 

                    Package (0x0A)
                    {
                        0x01C2, 
                        0x012C, 
                        Zero, 
                        One, 
                        Zero, 
                        0x03, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000004,3)}, // Core collapse.
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoSilver2.C3_NI"
                    }
                })
            }

            Device (CPU3)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x03)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (_LPI, Package (0x07)  // _LPI: Low Power Idle States
                {
                    Zero, 
                    Zero, 
                    0x04, 
                    Package (0x0A)
                    {
                        Zero, 
                        Zero, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x00000000FFFFFFFF, 4)}, // Register entry method <= WFI
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoSilver3.C1"
                    }, 

                    Package (0x0A)
                    {
                        0x0190, 
                        0x64, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x0000000000000002, 3)}, // Register entry method 
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoSilver3.C2d"
                    }, 

                    Package (0x0A)
                    {
                        0x01C2, 
                        0x012C, 
                        One, 
                        One, 
                        Zero, 
                        0x03, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000003,3)}, // Core collapse.
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoSilver3.C3"
                    }, 

                    Package (0x0A)
                    {
                        0x01C2, 
                        0x012C, 
                        Zero, 
                        One, 
                        Zero, 
                        0x03, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000004,3)}, // Core collapse.
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoSilver3.C3_NI"
                    }
                })
            }
        }

        Device (CL1)
        {
            Name (_HID, "ACPI0010" /* Processor Container Device */)  // _HID: Hardware ID
            Name (_UID, 0x20)  // _UID: Unique ID
            Name (_LPI, Package (0x06)  // _LPI: Low Power Idle States
            {
                Zero, 
                0x01000000, 
                0x03, 
                Package (0x0A)
                {
                    0x0384, 
                    0xC8, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x20, 
                    ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                    ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                    "L2_Gold.D2d"
                }, 

                Package (0x0A)
                {
                    0x03E8, 
                    0x0190, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x30, 
                    ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                    ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                    "L2_Gold.D2e"
                }, 

                Package (0x0A)
                {
                    0x1770, 
                    0x04B0, 
                    One, 
                    Zero, 
                    Zero, 
                    0x03, 
                    0x40, 
                    ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                    ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                    "L2_Gold.D4"
                }
            })
            Device (CPU4)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x04)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (_LPI, Package (0x07)  // _LPI: Low Power Idle States
                {
                    Zero, 
                    Zero, 
                    0x04, 
                    Package (0x0A)
                    {
                        Zero, 
                        Zero, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x00000000FFFFFFFF, 4)}, // Register entry method <= WFI
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoGold0.C1"
                    }, 

                    Package (0x0A)
                    {
                        0x0258, 
                        0x50, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x0000000000000002, 3)}, // Register entry method 
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoGold0.C2d"
                    }, 

                    Package (0x0A)
                    {
                        0x1B58, 
                        0x5A, 
                        One, 
                        One, 
                        Zero, 
                        0x03, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000003,3)}, // Core collapse.
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoGold0.C3"
                    }, 

                    Package (0x0A)
                    {
                        0x1B58, 
                        0x5A, 
                        Zero, 
                        One, 
                        Zero, 
                        0x03, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000004,3)}, // Core collapse.
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoGold0.C3_NI"
                    }
                })
            }

            Device (CPU5)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x05)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (_LPI, Package (0x07)  // _LPI: Low Power Idle States
                {
                    Zero, 
                    Zero, 
                    0x04, 
                    Package (0x0A)
                    {
                        Zero, 
                        Zero, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x00000000FFFFFFFF, 4)}, // Register entry method <= WFI
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoGold1.C1"
                    }, 

                    Package (0x0A)
                    {
                        0x0258, 
                        0x50, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x0000000000000002, 3)}, // Register entry method 
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoGold1.C2d"
                    }, 

                    Package (0x0A)
                    {
                        0x1B58, 
                        0x5A, 
                        One, 
                        One, 
                        Zero, 
                        0x03, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000003,3)}, // Core collapse.
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoGold1.C3"
                    }, 

                    Package (0x0A)
                    {
                        0x1B58, 
                        0x5A, 
                        Zero, 
                        One, 
                        Zero, 
                        0x03, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000004,3)}, // Core collapse.
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoGold1.C3_NI"
                    }
                })
            }

            Device (CPU6)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x06)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (_LPI, Package (0x07)  // _LPI: Low Power Idle States
                {
                    Zero, 
                    Zero, 
                    0x04, 
                    Package (0x0A)
                    {
                        Zero, 
                        Zero, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x00000000FFFFFFFF, 4)}, // Register entry method <= WFI
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoGold2.C1"
                    }, 

                    Package (0x0A)
                    {
                        0x0258, 
                        0x50, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x0000000000000002, 3)}, // Register entry method 
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoGold2.C2d"
                    }, 

                    Package (0x0A)
                    {
                        0x1B58, 
                        0x5A, 
                        One, 
                        One, 
                        Zero, 
                        0x03, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000003,3)}, // Core collapse.
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoGold2.C3"
                    }, 

                    Package (0x0A)
                    {
                        0x1B58, 
                        0x5A, 
                        Zero, 
                        One, 
                        Zero, 
                        0x03, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000004,3)}, // Core collapse.
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoGold2.C3_NI"
                    }
                })
            }

            Device (CPU7)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x07)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (_LPI, Package (0x07)  // _LPI: Low Power Idle States
                {
                    Zero, 
                    Zero, 
                    0x04, 
                    Package (0x0A)
                    {
                        Zero, 
                        Zero, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x00000000FFFFFFFF, 4)}, // Register entry method <= WFI
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoGold3.C1"
                    }, 

                    Package (0x0A)
                    {
                        0x0258, 
                        0x50, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0, 0x0000000000000002, 3)}, // Register entry method 
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoGold3.C2d"
                    }, 

                    Package (0x0A)
                    {
                        0x1B58, 
                        0x5A, 
                        One, 
                        One, 
                        Zero, 
                        0x03, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000003,3)}, // Core collapse.
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoGold3.C3"
                    }, 

                    Package (0x0A)
                    {
                        0x1B58, 
                        0x5A, 
                        Zero, 
                        One, 
                        Zero, 
                        0x03, 
						ResourceTemplate(){Register(FFixedHW, 0x20, 0,0x0000000040000004,3)}, // Core collapse.
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Residency counter register
                        ResourceTemplate(){Register(SystemMemory,0,0,0,0)},	// Usage counter register
                        "KryoGold3.C3_NI"
                    }
                })
            }
        }
    }
}
