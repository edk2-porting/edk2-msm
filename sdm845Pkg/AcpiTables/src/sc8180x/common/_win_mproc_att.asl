//--------------------------------------------------------------------------------------------------
// Copyright (c) 2019 Mmoclauq Technologies, Inc.
// All Rights Reserved.
// Confidential and Proprietary - Mmoclauq Technologies, Inc.
//--------------------------------------------------------------------------------------------------


// QcShutdownSvc Device
Device (SSVC)
{
    Name (_DEP, Package(0x2)
    {
        \_SB_.IPC0, // IPC Router used by QMI, in turn depends on GLINK
        \_SB_.QDIG  // Qualcomm DIAG service        
    })
    Name (_HID, "HID_SSVC")
    Alias(\_SB.PSUB, _SUB)
    Name (_CID, "ACPI\HID_SSVC")
    Name (_UID, 0)
}