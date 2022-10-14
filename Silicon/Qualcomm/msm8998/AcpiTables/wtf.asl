Scope (\_SB.PEP0)
{
    Method (TPMX, 0, NotSerialized)
    {
        Debug = "[TP] Power Control"
        Return (TPXC) /* \_SB_.PEP0.TPXC */
    }

    Name (TPXC, Package (0x01)
    {
        Package (0x04)
        {
            "DEVICE", 
            "\\_SB.I2C6.TCPD", 
            Package (0x02)
            {
                "DSTATE", 
                Zero
            }, 

            Package (0x02)
            {
                "DSTATE", 
                0x03
            }
        }
    })
}

Scope (\_SB)
{
    Name (ECOK, Zero)
    Name (AOSN, Zero)
    Mutex (MUT0, 0x00)
    Device (LID0)
    {
        Name (_HID, EisaId ("PNP0C0D") /* Lid Device */)  // _HID: Hardware ID
        Alias (\_SB.PSUB, _SUB)
        Name (_DEP, Package (One)  // _DEP: Dependencies
        {
            \_SB.I2C7
        })
        Method (_LID, 0, NotSerialized)  // _LID: Lid Status
        {
            Local1 = Zero
            Local0 = \_SB.I2C7.LIDS ()
            While ((Local1 < 0x04))
            {
                If ((Local0 == One))
                {
                    Local1 = 0x04
                }
                Else
                {
                    Sleep (0x32)
                    Local0 = \_SB.I2C7.LIDS ()
                    Local1++
                }
            }

            Return (Local0)
        }
    }
}

