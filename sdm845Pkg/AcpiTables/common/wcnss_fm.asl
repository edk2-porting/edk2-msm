// This file contains ACPI definitions, configuration and look-up tables
// for FM transport Device
// 

//
// Sillab FM chip
//
//Device (FMSL)
//{
//    Name (_DEP, Package(0x2)
//    {
//        \_SB_.PEP0,
//        \_SB_.I2C7
//    })
//    Name (_HID, "QCOM02B4")

//    Method (_CRS, 0x0, NotSerialized)
//    {
//        Name (RBUF, ResourceTemplate ()
//        {
//            I2CSerialBus( 0x11, ControllerInitiated, 400000, AddressingMode7Bit, "\\_SB.I2C7",,,,)
//            GpioInt(Edge, ActiveLow, Exclusive, PullUp, 0, "\\_SB.GIO0", ,) {38}
//            GpioIo(Exclusive, PullUp, 0, 0, , "\\_SB.GIO0", ,) {39}
//        })
//        Return (RBUF)
//    }
//}
