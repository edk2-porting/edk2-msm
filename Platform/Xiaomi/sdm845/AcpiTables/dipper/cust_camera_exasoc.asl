//==============================================================================
//                           <cust_camera_exasoc.asl>
// DESCRIPTION
//   This file contains resources (such as memory address, GPIOs, etc.) and
//   methods needed by camera drivers for external components like sensors,flash etc.
//   Customers can update these files for different external components
//
//==============================================================================

//
// CAMERA PLATFORM
//
Device (CAMP)
{
    Name (_DEP, Package(0x3)
    {
        \_SB_.PEP0,
        \_SB_.PMIC,
		\_SB_.PMAP
    })

    Name (_HID, "QCOM026F")
    Name (_UID, 27)

    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            // TITAN_A_CPAS_0_CPAS_TOP_0
            Memory32Fixed ( ReadWrite, 0x0AC40000, 0x0000006C )

            // TITAN_A_CAMNOC
            Memory32Fixed ( ReadWrite, 0x0AC42000, 0x00004E8C )

            // TITAN_A_CCI
            Memory32Fixed ( ReadWrite, 0x0AC4A000, 0x00000C1C )

            // titan_cci_irq (Destination Subsystem: Application Processor)
            Interrupt( ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) { 492 }
        })

        Return (RBUF)
    }

    //
    // PLATFROM CONFIGURATION (PCFG) METHOD
    //
    // [1] SENSOR PRESENCE
    // -----------------------|-----------/-----------|-----------/-----------|-----------/------------
    // 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 09 08 07 06 05 04 03 02 01 00 | << BIT INDEX
    // -----------------------|-----------/-----------|-----------/-----------|-----------/------------
    //                                                                        | SENSOR PRESENCE [0/1]  | << FIELD MEANING
    //                                RESERVED                                | 7  6  5  4  3  2  1  0 | << SENSOR INDEX
    // -----------------------|-----------------------|-----------------------|-------------------------
    // 0b                                                                     | 0  0  0  0  0  1  1  1 | << 0x07
    // -----------------------|-----------/-----------|-----------/-----------|-----------/------------
    // SENSOR INDEX:    0(RFC), 1(FFC), 2(AUX), etc.
    // SENSOR PRESENCE: 0 (ABSENT) / 1(PRESENTED)

    // [2-9] SENSOR CONNECTION CONFIGURATION (here we only utilize three entires)
    // -----------------------|-----------/-----------|-----------/-----------|-----------/------------
    // 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 09 08 07 06 05 04 03 02 01 00 | << BIT INDEX
    // -----------------------|-----------/-----------|-----------/-----------|-----------/------------
    //               RESERVED |  CSI_PHY  |  I2C_BUS  | RESERVED  | FL_INX |FP|     DIR   |     ORI    | << FIELD MEANING
    // -------------------  --|-----------------------|-----------|--------|--|-----------|------------
    // 0b                       0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0   << 0x00000100 (RFC)
    // 0b                       0  0  1  0  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0   << 0x00210010 (FFC)
    // 0b                       0  0  0  1  0  0  0  1  0  0  0  0  0  0  1  1  0  0  0  1  0  0  0  0   << 0x00110300 (AUX/IRIS); REVISIT AND DOUBLE CHECK FLASH_INDEX !!!
    // -----------------------|-----------/-----------|-----------/-----------|-----------/------------
    // CSIPHY INDEX:       4-bit field, valid values 0/1/2,     respectively CSIPHY_0/1/2               LD20-NE182-9
    // I2C_BUS INDEX:      4-bit field, valid values 0/1,       respectively CCI_I2C_SDA/SCL0/1         LD20-NE182-7/42
    // FLASH_INDEX:        3-bit field, valid values 0/1/2,     respectively FLASH_LED0/1/2             LD20-NE182-19/45
    // FLASH_PRESENCE:     1-bit field, valid values 0/1,       respectively ABSENT/PRESENTED
    // SENSOR_DIRECTION:   4-bit field, valid values 0/1,       respectively Rear/Front
    // SENSOR_ORIENTATION: 4-bit field, valid values 0/1/2/3    respectively 0/90/180/270 degrees

    Method (PCFG, 0x0, Serialized)
    {
        Return
        (
            Package()
            {
                Package ()
                {
                    0x00000001,         // [1] SENSOR PRESENCE
                    0x00000100,         // [2] SENSOR_0/RFC CONNECTION
                    0x00000000,         // [3] SENSOR_1/FFC CONNECTION
                    0x00000000,         // [4] SENSOR_2/AUX/IRIS CONNECTION
                    0x00000000,         // [5] SENSOR_3 CONNECTION; RESERVED
                    0x00000000,         // [6] SENSOR_4 CONNECTION; RESERVED
                    0x00000000,         // [7] SENSOR_5 CONNECTION; RESERVED
                    0x00000000,         // [8] SENSOR_6 CONNECTION; RESERVED
                    0x00000000          // [9] SENSOR_7 CONNECTION; RESERVED
                }
            }
        )
    }

    // The method contains P state power setting used by the camera driver. The clock presented
    // here MUST be consistent with the PSTATE_SET values under the CAMP section in the file of
    // cust_camera_exasoc_resources.asl.
    Method (PERF)
    {
        Name (EBUF, Package()
        {
            Package()
            {
                "COMPONENT",
                0,                      // Platform = 0 

                Package()
                {
                    "PSTATE_SET",
                    0,                  // PStateSet Index
                    0,                  // CLK = 0, BW = 1
                    "CAMP_CLK",

                    Package()           // The indexes and frequencies be consistent 
                    {                   // with CCICLKFrqIdx in CCIResourceType.h and 
                        "PSTATE",       // cam_cc_cci_clk in cust_camera_exasoc_resources.asl
                        0,              // Chipversion list availabiliy
                        37500000,       // Index 0 clock
                        19200000,       // Index 1 clock
                    },
                },
                
                Package()
                { 
                    "PSTATE_SET",
                    1,                       // PStateSet Index
                    1,                       // CLK =0 , BW =1
                    "NRT_UNCOMP_BANDWIDTH",
                    Package()
                    {
                            "PSTATE",
                            0,                 // Chipversion list availabiliy
                           12000000000,
                           11500000000,
                           11000000000,
                           10500000000,
                           10000000000,
                            9500000000,
                            9000000000,
                            8500000000,
                            8000000000,
                            7500000000,
                            7000000000,
                            6500000000,
                            6000000000,
                            5500000000,
                            5000000000,
                            4500000000,
                            4000000000,
                            3500000000,
                            3300000000,
                            3100000000,
                            2900000000,
                            2700000000,
                            2500000000, 
                            2300000000, 
                            2100000000, 
                            1900000000, 
                            1700000000, 
                            1500000000, 
                            1300000000,
                            1100000000,
                             900000000,
                             700000000,
                             500000000,
                             400000000,
                             300000000,
                             200000000,
                             100000000,
                                     0,
                    },
                },

                Package()
                { 
                    "PSTATE_SET",
                    2,                       // PStateSet Index
                    1,                       // CLK =0 , BW =1
                    "NRT_BANDWIDTH",
                    Package()
                    {
                            "PSTATE",
                            0,                 // Chipversion list availabiliy
                           12000000000,
                           11500000000,
                           11000000000,
                           10500000000,
                           10000000000,
                            9500000000,
                            9000000000,
                            8500000000,
                            8000000000,
                            7500000000,
                            7000000000,
                            6500000000,
                            6000000000,
                            5500000000,
                            5000000000,
                            4500000000,
                            4000000000,
                            3500000000,
                            3300000000,
                            3100000000,
                            2900000000,
                            2700000000,
                            2500000000, 
                            2300000000, 
                            2100000000, 
                            1900000000, 
                            1700000000, 
                            1500000000, 
                            1300000000,
                            1100000000,
                             900000000,
                             700000000,
                             500000000,
                             400000000,
                             300000000,
                             200000000,
                             100000000,
                                     0,
                    },
                },
            },
            Package()
            {
                "COMPONENT",
                1,                      // Platform = 0 
                Package()
                { 
                    "PSTATE_SET",
                    0,                       // PStateSet Index
                    1,                       // CLK =0 , BW =1
                    "HF0_UNCOMP_BANDWIDTH",
                    Package()
                    {
                        "PSTATE",
                        0,                 // Chipversion list availabiliy
                        1100000000,
                         400000000,
                         300000000,
                         200000000,
                         100000000,
                                 0,
                    },
                },
                Package()
                { 
                    "PSTATE_SET",
                    1,                       // PStateSet Index
                    1,                       // CLK =0 , BW =1
                    "HF0_BANDWIDTH",
                    Package()
                    {
                        "PSTATE",
                        0,                 // Chipversion list availabiliy
                        1100000000,
                         400000000,
                         300000000,
                         200000000,
                         100000000,
                                 0,
                    },
                },
                Package()
                { 
                    "PSTATE_SET",
                    2,                       // PStateSet Index
                    1,                       // CLK =0 , BW =1
                    "NRT_UNCOMP_BANDWIDTH",
                    Package()
                    {
                        "PSTATE",
                        0,                 // Chipversion list availabiliy
                        1100000000,
                         400000000,
                         300000000,
                         200000000,
                         100000000,
                                 0,
                    },
                },
                Package()
                { 
                    "PSTATE_SET",
                    3,                       // PStateSet Index
                    1,                       // CLK =0 , BW =1
                    "NRT_BANDWIDTH",
                    Package()
                    {
                        "PSTATE",
                        0,                 // Chipversion list availabiliy
                        1100000000,
                         400000000,
                         300000000,
                         200000000,
                         100000000,
                                 0,
                    },
                },
            },
        })

        Return (EBUF)
    }
}

