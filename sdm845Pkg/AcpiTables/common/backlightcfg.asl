///
// BLCP Method - Backlight control packet method, returns a 
//               command buffer for a specific backlight level
//
// Input Parameters
//    Backlight level - Integer from 0% to 100%
//
// Output Parameters
//
// Packet format:
//   +--32bits--+-----variable (8bit alignment)--+
//   |  Header  |       Packet payload           |
//   +----------+--------------------------------+
//
//  For DSI Command packets, payload data must be in this format
//
//  +-- 8 bits-+----variable (8bit alignment)----+
//  | Cmd Type |           Packet Data           |
//  +----------+---------------------------------+
//
//  For I2C Command packets, payload data must be in this format
//
//  +-- 16 bits-+----variable (8bit alignment)----+
//  |  Address  |         Command Data            |
//  +-----------+---------------------------------+
//
//  All packets must follow with a DWORD header with 0x0
//
Method (BLCP, 1, NotSerialized) {
 
   // Create Response buffer
   Name(RBUF, Buffer(0x100){})

   // Details to be populated by OEM based on the platform requirements

   // Return the packet data
   Return(RBUF)
}
