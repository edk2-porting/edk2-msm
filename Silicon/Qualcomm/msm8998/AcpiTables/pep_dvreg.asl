//===========================================================================
//                           <pep_dvreg.asl>
// DESCRIPTION
//   This file contains the default discrete VREG mapping and method names
//
//===========================================================================

// NOTE: this file is included in the platform level pep.asl and can be replaced with platform
// specific discrete VREG definitions

Scope (\_SB.PEP0)
{
    Name (DVMP, Package (0x02)
    {
        Package (0x04)
        {
            "PPP_RESOURCE_ID_PMIC_GPIO_DV1", 
            "PPP_RESOURCE_TYPE_DISCRETE_PMIC_GPIO", 
            Package (0x02)
            {
                "PM_DISCRETE_VREG_STATE_ON", 
                Package (0x0A)
                {
                    Zero, 
                    0x08, 
                    Zero, 
                    Zero, 
                    One, 
                    Zero, 
                    One, 
                    Zero, 
                    One, 
                    0x05
                }
            }, 

            Package (0x02)
            {
                "PM_DISCRETE_VREG_STATE_OFF", 
                Package (0x0A)
                {
                    Zero, 
                    0x08, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    One, 
                    Zero, 
                    One, 
                    0x05
                }
            }
        }, 

        Package (0x04)
        {
            "PPP_RESOURCE_ID_PMIC_MPP_DV1", 
            "PPP_RESOURCE_TYPE_DISCRETE_PMIC_MPP", 
            Package (0x02)
            {
                "PM_DISCRETE_VREG_STATE_ON", 
                Package (0x06)
                {
                    Zero, 
                    0x03, 
                    Zero, 
                    0x02, 
                    One, 
                    Zero
                }
            }, 

            Package (0x02)
            {
                "PM_DISCRETE_VREG_STATE_OFF", 
                Package (0x06)
                {
                    Zero, 
                    0x03, 
                    Zero, 
                    0x02, 
                    Zero, 
                    Zero
                }
            }
        }
    })
    Method (DVMM, 0, NotSerialized)
    {
        Return (DVMP) /* \_SB_.PEP0.DVMP */
    }
}
