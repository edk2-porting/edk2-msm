Name (QUFN, Zero)
        Name (DPP0, Buffer (One)
        {
            0x00                                             // .
        })
        Name (DPP1, Buffer (One)
        {
            0x00                                             // .
        })
        Name (MPP0, Buffer (One)
        {
            0x00                                             // .
        })
        Name (MPP1, Buffer (One)
        {
            0x00                                             // .
        })
        Name (HPDB, Zero)
        Name (HPDS, Buffer (One)
        {
            0x00                                             // .
        })
        Name (PINA, Zero)
        Name (DPPN, 0x0D)
        Name (CCST, Buffer (One)
        {
            0x02                                             // .
        })
        Name (PORT, Buffer (One)
        {
            0x02                                             // .
        })
        Name (HIRQ, Buffer (One)
        {
            0x00                                             // .
        })
        Name (HSFL, Buffer (One)
        {
            0x00                                             // .
        })
        Name (USBC, Buffer (One)
        {
            0x0B                                             // .
        })
        Name (MUXC, Buffer (One)
        {
            0x00                                             // .
        })
        Device (URS0)
        {
            Method (URSI, 0, NotSerialized)
            {
                If ((QUFN == Zero))
                {
                    Return ("QCOM0497")
                }
                Else
                {
                    Return ("QCOM0498")
                }
            }

            Alias (URSI, _HID)
            Name (_CID, "PNP0CA1")  // _CID: Compatible ID
            Alias (PSUB, _SUB)
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                Memory32Fixed (ReadWrite,
                    0x04E00000,         // Address Base
                    0x00100000,         // Address Length
                    )
            })
            Device (USB0)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Name (_S0W, 0x03)  // _S0W: S0 Device Wake State
                Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                {
                    ToPLD (
                        PLD_Revision           = 0x2,
                        PLD_IgnoreColor        = 0x1,
                        PLD_Red                = 0x0,
                        PLD_Green              = 0x0,
                        PLD_Blue               = 0x0,
                        PLD_Width              = 0x0,
                        PLD_Height             = 0x0,
                        PLD_UserVisible        = 0x1,
                        PLD_Dock               = 0x0,
                        PLD_Lid                = 0x0,
                        PLD_Panel              = "BACK",
                        PLD_VerticalPosition   = "CENTER",
                        PLD_HorizontalPosition = "LEFT",
                        PLD_Shape              = "VERTICALRECTANGLE",
                        PLD_GroupOrientation   = 0x0,
                        PLD_GroupToken         = 0x0,
                        PLD_GroupPosition      = 0x0,
                        PLD_Bay                = 0x0,
                        PLD_Ejectable          = 0x0,
                        PLD_EjectRequired      = 0x0,
                        PLD_CabinetNumber      = 0x0,
                        PLD_CardCageNumber     = 0x0,
                        PLD_Reference          = 0x0,
                        PLD_Rotation           = 0x0,
                        PLD_Order              = 0x0,
                        PLD_VerticalOffset     = 0xFFFF,
                        PLD_HorizontalOffset   = 0xFFFF)

                })
                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                {
                    One,
                    0x09,
                    Zero,
                    Zero
                })
                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                {
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                    {
                        0x0000011F,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, SharedAndWake, ,, )
                    {
                        0x000001C6,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, SharedAndWake, ,, )
                    {
                        0x000000D8,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, SharedAndWake, ,, )
                    {
                        0x000000DC,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, SharedAndWake, ,, )
                    {
                        0x0000014E,
                    }
                })
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (DPM0, 1, NotSerialized)
                {
                    DPP0 = Arg0
                }

                Method (CCVL, 0, NotSerialized)
                {
                    Return (CCST) /* \_SB_.CCST */
                }

                Method (HSEN, 0, NotSerialized)
                {
                    Return (HSFL) /* \_SB_.HSFL */
                }

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    Switch (ToBuffer (Arg0))
                    {
                        Case (ToUUID ("ce2ee385-00e6-48cb-9f05-2edb927c4899") /* USB Controller */) {                            Switch (ToInteger (Arg2))
                            {
                                Case (Zero)
                                {
                                    Switch (ToInteger (Arg1))
                                    {
                                        Case (Zero)
                                        {
                                            Return (Buffer (One)
                                            {
                                                0x1D                                             // .
                                            })
                                            Break
                                        }
                                        Default
                                        {
                                            Return (Buffer (One)
                                            {
                                                0x01                                             // .
                                            })
                                            Break
                                        }

                                    }

                                    Return (Buffer (One)
                                    {
                                        0x00                                             // .
                                    })
                                    Break
                                }
                                Case (0x02)
                                {
                                    Return (Zero)
                                    Break
                                }
                                Case (0x03)
                                {
                                    Return (Zero)
                                    Break
                                }
                                Case (0x04)
                                {
                                    Return (0x02)
                                    Break
                                }
                                Default
                                {
                                    Return (Buffer (One)
                                    {
                                        0x00                                             // .
                                    })
                                    Break
                                }

                            }
                        }
                        Default
                        {
                            Return (Buffer (One)
                            {
                                0x00                                             // .
                            })
                            Break
                        }

                    }
                }

                Method (PHYC, 0, NotSerialized)
                {
                    Name (CFG0, Package (0x00) {})
                    Return (CFG0) /* \_SB_.URS0.USB0.PHYC.CFG0 */
                }
            }

            Device (UFN0)
            {
                Name (_ADR, One)  // _ADR: Address
                Name (_S0W, 0x03)  // _S0W: S0 Device Wake State
                Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                {
                    ToPLD (
                        PLD_Revision           = 0x2,
                        PLD_IgnoreColor        = 0x1,
                        PLD_Red                = 0x0,
                        PLD_Green              = 0x0,
                        PLD_Blue               = 0x0,
                        PLD_Width              = 0x0,
                        PLD_Height             = 0x0,
                        PLD_UserVisible        = 0x1,
                        PLD_Dock               = 0x0,
                        PLD_Lid                = 0x0,
                        PLD_Panel              = "BACK",
                        PLD_VerticalPosition   = "CENTER",
                        PLD_HorizontalPosition = "LEFT",
                        PLD_Shape              = "VERTICALRECTANGLE",
                        PLD_GroupOrientation   = 0x0,
                        PLD_GroupToken         = 0x0,
                        PLD_GroupPosition      = 0x0,
                        PLD_Bay                = 0x0,
                        PLD_Ejectable          = 0x0,
                        PLD_EjectRequired      = 0x0,
                        PLD_CabinetNumber      = 0x0,
                        PLD_CardCageNumber     = 0x0,
                        PLD_Reference          = 0x0,
                        PLD_Rotation           = 0x0,
                        PLD_Order              = 0x0,
                        PLD_VerticalOffset     = 0xFFFF,
                        PLD_HorizontalOffset   = 0xFFFF)

                })
                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                {
                    One,
                    0x09,
                    Zero,
                    Zero
                })
                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                {
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                    {
                        0x0000011F,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, SharedAndWake, ,, )
                    {
                        0x000001C6,
                    }
                })
                Method (CCVL, 0, NotSerialized)
                {
                    Return (CCST) /* \_SB_.CCST */
                }

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    Switch (ToBuffer (Arg0))
                    {
                        Case (ToUUID ("fe56cfeb-49d5-4378-a8a2-2978dbe54ad2") /* Unknown UUID */) {                            Switch (ToInteger (Arg2))
                            {
                                Case (Zero)
                                {
                                    Switch (ToInteger (Arg1))
                                    {
                                        Case (Zero)
                                        {
                                            Return (Buffer (One)
                                            {
                                                0x03                                             // .
                                            })
                                            Break
                                        }
                                        Default
                                        {
                                            Return (Buffer (One)
                                            {
                                                0x01                                             // .
                                            })
                                            Break
                                        }

                                    }

                                    Return (Buffer (One)
                                    {
                                        0x00                                             // .
                                    })
                                    Break
                                }
                                Case (One)
                                {
                                    Return (0x20)
                                    Break
                                }
                                Default
                                {
                                    Return (Buffer (One)
                                    {
                                        0x00                                             // .
                                    })
                                    Break
                                }

                            }
                        }
                        Case (ToUUID ("18de299f-9476-4fc9-b43b-8aeb713ed751") /* Unknown UUID */) {                            Switch (ToInteger (Arg2))
                            {
                                Case (Zero)
                                {
                                    Switch (ToInteger (Arg1))
                                    {
                                        Case (Zero)
                                        {
                                            Return (Buffer (One)
                                            {
                                                0x03                                             // .
                                            })
                                            Break
                                        }
                                        Default
                                        {
                                            Return (Buffer (One)
                                            {
                                                0x01                                             // .
                                            })
                                            Break
                                        }

                                    }

                                    Return (Buffer (One)
                                    {
                                        0x00                                             // .
                                    })
                                    Break
                                }
                                Case (One)
                                {
                                    Return (0x39)
                                    Break
                                }
                                Default
                                {
                                    Return (Buffer (One)
                                    {
                                        0x00                                             // .
                                    })
                                    Break
                                }

                            }
                        }
                        Default
                        {
                            Return (Buffer (One)
                            {
                                0x00                                             // .
                            })
                            Break
                        }

                    }
                }

                Method (PHYC, 0, NotSerialized)
                {
                    Name (CFG0, Package (0x00) {})
                    Return (CFG0) /* \_SB_.URS0.UFN0.PHYC.CFG0 */
                }
            }
        }
