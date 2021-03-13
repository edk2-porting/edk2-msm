Scope(\_SB.PEP0)
{
	Method(LPCU){
        return(NPCU)
    }
    
    Name( NPCU, package(){
			"PCU_CONFIG",
            9, // number of cores
            1, // number of clusters
            package(){
                "PCU_CLUSTER_CONFIG",
                9, 
            },
            package(){
                "PCU_PHYS_CONFIG",
                0x17E00040, // Core 0
                0x17E10040, // Core 1
				0x17E20040, // Core 2
				0x17E30040, // Core 3
                0x17E40040, // Core 4
                0x17E50040, // Core 5
				0x17E60040, // Core 6
				0x17E70040, // Core 7
                0x17810104, // L3
            }
		})
}
