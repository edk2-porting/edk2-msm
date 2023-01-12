Device (BTNS)
{
     Name(_HID, "ACPI0011")

     Alias(\_SB.PSUB, _SUB)

     Name(_UID, 0)

     Method (_CRS, 0x0, NotSerialized)
     {
         Name (RBUF, ResourceTemplate ()
         {
              //Power Button
              GpioInt(Edge, ActiveBoth, ExclusiveAndWake, PullDown, 0, "\\_SB.PM01", ,) {0} // 0x40 - PM_INT__PON__KPDPWR_ON

              // Volume Up button
              GpioInt(Edge, ActiveBoth, Exclusive, PullUp, 0, "\\_SB.PM01", ,) {133} // 0x628 - PM_INT__PM1_GPIO6__GPIO_IN_STS

              // Volume Down button
              GpioInt(Edge, ActiveBoth, Exclusive, PullDown, 0, "\\_SB.PM01", ,) {1} // 0x41 - PM_INT__PON__RESIN_ON

              // Camera Focus
            //   GpioInt(Edge, ActiveBoth, Exclusive, PullUp, 0, "\\_SB.PM01", ,) {135} // 0x638 - PM_INT__PM1_GPIO8__GPIO_IN_STS

              //Camera Snapshot
            //   GpioInt(Edge, ActiveBoth, Exclusive, PullUp, 0, "\\_SB.PM01", ,) {134} // 0x630 - PM_INT__PM1_GPIO7__GPIO_IN_STS
         })
         Return (RBUF)
     }

     Name(_DSD, Package(2) {
        ToUUID("FA6BD625-9CE8-470D-A2C7-B3CA36C4282E"),
        Package() {
            Package(5) {0,1,0,0x01,0x0D}, // Portable Device Control Application Collection
            Package(5) {1,0,1,0x01,0x81}, // Sleep
            Package(5) {1,1,1,0x0C,0xE9}, // Volume Increment
            Package(5) {1,2,1,0x0C,0xEA}, // Volume Decrement
            // Package(5) {1,3,1,0x90,0x20}, // Camera Auto Focus
            // Package(5) {1,4,1,0x90,0x21}, // Camera Shutter
        },
     })
}