Scope (\_SB.I2C7)
{
    Name (ECI2, ResourceTemplate ()
    {
        I2cSerialBusV2 (0x0076, ControllerInitiated, 0x00061A80,
            AddressingMode7Bit, "\\_SB_.I2C7",
            0x00, ResourceConsumer, , Exclusive,
            )
    })
    OperationRegion (ECFD, GenericSerialBus, Zero, 0x0100)
    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x03), 
        AccessAs (BufferAcc, AttribBytes (0x01)), 
        CM03,   8, 
        Offset (0x05), 
        AccessAs (BufferAcc, AttribBytes (0x01)), 
        CM05,   8, 
        AccessAs (BufferAcc, AttribBytes (0x05)), 
        CM06,   8, 
        AccessAs (BufferAcc, AttribBytes (0x0D)), 
        CM07,   8, 
        AccessAs (BufferAcc, AttribBytes (0x0C)), 
        CM08,   8, 
        AccessAs (BufferAcc, AttribBytes (0x0B)), 
        CM09,   8, 
        Offset (0x0E), 
        AccessAs (BufferAcc, AttribBytes (0x01)), 
        CM0E,   8, 
        AccessAs (BufferAcc, AttribBytes (0x01)), 
        CMSM,   8, 
        Offset (0x15), 
        AccessAs (BufferAcc, AttribBytes (0x02)), 
        CM15,   8, 
        AccessAs (BufferAcc, AttribBytes (0x02)), 
        CM16,   8, 
        AccessAs (BufferAcc, AttribBytes (0x01)), 
        CM17,   8, 
        AccessAs (BufferAcc, AttribBytes (0x01)), 
        CM18,   8, 
        AccessAs (BufferAcc, AttribBytes (0x01)), 
        CM19,   8, 
        AccessAs (BufferAcc, AttribBytes (0x01)), 
        CM1A,   8, 
        AccessAs (BufferAcc, AttribBytes (0x01)), 
        CM1B,   8, 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x01)), 
        APIR,   8, 
        AccessAs (BufferAcc, AttribBytes (0x02)), 
        APIW,   8, 
        AccessAs (BufferAcc, AttribBytes (0x01)), 
        CAPR,   8, 
        AccessAs (BufferAcc, AttribBytes (0x03)), 
        CAPW,   8, 
        AccessAs (BufferAcc, AttribBytes (0x01)), 
        AIRM,   8, 
        Offset (0x40), 
        AccessAs (BufferAcc, AttribBytes (0x02)), 
        APIB,   8, 
        Offset (0xC0), 
        AccessAs (BufferAcc, AttribBytes (0x02)), 
        RBYT,   8, 
        AccessAs (BufferAcc, AttribBytes (0x03)), 
        WBYT,   8, 
        AccessAs (BufferAcc, AttribBytes (0x02)), 
        RWOD,   8, 
        AccessAs (BufferAcc, AttribBytes (0x02)), 
        RBLK,   8, 
        Offset (0xCF), 
        AccessAs (BufferAcc, AttribBytes (0x20)), 
        BBLK,   8, 
        AccessAs (BufferAcc, AttribBytes (0x10)), 
        RL16,   8, 
        AccessAs (BufferAcc, AttribBytes (0x20)), 
        RL32,   8, 
        AccessAs (BufferAcc, AttribBytes (0x40)), 
        RL64,   8, 
        AccessAs (BufferAcc, AttribBytes (0x60)), 
        RL96,   8, 
        AccessAs (BufferAcc, AttribBytes (0x80)), 
        R128,   8, 
        AccessAs (BufferAcc, AttribBytes (0xFF)), 
        R255,   8, 
        AccessAs (BufferAcc, AttribBytes (0x10)), 
        BL16,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x01)), 
        RB01,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x02)), 
        RB02,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x03)), 
        RB03,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x04)), 
        RB04,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x05)), 
        RB05,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x06)), 
        RB06,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x07)), 
        RB07,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x08)), 
        RB08,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x09)), 
        RB09,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x0A)), 
        RB10,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x0B)), 
        RB11,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x0C)), 
        RB12,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x0D)), 
        RB13,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x0E)), 
        RB14,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x0F)), 
        RB15,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x10)), 
        RB16,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x11)), 
        RB17,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x12)), 
        RB18,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x13)), 
        RB19,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x14)), 
        RB20,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x15)), 
        RB21,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x16)), 
        RB22,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x17)), 
        RB23,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x18)), 
        RB24,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x19)), 
        RB25,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x1A)), 
        RB26,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x1B)), 
        RB27,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x1C)), 
        RB28,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x1D)), 
        RB29,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x1E)), 
        RB30,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x1F)), 
        RB31,   8
    }

    Field (ECFD, BufferAcc, NoLock, Preserve)
    {
        Connection (ECI2), 
        Offset (0x20), 
        AccessAs (BufferAcc, AttribBytes (0x20)), 
        RB32,   8
    }

    Name (BUFF, Buffer (0x03)
    {
            0x00, 0x01, 0x00                                 // ...
    })
    CreateByteField (BUFF, Zero, BYAT)
    CreateByteField (BUFF, 0x02, DATA)
    Name (BUF1, Buffer (0x06)
    {
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00               // ......
    })
    CreateByteField (BUF1, Zero, BSTA)
    CreateByteField (BUF1, One, BLEN)
    CreateByteField (BUF1, 0x02, DAT1)
    CreateByteField (BUF1, 0x03, DAT2)
    CreateByteField (BUF1, 0x04, DAT3)
    CreateByteField (BUF1, 0x05, DAT4)
    Name (BUF2, Buffer (0x04)
    {
            0x00, 0x00, 0x00, 0x00                           // ....
    })
    CreateByteField (BUF2, Zero, BSTS)
    CreateByteField (BUF2, One, SLEN)
    CreateWordField (BUF2, 0x02, WRD1)
    Name (BUF3, Buffer (0x22){})
    CreateByteField (BUF3, Zero, STAT)
    CreateByteField (BUF3, One, SIZE)
    CreateByteField (BUF1, 0x02, BDAT)
    CreateField (BUF3, 0x10, 0x0100, BLCK)
    Name (BUF4, Buffer (0x10)
    {
        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
    })
    Name (INBU, Buffer (0x08)
    {
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
    })
    CreateByteField (INBU, Zero, INST)
    CreateByteField (INBU, One, INLN)
    CreateByteField (INBU, 0x02, INT0)
    CreateByteField (INBU, 0x03, INT1)
    CreateByteField (INBU, 0x04, INT2)
    CreateByteField (INBU, 0x05, INT3)
    CreateByteField (INBU, 0x06, INT4)
    CreateByteField (INBU, 0x07, INT5)
    Name (STBF, Buffer (0x0102){})
    CreateByteField (STBF, Zero, SSTS)
    CreateByteField (STBF, One, STZE)
    CreateField (STBF, 0x10, 0x0800, TXT0)
    Name (BLBF, Buffer (0x12){})
    CreateByteField (BLBF, Zero, BLTS)
    CreateByteField (BLBF, One, BLZE)
    CreateField (BLBF, 0x10, 0x80, BLPT)
    Method (_REG, 2, NotSerialized)  // _REG: Region Availability
    {
        Acquire (\_SB.MUT0, 0xFFFF)
        If ((Arg1 == One))
        {
            \_SB.ECOK = One
        }
        Else
        {
            \_SB.ECOK = Zero
        }

        Release (\_SB.MUT0)
    }

    OperationRegion (CP21, SystemMemory, 0x03D7C004, One)
    Field (CP21, DWordAcc, NoLock, Preserve)
    {
        PIH1,   1
    }

    Method (LIDS, 0, NotSerialized)
    {
        If ((\_SB.AOSN == Zero))
        {
            Acquire (\_SB.MUT0, 0xFFFF)
            If ((\_SB.ECOK == One))
            {
                BYAT = Zero
                DATA = 0x11
                \_SB.I2C7.CM03 = BUFF /* \_SB_.I2C7.BUFF */
                \_SB.AOSN = One
            }

            Release (\_SB.MUT0)
        }

        Local0 = PIH1 /* \_SB_.I2C7.PIH1 */
        Return (Local0)
    }

    Method (GSAC, 1, NotSerialized)
    {
        Acquire (\_SB.MUT0, 0xFFFF)
        Local0 = Arg0
        BSTA = Zero
        BLEN = One
        If ((Local0 == 0x03))
        {
            DAT1 = Zero
        }
        ElseIf ((Local0 == Zero))
        {
            DAT1 = One
        }
        ElseIf ((Local0 == One))
        {
            DAT1 = 0x02
        }
        ElseIf ((Local0 == 0x02))
        {
            DAT1 = 0x03
        }

        \_SB.I2C7.CM0E = BUF1 /* \_SB_.I2C7.BUF1 */
        Release (\_SB.MUT0)
    }

    Method (DCKS, 0, NotSerialized)
    {
        Acquire (\_SB.MUT0, 0xFFFF)
        Local0 = Zero
        If ((\_SB.ECOK == One))
        {
            Sleep (0x0D)
            BSTA = Zero
            BLEN = One
            DAT1 = 0xAE
            \_SB.I2C7.APIR = BUF1 /* \_SB_.I2C7.BUF1 */
            BUFF = \_SB.I2C7.RB01
            If ((BYAT == Zero))
            {
                Local0 = (DATA & One)
            }
        }

        Release (\_SB.MUT0)
        Return (Local0)
    }

    Method (SWDT, 0, NotSerialized)
    {
        Acquire (\_SB.MUT0, 0xFFFF)
        Local0 = Zero
        If ((\_SB.ECOK == One))
        {
            Sleep (0x0D)
            BSTA = Zero
            BLEN = One
            DAT1 = 0xA8
            \_SB.I2C7.APIR = BUF1 /* \_SB_.I2C7.BUF1 */
            BUFF = \_SB.I2C7.RB01
            If ((BYAT == Zero))
            {
                Local0 = (DATA | 0x02)
            }

            Sleep (0x0D)
            BSTA = Zero
            BLEN = One
            DAT1 = 0xA8
            DAT2 = Local0
            \_SB.I2C7.APIW = BUF1 /* \_SB_.I2C7.BUF1 */
        }

        Release (\_SB.MUT0)
    }

    Method (TERR, 1, Serialized)
    {
        Acquire (\_SB.MUT0, 0xFFFF)
        If ((\_SB.ECOK == One))
        {
            \_SB.I2C7.BSTA = Zero
            \_SB.I2C7.BLEN = 0x02
            \_SB.I2C7.DAT1 = 0xCA
            \_SB.I2C7.DAT2 = Arg0
            \_SB.I2C7.APIW = \_SB.I2C7.BUF1
        }

        Release (\_SB.MUT0)
        Return (Zero)
    }

    Method (GEVT, 0, NotSerialized)
    {
        Acquire (\_SB.MUT0, 0xFFFF)
        Local0 = 0xFF
        If ((\_SB.ECOK == One))
        {
            Sleep (0x0D)
            BUFF = \_SB.I2C7.CM05
            If ((BYAT != One))
            {
                Local0 = DATA /* \_SB_.I2C7.DATA */
            }
        }

        Release (\_SB.MUT0)
        Return (Local0)
    }

    Method (VBPT, 0, NotSerialized)
    {
        Local0 = DerefOf (BLBF [0x02])
        Local1 = 0x03
        While ((Local1 < 0x12))
        {
            Local0 = ~Local0
            Local0 &= 0xFF
            If ((Local0 != DerefOf (BLBF [Local1])))
            {
                Return (One)
            }

            Local1++
        }

        Return (Zero)
    }

    Name (LOG0, Buffer (0x0102){})
    Name (LOG1, Buffer (0x0102){})
    Name (LOG2, Buffer (0x0102){})
    Name (LOG3, Buffer (0x0102){})
    Name (BFRD, Zero)
    Name (BFWR, Zero)
    Name (BFFG, Zero)
    Mutex (MUT2, 0x00)
    Method (WLOG, 2, Serialized)
    {
        If ((Arg1 == 0x0102))
        {
            Local0 = 0x0101
        }
        Else
        {
            Local0 = Arg1
        }

        Name (MASK, One)
        MASK <<= BFWR /* \_SB_.I2C7.BFWR */
        Acquire (MUT2, 0xFFFF)
        Local1 = (MASK & BFFG) /* \_SB_.I2C7.BFFG */
        If ((Local1 != Zero))
        {
            Release (MUT2)
            Return (Zero)
        }

        While (One)
        {
            Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler
            _T_0 = BFWR /* \_SB_.I2C7.BFWR */
            If ((_T_0 == Zero))
            {
                LOG0 = Arg0
                LOG0 [Local0] = Zero
            }
            ElseIf ((_T_0 == One))
            {
                LOG1 = Arg0
                LOG1 [Local0] = Zero
            }
            ElseIf ((_T_0 == 0x02))
            {
                LOG2 = Arg0
                LOG2 [Local0] = Zero
            }
            ElseIf ((_T_0 == 0x03))
            {
                LOG3 = Arg0
                LOG3 [Local0] = Zero
            }
            Else
            {
                Release (MUT2)
                BFWR = Zero
                Return (Zero)
            }

            Break
        }

        BFFG |= MASK /* \_SB_.I2C7.WLOG.MASK */
        Release (MUT2)
        BFWR++
        BFWR &= 0x03
        Return (Zero)
    }

    Method (RLOG, 0, Serialized)
    {
        Name (MASK, One)
        MASK <<= BFRD /* \_SB_.I2C7.BFRD */
        Acquire (MUT2, 0xFFFF)
        MASK &= BFFG /* \_SB_.I2C7.BFFG */
        If ((MASK == Zero))
        {
            Release (MUT2)
            Return (Zero)
        }

        Name (TEMP, Buffer (0x0102){})
        While (One)
        {
            Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler
            _T_0 = BFRD /* \_SB_.I2C7.BFRD */
            If ((_T_0 == Zero))
            {
                TEMP = LOG0 /* \_SB_.I2C7.LOG0 */
            }
            ElseIf ((_T_0 == One))
            {
                TEMP = LOG1 /* \_SB_.I2C7.LOG1 */
            }
            ElseIf ((_T_0 == 0x02))
            {
                TEMP = LOG2 /* \_SB_.I2C7.LOG2 */
            }
            ElseIf ((_T_0 == 0x03))
            {
                TEMP = LOG3 /* \_SB_.I2C7.LOG3 */
            }
            Else
            {
                Release (MUT2)
                BFRD = Zero
                Return (Zero)
            }

            Break
        }

        BFFG &= MASK = ~MASK /* \_SB_.I2C7.RLOG.MASK */
        Release (MUT2)
        BFRD++
        BFRD &= 0x03
        Return (TEMP) /* \_SB_.I2C7.RLOG.TEMP */
    }

    Method (LRST, 1, Serialized)
    {
        Acquire (\_SB.MUT0, 0xFFFF)
        If ((\_SB.ECOK == One))
        {
            \_SB.I2C7.BSTA = Zero
            \_SB.I2C7.BLEN = 0x02
            \_SB.I2C7.DAT1 = 0xC9
            \_SB.I2C7.DAT2 = Arg0
            \_SB.I2C7.APIW = \_SB.I2C7.BUF1
        }

        Release (\_SB.MUT0)
        If (((Local0 = (Arg0 & 0x02)) == 0x02))
        {
            Acquire (MUT2, 0xFFFF)
            BFRD = Zero
            BFWR = Zero
            BFFG = Zero
            Release (MUT2)
        }

        Return (Zero)
    }

    Method (HHPD, 1, Serialized)
    {
        Acquire (\_SB.MUT0, 0xFFFF)
        If ((\_SB.ECOK == One))
        {
            \_SB.I2C7.BSTA = Zero
            \_SB.I2C7.BLEN = 0x02
            \_SB.I2C7.DAT1 = 0xCC
            \_SB.I2C7.DAT2 = Arg0
            \_SB.I2C7.APIW = \_SB.I2C7.BUF1
        }

        Release (\_SB.MUT0)
        Return (Zero)
    }
}

