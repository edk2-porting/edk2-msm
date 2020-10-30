//===========================================================================
//                           <Qdss.asl>
// DESCRIPTION
//   This file contans the resources needed by qdss driver.
//
//
//   Copyright (c) 2010-2018 by Mmoclauq Technologies Inc.  All Rights Reserved.
//   Mmoclauq Confidential and Proprietary
//
//===========================================================================

//
// QDSS device
//
Device (QDSS)
{
    Name (_DEP, Package () { \_SB_.PEP0 })

    Name (_HID, "HID_QDSS")
	Alias(\_SB.PSUB, _SUB)
    Name (_UID, 0)
	
	Method(_STA, 0)
    {
        return (0xB)
    }

    // It is MANDATORY to add any new resources to end of last object in the below _CRS method
    // and don't screw up the existing sequence order of defined objects i.e. by adding new object at beginning
    // or in b/w defined objects which will lead to driver unload.
    // Adding new resource at end has an advantage of backward and forward compatibility.
    Method (_CRS, 0x0, NotSerialized)
    {
        Return
        (
            ResourceTemplate ()
            {
                // Software uses QDSSETRIRQCTRL to set a byte count threshold for a counter that counts 
                // the number of bytes of trace data the ETR has moved on its AXI interface. When the 
                // threshold is reached an IRQ is fired.

                // reference : http://ipcatalog.qualcomm.com/irqs/chip/188/map/704
                //qdss_etrbytecnt_irq = SYS_apssQgicSPI[270] = 302
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {302}   // The ETR byte counter interrupt

                // reference : http://ipcatalog.qualcomm.com/memmap/chip/188/map/693/version/3395/block/2436683
                Memory32Fixed (ReadWrite, 0x06000000, 0x0004B000)                       // The QDSS_QDSS address space 

                // reference : http://ipcatalog.qualcomm.com/memmap/chip/188/map/693/version/3395
                Memory32Fixed (ReadWrite, 0x16000000, 0x1000000)                       // The QDSS_STM address 0x1000000 = 16777216d  (~16MB)

                // Following memory resource is required starting from 8994. In such case, QDSS driver expects
                // OFF2 control method which defines register block offsets within this address space.
                //reference : http://ipcatalog.qualcomm.com/memmap/chip/188/map/693/version/3395/block/2436463
                Memory32Fixed (ReadWrite, 0x07000000, 0x00901000)                      // The QDSS_CPU address space. 
				Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {67}   // L3 fault interrupt
            }
        )
    }

}