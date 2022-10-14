//PCIE asl

OperationRegion (CP00, SystemMemory, 0x0016B000, 0x1020)
Field (CP00, DWordAcc, NoLock, Preserve)
{
    GPB0,   32, 
    Offset (0x101C), 
    GP0P,   32
}

OperationRegion (CP01, SystemMemory, 0x01C00000, 0x0400)
Field (CP01, DWordAcc, NoLock, Preserve)
{
    PSC0,   32, 
    Offset (0x24), 
    PPM0,   32, 
    Offset (0x174), 
    PMC0,   32, 
    Offset (0x1B0), 
    PLT0,   32, 
    Offset (0x358), 
    PSL0,   32, 
    Offset (0x360), 
    WBL0,   32, 
    WBH0,   32, 
    WLL0,   32, 
    WLH0,   32, 
    RBL0,   32, 
    RBH0,   32, 
    RLL0,   32, 
    RLH0,   32, 
    PPEB,   32, 
    Offset (0x398), 
    WBL1,   32, 
    WBH1,   32, 
    WLL1,   32, 
    WLH1,   32, 
    RBL1,   32, 
    RBH1,   32, 
    RLL1,   32, 
    RLH1,   32
}

OperationRegion (CP02, SystemMemory, 0x01C06000, 0x0188)
Field (CP02, DWordAcc, NoLock, Preserve)
{
    Offset (0x0C), 
    QCB1,   32, 
    QSEC,   32, 
    QAP1,   32, 
    QAP2,   32, 
    QSP1,   32, 
    QSP2,   32, 
    QSS1,   32, 
    QSS2,   32, 
    Offset (0x34), 
    QECE,   32, 
    QCE1,   32, 
    QSCC,   32, 
    QSBE,   32, 
    Offset (0x48), 
    QCPI,   32, 
    Offset (0x5C), 
    QCED,   32, 
    QCP0,   32, 
    Offset (0x68), 
    QPR0,   32, 
    Offset (0x70), 
    QPC0,   32, 
    Offset (0x80), 
    QSES,   32, 
    Offset (0x88), 
    QCRC,   32, 
    Offset (0x90), 
    QCLC,   32, 
    Offset (0x98), 
    QC1M,   32, 
    QC2M,   32, 
    QC3M,   32, 
    Offset (0xB0), 
    QSM0,   32, 
    Offset (0xB8), 
    QS1M,   32, 
    QS2M,   32, 
    QS3M,   32, 
    Offset (0xD8), 
    QIG0,   32, 
    QIG1,   32, 
    Offset (0xF0), 
    QCVT,   32, 
    QVT1,   32, 
    QVT2,   32, 
    Offset (0x11C), 
    QTT1,   32, 
    QTT2,   32, 
    Offset (0x138), 
    QCCS,   32, 
    QCHS,   32, 
    Offset (0x148), 
    QCD0,   32, 
    Offset (0x154), 
    QCCN,   32, 
    Offset (0x15C), 
    QCCC,   32, 
    Offset (0x164), 
    QMCS,   32, 
    Offset (0x184), 
    QCCM,   32
}

OperationRegion (CP03, SystemMemory, 0x01C06200, 0xA8)
Field (CP03, DWordAcc, NoLock, Preserve)
{
    Offset (0x44), 
    QTOT,   32, 
    Offset (0x60), 
    QTDE,   32, 
    Offset (0x8C), 
    QTM1,   32, 
    Offset (0xA4), 
    QTL2,   32
}

OperationRegion (CP04, SystemMemory, 0x01C06400, 0x016C)
Field (CP04, DWordAcc, NoLock, Preserve)
{
    Offset (0x0C), 
    QRSH,   32, 
    Offset (0x14), 
    QRSG,   32, 
    Offset (0x34), 
    QRUS,   32, 
    Offset (0x3C), 
    QRFL,   32, 
    Offset (0x44), 
    QRPC,   32, 
    Offset (0xD4), 
    QRC2,   32, 
    QRC3,   32, 
    QRC4,   32, 
    Offset (0xF8), 
    QRA1,   32, 
    QRA2,   32, 
    QRSE,   32, 
    QRSC,   32, 
    Offset (0x10C), 
    QRDC,   32, 
    Offset (0x11C), 
    QRIM,   32, 
    Offset (0x164), 
    QRM0,   32, 
    QRM1,   32
}

OperationRegion (CP05, SystemMemory, 0x01C06600, 0x3C)
Field (CP05, DWordAcc, NoLock, Preserve)
{
    Offset (0x2C), 
    PMDC,   32, 
    Offset (0x34), 
    PMD4,   32, 
    PMD5,   32
}

