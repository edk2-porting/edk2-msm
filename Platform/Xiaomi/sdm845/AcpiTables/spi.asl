
        // SPI1 - EPM
        //
        Device (SPI1)
        {
            Name (_HID, "QCOM021E")
			Alias(\_SB.PSUB, _SUB)
            Name (_UID, 1)
            Name (_DEP, Package(){\_SB_.PEP0, \_SB_.BAM3})
            Name (_CCA, 0)

            Method (_CRS)
            {
                Name (RBUF, ResourceTemplate()
                {

                    Memory32Fixed(ReadWrite, 0xf9923000, 0x00000800)
                    Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive) {127}
                })
                Return (RBUF)
            }
            Method (FNOC)
            {
                 Name(RBUF, Buffer()
                 {
                     0x01,  // Controller Number
                     0x00,  // BamBaseAddress
                     0x40,  // BamBaseAddress
                     0x90,  // BamBaseAddress
                     0xf9,  // BamBaseAddress
                     0x0d,  // Input Pipe
                     0x0c,  // Output Pipe
                     0x00,  // Threshold
                     0x01   // Threshold
                })
                Return (RBUF)
            }
        }
