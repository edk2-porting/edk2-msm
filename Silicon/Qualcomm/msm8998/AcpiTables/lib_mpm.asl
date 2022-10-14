Scope (\_SB.PEP0)
{
    Method (LMPM, 0, NotSerialized)
    {
        Return (NMPM) /* \_SB_.PEP0.NMPM */
    }

    Name (NMPM, Package (0x02)
    {
        Package (0x02)
        {
            "MPM_SCALAR_CONFIG", 
            Package (0x07)
            {
                0x00778000, 
                0x4000, 
                0x17911000, 
                0x1000, 
                0x01B8, 
                0x08, 
                0x02
            }
        }, 

        Package ()
        {
            "MPM_INTERRUPT_CONFIG", 
            Package ()
            {
                /// Data Format:
                /// { MPM_IRQ, LOCAL_IRQ, IRQ_TYPE, TRIGGER_TYPE, [optional] TRIGGER_OVERRIDE }
                ///
                /// @param MPM_IRQ                  MPM Irq number (0-63)
                /// @param LOCAL_IRQ                GPIO or QGIC IRQ number
                /// @param IRQ_TYPE                 0 for QGIC, 1 for GPIO
                ///
                /// @param TRIGGER_TYPE             0-4; Set when MPM is init; will be overriden by HLOS values
                ///                                 0 = LEVEL_LOW
                ///                                 1 = RISING_EDGE
                ///                                 2 = FALLING_EDGE
                ///                                 3 = DUAL_EDGE
                ///                                 4 = LEVEL HIGH
                ///
                /// @param [opt] TRIGGER_OVERRIDE   0-1
                ///                                 0 = Program with HLOS given trigger type (default)
                ///                                 1 = Program with trigger type listed here

                Package (0x04)
                {
                    0x02, 
                    0xD8, 
                    Zero, 
                    One
                }, 

                Package (0x04)
                {
                    0x34, 
                    0x0113, 
                    Zero, 
                    One
                }, 

                Package (0x04)
                {
                    0x4F, 
                    0x017B, 
                    Zero, 
                    0x03
                }, 

                Package (0x04)
                {
                    0x51, 
                    0x017B, 
                    Zero, 
                    0x03
                }, 

                Package (0x04)
                {
                    0x49, 
                    0x9D, 
                    Zero, 
                    One
                }, 

                Package (0x04)
                {
                    0x4A, 
                    0x9E, 
                    Zero, 
                    One
                }, 

                Package (0x04)
                {
                    0x57, 
                    0x0166, 
                    Zero, 
                    0x04
                }
            }
        }
    })
}