OperationRegion (CP06, SystemMemory, 0x01C06800, 0x01E4)
Field (CP06, DWordAcc, NoLock, Preserve)
{
    PPSR,   32, 
    PPDC,   32, 
    PCST,   32, 
    Offset (0x54), 
    PERD,   32, 
    Offset (0xA0), 
    PDTA,   32, 
    PLTA,   32, 
    PLCD,   32, 
    Offset (0xC4), 
    PFC1,   32, 
    PFC2,   32, 
    PFVL,   32, 
    PFVH,   32, 
    PFMC,   32, 
    Offset (0x174), 
    PPPS,   32, 
    Offset (0x1A8), 
    PSDM,   32, 
    PODA,   32, 
    PPSC,   32, 
    Offset (0x1D8), 
    PRSL,   32, 
    PDAL,   32, 
    PDAM,   32
}

OperationRegion (CP07, SystemMemory, 0x1B000000, 0x1004)
Field (CP07, DWordAcc, NoLock, Preserve)
{
    Offset (0x04), 
    SCR0,   32, 
    CRI0,   32, 
    Offset (0x10), 
    R0B0,   32, 
    R0B1,   32, 
    BNR0,   32, 
    Offset (0x7C), 
    LCA0,   32, 
    LCS0,   32, 
    Offset (0x88), 
    SLC0,   32, 
    Offset (0xA0), 
    LC20,   32, 
    Offset (0x8BC), 
    CSW0,   32, 
    Offset (0x900), 
    IAV0,   32, 
    CR10,   32, 
    CR20,   32, 
    ILB0,   32, 
    IUB0,   32, 
    ILR0,   32, 
    ILT0,   32, 
    IUT0,   32, 
    Offset (0xF24), 
    ESC0,   32, 
    EST0,   32, 
    Offset (0xFC4), 
    ECS0,   32
}

Method (CPUP, 0, Serialized)
{
    Name (TOUT, Zero)
    PPDC = One
    QECE = 0x14
    QCPI = 0x07
    QCLC = One
    QCRC = 0x20
    QCVT = Zero
    QVT2 = One
    QVT1 = 0xC9
    QTT1 = 0xFF
    QTT2 = 0x3F
    QMCS = One
    QCCN = Zero
    QCD0 = 0x0A
    QCED = 0x19
    QCE1 = 0x90
    QSM0 = 0x82
    QS3M = 0x02
    QS2M = 0xEA
    QS1M = 0xAB
    QC3M = Zero
    QC2M = 0x0D
    QC1M = 0x04
    QCHS = Zero
    QCP0 = 0x06
    QPR0 = 0x16
    QPC0 = 0x36
    QCCM = One
    QCCC = 0x06
    QCCS = 0x33
    QSCC = 0x02
    QSBE = 0x0E
    QSES = 0x04
    QIG1 = Zero
    QIG0 = 0x3F
    QCB1 = 0x09
    QSEC = One
    QSP1 = 0x40
    QSP2 = One
    QAP1 = 0x02
    QAP2 = Zero
    QSS1 = 0x7E
    QSS2 = 0x15
    QTOT = 0x02
    QTL2 = 0x12
    QTDE = 0x10
    QTM1 = 0x06
    QRSC = 0x03
    QRSE = 0x18
    QRDC = 0x14
    QRC2 = 0x0A
    QRC3 = 0x04
    QRC4 = 0x1A
    QRUS = 0x4B
    QRSG = 0x04
    QRSH = 0x04
    QRA1 = 0x71
    QRM0 = 0x59
    QRM1 = 0x59
    QRA2 = 0x80
    QRIM = 0x40
    QRPC = 0x71
    QRFL = 0x40
    PERD = 0x04
    PMDC = 0x50
    PMD4 = 0x1A
    PMD5 = 0x06
    PFC2 = 0x83
    PFVL = 0x09
    PFVH = 0xA2
    PFMC = 0x40
    PFC1 = 0x02
    PODA = Zero
    PDTA = One
    PDAM = Zero
    PDAL = 0x20
    PSDM = Zero
    PLTA = One
    PLCD = 0x73
    PRSL = 0xAA
    PPSC = 0x03
    If ((\_SB.SIDV >= 0x00020000))
    {
        QSBE = 0x07
        QRSE = 0x1C
    }

    PPDC = 0x03
    PPSR = Zero
    PCST = 0x03
    Local0 = PPPS /* \_SB_.PPPS */
    While ((Local0 & 0x40))
    {
        Sleep (One)
        TOUT++
        If ((TOUT == 0x0F))
        {
            Break
        }

        Local0 = PPPS /* \_SB_.PPPS */
    }

    If ((TOUT == 0x0F))
    {
        Return (One)
    }
    Else
    {
        Return (Zero)
    }
}