Scope (\_SB)
{
    Name (CEXI, Zero)
    Method (MEGD, 2, Serialized)
    {
        Local1 = Zero
        Local1 = Arg0
        Local1 <<= 0x08
        Local1 |= Arg1
        Return (Local1)
    }

    Method (RBIX, 0, Serialized)
    {
        Sleep (0x03E8)
        Acquire (\_SB.MUT0, 0xFFFF)
        \_SB.I2C7.BUF4 = \_SB.I2C7.CM08
        Local0 = Zero
        Local1 = Zero
        While ((Local0 < 0x0E))
        {
            \_SB.I2C7.BUF4 [Local1] = DerefOf (\_SB.I2C7.BUF4 [Local0])
            Local0++
            Local1++
        }

        Local0 = Zero
        Local1 = Zero
        If ((DerefOf (\_SB.I2C7.BUF4 [0x02]) != 0x0C))
        {
            SLOG ("[QtBattery] RBIX Buffer still err", DerefOf (\_SB.I2C7.BUF4 [0x02]))
            Release (\_SB.MUT0)
            Return (One)
        }
        Else
        {
            Local1 = CSIX ()
            If ((Local1 != One))
            {
                Debug = "[QtBattery] RBIX CheckSum still err"
                Release (\_SB.MUT0)
                Return (One)
            }
            Else
            {
                Release (\_SB.MUT0)
                Return (Zero)
            }
        }
    }

    Method (CSIX, 0, Serialized)
    {
        Local0 = 0x02
        Local1 = Zero
        Local2 = Zero
        Local3 = Zero
        While ((Local0 < 0x0D))
        {
            Local1 += DerefOf (\_SB.I2C7.BUF4 [Local0])
            Local0++
        }

        Local2 = ~Local1
        Local2++
        Local3 = (Local2 & 0xFF)
        If ((Local3 == DerefOf (\_SB.I2C7.BUF4 [0x0D])))
        {
            Return (One)
        }
        Else
        {
            SLOG ("[QtBattery] BIX CHKSum=", Local3)
            SLOG ("[QtBattery] EC CHKSum=", DerefOf (\_SB.I2C7.BUF4 [0x0D]))
            Return (Zero)
        }
    }

    Method (RBST, 0, Serialized)
    {
        Sleep (0x03E8)
        Acquire (\_SB.MUT0, 0xFFFF)
        \_SB.I2C7.BUF4 = \_SB.I2C7.CM07
        Local0 = Zero
        Local1 = Zero
        While ((Local0 < 0x0F))
        {
            \_SB.I2C7.BUF4 [Local1] = DerefOf (\_SB.I2C7.BUF4 [Local0])
            Local0++
            Local1++
        }

        Local0 = Zero
        Local1 = Zero
        If ((DerefOf (\_SB.I2C7.BUF4 [0x02]) != 0x0D))
        {
            Debug = "[QtBattery] RBST Buffer still err"
            Release (\_SB.MUT0)
            Return (One)
        }
        Else
        {
            Local1 = CSST ()
            If ((Local1 != One))
            {
                Debug = "[QtBattery] RBST CheckSum still err"
                Release (\_SB.MUT0)
                Return (One)
            }
            Else
            {
                Release (\_SB.MUT0)
                Return (Zero)
            }
        }
    }

    Method (CSST, 0, Serialized)
    {
        Local0 = 0x02
        Local1 = Zero
        Local2 = Zero
        Local3 = Zero
        While ((Local0 < 0x0E))
        {
            Local1 += DerefOf (\_SB.I2C7.BUF4 [Local0])
            Local0++
        }

        Local2 = ~Local1
        Local2++
        Local3 = (Local2 & 0xFF)
        If ((Local3 == DerefOf (\_SB.I2C7.BUF4 [0x0E])))
        {
            Return (One)
        }
        Else
        {
            SLOG ("[QtBattery] BST CHKSum=", Local3)
            SLOG ("[QtBattery] EC CHKSum=", DerefOf (\_SB.I2C7.BUF4 [0x0E]))
            Return (Zero)
        }
    }

    Method (SLOG, 2, Serialized)
    {
        Local0 = Zero
        ToDecimalString (Arg1, Local0)
        Concatenate ("[", Local0, Local0)
        Concatenate (Local0, "]", Local0)
        Concatenate (ToHexString (Arg1), Local0, Local0)
        Concatenate (Arg0, Local0, Local0)
        Debug = Local0
    }
}
