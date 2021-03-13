//
// This file contains the ACPI Extensions for Secondary Display Adapters
//

//
// ROM2 Method - Used to retrieve proprietary ROM data for secondary panel
//
Method (ROM2, 3, NotSerialized) {

   // Include secondary panel specific ROM data
   Include("panelcfg2.asl")

   //======================================================================================
   //  Based on the panel Id(Arg2), store the buffer object into Local2
   //
   //  IMPORTANT:
   //       PCFG is buffer name for all default panel configurations
   //       All other dynamically detected panel configurations must not use this name
   //======================================================================================
   Switch (  ToInteger (Arg2) )
   {
        // Default case
        Default {
            Store (PCFG, Local2)
        }
   }

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

//
// IGC2 method - panel inverse gamma correction table.
//
// Secondary panel IGC2 configuration, format is same as IGCT of primary
// panel in display.asl
//
Method (IGC2, 2, NotSerialized) {
    // Arg0 - Panel ID 
    
    // Arg1 - Data size

    // Based on the panel Id read the IGC buffer and return the data
    
    // If nothing specified return NULL
    
    // Create response buffer
    Name (RBUF, Buffer() {0x0} )

    // Return the packet data
    Return(RBUF)
}


//
// PCC2 method - panel color correction matrix
// Secondary panel PCC2 configuration, format is same as PPCC of primary
// panel in display.asl
//
Method (PCC2, 2, NotSerialized) {
    // Arg0 - Panel ID 
    
    // Arg1 - Data size  

    // Based on the panel Id read the PCC buffer and return the data
    
    // If nothing specified return NULL
    
    // Create response buffer
    Name (RBUF, Buffer() {0x0} )

    // Return the packet data
    Return(RBUF)
}


//
// GCT2 method - panel segment gamma correction table
// Secondary panel GCT2 configuration, format is same as PGCT of primary
// panel in display.asl
//
Method (GCT2, 2, NotSerialized) {
    // Arg0 - Panel ID 
    
    // Arg1 - Data size  
    
    // Based on the panel Id read the GCT buffer and return the data
    
    // If nothing specified return NULL

    // Create response buffer
    Name (RBUF, Buffer() {0x0} )

    // Return the packet data
    Return(RBUF)
}


//
// LGC2 method - panel linear gamma correction table
// Secondary panel LGC2 configuration, format is same as PLGC of primary
// panel in display.asl
//
Method (LGC2, 3, NotSerialized) {

    // Arg0 - Panel ID 
    // Arg1 - Data offset 
    // Arg2 - Data size 
    
    // Based on the panel Id read the LGC buffer and return the data
    
    // If nothing specified return NULL
    
    // Create response buffer
    Name (TBUF, Buffer() {0x0} )


   // Ensure offset does not exceed the buffer size 
   // otherwise return a Null terminated buffer
   If (LGreaterEqual(Arg1, Sizeof(TBUF)))
   {
       Return( Buffer(){0x0} )
   }
   Else
   {
       // Make a local copy of the offset
       Store(Arg1, Local1)        
   }
    
   // Arg2 - Data size  
   // Ensure the size requested is less than 4k
   If (LGreater(Arg2, 0x1000))
   {
       Store(0x1000, Local2)
   }
   else
   {
       Store(Arg2, Local2)
   }

   // Finaly ensure the total size does not exceed the size of the buffer
   if (LGreater(Add(Local1, Local2), Sizeof(TBUF)))
   {
       // Calculate the maximum size we can return
       Subtract(Sizeof(TBUF), Local1, Local2);
   }

   // Multiply offset and size by 8 to convert to bytes and create the RBUF
   CreateField(TBUF, Multiply(0x8, Local1), Multiply(0x8, Local2), RBUF)

    // Return the packet data
    Return(RBUF)
}


//
// HSI2 method - HSIC settings
// Secondary panel HSI2 configuration, format is same as HSIC of primary
// panel in display.asl
//
Method (HSI2, 2, NotSerialized) {
    // Arg0 - Panel ID 
    
    // Arg1 - Data size  
    
    // Based on the panel Id read the HSIC buffer and return the data
    
    // If nothing specified return NULL

    // Create response buffer
    Name (RBUF, Buffer() {0x0} )

    // Return the packet data
    Return(RBUF)
}



//
// GMT2 - panel gamut mapping table for HW which support 9x9x9 gamut mapping:
// Secondary panel GMT2 configuration, format is same as PGMT of primary
// panel in display.asl
//
Method (GMT2, 2, NotSerialized) {
    // Arg0 - Panel ID 
    
    // Arg1 - Data size  
    
    // Based on the panel Id read the GMT buffer and return the data
    
    // If nothing specified return NULL

    // Create response buffer
    Name (TBUF, Buffer() {0x0} )


   // Ensure offset does not exceed the buffer size 
   // otherwise return a Null terminated buffer
   If (LGreaterEqual(Arg0, Sizeof(TBUF)))
   {
        Return( Buffer(){0x0} )
   }
   Else
   {
       // Make a local copy of the offset
       Store(Arg0, Local0)        
   }
    
   // Arg1 - Data size  
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
   if (LGreater(Add(Local0, Local1), Sizeof(TBUF)))
   {
       // Calculate the maximum size we can return
       Subtract(Sizeof(TBUF), Local0, Local1);
   }

   // Multiply offset and size by 8 to convert to bytes and create the RBUF
   CreateField(TBUF, Multiply(0x8, Local0), Multiply(0x8, Local1), RBUF)


    // Return the packet data
    Return(RBUF)
}



//
// WGM2 - panel gamut mapping data for HW which support 17x17x17 gamut mapping
// Secondary panel WGM2 configuration, format is same as PWGM of primary
// panel in display.asl
//
Method (WGM2, 2, NotSerialized) {
    // Arg0 - Panel ID 
    
    // Arg1 - Data size  
    
    // Based on the panel Id read the WGM buffer and return the data
    
    // If nothing specified return NULL

    // Create response buffer
    Name (TBUF, Buffer() {0x0} )


   // Ensure offset does not exceed the buffer size 
   // otherwise return a Null terminated buffer
   If (LGreaterEqual(Arg0, Sizeof(TBUF)))
   {
    Return( Buffer(){0x0} )
   }
   Else
   {
        // Make a local copy of the offset
    Store(Arg0, Local0)        
   }
    
   // Arg1 - Data size  
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
   if (LGreater(Add(Local0, Local1), Sizeof(TBUF)))
   {
       // Calculate the maximum size we can return
       Subtract(Sizeof(TBUF), Local0, Local1);
   }

   // Multiply offset and size by 8 to convert to bytes and create the RBUF
   CreateField(TBUF, Multiply(0x8, Local0), Multiply(0x8, Local1), RBUF)


    // Return the packet data
    Return(RBUF)
}



//
// GRT2 - panel gamma response table
// Secondary panel GRT2 configuration, format is same as PGRT of primary
// panel in display.asl
//
Method (GRT2, 2, NotSerialized) {
    // Arg0 - Panel ID 
    
    // Arg1 - Data size  
    
    // Based on the panel Id read the GRT buffer and return the data
    
    // If nothing specified return NULL

    Name (RBUF, Buffer() {0x0})

    // Return the packet data
    Return(RBUF)
}


//
// BRT2 - panel backlight response table
// Secondary panel BRT2 configuration, format is same as PBRT of primary
// panel in display.asl
//
Method (BRT2, 2, NotSerialized) {
    // Arg0 - Panel ID 
    
    // Arg1 - Data size  
    
    // Based on the panel Id read the BRT buffer and return the data
    
    // If nothing specified return NULL

    Name (RBUF, Buffer() {0x0})
 
    // Return the packet data
    Return(RBUF)
}

//
// DIT2 method - Dithering settings
// Secondary panel DIT2 configuration, format is same as DITH of primary
// panel in display.asl
//
Method (DIT2, 2, NotSerialized) {
    // Arg0 - Panel ID 
    
    // Arg1 - Data size  
    
    // Based on the panel Id read the DITH buffer and return the data
    
    // If nothing specified return NULL

    // Create response buffer
    Name (RBUF, Buffer() {0x0} )

    // Return the packet data
    Return(RBUF)
}
// Include secondary panel specific configuration for backlight control packets
//
Include("backlightcfg2.asl")
