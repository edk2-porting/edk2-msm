// This file contains the sensor ACPI device definitions.
//


// Qualcomm Sensor Collection
Device (SEN2)
{
    Name (_DEP, Package(0x3)
    {
        \_SB_.IPC0, //IPC Router used by QMI
        \_SB_.SCSS,  //SCSS loads the sensors image
	    \_SB_.ARPC  //Dependency on FastRPC
    })
    Name (_HID, "QCOM0308")
	Alias(\_SB.PSUB, _SUB)
	Name (_CID, "QCOM02A2")

// Enable below for Dual Sensor Multinode
//Device (SEN3)
//{
//    Name (_DEP, Package(0x4)
//    {
//        \_SB_.IPC0, //IPC Router used by QMI
//        \_SB_.SCSS,  //SCSS loads the sensors image
//        \_SB_.ARPC,  //Dependency on FastRPC
//        \_SB_.SEN2  //Dependency on SEN2
//    })
//    Name (_HID, "QCOM0309")
//	Alias(\_SB.PSUB, _SUB)
//    Name (_CID, "QCOM02A2")
//}
	// Methods used for parsing the sensors configuration (.conf) file.
    // HARD corresponds to ":hardware"
    // PLAT corresponds to ":platform"
    Method(HARD, 0x0, NotSerialized) {
        Return("845")
    }
    Method(PLAT, 0x0, NotSerialized) {
        Return("MTP")
    }
	//Disable Sensors for V1s to support new SLPI
	Method(_STA, 0) 
	{
		
	If(Lequal(\_SB_.SVMJ, 1))	
		{
			return (0x0)
		}
	Else
		{
			return (0xFF)
		}
	}
}
