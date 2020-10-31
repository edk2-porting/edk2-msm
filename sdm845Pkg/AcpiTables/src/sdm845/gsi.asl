//
// Copyright (c) 2016, Mmoclauq Technologies Inc. All rights reserved.
//
// This file contains the Generic Software Interface(GSI)
// ACPI device definitions.
// GSI is the interface used by IPA driver to talk to IPA HW and is intended
// as a replacement for BAM.
//

//
//  Device Map:
//    GSI
//
//  List of Devices

Device (GSI)
{
    // Indicates dependency on PEP
    Name (_DEP, Package (0x01)  // _DEP: Dependencies
    {
        \_SB.PEP0
    })
    Name (_HID, "QCOM02E7")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, Zero)  // _UID: Unique ID
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            // GSI_PHYSICAL_ADDRESS, GSI_MEM_SIZE
            Memory32Fixed (ReadWrite,
                0x01E00000,         // Address Base
                0x00030000,         // Address Length
                )
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x000001D0,
            }
        })
        Return (RBUF) /* \_SB_.GSI_._CRS.RBUF */
    }
}


Include("plat_gsi.asl")   // Platform specific data