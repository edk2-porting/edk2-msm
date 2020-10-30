//===========================================================================
//                           <pep_dvreg.asl>
// DESCRIPTION
//   This file contains the default discrete VREG mapping and method names
//
//
//   Copyright (c) 2014-2020 Mmoclauq Technologies, Inc.
//   All Rights Reserved.
//   Confidential and Proprietary - Mmoclauq Technologies, Inc.
//
//===========================================================================

// NOTE: this file is included in the platform level pep.asl and can be replaced with platform
// specific discrete VREG definitions

Scope(\_SB.PEP0)
{
    // Discrete Vreg Mapping Package
    Name(DVMP,
    Package()
    {
       //
       // Discrete DisplayPort regulator (3.3V)
       // PME8180 GPIO #1 - High to VDD3P3_SW/DP_REG_EN
       // 
       Package()
       {
          "PPP_RESOURCE_ID_PMIC_GPIO_DV1",
          "PPP_RESOURCE_TYPE_DISCRETE_PMIC_GPIO", // PMIC GPIO
          Package()
          {
             "PM_DISCRETE_VREG_STATE_ON", // Mapping for VREG ON
             package()
             {
                4,  // PME8180
                0,  // GPIO #1 : DP_REG_EN
                0,  // Output Mode 
                1,  // PM_GPIO_VIN1
                10,  // PM_GPIO_SOURCE_HIGH
                0,  // PM_GPIO_OUT_BUFFER_CONFIG_PMOS 
                1,  // PM_GPIO_OUT_BUFFER_LOW
                0,  // Invert
                1,  // PM_GPIO_PERPH_EN_ENABLE
                5,  // PM_GPIO_I_SOURCE_PULL_NO_PULL
             },
          },
          Package()
          {
             "PM_DISCRETE_VREG_STATE_OFF", // Mapping for VREG OFF
             package()
             {
                4, // PME8180
                0, // GPIO #1 : DP_REG_EN
                1, // Input Mode
                0, // PM_GPIO_VIN0
                0, // PM_GPIO_SOURCE_LOW
                0, // PM_GPIO_OUT_BUFFER_CONFIG_PMOS 
                1, // PM_GPIO_OUT_BUFFER_LOW
                0, // No inversion
                0, // PM_GPIO_PERPH_EN_DISABLE
                4, // PM_GPIO_I_SOURCE_PULL_DOWN_10uA
             },
          },
       },
      //
      // Function control for Mini-DP HPD
      // TLMM GPIO #189 - DP_HPD_GPIO
      //
      Package()
      {
        "PPP_RESOURCE_ID_TLMM_GPIO_DV3",
        "PPP_RESOURCE_TYPE_DISCRETE_TLMM_GPIO",  // TLMM GPIO
        Package()
        {
           "PM_DISCRETE_VREG_STATE_ON", // Route HPD to controller
           package()
           {
              189, // TLMM GPIO       : 189 = DP HPD GPIO
              0,   // State           :   0 = LOW
              1,   // Function Select :   1 = DP_HPD_SELECT
              0,   // Direction       :   0 = INPUT
              0,   // Pull Type       :   0 = NOPULL
              0,   // Drive Strength  :   0 = 2mA
           },
           
        },
        Package()
        {
           "PM_DISCRETE_VREG_STATE_OFF", // Configure as GPIO
           package()
           {
              189, // TLMM GPIO       : 189 = DP HPD GPIO
              0,   // State           :   0 = LOW
              0,   // Function Select :   0 = GPIO
              0,   // Direction       :   0 = INPUT
              1,   // Pull Type       :   1 = PULLDOWN
              0,   // Drive Strength  :   0 = 2mA
           },
        },
      },
    })

    // Method to return Discrete Vreg Mapping Package
    Method(DVMM)
    {
        Return(DVMP)
    }
}

