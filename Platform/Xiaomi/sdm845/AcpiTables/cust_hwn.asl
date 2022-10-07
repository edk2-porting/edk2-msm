Name(HWNH, 0)
Name(HWNL, 0)

//
// HWN Haptics
//
Device (HWN1)
{
   Name (_HID, "QCOM02A9")
   Alias(\_SB.PSUB, _SUB)

    Method (_STA)
    {
        if(LEqual(\_SB_.HWNH, 0)) {
            Return (0)
        }
        else {
            Return (0x0F)
        }
    }

    Name (_DEP,
        Package(0x1)
        {
           \_SB_.PMIC
        }
    )

    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF,
            ResourceTemplate ()
            {
                // Short Circuit IRQ
                GpioInt(Level, ActiveHigh, Exclusive, PullNone, 0, "\\_SB.PM01", , , , ) {400} // 0xE00 - PM_INT__HAPTICS__SC_INT

                // Play IRQ
                // GpioInt(Level, ActiveHigh, Exclusive, PullNone, 0, "\\_SB.PM01", , , ,  ) {401} // 0xE01 - PM_INT__HAPTICS__PLAY_INT
            }
        )
        Return(RBUF)
    }

    /* ACPI methods for HAPI - Haptics Device info */
    Method(HAPI, 0x0, NotSerialized)
    {
        Name (CFG0,
            Package()
            {
                1,  // TotalHwnVib - Total HWN Vibs
                1,  // PmicNumber - PMIC Number for HWN Vibs
                1,  // HapticsConfigInputSource - Read configuration from  0: Registry, 1: ACPI (HAPC method)
            }
        )
        Return (CFG0)
    }

    /* ACPI methods for HAPC - Haptics configuration method */
    Method(HAPC, 0x0, NotSerialized)
    {
        Name (CFG0,
            Package()
            {
                //------------------------ Actuator Config -----------------------------------------------------
                0,      // VibType                  - 0: LRA, 1: ERM
                2436,   // VibVmaxCfg               - 2436 mV
                0,      // PeakCurrentLimit         - 0: 400ma, 1: 800ma
                1,      // ShortCircuitDebounce     - 0: No Deb, 1: 8 clk cycles, 2: 16 clk cycles, 3: 32 clk cycles
                1,      // InternalPWMFreq          - 0: 253KHz, 1: 505KHz, 2: 739KHz, 3: 1076KHz
                1,      // PWMCapacitance           - 0: 26PF, 1: 13PF, 2: 8p7PF, 3: 6p5PF
                1,      // SlewRate                 - 0: 6ns, 1: 16ns
                0,      // LRASignalType            - 0: Sinusoidal, 1: Square
                //----------------------------------------------------------------------------------------------

                //------------------------ LRA Auto Resonance Config -------------------------------------------
                4,      // LRAAutoResMode           - 0: No auto resonance, 1: ZXD, 2: QWD, 3: MAX QWD, 4: ZXD with EOP

                1,      // LRAAutoResHighZDuration  - 0: No HighZ,
                        //                              1: [2 LRA period (ZXD), 1/8 LRA period (QWD)],
                        //                              2: [3 LRA period (ZXD), 1/4 LRA period (QWD)],
                        //                              3: [4 LRA period (ZXD), 1/2 LRA period (QWD)]

                3,      // LRAAutoResCalibFreqZXD   - 0: 4 LRA periods, 1: 8 LRA periods,
                        //                              2: 16 LRA periods, 3: 32 LRA periods

                20,     // InitialAutoResDelayQWD   - Delay(in ms) used for QWD mode before enabling auto-resonance
                        //                              Typical value is 5-20ms. This is to ensure there is enough
                        //                              back emf for Auto Resonance to work fine.
                        //                              - This is a don't care in ZXD mode
                //----------------------------------------------------------------------------------------------

                //------------------------ Braking Config ------------------------------------------------------
                1,      // AutoBrakingEnable        - 0: Disable, 1: Enable
                0x03,   // BrakePattern             - brake pattern of [0,0,0,VMAX] = [ 00 00 00 11] = 0x03
                0,      // BrakeWithMaxVoltageEnable - 0: Disable, 1: Enable - Brake pattern applied with max voltage
                        //                              that can be supplied by PMIC Haptics module
                //----------------------------------------------------------------------------------------------

                //------------------------ Acceleration Config -------------------------------------------------
                0,      // DirectModeAccelerationEnable - 0: Disable, 1: Enable
                6,      // DirectModeAccelerationDuration - in milli seconds
                //----------------------------------------------------------------------------------------------

                0,      // HapticsSource            - 0: VMAX, 1: BUFFER, 2: AUDIO, 3: EXT PWM
                0,      // HapticsTrigger           - 0: Play, 1: Line In
                1333,   // PlayRateCode             - LRA Freq 150Hz, PlayRateCode = (200 * 1000) / LRA_Freq

                3,      // MaxSCIntrRetries         - Max SC Interrupt retries before crashing the device

                1,      // HapticsAutoResErrorRecover - Enable Auto Resonance Error recovery support
            }
        )
        Return (CFG0)
    }
}


//
// HWN LED
//
Device (HWN0)
{
   Name (_HID, "QCOM02A8")
   Alias(\_SB.PSUB, _SUB)
   Name (_UID, 0)

   Method (_STA)
   {
       if(LEqual(\_SB_.HWNL, 0)) {
           Return (0)
       }
       else {
           Return (0x0F)
       }
   }

   // ACPI method for LED Configs
   Method(HWNL, 0x0, NotSerialized)
   {
      Name (CFG0,
      Package()
      {
         1,  // PMIC number PMI8994
         3,  // Total HWN LEDs

         //RGB LEDs
         411, // Fade interval in ms (0-511 ms)
         20, // Fade Steps i.e 5, 10, 15, 20(max)

         0x20,  // LED0 Id (BLUE)
         0x02,  // LED0 bank on PMI8998 (LPG_CHAN3)

         0x40,  // LED1 Id (GREEN)
         0x03,  // LED1 bank on PMI8998 (LPG_CHAN4)

         0x80,  // LED2 Id (RED)
         0x04,  // LED2 bank on PMI8998 (LPG_CHAN5)

         //RGB PWM Config
         1,     //PWM bit Resoultion
                //Valid Inputs ( 0 - 6 bit mode, 1 - 9 bit mode)
         1,     //PWM_EN_HI
         1,     //PWM_EN_LO
         3,     //PWM_MASTER_CLK_FREQ
                //Valid Inputs(0- No Clk, 1 - 1.024 KHz, 2 - 32.764 KHz, 3 - 19.2 MHz)
         1,     //Clock Pre Divide (Values can be 1, 3, 5, 6)
         1,     //Exponent (Values range 0 - 7)
       })
       Return (CFG0)
   }
}
