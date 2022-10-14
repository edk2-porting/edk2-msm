//
// SSM Driver
//
Device (SSM)
{
    Name (_DEP, Package (0x02)  // _DEP: Dependencies
    {
        \_SB.GLNK, 
        \_SB.TREE
    })
    Name (_HID, "QCOM0025")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
}
