//
// Copyright (c) 2011-2015, Mmoclauq Technologies Inc. All rights reserved.
//
// This file contains ACPI definitions, configuration and look-up tables
// for Bluetooth Device
// 

// 
// WCN3990 Bluetooth
//
Device(BTH0)
{
    Name(_HID, "QCOM02B5")
    Alias(\_SB.PSUB, _SUB)
    Name(_DEP, Package(0x3)
    {
        \_SB.PEP0, 
        \_SB.PMIC, 
        \_SB.UAR7   // depends on UART ACPI definition
    })
    Name(_PRW, Package(0x2)  // _PRW: Power Resources for Wake
    {
        Zero,
        Zero
    })
    Name(_S4W, 0x2)  // _S4W: S4 Device Wake State
    Name(_S0W, 0x2)  // _S0W: S0 Device Wake State
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (PBUF, ResourceTemplate ()
        {
            UartSerialBusV2 (0x0001C200, DataBitsEight, StopBitsOne,
                0xC0, LittleEndian, ParityTypeNone, FlowControlHardware,
                0x0020, 0x0020, "\\_SB.UAR7",
                0x00, ResourceConsumer, , Exclusive,
                )
        })
        Return (PBUF) /* \_SB_.BTH0._CRS.PBUF */
    }

    Method (_STA, 0x0, NotSerialized)
    {
        Return(0xF)
    }
}
//End BTH0