//
// Primary Rear Camera (IMX363)
//
Device (CAMS)
{
    Name (_DEP, Package(0x1)
    {
        \_SB_.MPCS                              // MPCS has dependency on CAMP, which eventually ends up with PEP0 and PMIC
    })

    Name (_HID, "QCOM0245")
    Name (_UID, 21)

    // Return 0x0 to disable CAMS sensor
    Method (_STA)
    {
        Return (0xf)
    }

    //
    // SENSOR CONFIGURATION (SCFG) METHOD
    //
    // [1/2] Driver/Tuning binary file name (no more than 50 characters)
    //
    // [3] I2C Slave Information for Sensor Probing
    //------------------------|-----------/-----------|-----------------------|------------------------
    // 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 09 08 07 06 05 04 03 02 01 00 | << BIT INDEX
    //          RESERVED            | DTT | ADT | FRQ |                 SLAVE ADDRESS                  | << MEANING
    // -----------------------------|-----|-----|-----|------------------------------------------------
    // 0b                             0  0  0  1  0  1               FROM IMX318 REG MAP               | << 0x50034
    // -----------------------|-----------/-----------|-----------------------|-----------/------------
    // Register Data Type (DTT):    0b00 -- CAMERA_I2C_BYTE_DATA, 0b01 -- WORD, 0b10 -- DWORD
    // Register Address Type (ADT): 0b00 -- CAMERA_I2C_BYTE_ADDR, 0b01 -- WORD, 0b10 -- 3B
    // I2C Frequency mode:          0b00 -- 100 KHz (standard), 0b01 -- 400 KHz (fast), 0b10 -- 1 MHz (fast_plus).
    //
    // [4] Slave Data Part 1 for and from Probing
    // Expected Reading (16 bits; 0x363) + Register Address (16 bits; 0x16)
    // 
    // [5] Slave Data Part 2 for and from Probing
    // Same format as above; Reserved for Revision # (if applied)

    Method (SCFG, 0x0, Serialized)
    {
        Return
        (
            Package()
            {
                Package ()
                {
                    "com.qti.sensormodule.imx363.bin",   // [1] Driver binary file name
                    "com.qti.tuned.semco_imx363.bin",          // [2] Tuning binary file name
                    0x00050034,                                 // [3] I2C Slave Information for Sensor Probing
                    0x03630016,                                 // [4] Slave Data Part 1 for and from Probing
                    0x00000000                                  // [5] Slave Data Part 2 for and from Probing; Reserved
                }
            }
        )
    }

    // PEP Proxy Support
    Name(PGID, Buffer(10) {"\\_SB.CAMS"})       // Device ID buffer - PGID (Pep given ID)

    Name(DBUF, Buffer(DBFL) {})                 // Device ID buffer - PGID (Pep given ID)
    CreateByteField(DBUF, 0x0, STAT)            // STATUS 1 BYTE
                                                // HIDDEN 1 BYTE (SIZE)
    CreateByteField(DBUF, 2, DVAL)              // Packet value, 1 BYTES Device Status
    CreateField(DBUF, 24, 160, DEID)            // Device ID, 20 BYTES (160 Bits)
 
    Method (_S1D, 0) { Return (3) }             // S1 => D3
    Method (_S2D, 0) { Return (3) }             // S2 => D3
    Method (_S3D, 0) { Return (3) }             // S3 => D3

    Method(_PS0, 0x0, NotSerialized)
    {
        Store(Buffer(ESNL){}, DEID)
        Store(0, DVAL)
        Store(PGID, DEID)
        If(\_SB.ABD.AVBL)
        {
            Store(DBUF, \_SB.PEP0.FLD0)
        }
    }

    Method(_PS3, 0x0, NotSerialized)
    {
        Store(Buffer(ESNL){}, DEID)
        Store(3, DVAL)
        Store(PGID, DEID)
        If(\_SB.ABD.AVBL)
        {
            Store(DBUF, \_SB.PEP0.FLD0)
        }
    }
}

