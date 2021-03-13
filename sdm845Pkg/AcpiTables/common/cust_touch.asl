//Improve Touch Driver
Device (TSC5)
{
    Name (_HID, "QCOM02F5")
    Alias(\_SB.PSUB, _SUB)
    Name (_UID, 1)
    Name(_DEP, Package()
        {
            \_SB_.ARPC
        })
    
	//Disable Touch for V1s to support new SLPI
	Method(_STA, 0) 
	{
		
	If(Lequal(\_SB_.SVMJ, 1))	
		{
			return (0x0)
		}
	Else
		{
			return (0xFF)
		}
	}
}
