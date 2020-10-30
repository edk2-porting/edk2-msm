

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

            Name (_HID, "HID_MMU0")
            Name (_UID, 0)
            Alias(\_SB.PSUB, _SUB)
			Alias(\_SB.SVMJ, _HRV)
            Name (_DEP, Package (0x1)
            {
                \_SB_.MMU1
            })


            Method (_CRS, 0x0, NotSerialized)
            {
                Return (ResourceTemplate ()
                {
                    // a-TCU register address space
                    Memory32Fixed (ReadWrite, 0x15000000, 0x100000)

                    // a-TCU: there is one interrupt for each CB handled by HLOS clients (only non-secure CBs)
                    
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {129} // CB 0
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {130} // CB 1
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {131} // CB 2
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {132} // CB 3
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {133} // CB 4
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {134} // CB 5
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {135} // CB 6
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {136} // CB 7
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {137} // CB 8
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {138} // CB 9
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {139} // CB 10
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {140} // CB 11
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {141} // CB 12
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {142} // CB 13
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {143} // CB 14
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {144} // CB 15
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {145} // CB 16
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {146} // CB 17
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {147} // CB 18
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {148} // CB 19
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {149} // CB 20
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {150} // CB 21
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {213} // CB 22
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {214} // CB 23
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {215} // CB 24
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {216} // CB 25
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {217} // CB 26
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {218} // CB 27
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {219} // CB 28
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {220} // CB 29
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {221} // CB 30
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {222} // CB 31
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {223} // CB 32
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {224} // CB 33
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {347} // CB 34
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {348} // CB 35
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {349} // CB 36
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {350} // CB 37
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {351} // CB 38

                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {352} // CB 39
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {353} // CB 40
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {354} // CB 41
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {355} // CB 42
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {356} // CB 43
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {357} // CB 44
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {358} // CB 45
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {359} // CB 46
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {360} // CB 47
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {361} // CB 48
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {362} // CB 49
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {363} // CB 50
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {364} // CB 51
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {365} // CB 52
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {366} // CB 53
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {367} // CB 54
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {368} // CB 55
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {369} // CB 56
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {370} // CB 57
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {371} // CB 58
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {372} // CB 59
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {373} // CB 60
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {374} // CB 61
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {375} // CB 62
                    
					
					// Not used for mapping
					//Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {376} // CB 63
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {377} // CB 64
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {427} // CB 65
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {428} // CB 66
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {429} // CB 67
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {430} // CB 68
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {431} // CB 69
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {432} // CB 70
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {433} // CB 71
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {434} // CB 72
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {435} // CB 73
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {436} // CB 74
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {437} // CB 75
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {438} // CB 76
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {439} // CB 77
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {440} // CB 78
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {441} // CB 79
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {442} // CB 80
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {443} // CB 81
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {444} // CB 82
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {445} // CB 83
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {672} // CB 97
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {673} // CB 96
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {674} // CB 95
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {675} // CB 94
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {738} // CB 84
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {739} // CB 85
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {740} // CB 86
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {741} // CB 87
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {742} // CB 88
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {743} // CB 89
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {744} // CB 90
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {745} // CB 91
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {746} // CB 92
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {747} // CB 93
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {800} // CB 98
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {801} // CB 99
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {802} // CB 100
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {803} // CB 101
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {804} // CB 102
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {805} // CB 103
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {806} // CB 104
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {807} // CB 105
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {808} // CB 106
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {809} // CB 107
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {810} // CB 108
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {811} // CB 109
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {812} // CB 110
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {813} // CB 111
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {814} // CB 112
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {815} // CB 113
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {816} // CB 114
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {817} // CB 115
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {818} // CB 116
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {819} // CB 117
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {820} // CB 118
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {821} // CB 119
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {822} // CB 120
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {823} // CB 121
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {824} // CB 122
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {825} // CB 123
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {826} // CB 124
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {827} // CB 125
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {828} // CB 126
                    // Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {829} // CB 127
                    
                })
            }
        }

      Device (MMU1)
      {
          // This is the SMMU for Oxili/GFX
      
          Name (_HID, "HID_MMU0")
          Name (_UID, 1)
          Alias(\_SB.PSUB, _SUB)
		  Alias(\_SB.SVMJ, _HRV)
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
                  Memory32Fixed (ReadWrite, 0x02CA0000, 0x10000)
                  Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {712} // CB 0
                  Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {713} // CB 1
                  Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {714} // CB 2
                  Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {715} // CB 3
                  Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {716} // CB 4
                  Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {717} // CB 5
                  Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {718} // CB 6
                  Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {719} // CB 7
              })
          }
      }
        Device (IMM0)
        {
            // ATCU 

            Name (_HID, "HID_IMMU")
            Alias(\_SB.PSUB, _SUB)
            Name (_UID, 0)
        }

        Device (IMM1)
        {
            // This is the SMMU for Oxili/GFX

            Name (_HID, "HID_IMMU")
            Alias(\_SB.PSUB, _SUB)
            Name (_UID, 1)
        }