Method (LTS0, 0, Serialized)
{
    Name (TOUT, Zero)
    Local0 = LC20 /* \_SB_.LC20 */
    Local0 |= 0x40
    LC20 = Local0
    PLT0 = 0x0100
    Local0 = EST0 /* \_SB_.EST0 */
    While (((Local0 & 0x0400) != 0x0400))
    {
        Sleep (One)
        TOUT++
        If ((TOUT == 0x96))
        {
            Break
        }

        Local0 = EST0 /* \_SB_.EST0 */
    }

    If ((TOUT == 0x96))
    {
        Return (One)
    }
    Else
    {
        Return (Zero)
    }
}

Method (IAT0, 0, Serialized)
{
    IAV0 = One
    ILB0 = 0x1B100000
    IUB0 = Zero
    ILR0 = 0x1B1FFFFF
    ILT0 = 0x01000000
    IUT0 = Zero
    CR10 = 0x04
    CR20 = 0x80000000
    BNR0 = 0x00010100
}

Method (REBM, 2, Serialized)
{
    Local0 = PSC0 /* \_SB_.PSC0 */
    Local0 &= 0xFBFFFFFF
    PSC0 = Local0
    WBL0 = Arg0
    WBH0 = Zero
    WLL0 = Arg1
    WLH0 = Zero
    RBL0 = Arg0
    RBH0 = Zero
    RLL0 = Arg1
    RLH0 = Zero
    Local0 = PSC0 /* \_SB_.PSC0 */
    Local0 |= 0x04000000
    PSC0 = Local0
}

Method (EEBM, 2, Serialized)
{
    Local0 = PSC0 /* \_SB_.PSC0 */
    Local0 &= 0xBFFFFFFF
    PSC0 = Local0
    WBL1 = Arg0
    WBH1 = Zero
    WLL1 = Arg1
    WLH1 = Zero
    RBL1 = Arg0
    RBH1 = Zero
    RLL1 = Arg1
    RLH1 = Zero
    Local0 = PSC0 /* \_SB_.PSC0 */
    Local0 |= 0x40000000
    PSC0 = Local0
}

Name (E0LT, 0x1B0FFFFF)
Method (MSC0, 0, Serialized)
{
    Local0 = SCR0 /* \_SB_.SCR0 */
    Local0 |= 0x02
    SCR0 = Local0
    PSL0 = 0x01000000
    CSW0 = One
    Local0 = LCA0 /* \_SB_.LCA0 */
    Local0 |= 0x00400000
    Local0 &= 0xFFFFFBF0
    Local0 |= 0x0800
    Local0 |= 0x02
    LCA0 = Local0
    Local0 = CRI0 /* \_SB_.CRI0 */
    Local0 &= 0xFFFF
    Local0 |= 0x06040000
    CRI0 = Local0
    ECS0 = One
    R0B0 = Zero
    R0B1 = Zero
    ECS0 = Zero
    CSW0 = Zero
    PPEB = 0x1B000000
    REBM (0x1B001000, \_SB.E0LT)
    EEBM (0x1B101000, 0x1B1FFFFF)
}

Name (G0D3, Zero)
PowerResource (P0ON, 0x05, 0x0000)
{
    Name (_DEP, Package (One)  // _DEP: Dependencies
    {
        \_SB.GIO0
    })
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        Return (Zero)
    }

    Method (_ON, 0, NotSerialized)  // _ON_: Power On
    {
        If (G0D3)
        {
            If ((\_SB.GIO0.GABL == One))
            {
                \_SB.PCI0.MOD1 = One
                Sleep (0x05)
                \_SB.PCI0.MOD2 = Zero
            }

            G0D3 = Zero
            If (\_SB.CPUP ())
            {
                While (One){}
            }

            Sleep (0x05)
            If ((\_SB.GIO0.GABL == One))
            {
                \_SB.PCI0.MOD2 = One
            }

            If (\_SB.LTS0 ())
            {
                \_SB.E0LT = 0x1B1FFFFF
            }
            Else
            {
                \_SB.E0LT = 0x1B0FFFFF
            }

            \_SB.IAT0 ()
            \_SB.MSC0 ()
        }
    }

    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
    {
        If ((G0D3 == Zero))
        {
            Name (PTO0, Zero)
            G0D3 = One
            Local0 = PSC0 /* \_SB_.PSC0 */
            Local0 |= 0x10
            PSC0 = Local0
            Local0 = ESC0 /* \_SB_.ESC0 */
            Local0 |= 0x10
            ESC0 = Local0
            Local0 = PPM0 /* \_SB_.PPM0 */
            While (Local0 &= (0x20 != 0x20))
            {
                Sleep (0x0A)
                PTO0 += One
                If ((PTO0 == 0x0A))
                {
                    Break
                }

                Local0 = PPM0 /* \_SB_.PPM0 */
            }

            If ((\_SB.GIO0.GABL == One))
            {
                \_SB.PCI0.MOD2 = Zero
            }

            PPDC = Zero
            PCST = Zero
        }
    }
}

