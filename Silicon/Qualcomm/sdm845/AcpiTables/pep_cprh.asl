Scope(\_SB.PEP0)
{
   // Method to return CPR data
   Method(CPRZ)
   {
      Return(CPRH)
   }

   //-----------------------------------------------------------------------------------------
   //  CPRh Napali V1
   //  ------------
   //
   //-----------------------------------------------------------------------------------------
   // CPR data
   Name(CPRH,
   Package(){
      "CPRH_SW_SETTING", // CPR SW Setting
      0,
      Package(){
         "CPRH_CHIP_INFO",
         321, // chip ID
         1,   // chip version
         //-----------------------------------------------------------------------------------------
         //  APC Controller SW Setting
         //  -------------------------
         //
         //-----------------------------------------------------------------------------------------
         Package(){
            "CPRH_SW_CONTROLLER_SETTING",
			0,          //instance_num (doc: CPR SW)
			"APC0",     //rail_name	(doc: voltage plan)
			0x17DC0000, //cpr_register_addr (doc: SWI)
			0x4000,     //cpr_register_size (doc: SWI)
			0,          //count_mode (doc: voltage plan)
			20,         //count_repeat (doc: voltage plan)
			15,         //idle_clocks (doc: voltage plan)
			12,         //step_quot_max (doc: voltage plan)
			11,         //step_quot_min (doc: voltage plan)
			1,          //reset_step_quot_loop_en (doc: voltage plan) - TBD
			8,          //number_of_sensors (doc: HPG)
			0xf0,       //sensor_thread_mask (doc: HPG) L3 using sensor #0,1,2,3
			0,          //sensor_mask (doc: voltage plan)
			0,          //sensor_bypass (doc: voltage plan)
			0x17700,    //auto_cont_interval (doc: voltage plan) //5ms
			400,        //base_voltage_mV (doc: CPR SW)
			4,          //voltage_multiplier (doc: CPR HPG)
			4,          //target_multiplier (doc: CPR HPG)
			5,          //mode_switch_timer (doc: voltage plan)
			0,          //initial_mode (doc: CPR HPG)
			1,          //temp_sensor_id_start (doc: CPR HPG)
			5,          //temp_sensor_id_end (doc: CPR HPG)
			1,          //error_step_limit_dn (doc: voltage plan)
			1,          //error_step_limit_up (doc: voltage plan)
			1,          //thread_aggregation_enable (doc: CPR HPG)
			1,          //thread_has_always_vote (doc: CPR HPG)
			23,			//1.2us/19.2MHz MarginTimerSettleVoltage (doc: CPR HPG) - TBD - PMIC delay for one step / CPR clock period
			0x4b00,		//MarginTimerLowerVoltage (doc: CPR HPG)
            //Below are temp adj related - Setting to zero for now.
			0,			//MarginInitialTempBand; (doc: voltage plan)
			4,			//MarginMaxNumCores; (doc: CPUSS HPG)
			1,			//MarginLowerVoltageWaitSelect; (doc: CPR HPG)
			4,			//MarginPmicStepSize; (doc: PMIC HPG)
			1,			//MarginClosedLoopEn; (doc: CPR HPG)
			0,			//MarginCoreAdjEn; (doc: CPR HPG)
			0,			//MarginTempAdjEn; (doc: CPR HPG)
            //---------------------------------------------------------------------------------------------------------------------
            //  Aging Setting
			//  ------------
			"",          //aging_rail_id (doc: power grid)
			0,			 //aging_thread_index (doc: n/a)
			0,           //aging_measurement_voltage_mV (doc: voltage plan)
			0,			 //aging_sensor_id (doc: voltage plan)
			0,           //age_ro_kv (/1000 = 1.62) (doc: voltage plan)
			0,           //derate_scaling_factor (doc: voltage plan)
			0,           //max_age_compensation (mV) (doc: voltage plan)
			0,           //bypass_sensor (doc: voltage plan)
            //---------------------------------------------------------------------------------------------------------------------
            //  SAW4 Setting
			//  ------------
			0x17840800, //saw_register_addr
			0x400,      //saw_register_size
			1, 			//saw_enable
			1,			//saw_ctl_sel
			0,			//saw_tmr_clk_div
			1,			//saw_vlvl_width
			1,			//saw_vlvl_step_up
			1,			//saw_vlvl_step_dn
            //---------------------------------------------------------------------------------------------------------------------
            //  Thread 0 SW Setting //TBD - Voltage plan does not have entries for L3 for settings below
            //  -------------------             thread#  clk_domain_name  up_threshold  dn_threshold  consecutive_up  consecutive_dn  
            //                                  -------  ---------------  ------------  ------------  --------------  --------------  
			Package(){"CPRH_SW_THREAD_SETTING",      0,        "L3",            2,            2,              0,              0,   }, 
            //---------------------------------------------------------------------------------------------------------------------
            //  Thread 1 SW Setting
            //  -------------------             thread#  clk_domain_name  up_threshold  dn_threshold  consecutive_up  consecutive_dn  
            //                                  -------  ---------------  ------------  ------------  --------------  --------------  
            Package(){"CPRH_SW_THREAD_SETTING",      1,        "Silver",        2,            2,              0,              0,   },
         },
		 Package(){
            "CPRH_SW_CONTROLLER_SETTING",
			1,          //instance_num
			"APC1",     //rail_name
			0x17DB0000, //cpr_register_addr
			0x4000,     //cpr_register_size
			0,          //count_mode
			20,         //count_repeat
			15,         //idle_clocks
			14,         //step_quot_max
			9,          //step_quot_min
			1,          //reset_step_quot_loop_en //TBD
			14,         //number_of_sensors
			0,          //sensor_thread_mask //Assigning to thread0
			0,          //sensor_mask
			0,          //sensor_bypass
			0x17700,    //auto_cont_interval
			400,        //base_voltage_mV
			4,          //voltage_multiplier
			4,          //target_multiplier
			5,          //mode_switch_timer
			0,          //initial_mode
			6,          //temp_sensor_id_start
			10,         //temp_sensor_id_end
			1,          //error_step_limit_dn
			1,          //error_step_limit_up
			0,          //thread_aggregation_enable
			0,          //thread_has_always_vote (doc: CPR HPG)
			23,			//1.2us/19.2MHz MarginTimerSettleVoltage
			0x4b00,		//MarginTimerLowerVoltage
            //Below are temp adj related - Setting to zero for now.
			0,			//MarginInitialTempBand;
			4,			//MarginMaxNumCores;
			1,			//MarginLowerVoltageWaitSelect;
			4,			//MarginPmicStepSize;
			1,			//MarginClosedLoopEn;
			0,			//MarginCoreAdjEn;
			0,			//MarginTempAdjEn;
            //---------------------------------------------------------------------------------------------------------------------
            //  Aging Setting
			//  ------------
			"",          //aging_rail_id (doc: power grid)
			0,			 //aging_thread_index (doc: n/a)
			0,           //aging_measurement_voltage_mV (doc: voltage plan)
			0,			 //aging_sensor_id (doc: voltage plan)
			0,           //age_ro_kv (/1000 = 1.62) (doc: voltage plan)
			0,           //derate_scaling_factor (doc: voltage plan)
			0,           //max_age_compensation (mV) (doc: voltage plan)
			0,           //bypass_sensor (doc: voltage plan)
            //---------------------------------------------------------------------------------------------------------------------
            //  SAW4 Setting
			//  ------------
			0x17830800, //saw_register_addr
			0x400,      //saw_register_size
			1, 			//saw_enable
			1,			//saw_ctl_sel
			0,			//saw_tmr_clk_div
			1,			//saw_vlvl_width
			1,			//saw_vlvl_step_up
			1,			//saw_vlvl_step_dn
            //---------------------------------------------------------------------------------------------------------------------
            //  Thread 0 SW Setting
            //  -------------------             thread#  clk_domain_name  up_threshold  dn_threshold  consecutive_up  consecutive_dn  
            //                                  -------  ---------------  ------------  ------------  --------------  --------------  
            Package(){"CPRH_SW_THREAD_SETTING",      0,          "Gold",            2,            2,              0,              2,   },
         },
      },
      Package(){
         "CPRH_CHIP_INFO",
         321, // chip ID
         2,   // chip version
         //-----------------------------------------------------------------------------------------
         //  APC Controller SW Setting
         //  -------------------------
         //
         //-----------------------------------------------------------------------------------------
         Package(){
            "CPRH_SW_CONTROLLER_SETTING",
			0,          //instance_num (doc: CPR SW)
			"APC0",     //rail_name	(doc: voltage plan)
			0x17DC0000, //cpr_register_addr (doc: SWI)
			0x4000,     //cpr_register_size (doc: SWI)
			0,          //count_mode (doc: voltage plan)
			20,         //count_repeat (doc: voltage plan)
			15,         //idle_clocks (doc: voltage plan)
			12,         //step_quot_max (doc: voltage plan)
			11,         //step_quot_min (doc: voltage plan)
			1,          //reset_step_quot_loop_en (doc: voltage plan) - TBD
			8,          //number_of_sensors (doc: HPG)
			0xf0,       //sensor_thread_mask (doc: HPG) L3 using sensor #0,1,2,3
			0,          //sensor_mask (doc: voltage plan)
			0,          //sensor_bypass (doc: voltage plan)
			0x17700,    //auto_cont_interval (doc: voltage plan) //5ms
			400,        //base_voltage_mV (doc: CPR SW)
			4,          //voltage_multiplier (doc: CPR HPG)
			4,          //target_multiplier (doc: CPR HPG)
			5,          //mode_switch_timer (doc: voltage plan)
			0,          //initial_mode (doc: CPR HPG)
			1,          //temp_sensor_id_start (doc: CPR HPG)
			5,          //temp_sensor_id_end (doc: CPR HPG)
			1,          //error_step_limit_dn (doc: voltage plan)
			1,          //error_step_limit_up (doc: voltage plan)
			1,          //thread_aggregation_enable (doc: CPR HPG)
			1,          //thread_has_always_vote (doc: CPR HPG)
			23,			//1.2us/19.2MHz MarginTimerSettleVoltage (doc: CPR HPG) - TBD - PMIC delay for one step / CPR clock period
			0x4b00,		//MarginTimerLowerVoltage (doc: CPR HPG)
            //Below are temp adj related - Setting to zero for now.
			0,			//MarginInitialTempBand; (doc: voltage plan)
			4,			//MarginMaxNumCores; (doc: CPUSS HPG)
			1,			//MarginLowerVoltageWaitSelect; (doc: CPR HPG)
			4,			//MarginPmicStepSize; (doc: PMIC HPG)
			1,			//MarginClosedLoopEn; (doc: CPR HPG)
			0,			//MarginCoreAdjEn; (doc: CPR HPG)
			0,			//MarginTempAdjEn; (doc: CPR HPG)
            //---------------------------------------------------------------------------------------------------------------------
            //  Aging Setting
			//  ------------
			"",          //aging_rail_id (doc: power grid)
			0,			 //aging_thread_index (doc: n/a)
			0,           //aging_measurement_voltage_mV (doc: voltage plan)
			0,			 //aging_sensor_id (doc: voltage plan)
			0,           //age_ro_kv (/1000 = 1.62) (doc: voltage plan)
			0,           //derate_scaling_factor (doc: voltage plan)
			0,           //max_age_compensation (mV) (doc: voltage plan)
			0,           //bypass_sensor (doc: voltage plan)
            //---------------------------------------------------------------------------------------------------------------------
            //  SAW4 Setting
			//  ------------
			0x17840800, //saw_register_addr
			0x400,      //saw_register_size
			1, 			//saw_enable
			1,			//saw_ctl_sel
			0,			//saw_tmr_clk_div
			1,			//saw_vlvl_width
			1,			//saw_vlvl_step_up
			1,			//saw_vlvl_step_dn
            //---------------------------------------------------------------------------------------------------------------------
            //  Thread 0 SW Setting //TBD - Voltage plan does not have entries for L3 for settings below
            //  -------------------             thread#  clk_domain_name  up_threshold  dn_threshold  consecutive_up  consecutive_dn  
            //                                  -------  ---------------  ------------  ------------  --------------  --------------  
			Package(){"CPRH_SW_THREAD_SETTING",      0,        "L3",            2,            2,              0,              0,   }, 
            //---------------------------------------------------------------------------------------------------------------------
            //  Thread 1 SW Setting
            //  -------------------             thread#  clk_domain_name  up_threshold  dn_threshold  consecutive_up  consecutive_dn  
            //                                  -------  ---------------  ------------  ------------  --------------  --------------  
            Package(){"CPRH_SW_THREAD_SETTING",      1,        "Silver",        2,            2,              0,              0,   },
         },
		 Package(){
            "CPRH_SW_CONTROLLER_SETTING",
			1,          //instance_num
			"APC1",     //rail_name
			0x17DB0000, //cpr_register_addr
			0x4000,     //cpr_register_size
			0,          //count_mode
			20,         //count_repeat
			15,         //idle_clocks
			14,         //step_quot_max
			9,          //step_quot_min
			1,          //reset_step_quot_loop_en //TBD
			14,         //number_of_sensors
			0,          //sensor_thread_mask //Assigning to thread0
			0,          //sensor_mask
			0,          //sensor_bypass
			0x17700,    //auto_cont_interval
			400,        //base_voltage_mV
			4,          //voltage_multiplier
			4,          //target_multiplier
			5,          //mode_switch_timer
			0,          //initial_mode
			6,          //temp_sensor_id_start
			10,         //temp_sensor_id_end
			1,          //error_step_limit_dn
			1,          //error_step_limit_up
			0,          //thread_aggregation_enable
			0,          //thread_has_always_vote (doc: CPR HPG)
			23,			//1.2us/19.2MHz MarginTimerSettleVoltage
			0x4b00,		//MarginTimerLowerVoltage
            //Below are temp adj related - Setting to zero for now.
			0,			//MarginInitialTempBand;
			4,			//MarginMaxNumCores;
			1,			//MarginLowerVoltageWaitSelect;
			4,			//MarginPmicStepSize;
			1,			//MarginClosedLoopEn;
			0,			//MarginCoreAdjEn;
			0,			//MarginTempAdjEn;
            //---------------------------------------------------------------------------------------------------------------------
            //  Aging Setting
			//  ------------
			"",          //aging_rail_id (doc: power grid)
			0,			 //aging_thread_index (doc: n/a)
			0,           //aging_measurement_voltage_mV (doc: voltage plan)
			0,			 //aging_sensor_id (doc: voltage plan)
			0,           //age_ro_kv (/1000 = 1.62) (doc: voltage plan)
			0,           //derate_scaling_factor (doc: voltage plan)
			0,           //max_age_compensation (mV) (doc: voltage plan)
			0,           //bypass_sensor (doc: voltage plan)
            //---------------------------------------------------------------------------------------------------------------------
            //  SAW4 Setting
			//  ------------
			0x17830800, //saw_register_addr
			0x400,      //saw_register_size
			1, 			//saw_enable
			1,			//saw_ctl_sel
			0,			//saw_tmr_clk_div
			1,			//saw_vlvl_width
			1,			//saw_vlvl_step_up
			1,			//saw_vlvl_step_dn
            //---------------------------------------------------------------------------------------------------------------------
            //  Thread 0 SW Setting
            //  -------------------             thread#  clk_domain_name  up_threshold  dn_threshold  consecutive_up  consecutive_dn  
            //                                  -------  ---------------  ------------  ------------  --------------  --------------  
            Package(){"CPRH_SW_THREAD_SETTING",      0,          "Gold",            2,            2,              0,              2,   },
         },
      },
      Package(){
         "CPRH_CHIP_INFO",
         341, // chip ID
         1,   // chip version
         //-----------------------------------------------------------------------------------------
         //  APC Controller SW Setting
         //  -------------------------
         //
         //-----------------------------------------------------------------------------------------
         Package(){
            "CPRH_SW_CONTROLLER_SETTING",
			0,          //instance_num (doc: CPR SW)
			"APC0",     //rail_name	(doc: voltage plan)
			0x17DC0000, //cpr_register_addr (doc: SWI)
			0x4000,     //cpr_register_size (doc: SWI)
			0,          //count_mode (doc: voltage plan)
			20,         //count_repeat (doc: voltage plan)
			15,         //idle_clocks (doc: voltage plan)
			12,         //step_quot_max (doc: voltage plan)
			11,         //step_quot_min (doc: voltage plan)
			1,          //reset_step_quot_loop_en (doc: voltage plan) - TBD
			8,          //number_of_sensors (doc: HPG)
			0xf0,       //sensor_thread_mask (doc: HPG) L3 using sensor #0,1,2,3
			0,          //sensor_mask (doc: voltage plan)
			0,          //sensor_bypass (doc: voltage plan)
			0x17700,    //auto_cont_interval (doc: voltage plan) //5ms
			400,        //base_voltage_mV (doc: CPR SW)
			4,          //voltage_multiplier (doc: CPR HPG)
			4,          //target_multiplier (doc: CPR HPG)
			5,          //mode_switch_timer (doc: voltage plan)
			0,          //initial_mode (doc: CPR HPG)
			1,          //temp_sensor_id_start (doc: CPR HPG)
			5,          //temp_sensor_id_end (doc: CPR HPG)
			1,          //error_step_limit_dn (doc: voltage plan)
			1,          //error_step_limit_up (doc: voltage plan)
			1,          //thread_aggregation_enable (doc: CPR HPG)
			1,          //thread_has_always_vote (doc: CPR HPG)
			23,			//1.2us/19.2MHz MarginTimerSettleVoltage (doc: CPR HPG) - TBD - PMIC delay for one step / CPR clock period
			0x4b00,		//MarginTimerLowerVoltage (doc: CPR HPG)
            //Below are temp adj related - Setting to zero for now.
			0,			//MarginInitialTempBand; (doc: voltage plan)
			4,			//MarginMaxNumCores; (doc: CPUSS HPG)
			1,			//MarginLowerVoltageWaitSelect; (doc: CPR HPG)
			4,			//MarginPmicStepSize; (doc: PMIC HPG)
			1,			//MarginClosedLoopEn; (doc: CPR HPG)
			0,			//MarginCoreAdjEn; (doc: CPR HPG)
			0,			//MarginTempAdjEn; (doc: CPR HPG)
            //---------------------------------------------------------------------------------------------------------------------
            //  Aging Setting
			//  ------------
			"",          //aging_rail_id (doc: power grid)
			0,			 //aging_thread_index (doc: n/a)
			0,           //aging_measurement_voltage_mV (doc: voltage plan)
			0,			 //aging_sensor_id (doc: voltage plan)
			0,           //age_ro_kv (/1000 = 1.62) (doc: voltage plan)
			0,           //derate_scaling_factor (doc: voltage plan)
			0,           //max_age_compensation (mV) (doc: voltage plan)
			0,           //bypass_sensor (doc: voltage plan)
            //---------------------------------------------------------------------------------------------------------------------
            //  SAW4 Setting
			//  ------------
			0x17840800, //saw_register_addr
			0x400,      //saw_register_size
			1, 			//saw_enable
			1,			//saw_ctl_sel
			0,			//saw_tmr_clk_div
			1,			//saw_vlvl_width
			1,			//saw_vlvl_step_up
			1,			//saw_vlvl_step_dn
            //---------------------------------------------------------------------------------------------------------------------
            //  Thread 0 SW Setting //TBD - Voltage plan does not have entries for L3 for settings below
            //  -------------------             thread#  clk_domain_name  up_threshold  dn_threshold  consecutive_up  consecutive_dn  
            //                                  -------  ---------------  ------------  ------------  --------------  --------------  
			Package(){"CPRH_SW_THREAD_SETTING",      0,        "Silver",        2,            2,              0,              0,   }, 
            //---------------------------------------------------------------------------------------------------------------------
            //  Thread 1 SW Setting
            //  -------------------             thread#  clk_domain_name  up_threshold  dn_threshold  consecutive_up  consecutive_dn  
            //                                  -------  ---------------  ------------  ------------  --------------  --------------  
            Package(){"CPRH_SW_THREAD_SETTING",      1,        "L3",            2,            2,              0,              0,   },
         },
		 Package(){
            "CPRH_SW_CONTROLLER_SETTING",
			1,          //instance_num
			"APC1",     //rail_name
			0x17DB0000, //cpr_register_addr
			0x4000,     //cpr_register_size
			0,          //count_mode
			20,         //count_repeat
			15,         //idle_clocks
			14,         //step_quot_max
			9,          //step_quot_min
			1,          //reset_step_quot_loop_en //TBD
			14,         //number_of_sensors
			0,          //sensor_thread_mask //Assigning to thread0
			0,          //sensor_mask
			0,          //sensor_bypass
			0x17700,    //auto_cont_interval
			400,        //base_voltage_mV
			4,          //voltage_multiplier
			4,          //target_multiplier
			5,          //mode_switch_timer
			0,          //initial_mode
			6,          //temp_sensor_id_start
			10,         //temp_sensor_id_end
			1,          //error_step_limit_dn
			1,          //error_step_limit_up
			0,          //thread_aggregation_enable
			0,          //thread_has_always_vote (doc: CPR HPG)
			23,			//1.2us/19.2MHz MarginTimerSettleVoltage
			0x4b00,		//MarginTimerLowerVoltage
            //Below are temp adj related - Setting to zero for now.
			0,			//MarginInitialTempBand;
			4,			//MarginMaxNumCores;
			1,			//MarginLowerVoltageWaitSelect;
			4,			//MarginPmicStepSize;
			1,			//MarginClosedLoopEn;
			0,			//MarginCoreAdjEn;
			0,			//MarginTempAdjEn;
            //---------------------------------------------------------------------------------------------------------------------
            //  Aging Setting
			//  ------------
			"",          //aging_rail_id (doc: power grid)
			0,			 //aging_thread_index (doc: n/a)
			0,           //aging_measurement_voltage_mV (doc: voltage plan)
			0,			 //aging_sensor_id (doc: voltage plan)
			0,           //age_ro_kv (/1000 = 1.62) (doc: voltage plan)
			0,           //derate_scaling_factor (doc: voltage plan)
			0,           //max_age_compensation (mV) (doc: voltage plan)
			0,           //bypass_sensor (doc: voltage plan)
            //---------------------------------------------------------------------------------------------------------------------
            //  SAW4 Setting
			//  ------------
			0x17830800, //saw_register_addr
			0x400,      //saw_register_size
			1, 			//saw_enable
			1,			//saw_ctl_sel
			0,			//saw_tmr_clk_div
			1,			//saw_vlvl_width
			1,			//saw_vlvl_step_up
			1,			//saw_vlvl_step_dn
            //---------------------------------------------------------------------------------------------------------------------
            //  Thread 0 SW Setting
            //  -------------------             thread#  clk_domain_name  up_threshold  dn_threshold  consecutive_up  consecutive_dn  
            //                                  -------  ---------------  ------------  ------------  --------------  --------------  
            Package(){"CPRH_SW_THREAD_SETTING",      0,          "Gold",            2,            2,              0,              2,   },
         },
      },
      Package(){
         "CPRH_CHIP_INFO",
         341, // chip ID
         2,   // chip version
         //-----------------------------------------------------------------------------------------
         //  APC Controller SW Setting
         //  -------------------------
         //
         //-----------------------------------------------------------------------------------------
         Package(){
            "CPRH_SW_CONTROLLER_SETTING",
			0,          //instance_num (doc: CPR SW)
			"APC0",     //rail_name	(doc: voltage plan)
			0x17DC0000, //cpr_register_addr (doc: SWI)
			0x4000,     //cpr_register_size (doc: SWI)
			0,          //count_mode (doc: voltage plan)
			20,         //count_repeat (doc: voltage plan)
			15,         //idle_clocks (doc: voltage plan)
			12,         //step_quot_max (doc: voltage plan)
			11,         //step_quot_min (doc: voltage plan)
			1,          //reset_step_quot_loop_en (doc: voltage plan) - TBD
			8,          //number_of_sensors (doc: HPG)
			0xf0,       //sensor_thread_mask (doc: HPG) L3 using sensor #0,1,2,3
			0,          //sensor_mask (doc: voltage plan)
			0,          //sensor_bypass (doc: voltage plan)
			0x17700,    //auto_cont_interval (doc: voltage plan) //5ms
			400,        //base_voltage_mV (doc: CPR SW)
			4,          //voltage_multiplier (doc: CPR HPG)
			4,          //target_multiplier (doc: CPR HPG)
			5,          //mode_switch_timer (doc: voltage plan)
			0,          //initial_mode (doc: CPR HPG)
			1,          //temp_sensor_id_start (doc: CPR HPG)
			5,          //temp_sensor_id_end (doc: CPR HPG)
			1,          //error_step_limit_dn (doc: voltage plan)
			1,          //error_step_limit_up (doc: voltage plan)
			1,          //thread_aggregation_enable (doc: CPR HPG)
			1,          //thread_has_always_vote (doc: CPR HPG)
			23,			//1.2us/19.2MHz MarginTimerSettleVoltage (doc: CPR HPG) - TBD - PMIC delay for one step / CPR clock period
			0x4b00,		//MarginTimerLowerVoltage (doc: CPR HPG)
            //Below are temp adj related - Setting to zero for now.
			0,			//MarginInitialTempBand; (doc: voltage plan)
			4,			//MarginMaxNumCores; (doc: CPUSS HPG)
			1,			//MarginLowerVoltageWaitSelect; (doc: CPR HPG)
			4,			//MarginPmicStepSize; (doc: PMIC HPG)
			1,			//MarginClosedLoopEn; (doc: CPR HPG)
			0,			//MarginCoreAdjEn; (doc: CPR HPG)
			0,			//MarginTempAdjEn; (doc: CPR HPG)
            //---------------------------------------------------------------------------------------------------------------------
            //  Aging Setting
			//  ------------
			"",          //aging_rail_id (doc: power grid)
			0,			 //aging_thread_index (doc: n/a)
			0,           //aging_measurement_voltage_mV (doc: voltage plan)
			0,			 //aging_sensor_id (doc: voltage plan)
			0,           //age_ro_kv (/1000 = 1.62) (doc: voltage plan)
			0,           //derate_scaling_factor (doc: voltage plan)
			0,           //max_age_compensation (mV) (doc: voltage plan)
			0,           //bypass_sensor (doc: voltage plan)
            //---------------------------------------------------------------------------------------------------------------------
            //  SAW4 Setting
			//  ------------
			0x17840800, //saw_register_addr
			0x400,      //saw_register_size
			1, 			//saw_enable
			1,			//saw_ctl_sel
			0,			//saw_tmr_clk_div
			1,			//saw_vlvl_width
			1,			//saw_vlvl_step_up
			1,			//saw_vlvl_step_dn
            //---------------------------------------------------------------------------------------------------------------------
            //  Thread 0 SW Setting //TBD - Voltage plan does not have entries for L3 for settings below
            //  -------------------             thread#  clk_domain_name  up_threshold  dn_threshold  consecutive_up  consecutive_dn  
            //                                  -------  ---------------  ------------  ------------  --------------  --------------  
			Package(){"CPRH_SW_THREAD_SETTING",      0,        "Silver",        2,            2,              0,              0,   }, 
            //---------------------------------------------------------------------------------------------------------------------
            //  Thread 1 SW Setting
            //  -------------------             thread#  clk_domain_name  up_threshold  dn_threshold  consecutive_up  consecutive_dn  
            //                                  -------  ---------------  ------------  ------------  --------------  --------------  
            Package(){"CPRH_SW_THREAD_SETTING",      1,        "L3",            2,            2,              0,              0,   },
         },
		 Package(){
            "CPRH_SW_CONTROLLER_SETTING",
			1,          //instance_num
			"APC1",     //rail_name
			0x17DB0000, //cpr_register_addr
			0x4000,     //cpr_register_size
			0,          //count_mode
			20,         //count_repeat
			15,         //idle_clocks
			14,         //step_quot_max
			9,          //step_quot_min
			1,          //reset_step_quot_loop_en //TBD
			14,         //number_of_sensors
			0,          //sensor_thread_mask //Assigning to thread0
			0,          //sensor_mask
			0,          //sensor_bypass
			0x17700,    //auto_cont_interval
			400,        //base_voltage_mV
			4,          //voltage_multiplier
			4,          //target_multiplier
			5,          //mode_switch_timer
			0,          //initial_mode
			6,          //temp_sensor_id_start
			10,         //temp_sensor_id_end
			1,          //error_step_limit_dn
			1,          //error_step_limit_up
			0,          //thread_aggregation_enable
			0,          //thread_has_always_vote (doc: CPR HPG)
			23,			//1.2us/19.2MHz MarginTimerSettleVoltage
			0x4b00,		//MarginTimerLowerVoltage
            //Below are temp adj related - Setting to zero for now.
			0,			//MarginInitialTempBand;
			4,			//MarginMaxNumCores;
			1,			//MarginLowerVoltageWaitSelect;
			4,			//MarginPmicStepSize;
			1,			//MarginClosedLoopEn;
			0,			//MarginCoreAdjEn;
			0,			//MarginTempAdjEn;
            //---------------------------------------------------------------------------------------------------------------------
            //  Aging Setting
			//  ------------
			"",          //aging_rail_id (doc: power grid)
			0,			 //aging_thread_index (doc: n/a)
			0,           //aging_measurement_voltage_mV (doc: voltage plan)
			0,			 //aging_sensor_id (doc: voltage plan)
			0,           //age_ro_kv (/1000 = 1.62) (doc: voltage plan)
			0,           //derate_scaling_factor (doc: voltage plan)
			0,           //max_age_compensation (mV) (doc: voltage plan)
			0,           //bypass_sensor (doc: voltage plan)
            //---------------------------------------------------------------------------------------------------------------------
            //  SAW4 Setting
			//  ------------
			0x17830800, //saw_register_addr
			0x400,      //saw_register_size
			1, 			//saw_enable
			1,			//saw_ctl_sel
			0,			//saw_tmr_clk_div
			1,			//saw_vlvl_width
			1,			//saw_vlvl_step_up
			1,			//saw_vlvl_step_dn
            //---------------------------------------------------------------------------------------------------------------------
            //  Thread 0 SW Setting
            //  -------------------             thread#  clk_domain_name  up_threshold  dn_threshold  consecutive_up  consecutive_dn  
            //                                  -------  ---------------  ------------  ------------  --------------  --------------  
            Package(){"CPRH_SW_THREAD_SETTING",      0,          "Gold",            2,            2,              0,              2,   },
         },
      },
    })
}
