/*============================================================================
  FILE:         adc.asl

  OVERVIEW:     This file contains the board-specific configuration info for
                ADC1 - qcadc analog-to-digital converter (ADC): ACPI device
                definitions, common settings, etc.

  DEPENDENCIES: None

============================================================================*/
/*----------------------------------------------------------------------------
 * QCADC
 * -------------------------------------------------------------------------*/

Device(ADC1)
{
   /*----------------------------------------------------------------------------
    * Dependencies
    * -------------------------------------------------------------------------*/
   Name(_DEP, Package(0x2)
   {
      \_SB_.SPMI,
      \_SB_.PMIC
   })

   /*----------------------------------------------------------------------------
    * HID
    * -------------------------------------------------------------------------*/
   Name(_HID, "QCOM0221")
   Alias(\_SB.PSUB, _SUB)
   Name(_UID, 0)

   /*----------------------------------------------------------------------------
    * ADC Resources
    * -------------------------------------------------------------------------*/
   Method(_CRS)
   {
      /*
       * Interrupts
       */
      Name (INTB, ResourceTemplate()
      {
         // VAdc - EOC
         // ID = {slave id}{perph id}{int} = {0}{0011 0001}{000} = 0x188
         GpioInt(Edge, ActiveHigh, ExclusiveAndWake, PullUp, 0, "\\_SB.PM01", , , , RawDataBuffer(){0x2}) {32} // 0x188 - PM_INT__VADC_HC1_USR__EOC

         // VAdc TM - All interrupts
         // ID = {slave id}{perph id}{int} = {0}{0011 0100}{000} = 0x1A0
         GpioInt(Edge, ActiveHigh, ExclusiveAndWake, PullUp, 0, "\\_SB.PM01", , , , RawDataBuffer(){0x2}) {40} // 0x1A0 - PM_INT__VADC_HC7_BTM__THR

         // FgAdc - All interrupts
         // ID = {slave id}{perph id}{int} = {10}{0100 0101}{000} = 0x1228
         GpioInt(Edge, ActiveHigh, ExclusiveAndWake, PullUp, 0, "\\_SB.PM01", , , , RawDataBuffer(){0x2}) {360} // 0x1228 - PM_INT__FG_ADC__BT_ID
      })

      /*
       * SPMI peripherals
       */
      Name(NAM, Buffer() {"\\_SB.SPMI"})

      // VAdc
      Name(VUSR, Buffer()
      {
            0x8E,       // SPB Descriptor
            0x13, 0x00, // Length including NAM above
            0x01,       // +0x00 SPB Descriptor Revision
            0x00,       // +0x01 Resource Source Index
            0xC1,       // +0x02 Bus type - vendor defined values are in the range 0xc0-0xff
            0x02,       // +0x03 Consumer + controller initiated
            0x00, 0x31, // +0x04 Type specific flags . Slave id, Upper8 bit address
            0x01,       // +0x06 Type specific revision
            0x00, 0x00  // +0x07 type specific data length
                        // +0x09 - 0xd bytes for NULL-terminated NAM
                        // Length = 0x13
      })

      // VAdc TM
      Name(VBTM, Buffer()
      {
            0x8E,       // SPB Descriptor
            0x13, 0x00, // Length including NAM above
            0x01,       // +0x00 SPB Descriptor Revision
            0x00,       // +0x01 Resource Source Index
            0xC1,       // +0x02 Bus type - vendor defined values are in the range 0xc0-0xff
            0x02,       // +0x03 Consumer + controller initiated
            0x00, 0x34, // +0x04 Type specific flags . Slave id, Upper8 bit address
            0x01,       // +0x06 Type specific revision
            0x00, 0x00  // +0x07 type specific data length
                        // +0x09 - 0xd bytes for NULL-terminated NAM
                        // Length = 0x13
      })

      // FgAdc
      Name(FGRR, Buffer()
      {
            0x8E,       // SPB Descriptor
            0x13, 0x00, // Length including NAM above
            0x01,       // +0x00 SPB Descriptor Revision
            0x00,       // +0x01 Resource Source Index
            0xC1,       // +0x02 Bus type - vendor defined values are in the range 0xc0-0xff
            0x02,       // +0x03 Consumer + controller initiated
            0x02, 0x45, // +0x04 Type specific flags . Slave id, Upper8 bit address
            0x01,       // +0x06 Type specific revision
            0x00, 0x00  // +0x07 type specific data length
                        // +0x09 - 0xd bytes for NULL-terminated NAM
                        // Length = 0x13
      })

      // Name(END, Buffer() {0x79, 0x00})

      // {VUSR, NAM, VBTM, NAM, FGRR, NAM, INTB}
      // {Local1, Local2, Local3, INTB}
      // {Local4, Local5}
      // {Local0}
      Concatenate(VUSR, NAM, Local1)
      Concatenate(VBTM, NAM, Local2)
      Concatenate(FGRR, NAM, Local3)
      Concatenate(Local1, Local2, Local4)
      Concatenate(Local3, INTB, Local5)
      Concatenate(Local4, Local5, Local0)

      Return(Local0)
   }

   /*----------------------------------------------------------------------------
    * Device configuration
    * -------------------------------------------------------------------------*/
   /*
    * General ADC properties
    *
    * bHasVAdc:
    *    Whether or not TM is supported.
    *    0 - Not supported
    *    1 - Supported
    *
    * bHasTM:
    *    Whether or not TM is supported.
    *    0 - Not supported
    *    1 - Supported
    *
    * bHasFgAdc:
    *    Whether or not FGADC is supported.
    *    0 - Not supported
    *    1 - Supported
    *
    */
   Method (ADDV)
   {
      Return (Package()
      {
         /* .bHasVAdc  = */ 1,
         /* .bHasTM    = */ 1,
         /* .bHasFgAdc = */ 1,
      })
   }

   /*----------------------------------------------------------------------------
    * Voltage ADC (VADC) Configuration
    * -------------------------------------------------------------------------*/
   /*
    * General VADC properties
    *
    * bUsesInterrupts:
    *    End-of-conversion interrupt mode.
    *    0 - Polling mode
    *    1 - Interrupt mode
    *
    * uFullScale_code:
    *    Full-scale ADC code.
    *
    * uFullScale_uV:
    *    Full-scale ADC voltage in uV.
    *
    * uReadTimeout_us:
    *    Timeout for reading ADC channels in us.
    *
    * uLDOSettlingTime_us:
    *    LDO settling time in us.
    *
    * ucMasterID:
    *    Master ID to send the interrupt to.
    *
    * ucPmicDevice:
    *    PMIC which has the VAdc.
    *
    * usMinDigRev:
    *    Minimum digital version <major> <minor>
    *
    * usMinAnaRev:
    *    Minimum analog version <major> <minor>
    *
    * ucPerphType:
    *    ADC peripheral type.
    *
    */
   Method (GENP)
   {
      Return (Package()
      {
         /* .bUsesInterrupts     = */ 0,
         /* .uFullScale_code     = */ 0x4000,
         /* .uFullScale_uV       = */ 1875000,
         /* .uReadTimeout_us     = */ 500000,
         /* .uLDOSettlingTime_us = */ 17,
         /* .ucMasterID          = */ 0,
         /* .ucPmicDevice        = */ 0,
         /* .usMinDigRev         = */ 0x300,
         /* .usMinAnaRev         = */ 0x100,
         /* .ucPerphType         = */ 0x8,
      })
   }

   /*===========================================================================

     FUNCTION        PTCF

     DESCRIPTION     Scales the ADC result from millivolts to 0.001 degrees
                     Celsius using the PMIC thermistor conversion equation.

     DEPENDENCIES    None

     PARAMETERS      Arg0 [in]  ADC result data (uMicroVolts)

     RETURN VALUE    Scaled result in mDegC

     SIDE EFFECTS    None

   ===========================================================================*/
   Method (PTCF, 1)
   {
      /*
       * Divide by two to convert from microvolt reading to micro-Kelvin.
       *
       * Subtract 273160 to convert the temperature from Kelvin to
       * 0.001 degrees Celsius.
       */
      ShiftRight (Arg0, 1, Local0)
      Subtract (Local0, 273160, Local0)
      Return (Local0)
   }

   /*===========================================================================

     FUNCTION        PTCI

     DESCRIPTION     Inverse of PTCF - scaled PMIC temperature to microvolts.

     DEPENDENCIES    None

     PARAMETERS      Arg0 [in]  temperature in mDegC

     RETURN VALUE    ADC result data (uMicroVolts)

     SIDE EFFECTS    None

   ===========================================================================*/
   Method (PTCI, 1)
   {
      Add (Arg0, 273160, Local0)
      ShiftLeft (Local0, 1, Local0)
      Return (Local0)
   }

   /*
    * VADC channel to GPIO mapping
    *
    */
   Method (VGIO)
   {
      Return (Package()
      {
         Package()
         {
            /* .GPIO        = */ 8,
            /* .aucChannels = */ Buffer(){0x12, 0x32, 0x52, 0x72},
         },

         Package()
         {
            /* .GPIO        = */ 9,
            /* .aucChannels = */ Buffer(){0x13, 0x33, 0x53, 0x73},
         },

         Package()
         {
            /* .GPIO        = */ 10,
            /* .aucChannels = */ Buffer(){0x14, 0x34, 0x54, 0x74},
         },

         Package()
         {
            /* .GPIO        = */ 11,
            /* .aucChannels = */ Buffer(){0x15, 0x35, 0x55, 0x75},
         },

         Package()
         {
            /* .GPIO        = */ 12,
            /* .aucChannels = */ Buffer(){0x16, 0x36, 0x56, 0x76},
         },

         Package()
         {
            /* .GPIO        = */ 21,
            /* .aucChannels = */ Buffer(){0x17, 0x37, 0x57, 0x77, 0x97},
         },

         Package()
         {
            /* .GPIO        = */ 22,
            /* .aucChannels = */ Buffer(){0x18, 0x38, 0x58, 0x78, 0x98},
         },

         Package()
         {
            /* .GPIO        = */ 23,
            /* .aucChannels = */ Buffer(){0x19, 0x39, 0x59, 0x79, 0x99},
         },
      })
   }

   /*----------------------------------------------------------------------------
    * Voltage ADC Threshold Monitor (VADCTM) Configuration
    * -------------------------------------------------------------------------*/
   /*
    * General VADCTM properties
    *
    * eAverageMode:
    *   Obtains N ADC readings and averages them together.
    *   0 - VADCTM_AVERAGE_1_SAMPLE
    *   1 - VADCTM_AVERAGE_2_SAMPLES
    *   2 - VADCTM_AVERAGE_4_SAMPLES
    *   3 - VADCTM_AVERAGE_8_SAMPLES
    *   4 - VADCTM_AVERAGE_16_SAMPLES
    *
    * eDecimationRatio:
    *    The decimation ratio.
    *    0 - VADCTM_DECIMATION_RATIO_256
    *    1 - VADCTM_DECIMATION_RATIO_512
    *    2 - VADCTM_DECIMATION_RATIO_1024
    *
    * uFullScale_code:
    *    Full-scale ADC code.
    *
    * uFullScale_uV:
    *    Full-scale ADC voltage in uV.
    *
    * ucMasterID:
    *    Master ID to send the interrupt to.
    *
    * ucPmicDevice:
    *    PMIC which has the VAdc.
    *
    * usMinDigRev:
    *    Minimum digital version <major> <minor>
    *
    * usMinAnaRev:
    *    Minimum analog version <major> <minor>
    *
    * ucPerphType:
    *    ADC peripheral type.
    *
    */
   Method (VTGN)
   {
      Return (Package()
      {
         /* .eAverageMode        = */ 2,
         /* .eDecimationRatio    = */ 2,
         /* .uFullScale_code     = */ 0x4000,
         /* .uFullScale_uV       = */ 1875000,
         /* .ucMasterID          = */ 0,
         /* .ucPmicDevice        = */ 0,
         /* .usMinDigRev         = */ 0x300,
         /* .usMinAnaRev         = */ 0x100,
         /* .ucPerphType         = */ 0x8,
      })
   }

   /*----------------------------------------------------------------------------
    * Fuel Gauge ADC (FGADC) Configuration
    * -------------------------------------------------------------------------*/
   /*
    * General FGADC properties
    *
    * skinTempThreshRange:
    *    Range for skin temperature thresholds
    *
    * chgTempThreshRange:
    *    Range for charger temperature thresholds
    *
    * uFullScale_code:
    *    Full scale ADC value in code.
    *
    * uFullScale_uV:
    *    Full scale ADC value in microvolts.
    *
    * uMicroVoltsPerMilliAmps:
    *    Microvolts per milliamp scaling factor.
    *
    * uCodePerKelvin:
    *    Code per Kelvin scaling factor.
    *
    * uBattIdClipThresh:
    *    Max code for a BATT ID channel.
    *
    * uMaxWaitTimeus:
    *    Maximum time to wait for a reading to complete in microseconds.
    *
    * uSlaveId:
    *    PMIC slave ID.
    *
    * ucPmicDevice:
    *    PMIC which has the VAdc.
    *
    * ucPerphType:
    *    ADC peripheral type.
    *
    */
   Method (GENF)
   {
      Return (Package()
      {
         /* .skinTempThreshRange.nMin = */ 0xFFFFFFE2,  // -30
         /* .skinTempThreshRange.nMax = */ 97,
         /* .chgTempThreshRange.nMin  = */ 0xFFFFFFCE,  // -50
         /* .chgTempThreshRange.nMax  = */ 160,
         /* .uFullScale_code          = */ 0x3ff,
         /* .uFullScale_uV            = */ 2500000,
         /* .uMicroVoltsPerMilliAmps  = */ 500,
         /* .uCodePerKelvin           = */ 4,
         /* .uBattIdClipThresh        = */ 820,
         /* .uMaxWaitTimeUs           = */ 5000000,
         /* .uSlaveId                 = */ 2,
         /* .ucPmicDevice             = */ 1,
         /* .ucPerphType              = */ 0xD,
      })
   }

   /*
    * FGADC Channel Configuration Table
    *
    * The following table is the list of channels the FGADC can read. Below is
    * a description of each field:
    *
    * sName:
    *    Appropriate string name for the channel from AdcInputs.h.
    *
    * eChannel:
    *    Which channel.
    *    0 - FGADC_CHAN_SKIN_TEMP
    *    1 - FGADC_CHAN_BATT_ID
    *    2 - FGADC_CHAN_BATT_ID_FRESH
    *    3 - FGADC_CHAN_BATT_ID_5
    *    4 - FGADC_CHAN_BATT_ID_15
    *    5 - FGADC_CHAN_BATT_ID_150
    *    6 - FGADC_CHAN_BATT_THERM
    *    7 - FGADC_CHAN_AUX_THERM
    *    8 - FGADC_CHAN_USB_IN_V
    *    9 - FGADC_CHAN_USB_IN_I
    *    10 - FGADC_CHAN_DC_IN_V
    *    11 - FGADC_CHAN_DC_IN_I
    *    12 - FGADC_CHAN_DIE_TEMP
    *    13 - FGADC_CHAN_CHARGER_TEMP
    *    14 - FGADC_CHAN_GPIO
    *
    * eEnable:
    *    Whether or not to enable the channel.
    *    0 - FGADC_DISABLE
    *    1 - FGADC_ENABLE
    *
    * ucTriggers:
    *    Mask of triggers. Use 0x0 for default trigger configuration.
    *
    * scalingFactor.num:
    *    Numerator of the channel scaling
    *
    * scalingFactor.den:
    *    Denominator of the channel scaling
    *
    * eScaling:
    *    The scaling method to use.
    *    0 - FGADC_SCALE_TO_MILLIVOLTS
    *    1 - FGADC_SCALE_BATT_ID_TO_OHMS
    *    2 - FGADC_SCALE_INTERPOLATE_FROM_MILLIVOLTS (requires uInterpolationTableName)
    *    3 - FGADC_SCALE_THERMISTOR
    *    4 - FGADC_SCALE_CURRENT_TO_MILLIAMPS
    *
    * uInterpolationTableName:
    *    The name of the lookup table in ACPI that will be interpolated to obtain
    *    a physical value. Note that the physical value (which has default units
    *    of millivolts unless custom scaling function is used) is passed as the
    *    input. This value corresponds to the first column of the table. The
    *    scaled output appears in the physical adc result.
    *    0 - No interpolation table
    *    WXYZ - Where 'WXYZ' is the interpolation table name
    *
    */
   Method (FCHN)
   {
      Return (Package()
      {
         /* BATT_ID_OHMS (BATT_ID pin) */
         Package()
         {
            /* .sName                   = */ "BATT_ID_OHMS",
            /* .eChannel                = */ 1,
            /* .eEnable                 = */ 1,
            /* .ucTriggers              = */ 0x0,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 1,
            /* .eScaling                = */ 1,
            /* .uInterpolationTableName = */ 0,
         },

         /* BATT_ID_OHMS_FRESH (BATT_ID pin) */
         Package()
         {
            /* .sName                   = */ "BATT_ID_OHMS_FRESH",
            /* .eChannel                = */ 2,
            /* .eEnable                 = */ 1,
            /* .ucTriggers              = */ 0x0,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 1,
            /* .eScaling                = */ 1,
            /* .uInterpolationTableName = */ 0,
         },

         /* BATT_THERM (BATT_THERM pin) */
         Package()
         {
            /* .sName                   = */ "BATT_THERM",
            /* .eChannel                = */ 6,
            /* .eEnable                 = */ 1,
            /* .ucTriggers              = */ 0x0,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 1,
            /* .eScaling                = */ 3,
            /* .uInterpolationTableName = */ 0,
         },

         /* AUX_THERM (AUX_THERM pin) */
         Package()
         {
            /* .sName                   = */ "AUX_THERM",
            /* .eChannel                = */ 7,
            /* .eEnable                 = */ 1,
            /* .ucTriggers              = */ 0x0,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 1,
            /* .eScaling                = */ 3,
            /* .uInterpolationTableName = */ 0,
         },

         /* SKIN_THERM (AUX_THERM pin) */
         Package()
         {
            /* .sName                   = */ "SKIN_THERM",
            /* .eChannel                = */ 0,
            /* .eEnable                 = */ 1,
            /* .ucTriggers              = */ 0x0,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 1,
            /* .eScaling                = */ 3,
            /* .uInterpolationTableName = */ 0,
         },

         /* PMIC_TEMP2 (internal sensor) */
         Package()
         {
            /* .sName                   = */ "PMIC_TEMP2",
            /* .eChannel                = */ 12,
            /* .eEnable                 = */ 1,
            /* .ucTriggers              = */ 0x0,
            /* .scalingFactor.num       = */ 3,
            /* .scalingFactor.den       = */ 2,
            /* .eScaling                = */ 2,
            /* .uInterpolationTableName = */ FGDT,
         },

         /* CHG_TEMP (internal sensor) */
         Package()
         {
            /* .sName                   = */ "CHG_TEMP",
            /* .eChannel                = */ 13,
            /* .eEnable                 = */ 1,
            /* .ucTriggers              = */ 0x0,
            /* .scalingFactor.num       = */ 3,
            /* .scalingFactor.den       = */ 2,
            /* .eScaling                = */ 2,
            /* .uInterpolationTableName = */ FGCT,
         },

         /* USB_IN (USB_IN pin) */
         Package()
         {
            /* .sName                   = */ "USB_IN",
            /* .eChannel                = */ 8,
            /* .eEnable                 = */ 1,
            /* .ucTriggers              = */ 0x0,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 8,
            /* .eScaling                = */ 0,
            /* .uInterpolationTableName = */ 0,
         },

         /* USB_IN_I (USB_IN pin) */
         Package()
         {
            /* .sName                   = */ "USB_IN_I",
            /* .eChannel                = */ 9,
            /* .eEnable                 = */ 1,
            /* .ucTriggers              = */ 0x0,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 1,
            /* .eScaling                = */ 4,
            /* .uInterpolationTableName = */ 0,
         },

         /* DC_IN (DC_IN pin) */
         Package()
         {
            /* .sName                   = */ "DC_IN",
            /* .eChannel                = */ 10,
            /* .eEnable                 = */ 1,
            /* .ucTriggers              = */ 0x0,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 8,
            /* .eScaling                = */ 0,
            /* .uInterpolationTableName = */ 0,
         },

         /* DC_IN_I (DC_IN pin) */
         Package()
         {
            /* .sName                   = */ "DC_IN_I",
            /* .eChannel                = */ 11,
            /* .eEnable                 = */ 1,
            /* .ucTriggers              = */ 0x0,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 1,
            /* .eScaling                = */ 4,
            /* .uInterpolationTableName = */ 0,
         },

         /* FG_GPIO */
         Package()
         {
            /* .sName                   = */ "FG_GPIO",
            /* .eChannel                = */ 14,
            /* .eEnable                 = */ 0,
            /* .ucTriggers              = */ 0x0,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 2,
            /* .eScaling                = */ 0,
            /* .uInterpolationTableName = */ 0,
         },
      })
   }

   /*
    * Die temperature sensor scaling table
    *
    * The first column in the table is sensor voltage in millivolts and the
    * second column is the temperature in milli degrees C.
    *
    * Scaling equation:
    *
    *    milliDegC = (uV - 600000) / 2 + 25000
    *
    */
   Method (FGDT)
   {
      Return (Package()
      {
         Package(){ 450, 0xFFFF3CB0}, // -50000
         Package(){ 870, 160000}
      })
   }

   /*
    * NOTE: CHG_TEMP on PMI8998 uses fab-dependent scaling in the driver.
    * This is the default scaling if no fab-dependent scaling is found.
    * It corresponds to GF.
    */
   /*
    * Charger temperature sensor scaling table
    *
    * The first column in the table is sensor voltage in millivolts and the
    * second column is the temperature in milli degrees C.
    *
    * Scaling equation:
    *
    *    milliDegC = (1303168 - uV) / 3.784 + 25000
    *
    */
   Method (FGCT)
   {
      Return (Package()
      {
         Package(){ 1587, 0xFFFF3CB0}, // -50000
         Package(){  792, 160000}
      })
   }
}

Include("cust_adc.asl")
