// 
// Secure Channel Manager (SCM) Driver
//
Device (SCM0)
{
    Name (_HID, "QCOM0013")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, Zero)  // _UID: Unique ID
}

//
// TrEE Driver
//
Device (TREE)
{
    Name (_HID, "QCOM00BF")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, Zero)  // _UID: Unique ID
}
