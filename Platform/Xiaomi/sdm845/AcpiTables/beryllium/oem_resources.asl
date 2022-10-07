//===========================================================================
//                           <oem_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by oem drivers.
//
//===========================================================================


Scope(\_SB_.PEP0) 
{
	
    // OEM 
    Method(OPMD)
    {
        Return(OPCC)
    }	
	
	
    Name(OPCC,
    Package ()
    { 
    })
    
}
