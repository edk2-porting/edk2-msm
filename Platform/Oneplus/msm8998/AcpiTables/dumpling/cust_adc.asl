/*============================================================================
  FILE:         cust_adc.asl

  OVERVIEW:     This file contains the board-specific configuration info for
                ADC1 - qcadc analog-to-digital converter (ADC): channel
                configurations, scaling functions, look-up tables, etc.

  DEPENDENCIES: None

============================================================================*/

/*----------------------------------------------------------------------------
 * QCADC
 * -------------------------------------------------------------------------*/

Scope (\_SB.ADC1)
{
    Method (CHAN, 0, NotSerialized)
    {
        Return (Package (0x0A)
        {
            Package (0x0D)
            {
                "VPH_PWR", 
                0x83, 
                Zero, 
                Zero, 
                0x02, 
                0x02, 
                One, 
                0x03, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero
            }, 

            Package (0x0D)
            {
                "VCOIN", 
                0x85, 
                Zero, 
                Zero, 
                0x02, 
                0x02, 
                One, 
                0x03, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero
            }, 

            Package (0x0D)
            {
                "PMIC_THERM", 
                0x06, 
                Zero, 
                Zero, 
                0x02, 
                0x02, 
                One, 
                One, 
                Zero, 
                Zero, 
                Zero, 
                PTCF,
                0x02
            }, 

            Package (0x0D)
            {
                "XO_THERM", 
                0x4C, 
                0x08, 
                Zero, 
                0x02, 
                One, 
                One, 
                One, 
                0x02, 
                0x000186A0, 
                XTTB, 
                Zero, 
                Zero
            }, 

            Package (0x0D)
            {
                "XO_THERM_GPS", 
                0x4C, 
                0x08, 
                0x02, 
                0x02, 
                One, 
                One, 
                One, 
                0x02, 
                0x000186A0, 
                XTTB, 
                Zero, 
                Zero
            }, 

            Package (0x0D)
            {
                "SYS_THERM1", 
                0x4D, 
                One, 
                Zero, 
                0x02, 
                One, 
                One, 
                One, 
                0x02, 
                0x000186A0, 
                SYTB, 
                Zero, 
                Zero
            }, 

            Package (0x0D)
            {
                "SYS_THERM2", 
                0x4E, 
                One, 
                Zero, 
                0x02, 
                One, 
                One, 
                One, 
                0x02, 
                0x000186A0, 
                SYTB, 
                Zero, 
                Zero
            }, 

            Package (0x0D)
            {
                "PA_THERM", 
                0x4F, 
                One, 
                Zero, 
                0x02, 
                One, 
                One, 
                One, 
                0x02, 
                0x000186A0, 
                SYTB, 
                Zero, 
                Zero
            }, 

            Package (0x0D)
            {
                "PA_THERM1", 
                0x50, 
                One, 
                Zero, 
                0x02, 
                One, 
                One, 
                One, 
                0x02, 
                0x000186A0, 
                SYTB, 
                Zero, 
                Zero
            }, 

            Package (0x0D)
            {
                "SYS_THERM3", 
                0x51, 
                One, 
                Zero, 
                0x02, 
                One, 
                One, 
                One, 
                0x02, 
                0x000186A0, 
                SYTB, 
                Zero, 
                Zero
            }
        })
    }

    Method (SYTB, 0, NotSerialized)
    {
        Return (Package (0x22)
        {
            Package (0x02)
            {
                0x0040DD78, 
                0xFFFFFFD8
            }, 

            Package (0x02)
            {
                0x002DD9E4, 
                0xFFFFFFDD
            }, 

            Package (0x02)
            {
                0x0020CA24, 
                0xFFFFFFE2
            }, 

            Package (0x02)
            {
                0x0017B588, 
                0xFFFFFFE7
            }, 

            Package (0x02)
            {
                0x001152C4, 
                0xFFFFFFEC
            }, 

            Package (0x02)
            {
                0x000CC8A8, 
                0xFFFFFFF1
            }, 

            Package (0x02)
            {
                0x000985E4, 
                0xFFFFFFF6
            }, 

            Package (0x02)
            {
                0x0007286C, 
                0xFFFFFFFB
            }, 

            Package (0x02)
            {
                0x00056D10, 
                Zero
            }, 

            Package (0x02)
            {
                0x000425B8, 
                0x05
            }, 

            Package (0x02)
            {
                0x000331F8, 
                0x0A
            }, 

            Package (0x02)
            {
                0x00027AC4, 
                0x0F
            }, 

            Package (0x02)
            {
                0x0001F018, 
                0x14
            }, 

            Package (0x02)
            {
                0x000186A0, 
                0x19
            }, 

            Package (0x02)
            {
                0x00013560, 
                0x1E
            }, 

            Package (0x02)
            {
                0xF6E0, 
                0x23
            }, 

            Package (0x02)
            {
                0xC60C, 
                0x28
            }, 

            Package (0x02)
            {
                0x9FC4, 
                0x2D
            }, 

            Package (0x02)
            {
                0x81B0, 
                0x32
            }, 

            Package (0x02)
            {
                0x69DC, 
                0x37
            }, 

            Package (0x02)
            {
                0x56B8, 
                0x3C
            }, 

            Package (0x02)
            {
                0x477C, 
                0x41
            }, 

            Package (0x02)
            {
                0x3B60, 
                0x46
            }, 

            Package (0x02)
            {
                0x3138, 
                0x4B
            }, 

            Package (0x02)
            {
                0x2968, 
                0x50
            }, 

            Package (0x02)
            {
                0x22BA, 
                0x55
            }, 

            Package (0x02)
            {
                0x1D4C, 
                0x5A
            }, 

            Package (0x02)
            {
                0x18D8, 
                0x5F
            }, 

            Package (0x02)
            {
                0x1522, 
                0x64
            }, 

            Package (0x02)
            {
                0x120C, 
                0x69
            }, 

            Package (0x02)
            {
                0x0F82, 
                0x6E
            }, 

            Package (0x02)
            {
                0x0D5C, 
                0x73
            }, 

            Package (0x02)
            {
                0x0B86, 
                0x78
            }, 

            Package (0x02)
            {
                0x0A00, 
                0x7D
            }
        })
    }

    Method (XTTB, 0, NotSerialized)
    {
        Return (Package (0xA8)
        {
            Package (0x02)
            {
                0x0040DC21, 
                0xFFFF6000
            }, 

            Package (0x02)
            {
                0x003C74E5, 
                0xFFFF6400
            }, 

            Package (0x02)
            {
                0x0038611B, 
                0xFFFF6800
            }, 

            Package (0x02)
            {
                0x00349A1A, 
                0xFFFF6C00
            }, 

            Package (0x02)
            {
                0x003119CB, 
                0xFFFF7000
            }, 

            Package (0x02)
            {
                0x002DDA9A, 
                0xFFFF7400
            }, 

            Package (0x02)
            {
                0x002AD76C, 
                0xFFFF7800
            }, 

            Package (0x02)
            {
                0x00280B95, 
                0xFFFF7C00
            }, 

            Package (0x02)
            {
                0x002572CA, 
                0xFFFF8000
            }, 

            Package (0x02)
            {
                0x0023091E, 
                0xFFFF8400
            }, 

            Package (0x02)
            {
                0x0020CAF4, 
                0xFFFF8800
            }, 

            Package (0x02)
            {
                0x001EB4FE, 
                0xFFFF8C00
            }, 

            Package (0x02)
            {
                0x001CC430, 
                0xFFFF9000
            }, 

            Package (0x02)
            {
                0x001AF5BE, 
                0xFFFF9400
            }, 

            Package (0x02)
            {
                0x00194716, 
                0xFFFF9800
            }, 

            Package (0x02)
            {
                0x0017B5DC, 
                0xFFFF9C00
            }, 

            Package (0x02)
            {
                0x00163FE3, 
                0xFFFFA000
            }, 

            Package (0x02)
            {
                0x0014E329, 
                0xFFFFA400
            }, 

            Package (0x02)
            {
                0x00139DD6, 
                0xFFFFA800
            }, 

            Package (0x02)
            {
                0x00126E37, 
                0xFFFFAC00
            }, 

            Package (0x02)
            {
                0x001152BA, 
                0xFFFFB000
            }, 

            Package (0x02)
            {
                0x001049ED, 
                0xFFFFB400
            }, 

            Package (0x02)
            {
                0x000F527B, 
                0xFFFFB800
            }, 

            Package (0x02)
            {
                0x000E6B27, 
                0xFFFFBC00
            }, 

            Package (0x02)
            {
                0x000D92CE, 
                0xFFFFC000
            }, 

            Package (0x02)
            {
                0x000CC863, 
                0xFFFFC400
            }, 

            Package (0x02)
            {
                0x000C0AED, 
                0xFFFFC800
            }, 

            Package (0x02)
            {
                0x000B5985, 
                0xFFFFCC00
            }, 

            Package (0x02)
            {
                0x000AB357, 
                0xFFFFD000
            }, 

            Package (0x02)
            {
                0x000A179D, 
                0xFFFFD400
            }, 

            Package (0x02)
            {
                0x000985A0, 
                0xFFFFD800
            }, 

            Package (0x02)
            {
                0x0008FCB6, 
                0xFFFFDC00
            }, 

            Package (0x02)
            {
                0x00087C44, 
                0xFFFFE000
            }, 

            Package (0x02)
            {
                0x000803B7, 
                0xFFFFE400
            }, 

            Package (0x02)
            {
                0x00079288, 
                0xFFFFE800
            }, 

            Package (0x02)
            {
                0x0007283A, 
                0xFFFFEC00
            }, 

            Package (0x02)
            {
                0x0006C458, 
                0xFFFFF000
            }, 

            Package (0x02)
            {
                0x00066678, 
                0xFFFFF400
            }, 

            Package (0x02)
            {
                0x00060E33, 
                0xFFFFF800
            }, 

            Package (0x02)
            {
                0x0005BB2D, 
                0xFFFFFC00
            }, 

            Package (0x02)
            {
                0x00056D0E, 
                Zero
            }, 

            Package (0x02)
            {
                0x00052387, 
                0x0400
            }, 

            Package (0x02)
            {
                0x0004DE4C, 
                0x0800
            }, 

            Package (0x02)
            {
                0x00049D17, 
                0x0C00
            }, 

            Package (0x02)
            {
                0x00045FA6, 
                0x1000
            }, 

            Package (0x02)
            {
                0x000425BE, 
                0x1400
            }, 

            Package (0x02)
            {
                0x0003EF25, 
                0x1800
            }, 

            Package (0x02)
            {
                0x0003BBA6, 
                0x1C00
            }, 

            Package (0x02)
            {
                0x00038B11, 
                0x2000
            }, 

            Package (0x02)
            {
                0x00035D37, 
                0x2400
            }, 

            Package (0x02)
            {
                0x000331EE, 
                0x2800
            }, 

            Package (0x02)
            {
                0x0003090E, 
                0x2C00
            }, 

            Package (0x02)
            {
                0x0002E270, 
                0x3000
            }, 

            Package (0x02)
            {
                0x0002BDF2, 
                0x3400
            }, 

            Package (0x02)
            {
                0x00029B74, 
                0x3800
            }, 

            Package (0x02)
            {
                0x00027AD7, 
                0x3C00
            }, 

            Package (0x02)
            {
                0x00025BFE, 
                0x4000
            }, 

            Package (0x02)
            {
                0x00023ECE, 
                0x4400
            }, 

            Package (0x02)
            {
                0x0002232F, 
                0x4800
            }, 

            Package (0x02)
            {
                0x00020909, 
                0x4C00
            }, 

            Package (0x02)
            {
                0x0001F046, 
                0x5000
            }, 

            Package (0x02)
            {
                0x0001D8D2, 
                0x5400
            }, 

            Package (0x02)
            {
                0x0001C298, 
                0x5800
            }, 

            Package (0x02)
            {
                0x0001AD88, 
                0x5C00
            }, 

            Package (0x02)
            {
                0x00019990, 
                0x6000
            }, 

            Package (0x02)
            {
                0x000186A0, 
                0x6400
            }, 

            Package (0x02)
            {
                0x000174AA, 
                0x6800
            }, 

            Package (0x02)
            {
                0x0001639E, 
                0x6C00
            }, 

            Package (0x02)
            {
                0x00015371, 
                0x7000
            }, 

            Package (0x02)
            {
                0x00014415, 
                0x7400
            }, 

            Package (0x02)
            {
                0x00013580, 
                0x7800
            }, 

            Package (0x02)
            {
                0x000127A6, 
                0x7C00
            }, 

            Package (0x02)
            {
                0x00011A7C, 
                0x8000
            }, 

            Package (0x02)
            {
                0x00010DFA, 
                0x8400
            }, 

            Package (0x02)
            {
                0x00010216, 
                0x8800
            }, 

            Package (0x02)
            {
                0xF6C8, 
                0x8C00
            }, 

            Package (0x02)
            {
                0xEC07, 
                0x9000
            }, 

            Package (0x02)
            {
                0xE1CC, 
                0x9400
            }, 

            Package (0x02)
            {
                0xD810, 
                0x9800
            }, 

            Package (0x02)
            {
                0xCECC, 
                0x9C00
            }, 

            Package (0x02)
            {
                0xC5F9, 
                0xA000
            }, 

            Package (0x02)
            {
                0xBD93, 
                0xA400
            }, 

            Package (0x02)
            {
                0xB592, 
                0xA800
            }, 

            Package (0x02)
            {
                0xADF2, 
                0xAC00
            }, 

            Package (0x02)
            {
                0xA6AE, 
                0xB000
            }, 

            Package (0x02)
            {
                0x9FC1, 
                0xB400
            }, 

            Package (0x02)
            {
                0x9927, 
                0xB800
            }, 

            Package (0x02)
            {
                0x92DB, 
                0xBC00
            }, 

            Package (0x02)
            {
                0x8CD9, 
                0xC000
            }, 

            Package (0x02)
            {
                0x871E, 
                0xC400
            }, 

            Package (0x02)
            {
                0x81A6, 
                0xC800
            }, 

            Package (0x02)
            {
                0x7C6D, 
                0xCC00
            }, 

            Package (0x02)
            {
                0x7771, 
                0xD000
            }, 

            Package (0x02)
            {
                0x72AE, 
                0xD400
            }, 

            Package (0x02)
            {
                0x6E22, 
                0xD800
            }, 

            Package (0x02)
            {
                0x69CA, 
                0xDC00
            }, 

            Package (0x02)
            {
                0x65A4, 
                0xE000
            }, 

            Package (0x02)
            {
                0x61AC, 
                0xE400
            }, 

            Package (0x02)
            {
                0x5DE1, 
                0xE800
            }, 

            Package (0x02)
            {
                0x5A40, 
                0xEC00
            }, 

            Package (0x02)
            {
                0x56C8, 
                0xF000
            }, 

            Package (0x02)
            {
                0x5377, 
                0xF400
            }, 

            Package (0x02)
            {
                0x504A, 
                0xF800
            }, 

            Package (0x02)
            {
                0x4D40, 
                0xFC00
            }, 

            Package (0x02)
            {
                0x4A57, 
                0x00010000
            }, 

            Package (0x02)
            {
                0x478E, 
                0x00010400
            }, 

            Package (0x02)
            {
                0x44E4, 
                0x00010800
            }, 

            Package (0x02)
            {
                0x4256, 
                0x00010C00
            }, 

            Package (0x02)
            {
                0x3FE3, 
                0x00011000
            }, 

            Package (0x02)
            {
                0x3D8B, 
                0x00011400
            }, 

            Package (0x02)
            {
                0x3B4C, 
                0x00011800
            }, 

            Package (0x02)
            {
                0x3924, 
                0x00011C00
            }, 

            Package (0x02)
            {
                0x3713, 
                0x00012000
            }, 

            Package (0x02)
            {
                0x3518, 
                0x00012400
            }, 

            Package (0x02)
            {
                0x3332, 
                0x00012800
            }, 

            Package (0x02)
            {
                0x3160, 
                0x00012C00
            }, 

            Package (0x02)
            {
                0x2FA0, 
                0x00013000
            }, 

            Package (0x02)
            {
                0x2DF2, 
                0x00013400
            }, 

            Package (0x02)
            {
                0x2C56, 
                0x00013800
            }, 

            Package (0x02)
            {
                0x2ACA, 
                0x00013C00
            }, 

            Package (0x02)
            {
                0x294E, 
                0x00014000
            }, 

            Package (0x02)
            {
                0x27E1, 
                0x00014400
            }, 

            Package (0x02)
            {
                0x2682, 
                0x00014800
            }, 

            Package (0x02)
            {
                0x2531, 
                0x00014C00
            }, 

            Package (0x02)
            {
                0x23ED, 
                0x00015000
            }, 

            Package (0x02)
            {
                0x22B6, 
                0x00015400
            }, 

            Package (0x02)
            {
                0x218B, 
                0x00015800
            }, 

            Package (0x02)
            {
                0x206B, 
                0x00015C00
            }, 

            Package (0x02)
            {
                0x1F57, 
                0x00016000
            }, 

            Package (0x02)
            {
                0x1E4D, 
                0x00016400
            }, 

            Package (0x02)
            {
                0x1D4D, 
                0x00016800
            }, 

            Package (0x02)
            {
                0x1C56, 
                0x00016C00
            }, 

            Package (0x02)
            {
                0x1B69, 
                0x00017000
            }, 

            Package (0x02)
            {
                0x1A85, 
                0x00017400
            }, 

            Package (0x02)
            {
                0x19AA, 
                0x00017800
            }, 

            Package (0x02)
            {
                0x18D6, 
                0x00017C00
            }, 

            Package (0x02)
            {
                0x180B, 
                0x00018000
            }, 

            Package (0x02)
            {
                0x1747, 
                0x00018400
            }, 

            Package (0x02)
            {
                0x168A, 
                0x00018800
            }, 

            Package (0x02)
            {
                0x15D4, 
                0x00018C00
            }, 

            Package (0x02)
            {
                0x1524, 
                0x00019000
            }, 

            Package (0x02)
            {
                0x147B, 
                0x00019400
            }, 

            Package (0x02)
            {
                0x13D8, 
                0x00019800
            }, 

            Package (0x02)
            {
                0x133B, 
                0x00019C00
            }, 

            Package (0x02)
            {
                0x12A3, 
                0x0001A000
            }, 

            Package (0x02)
            {
                0x1211, 
                0x0001A400
            }, 

            Package (0x02)
            {
                0x1184, 
                0x0001A800
            }, 

            Package (0x02)
            {
                0x10FC, 
                0x0001AC00
            }, 

            Package (0x02)
            {
                0x1079, 
                0x0001B000
            }, 

            Package (0x02)
            {
                0x0FFA, 
                0x0001B400
            }, 

            Package (0x02)
            {
                0x0F80, 
                0x0001B800
            }, 

            Package (0x02)
            {
                0x0F0A, 
                0x0001BC00
            }, 

            Package (0x02)
            {
                0x0E98, 
                0x0001C000
            }, 

            Package (0x02)
            {
                0x0E2A, 
                0x0001C400
            }, 

            Package (0x02)
            {
                0x0DBF, 
                0x0001C800
            }, 

            Package (0x02)
            {
                0x0D59, 
                0x0001CC00
            }, 

            Package (0x02)
            {
                0x0CF5, 
                0x0001D000
            }, 

            Package (0x02)
            {
                0x0C95, 
                0x0001D400
            }, 

            Package (0x02)
            {
                0x0C39, 
                0x0001D800
            }, 

            Package (0x02)
            {
                0x0BDF, 
                0x0001DC00
            }, 

            Package (0x02)
            {
                0x0B88, 
                0x0001E000
            }, 

            Package (0x02)
            {
                0x0B34, 
                0x0001E400
            }, 

            Package (0x02)
            {
                0x0AE3, 
                0x0001E800
            }, 

            Package (0x02)
            {
                0x0A95, 
                0x0001EC00
            }, 

            Package (0x02)
            {
                0x0A49, 
                0x0001F000
            }, 

            Package (0x02)
            {
                0x0A00, 
                0x0001F400
            }, 

            Package (0x02)
            {
                0x09B9, 
                0x0001F800
            }, 

            Package (0x02)
            {
                0x0974, 
                0x0001FC00
            }
        })
    }

    Method (VTCH, 0, NotSerialized)
    {
        Return (Package (0x07)
        {
            Package (0x10)
            {
                "VPH_PWR", 
                0x83, 
                Zero, 
                One, 
                Zero, 
                0x02, 
                One, 
                0x03, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                0x15F9
            }, 

            Package (0x10)
            {
                "PMIC_THERM", 
                0x06, 
                Zero, 
                Zero, 
                Zero, 
                0x02, 
                One, 
                One, 
                Zero, 
                Zero, 
                Zero, 
                PTCF,
                PTCI,
                0x02, 
                0xFFFF3CB0, 
                0x000249F0
            }, 

            Package (0x10)
            {
                "SYS_THERM1", 
                0x4D, 
                One, 
                Zero, 
                Zero, 
                One, 
                One, 
                One, 
                0x02, 
                0x000186A0, 
                SYTB, 
                Zero, 
                Zero, 
                Zero, 
                0xFFFFFFD8, 
                0x7D
            }, 

            Package (0x10)
            {
                "SYS_THERM2", 
                0x4E, 
                One, 
                Zero, 
                Zero, 
                One, 
                One, 
                One, 
                0x02, 
                0x000186A0, 
                SYTB, 
                Zero, 
                Zero, 
                Zero, 
                0xFFFFFFD8, 
                0x7D
            }, 

            Package (0x10)
            {
                "PA_THERM", 
                0x4F, 
                One, 
                Zero, 
                Zero, 
                One, 
                One, 
                One, 
                0x02, 
                0x000186A0, 
                SYTB, 
                Zero, 
                Zero, 
                Zero, 
                0xFFFFFFD8, 
                0x7D
            }, 

            Package (0x10)
            {
                "PA_THERM1", 
                0x50, 
                One, 
                Zero, 
                Zero, 
                One, 
                One, 
                One, 
                0x02, 
                0x000186A0, 
                SYTB, 
                Zero, 
                Zero, 
                Zero, 
                0xFFFFFFD8, 
                0x7D
            }, 

            Package (0x10)
            {
                "SYS_THERM3", 
                0x51, 
                One, 
                Zero, 
                Zero, 
                One, 
                One, 
                One, 
                0x02, 
                0x000186A0, 
                SYTB, 
                Zero, 
                Zero, 
                Zero, 
                0xFFFFFFD8, 
                0x7D
            }
        })
    }

    Method (VTMT, 0, NotSerialized)
    {
        Return (Package (0x03)
        {
            0x0B, 
            One, 
            0x05
        })
    }
}
