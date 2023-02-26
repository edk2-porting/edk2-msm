// This file contains the Generic Software Interface(GSI)
// ACPI device definitions.
// GSI is the interface used by IPA driver to talk to IPA HW and is intended
// as a replacement for BAM.
//

//
//  Device Map:
//    GSI
//
//  List of Devices


Device (GSI)
{
   // Indicates dependency on PEP
   Name (_DEP, Package () { \_SB_.PEP0 })

   Name(_HID, "QCOM02E7")
   Alias(\_SB.PSUB, _SUB)
   Name (_UID, 0)
   
   Method (_CRS, 0x0, NotSerialized) 
   {
        Name (RBUF, ResourceTemplate ()
        {
            // GSI_PHYSICAL_ADDRESS, GSI_MEM_SIZE
            Memory32Fixed (ReadWrite, 0x1E00000, 0x30000)

            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {464}
        })
        Return (RBUF)
   }   
}
