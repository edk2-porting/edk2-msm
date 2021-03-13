//===========================================================================
//                           <qdss_tmc.asl>
// DESCRIPTION
//   This file contans the REPLICATOR details needed by qdss driver.
//
//
//===========================================================================

Scope(\_SB.QDSS)
{
    // References: 
	// https://sharepoint.qualcomm.com/qct/DHW/Projects/Napali/Documents/Design/debug/SWAO/tmp_swao_hpg/SWAO_HPG.docm

    Method (QTMC)
    {
        Return
        (
            Package()
            {
              // ETF/ETB Index
				"ETFETB",     // 0
                "SWAO_TMC",   // 1
            }
        )
    }	
	
    Method (TMCC) // ETF/ETB Configuration
    {
        Return
        (
            Package()
            {
                Package()
                {   
					0,			// Index
                    0x06047000, // Base address of this ETF/ETB
                    0x1000,     // Length of this ETF/ETB
                    0,          // TPDA index                    
                },  

				Package()
                {   
					1,			// Index
                    0x06B09000, // Base address of this ETF/ETB
                    0x1000,     // Length of this ETF/ETB
                    6,          // TPDA index                     
                }, 				
            }
        )
    }	   
}
