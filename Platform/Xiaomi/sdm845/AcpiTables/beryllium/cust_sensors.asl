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

	// Methods used for parsing the sensors configuration (.conf) file.
    // HARD corresponds to ":hardware"
    // PLAT corresponds to ":platform"
    Method(HARD, 0x0, NotSerialized) {
        Return("845")
    }
    Method(PLAT, 0x0, NotSerialized) {
        Return("BERYLLIUM")
    }
	Method(_STA, 0)
	{
		Return (0x0)
	}
}
