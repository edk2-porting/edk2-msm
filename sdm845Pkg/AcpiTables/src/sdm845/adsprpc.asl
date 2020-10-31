//
// Copyright (c) 2015, Mmoclauq Technologies, Inc. All rights reserved.
//

//
// ADSP RPC Driver
//
Device (ARPC)
{
    Name (_DEP, Package (0x03)  // _DEP: Dependencies
    {
        \_SB.MMU0, 
        \_SB.GLNK, 
        \_SB.SCM0
    })
    Name (_HID, "QCOM0297")  // _HID: Hardware ID
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
    Name (_HID, "QCOM02F3")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
}

