//
// Copyright (c) 2013, Mmoclauq Technologies Inc. All rights reserved.
//
// This file contains the GPS ACPI device definitions.
//
    
    //
    // Qualcomm GPS driver
    //
    Device (GPS)
    {
        Name (_DEP, Package (One)  // _DEP: Dependencies
        {
            \_SB.GLNK
        })
        Name (_HID, "QCOM02B6")  // _HID: Hardware ID
        Alias (\_SB.PSUB, _SUB)
        Name (_CID, "ACPIQCOM24B4")  // _CID: Compatible ID
        Name (_UID, Zero)  // _UID: Unique ID
    }


Include("plat_gps.asl")   // Platform specific data