Device (RPEN)
{
    Name (_HID, "QCOM006A")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
}

Device (PILC)
{
    Name (_HID, "QCOM0039")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Method(PILX)
    {
        return (PILP)
    }

    Name(PILP,
        Package()
        {
            // Methods needed for PIL bootup proceedure
            // Drive will parse this list and call each 
            // method accordingly
            "OPCA",         // ACPO - ACPI Override for MBA load address
        }
    )

    Method (ACPO)
    {
        Name(PKGG, Package()
        {
            Package ()
            {
                // Represents MBA subsystem
                0x94500000, // Address
                0x00200000, // Length
                ToUUID ("BA58766D-ABF2-4402-88D7-90AB243F6C77")
            }
        })

        // Copy ACPI globals for Address for this subsystem into above package for use in driver
        Store (RMTB, Index(DeRefOf(Index (PKGG, 0)), 0))
        Store (RMTX, Index(DeRefOf(Index (PKGG, 0)), 1))
        
        Return (PKGG)
    }
}

Device (CDI)
{
    Name (_DEP, Package (0x02)  // _DEP: Dependencies
    {
        \_SB.PILC, 
        \_SB.RPEN
    })
    Name (_HID, "QCOM0069")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
}

Device (SCSS)
{
    Name (_DEP, Package (0x06)  // _DEP: Dependencies
    {
        \_SB.PEP0, 
        \_SB.PILC, 
        \_SB.GLNK, 
        \_SB.IPC0, 
        \_SB.RPEN, 
        \_SB.SSDD
    })
    Name (_HID, "QCOM00C3")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000001A6,
            }
        })
        Return (RBUF) /* \_SB_.SCSS._CRS.RBUF */
    }
}

Device (ADSP)
{
    Name (_DEP, Package (0x07)  // _DEP: Dependencies
    {
        \_SB.PEP0, 
        \_SB.PILC, 
        \_SB.GLNK, 
        \_SB.IPC0, 
        \_SB.RPEN, 
        \_SB.SSDD, 
        \_SB.PDSR
    })
    Name (_HID, "QCOM003B")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Method (WDIR, 0, NotSerialized)
    {
        Return (Package (0x04)
        {
            0x02, 
            0x17A00118, 
            0x17A00198, 
            0x17A00298
        })
    }

    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000000C2,
            }
        })
        Return (RBUF) /* \_SB_.ADSP._CRS.RBUF */
    }

    Device (SLM1)
    {
        Name (_ADR, Zero)  // _ADR: Address
        Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
        Alias (\_SB.PSUB, _SUB)
        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            Name (RBUF, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite,
                    0x171C0000,         // Address Base
                    0x0002C000,         // Address Length
                    )
                Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                {
                    0x000000C3,
                }
            })
            Return (RBUF) /* \_SB_.ADSP.SLM1._CRS.RBUF */
        }

        Method (CHLD, 0, NotSerialized)
        {
            Return (Package (0x01)
            {
                "SLM1\\QCOM00FA"
            })
        }

        Device (ADCM)
        {
            Alias (\_SB.PSUB, _SUB)
            Name (_ADR, Zero)  // _ADR: Address
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                \_SB.MMU2
            })
            Method (CHLD, 0, NotSerialized)
            {
                Return (Package (0x01)
                {
                    "ADCM\\QCOM00FB"
                })
            }

            Device (AUDD)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Alias (\_SB.PSUB, _SUB)
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (RBUF, ResourceTemplate ()
                    {
                        GpioIo (Exclusive, PullNone, 0x0000, 0x0640, IoRestrictionNone,
                            "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                            )
                            {   // Pin list
                                0x0040
                            }
                        GpioInt (Edge, ActiveHigh, Exclusive, PullDown, 0x0000,
                            "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                            )
                            {   // Pin list
                                0x0036
                            }
                        GpioIo (Exclusive, PullDown, 0x0000, 0x0000, IoRestrictionNone,
                            "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                            )
                            {   // Pin list
                                0x0041
                            }
                        GpioIo (Exclusive, PullDown, 0x0000, 0x0000, IoRestrictionNone,
                            "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                            )
                            {   // Pin list
                                0x0042
                            }
                    })
                    Return (RBUF) /* \_SB_.ADSP.SLM1.ADCM.AUDD._CRS.RBUF */
                }

                Method (CHLD, 0, NotSerialized)
                {
                    Name (CH, Package (0x02)
                    {
                        "AUDD\\QCOM0075", 
                        "AUDD\\QCOM005F"
                    })
                    Return (CH) /* \_SB_.ADSP.SLM1.ADCM.AUDD.CHLD.CH__ */
                }

                Device (MBHC)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Name (RBUF, ResourceTemplate ()
                        {
                            GpioIo (Exclusive, PullDown, 0x0000, 0x0000, IoRestrictionNone,
                                "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                                )
                                {   // Pin list
                                    0x004B
                                }
                        })
                        Return (RBUF) /* \_SB_.ADSP.SLM1.ADCM.AUDD.MBHC._CRS.RBUF */
                    }
                }

                Device (QCRT)
                {
                    Name (_ADR, One)  // _ADR: Address
                }
            }
        }
    }

    Device (SLM2)
    {
        Name (_ADR, One)  // _ADR: Address
        Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            Name (RBUF, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite,
                    0x17240000,         // Address Base
                    0x0002C000,         // Address Length
                    )
                Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                {
                    0x00000143,
                }
            })
            Return (RBUF) /* \_SB_.ADSP.SLM2._CRS.RBUF */
        }
    }
}