// 
// Primary Front Camera (IMX258)
//
Device (CAMF)
{
    Name (_DEP, Package(0x1)
    {
        \_SB_.MPCS
    })

    Name (_HID, "QCOM024A")
    Name (_UID, 26)

    // Return 0x0 to disable CAMF sensor
    Method (_STA)
    {
        Return (0x0)
    }

    Method (SCFG, 0x0, Serialized)
    {
        Return
        (
            Package()
            {
                Package ()
                {
                    "com.qti.sensormodule.semco_imx258.bin",
                    "com.qti.tuned.semco_imx258.bin",
                    0x00150034,                                 // I2C Slave Info for Probing, primary address 0x34, secondary 0x20
                    0x02580016,
                    0x00000000
                }
            }
        )
    }

    // PEP Proxy Support
    Name(PGID, Buffer(10) {"\\_SB.CAMF"})       // Device ID buffer - PGID (Pep given ID)

    Name(DBUF, Buffer(DBFL) {})                 // Device ID buffer - PGID (Pep given ID)
    CreateByteField(DBUF, 0x0, STAT)            // STATUS 1 BYTE
                                                // HIDDEN 1 BYTE (SIZE)
    CreateByteField(DBUF, 2, DVAL)              // Packet value, 1 BYTES Device Status
    CreateField(DBUF, 24, 160, DEID)            // Device ID, 20 BYTES (160 Bits)
 
    Method (_S1D, 0) { Return (3) }             // S1 => D3
    Method (_S2D, 0) { Return (3) }             // S2 => D3
    Method (_S3D, 0) { Return (3) }             // S3 => D3

    Method(_PS0, 0x0, NotSerialized)
    {
        Store(Buffer(ESNL){}, DEID)
        Store(0, DVAL)
        Store(PGID, DEID)
        If(\_SB.ABD.AVBL)
        {
            Store(DBUF, \_SB.PEP0.FLD0)
        }
    }

    Method(_PS3, 0x0, NotSerialized)
    {
        Store(Buffer(ESNL){}, DEID)
        Store(3, DVAL)
        Store(PGID, DEID)
        If(\_SB.ABD.AVBL)
        {
            Store(DBUF, \_SB.PEP0.FLD0)
        }
    }
}

