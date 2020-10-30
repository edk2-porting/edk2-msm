//
// Copyright (c) 2017, Mmoclauq Technologies, Inc. All rights reserved.
//

// UFS Controller
Device (UFS0)
{

	Method(_STA, 0)
    {
        if(LEqual(STOR, 1)) {
            Return (0xF) // booting from UFS so ufs.asl is enabled
        } 
        else {
            Return (0x0) // ufs.asl is diabled 
        }
    }
	
   Name (_DEP, Package(0x1) 
   {
       \_SB.PEP0,
   })

   Name (_HID, "HID_UFS0")
   Alias(\_SB.PSUB, _SUB)
   Name (_UID, 0)
   Name (_CCA, 1)

   Method (_CRS, 0x0, NotSerialized) {
      Name (RBUF, ResourceTemplate ()
      {
          // UFS register address space
          Memory32Fixed (ReadWrite, 0x1D84000, 0x14000)
          Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {297}
      })
      Return (RBUF)
   }

   // UFS Device
   Device (DEV0) 
   {
      // Memory Type
      Method (_ADR) 
      {
           Return (8)
      }  
        
      // Non-removable
      Method (_RMV) 
      {
           Return (0)
      }       
   }  
 }
 
Device (UFS1)
{
    Method(_STA, 0)
    {
        if(LEqual(SUFS, 1)) {
            if(LEqual(STOR, 1)) {
                Return (0xF) // Secondary UFS enabled and booting from UFS
            }
            else {
                Return (0x0) // Not booting from UFS 
            }
        } 
        else {
            Return (0x0) // Secondary UFS diabled 
        }
    }
	
   Name (_DEP, Package(0x1) 
   {
       \_SB.PEP0,
   })

   Name (_HID, "HID_UFS0")
   Alias(\_SB.PSUB, _SUB)
   Name (_UID, 1)
   Name (_CCA, 1)

   Method (_CRS, 0x0, NotSerialized) {
      Name (RBUF, ResourceTemplate ()
      {
          // UFS register address space
          Memory32Fixed (ReadWrite, 0x1D64000, 0x14000)
          Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {681}
      })
      Return (RBUF)
   }

   // UFS Device
   Device (DEV0) 
   {
      // Memory Type
      Method (_ADR) 
      {
           Return (8)
      }  
        
      // Non-removable
      Method (_RMV) 
      {
           Return (0)
      }       
   }  
 }

     
 

