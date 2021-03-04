//===========================================================================
//                           <msft_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by microsoft drivers.
//
//
//===========================================================================


Scope(\_SB_.PEP0) 
{

    // MICROSOFT

    Method(MPMD)
    {
        Return(MPCC)
    }	
	
	
    Name(MPCC,
    Package ()
    { 
    })	
}