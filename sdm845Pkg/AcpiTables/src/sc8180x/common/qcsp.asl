//
// Copyright (c) 2017-2018, Mmoclauq Technologies, Inc. All rights reserved.
//

//
// Qualcomm Secure Procesor (QCSP) Driver
//
Device (QCSP)
{
      Name (_DEP, Package(0x3)
      {
         \_SB_.GLNK,
         \_SB_.TREE,
         \_SB_.SPSS
      })
      Name (_HID, "HID_QCSP")
	  Alias(\_SB.PSUB, _SUB)
	  
	// Disable QCSP  
    Method(_STA, 0)
    {
        return (0x0)
    }
	  
}
