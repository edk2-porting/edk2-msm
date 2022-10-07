//
// This file contains the ACPI Extensions for Display Adapters
//

// Include primary panel specific ROM data
//Include("panelcfg.asl")
//Include("panelcfg2.asl")

//Check if 0x01 on IC15 is present
//If it is, return tianma panel config
//Method (PNPC, 0, NotSerialized) {

    // OperationRegion(TOP1, GenericSerialBus, 0x00, 0x100) // GenericSerialBus device at command value offset 0
    // Field(TOP1, BufferAcc, NoLock, Preserve)
    // {
    //     Connection(I2cSerialBusV2 (0x0001, ControllerInitiated, 0x00061A80,
    //                     AddressingMode7Bit, "\\_SB.IC15",
    //                     0x00, ResourceConsumer, , Exclusive,
    //                     )),
    //     AccessAs(BufferAcc, AttribQuick), // Use the GenericSerialBus Read/Write Quick protocol
    //     FLD0, 8 // Virtual register at command value 0.
    // }
    // /* Create the GenericSerialBus data buffer */
    // Name(BUFF, Buffer(2){}) // Create GenericSerialBus data buffer as BUFF
    // CreateByteField(BUFF, 0x00, STAT) // STAT = Status (Byte)
    // /* Signal device (e.g. OFF) */
    // Store(FLD0, BUFF) // Invoke Read Quick transaction
    // If(LEqual(STAT, 0x00)) // Successful?
    // {
    //     Return(PCFA)
    // }
    // Else
    // {
    //     Return(PCFB)
    // }

    //Return(PCFB)
//}


