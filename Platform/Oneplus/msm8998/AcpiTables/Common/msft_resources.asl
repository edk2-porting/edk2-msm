//===========================================================================
//                           <msft_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by microsoft drivers.
//
//===========================================================================

Scope (\_SB.PEP0)
{
    Method (MPMD, 0, NotSerialized)
    {
        Return (MPCC) /* \_SB_.PEP0.MPCC */
    }

    Name (MPCC, Package (0x00){})
}
