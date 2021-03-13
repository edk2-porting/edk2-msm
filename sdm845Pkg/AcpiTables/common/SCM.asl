// 
// Secure Channel Manager (SCM) Driver
//
Device (SCM0)
{    
    Name (_HID, "QCOM0214")
	Alias(\_SB.PSUB, _SUB)
    Name (_UID, 0)
}

//
// TrEE Driver
//
Device (TREE)
{
    Name (_HID, "QCOM02BB")
	Alias(\_SB.PSUB, _SUB)
    Name (_UID, 0)
	
	 Method (IMPT)
    {
        Name(TPPK, Package()
        {
            Package ()
            {
                // Holds whether TPM is seperate app or not
                0x00000000,  // Will be filled by TPMA 
				// Holds TPM type
				0x00000000,  // Will be filled by TDTV 
				// Holds TrEE Carveout address
				0x00000000,  // Will be filled by TCMA 
				// Holds TrEE Carveout length
				0x00000000  // Will be filled by TCML                
            }
        })

        // Copy ACPI globals for Address for this subsystem into above package for use in driver
        Store (TPMA, Index(DeRefOf(Index (TPPK, 0)), 0))
		Store (TDTV, Index(DeRefOf(Index (TPPK, 0)), 1))
		Store (TCMA, Index(DeRefOf(Index (TPPK, 0)), 2))
		Store (TCML, Index(DeRefOf(Index (TPPK, 0)), 3))
        
        Return (TPPK)
    }
}
