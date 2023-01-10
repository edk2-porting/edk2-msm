//
        //CPU Aggregator Device -- Required for Thermal Parking
        Device(AGR0)
        {
            Name(_HID, "ACPI000C")
            Name(_PUR, Package() {1, 0})
            Method(_OST, 0x3, NotSerialized)
            {
                Store(Arg2, \_SB_.PEP0.ROST)
            }
        }

        //---------------------------------------------------------------------
        //
        //        Thermal Zones for QC reference hardware     
        //
        //TZ0 - TZ39 are thermal zones developed by QC for reference hardware
        //and can be modified by the OEMs.
        //---------------------------------------------------------------------

        //---------------------------------------------------------------------
        //        Thermal Zones(0-19) for CPU sensors
        //24AD - Little CPU virtual sensor
        //24AE - Big CPU virtual sensor
		// This thermal zone is only used for temperature logging for little CPUs
		// as you may notice that _PSV, _TC1, _TC2, _TSP params are removed.
		// This is the passive cooling mechanism by dialing down frequency is now
		// done actively by hardware.
        //---------------------------------------------------------------------
        ThermalZone (TZ0) {
            Name (_HID, "QCOM02B0")
            Name (_UID, 0)
            Name(_TZD, Package (){\_SB.SYSM.CLUS.CPU0, \_SB.SYSM.CLUS.CPU1, \_SB.SYSM.CLUS.CPU2, \_SB.SYSM.CLUS.CPU3})
			Method(_DEP) {
                Return (Package() {\_SB.PEP0})
            }
        } // end of TZ0

        //Regular Thermal Zone for Little CPU TSENS to Park cores at 110C
        ThermalZone (TZ1) {
            Name (_HID, "QCOM02B0")
            Name (_UID, 1)
            Name(_TZD, Package (){\_SB.PEP0})
			Name(TPSV, 3830)
	        Method(_PSV) { Return (\_SB.TZ1.TPSV) }
			Name(_MTL, 20)		// minimum throttle limit
			//Control how aggressively the thermal manager applies thermal 
			//throttling performance against temperature change.
			Name(TTC1, 0)
			Method(_TC1) { Return (\_SB.TZ1.TTC1) }
			
			// _TC2 Controls how aggressively the thermal manager applies thermal 
			// throttling performance against temperature delta between the 
			// current temperature and _PSV.
			// once the temp goes above _PSV, we like to have aggressive 
			// throttling based on  how far above the temp is above the threshold.
			// Since that is controlled via _TC2, we like it to be high.
			// please refer to the ACPI spec 6.0 to understand the significance of 
			// _TC2 or take a look at the explanation at the top of this file.
			Name(TTC2, 1)
			Method(_TC2) { Return (\_SB.TZ1.TTC2) }
			
			// Appropriate temperature sampling interval for the zone in tenths 
			// of a second. The thermal manager uses this interval to determine 
			// how often it should evaluate the thermal throttling performance. 
			// Must be greater than zero. For more information, see Thermal 
			// throttling algorithm on msdn page
			// https://msdn.microsoft.com/en-us/library/windows/hardware/mt643928(v=vs.85).aspx			
            Name(TTSP, 50)
			Method(_TSP) { Return (\_SB.TZ1.TTSP) }
			
			// This optional object evaluates to a recommended polling frequency 
			// (in tenths of seconds) for this thermal zone. A value of zero indicates
            // that OSPM does not need to poll the temperature of this thermal zone in 
			// order to detect temperature changes (the hardware is capable of 
			// generating asynchronous notifications).
			// TZP should be marked 0 for all thermal zones as our TSENS sensors 
			// generate interrupts to complete thermal IOCTL read call.
            Name(_TZP, 0) 

			Method(_DEP) {
                Return (Package() {\_SB.PEP0})
            }
        } // end of TZ1

		// This thermal zone is only used for temperature logging for Big CPUs
		// as you may notice that _PSV, _TC1, _TC2, _TSP params are removed.
		// This is the passive cooling mechanism by dialing down frequency is now
		// done actively by hardware.
        ThermalZone (TZ2) {
            Name (_HID, "QCOM02B1")
            Name (_UID, 0)
            Name(_TZD, Package (){\_SB.SYSM.CLUS.CPU4, \_SB.SYSM.CLUS.CPU5, \_SB.SYSM.CLUS.CPU6, \_SB.SYSM.CLUS.CPU7})
			Method(_DEP) {
                Return (Package() {\_SB.PEP0})
            }
        } // end of TZ2

        //Regular Thermal Zone for BigCPU TSENS to Park cores at 110C
        ThermalZone (TZ3) {
            Name (_HID, "QCOM02B1")
            Name (_UID, 1)
            Name(_TZD, Package (){\_SB.PEP0})
			
			Name(TPSV, 3830)
	        Method(_PSV) { Return (\_SB.TZ3.TPSV) }			
			Name(TTC1, 0)
			Method(_TC1) { Return (\_SB.TZ3.TTC1) }
			Name(TTC2, 1)
			Method(_TC2) { Return (\_SB.TZ3.TTC2) }
            Name(TTSP, 1)
			Method(_TSP) { Return (\_SB.TZ3.TTSP) }
            Name(_MTL, 20)     // minimum throttle limit
            Name(_TZP, 0)

			Method(_DEP) {
                Return (Package() {\_SB.PEP0})
            }
        } // end of TZ3

        //---------------------------------------------------------------------
        //        Thermal Zones(20-21) for GPU TSENS
        //
        // \_SB.GPU0 should be used for GPU thermal mitigation, and 
        // \_SB.GPU0.AVS0 should be used for MDSS/Video thermal mitigation.
        // Currently there is no handling for Video thermal mitigation.
        // When needed, Video will be added to GPU0.AVS0 interface.
        //---------------------------------------------------------------------
        //Thermal zone for TSENS11 dial back GPUs at 95C
        ThermalZone (TZ20) {
            Name (_HID, "QCOM02AB")
            Name (_UID, 0)
            Name(_TZD, Package (){\_SB.GPU0})
            Name(TPSV, 3680)
	        Method(_PSV) { Return (\_SB.TZ20.TPSV) }	
            Name(TTC1, 1)
			Method(_TC1) { Return (\_SB.TZ20.TTC1) }
          // For non-cpu devices, tc2 should be atleast 5, please refer to the 
          // explanation at the top of the file or msdn link for thermal guide.
            Name(TTC2, 2)
			Method(_TC2) { Return (\_SB.TZ20.TTC2) }
            // For non-cpu devices, _tsp should be 20 or 30
            Name(TTSP, 2)
			Method(_TSP) { Return (\_SB.TZ20.TTSP) }
            Name(_TZP, 0)
			Method(_DEP) {
                Return (Package() {\_SB.PEP0})
            }
        } // end of TZ20

        //Thermal zone for TSENS12 to dial back GPUs at 95C
        ThermalZone (TZ21) {
            Name (_HID, "QCOM02AC")
            Name (_UID, 0)
            Name(_TZD, Package (){\_SB.GPU0})
            Name(TPSV, 3680)
	        Method(_PSV) { Return (\_SB.TZ21.TPSV) }
			Name(TTC1, 1)
			Method(_TC1) { Return (\_SB.TZ21.TTC1) }
            Name(TTC2, 2)
			Method(_TC2) { Return (\_SB.TZ21.TTC2) }
			Name(TTSP, 2)
			Method(_TSP) { Return (\_SB.TZ21.TTSP) }
            Name(_TZP, 0)
			Method(_DEP) {
                Return (Package() {\_SB.PEP0})
            }
        } // end of TZ21

        //---------------------------------------------------------------------
        //        Thermal Zones for QDSP TSENS
        //4/16/15: TODO waiting to get a new HID assigned for TSENS17
        //---------------------------------------------------------------------
        //Thermall zone for TSENS14 dial back MSM at 95C
        //ThermalZone (TZ31) {
            //Name (_HID, "QCOM02AE")
            //Name (_UID, 0)
            //Name(_TZD, Package (){
                //\_SB.SYSM.CLUS.CPU0, \_SB.SYSM.CLUS.CPU1, \_SB.SYSM.CLUS.CPU2, \_SB.SYSM.CLUS.CPU3,
                //\_SB.PEP0, \_SB.GPU0.MON0, \_SB.GPU0})
            //Method(_PSV) { Return (3680) }
            //Name(_TC1, 1)
            //Name(_TC2, 2)
            //Name(_TSP, 10)
            //Name(_TZP, 0)
			//Method(_DEP) {
            //    Return (Package() {\_SB.PEP0})
            //}
        //} // end of TZ31

        //---------------------------------------------------------------------
        //        Thermal Zones for Camera TSENS
        //---------------------------------------------------------------------
        //Thermal zone for TSENS17 to dial back MSM at 95C
        // ThermalZone (TZ32) {
        //     Name (_HID, "QCOM02C9")
        //     Name (_UID, 0)
        //     Name(_TZD, Package (){\_SB.GPU0.AVS0})
        //     Name(TPSV, 3680)
        //     Method(_PSV) { Return (\_SB.TZ32.TPSV) }
        //     Name(TTC1, 1)
        //     Method(_TC1) { Return (\_SB.TZ32.TTC1) }
        //   // For non-cpu devices, tc2 should be atleast 5, please refer to the 
        //   // explanation at the top of the file or msdn link for thermal guide.
        //     Name(TTC2, 2) 
        //     Method(_TC2) { Return (\_SB.TZ32.TTC2) }
        //     // For non-cpu devices, _tsp should be 20 or 30
        //     Name(TTSP, 10) 
        //     Method(_TSP) { Return (\_SB.TZ32.TTSP) }           
        //     Name(_TZP, 0)
        //     Method(_DEP) {
        //         Return (Package() {\_SB.PEP0})
        //     }
        // } // end of TZ32

        ThermalZone (TZ33) {
            Name (_HID, "QCOM02CB")
            Name (_UID, 1)
            Name(_TZD, Package (){\_SB.AMSS})
			
			Name(TPSV, 3680)
	        Method(_PSV) { Return (\_SB.TZ33.TPSV) }
			
			Name(TTC1, 1)
	        Method(_TC1) { Return (\_SB.TZ33.TTC1) }		
			
			Name(TTC2, 2)
	        Method(_TC2) { Return (\_SB.TZ33.TTC2) }
			
			Name(TTSP, 10)
	        Method(_TSP) { Return (\_SB.TZ33.TTSP) }           
            
            Name(_TZP, 0)
            Method(_DEP) {
            Return (Package() {\_SB.PEP0})
            }
        }

        //---------------------------------------------------------------------
        //        Thermal Zones for MDSS TENS (Display Subsystem)
        // Only the MDP Blt engine and Rotator engines on the MDSS are cooled 
        // using this interface. Display cooling is not supported currently.
        //---------------------------------------------------------------------
        //Thermal zone for TSENS18 to dial back MSM at 95C
        //ThermalZone (TZ34) {
            //Name (_HID, "QCOM02CA")
            //Name (_UID, 0)
            //Name(_TZD, Package (){\_SB.GPU0.AVS0})
            //Method(_PSV) { Return (3680) }
            //Name(_TC1, 1)
            //Name(_TC2, 2)
            //Name(_TSP, 10)
            //Name(_TZP, 0)
			//Method(_DEP) {
            //    Return (Package() {\_SB.PEP0})
            //}
        //} // end of TZ34

        //---------------------------------------------------------------------
        //        Thermal Zones for ADC Channels 
        //---------------------------------------------------------------------
        //Thermal zone for PMIC_THERM
        ThermalZone (TZ36) {
            Name (_HID, "QCOM029E")
            Name (_UID, 0)
            Name(_TZD, Package (){
                \_SB.SYSM.CLUS.CPU0, \_SB.SYSM.CLUS.CPU1, \_SB.SYSM.CLUS.CPU2, \_SB.SYSM.CLUS.CPU3,
				\_SB.SYSM.CLUS.CPU4, \_SB.SYSM.CLUS.CPU5, \_SB.SYSM.CLUS.CPU6, \_SB.SYSM.CLUS.CPU7,
                \_SB.PMBM})
            			
			Name(TPSV, 3780)
	        Method(_PSV) { Return (\_SB.TZ36.TPSV) }
			
			Name(TTC1, 4)
	        Method(_TC1) { Return (\_SB.TZ36.TTC1) }
            
			Name(TTC2, 3)
	        Method(_TC2) { Return (\_SB.TZ36.TTC2) }
			
			Name(TTSP, 50)
	        Method(_TSP) { Return (\_SB.TZ36.TTSP) }
            
            Name(_TZP, 0)
            Method(_DEP) {
                Return (Package() {\_SB.PEP0, \_SB.ADC1})
            }
        } // end of TZ36

        //Thermal zone for PMIC_THERM
        ThermalZone (TZ37) {
            Name (_HID, "QCOM029E")
            Name (_UID, 1)
            Name(_TZD, Package (){             
                \_SB.PEP0, \_SB.PMBM})
			Name(TPSV, 3980)
	        Method(_PSV) { Return (\_SB.TZ37.TPSV) }            
			Name(TCRT, 4180)
	        Method(_CRT) { Return (\_SB.TZ37.TCRT) }
			Name(TTC1, 4)
	        Method(_TC1) { Return (\_SB.TZ37.TTC1) }
			Name(TTC2, 3)
	        Method(_TC2) { Return (\_SB.TZ37.TTC2) }            
			Name(TTSP, 50)
	        Method(_TSP) { Return (\_SB.TZ37.TTSP) }
			
            Name(_TZP, 0)
            Method(_DEP) {
                Return (Package() {\_SB.PEP0, \_SB.ADC1})
            }
        } // end of TZ37
		
	//Example: Inverse Thermal zone for PMIC_THERM
        ThermalZone (TZ38) {
            Name (_HID, "QCOM029E")
            Name (_UID, 2)  //Update UID on addition of new thermal zone with same HID
            Name(_TZD, Package (){             
                \_SB.PEP0})
		    Method(INVT) { Return (1) }
	        Method(_MTL) { Return (60) }
			Name(TPSV, 2830)
	        Method(_PSV) { Return (\_SB.TZ38.TPSV) }
			Name(TTC1, 4)
	        Method(_TC1) { Return (\_SB.TZ38.TTC1) }
			Name(TTC2, 3)
	        Method(_TC2) { Return (\_SB.TZ38.TTC2) }
			Name(TTSP, 10)
	        Method(_TSP) { Return (\_SB.TZ38.TTSP) }
            Name(_TZP, 0)
            Method(_DEP) {
                Return (Package() {\_SB.PEP0, \_SB.ADC1})
            }
        } // end of TZ38
		
        //------------------------------------------------------------------------
        //        Thermal Zones for Wlan
        //------------------------------------------------------------------------
        //Thermal zone for iHelium, Wlan MAC&PHY on SOC
        ThermalZone (TZ40) {
            Name (_HID, "QCOM02AF")
            Name (_UID, 0)
            Name(_TZD, Package (){\_SB.COEX})
			
			Name(TPSV, 3580)
	        Method(_PSV) { Return (\_SB.TZ40.TPSV) }
			Name(TTC1, 1)
	        Method(_TC1) { Return (\_SB.TZ40.TTC1) }
			Name(TTC2, 5) // For non-cpu devices, tc2 should be atleast 5
	        Method(_TC2) { Return (\_SB.TZ40.TTC2) }			
			Name(TTSP, 30) // For non-cpu devices, _tsp should be 20 or 30
	        Method(_TSP) { Return (\_SB.TZ40.TTSP) }
			
            Name(_TZP, 0)
            Method(_DEP) {
                Return (Package() {\_SB.PEP0})
            }
        } // end of TZ40
        //Thermal zone for Cherokee, Wlan radio on WCN3990
        ThermalZone (TZ41) {
            Name (_HID, "QCOM0295")//virtual sensor by wlan WMI thermal interface
            Name (_UID, 1)
            //Name(_TZD, Package (){\_SB.COEX})       // Temperature report only
            //Method(_PSV) { Return (4030) }
            //Name(_TC1, 4)
            //Name(_TC2, 3)
            Name(_TSP, 50)
            Name(_TZP, 0)
        } // end of TZ41
		
		//------------------------------------------------------------------------
        //        Thermal Zones for DDR/POP
        //------------------------------------------------------------------------
        //Thermal zone for DDR
		//Thermal zone for TSENS20 to dial back Big CPU's at 95C
		
		ThermalZone (TZ44) {
            Name (_HID, "QCOM02CC")
            Name (_UID, 0)
            Name(_TZD, Package (){\_SB.SYSM.CLUS.CPU4, \_SB.SYSM.CLUS.CPU5, \_SB.SYSM.CLUS.CPU6, \_SB.SYSM.CLUS.CPU7})			
			Name(TPSV, 3680)
			Method(_PSV) { Return (\_SB.TZ44.TPSV) }			
			Name(TTC1, 0)
			Method(_TC1) { Return (\_SB.TZ44.TTC1) }
			Name(TTC2, 1)
			Method(_TC2) { Return (\_SB.TZ44.TTC2) }
			Name(TTSP, 1)
			Method(_TSP) { Return (\_SB.TZ44.TTSP) }            
            Name(_TZP, 0)
            Method(_DEP) {
            Return (Package() {\_SB.PEP0})
            }
        } // end of TZ44

    //---------------------------------------------------------------------
    //
    //                QC Recommended thermal limits starts
    //
    //TZ80 - TZ98 represent the thermal zones corresponding to QC 
    //recommended thermal limits. These thermal zones must not be removed
    //or tampered with.
    //---------------------------------------------------------------------
        //Thermal zone for TSENS2 at 70C to match the LA thermal limits
        //ThermalZone (TZ80) {
            //Name (_HID, "QCOM2472")
            //Name (_UID, 0)
            //Name(_TZD, Package (){
            //    \_SB.SYSM.CLUS.CPU0, \_SB.SYSM.CLUS.CPU1, \_SB.SYSM.CLUS.CPU2, \_SB.SYSM.CLUS.CPU3,
            //Method(_PSV) { Return (3430) }
            //Name(_TC1, 1)
            //Name(_TC2, 2)                                   
            //Name(_TSP, 10)                                  
            //Name(_TZP, 0) 
			//Method(_DEP) {
            //    Return (Package() {\_SB.PEP0})
            //}			
        //} // end of TZ80

        //Thermal zone near for TSENS2 to shutdown the system at 85C to match LA
        //thermal limits
        //ThermalZone (TZ81) {
            //Name (_HID, "QCOM2472")
            //Name (_UID, 1)
            //Name(_TZD, Package (){
            //    \_SB.SYSM.CLUS.CPU0, \_SB.SYSM.CLUS.CPU1, \_SB.SYSM.CLUS.CPU2, \_SB.SYSM.CLUS.CPU3,
            //    \_SB.PEP0})
            //Method(_PSV) { Return (3530) }
            //Method(_CRT) { Return (3580) }
            //Name(_TC1, 1)
            //Name(_TC2, 2)
            //Name(_TSP, 10)
            //Name(_TZP, 0)
			//Method(_DEP) {
            //    Return (Package() {\_SB.PEP0})
            //}
        //} // end of TZ81

    //Entry for BCL thermal zone
    ThermalZone (TZ98) {
        Name (_HID, "QCOM0294")
        Name (_UID, 0)
        Name(_TZD, Package (){
            \_SB.GPU0.MON0, \_SB.GPU0})
			
		Name(TPSV, 3630)
	    Method(_PSV) { Return (\_SB.TZ98.TPSV) }
		Name(TTC1, 1)
	    Method(_TC1) { Return (\_SB.TZ98.TTC1) }		
        //Method(_CRT) { Return (5630) }
		Name(TTC2, 5)
	    Method(_TC2) { Return (\_SB.TZ98.TTC2) }        
		Name(TTSP, 20)
	    Method(_TSP) { Return (\_SB.TZ98.TTSP) }
		
        Name(_TZP, 0)
		Method(_DEP) {
            Return (Package(0x2) {\_SB.PEP0,\_SB_.BCL1})
        }
    } // end of TZ98
		
        //---------------------------------------------------------------------
        //            Critical Thermal Zones for ALL TSENS
        //This sensor aggregates all the on chip TSENS into a single sensor
        //for ACPI thermal manager. By having a critical thermal zone on this
        //"virtual sensor" we don't have to add a critical thermal zone on every
        //sensor and hence reduce the number of thermal zones.
        //---------------------------------------------------------------------
        //Critical Thermal zone on MSM virtual sensor to shutdown entire system
        //at 110C.
        ThermalZone (TZ99) {
            Name (_HID, "QCOM02B2")
            Name (_UID, 100)
			
			Name(TCRT, 3830)
	        Method(_CRT) { Return (\_SB.TZ99.TCRT) }
			Name(TTC1, 4)
	        Method(_TC1) { Return (\_SB.TZ99.TTC1) }            
			Name(TTC2, 3)
	        Method(_TC2) { Return (\_SB.TZ99.TTC2) }
			Name(TTSP, 10)
	        Method(_TSP) { Return (\_SB.TZ99.TTSP) }            
            Name(_TZP, 0)
			
			Method(_DEP) {
                Return (Package() {\_SB.PEP0})
            }
        } // end of TZ99

    //---------------------------------------------------------------------
    //        QC Recommended thermal limits ends
    //---------------------------------------------------------------------     

    //---------------------------------------------------------------------
    //
    //        Sample Thermal Zones  for OEMs TZ40 - TZ79
    //
    //Sample TSENS thermal zone that can be added on any TSENS
    //---------------------------------------------------------------------
        //ThermalZone (TZ40) {
            //Name (_HID, "QCOM2470")
            //Name (_UID, 0)
            //Name(_TZD, Package (){
            //\_SB.SYSM.CLUS.CPU0, \_SB.SYSM.CLUS.CPU1, \_SB.SYSM.CLUS.CPU2, \_SB.SYSM.CLUS.CPU3,\_SB.SYSM.CLUS.CPU4, \_SB.SYSM.CLUS.CPU5,
            //\_SB.PEP0, <Your cooling device>})
            //Method(_PSV) { Return (3730) }
            //Method(_CRT) { Return (3780) }
            //Name(_TC1, 1)
            //Name(_TC2, 2)
            //Name(_TSP, 10) //Sampling rate of 1sec
            //Name(_TZP, 0)
			//Method(_DEP) {
            //    Return (Package() {\_SB.PEP0})
            //}
        //} // end of TZ40

        //ThermalZone (TZ41) {
            //Name (_HID, "QCOM2470")
            //Name (_UID, 0)
            //Name(_TZD, Package (){
            //\_SB.SYSM.CLUS.CPU0, \_SB.SYSM.CLUS.CPU1, \_SB.SYSM.CLUS.CPU2, \_SB.SYSM.CLUS.CPU3,\_SB.SYSM.CLUS.CPU4, \_SB.SYSM.CLUS.CPU5,
            //\_SB.PEP0, <Your cooling device>})
            //Method(_PSV) { Return (3730) }
            //Method(_CRT) { Return (3780) }
            //Name(_TC1, 1)
            //Name(_TC2, 2)
            //Name(_TSP, 50) //Sampling rate of 5sec
            //Name(_TZP, 0)
			//Method(_DEP) {
            //    Return (Package() {\_SB.PEP0})
            //}
        //} // end of TZ41
        
        
        //--------------------------------------------------------------------------//
        //
        //        Sample VADC Thermal zones for OEMs
        //
        //Following are sample thermal zones that use the off chip ADC thermistors
        //they are all currently using CPUs as a cooling device for a lack of better
        //option. The OEMs should change this.
        //--------------------------------------------------------------------------//

        //Thermal zone for SYS_THERM2
        // ThermalZone (TZ51) {
            // Name (_HID, "QCOM248D")
            // Name (_UID, 0)
            // Name(_TZD, Package (){
            //\_SB.SYSM.CLUS.CPU0, \_SB.SYSM.CLUS.CPU1, \_SB.SYSM.CLUS.CPU2, \_SB.SYSM.CLUS.CPU3,\_SB.SYSM.CLUS.CPU4, \_SB.SYSM.CLUS.CPU5,})
            // Method(_PSV) { Return (3830) }
            //Name(_TC1, 4)
            //Name(_TC2, 3)
            // Name(_TSP, 50)
            //Name(_TZP, 0)
			//Method(_DEP) {
            //    Return (Package() {\_SB.PEP0})
            //}
        // } // end of TZ51

        //Thermal zone for PA_THERM1
        // ThermalZone (TZ52) {
            // Name (_HID, "QCOM248E")
            // Name (_UID, 0)
            // Name(_TZD, Package (){\_SB.SYSM.CLUS.CPU0, \_SB.SYSM.CLUS.CPU1, \_SB.SYSM.CLUS.CPU2, \_SB.SYSM.CLUS.CPU3})
            // Method(_PSV) { Return (3430) }
            // Name(_TC1, 4)
            // Name(_TC2, 3)
            // Name(_TSP, 50)
            // Name(_TZP, 0)
			//Method(_DEP) {
            //    Return (Package() {\_SB.PEP0})
            //}
        // } // end of TZ52
