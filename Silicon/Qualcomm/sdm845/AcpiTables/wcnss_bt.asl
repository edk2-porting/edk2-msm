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
        \_SB_.PEP0,
        \_SB_.PMIC,
        \_SB_.UAR7   // depends on UART ACPI definition
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
                "\\_SB.UAR7",              // depends on UART ACPI definition
                0,                         // ResourceSourceIndex (defaults to 0)
                ResourceConsumer,          // ResourceUsage       (defaults to ResourceConsumer)
                ,                          // DescriptorName
                )

                // GpioIo(Exclusive, PullDown, 0, 0, , "\\_SB.PM01", , , , ) {146} // 0x690 - PM_INT__PM1_GPIO19__GPIO_IN_STS
        })
        Return(PBUF)
    }
    Method(_STA, 0x0, NotSerialized)
    {
        Return(0xF)
    }
}//End BTH0
