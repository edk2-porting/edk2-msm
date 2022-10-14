// This file contains the sensor ACPI device definitions.
//

// Qualcomm Sensor Collection
Device (SEN1)
{
    Name (_DEP, Package (0x02)  // _DEP: Dependencies
    {
        \_SB.IPC0, 
        \_SB.SCSS
    })
    Name (_HID, "QCOM00A2")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
	// Methods used for parsing the sensors configuration (.conf) file.
    // HARD corresponds to ":hardware"
    // PLAT corresponds to ":platform"
    Method (HARD, 0, NotSerialized)
    {
        Return ("8998")
    }

    Method (PLAT, 0, NotSerialized)
    {
        Return ("CHEESEBURGER") // oneplus 5 
    }
}
