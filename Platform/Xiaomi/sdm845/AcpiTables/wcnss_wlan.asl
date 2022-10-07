// 
// iHelium WLAN
//
Device (QWLN)   
{   
    Name(_ADR, 0)
    Name(_DEP, Package(2)
    {
        \_SB.PEP0,
        \_SB.MMU0
    })
    Name(_PRW, Package() {0,0})    // wakeable from S0
    Name(_S0W, 2)                  // S0 should put device in D2 for wake
    Name(_S4W, 2)                  // all other Sx (just in case) should also wake from D2
    Name(_PRR, Package(0x1) { \_SB.AMSS.QWLN.WRST })  // Power resource reference for device reset and recovery.

    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            // Shared memory
            Memory32Fixed (ReadWrite, 0x18800000, 0x800000)     //CE registers
            Memory32Fixed (ReadWrite,  0xC250000,     0x10)     //WCSSAON registers
            Memory32Fixed (ReadWrite, 0x8E300000, 0x100000)     //MSA image address
            // CE interrupts
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive       , , , ) {446}  //CE0  interrupt
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive       , , , ) {447}  //CE1  interrupt
            Interrupt(ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake, , , ) {448}  //CE2  interrupt
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive       , , , ) {449}  //CE3  interrupt
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive       , , , ) {450}  //CE4  interrupt
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive       , , , ) {451}  //CE5  interrupt
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive       , , , ) {452}  //CE6  interrupt
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive       , , , ) {453}  //CE7  interrupt
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive       , , , ) {454}  //CE8  interrupt
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive       , , , ) {455}  //CE9  interrupt
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive       , , , ) {456}  //CE10 interrupt
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive       , , , ) {457}  //CE11 interrupt
        })
        Return (RBUF)
    }

    // wlan msa memory size
    Method (WMSA)
    {
        Return(Package ()
        {
            0x100000
        })
    }

    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
    {
    }

    Method (_PS2, 0, NotSerialized)  // _PS2: Power State 2
    {
    }

    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
    {
    }

    OperationRegion (WOPR, 0x80, Zero, 0x10)
    Field (WOPR, DWordAcc, NoLock, Preserve)
    {
        Offset (0x04), 
        WTRG,   32
    }

    PowerResource(WRST, 0x5, 0x0)
    {
        //
        // Dummy _ON, _OFF, and _STA methods. All power resources must have these
        // three defined.
        //
        Method(_ON, 0x0, NotSerialized)
        {
        }
        Method(_OFF, 0x0, NotSerialized)
        {
        }
        Method(_STA, 0x0, NotSerialized)
        {
            Return(0xf)
        }
        Method(_RST, 0x0, NotSerialized)
        {
            WTRG = 0xABCD
        }
    }
}

//agent driver of wlan for supporting windows thermal framework
Scope(\_SB)
{
    Device (COEX)
    {
        Name (_HID, "QCOM0295")
        Alias(\_SB.PSUB, _SUB)
    }
}
