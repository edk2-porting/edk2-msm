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
//  +-- 32 bits---+----variable (8bit alignment)----+----variable (8bit alignment)----+
//  | Packet size |      Register Address           |        Register Value           |
//  +-------------+---------------------------------+---------------------------------+
//
//  All packets must follow with a DWORD header with 0x0
//

Method (BLCP, 1, NotSerialized) {
 
  Name(RBUF, Buffer(0x100){})
  Store(0x0, LOCAL0)
  
  CreateField(RBUF, Multiply(LOCAL0, 8), 32, PKHR)
  Add(LOCAL0, 4, LOCAL0)
  
  CreateField(RBUF, Multiply(LOCAL0, 8), 8, PKCM)
  Add(LOCAL0, 1, LOCAL0)
  
  CreateField(RBUF, Multiply(LOCAL0, 8), 8, PKDS)
  Add(LOCAL0, 1, LOCAL0)
  
  CreateField(RBUF, Multiply(LOCAL0, 8), 8, PKUB)
  Add(LOCAL0, 1, LOCAL0)
  
  CreateField(RBUF, Multiply(LOCAL0, 8), 8, PKLB)
  Add(LOCAL0, 1, LOCAL0)
                
	// Add additonal ON command
	Name (BON, // Backlight on
	Buffer() {0x39, // Command 39
	0x53, 0x24}) // Manual backlight control

	// Create the packet header field
	CreateField(RBUF, Multiply(LOCAL0, 8), 32, PKH2) // Create the packet header
	Add(LOCAL0, 4, LOCAL0) // Increment the data pointer

	// Create the packet payload field
	CreateField(RBUF, Multiply(LOCAL0, 8), 32, PKP2) // Create the packet payload
	Store(Sizeof(BON), PKH2) // Store the size of the buffer in the header 
	Store(BON, PKP2) // Store the packet payload
	Add(LOCAL0, Sizeof(BON), LOCAL0) // Increment the offset by the packet size
                
  CreateDWordField(RBUF, Multiply(LOCAL0, 8), EOF)
  
  /*LOCAL1 = Arg0 * 10 // to map to 1024
  LOCAL2 = LOCAL1 >> 8
  LOCAL1 &= 0xFF*/
  
  LOCAL1 = Arg0 * 1023
  LOCAL1 /= 0xFF
  
  LOCAL2 = Arg0 * 1023
  LOCAL2 /= 0xFF00
  LOCAL2 &= 3
  
  PKHR = 4
  PKCM = 0x39
  PKDS = 0x51
  //PKUB = 0x00
  //PKLB = 0x10
  PKUB = LOCAL2
  PKLB = LOCAL1
  
  EOF = 0x0
  
  Return(RBUF)
}
