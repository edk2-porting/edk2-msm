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
Name (BLBK, Zero)
Method (BLCP, 1, Serialized)
{
                Name (RBUF, Buffer (0x0100){})
                Local0 = Zero
                CreateField (RBUF, (Local0 * 0x08), 0x20, PKHR)
                Local0 += 0x04
                CreateField (RBUF, (Local0 * 0x08), 0x08, PKCM)
                Local0 += One
                CreateField (RBUF, (Local0 * 0x08), 0x08, PKDS)
                Local0 += One
                CreateField (RBUF, (Local0 * 0x08), 0x08, PKUB)
                Local0 += One
                CreateField (RBUF, (Local0 * 0x08), 0x08, PKLB)
                Local0 += One
                Name (BON, Buffer (0x03)
                {
                     0x39, 0x53, 0x28                                 // 9S$
                })
                CreateField (RBUF, (Local0 * 0x08), 0x20, PKH2)
                Local0 += 0x04
                CreateField (RBUF, (Local0 * 0x08), 0x20, PKP2)
                PKH2 = SizeOf (BON)
                PKP2 = BON /* \_SB_.GPU0.BLCP.BON_ */
                Local0 += SizeOf (BON)
                CreateDWordField (RBUF, (Local0 * 0x08), EOF)
                Local1 = 0;
                Local2 = 0;
	If(LLessEqual(Arg0, 0x300))
	{	
                	Local1 = (BLBK / 0x188)
	                Local2 = (BLBK / 0x188)
	}
	Else
	{
                	Local1 = (Arg0 / 0x188)
	                Local2 = (Arg0 / 0x188)
		BLBK = Arg0
	}
                Local1 &= 0xFF
	ShiftRight(Local2, 8, Local2)
                Local2 &= 0x03
                PKHR = 0x04
                PKCM = 0x39
                PKDS = 0x51
	PKUB = Local2
                PKLB = Local1
                EOF = Zero
                Return (RBUF) /* \_SB_.GPU0.BLCP.RBUF */
}

