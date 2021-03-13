//
        // SMMU Driver
        //
        // SMT vector diagram: \\brewmp4\public\Istari\
        //
        // Need to change Device Name in resorce file
        // Currently Marking CP-P, CP-NP as CP_Pixel only need to add these VM
        // to SMMU driver and need to update

        Device (MMU0)
        {
            // ATCU 

            Name (_HID, "QCOM0212")
            Alias(\_SB.PSUB, _SUB)
            Name (_UID, 0)
            Name (_DEP, Package ()
            {
                \_SB_.MMU1
            })


            Method (_CRS, 0x0, NotSerialized)
            {
                Return (ResourceTemplate ()
                {
                    // a-TCU register address space
                    Memory32Fixed (ReadWrite, 0x15000000, 0x7FFB8)
                    // TLBI HW SPINLOCK BASE ADDRESS
                    Memory32Fixed (ReadWrite, 0x1F46000, 0x4)
                    // a-TCU: there is one interrupt for each CB handled by HLOS clients (only non-secure CBs)
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {128} // CB 0
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {129} // CB 1
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {130} // CB 2
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {131} // CB 3
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {132} // CB 4
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {133} // CB 5
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {134} // CB 6
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {135} // CB 7
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {136} // CB 8
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {137} // CB 9
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {138} // CB 10
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {139} // CB 11
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {140} // CB 12
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {141} // CB 13
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {142} // CB 14
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {143} // CB 15
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {144} // CB 16
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {145} // CB 17
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {146} // CB 18
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {147} // CB 19
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {148} // CB 20
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {149} // CB 21
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {150} // CB 22
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {213} // CB 23
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {214} // CB 24
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {215} // CB 25
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {216} // CB 26
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {217} // CB 27
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {218} // CB 28
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {219} // CB 29
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {220} // CB 30
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {221} // CB 31
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {222} // CB 32
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {223} // CB 33
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {224} // CB 34
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {347} // CB 35
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {348} // CB 36
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {349} // CB 37
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {350} // CB 38
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {351} // CB 39
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {352} // CB 40
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {353} // CB 41
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {354} // CB 42





                    // Not used for mapping
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {355} // CB 43
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {356} // CB 44
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {357} // CB 45
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {358} // CB 46
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {359} // CB 47
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {360} // CB 48
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {361} // CB 49
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {362} // CB 50
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {363} // CB 51
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {364} // CB 52
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {365} // CB 53
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {366} // CB 54
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {367} // CB 55
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {368} // CB 56
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {369} // CB 57
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {370} // CB 58
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {371} // CB 59
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {372} // CB 60
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {373} // CB 61
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {374} // CB 62
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {375} // CB 63
                })
            }
        }

        Device (MMU1)
        {
            // This is the SMMU for Oxili/GFX

            Name (_HID, "QCOM0212")
            Alias(\_SB.PSUB, _SUB)
            Name (_UID, 1)
            Name (_DEP, Package()
            {
                \_SB_.PEP0
            })

            // When testing on 8960, delete the _CRS method. This will cause
            // the driver to use a chunk of RAM.

            Method (_CRS, 0x0, NotSerialized)
            {
                Return (ResourceTemplate ()
                {
                    //g-TCU register address space
                    Memory32Fixed (ReadWrite, 0x05040000, 0x10000)
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {396} // CB 0
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {397} // CB 1
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {398} // CB 2
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {399} // CB 3
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {400} // CB 4
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {401} // CB 5
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {402} // CB 6
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {403} // CB 7
                })
            }
        }

        
        Device (IMM0)
        {
            // ATCU 

            Name (_HID, "QCOM030B")
            Alias(\_SB.PSUB, _SUB)
            Name (_UID, 0)
        }

        Device (IMM1)
        {
            // This is the SMMU for Oxili/GFX

            Name (_HID, "QCOM030B")
            Alias(\_SB.PSUB, _SUB)
            Name (_UID, 1)
        }