PowerResource (P0OF, 0x05, 0x0000)
{
    Name (_DEP, Package (One)  // _DEP: Dependencies
    {
        \_SB.GIO0
    })
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        Return (Zero)
    }

    Method (_ON, 0, NotSerialized)  // _ON_: Power On
    {
    }

    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
    {
    }

    Method (_RST, 0, NotSerialized)  // _RST: Device Reset
    {
        GPB0 = One
        Sleep (One)
        GPB0 = Zero
        GP0P = One
        Sleep (One)
        GP0P = Zero
        If ((\_SB.GIO0.GABL == One))
        {
            \_SB.PCI0.MOD1 = Zero
            Sleep (One)
            \_SB.PCI0.MOD1 = One
            Sleep (One)
            \_SB.PCI0.MOD2 = Zero
        }

        If (\_SB.CPUP ())
        {
            While (One){}
        }

        If ((\_SB.GIO0.GABL == One))
        {
            \_SB.PCI0.MOD2 = One
        }

        Sleep (0x0A)
        If (\_SB.LTS0 ())
        {
            \_SB.E0LT = 0x1B1FFFFF
        }
        Else
        {
            \_SB.E0LT = 0x1B0FFFFF
        }

        \_SB.IAT0 ()
        \_SB.MSC0 ()
    }
}

