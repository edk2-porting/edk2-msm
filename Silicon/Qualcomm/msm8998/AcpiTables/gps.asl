//
// Qualcomm GPS driver
//
Device (GPS) //test
{
    Name (_DEP, Package (One)  // _DEP: Dependencies
    {
        \_SB.GLNK
    })
    Name (_HID, "QCOM00B9")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_CID, "ACPIQCOM00B9")  // _CID: Compatible ID
    Name (_UID, Zero)  // _UID: Unique ID
}
