Scope(\_SB.PEP0)
{
	
    Method(LLMH){
		return(NLMH)
	}
	Name( NLMH, package(){

			package(){
                "PEP_LMH_CFG",
				package(){
				 0, //SILVER_CLUSTER
				 0, // 0 = SIMPLE_STEP_ALGO, 1 = TOCKEN_BUCKET_ALGO
				 2995200, //Domain Max frequency for Silver cluster
				 3330, //ARM Threshold in 10s K
				 3675, //LOW Threshold in 10s K
				 3680, //HIGH Threshold in 10s K
				},

				package(){
				 1, //GOLD_CLUSTER
				 0, // 0 = SIMPLE_STEP_ALGO, 1 = TOCKEN_BUCKET_ALGO
				 2995200, //Domain Max frequency for Gold cluster
				 3330, //ARM Threshold in 10s K
				 3675, //LOW Threshold in 10s K
				 3680, //HIGH Threshold in 10s K
				},
                },
            })
	
			
}
