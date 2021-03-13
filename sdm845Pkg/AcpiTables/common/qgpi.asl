// This file contains the QUPv3 ACPI device definitions.
// GPI is the interface used by buses drivers for different peripherals.
//

//
//  Device Map:
//    QGPI
//
//  List of Devices

Device (QGP0)
{
  // Indicates dependency on PEP
  //Name (_DEP, Package () { \_SB_.PEP0 })

  Name (_HID, "QCOM02F4")
  Alias(\_SB.PSUB, _SUB)
  Name (_UID, 0)
  Name (_CCA, 0)
   
   Method (_CRS, 0x0, Serialized) 
  {
    Name (RBUF, ResourceTemplate ()
    {
      // QUPV3_0 address space
      Memory32Fixed (ReadWrite, 0x00804000, 0x50000)
      
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {276} // GPII-ID 0x0
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {277} // GPII-ID 0x1
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {278} // GPII-ID 0x2
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {279} // GPII-ID 0x3
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {280} // GPII-ID 0x4
      Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {281} // GPII-ID 0x5
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {282} // GPII-ID 0x6
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {283} // GPII-ID 0x7
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {284} // GPII-ID 0x8
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {285} // GPII-ID 0x9
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {286} // GPII-ID 0xA
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {287} // GPII-ID 0xB
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {288} // GPII-ID 0xC
    })      
    Return (RBUF)
  }
   
  Method (GPII, 0x0, Serialized)
  {
    Return( Package()
    {
      //Package ()
      //{
      //  0x00,  // QUPV3 Instance
      //  0x00,  // GPII ID
      //  0x114  // Interrupt
      //},
      //Package ()
      //{
      //  0x00,
      //  0x01,
      //  0x115
      //},
      //Package ()
      //{
      //  0x00,
      //  0x02,
      //  0x116
      //},
      //Package ()
      //{
      //  0x00,
      //  0x03,
      //  0x117
      //},
      //Package ()
      //{
      //  0x00,
      //  0x04,
      //  0x118
      //},
      Package ()
      {
        0x00,
        0x05,
        0x119
      }
      //Package ()
      //{
      //  0x00,
      //  0x06,
      //  0x11A
      //},
      //Package ()
      //{
      //  0x00,
      //  0x07,
      //  0x11B
      //},
      //Package ()
      //{
      //  0x00,
      //  0x08,
      //  0x11C
      //},
      //Package ()
      //{
      //  0x00,
      //  0x09,
      //  0x11D
      //},
      //Package ()
      //{
      //  0x00,
      //  0x0A,
      //  0x11E
      //},
      //Package ()
      //{
      //  0x00,
      //  0x0B,
      //  0x11F
      //},
      //Package ()
      //{
      //  0x00,
      //  0x0C,
      //  0x120
      //}
    })
  }
}

Device (QGP1)
{
  // Indicates dependency on PEP
  //Name (_DEP, Package () { \_SB_.PEP0 })

  Name (_HID, "QCOM02F4")
  Alias(\_SB.PSUB, _SUB)
  Name (_UID, 1)
  Name (_CCA, 0)
   
  Method (_CRS, 0x0, Serialized) 
  {
    Name (RBUF, ResourceTemplate ()
    {
      // QUPV3_1 address space
      Memory32Fixed (ReadWrite, 0x00A04000, 0x50000)
      
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {311} // GPII-ID : 0x0
      Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {312} // GPII-ID : 0x1
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {313} // GPII-ID : 0x2
      Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {314} // GPII-ID : 0x3
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {315} // GPII-ID : 0x4
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {316} // GPII-ID : 0x5
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {325} // GPII-ID : 0x6
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {326} // GPII-ID : 0x7
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {327} // GPII-ID : 0x8
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {328} // GPII-ID : 0x9
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {329} // GPII-ID : 0xA
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {330} // GPII-ID : 0xB
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {331} // GPII-ID : 0xC

    })      
    Return (RBUF)
  }
   
  Method (GPII, 0x0, Serialized)
  {
    Return( Package()
    {
      //Package ()
      //{
      //  0x01,
      //  0x00,
      //  0x137
      //},
      Package ()
      {
        0x01,
        0x01,
        0x138
      },
      //Package ()
      //{
      //  0x01,
      //  0x02,
      //  0x139
      //},
      Package ()
      {
        0x01,
        0x03,
        0x13A
      }
      //Package ()
      //{
      //  0x01,
      //  0x04,
      //  0x13B
      //},
      //Package ()
      //{
      //  0x01,
      //  0x05,
      //  0x13C
      //},
      //Package ()
      //{
      //  0x01,
      //  0x06,
      //  0x145
      //},
      //Package ()
      //{
      //  0x01,
      //  0x07,
      //  0x146
      //},
      //Package ()
      //{
      //  0x01,
      //  0x08,
      //  0x147
      //},
      //Package ()
      //{
      //  0x01,
      //  0x09,
      //  0x148
      //},
      //Package ()
      //{
      //  0x01,
      //  0x0A,
      //  0x149
      //},
      //Package ()
      //{
      //  0x01,
      //  0x0B,
      //  0x14A
      //},
      //Package ()
      //{
      //  0x01,
      //  0x0C,
      //  0x14B
      //}
    })
  }
}
