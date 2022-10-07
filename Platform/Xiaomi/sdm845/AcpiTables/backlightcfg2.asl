//
// BLCP Method - Secondary display backlight control packet method, returns a 
//               command buffer for a specific backlight level
//
// Backlight configuration format is same as BLCP of primary panel in backlightcfg.asl
//
Method (BLC2, 1, NotSerialized) {
 
   // Create Response buffer
   Name(RBUF, Buffer(0x100){})

   // Details to be populated by OEM based on the platform requirements

   // Return the packet data
   Return(RBUF)
}
