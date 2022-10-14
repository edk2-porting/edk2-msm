// UFS Controller
Device (UFS0)
{
 Name (_DEP, Package(0x1) 
 {
     \_SB.PEP0,
 })

   Name (_HID, "QCOM24A5")
   Alias(\_SB.PSUB, _SUB)
   Name (_CID, "ACPI\QCOM24A5")
   Name (_UID, 0)
   Name (_CCA, 0)

   Method (_CRS, 0x0, NotSerialized) {
      Name (RBUF, ResourceTemplate ()
      {
          // UFS register address space
          Memory32Fixed (ReadWrite, 0x1DA4000, 0x14000)
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
