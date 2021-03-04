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
    /*TGU Config XLS : https://sharepoint.qualcomm.com/qct/DHW/Projects/Napali/_layouts/15/xlviewer.aspx?id=%2Fqct%2FDHW%2FProjects%2FNapali%2FDocuments%2FDesign%2Fdebug%2FTGU%2Fnapali%5Frpmhdebug%5Fipcbmonitor%5Fzmarzec%2Exlsx&DefaultItemOpen=1&Source=https%3A%2F%2Fsharepoint%2Equalcomm%2Ecom%2Fqct%2FDHW%2FProjects%2FNapali%2FDocuments%2FForms%2FAllItems%2Easpx%3FRootFolder%3D%252Fqct%252FDHW%252FProjects%252FNapali%252FDocuments%252FDesign%252Fdebug%252FTGU%26FolderCTID%3D0x012000D0792EEBBE0E7249BF21C2419C287E33%26View%3D%257B60739D41%2D3205%2D4125%2DA0BF%2D3AA54FEE0267%257D
    */
    
    Method (QTGU)
    {
        Return
        (
            Package()
            {
              // TGU Index
                "SWAO_TGU",   // 0
            }
        )
    }	
	
    Method (TGUC) // TGU Configuration
    {
        Return
        (
            Package()
            {
                Package() 
                {   
					0,			// Index
                    0x06B0C000, // Base address of this TGU
                    0x1000,     // Length of this TGU        
                    0x3,        // Max number of steps (from TGU config XLS. Refer refernces above)
                    0x4,        // Max number of conditions (from TGU config XLS. Refer refernces above)
                    0x5,        // Max number of registers (from IPCAT)
                },                                               
            }
        )
    }	   
}