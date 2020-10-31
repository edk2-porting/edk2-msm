//
// Copyright (c) 2017,2019 Mmoclauq Technologies Inc. All rights reserved.
//
// This file contains the QUPv3 ACPI device definitions.
// GPI is the interface used by buses drivers for different peripherals.
//

//
//  Device Map:
//    QGPI
//
//  List of Devices

Device (QGP0)
{
    Name (_HID, "QCOM02F4")  // _HID: Hardware ID
    Alias (PSUB, _SUB)
    Name (_UID, Zero)  // _UID: Unique ID
    Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x00804000,         // Address Base
                0x00050000,         // Address Length
                )
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x00000119,
            }
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x0000011B,
            }
        })
        Return (RBUF) /* \_SB_.QGP0._CRS.RBUF */
    }

    Method (GPII, 0, Serialized)
    {
        Return (Package (0x02)
        {
            Package (0x03)
            {
                Zero, 
                0x05, 
                0x0119
            }, 

            Package (0x03)
            {
                Zero, 
                0x07, 
                0x011B
            }
        })
    }
}

Device (QGP1)
{
    Name (_HID, "QCOM02F4")  // _HID: Hardware ID
    Alias (PSUB, _SUB)
    Name (_UID, One)  // _UID: Unique ID
    Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x00A04000,         // Address Base
                0x00050000,         // Address Length
                )
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x00000138,
            }
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x0000013A,
            }
        })
        Return (RBUF) /* \_SB_.QGP1._CRS.RBUF */
    }

    Method (GPII, 0, Serialized)
    {
        Return (Package (0x02)
        {
            Package (0x03)
            {
                One, 
                One, 
                0x0138
            }, 

            Package (0x03)
            {
                One, 
                0x03, 
                0x013A
            }
        })
    }
}
