Include("cust_camera.asl")
Include("cust_sensors.asl")

OperationRegion (CP17, SystemMemory, 0x0357F000, 0x10)
Field (CP17, DWordAcc, NoLock, Preserve)
{
    PI1C,   32, 
    PIN1,   32, 
    PI1N,   32, 
    PI1S,   32
}

OperationRegion (CP18, SystemMemory, 0x03585000, 0x10)
Field (CP18, DWordAcc, NoLock, Preserve)
{
    PI2C,   32, 
    PIN2,   32, 
    PI2N,   32, 
    PI2S,   32
}

//  BOARD VERSION (NBID)
//  NBID == 0x0 i.e. FULL MODEM BUILD
// 	NBID == 0x1 i.e. NO MODEM BUILD

Method (_BID, 0, Serialized)
{
    Name (NBID, Zero)
    Name (TEMP, Zero)
    NBID = PIN1 /* \_SB_.PIN1 */
    TEMP = PIN2 /* \_SB_.PIN2 */
    NBID |= TEMP <<= One
    Return (NBID) /* \_SB_._BID.NBID */
}
