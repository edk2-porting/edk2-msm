// This file contains the Audio Drivers 
// ACPI device definitions, configuration and look-up tables.
// 

// 
//ADCM
//
Device (ADCM)
{
    Alias(\_SB.PSUB, _SUB)
    
    // Address object for acpi device enumerated device (ADCM) on parent device bus
    // Used to identify multiple child if present
    Name (_ADR, 0)

    // Adding dependency for LPASS SMMU (Defined in HoneyBadgerSmmu_Resources.asl)
	//Added new dependency for 845+
    Name (_DEP, Package()
    {
	\_SB_.MMU0,
	\_SB_.IMM0,
    })


        // Child Method lists immediate child of ADCM - That is AUDD (Codec Driver) 
        Method (CHLD)
        {
                Return (Package()
                {
                    "ADCM\\QCOM0240"
                })
        }

        // AUDD Driver Configurations

        Device (AUDD)
        {
            // Address object for acpi device enumerated device (AUDD) on parent device bus
            // Used to identify multiple child if present
            Name (_ADR, 0)
            Alias(\_SB.PSUB, _SUB)

            // Adding dependency for SPI BUS
            Name (_DEP, Package()
            {
                \_SB_.SPI9,
            })

            Method (_CRS, 0x0, NotSerialized) 
            {
              Name (RBUF, ResourceTemplate () 
              {
                    GpioIo(Exclusive, PullNone, 0, 1600, , "\\_SB.GIO0", ,) {64} //RESET
                    GpioInt(Edge, ActiveHigh, Exclusive, PullDown, 0, "\\_SB.GIO0", ,) {256} // GPIO number for interrupt changed for wakeup capability
                                                                                             // on target it is GPIO 54    
                    GpioIo(Shared, PullUp, 0, 200, IoRestrictionOutputOnly, "\\_SB.GIO0", ,) {49} //USB_AUDIO_EN1
                    // SPI
                    SPISerialBus(
                        0,                // DeviceSelection: chip-select, GPIO, or other line selection
                        ,                 // DeviceSelectionPolarity: defaults to PolarityLow (optional)
                        ,                 // WireMode: defaults to FourWireMode (optional)
                        8,                // DataBitLength
                        ,                 // SlaveMode: defaults to ControllerInitiated (optional)
                        24000000,         // ConnectionSpeed: in Hz (24MHz, wcd supports SPI clock up tp 26MHz)
                        ClockPolarityLow, // ClockPolarity
                        ClockPhaseFirst,  // ClockPhase
                        "\\_SB.SPI9",     // ResourceSource: SPI bus controller name
                        ,                 // ResourceSourceIndex: defaults to 0 (optional)
                        ,                 // ResourceUsage: defaults to ResourceConsumer (optional)
                        ,                 // DescriptorName: creates name for offset of resource descriptor
                        RawDataBuffer(){
                            0x00,       // Reserved; must be 0
                            0x00,       // spi_mode
                            0x00,       // inter_word_delay_cycles
                            0x00,       // loopback_mode
                            0x00,       // cs_toggle
                            0x00,       // endianness
                            0x00,       // cs_clk_delay_cycles
                    }) // VendorData
            })
               Return (RBUF)
            }

            Method (CHLD)
            {
				Name(CH, Package()
				{
					"AUDD\\QCOM0277",
					"AUDD\\QCOM0262",
				})
                Return(CH)
            }

                // 
                //MBHC
                //
                Device (MBHC)
                {
					// Address object for acpi device enumerated device (MBHC) on parent device bus
					// Used to identify multiple child if present
                    Name (_ADR, 0)
                    Method (_CRS, 0x0, NotSerialized) 
                    {
                            Name (RBUF, ResourceTemplate () {
									//GpioIo(Shared, Pullup, 0, 200, IoRestrictionOutputOnly, "\\_SB.GIO0", ,) {51} //HSJ_US_EURO_SEL/EN2
                            })
                            Return (RBUF)
                    }
                } // MBHC Device Configurations end

				// Miniport Device Configurations
                Device (QCRT)
                {
					// Address object for acpi device enumerated device (QCRT) on parent device bus
					// Used to identify multiple child if present 
					// Since, QCRT is second child of AUDD, we have assigned slot-1
                    Name (_ADR, 1)
	        }// Miniport Device Configurations end			
        } // AUDD Driver Configurations end
} // end Device (ADCM)
