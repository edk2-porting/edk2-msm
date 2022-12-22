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

Scope(\_SB.ADC1)
{
   /*----------------------------------------------------------------------------
    * Voltage ADC (VADC) Configuration
    * -------------------------------------------------------------------------*/
   /*
    * VADC Channel Configuration Table
    *
    * The following table is the list of channels the ADC can read. Channels may
    * be added or removed. Below is a description of each field:
    *
    * sName:
    *    Appropriate string name for the channel from AdcInputs.h.
    *
    * uAdcHardwareChannel:
    *    AMUX channel.
    *
    * eSettlingDelay:
    *    Holdoff time to allow the voltage to settle before reading the channel.
    *    0 - VADC_SETTLING_DELAY_0_US
    *    1 - VADC_SETTLING_DELAY_100_US
    *    2 - VADC_SETTLING_DELAY_200_US
    *    3 - VADC_SETTLING_DELAY_300_US
    *    4 - VADC_SETTLING_DELAY_400_US
    *    5 - VADC_SETTLING_DELAY_500_US
    *    6 - VADC_SETTLING_DELAY_600_US
    *    7 - VADC_SETTLING_DELAY_700_US
    *    8 - VADC_SETTLING_DELAY_800_US
    *    9 - VADC_SETTLING_DELAY_900_US
    *    10 - VADC_SETTLING_DELAY_1_MS
    *    11 - VADC_SETTLING_DELAY_2_MS
    *    12 - VADC_SETTLING_DELAY_4_MS
    *    13 - VADC_SETTLING_DELAY_6_MS
    *    14 - VADC_SETTLING_DELAY_8_MS
    *    15 - VADC_SETTLING_DELAY_10_MS
    *
    * eAverageMode:
    *   Obtains N ADC readings and averages them together.
    *   0 - VADC_AVERAGE_1_SAMPLE
    *   1 - VADC_AVERAGE_2_SAMPLES
    *   2 - VADC_AVERAGE_4_SAMPLES
    *   3 - VADC_AVERAGE_8_SAMPLES
    *   4 - VADC_AVERAGE_16_SAMPLES
    *
    * eDecimationRatio:
    *    The decimation ratio.
    *    0 - VADC_DECIMATION_RATIO_256
    *    1 - VADC_DECIMATION_RATIO_512
    *    2 - VADC_DECIMATION_RATIO_1024
    *
    * eCalMethod:
    *    Calibration method.
    *    0 - VADC_CAL_METHOD_NO_CAL
    *    1 - VADC_CAL_METHOD_RATIOMETRIC
    *    2 - VADC_CAL_METHOD_ABSOLUTE
    *
    * scalingFactor.num:
    *    Numerator of the channel scaling
    *
    * scalingFactor.den:
    *    Denominator of the channel scaling
    *
    * eScalingMethod:
    *    The scaling method to use.
    *    0 - VADC_SCALE_TO_MILLIVOLTS
    *    1 - VADC_SCALE_INTERPOLATE_FROM_MILLIVOLTS (requires uInterpolationTableName)
    *    2 - VADC_SCALE_THERMISTOR (requires uPullUp and uInterpolationTableName)
    *
    * uPullUp:
    *    The pull up resistor value. Use with eScalingMethod == VADC_SCALE_THERMISTOR,
    *    otherwise, 0.
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
    * uScalingFunctionName:
    *    The name of the function to call in the ACPI table to perform custom
    *    scaling. The input to the custom scaling function is defined by
    *    eScalingFunctionInput. The output of the custom scaling function is
    *    the physical value.
    *    0 - No scaling function
    *    WXYZ - Where 'WXYZ' is the scaling function name
    *
    *    Note: if both a custon scaling function & interpolation table are used
    *    the custom scaling function is called first.
    *
    * eScalingFunctionInput:
    *    Defines which ADC result is passed to the custom scaling function.
    *    0 - VADC_SCALING_FUNCTION_INPUT_PHYSICAL
    *    1 - VADC_SCALING_FUNCTION_INPUT_PERCENT
    *    2 - VADC_SCALING_FUNCTION_INPUT_MICROVOLTS
    *    3 - VADC_SCALING_FUNCTION_INPUT_CODE
    *
    */
   Method (CHAN)
   {
      Return (Package()
      {
         /* VPH_PWR (VPH_PWR_SNS pin) */
         Package()
         {
            /* .sName                   = */ "VPH_PWR",
            /* .uAdcHardwareChannel     = */ 0x83,
            /* .eSettlingDelay          = */ 0,
            /* .eAverageMode            = */ 0,
            /* .eDecimationRatio        = */ 2,
            /* .eCalMethod              = */ 2,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 3,
            /* .eScalingMethod          = */ 0,
            /* .uPullUp                 = */ 0,
            /* .uInterpolationTableName = */ 0,
            /* .uScalingFunctionName    = */ 0,
            /* .eScalingFunctionInput   = */ 0,
         },

         /* VCOIN (VCOIN pin) */
         Package()
         {
            /* .sName                   = */ "VCOIN",
            /* .uAdcHardwareChannel     = */ 0x85,
            /* .eSettlingDelay          = */ 0,
            /* .eAverageMode            = */ 0,
            /* .eDecimationRatio        = */ 2,
            /* .eCalMethod              = */ 2,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 3,
            /* .eScalingMethod          = */ 0,
            /* .uPullUp                 = */ 0,
            /* .uInterpolationTableName = */ 0,
            /* .uScalingFunctionName    = */ 0,
            /* .eScalingFunctionInput   = */ 0,
         },

         /* PMIC_TEMP1 (internal sensor) */
         Package()
         {
            /* .sName                   = */ "PMIC_THERM",
            /* .uAdcHardwareChannel     = */ 0x6,
            /* .eSettlingDelay          = */ 0,
            /* .eAverageMode            = */ 0,
            /* .eDecimationRatio        = */ 2,
            /* .eCalMethod              = */ 2,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 1,
            /* .eScalingMethod          = */ 0,
            /* .uPullUp                 = */ 0,
            /* .uInterpolationTableName = */ 0,
            /* .uScalingFunctionName    = */ PTCF,
            /* .eScalingFunctionInput   = */ 2,
         },

         /* XO_THERM (XO_THERM pin) */
         Package()
         {
            /* .sName                   = */ "XO_THERM",
            /* .uAdcHardwareChannel     = */ 0x4c,
            /* .eSettlingDelay          = */ 8,
            /* .eAverageMode            = */ 0,
            /* .eDecimationRatio        = */ 2,
            /* .eCalMethod              = */ 1,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 1,
            /* .eScalingMethod          = */ 2,
            /* .uPullUp                 = */ 100000,
            /* .uInterpolationTableName = */ XTTB,
            /* .uScalingFunctionName    = */ 0,
            /* .eScalingFunctionInput   = */ 0,
         },

         /* XO_THERM_GPS (XO_THERM pin) */
         Package()
         {
            /* .sName                   = */ "XO_THERM_GPS",
            /* .uAdcHardwareChannel     = */ 0x4c,
            /* .eSettlingDelay          = */ 8,
            /* .eAverageMode            = */ 2,
            /* .eDecimationRatio        = */ 2,
            /* .eCalMethod              = */ 1,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 1,
            /* .eScalingMethod          = */ 2,
            /* .uPullUp                 = */ 100000,
            /* .uInterpolationTableName = */ XTTB,
            /* .uScalingFunctionName    = */ 0,
            /* .eScalingFunctionInput   = */ 0,
         },

         /* SYS_THERM1 (AMUX_1 pin) */
         Package()
         {
            /* .sName                   = */ "SYS_THERM1",
            /* .uAdcHardwareChannel     = */ 0x4d,
            /* .eSettlingDelay          = */ 1,
            /* .eAverageMode            = */ 0,
            /* .eDecimationRatio        = */ 2,
            /* .eCalMethod              = */ 1,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 1,
            /* .eScalingMethod          = */ 2,
            /* .uPullUp                 = */ 100000,
            /* .uInterpolationTableName = */ SYTB,
            /* .uScalingFunctionName    = */ 0,
            /* .eScalingFunctionInput   = */ 0,
         },

         /* SYS_THERM2 (AMUX_2 pin) */
         Package()
         {
            /* .sName                   = */ "SYS_THERM2",
            /* .uAdcHardwareChannel     = */ 0x4e,
            /* .eSettlingDelay          = */ 1,
            /* .eAverageMode            = */ 0,
            /* .eDecimationRatio        = */ 2,
            /* .eCalMethod              = */ 1,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 1,
            /* .eScalingMethod          = */ 2,
            /* .uPullUp                 = */ 100000,
            /* .uInterpolationTableName = */ SYTB,
            /* .uScalingFunctionName    = */ 0,
            /* .eScalingFunctionInput   = */ 0,
         },

         /* PA_THERM (AMUX_3 pin) */
         Package()
         {
            /* .sName                   = */ "PA_THERM",
            /* .uAdcHardwareChannel     = */ 0x4f,
            /* .eSettlingDelay          = */ 1,
            /* .eAverageMode            = */ 0,
            /* .eDecimationRatio        = */ 2,
            /* .eCalMethod              = */ 1,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 1,
            /* .eScalingMethod          = */ 2,
            /* .uPullUp                 = */ 100000,
            /* .uInterpolationTableName = */ SYTB,
            /* .uScalingFunctionName    = */ 0,
            /* .eScalingFunctionInput   = */ 0,
         },

         /* PA_THERM1 (AMUX_4 pin) */
         Package()
         {
            /* .sName                   = */ "PA_THERM1",
            /* .uAdcHardwareChannel     = */ 0x50,
            /* .eSettlingDelay          = */ 1,
            /* .eAverageMode            = */ 0,
            /* .eDecimationRatio        = */ 2,
            /* .eCalMethod              = */ 1,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 1,
            /* .eScalingMethod          = */ 2,
            /* .uPullUp                 = */ 100000,
            /* .uInterpolationTableName = */ SYTB,
            /* .uScalingFunctionName    = */ 0,
            /* .eScalingFunctionInput   = */ 0,
         },

         /* SYS_THERM3 (AMUX_5 pin) */
         Package()
         {
            /* .sName                   = */ "SYS_THERM3",
            /* .uAdcHardwareChannel     = */ 0x51,
            /* .eSettlingDelay          = */ 1,
            /* .eAverageMode            = */ 0,
            /* .eDecimationRatio        = */ 2,
            /* .eCalMethod              = */ 1,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 1,
            /* .eScalingMethod          = */ 2,
            /* .uPullUp                 = */ 100000,
            /* .uInterpolationTableName = */ SYTB,
            /* .uScalingFunctionName    = */ 0,
            /* .eScalingFunctionInput   = */ 0,
         },
      })
   }

   /*
    * System Thermistor Table
    *
    * The first column in the table is thermistor resistance R_T in ohms
    * and the second column is the temperature in degrees C.
    *
    *               VDD ___
    *                      |
    *                      >
    *                P_PU  <
    *                      >
    *                      |
    *                      |
    *                      |- - - V_T
    *                      |
    *                      >
    *                R_T   <   100 kOhms (NTCG104EF104FB)
    *                      >
    *                      |
    *                      |
    *                     Gnd
    *
    */
   Method (SYTB)
   {
      Return (Package()
      {
         Package(){4251000, 0xFFFFFFD8}, // -40
         Package(){3004900, 0xFFFFFFDD}, // -35
         Package(){2148900, 0xFFFFFFE2}, // -30
         Package(){1553800, 0xFFFFFFE7}, // -25
         Package(){1135300, 0xFFFFFFEC}, // -20
         Package(){ 837800, 0xFFFFFFF1}, // -15
         Package(){ 624100, 0xFFFFFFF6}, // -10
         Package(){ 469100, 0xFFFFFFFB}, // -5
         Package(){ 355600,   0},
         Package(){ 271800,   5},
         Package(){ 209400,  10},
         Package(){ 162500,  15},
         Package(){ 127000,  20},
         Package(){ 100000,  25},
         Package(){  79200,  30},
         Package(){  63200,  35},
         Package(){  50700,  40},
         Package(){  40900,  45},
         Package(){  33200,  50},
         Package(){  27100,  55},
         Package(){  22200,  60},
         Package(){  18300,  65},
         Package(){  15200,  70},
         Package(){  12600,  75},
         Package(){  10600,  80},
         Package(){   8890,  85},
         Package(){   7500,  90},
         Package(){   6360,  95},
         Package(){   5410, 100},
         Package(){   4620, 105},
         Package(){   3970, 110},
         Package(){   3420, 115},
         Package(){   2950, 120},
         Package(){   2560, 125}
      })
   }

   /*
    * XO Thermistor Table
    *
    * This lookup table is used to convert the XO thermistor reading to temperature
    * in degrees C multiplied by a factor of 1024.
    *
    * The first column in the table is thermistor resistance R_T in ohms
    *
    * The second column is the temperature in degrees Celsius multiplied by a factor
    * of 1024.
    *
    *               VDD ___
    *                      |
    *                      >
    *                P_PU  <   100 kOhms
    *                      >
    *                      |
    *                      |
    *                      |- - - V_T
    *                      |
    *                      >
    *                R_T   <   100 kOhms (NTCG104EF104FB)
    *                      >
    *                      |
    *                      |
    *                     Gnd
    *
    */
   Method (XTTB)
   {
      Return (Package()
      {
         Package(){4250657, 0xFFFF6000}, // -40960
         Package(){3962085, 0xFFFF6400}, // -39936
         Package(){3694875, 0xFFFF6800}, // -38912
         Package(){3447322, 0xFFFF6C00}, // -37888
         Package(){3217867, 0xFFFF7000}, // -36864
         Package(){3005082, 0xFFFF7400}, // -35840
         Package(){2807660, 0xFFFF7800}, // -34816
         Package(){2624405, 0xFFFF7C00}, // -33792
         Package(){2454218, 0xFFFF8000}, // -32768
         Package(){2296094, 0xFFFF8400}, // -31744
         Package(){2149108, 0xFFFF8800}, // -30720
         Package(){2012414, 0xFFFF8C00}, // -29696
         Package(){1885232, 0xFFFF9000}, // -28672
         Package(){1766846, 0xFFFF9400}, // -27648
         Package(){1656598, 0xFFFF9800}, // -26624
         Package(){1553884, 0xFFFF9C00}, // -25600
         Package(){1458147, 0xFFFFA000}, // -24576
         Package(){1368873, 0xFFFFA400}, // -23552
         Package(){1285590, 0xFFFFA800}, // -22528
         Package(){1207863, 0xFFFFAC00}, // -21504
         Package(){1135290, 0xFFFFB000}, // -20480
         Package(){1067501, 0xFFFFB400}, // -19456
         Package(){1004155, 0xFFFFB800}, // -18432
         Package(){ 944935, 0xFFFFBC00}, // -17408
         Package(){ 889550, 0xFFFFC000}, // -16384
         Package(){ 837731, 0xFFFFC400}, // -15360
         Package(){ 789229, 0xFFFFC800}, // -14336
         Package(){ 743813, 0xFFFFCC00}, // -13312
         Package(){ 701271, 0xFFFFD000}, // -12288
         Package(){ 661405, 0xFFFFD400}, // -11264
         Package(){ 624032, 0xFFFFD800}, // -10240
         Package(){ 588982, 0xFFFFDC00}, //  -9216
         Package(){ 556100, 0xFFFFE000}, //  -8192
         Package(){ 525239, 0xFFFFE400}, //  -7168
         Package(){ 496264, 0xFFFFE800}, //  -6144
         Package(){ 469050, 0xFFFFEC00}, //  -5120
         Package(){ 443480, 0xFFFFF000}, //  -4096
         Package(){ 419448, 0xFFFFF400}, //  -3072
         Package(){ 396851, 0xFFFFF800}, //  -2048
         Package(){ 375597, 0xFFFFFC00}, //  -1024
         Package(){ 355598,      0},
         Package(){ 336775,   1024},
         Package(){ 319052,   2048},
         Package(){ 302359,   3072},
         Package(){ 286630,   4096},
         Package(){ 271806,   5120},
         Package(){ 257829,   6144},
         Package(){ 244646,   7168},
         Package(){ 232209,   8192},
         Package(){ 220471,   9216},
         Package(){ 209390,  10240},
         Package(){ 198926,  11264},
         Package(){ 189040,  12288},
         Package(){ 179698,  13312},
         Package(){ 170868,  14336},
         Package(){ 162519,  15360},
         Package(){ 154622,  16384},
         Package(){ 147150,  17408},
         Package(){ 140079,  18432},
         Package(){ 133385,  19456},
         Package(){ 127046,  20480},
         Package(){ 121042,  21504},
         Package(){ 115352,  22528},
         Package(){ 109960,  23552},
         Package(){ 104848,  24576},
         Package(){ 100000,  25600},
         Package(){  95402,  26624},
         Package(){  91038,  27648},
         Package(){  86897,  28672},
         Package(){  82965,  29696},
         Package(){  79232,  30720},
         Package(){  75686,  31744},
         Package(){  72316,  32768},
         Package(){  69114,  33792},
         Package(){  66070,  34816},
         Package(){  63176,  35840},
         Package(){  60423,  36864},
         Package(){  57804,  37888},
         Package(){  55312,  38912},
         Package(){  52940,  39936},
         Package(){  50681,  40960},
         Package(){  48531,  41984},
         Package(){  46482,  43008},
         Package(){  44530,  44032},
         Package(){  42670,  45056},
         Package(){  40897,  46080},
         Package(){  39207,  47104},
         Package(){  37595,  48128},
         Package(){  36057,  49152},
         Package(){  34590,  50176},
         Package(){  33190,  51200},
         Package(){  31853,  52224},
         Package(){  30577,  53248},
         Package(){  29358,  54272},
         Package(){  28194,  55296},
         Package(){  27082,  56320},
         Package(){  26020,  57344},
         Package(){  25004,  58368},
         Package(){  24033,  59392},
         Package(){  23104,  60416},
         Package(){  22216,  61440},
         Package(){  21367,  62464},
         Package(){  20554,  63488},
         Package(){  19776,  64512},
         Package(){  19031,  65536},
         Package(){  18318,  66560},
         Package(){  17636,  67584},
         Package(){  16982,  68608},
         Package(){  16355,  69632},
         Package(){  15755,  70656},
         Package(){  15180,  71680},
         Package(){  14628,  72704},
         Package(){  14099,  73728},
         Package(){  13592,  74752},
         Package(){  13106,  75776},
         Package(){  12640,  76800},
         Package(){  12192,  77824},
         Package(){  11762,  78848},
         Package(){  11350,  79872},
         Package(){  10954,  80896},
         Package(){  10574,  81920},
         Package(){  10209,  82944},
         Package(){   9858,  83968},
         Package(){   9521,  84992},
         Package(){   9197,  86016},
         Package(){   8886,  87040},
         Package(){   8587,  88064},
         Package(){   8299,  89088},
         Package(){   8023,  90112},
         Package(){   7757,  91136},
         Package(){   7501,  92160},
         Package(){   7254,  93184},
         Package(){   7017,  94208},
         Package(){   6789,  95232},
         Package(){   6570,  96256},
         Package(){   6358,  97280},
         Package(){   6155,  98304},
         Package(){   5959,  99328},
         Package(){   5770, 100352},
         Package(){   5588, 101376},
         Package(){   5412, 102400},
         Package(){   5243, 103424},
         Package(){   5080, 104448},
         Package(){   4923, 105472},
         Package(){   4771, 106496},
         Package(){   4625, 107520},
         Package(){   4484, 108544},
         Package(){   4348, 109568},
         Package(){   4217, 110592},
         Package(){   4090, 111616},
         Package(){   3968, 112640},
         Package(){   3850, 113664},
         Package(){   3736, 114688},
         Package(){   3626, 115712},
         Package(){   3519, 116736},
         Package(){   3417, 117760},
         Package(){   3317, 118784},
         Package(){   3221, 119808},
         Package(){   3129, 120832},
         Package(){   3039, 121856},
         Package(){   2952, 122880},
         Package(){   2868, 123904},
         Package(){   2787, 124928},
         Package(){   2709, 125952},
         Package(){   2633, 126976},
         Package(){   2560, 128000},
         Package(){   2489, 129024},
         Package(){   2420, 130048}
      })
   }

   /*----------------------------------------------------------------------------
    * Voltage ADC Threshold Monitor (VADCTM) Configuration
    * -------------------------------------------------------------------------*/
   /*
    * VADCTM Measurement Configuration Table
    *
    * The following is a list of periodic measurements that the VADCTM
    * can periodically monitor. Thresholds for these measurements are set
    * in software.
    *
    * sName:
    *    Appropriate string name for the channel from AdcInputs.h.
    *
    * uAdcHardwareChannel:
    *    AMUX channel.
    *
    * eSettlingDelay:
    *    Holdoff time to allow the voltage to settle before reading the channel.
    *    0 - VADCTM_SETTLING_DELAY_0_US
    *    1 - VADCTM_SETTLING_DELAY_100_US
    *    2 - VADCTM_SETTLING_DELAY_200_US
    *    3 - VADCTM_SETTLING_DELAY_300_US
    *    4 - VADCTM_SETTLING_DELAY_400_US
    *    5 - VADCTM_SETTLING_DELAY_500_US
    *    6 - VADCTM_SETTLING_DELAY_600_US
    *    7 - VADCTM_SETTLING_DELAY_700_US
    *    8 - VADCTM_SETTLING_DELAY_800_US
    *    9 - VADCTM_SETTLING_DELAY_900_US
    *    10 - VADCTM_SETTLING_DELAY_1_MS
    *    11 - VADCTM_SETTLING_DELAY_2_MS
    *    12 - VADCTM_SETTLING_DELAY_4_MS
    *    13 - VADCTM_SETTLING_DELAY_6_MS
    *    14 - VADCTM_SETTLING_DELAY_8_MS
    *    15 - VADCTM_SETTLING_DELAY_10_MS
    *
    * eMeasIntervalTimeSelect:
    *    The interval timer to use for the measurement period.
    *    0 - VADCTM_MEAS_INTERVAL_TIME1
    *    1 - VADCTM_MEAS_INTERVAL_TIME2
    *    2 - VADCTM_MEAS_INTERVAL_TIME3
    *
    * bAlwaysOn:
    *    Keep the measurement always sampling even if no thresholds are set.
    *    0 - FALSE
    *    1 - TRUE
    *
    * eCalMethod:
    *    Calibration method.
    *    0 - VADC_CAL_METHOD_NO_CAL
    *    1 - VADC_CAL_METHOD_RATIOMETRIC
    *    2 - VADC_CAL_METHOD_ABSOLUTE
    *
    * scalingFactor.num:
    *    Numerator of the channel scaling
    *
    * scalingFactor.den:
    *    Denominator of the channel scaling
    *
    * eScalingMethod:
    *    The scaling method to use.
    *    0 - VADC_SCALE_TO_MILLIVOLTS
    *    1 - VADC_SCALE_INTERPOLATE_FROM_MILLIVOLTS (requires uInterpolationTableName)
    *    2 - VADC_SCALE_THERMISTOR (requires uPullUp and uInterpolationTableName)
    *
    * uPullUp:
    *    The pull up resistor value. Use with eScalingMethod == VADC_SCALE_THERMISTOR,
    *    otherwise, 0.
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
    * uScalingFunctionName:
    *    The name of the function to call in the ACPI table to perform custom
    *    scaling. The input to the custom scaling function is defined by
    *    eScalingFunctionInput. The output of the custom scaling function is
    *    the physical value.
    *    0 - No scaling function
    *    WXYZ - Where 'WXYZ' is the scaling function name
    *
    *    Note: if both a custon scaling function & interpolation table are used
    *    the custom scaling function is called first.
    *
    * uInverseFunctionName:
    *    The name of the inverse scaling for uScalingFunctionName.
    *    0 - No scaling function
    *    WXYZ - Where 'WXYZ' is the scaling function name
    *
    * eScalingFunctionInput:
    *    Defines which ADC result is passed to the custom scaling function.
    *    0 - VADC_SCALING_FUNCTION_INPUT_PHYSICAL
    *    1 - VADC_SCALING_FUNCTION_INPUT_PERCENT
    *    2 - VADC_SCALING_FUNCTION_INPUT_MICROVOLTS
    *    3 - VADC_SCALING_FUNCTION_INPUT_CODE
    *
    * nPhysicalMin:
    *    Minimum threshold value in physical units.
    *
    * nPhysicalMax:
    *    Maximum threshold value in physical units.
    *
    */
   Method (VTCH)
   {
      Return (Package()
      {
         /* VPH_PWR (VPH_PWR_SNS pin) */
         Package()
         {
            /* .sName                   = */ "VPH_PWR",
            /* .uAdcHardwareChannel     = */ 0x83,
            /* .eSettlingDelay          = */ 0,
            /* .eMeasIntervalTimeSelect = */ 1,
            /* .bAlwaysOn               = */ 0,
            /* .eCalMethod              = */ 2,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 3,
            /* .eScalingMethod          = */ 0,
            /* .uPullUp                 = */ 0,
            /* .uInterpolationTableName = */ 0,
            /* .uScalingFunctionName    = */ 0,
            /* .uInverseFunctionName    = */ 0,
            /* .eScalingFunctionInput   = */ 0,
            /* .nPhysicalMin            = */ 0,
            /* .nPhysicalMax            = */ 5625,
         },

         /* PMIC_TEMP1 (internal sensor) */
         Package()
         {
            /* .sName                   = */ "PMIC_THERM",
            /* .uAdcHardwareChannel     = */ 0x6,
            /* .eSettlingDelay          = */ 0,
            /* .eMeasIntervalTimeSelect = */ 0,
            /* .bAlwaysOn               = */ 0,
            /* .eCalMethod              = */ 2,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 1,
            /* .eScalingMethod          = */ 0,
            /* .uPullUp                 = */ 0,
            /* .uInterpolationTableName = */ 0,
            /* .uScalingFunctionName    = */ PTCF,
            /* .uInverseFunctionName    = */ PTCI,
            /* .eScalingFunctionInput   = */ 2,
            /* .nPhysicalMin            = */ 0xFFFF3CB0,  // -50000
            /* .nPhysicalMax            = */ 150000,
         },

         /* SYS_THERM1 (AMUX_1 pin) */
         Package()
         {
            /* .sName                   = */ "SYS_THERM1",
            /* .uAdcHardwareChannel     = */ 0x4d,
            /* .eSettlingDelay          = */ 1,
            /* .eMeasIntervalTimeSelect = */ 0,
            /* .bAlwaysOn               = */ 0,
            /* .eCalMethod              = */ 1,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 1,
            /* .eScalingMethod          = */ 2,
            /* .uPullUp                 = */ 100000,
            /* .uInterpolationTableName = */ SYTB,
            /* .uScalingFunctionName    = */ 0,
            /* .uInverseFunctionName    = */ 0,
            /* .eScalingFunctionInput   = */ 0,
            /* .nPhysicalMin            = */ 0xFFFFFFD8,  // -40
            /* .nPhysicalMax            = */ 125,
         },

         /* SYS_THERM2 (AMUX_2 pin) */
         Package()
         {
            /* .sName                   = */ "SYS_THERM2",
            /* .uAdcHardwareChannel     = */ 0x4e,
            /* .eSettlingDelay          = */ 1,
            /* .eMeasIntervalTimeSelect = */ 0,
            /* .bAlwaysOn               = */ 0,
            /* .eCalMethod              = */ 1,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 1,
            /* .eScalingMethod          = */ 2,
            /* .uPullUp                 = */ 100000,
            /* .uInterpolationTableName = */ SYTB,
            /* .uScalingFunctionName    = */ 0,
            /* .uInverseFunctionName    = */ 0,
            /* .eScalingFunctionInput   = */ 0,
            /* .nPhysicalMin            = */ 0xFFFFFFD8,  // -40
            /* .nPhysicalMax            = */ 125,
         },

         /* PA_THERM (AMUX_3 pin) */
         Package()
         {
            /* .sName                   = */ "PA_THERM",
            /* .uAdcHardwareChannel     = */ 0x4f,
            /* .eSettlingDelay          = */ 1,
            /* .eMeasIntervalTimeSelect = */ 0,
            /* .bAlwaysOn               = */ 0,
            /* .eCalMethod              = */ 1,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 1,
            /* .eScalingMethod          = */ 2,
            /* .uPullUp                 = */ 100000,
            /* .uInterpolationTableName = */ SYTB,
            /* .uScalingFunctionName    = */ 0,
            /* .uInverseFunctionName    = */ 0,
            /* .eScalingFunctionInput   = */ 0,
            /* .nPhysicalMin            = */ 0xFFFFFFD8,  // -40
            /* .nPhysicalMax            = */ 125,
         },

         /* PA_THERM1 (AMUX_4 pin) */
         Package()
         {
            /* .sName                   = */ "PA_THERM1",
            /* .uAdcHardwareChannel     = */ 0x50,
            /* .eSettlingDelay          = */ 1,
            /* .eMeasIntervalTimeSelect = */ 0,
            /* .bAlwaysOn               = */ 0,
            /* .eCalMethod              = */ 1,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 1,
            /* .eScalingMethod          = */ 2,
            /* .uPullUp                 = */ 100000,
            /* .uInterpolationTableName = */ SYTB,
            /* .uScalingFunctionName    = */ 0,
            /* .uInverseFunctionName    = */ 0,
            /* .eScalingFunctionInput   = */ 0,
            /* .nPhysicalMin            = */ 0xFFFFFFD8,  // -40
            /* .nPhysicalMax            = */ 125,
         },

         /* SYS_THERM3 (AMUX_5 pin) */
         Package()
         {
            /* .sName                   = */ "SYS_THERM3",
            /* .uAdcHardwareChannel     = */ 0x51,
            /* .eSettlingDelay          = */ 1,
            /* .eMeasIntervalTimeSelect = */ 0,
            /* .bAlwaysOn               = */ 0,
            /* .eCalMethod              = */ 1,
            /* .scalingFactor.num       = */ 1,
            /* .scalingFactor.den       = */ 1,
            /* .eScalingMethod          = */ 2,
            /* .uPullUp                 = */ 100000,
            /* .uInterpolationTableName = */ SYTB,
            /* .uScalingFunctionName    = */ 0,
            /* .uInverseFunctionName    = */ 0,
            /* .eScalingFunctionInput   = */ 0,
            /* .nPhysicalMin            = */ 0xFFFFFFD8,  // -40
            /* .nPhysicalMax            = */ 125,
         },
      })
   }

   /*
    * General VADCTM measurement timer properties
    *
    * eMeasIntervalTime1:
    *    Interval timer 1 periodic value.
    *    0 - VADCTM_MEAS_INTERVAL_TIME1_0_MS
    *    1 - VADCTM_MEAS_INTERVAL_TIME1_1P0_MS
    *    2 - VADCTM_MEAS_INTERVAL_TIME1_2P0_MS
    *    3 - VADCTM_MEAS_INTERVAL_TIME1_3P9_MS
    *    4 - VADCTM_MEAS_INTERVAL_TIME1_7P8_MS
    *    5 - VADCTM_MEAS_INTERVAL_TIME1_15P6_MS
    *    6 - VADCTM_MEAS_INTERVAL_TIME1_31P1_MS
    *    7 - VADCTM_MEAS_INTERVAL_TIME1_62P5_MS
    *    8 - VADCTM_MEAS_INTERVAL_TIME1_125_MS
    *    9 - VADCTM_MEAS_INTERVAL_TIME1_250_MS
    *    10 - VADCTM_MEAS_INTERVAL_TIME1_500_MS
    *    11 - VADCTM_MEAS_INTERVAL_TIME1_1000_MS
    *    12 - VADCTM_MEAS_INTERVAL_TIME1_2000_MS
    *    13 - VADCTM_MEAS_INTERVAL_TIME1_4000_MS
    *    14 - VADCTM_MEAS_INTERVAL_TIME1_8000_MS
    *    15 - VADCTM_MEAS_INTERVAL_TIME1_16000_MS
    *
    * eMeasIntervalTime2:
    *    Interval timer 2 periodic value.
    *    0 - VADCTM_MEAS_INTERVAL_TIME2_0_MS
    *    1 - VADCTM_MEAS_INTERVAL_TIME2_100_MS
    *    2 - VADCTM_MEAS_INTERVAL_TIME2_200_MS
    *    3 - VADCTM_MEAS_INTERVAL_TIME2_300_MS
    *    4 - VADCTM_MEAS_INTERVAL_TIME2_400_MS
    *    5 - VADCTM_MEAS_INTERVAL_TIME2_500_MS
    *    6 - VADCTM_MEAS_INTERVAL_TIME2_600_MS
    *    7 - VADCTM_MEAS_INTERVAL_TIME2_700_MS
    *    8 - VADCTM_MEAS_INTERVAL_TIME2_800_MS
    *    9 - VADCTM_MEAS_INTERVAL_TIME2_900_MS
    *    10 - VADCTM_MEAS_INTERVAL_TIME2_1000_MS
    *    11 - VADCTM_MEAS_INTERVAL_TIME2_1100_MS
    *    12 - VADCTM_MEAS_INTERVAL_TIME2_1200_MS
    *    13 - VADCTM_MEAS_INTERVAL_TIME2_1300_MS
    *    14 - VADCTM_MEAS_INTERVAL_TIME2_1400_MS
    *    15 - VADCTM_MEAS_INTERVAL_TIME2_1500_MS
    *
    * eMeasIntervalTime3:
    *    Interval timer 3 periodic value.
    *    0 - VADCTM_MEAS_INTERVAL_TIME3_0_S
    *    1 - VADCTM_MEAS_INTERVAL_TIME3_1_S
    *    2 - VADCTM_MEAS_INTERVAL_TIME3_2_S
    *    3 - VADCTM_MEAS_INTERVAL_TIME3_3_S
    *    4 - VADCTM_MEAS_INTERVAL_TIME3_4_S
    *    5 - VADCTM_MEAS_INTERVAL_TIME3_5_S
    *    6 - VADCTM_MEAS_INTERVAL_TIME3_6_S
    *    7 - VADCTM_MEAS_INTERVAL_TIME3_7_S
    *    8 - VADCTM_MEAS_INTERVAL_TIME3_8_S
    *    9 - VADCTM_MEAS_INTERVAL_TIME3_9_S
    *    10 - VADCTM_MEAS_INTERVAL_TIME3_10_S
    *    11 - VADCTM_MEAS_INTERVAL_TIME3_11_S
    *    12 - VADCTM_MEAS_INTERVAL_TIME3_12_S
    *    13 - VADCTM_MEAS_INTERVAL_TIME3_13_S
    *    14 - VADCTM_MEAS_INTERVAL_TIME3_14_S
    *    15 - VADCTM_MEAS_INTERVAL_TIME3_15_S
    *
    */
   Method (VTMT)
   {
      Return (Package()
      {
         /* .eMeasIntervalTime1  = */ 11,  // 1000 ms
         /* .eMeasIntervalTime2  = */ 1,   // 100 ms
         /* .eMeasIntervalTime3  = */ 5,   // 5000 ms
      })
   }
}
