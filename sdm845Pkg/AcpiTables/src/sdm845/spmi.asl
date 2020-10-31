//
// Copyright (c) 2014-2017, Mmoclauq Technologies, Inc. All rights reserved.
//

//
//SPMI driver.
//
Device(SPMI)
{
   Name (_HID, "QCOM0216")  // _HID: Hardware ID
   Alias (\_SB.PSUB, _SUB)
   Name (_CID, "PNP0CA2")  // _CID: Compatible ID
   Name (_UID, One)  // _UID: Unique ID
   Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
   Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
   {
       Name (RBUF, ResourceTemplate ()
       {
           Memory32Fixed (ReadWrite,
               0x0C400000,         // Address Base
               0x02800000,         // Address Length
               )
       })
       Return (RBUF) /* \_SB_.SPMI._CRS.RBUF */
   }

   Include("spmi_conf.asl")
}
