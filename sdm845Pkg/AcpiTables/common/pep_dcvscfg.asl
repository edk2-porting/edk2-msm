Scope(\_SB.PEP0)
{
// CPU DCVS Configurations Packages
	Name(NDCV,
	    Package ()
        {
	        Package() //MSM v1
	        {
		        "CHIP_INFO",
                321, // chip ID
                1,   // chip major version
                0,   // chip minor version
			
      		    2,  //Total number of CPU domain           
            
                Package() // Big Cluster configuration
		        {
                    "BIG",                        // Type of cluster
			        4,                            //Number of cores perf cluster.
		            "apcs_gold_sysleaf_clk",				
				    Package(){300, 1037, 1574},        //Cpu Key Frequency 
				    3,                            // Number of Efficient Performance Levels
				    Package(){0, 9, 16},         //Cpu Efficient Performance Levels
		        },
			
                Package() // Little Cluster configuration
		        {
                    "LITTLE",                    //Type of cluster
			        4,                           //Number of cores perf cluster.
		            "apcs_silver_sysleaf_clk",
				    Package(){300, 1210, 1594},        //Cpu Key Frequency 
				    3,                           // Number of Efficient Performance Levels
				    Package(){0, 11, 16},          //Cpu Efficient Performance Levels
		        },
                 
			    Package()   // L3_CACHE domain configuration
		        {
                    "L3_CACHE",                   //Type of cluster			    		            
                    "apcs_l3_sysleaf_clk",        //Clock ID. If this is NULL/0, that means no L3 domain supported on this platform
		        },
            },
			
			Package() //MSM v2
	        {
		        "CHIP_INFO",
                321, // chip ID
                2,   // chip major version
                0,   // chip minor version
			
      		    2,  //Total number of CPU domain           
            
                Package() // Big Cluster configuration
		        {
                    "BIG",                        // Type of cluster
			        4,                            //Number of cores perf cluster.
		            "apcs_gold_sysleaf_clk",				
				    Package(){826, 1363, 1460},   //Cpu Key Frequency 
				    3,                            // Number of Efficient Performance Levels
				    Package(){0, 7, 15},          //Cpu Efficient Performance Levels
		        },
			
                Package() // Little Cluster configuration
		        {
                    "LITTLE",                    //Type of cluster
			        4,                           //Number of cores perf cluster.
		            "apcs_silver_sysleaf_clk",
				    Package(){300, 1229, 1325},  //Cpu Key Frequency 
				    3,                           // Number of Efficient Performance Levels
				    Package(){0, 11, 15},        //Cpu Efficient Performance Levels
		        },
                 
			    Package()   // L3_CACHE domain configuration
		        {
                    "L3_CACHE",                   //Type of cluster			    		            
                    "apcs_l3_sysleaf_clk",        //Clock ID. If this is NULL/0, that means no L3 domain supported on this platform
		        },
            },
            
            Package() //APQ v1
	        {
		        "CHIP_INFO",
                341, // chip ID
                1,   // chip major version
                0,   // chip minor version
			
      		    2,  //Total number of CPU domain           
            
                Package() // Big Cluster configuration
		        {
                    "BIG",                        // Type of cluster
			        4,                            //Number of cores perf cluster.
		            "apcs_gold_sysleaf_clk",				
				    Package(){300, 1037, 1574},        //Cpu Key Frequency 
				    3,                            // Number of Efficient Performance Levels
				    Package(){0, 9, 16},         //Cpu Efficient Performance Levels
		        },
			
                Package() // Little Cluster configuration
		        {
                    "LITTLE",                    //Type of cluster
			        4,                           //Number of cores perf cluster.
		            "apcs_silver_sysleaf_clk",
				    Package(){300, 1210, 1594},        //Cpu Key Frequency 
				    3,                           // Number of Efficient Performance Levels
				    Package(){0, 11, 16},          //Cpu Efficient Performance Levels
		        },
                 
			    Package()   // L3_CACHE domain configuration
		        {
                    "L3_CACHE",                   //Type of cluster			    		            
                    "apcs_l3_sysleaf_clk",        //Clock ID. If this is NULL/0, that means no L3 domain supported on this platform
		        },
            },                       

            Package() //APQ v2
	        {
		        "CHIP_INFO",
                341, // chip ID
                2,   // chip major version
                0,   // chip minor version
			
      		    2,  //Total number of CPU domain           
            
                Package() // Big Cluster configuration
		        {
                    "BIG",                        // Type of cluster
			        4,                            //Number of cores perf cluster.
		            "apcs_gold_sysleaf_clk",				
				    Package(){826, 1363, 1460},   //Cpu Key Frequency 
				    3,                            // Number of Efficient Performance Levels
				    Package(){0, 7, 15},          //Cpu Efficient Performance Levels
		        },
			
                Package() // Little Cluster configuration
		        {
                    "LITTLE",                     //Type of cluster
			        4,                            //Number of cores perf cluster.
		            "apcs_silver_sysleaf_clk",
				    Package(){300, 1229, 1325},   //Cpu Key Frequency 
				    3,                            // Number of Efficient Performance Levels
				    Package(){0, 11, 15},         //Cpu Efficient Performance Levels
		        },
                 
			    Package()   // L3_CACHE domain configuration
		        {
                    "L3_CACHE",                   //Type of cluster			    		            
                    "apcs_l3_sysleaf_clk",        //Clock ID. If this is NULL/0, that means no L3 domain supported on this platform
		        },
            },

            Package() //MSM v2
	        {
		        "CHIP_INFO",
                348, // chip ID
                2,   // chip major version
                0,   // chip minor version
			
      		    2,  //Total number of CPU domain           
            
                Package() // Big Cluster configuration
		        {
                    "BIG",                        // Type of cluster
			        4,                            //Number of cores perf cluster.
		            "apcs_gold_sysleaf_clk",				
				    Package(){826, 1363, 1460},   //Cpu Key Frequency 
				    3,                            // Number of Efficient Performance Levels
				    Package(){0, 7, 15},          //Cpu Efficient Performance Levels
		        },
			
                Package() // Little Cluster configuration
		        {
                    "LITTLE",                     //Type of cluster
			        4,                            //Number of cores perf cluster.
		            "apcs_silver_sysleaf_clk",
				    Package(){300, 1229, 1325},   //Cpu Key Frequency 
				    3,                            // Number of Efficient Performance Levels
				    Package(){0, 11, 15},         //Cpu Efficient Performance Levels
		        },
                 
			    Package()   // L3_CACHE domain configuration
		        {
                    "L3_CACHE",                   //Type of cluster			    		            
                    "apcs_l3_sysleaf_clk",        //Clock ID. If this is NULL/0, that means no L3 domain supported on this platform
		        },
            },
			
        }) //End of NDCV method

	// Method to return DCVS configuration packages    
    Method(LDCV)
	{
        return(NDCV)
    }	
}
