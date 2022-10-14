//
// ADSP RPC Driver
//
Device (ARPC)
{
    Name (_DEP, Package (0x02)  // _DEP: Dependencies
    {
        \_SB.MMU2, 
        \_SB.GLNK
    })
    Name (_HID, "QCOM0097")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
}

// ARPD AUDIO Daemon Driver
Device (ARPD)
{
    Name (_DEP, Package (0x02)  // _DEP: Dependencies
    {
        \_SB.ADSP, 
        \_SB.ARPC
    })
    Name (_HID, "QCOM00F8")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
}
