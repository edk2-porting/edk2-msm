//===========================================================================
//                           <qdss_replicator.asl>
// DESCRIPTION
//   This file contans the REPLICATOR details needed by qdss driver.
//
//
//
//===========================================================================

Scope(\_SB.QDSS)
{
    // References: 
	// https://sharepoint.qualcomm.com/qct/DHW/Projects/Napali/Documents/Design/debug/SWAO/tmp_swao_hpg/SWAO_HPG.docm
    Method (QREP)
    {
        Return
        (
            Package()
            {
              // Replicator Index
				"REPLICATOR",        // 0
                "SWAO_REPLICATOR",   // 1
            }
        )
    }	
	
    Method (REPC) // Replicator Configuration
    {
        Return
        (
            Package()
            {
                Package() 
                {   
					0,			// Index
                    0x06046000, // Base address of this ETF/ETB
                    0x1000,     // Length of this ETF/ETB                                
                },    	

				Package() 
                {   
					1,			// Index
                    0x06B0A000, // Base address of this ETF/ETB
                    0x1000,     // Length of this ETF/ETB                                
                },
            }
        )
    }	   
}