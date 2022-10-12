//
// Camera Platform, Camera Sensors, White LED Flash, JPEG HW, VFE Moved to a dedicated asl
// This is done to support Multiple platforms and Multiple OEM Projects in CRM Builds
//
Include("cust_camera.asl")
Include("cust_sensors.asl")

// GPIO_11

Method (ADDR) 
{
	If(Lequal(\_SB_.SVMJ, 1)) 
	{
		return(0x390B000)
	}
	ElseIf(Lequal(\_SB_.SVMJ, 2))
	{
		return(0x350B000)
	}              
}

OperationRegion(NM11, SystemMemory, ADDR, 0x14)
Field(NM11, DWordAcc, NoLock, Preserve){			
	PI1C, 32, 
	PIN1, 32, 
	PI1N, 32, 
	PI1S, 32,
    PI1L, 32,	
}

//  BOARD VERSION (NBID)
//  NBID == 0x0 i.e. FULL MODEM BUILD
// 	NBID == 0x1 i.e. NO MODEM BUILD

Method (_MID, 0, Serialized) {
    Name(NMID, Zero)		
    Store(PIN1, NMID)
    Return (NMID)
}
