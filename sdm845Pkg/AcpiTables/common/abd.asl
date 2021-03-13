//   
// This file contains ASL Bridge Device definitions
// 

//
// ASL Bridge Device
//
Device (ABD)
{
	Name (_DEP, Package(0x1)
	{
	    \_SB_.PEP0
	})
	Name (_HID, "QCOM0242")
	Alias(\_SB.PSUB, _SUB)
	Name (_UID, 0)
	OperationRegion(ROP1, GenericSerialBus, 0x00000000, 0x100)
	Name(AVBL, Zero)
	Method(_REG, 0x2, NotSerialized)
    {
		If(Lequal(Arg0, 0x9))
        {
		   Store(Arg1, AVBL)
		}
	}
}
