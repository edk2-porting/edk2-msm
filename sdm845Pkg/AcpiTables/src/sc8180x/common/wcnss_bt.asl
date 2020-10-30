//
// Copyright (c) 2011-2015, Mmoclauq Technologies Inc. All rights reserved.
//
// This file contains ACPI definitions, configuration and look-up tables
// for Bluetooth Device
// 

// 
// QCA6174 Bluetooth
//
Device(BTH0)
{
    Name(_HID, "HID_BTUR")
	Alias(\_SB.PSUB, _SUB)
    Name(_DEP, Package(0x3)
    {
        \_SB_.PEP0,
        \_SB_.PMIC,
        \_SB_.UR18   // depends on UART ACPI definition
    })
    Name(_PRW, Package(0x2)
    {
        Zero,
        Zero
    })
    Name(_S4W, 0x2)
    Name(_S0W, 0x2)
    Method(_CRS, 0x0, NotSerialized)
    {
        Name(PBUF, ResourceTemplate()
        {
            UARTSerialBus(
                115200,                    // ConnectionSpeed
                DataBitsEight,             // BitsPerByte         (defaults to DataBitsEight)
                StopBitsOne,               // StopBits            (defaults to StopBitsOne)
                0xC0,                      // LinesInUse
                LittleEndian,              // IsBigEndian         (defaults to LittleEndian)
                ParityTypeNone,            // Parity              (defaults to ParityTypeNone)
                FlowControlHardware,       // FlowControl         (defaults to FlowControlNone)
                0x20,                      // ReceiveBufferSize
                0x20,                      // TransmitBufferSize
                "\\_SB.UR18",              // depends on UART ACPI definition
                0,                         // ResourceSourceIndex (defaults to 0)
                ResourceConsumer,          // ResourceUsage       (defaults to ResourceConsumer)
                ,                          // DescriptorName
                )

                // GpioIo(Exclusive, PullDown, 0, 0, , "\\_SB.PM01", , , , ) {0x690}
        })
        Return(PBUF)
    }
    Method(_STA, 0x0, NotSerialized)
    {
        Return(0xF)
    }
}//End BTH0