//
// AMSS Driver: Used for loading the modem binaries
//
Device (AMSS)
{
    Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
    Name (_DEP, Package (0x08)  // _DEP: Dependencies
    {
        \_SB.PEP0, 
        \_SB.GLNK, 
        \_SB.IPC0, 
        \_SB.PILC, 
        \_SB.RFS0, 
        \_SB.RPEN, 
        \_SB.SSDD, 
        \_SB.PDSR
    })
    Name (_HID, "QCOM003C")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Method (_HRV, 0, NotSerialized)  // _HRV: Hardware Revision
    {
        Return (One)
    }

    //
    // RPEC - RPE Clients Information
    //
    Method (RPEC, 0, NotSerialized)
    {
        If ((\_SB.SOID == 0x013F))
        {
            Return (Package (0x02)
            {
                ToUUID ("2eaf5c83-4fa9-49b3-a247-bfdd66e5655b") /* SMD AMSS client GUID */, 
                ToUUID ("0c25c0b1-f2b9-4688-b403-51cd34e8bb23") /* G-Link AMSS client GUID */
            })
        }
        Else
        {
            Return (Package (0x03)
            {
                ToUUID ("2eaf5c83-4fa9-49b3-a247-bfdd66e5655b") /* SMD AMSS client GUID */, 
                ToUUID ("0c25c0b1-f2b9-4688-b403-51cd34e8bb23") /* G-Link AMSS client GUID */, 
                Buffer (0x10)
                {
                    /* 0000 */  0x9C, 0x00, 0x4C, 0x18, 0xCC, 0x42, 0xFF, 0x83,  // ..L..B..
                    /* 0008 */  0x87, 0x25, 0x13, 0xA5, 0x7C, 0x32, 0x01, 0xEF   // .%..|2..
                }
            })
        }
    }
    Method (CHLD)
    {
        Return (Package (0x02)
        {
            Package (0x05)
            {
                "QCMS\\QCOM00EA", 
                0x12, 
                Zero, 
                One, 
                One
            }, 

            Package (0x05)
            {
                "QCMS\\QCOM00F7", 
                0x2B, 
                Zero, 
                One, 
                0x02
            }
        })

    }

    // Flag to enable modem shutdown (1 is enabled, 0 is disabled)
    Method (SHUT, 0, NotSerialized)
    {
        // First argument SMD client GUID and Second argument points that dump collection does not need unlock from TZ
        Return (Package (0x01)
        {
            One
        })
    }

    Method (RPEM, 0, NotSerialized)
    {
        // Modem shutdown is handled by SUBSYS on this platform
        Return (Package (0x01)
        {
            0x03
        })
    }

    //
    // Mappings from performance percentage to thermal mitigation level
    //
    Method (VLMT, 0x0, NotSerialized) {
        Name (RBUF, Package ()
        {
            //           Percent(<=), TM level,
            //           -----        ----------
            Package () { 33,          3 },
            Package () { 66,          2 },
            Package () { 99,          1 },
            Package () { 100,         0 }
        })
        Return (RBUF)  
    }


    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000001E0,
            }
        })
        Return (RBUF) /* \_SB_.AMSS._CRS.RBUF */
    }

    //
    // WDIR - Watch Dog Interrupt Registers
    //
    Method (WDIR)
    {
        Return (Package (0x04)
        {
            Zero, 
            0x17A0013C, 
            0x17A001BC, 
            0x17A002BC
        })
    }

    Include("wcnss_wlan.asl")
}


// QMI Service manager
//
Device (QSM)
{
    Name (_HID, "QCOM00BD")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (0x04)  // _DEP: Dependencies
    {
        \_SB.GLNK, 
        \_SB.IPC0, 
        \_SB.PILC, 
        \_SB.RPEN
    })

    //
    // DHMS client memory config
    //
    Method (_CRS, 0, NotSerialized)  
    {
        Name (RBUF, ResourceTemplate ()
        {
            // UEFI memory bank for DHMS clients
            // Note: must match order of flagged for carveout packages below
            Memory32Fixed(ReadWrite, 0x95100000, 0x00600000) 
        })
        Return (RBUF) 
    }

    //
    // DHMS client config
    //
    Name (DHMS, Package (0x01)
    {
        Package (0x03)
        {
            // Subsystem Name
            "Diag", 

            Buffer (0x10)
            {
                /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
            }, 

            // Max CMA size, 0 = Use carveout
            Zero
        }
    })

    //
    // QSMG - QSM General Platform-specific Configuration
    //
    Method (QSMG, 0, NotSerialized)
    {
        Return (Package (0x01)
        {
            1
        })
    }

}

//
// Subsys Dependency Device
//    Subsys devices that use QCCI should have an dependency on this
//
Device (SSDD)
{
    Name (_HID, "QCOM00D6")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (0x02)  // _DEP: Dependencies
    {
        \_SB.GLNK, 
        \_SB.TFTP
    })
}

//
// PDSR device
//
Device (PDSR)
{
    Name (_HID, "QCOM00D3")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (0x03)  // _DEP: Dependencies
    {
        \_SB.PEP0, 
        \_SB.GLNK, 
        \_SB.IPC0
    })
}

//
// TFTP Device
//
Device (TFTP)
{
    Name (_HID, "QCOM00FE")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (One)  // _DEP: Dependencies
    {
        \_SB.IPC0
    })
}

Device (SSVC)
{
    Name (_DEP, Package (0x02)  // _DEP: Dependencies
    {
        \_SB.IPC0, 
        \_SB.QDIG
    })
    Name (_HID, "QCOM0107")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_CID, "ACPIQCOM0107")  // _CID: Compatible ID
    Name (_UID, Zero)  // _UID: Unique ID
}

// Warning:  Include these files after device scopes have been defined
//Include("cust_win_mproc.asl")   // Customer specific data
Include("plat_win_mproc.asl")   // Platform specific data
