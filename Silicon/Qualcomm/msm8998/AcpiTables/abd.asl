//   
// This file contains ASL Bridge Device definitions
// 

//
// ASL Bridge Device
//
Device (ABD)
{
    Name (_HID, "QCOM003F")  // _HID: Hardware ID
    Name (_UID, Zero)  // _UID: Unique ID
    OperationRegion (ROP1, GenericSerialBus, Zero, 0x0100)
    Name (AVBL, Zero)
    Method (_REG, 2, NotSerialized)  // _REG: Region Availability
    {
        If ((Arg0 == 0x09))
        {
            AVBL = Arg1
        }
    }

    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        Return (0xF)
    }
}