///
// _ROM Method - Used to retrieve proprietary ROM data for primary panel
//
Method (_ROM, 3, NotSerialized) {




   //======================================================================================
   //  Based on the panel Id(Arg2), store the buffer object into Local2
   //
   //  IMPORTANT:
   //       PCFG is buffer name for all default panel configurations
   //       All other dynamically detected panel configurations must not use this name
   //======================================================================================

   Local2 = PCFA

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
// IGC method - panel inverse gamma correction table.
//
// The buffer contains inverse gamma correction data for 3 color components, each with 256 16-bit integers.
// The buffer size is 3*256*2 = 1536 bytes.
// each table entry is represend by a 16-bit integer and data format in the buffer is described below:
//
// +--- 16 bits ---+--- 16 bits ---+--- 16 bits ---+---------+--- 16 bits ---+   0
// |    Red[0]     |    Red[1]     |    Red[2]     |   ...   |    Red[255]   |
// +---------------+---------------+---------------+---------+---------------+   512
// |    Green[0]   |    Green[1]   |    Green[2]   |   ...   |    Green[255] |
// +---------------+---------------+---------------+---------+---------------+   1024
// |    Blue[0]    |    Blue[1]    |    Blue[2]    |   ...   |    Blue[255]  |
// +---------------+---------------+---------------+---------+---------------+   1536
//
Method (PIGC, 2, NotSerialized) {
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
// PCC method - panel color correction matrix
//
// Buffer format for HW which support 3X8 color correction matrix.
//
// The buffer contains color correction coefficients for 3 color components, each with 11 64-bit integers.
// The buffer size is 3*11*8 = 264 bytes.
// each coefficient in the matrix is represented by a long long integer (64-bit), and data format in the 
// buffer is described below:
//
// +--64 bits--+--64 bits--+--------+--64 bits--+--64 bits--+--64 bits--+--64 bits--+    0
// |  Red[0]   |  Red[1]   |  ...   |  Red[7]   |     0     |     0     |    0      |
// +-----------+-----------+--------+-----------+-----------+-----------+-----------+    88
// |  Green[0] |  Green[1] |  ...   |  Green[7] |     0     |     0     |    0      |
// +-----------+-----------+--------+-----------+-----------+-----------+-----------+    176
// |  Blue[0]  |  Blue[1]  |  ...   |  Blue[7]  |     0     |     0     |    0      |
// +-----------+-----------+--------+-----------+-----------+-----------+-----------+    264
//
// Buffer format for HW which support 3X11 color correction matrix.
//
// The buffer contains color correction coefficients for 3 color components, each with 11 64-bit integers.
// The buffer size is 3*11*8 = 264 bytes.
// each coefficient in the matrix is represented by a long long integer (64-bit), and data format in the 
// buffer is described below:
//
// +--- 64 bits ---+--- 64 bits ---+--- 64 bits ---+-----------+--- 64 bits ---+    0
// |    Red[0]     |    Red[1]     |    Red[2]     |    ...    |    Red[10]    |
// +---------------+---------------+---------------+-----------+---------------+    88
// |   Green[0]    |   Green[1]    |   Green[2]    |    ...    |   Green[10]   |
// +---------------+---------------+---------------+-----------+---------------+    176
// |    Blue[0]    |    Blue[1]    |    Blue[2]    |    ...    |    Blue[10]   |
// +---------------+---------------+---------------+-----------+---------------+    264
//
Method (PPCC, 2, NotSerialized) {
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
// PGC method - panel segment gamma correction table
//
// there're thee components and each with 16 gamma correction segments. Each segment is defined
// as below with parameters, and each parameter is represented by a 32-bit integer (DWORD):
//
// +--4 bytes--+--4 bytes--+--4 bytes--+--4 bytes--+
// |  enable   |   start   |   gain    |   offset  |        one gamma correction segment(16 bytes)
// +-----------+-----------+-----------+-----------+
//
// +--- 16 bytes ---+--- 16 bytes ---+--- 16 bytes ---+-----------+--- 16 bytes ---+    0
// |   red_seg[0]   |  red_seg[1]    |  red_seg[2]    |    ...    |  red_seg[15]   |
// +----------------+----------------+----------------+-----------+----------------+    256
// |  green_seg[0]  |  green_seg[1]  |  green_seg[2]  |    ...    |  green_seg[15] |
// +----------------+----------------+----------------+-----------+----------------+    512
// |   blue_seg[0]  |   blue_seg[1]  |   blue_seg[2]  |    ...    |   blue_seg[15] |
// +----------------+----------------+----------------+-----------+----------------+    768
//
Method (PGCT, 2, NotSerialized) {
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
// PLGC method - panel linear gamma correction table
//
// There are three color components, each color component has 1024 entries. each entry is 2 bytes.
//
// +--- 2 bytes ---+--- 2 bytes ---+--- 2 bytes ---+-----------+--- 2 bytes ---+   0
// |     red[0]    |    red[1]     |    red[2]     |    ...    |   red[1023]   |
// +---------------+---------------+---------------+-----------+---------------+   2048
// |    green[0]   |    green[1]   |    green[2]   |    ...    |   green[1023] |
// +---------------+---------------+---------------+-----------+---------------+   4096
// |    blue[0]    |    blue[1]    |    blue[2]    |    ...    |   blue[1023]  |
// +---------------+---------------+---------------+-----------+---------------+   6144
//
Method (PLGC, 3, NotSerialized) {
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
// HSIC method - HSIC settings
//
// Hue, Saturation, Intensity, Contrast levels, the first parameter enable/disable HSIC control,
// followed by HSIC level values, each level ranges from -100 to 100, represented by a 32-bit integer:
//
// +--4 bytes--+--4 bytes--+--4 bytes--+--4 bytes--+--4 bytes--++
// |  Enable   |    Hue    | Saturation| Intensity |  Contrast  |
// +-----------+-----------+-----------+-----------+-----------++
//
//
Method (HSIC, 2, NotSerialized) {
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
// PGMT - panel gamut mapping table for HW which support 9x9x9 gamut mapping:
//
//   This method returns the gamut mapping table for a panel.
//
//   There are three components. Each component has 8 tables and a total of 729 entries. 
//   Each value is represented by a 16-bit integer:
//
//   Table ID     Entries 
//      0           125 
//      1           100
//      2            80
//      3           100
//      4           100
//      5            80
//      6            64
//      7            80   
//
// +----- 16 bits -----+----- 16 bits ------+----- 16 bits -----+-----------+----- 16 bits -------+
// | red_comp[0][0]    |   red_comp[0][1]   |  red_comp[0][2]   |    ...    |  red_comp[7][79]    |
// +-------------------+--------------------+-------------------+---------------------------------+
// | green_comp[0][0]  |  green_comp[0][1]  | green_comp[0][2]  |    ...    |  green_comp[7][79]  |
// +-------------------+--------------------+-------------------+---------------------------------+
// | blue_comp[0][0]   |  blue_comp[0][1]   | blue_comp[0][2]   |    ...    |  blue_comp[7][79]   |
// +-------------------+--------------------+-------------------+---------------------------------+
//
Method (PGMT, 2, NotSerialized) {
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
// PWGM - panel gamut mapping data for HW which support 17x17x17 gamut mapping
// 
// This data's header which has two fields: 
//      NumSamplesPerColorComponent:  Number samples per color component in gamut mapping table.
//      NumSegmentsPerColor        :  Number of segments per color component.
//                                    NumSegmentsPerColor must equal 0 or NumSamplesPerColorComponent -1.
//
// This data also can have two tables, one is 3d table, one is segment table.
// Segment table is only required if NumSegmentsPerColor != 0.
// 
//   3d table:      There are three components. If number samples per component is N = NumSamplesPerColorComponent,
//                  total entries are NxNxN per component. Each value is represented by a 16-bit integer:
//   Segment table: There are three components, table entries are uNumSegmentsPerColor per component, 
//                  each entry is 32 bit value. 
// 
// Table data header:
// +--------- 32 bits ----------+------- 32 bits -----+
// | NumSamplesPerColorComponent| NumSegmentsPerColor |
// +----------------------------+---------------------+                                                      8 bytes
//
// 3d table:
// +---- 16 bits ----+---- 16 bits ----+---- 16 bits ----+-------------+------- 16 bits -----------+  8
// |  red_comp[0]    |  red_comp[1]    |  red_comp[2]    |     ...     | red_comp[N x N x N - 1 ]  |
// +-----------------+-----------------+-----------------+-------------+---------------------------+  NxNxNx2 + 8
// |  green_comp[0]  |  green_comp[1]  |  green_comp[2]  |     ...     | green_comp[N x N x N - 1] |
// +-----------------+-----------------+-----------------+-------------+---------------------------+  2xNxNxNx2 + 8
// |  blue_comp[0]   |  blue_comp[1]   |  blue_comp[2]   |     ...     | blue_comp[N x N x N - 1]  |
// +-----------------+-----------------+-----------------+-------------+---------------------------+  3xNxNxNx2 + 8
//
// Segment table: ( if NumSegmentsPerColor = 0, there is no segment table).
// +----- 32 bits ------+----- 32 bits ------+------ 32 bits -----+-------------+-------- 32 bits -------+  3xNxNxNx2 + 8
// |  sg_red_comp[[0]   |  sg_red_comp[1]    |  sg_red_comp[2]    |     ...     |  sg_red_comp[N-2]      |
// +--------------------+--------------------+--------------------+-------------+------------------------+  (N-1)x4 + 3xNxNxNx2 + 8
// |  sg_green_comp[0]  |  sg_ green_comp[1] |  sg_ green_comp[2] |     ...     |  sg_green_comp[N-2]    |
// +--------------------+--------------------+--------------------+-------------+------------------------+  2x(N-1)x4 + 3xNxNxNx2 + 8
// |  sg_ blue_comp[0]  |  sg_  blue_comp[1] |  sg_ blue_comp[2]  |     ...     |  sg_ blue_comp[N-2]    |
// +--------------------+--------------------+------------------- +-------------+------------------------+  3x(N-1)x4 + 3xNxNxNx2 + 8
//
// Maximum size = 3 x(17 - 1) x 4 + 3 x 17 x 17 x 17 x 2 + 8 = 29678 bytes.
//
Method (PWGM, 2, NotSerialized) {
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
// PGRT - panel gamma response table
//
//   This method returns the Gamma response table for a panel.
//   The table is given in 2 arrays, one representing the x axis or grayscale and other 
//   representing the y axis or luminance. 
//
//   The table is given in a 256 entries array, where the first entry value represents
//   the luminance (Y) achieved when displaying black on the screen (shade value is 0
//   for all R, G and B) and the last entry represents the luminance (Y) achieved when 
//   displaying white on the screen (shade value is 255 for all R, G and B).
// 
//   The array must be 256 entries.
//
//   The range of each entry must be from 0 to 0xffff
//
//   Values are least significant byte first. E.g. {0x01, 0x00} represents 0x1 and
//   {0x02, 0x01} represents 0x0102
//
// +--- 2 bytes ---+--- 2 bytes ---+--- 2 bytes ---+-----------+--- 2 bytes ---+ 
// |     Y[0]      |     Y[1]      |     Y[2]      |    ...    |     Y[255]    |
// +---------------+---------------+---------------+-----------+---------------+ 
Method (PGRT, 2, NotSerialized) {
    // Arg0 - Panel ID 
    
    // Arg1 - Data size  
    
    // Based on the panel Id read the GRT buffer and return the data
    
    // If nothing specified return NULL

    Name (RBUF, Buffer() {0x0})

    // Return the packet data
    Return(RBUF)
}


//
// PBRT - panel backlight response table
//
//   This method returns the Backlight response table for a panel.
//   The table is given in a 256 entries array, where the first entry value represents
//   the backlight level (BL) to achieve 0 luminance and the last entry represents  
//   the highest backlight level to achieve the maximum desired luminance. 
//   In other words, this array serves as a map from luminance to backlight levels,
//   where the index is the desired luminance level and the value (or output) is 
//   the backlight level to be sent to the hardware (backlight controller).
// 
//   The array must be 256 entries.
//
//   The range of each entry must be from 0 to 0xffff
//
//   Values are least significant byte first. E.g. {0x01, 0x00} represents 0x1 and
//   {0x02, 0x01} represents 0x0102
//
// +--- 2 bytes ---+--- 2 bytes ---+--- 2 bytes ---+-----------+--- 2 bytes ---+ 
// |    BL[0]      |    BL[1]      |    BL[2]      |    ...    |    BL[255]    |
// +---------------+---------------+---------------+-----------+---------------+ 
Method (PBRT, 2, NotSerialized) {
    // Arg0 - Panel ID 
    
    // Arg1 - Data size  
    
    // Based on the panel Id read the BRT buffer and return the data
    
    // If nothing specified return NULL

    Name (RBUF, Buffer() {0x0})
 
    // Return the packet data
    Return(RBUF)
}

//
// PBRC - panel backlight response curve for CABL
//
//   This method returns the Backlight response curve for a panel used specifically for CABL algorithm.
//   The curve is represented in a maximum 1024 x 2 elements array, where the first entry in each row 
//   will be backlight level and next entry will be correponding luminance value. In other words, 
//   this array serves as a map from backlight to luminance levels. 
     
//	 First row will be number of control points in the backlight curve. Maximum number of points allowed is 1024.
//   Points on the backlight response curve has to be specified in increasing order i.e last control point will 
//   correspond for maximum backlight value and first control point will correspond for minimum backlight value. 
 
//   The buffer must be of 4*(2*x + 1) bytes. where x < 1024 is number of control points.
//
//   The range of each backlight or luminance value must be from 0 to 0xffff. ( 2 bytes each )
//
//   Values are least significant byte first. E.g. {0x01, 0x00} represents 0x1 and
//   {0x02, 0x01} represents 0x0102.

// Below is an example of Backlight Response curve consisting of 5 control points.

// +----- 2 bytes -----------+----- 2 bytes ------+
// |   table_length          |                    | 
// +-------------------------+--------------------+
// |   BacklightLevel[0]     |  Luminance[0]      |  
// +-------------------------+--------------------+
// |   BacklightLevel[1]     |  Luminance[1]      |  
// +-------------------------+--------------------+
// |   BacklightLevel[2]     |  Luminance[2]      |  
// +-------------------------+--------------------+
// |   BacklightLevel[3]     |  Luminance[3]      |  
// +-------------------------+--------------------+
// |   BacklightLevel[4]     |  Luminance[4]      |  
// +-------------------------+--------------------+
Method (PBRC, 2, NotSerialized) {
    // Arg0 - Panel ID 
    
    // Arg1 - Data size  
    
    // Based on the panel Id read the BRC buffer and return the data
    
    // If nothing specified return NULL

   Name (RBUF, Buffer() {0x00,0x00})
     
   // Return the packet data
    Return(RBUF)
}

//
// DITH method - Dithering settings
//
// Dithering matrix could have following two formats:
//
// Format 1:
// +--1 byte--------+--1 byte--------+--1 byte--------+--1 byte--------+
// |  Element[0,0]  |  Element[0,1]  |  Element[0,2]  |  Element[0,3]  |
// |  Element[1,0]  |  Element[1,1]  |  Element[1,2]  |  Element[1,3]  |
// |  Element[2,0]  |  Element[2,1]  |  Element[2,2]  |  Element[2,3]  |
// |  Element[3,0]  |  Element[3,1]  |  Element[3,2]  |  Element[3,3]  |
// |  Bit Depth C2  |  Bit Depth C1  |  Bit Depth C0  |  Reserved(0x0) |
// +----------------+----------------+----------------+----------------+
// | Dithering mode (4 bytes) (0: not supported, 1:Spatial, 2:Temporal)|
// +----------------+----------------+----------------+----------------+
//
// There is dithering mode in Format 1.
//
// Format 2: 
//
// +--1 byte--------+--1 byte--------+--1 byte--------+--1 byte--------++
// |  Element[0,0]  |  Element[0,1]  |  Element[0,2]  |  Element[0,3]  |
// |  Element[1,0]  |  Element[1,1]  |  Element[1,2]  |  Element[1,3]  |
// |  Element[2,0]  |  Element[2,1]  |  Element[2,2]  |  Element[2,3]  |
// |  Element[3,0]  |  Element[3,1]  |  Element[3,2]  |  Element[3,3]  |
// |  Bit Depth C2  |  Bit Depth C1  |  Bit Depth C0  |  Reserved(0x0) |
// +----------------+----------------+----------------+----------------+
//
// There is no dithering mode in Format 2. Default dither mode: spatial.
//
Method (DITH, 2, NotSerialized) {
    // Arg0 - Panel ID 
    
    // Arg1 - Data size  
    
    // Based on the panel Id read the DITH buffer and return the data
    
    // If nothing specified return NULL
    // Create response buffer
    Name (RBUF, Buffer() {0x0} )

    // Return the packet data
    Return(RBUF)
}
// Include primary panel specific configuration for backlight control packets
//
Include("backlightcfg.asl")
