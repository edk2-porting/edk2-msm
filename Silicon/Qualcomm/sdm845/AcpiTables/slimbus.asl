//
// SLIMbus controller
//
Device (SLM1)
{
   Name (_ADR, 0)
   Name (_CCA, 0)
   Alias(\_SB.PSUB, _SUB)

   Method (_CRS, 0x0, NotSerialized) 
   {
      Name (RBUF, ResourceTemplate ()
      {
         // SLIMbus register address space
         Memory32Fixed (ReadWrite, 0x171C0000, 0x0002c000)

         Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {195}
      })
      Return (RBUF)
   }

   Method (CHLD)
   {
      Return (Package()
      {           
         "SLM1\\QCOM023F",
      })
   }

   Include("audio_bus.asl")
   
}

Device (SLM2)
{
   Name (_ADR, 1)
   Name (_CCA, 0)

   Method (_CRS, 0x0, NotSerialized) 
   {
      Name (RBUF, ResourceTemplate ()
      {
         // SLIMbus register address space
         Memory32Fixed (ReadWrite, 0x17240000, 0x0002c000)

         Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {323}
      })
      Return (RBUF)
   }
}
