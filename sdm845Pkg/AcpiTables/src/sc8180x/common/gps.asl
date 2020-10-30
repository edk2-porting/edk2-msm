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
      Name (_DEP, Package(0x1)
      {
         \_SB_.GLNK
      })
      Name (_HID, "HID_GPS")
      Alias(\_SB.PSUB, _SUB)
      Name (_UID, 0)
    }
    

Include("plat_gps.asl")   // Platform specific data