//===========================================================================
//                           <pep_dvreg.asl>
// DESCRIPTION
//   This file contains the default discrete VREG mapping and method names
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
       // Virtual regulator to aggregate GPIO pin control of CHIP_PWD_L
       // CHIP_PWD_L must be deasserted for BT to share a clock with AR6004
       // BT and WLAN devices will take a vote on this virtual regulator to
       // control the shared GPIO pin
       Package()
       {
          "PPP_RESOURCE_ID_PMIC_GPIO_DV1", // Discrete Vreg ID
          "PPP_RESOURCE_TYPE_DISCRETE_PMIC_GPIO", // Vreg type
          Package()
          {
             "PM_DISCRETE_VREG_STATE_ON", // Mapping for VREG ON
             package()
             {
                0, // pmic_number (PM8994) - must match pmic.asl
                8,// gpio_id - GPIO #9
                0, // Mode - GPIO configured as output - 0, 1 for input
                0, // voltage_source - PM_GPIO_VIN0
                1, // source - PM_GPIO_SOURCE_1 (drive logic HIGH)
                0, // out_buffer_config - PM_GPIO_OUT_BUFFER_CONFIG_CMOS 
                1, // out_buffer_strength - PM_GPIO_OUT_BUFFER_LOW
                0, // inversion � no invert
                1, // External pin enable - PM_GPIO_PERPH_EN_ENABLE
                5, // PM_GPIO_I_SOURCE_PULL_NO_PULL, ignored for Output mode.
             },
          },
          Package()
          {
             "PM_DISCRETE_VREG_STATE_OFF", // Mapping for VREG OFF
             package()
             {
                0, // pmic_number 0
                8,// gpio_id - GPIO #9
                0, // Mode - GPIO configured as output - 0, 1 for input
                0, // voltage_source - PM_GPIO_VIN0
                0, // source - PM_GPIO_SOURCE_0 (drive logic LOW)
                0, // out_buffer_config - PM_GPIO_OUT_BUFFER_CONFIG_CMOS 
                1, // out_buffer_strength - PM_GPIO_OUT_BUFFER_LOW
                0, // inversion � no invert
                1, // External pin enable - PM_GPIO_PERPH_EN_ENABLE
                5, // PM_GPIO_I_SOURCE_PULL_NO_PULL, ignored for Output mode.
             },
          },
       },
       //discrete vreg vote for MPP4
       Package()
       {
          "PPP_RESOURCE_ID_PMIC_MPP_DV1", // Discrete Vreg ID
          "PPP_RESOURCE_TYPE_DISCRETE_PMIC_MPP", // Vreg type
          Package()
          {
             "PM_DISCRETE_VREG_STATE_ON", // Mapping for VREG ON
             package()
             {
                0, // PMIC number
                3, // MPP index (mpp #4)
                0, // Direction, 0 - output
                2, // VIO_2
                1, // PM_MPP__DLOGIC__OUT_CTRL_HIGH
                0, // PM_MPP__DLOGIC__DBUS_NONE
             },
          },
          Package()
          {
             "PM_DISCRETE_VREG_STATE_OFF", // Mapping for VREG OFF
             package()
             {
                0, // PMIC number
                3, // MPP index (mpp #4)
                0, // Direction, 0 - output
                2, // VIO_2
                0, // PM_MPP__DLOGIC__OUT_CTRL_LOW
                0, // PM_MPP__DLOGIC__DBUS_NONE
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
