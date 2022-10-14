//
// data.asl: This file contains the Data Drivers
// ACPI device definitions, configuration and look-up tables.
// 

//
// linklocal
//
// Device (LNK0)
// {
//	Name (_HID, "QCOM02AA")
//	Name (_UID, 0)
//}

// Device (LNK1)
//{
//	Name (_HID, "QCOM02AA")
//	Name (_UID, 1)
// }
// Device (LNK2)
// {
//	Name (_HID, "QCOM02AA")
//	Name (_UID, 2)
// }
// Device (LNK3)
// {
//	Name (_HID, "QCOM02AA")
//	Name (_UID, 3)
// }
// Device (LNK4)
// {
//	Name (_HID, "QCOM02AA")
//	Name (_UID, 4)
// }
// Device (LNK5)
// {
//	Name (_HID, "QCOM02AA")
//	Name (_UID, 5)
// }
// Device (LNK6)
// {
//	Name (_HID, "QCOM02AA")
//	Name (_UID, 6)
// }
// Device (LNK7)
// {
//	Name (_HID, "QCOM02AA")
//	Name (_UID, 7)
// }
// Device (LNK8)
// {
//	Name (_HID, "QCOM02AA")
//	Name (_UID, 8)
// }

//  
// Modembridge Driver
//
Device (MBRG)
{
    Name (_HID, "QCOM000C")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
}

//
// Remote AT Command Processor Driver
//
Device (RMAT)
{
    Name (_HID, "QCOM000F")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
}

//
// rmnetbridge
//
Device (RMNT)
{
    Name (_HID, "QCOM000D")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
}

//
// dplbridge
//
Device (DPLB)
{
    Name (_HID, "QCOM00C7")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
}
