//===========================================================================
//                           <oem_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by oem drivers.
//
//===========================================================================

Scope (\_SB.PEP0)
{
    Method (OPMD, 0, NotSerialized)
    {
        Return (OPCC) /* \_SB_.PEP0.OPCC */
    }

    Name (OPCC, Package (0x00){})
}
