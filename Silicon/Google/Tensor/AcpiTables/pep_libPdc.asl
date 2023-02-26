Scope(\_SB.PEP0)
{
	Method(LPDC){
        return(NPDC)
    }
    
    Name( NPDC, package(){			
            
            package(){
                "INTERRUPT_CONFIG",
                package(){
                    /// Data Format:
                    /// { INDEX , LOCAL_IRQ, IRQ_TYPE, TRIGGER_TYPE, [optional] FLAGS }
                    ///
                    /// @param INDEX                    THIS IS ZERO BASED INDEX UNIQUE and INCREASING ORDER.
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
                    /// @param [opt] FLAGS   0-16      reference: file pdc_types.h
                    ///                                 0 = No Flags set (default) 
					///                                 1 = Don't Program with HLOS given trigger type - instead use default PDC configuration
                    ///                                 2 = Program with Static trigger type 
					///                                 4 = Forcefully disable pdc interrupt 
                    ///                                 8 = Ignore OS sent Polarity configuration for PDC interrupt - instead use either default polarity or let it get updated internally
                    ///                                16 = Ignore OS sent Mode configuration for PDC interrupt - instead use either default polarity or let it get updated internally					
					
					// Tsens Wake able interrupts 
					// //  Mandatory wake-capable Tsens interrupts
					package(){ 0, 538, 0, 1 }, // tsense0_upper_lower_intr
					package(){ 1, 539, 0, 1 }, // tsense1_upper_lower_intr
					package(){ 2, 540, 0, 1 }, // tsense0_critical_intr
					package(){ 3, 541, 0, 1 }, // tsense1_critical_intr
                    // // Preferable  wake-capable interrupts (in the event Tsens use them for debugging min/max shutdowns)
					package(){ 4, 536, 0, 1 }, // tsense0_tsense_max_min_int
					package(){ 5, 537, 0, 1 }, // tsense1_tsense_max_min_int

                    
					// USB wakeup interrupts 
					// to be used in Host mode ( WD ) for device detection and 
					// wake up from suspend in SS and HS modes on Xo shutdown + Cx collapse.
					package(){ 6, 518, 0, 1 }, // qmp_usb3_lfps_rxterm_irq USB SS Primary
                    package(){ 7, 519, 0, 1 }, // qmp_usb3_lfps_rxterm_irq USB SS Secondary
					package(){ 8, 520, 0, 1 , 8}, // eud_p0_dmse_int_mx
					package(){ 9, 521, 0, 1 , 8}, // eud_p0_dpse_int_mx
                    package(){10, 522, 0, 1 , 8}, // eud_p1_dmse_int_mx
                    package(){11, 523, 0, 1 , 8}, // eud_p1_dpse_int_mx                    

                    // PMIC wakeup interrupt -- 
					// (Power Key button)
                    package(){12, 513, 0, 4 }, // ee0_apps_hlos_spmi_periph_irq
                }
            },
		})
}