Device (PCI0)
{
    Name (_DEP, Package (One)  // _DEP: Dependencies
    {
        \_SB.PEP0
    })
    Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
    Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
    Name (_UID, Zero)  // _UID: Unique ID
    Name (_SEG, Zero)  // _SEG: PCI Segment
    Name (_BBN, Zero)  // _BBN: BIOS Bus Number
    Name (_PRT, Package (0x04)  // _PRT: PCI Routing Table
    {
        Package (0x04)
        {
            0xFFFF, 
            Zero, 
            Zero, 
            0xA7
        }, 

        Package (0x04)
        {
            0xFFFF, 
            One, 
            Zero, 
            0xA8
        }, 

        Package (0x04)
        {
            0xFFFF, 
            0x02, 
            Zero, 
            0xAA
        }, 

        Package (0x04)
        {
            0xFFFF, 
            0x03, 
            Zero, 
            0xAB
        }
    })
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        If ((PRP0 == One))
        {
            Return (0x0F)
        }
        Else
        {
            Return (Zero)
        }
    }

    Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
    {
        Return (Zero)
    }

    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x1B200000,         // Address Base
                0x00E00000,         // Address Length
                )
            WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                0x0000,             // Granularity
                0x0000,             // Range Minimum
                0x0001,             // Range Maximum
                0x0000,             // Translation Offset
                0x0002,             // Length
                ,, )
        })
        Return (RBUF) /* \_SB_.PCI0._CRS.RBUF */
    }

    Name (SUPP, Zero)
    Name (CTRL, Zero)
    Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
    {
    }

    Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
    {
        If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
        {
            CreateDWordField (Arg3, Zero, CDW1)
            CreateDWordField (Arg3, 0x04, CDW2)
            CreateDWordField (Arg3, 0x08, CDW3)
            SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
            CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
            If (((SUPP & 0x16) != 0x16))
            {
                CTRL &= 0x1E
            }

            CTRL &= 0x15
            If ((Arg1 != One))
            {
                CDW1 |= 0x08
            }

            If ((CDW3 != CTRL))
            {
                CDW1 |= 0x10
            }

            CDW3 = CTRL /* \_SB_.PCI0.CTRL */
            Return (Arg3)
        }
        Else
        {
            CDW1 |= 0x04
            Return (Arg3)
        }
    }

    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
        {
            While (One)
            {
                Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler
                _T_0 = ToInteger (Arg2)
                If ((_T_0 == Zero))
                {
                    Return (Buffer (0x02)
                    {
                            0xFF, 0x03                                       // ..
                    })
                }
                ElseIf ((_T_0 == One))
                {
                    Return (Package (0x02)
                    {
                        Package (One)
                        {
                            One
                        }, 

                        Package (0x03)
                        {
                            Zero, 
                            One, 
                            One
                        }
                    })
                }
                ElseIf ((_T_0 == 0x02))
                {
                    Return (Package (One)
                    {
                        Package (0x04)
                        {
                            One, 
                            0x03, 
                            Zero, 
                            0x07
                        }
                    })
                }
                ElseIf ((_T_0 == 0x03))
                {
                    Return (Package (One)
                    {
                        Zero
                    })
                }
                ElseIf ((_T_0 == 0x04))
                {
                    Return (Package (0x02)
                    {
                        Package (One)
                        {
                            Zero
                        }, 

                        Package (0x04)
                        {
                            One, 
                            0x03, 
                            Zero, 
                            0x07
                        }
                    })
                }
                ElseIf ((_T_0 == 0x05))
                {
                    Return (Package (One)
                    {
                        One
                    })
                }
                ElseIf ((_T_0 == 0x06))
                {
                    Return (Package (0x04)
                    {
                        Package (One)
                        {
                            Zero
                        }, 

                        Package (One)
                        {
                            Zero
                        }, 

                        Package (One)
                        {
                            Zero
                        }, 

                        Package (One)
                        {
                            Zero
                        }
                    })
                }
                ElseIf ((_T_0 == 0x07))
                {
                    Return (Package (One)
                    {
                        One
                    })
                }
                ElseIf ((_T_0 == 0x08))
                {
                    Return (Package (One)
                    {
                        One
                    })
                }
                ElseIf ((_T_0 == 0x09))
                {
                    Return (Package (0x05)
                    {
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        Zero, 
                        0xFFFFFFFF
                    })
                }
                Else
                {
                }

                Break
            }
        }
    }

    Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
    Name (GWLE, ResourceTemplate ()
    {
        GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionNone,
            "\\_SB.GIO0", 0x00, ResourceConsumer, ,
            )
            {   // Pin list
                0x0050
            }
    })
    Name (GWLP, ResourceTemplate ()
    {
        GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionNone,
            "\\_SB.GIO0", 0x00, ResourceConsumer, ,
            )
            {   // Pin list
                0x0023
            }
    })
    Scope (\_SB.GIO0)
    {
        OperationRegion (WLEN, GeneralPurposeIo, Zero, One)
        OperationRegion (WLPR, GeneralPurposeIo, Zero, One)
    }

    Field (\_SB.GIO0.WLEN, ByteAcc, NoLock, Preserve)
    {
        Connection (\_SB.PCI0.GWLE), 
        MOD1,   1
    }

    Field (\_SB.GIO0.WLPR, ByteAcc, NoLock, Preserve)
    {
        Connection (\_SB.PCI0.GWLP), 
        MOD2,   1
    }

    Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
    {
        \_SB.P0ON
    })
    Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
    {
        \_SB.P0ON
    })
    Device (RP1)
    {
        Name (_ADR, Zero)  // _ADR: Address
        Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
        {
            \_SB.P0OF
        })
        Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
        {
            \_SB.P0OF
        })
        Name (_PRR, Package (0x01)  // _PRR: Power Resource for Reset
        {
            \_SB.P0OF
        })
        Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            Name (RBUF, ResourceTemplate ()
            {
                GpioInt (Edge, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                    "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x0025
                    }
            })
            Return (RBUF) /* \_SB_.PCI0.RP1_._CRS.RBUF */
        }

        Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
        {
            ToUUID ("6211e2c0-58a3-4af3-90e1-927a4e0c55a4"), 
            Package (0x01)
            {
                Package (0x02)
                {
                    "HotPlugSupportInD3", 
                    One
                }
            }
        })
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
            {
                While (One)
                {
                    Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler
                    _T_0 = ToInteger (Arg2)
                    If ((_T_0 == Zero))
                    {
                        Return (Buffer (0x02)
                        {
                                0x01, 0x03                                       // ..
                        })
                    }
                    ElseIf ((_T_0 == 0x08))
                    {
                        Return (Package (One)
                        {
                            One
                        })
                    }
                    ElseIf ((_T_0 == 0x09))
                    {
                        Return (Package (0x05)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            Zero, 
                            0xFFFFFFFF
                        })
                    }
                    Else
                    {
                    }

                    Break
                }
            }
        }
    }
}