//
// Auxiliary sensor (OV2281, IRIS)
//
Device (CAMI)
{
    Name (_DEP, Package(0x1)
    {
        \_SB_.MPCS
    })

    Name (_HID, "QCOM0247")
    Name (_UID, 28)

    // Return 0x0 to disable CAMI sensor
    Method (_STA)
    {
        Return (0x0)
    }

    Method (SCFG, 0x0, Serialized)
    {
        Return
        (
            Package()
            {
                Package ()
                {
                    "com.qti.sensormodule.sunny_ov2281.bin",
                    "UPDATEME.bin",                             // NEED UPDATE!!!
                    0x00150020,
                    0x0056300A,
                    0x00000000
                }
            }
        )
    }

    // PEP Proxy Support
    Name(PGID, Buffer(10) {"\\_SB.CAMI"})       // Device ID buffer - PGID (Pep given ID)

    Name(DBUF, Buffer(DBFL) {})                 // Device ID buffer - PGID (Pep given ID)
    CreateByteField(DBUF, 0x0, STAT)            // STATUS 1 BYTE
                                                // HIDDEN 1 BYTE (SIZE)
    CreateByteField(DBUF, 2, DVAL)              // Packet value, 1 BYTES Device Status
    CreateField(DBUF, 24, 160, DEID)            // Device ID, 20 BYTES (160 Bits)
 
    Method (_S1D, 0) { Return (3) }             // S1 => D3
    Method (_S2D, 0) { Return (3) }             // S2 => D3
    Method (_S3D, 0) { Return (3) }             // S3 => D3

    Method(_PS0, 0x0, NotSerialized)
    {
        Store(Buffer(ESNL){}, DEID)
        Store(0, DVAL)
        Store(PGID, DEID)
        If(\_SB.ABD.AVBL)
        {
            Store(DBUF, \_SB.PEP0.FLD0)
        }
    }

    Method(_PS3, 0x0, NotSerialized)
    {
        Store(Buffer(ESNL){}, DEID)
        Store(3, DVAL)
        Store(PGID, DEID)
        If(\_SB.ABD.AVBL)
        {
            Store(DBUF, \_SB.PEP0.FLD0)
        }
    }
}

//
// CAMERA WHITE LED FLASH
//
Device (FLSH)
{
    Name (_DEP, Package(0x1)
    {
        \_SB_.CAMP 
    })

    Name (_HID, "QCOM025C")
    Name (_UID, 25)

    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            // "GPIO Interrupt Connection Resource Descriptor Macro" Format (ACPI $19.5.53):
            // GpioInt (EdgeLevel, ActiveLevel, Shared, PinConfig, DebounceTimeout, ResourceSource,
            //           ResourceSourceIndex, ResourceUsage, DescriptorName, VendorData) {PinList}
        })

        Return (RBUF)
    }
}
