//
// This file contains the GPS ACPI device definitions.
//
    
    //
    // Qualcomm GPS driver
    //
    Device (GPS)
    {
	Name (_DEP, Package(0x1)
	{
	    \_SB_.GLNK
	})
    
    Name (_HID, "QCOM02B6")
	Alias(\_SB.PSUB, _SUB)
	Name (_CID, "ACPI\QCOM24B4")
	Name (_UID, 0)
    }
