//
// System Cache Driver
//


Device (LLC)
{
    Name (_DEP, Package(0x1)
    {
        \_SB_.PEP0
    })
    Name (_HID, "HID_QLLC")
	Alias(\_SB.PSUB, _SUB)
    Alias(\_SB.SVMJ, _HRV)
    Method (_CRS, 0x0, NotSerialized)
    {
        Return (ResourceTemplate ()
        {
			Memory32Fixed (ReadWrite,  0x09600000, 0x50000)
			//TCSR_TIMEOUT_INTR_STATUS address to read DDR4ch or 8ch selection
			//http://ipcatalog.qualcomm.com/swi/chip/188/version/4066/module/3096475#TCSR_TIMEOUT_INTR_STATUS
			Memory32Fixed (ReadOnly, 0x1FC8020, 0x4)
            // reference : http://ipcatalog.qualcomm.com/irqs/chip/99/map/678
            //ddrss_apps_interrupt[2] = SYS_apssQgicSPI[582] = 614
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {614}   // LLCC ECC interrupt
            
        })
    }

}

