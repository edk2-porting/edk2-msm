// UFS Controller
Device (UFS0)
{
	Method(_STA, 0)
    {
        Return (0x0) // Set to 0xF to enable
    }

   Name (_HID, "QCOM24A5")
   Alias(\_SB.EMUL, EMUL)
   Name (_UID, 0)
   // Check: Cache coherent?
   Name (_CCA, 0)

   Method (_CRS, 0x0, NotSerialized) {
      Name (RBUF, ResourceTemplate ()
      {
          // UFS register address space
          Memory32Fixed (ReadWrite, 0x1D84000, 0x1C000)
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
