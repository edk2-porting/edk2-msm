//
// This file contains the QUPv3 ACPI device definitions.
// GPI is the interface used by buses drivers for different peripherals.
//

//
//  Device Map:
//    QGPI
//
//  List of Devices

// sc8180x gpi
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
      Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {277} // GPII-ID 0x1
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
      Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {325} // GPII-ID : 0x6
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {326} // GPII-ID : 0x7
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {327} // GPII-ID : 0x8
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {328} // GPII-ID : 0x9
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {329} // GPII-ID : 0xA
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {330} // GPII-ID : 0xB
      //Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {331} // GPII-ID : 0xC

    })      
    Return (RBUF)
  } 
}
