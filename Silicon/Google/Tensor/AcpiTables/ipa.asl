// This file contains the Bus Access Modules (BAM)
// ACPI device definitions and pipe configurations
//

//
//  Device Map:
//    IPA
//
//  List of Devices


Device (IPA)
{
   // Indicates dependency on PEP, RPE, SMEM, PIL,  SMMU, GSI and GLINK
   Name (_DEP, Package(0x6)
   {
        \_SB_.PEP0,
        \_SB_.RPEN,
        \_SB_.PILC,        
        \_SB_.MMU0,
        \_SB_.GSI,        
        \_SB_.GLNK,     
   })

   Name(_HID, "QCOM02B3")
   Alias(\_SB.PSUB, _SUB)
   Name (_UID, 0)
   
   Method (_CRS, 0x0, NotSerialized) 
   {
        Return
        (
           ResourceTemplate ()  
           {
                // IPA_PHYSICAL_ADDRESS, IPA_MEM_SIZE
                Memory32Fixed (ReadWrite, 0x1E40000, 0x1FFFF)

                // IPA Interrupt for uC communication
                Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {343}
           }
        )
   }
}
