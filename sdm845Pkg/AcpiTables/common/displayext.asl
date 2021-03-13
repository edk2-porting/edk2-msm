//
// This file contains the ACPI Extensions for External Display Adapters
//

//
// ROE1 Method - Used to retrieve proprietary ROM data for External display
//
Method (ROE1, 3, NotSerialized) {

   // Include external panel specific ROM data
   Include("panelcfgext.asl")

   // Store the panel configuration
   Store (PCFG, Local2)

   // Ensure offset does not exceed the buffer size 
   // otherwise return a Null terminated buffer
   If (LGreaterEqual(Arg0, Sizeof(Local2)))
   {
      Return( Buffer(){0x0} )
   }
   Else
   {
        // Make a local copy of the offset
      Store(Arg0, Local0)        
   }

   // Ensure the size requested is less than 4k
   If (LGreater(Arg1, 0x1000))
   {
      Store(0x1000, Local1)
   }
   else
   {
      Store(Arg1, Local1)
   }

   // Finaly ensure the total size does not exceed the size of the buffer
   if (LGreater(Add(Local0, Local1), Sizeof(Local2)))
   {
       // Calculate the maximum size we can return
       Subtract(Sizeof(Local2), Local0, Local1);
   }

   // Multiply offset and size by 8 to convert to bytes and create the RBuf
   CreateField(Local2, Multiply(0x8, Local0), Multiply(0x8, Local1), RBUF)

   Return(RBUF)
}
