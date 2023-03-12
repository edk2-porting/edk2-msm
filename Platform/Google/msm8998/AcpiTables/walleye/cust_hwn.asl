Name (HWNH, Zero)
Name (HWNL, Zero)

//
// HWN Haptics
//
Device (HWN1)
{
    Name (_HID, "QCOM00A9")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, One)  // _UID: Unique ID
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        If ((\_SB.HWNH == Zero))
        {
            Return (Zero)
        }
        Else
        {
            Return (0x0F)
        }
    }

    Name (_DEP, Package (One)  // _DEP: Dependencies
    {
        \_SB.PMIC
    })
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            GpioInt (Level, ActiveHigh, Exclusive, PullNone, 0x0000,
                "\\_SB.PM02", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0E00
                }
        })
        Return (RBUF) /* \_SB_.HWN1._CRS.RBUF */
    }

    /* ACPI methods for HAPI - Haptics Device info */
    Method (HAPI, 0, NotSerialized)
    {
        Name (CFG0, Package (0x03)
        {
            One, // TotalHwnVib - Total HWN Vibs
            One, // PmicNumber - PMIC Number for HWN Vibs
            One  // HapticsConfigInputSource - Read configuration from  0: Registry, 1: ACPI (HAPC method)
        })
        Return (CFG0) /* \_SB_.HWN1.HAPI.CFG0 */
    }

    /* ACPI methods for HAPC - Haptics configuration method */
    Method (HAPC, 0, NotSerialized)
    {
        Name (CFG0, Package (0x16)
        {
            Zero,       // VibType                  - 0: LRA, 1: ERM
            0x0C80,     // VibVmaxCfg               - 2436 mV
            Zero,       // PeakCurrentLimit         - 0: 400ma, 1: 800ma
            One,        // ShortCircuitDebounce     - 0: No Deb, 1: 8 clk cycles, 2: 16 clk cycles, 3: 32 clk cycles
            One,        // InternalPWMFreq          - 0: 253KHz, 1: 505KHz, 2: 739KHz, 3: 1076KHz
            One,        // PWMCapacitance           - 0: 26PF, 1: 13PF, 2: 8p7PF, 3: 6p5PF
            One,        // SlewRate                 - 0: 6ns, 1: 16ns
            Zero,       // LRASignalType            - 0: Sinusoidal, 1: Square

            0x02,       // LRAAutoResMode           - 0: No auto resonance, 1: ZXD, 2: QWD, 3: MAX QWD, 4: ZXD with EOP
            One,        // LRAAutoResHighZDuration  - 0: No HighZ,
                        //                            1: [2 LRA period (ZXD), 1/8 LRA period (QWD)],
                        //                            2: [3 LRA period (ZXD), 1/4 LRA period (QWD)],
                        //                            3: [4 LRA period (ZXD), 1/2 LRA period (QWD)]                        
            0x03,       // LRAAutoResCalibFreqZXD   - 0: 4 LRA periods,     1: 8 LRA periods,
                        //                            2: 16 LRA periods,    3: 32 LRA periods
            0x14,       // InitialAutoResDelayQWD   - Delay(in ms) used for QWD mode before enabling auto-resonance 
                        //                              Typical value is 5-20ms. This is to ensure there is enough 
                        //                              back emf for Auto Resonance to work fine. 
                        //                              - This is a don't care in ZXD mode             
            One,        // AutoBrakingEnable        - 0: Disable, 1: Enable
            0x1B,       // BrakePattern             - brake pattern of [0,0,0,VMAX] = [ 00 00 00 11] = 0x03
            Zero,       // BrakeWithMaxVoltageEnable -0: Disable, 1: Enable - Brake pattern applied with max voltage
                        //                              that can be supplied by PMIC Haptics module
            One,        // DirectModeAccelerationEnable - 0: Disable, 1: Enable
            0x06,       // DirectModeAccelerationDuration - in milli seconds
            Zero,       // HapticsSource            - 0: VMAX, 1: BUFFER, 2: AUDIO, 3: EXT PWM
            Zero,       // HapticsTrigger           - 0: Play, 1: Line In
            0x0535,     // PlayRateCode             - LRA Freq 150Hz, PlayRateCode = (200 * 1000) / LRA_Freq
            0x03,       // MaxSCIntrRetries         - Max SC Interrupt retries before crashing the device
            One         // HapticsAutoResErrorRecover - Enable Auto Resonance Error recovery support
        })
        Return (CFG0) /* \_SB_.HWN1.HAPC.CFG0 */
    }
}

//
// HWN LED
//
Device (HWN0)
{
    Name (_HID, "QCOM00A8")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, Zero)  // _UID: Unique ID
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        If ((\_SB.HWNL == Zero))
        {
            Return (Zero)
        }
        Else
        {
            Return (0x0F)
        }
    }

    Method (HWNL, 0, NotSerialized)
    {
        Name (CFG0, Package (0x10)
        {
            1,      // PMIC number PMI8998
            3,      // Total HWN LEDs

            // RGB LEDs
            411,    // Fade interval in ms (0-511 ms)
            20,     // Fade Steps i.e 5, 10, 15, 20(max)
            32,     // LED0 Id (BLUE)
            2,      // LED0 bank on PMI8998 (LPG_CHAN3)
            64,     // LED1 Id (GREEN)
            3,      // LED1 bank on PMI8998 (LPG_CHAN4)
            128,    // LED2 Id (RED)
            4,      // LED2 bank on PMI8998 (LPG_CHAN5)
            // RGB PWM Config
            1,      // PWM bit Resoultion
                    // Valid Inputs ( 0 - 6 bit mode, 1 - 9 bit mode)
            1,      // PWM_EN_HI
            1,      // PWM_EN_LO
            3,      // PWM_MASTER_CLK_FREQ
                    // Valid Inputs(0- No Clk, 1 - 1.024 KHz, 2 - 32.764 KHz, 3 - 19.2 MHz)
            1,      // Clock Pre Divide (Values can be 1, 3, 5, 6)
            1       // Exponent (Values range 0 - 7)
        })
        Return (CFG0) /* \_SB_.HWN0.HWNL.CFG0 */
    }
}
