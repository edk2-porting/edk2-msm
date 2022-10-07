Include("cust_pmic_batt_enchilada.asl")

    //
    // PMIC Battery Manger Driver
    //
    Device (PMBT) {
        Name (_HID, "QCOM0264")
                Alias(\_SB.PSUB, _SUB)
            Name (_DEP, Package(0x2) {
                \_SB_.PMIC,
                \_SB_.ADC1,
                //\_SB_.PEIC
            })

        Method (_STA) {
            Return (0xB)    // Device is installable, functional & should not be visible in OSPM/Device Manager
        }

        Method (_CRS, 0x0, NotSerialized) {
        Name (RBUF, ResourceTemplate ()
        {
            //GpioInt(Edge, ActiveBoth, Shared, PullUp, 0, "\\_SB.PM01",,,,) {208} // 0x80 - PM_INT__SCHG_CHGR__CHGR_ERROR_RT_STS - Charger Error Interrupt
            //GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {336} // 0x210 - PM_INT__FG_BCL__IBT_HI - IBAT greater than threshold Interrupt.
            //GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {337} // 0x211 - PM_INT__FG_BCL__IBT_THI - VBatt less than threshold Interrupt
            //GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {352} // 0x220 - PM_INT__FG_MEM_IF__IMA_RDY - MEMIF access Interrupt
            //GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {215} // 0x87 - PM_INT__SCHG_CHGR__CHGR_7 - Termination Current Interrupt
            //GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {209} // 0x81 - PM_INT__SCHG_CHGR__CHARGING_STATE_CHANGE - Charger Inhibit Interrupt
            GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {329} // 0x209 - PM_INT__FG_BATT_INFO__VBT_LOW - VBAT_LOW Interrupt
            //GpioInt(Edge, ActiveBoth, Shared, PullUp, 0, "\\_SB.PM01",,,,) {240} // 0xA0 - PM_INT__SCHG_DC__DCIN_COLLAPSE - Qi Wireless Charger Interrupt
            GpioInt(Edge, ActiveHigh, Exclusive, PullUp, 0, "\\_SB.PM01",,,,) {331} // 0x20B - PM_INT__FG_BATT_INFO__BT_MISS - BATT_MISSING Interrupt
            GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {237} // 0x9D - PM_INT__SCHG_USB__USBIN_SOURCE_CHANGE - AICL_DONE IRQ (Rising Only)
            //GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {232} // 0x98 - PM_INT__SCHG_USB__USBIN_COLLAPSE - USB_UV IRQ (Rising Only)
            //GpioInt(Edge, ActiveHigh, Exclusive, PullUp, 0, "\\_SB.PM01",,,,) {322} // 0x202 - PM_INT__FG_BATT_SOC__BSOC_DELTA - FULL_SOC Interrupt
            //GpioInt(Edge, ActiveHigh, Exclusive, PullUp, 0, "\\_SB.PM01",,,,) {323} // 0x203 - PM_INT__FG_BATT_SOC__MSOC_DELTA - EMPTY_SOC Interrupt
            // GpioInt(Edge, ActiveHigh, Exclusive, PullUp, 0, "\\_SB.PM01",,,,) {213} // 0x85 - PM_INT__SCHG_CHGR__FG_FVCAL_QUALIFIED - FVCAL_QUALIFIED IRQ
            GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {224} // 0x90 - PM_INT__SCHG_BATIF__BAT_TEMP - Jeita limit interrupt

        })
        Return (RBUF)
        }

                 //ACPI methods for Battery Manager Device
                Method (BMNR) {
                        Name (CFG0,
                        Package(){
                        1,               //* 0: Select Platform: 0- No HW, 1- SMChg+FGGge, 2- SMB3pChg+SMB3pGge, 3- LBChg+VMBMS
                        0,               //* 1: Error State Handling: 0- Don’t Shutdown, 1- Shutdown
                        1,               //* 2: Listen to BatteryClass: 0- No 1- Yes
                        0,               //* 3: Test Mode Power Flag: 0- Discharging, 1- PowerOnline+Charging
                        "CUST_PMIC"  //* 4: cust_pmic config identifier
                        })
            Store(CUST, Index(CFG0, 4))
                        Return (CFG0)
                }

                //ACPI methods for Timer
                Method (BTIM) {
                        Name (CFG0,
                        Package(){
                        30000,  // Charging Heartbeat Timer
                        10000,  // Charging Tolerable Delay
                        300000, // Discharging Heartbeat Timer
                        120000, // Discharging Tolerable Delay
                        0,  // Poll Timer , 0=Timer not used.
                        0,      // Poll Tolerable Delay
                        28080000,               //Charging Timeout (TDone) Timer
                        0,              //Charging Timeout(TDone) Tolerable Delay
                        })
                        Return (CFG0)
                }


                //ACPI methods for  Battery Info
                Method (BBAT) {
                        Name (CFG0,
                        Package(){
                        1,                          //* 0: Battery Technology
                        0x4C494F4E,                 //* 1: Battery Chemistry: hex(LION)
                        0xFFFFFFFF,             //* 2: BFCC: (mWh), Design Capacity
                        0xFFFFFFFF,             //* 3: BFCC: (mWh), Full Charge Capacity
                        0xFFFFFFFF,                 //* 4: PCT1: (% of FCC),  Default Alert 1
                        0xFFFFFFFF,                 //* 5: PCT2: (% of FCC), Default Alert 2
                        "QCOMBATT01",           //* 6: Device Name
                        "Qualcomm",             //* 7: Manufacture Name
                        "QCOMBAT01_07012011",   //* 8: Battery Unique ID
                        "07012011",                     //* 9: Battery Serial Number
                        19,                     //* 10: Battery Manufacture Date
                        04,                         //* 11: Battery Manufacture Month
                        2014                    //* 12: Battery Manufacture Year
                        })
                        //Local2 = Default Alert1 = PCT1 * BFCC / 100
                        Multiply(PCT1,BFCC,Local0)
                        Divide(Local0, 100, Local1, Local2)
                        //Local3 = Default Alert2 = PCT2 * BFCC / 100
                        Multiply(PCT2,BFCC,Local0)
                        Divide(Local0, 100, Local1, Local3)
                        Store(BFCC, Index(CFG0, 2))
                        Store(BFCC, Index(CFG0, 3))
                        Store(Local2, Index(CFG0, 4))
                        Store(Local3, Index(CFG0, 5))
                        Return (CFG0)
                }

                //ACPI methods for  Proprietary chargers
                Method (BPCH) {
                        Name (CFG0,
                        Package(){
                        3000,       // QC2.0 charger current = 3000mA
                        3000,       // QC3.0 charger current = 3000mA
                        1500            // Invalid Wall charger current = 1500mA
                        })
                        Return (CFG0)
                }

                //ACPI methods for  foldback chargers
                Method (BFCH) {
                        Name (CFG0,
                        Package(){
                        1,      // Feature enable/disable
                        5,      // No of consecutive times charger attach/detach
                        5000,   // msecs, Time elapsed between attach/detach
                        900,    // mA, Current setting for foldback charger
                        })
                        Return (CFG0)
                }

                //ACPI methods for coin cell charger
                Method (BCCC) {
                        Name (CFG0,
                        Package(){
                        1, //Enable coin cell charger; 1 = enable, 0 = disable
                        0,      // RSET, 0=2K1, 1=1K7, 2=1K2, 3 = 0K8
                        0       // VSET, 0=2V5, 1=3V2, 2=3V1, 3=3V0
                        })
                        Return (CFG0)
                }

                //ACPI methods for  Recharge/Maintenance Mode
                Method (BRCH) {
                        Name (CFG0,
                        Package(){
                        100,    // Delta V Recharge threshold = 100mV
                        0               // Delta V Recharge Reduction below Normal= 0mV
                        })
                        Return (CFG0)
                }

                //ACPI methods for  Qi Charging
                Method (_BQI) {
                        Name (CFG0,
                        Package(){
                        0,
                        })
                        Return (CFG0)
                }

                //ACPI methods for Interrupt Name
                Method (BIRQ) {
                        Name (CFG0,
                        Package(){
        //"ChgError",   //Charger Error
        //"BclIrq1",       //IBAT greater than threshold IRQ
        //"BclIrq2",       // VBAT less than threshold IRQ
        //"MEMIFaccess",       //MEMIF access granted IRQ
        //"TccReached",       // Termination Current IRQ
        //      "ChargerInhibit"       // Charger Inhibit IRQ
        "VbatLow",       // VBAT LOW IRQ
                //"QiWlcDet",      // Qi charging
        "BattMissing",   // BATT_MISSING IRQ
        "AiclDone",              // AICL Done
        //      "UsbUv",         //USB UV
                //"SOCFull",       //SOC Full IRQ
                //"SOCEmpty",      //SOC Empty IRQ
        //"FvCal",       //FVCAl IRQ
                "JeitaLimit"       //JEITA limit IRQ
                        })
                        Return (CFG0)
                }
                //ACPI methods for Platform File
                Method (BPLT) {
                        Name (CFG0,
                        Package(){
                        1024,        //* 0: ACPI Version
                        0xFFFFFFFF,  //* 1: VNOM: (mV), Nominal Battery Voltage
                        0xFFFFFFFF,  //* 2: VLOW: (mV), Low Battery Voltage
                        0xFFFFFFFF,  //* 3: EMPT: (mV), VcutOff
                        0xFFFFFFFF,  //* 4: DCMA: (mA), DC Current
                        1,                   //* 5: ChargePath Priority: Select 0 for DC, 1 for USB
                        50,          //* 6: RSLOW for maxFlashCurrentPrediction
                        50,          //* 7: RPARA for maxFlashCurrentPrediction
                        5000,        //* 8: VINFLASH for maxFlashCurrentPrediction
                        8,           //* 9: FlashParam for maxFlashCurrentPrediction
                        1,                   //* 10: AFP Mode Supported
                        80,                  //* 11:  AFP Trigger Max Battery Temp (+80 deg C)
                        0xFFFFFFEC,      //* 12: AFP Trigger Min Battery Temp (-20 deg C)
                        72,          //* 13: Watchdog timer in secs
                        100,         //* 14: Charger iterm 100 mA for now
                        30,                  //* 15: SRAM logging timer
                        5,                   //* 16: VBATT average Window Size
                        6,           //* 17: Emergency Shutdown Initial SOC
                        500,         //* 18: SoC convergent point
                        126,         //* 19: LM_Threshold
                        400,         //* 20: MH_Threshold
                        0xFFFFFFFF,  //* 21: BOCP: (mA), OCP current used in BCL
                        750,         //* 22: soc (75%) below which no soc linearization even in CV charging
                        1,           //* 23: BMD - Battery Missing Detection Source when source is attached: BATT_ID (1=BATT_ID, 4=HW Misssing Algorithm)
                        2,           //* 24: ibat src sensing : 0 for batfet and 1 for external sensing
                50,          //* 25: IFGD: (mA), FG Iterm delta;  (iterm + this value) determines when FG report 100%
            10,          //* 26: VFGD: (mV), CC to CV Vdelta; (Vfloat - this value) determine when FG report 100%
            1,           //* 27: 0 - disable SOC linearization; 1 (nonzero): enable SOC linearization
            0xFFFFFFEC,  //* 28: (Celcius), Temperature threshold do have different SOC slope limiter
            10,          //* 29: (milli%) - SOC slope limiter when charging and at lower temperature than threshold
            10,          //* 30: (milli%) - SOC slope limiter when charging and at higher temperature than threshold
            10,          //* 31: (milli%) - SOC slope limiter when discharging and at lower temperature than threshold
            10,          //* 32: (milli%) - SOC slope limiter when discharging and at higher temperature than threshold
                        1,           //* 33: 0 - disable FCC learning; 1 (nonzero): enable FCC leearning
                        150,         //* 34: maximum starting SOC (in tenth percent)at which FCC learning would be turned on during charging
                        100,         //* 35: maximum allowable decrement (in tenth percent) of battery capacity in FCC learning
                        5,           //* 36: maximum allowable increment (in tenth percent) of battery capacity in FCC learning
                        10,          //* 37: battery temperature in degree C below which switch to low temp ESR update steps
                        0x02,        //* 38: ESR update step tight, (2 * 0.001953 = 0.0039 = 0.4% max change each update)
                        0x33,        //* 39: ESR update step broad, (51* 0.001953 = 0.099603 = 10% max change each update)
                        0x02,        //* 40: ESR update step tight at low temp (below 10 degree, 0.4% max change each update)
                        0x0A,        //* 41: ESR update step broad at low temp (below 10 degree, 2% max change each update)
                        0,           //* 42: mOhm, RConn
                        0,           //* 43: Type C Thermal Mitigation Enable
                        70,          //* 44: Temperature to arm mitigation (degree C)
                        50,          //* 45: ICL adjustment (percent)
                        60           //* 46: Temperature to disarm mitigation (degree C)
                        })
                        Store(VNOM, Index(CFG0, 1))
                        Store(VLOW, Index(CFG0, 2))
                        Store(EMPT, Index(CFG0, 3))
                        Store(DCMA, Index(CFG0, 4))
                        Store(BOCP, Index(CFG0, 21))
                        Store(IFGD, Index(CFG0, 25))
                        Store(VFGD, Index(CFG0, 26))
                        Return (CFG0)
                }

                //ACPI methods for Platform File
                Method (BPTM) {
                        Name (CFG0,
                        Package(){
                        15000,          // Emergency Timer
                        0,              // Emergency Tolerable Delay
                        })
                        Return (CFG0)
                }

                //*****************************************************
                //  Battery Charge Table 1 (BCT1)
                //  Notes: used in Method(BJTA) & Method (BAT1)
                //*****************************************************
                Name (BCT1, Package(){
            4350,               //* 0: VDD1: (mV), Float Voltage (FV)
            2100,           //* 1: FCC1: (mA), Full Charge Current (FCC)
            0,                      //* 2: HCLI: (C) hard cold limit - at which temperature charging will be disabled
            10,                     //* 3: SCLI: (C) soft cold limit - at which temperature charge current/float voltage will be reduced to JEITA compensated value
            45,                     //* 4: SHLI: (C) soft hot limit - at which temperature float voltage/charge current will be reduced to JEITA compensated value
            55,                     //* 5: HHLI: (C) hard hot limit - at which temperature charging will be disabled
            105,            //* 6: FVC1: (mV) Float Voltage compensation (amount of FV reduction) when in battery hot-soft limit
            0,              //* 7: (mV) Float Voltage compensation (amount of FV reduction) when in battery cold-soft limit
                            //* notes: put 0 value to disable
                            //* These values (10 vs 11) should be the same when HW JEITA is enabled
            0,              //* 8: (mA) Charge Current compensation (amount of CC reduction) when in battery hot-soft limit
            1000,           //* 9: CCC1: (mA) Charge Current compensation (amount of CC reduction) when in battery cold-soft limit
                            //* notes: put 0 value to disable
                            //* These values (12 vs 13) should be the same when HW JEITA is enabled
        })

                //ACPI methods for JEITA
                Method (BJTA) {
                        Name (CFG0,
                        Package(){
                        2,                     //* 0: Select JEITA Configuration: 0- No JEITA, 1- SW JEITA, 2- HW JEITA
                        2,                     //* 1: Temperature Hysteresis (in deg C)
            Package(0xa){0,0,0,0,0,0,0,0,0,0}
                           //* 2: Structure for default charge table
            })
                        Store(VDD1, Index(\_SB_.PMBT.BCT1, 0))
                        Store(FCC1, Index(\_SB_.PMBT.BCT1, 1))
                        Store(HCLI, Index(\_SB_.PMBT.BCT1, 2))
                        Store(SCLI, Index(\_SB_.PMBT.BCT1, 3))
                        Store(SHLI, Index(\_SB_.PMBT.BCT1, 4))
                        Store(HHLI, Index(\_SB_.PMBT.BCT1, 5))
                        Store(FVC1, Index(\_SB_.PMBT.BCT1, 6))
                        Store(CCC1, Index(\_SB_.PMBT.BCT1, 9))

            //Use BCT1 as the Default Charge Table
            Store(\_SB_.PMBT.BCT1, Index(CFG0, 2))
                        Return (CFG0)
                }

        //ACPI methods for Battery-1 (Ascent 860-82209-0000 3450mAh)
        Method (BAT1)
        {
                        Name (CFG0,
            Package(){
                0,                              //* 0: Battery Category: 0-NORMAL, 1-SMART
                0xFFFFFFEC,                 //* 1: min operating battery temp (-20 deg C)
                65,                                 //* 2: max operating battery temp (+65 deg C)
                Package(4){0,0,0,0},    //* 3: 128-bit battery info for future expansion
                Package(0xa){0,0,0,0,0,0,0,0,0,0}
                                        //* 4: Structure for charge table
            })

                        //assign Charge Table to BCT1
            //Notes: 1) If the default charge table and desire charge table are different,
            //          Create another table (ex: BCT2) with the same structure as BCT1 and modify BCT1 below with the new table name
                        //       2) Method(BJTA) is parsed before this(BAT1) method in Battmngr module
                        //          Method(BJTA) may be updating BCT1 parameters using configuration from cust_pmic_batt.asl (refer to BJTA method details)
                        //          If BAT1 desires different value to be used (than what used in BJTA), pls change/update relevant parameter(s) here.
            Store(\_SB_.PMBT.BCT1, Index(CFG0, 4))

            Return (CFG0)
        }

                //ACPI methods for Battery Error Handling
                Method (BEHC)
                {
                        //Actions for Battery Error Handling
                        //  0x0 - Do Nothing
                        //      0x1 - Reload Charge Table
                        //  0x2 - Error Shutdown
                        //  0x4 - Emergency Shutdown
                        //  0x8 - Enter Test Mode
                        Name (CFG0,
                        Package(){
                1,              //1-Feature Enable, 0-Feature Disable
                0x8,    //Action(s) for DEBUG state -> Enter Test Mode
                0x1,    //Action(s) for NORMAL state -> Reload Charge Table
                0x0,    //Action(s) for SMART_AUTHENTICATED state -> Do nothing
                0x0,    //Action(s) for UNKNOWN state -> Do nothing
                0x2,    //Action(s) for NOT_PRESENT state -> Error Shutdown
                0x2,    //Action(s) for INVALID state -> Error Shutdown
                0x4             //Action(s) for OUT_OP_RANGE state -> AFP for out of operational range
                        })
                        Return (CFG0)
                }

                //ACPI methods for Charge Table Management Configuration
                Method (CTMC)
                {
                        Name (CFG0,
                                Package(){
                                        2000,                   //* 0: min RID for DEBUG category: 2K
                                        14000,                //* 1: max RID for DEBUG category: 14K
                                        0xFFFFFFFF,                 //* 2: RID2: min RID for NORMAL category: 15K
                                        0xFFFFFFFF,                 //* 3: RID3: max RID for NORMAL category: 140K
                                        240000,                 //* 4: min RID for SMART category: 240K
                                        450000,                 //* 5: max RID for SMART category: 450K
                                        1,                              //* 6: Number of charging table
                        })
                            Store(RID2, Index(CFG0, 2))
                            Store(RID3, Index(CFG0, 3))
                        Return (CFG0)
                }

        //ACPI methods for Parallel Charging
        Method (BMPC) {
            Name (CFG0,
            Package(){
                0,          //* 0: Feaature Enable. 1: Enabled, 0: Disable
                1,          //* 1: Input Power Disctribution (HW) configuration: 0: MID-MID, 1: USBIN-USBIN
                7000,       //* 2: (mW) Input Power Threshold to decide if parallel charging to be enabled or not
                            //*    Note: Not applicable for MID-MID configuration
                1000,       //* 3: (mA) Charge Current Threshold to decide if parallel charging to be enabled or not
                50,         //* 4: (%)  Slave Charger Initial Power Distribution
                60,         //* 5: (mV) Slave Charger Float Voltage Headroom
                500,        //* 6: (mA) Slave Charger Charge Current Done Threshold
                                90,         //* 7: Slave Charger Minimum Efficiency
                0,          //* 8: Slave Charger HW ID. 0: SMB1380/1
                70,         //* 9: (%)Slave Charger Max Power Distribution: 70%
                0,          //* 10: (%)Slave Charger Min Power Distribution: 0%
                Package(0x4)//* 11: Thermal Balancing Configuration
                {
                    5,          //11.1: (C)Temperature Difference to trigger thermal balancing. 0 to disable the feature
                    5,          //11.2: (%)Step to redistrubute the power
                    120,        //11.3: (Sec)Minimum Wait Time for each redistribution attempt
                    5,          //11.4: (C)Temperature Margin for Master Charger
                }
            })
            Return (CFG0)
        }
    }

    //
    // PMIC Battery Miniclass Driver
    //
    Device (PMBM) {
        Name (_HID, "QCOM0263")
                    Alias(\_SB.PSUB, _SUB)
            Name (_DEP, Package(0x1)
            {
               \_SB_.PMBT
            })

            Method (_CRS, 0x0, NotSerialized) {
               Name (RBUF, ResourceTemplate () {
               })
               Return (RBUF)
            }

                        Method (_STA) {
                Return (0xB)    // Device is installable, functional & should not be visible in OSPM/Device Manager
            }
        }

//
//FGBCL Driver
//
Device (BCL1) {
    Name (_HID, "QCOM02D6")
        Alias(\_SB.PSUB, _SUB)
    Name (_DEP, Package(0x1)
    {
       \_SB_.PMIC
    })

        Method (_STA) {
        Return (0xB)    // Device is installable, functional & should not be visible in OSPM/Device Manager
    }

    Method (_CRS, 0x0, NotSerialized) {
       Name (RBUF, ResourceTemplate () {
            GpioInt(Edge, ActiveBoth, Shared, PullUp, 0, "\\_SB.PM01",,,,RawDataBuffer(){0x08}) {64} // 0x1E8 - PM_INT__BCL_COMP__VCOMP_LOW0 - VCOMP_LOW0 IRQ
            GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {65} // 0x1E9 - PM_INT__BCL_COMP__VCOMP_LOW1 - VCOMP_LOW1 IRQ
            GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {66} // 0x1EA - PM_INT__BCL_COMP__VCOMP_LOW2 - VCOMP_LOW2 IRQ
            GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {67} // 0x1EB - PM_INT__BCL_COMP__VCOMP_HI - VCOMP_HI IRQ
            //GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {68} // 0x1EC - PM_INT__BCL_COMP__SYS_OK - SYS_OK IRQ
            //GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {72} // 0x1F0 - PM_INT__BCL_PLM__VCOMP_LVL0_PLM - LVL0_PLM IRQ
            //GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {74} // 0x1F2 -PM_INT__BCL_PLM__VCOMP_LVL2_PLM - LVL2_PLM IRQ
            GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {75} // 0x1F3 - PM_INT__BCL_PLM__VCOMP_BA - BAN alarm IRQ
            GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {336} // 0x210 - PM_INT__FG_BCL__IBT_HI - ibatt high IRQ
            GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {337} // 0x211 - PM_INT__FG_BCL__IBT_THI - ibatt too high IRQ
            GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {339} // 0x213 - PM_INT__FG_BCL__VBT_LO_CMP - vbatt low irq
            GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {340} // 0x214 - PM_INT__FG_BCL__VBT_TLO_CMP - vbatt too low irq
            GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {324} // 0x204 - PM_INT__FG_BATT_SOC__MSOC_LOW - MSOC_Low Interrupt
            GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {326} // 0x206 - PM_INT__FG_BATT_SOC__MSOC_HIGH - MSOC_HI Interrupt
            GpioInt(Edge, ActiveBoth, Shared, PullUp, 0, "\\_SB.PM01",,,,RawDataBuffer(){0x08}) {344} // 0x218 - PM_INT__FG_LMH__LMH_LVL0 - LMH_LVL0 IRQ
            GpioInt(Edge, ActiveBoth, Shared, PullUp, 0, "\\_SB.PM01",,,,RawDataBuffer(){0x08}) {345} // 0x219 - PM_INT__FG_LMH__LMH_LVL1 - LMH_LVL1 IRQ
            GpioInt(Edge, ActiveBoth, Shared, PullUp, 0, "\\_SB.PM01",,,,RawDataBuffer(){0x08}) {346} // 0x21A - PM_INT__FG_LMH__LMH_LVL2 - LMH_LVL2 IRQ

       })
       Return (RBUF)
    }
         //ACPI methods for FGBCL device
                Method (BCLS) {
                        Name (CFG0,
                        Package(){
                        3,           //* FGBCL ACPI revision
                        7,               //* 0: BCL disabled, 1: vph_pwr bcl enabled, 2: fg vbatt enabled, 4: fg ibatt enabled
                        5000,        //* battery ocp current
                        80,          //* ibatt high threshold is set to 80 for 80% of OCP
                        90,          //* ibatt too high is set to 90 for 90% of OCP
                        2800,        //* vbatt low is set to 2800 mV
                        2600,        //* vbatt too low is set to 2600 mV
                        3200,        //* vcomp_low0 threshold is 3200 mv
                        2750,        //* vcomp_low1 threshold is 2750 mv
                        2500,        //* vcomp_low2 threshold is 2500 mV
                        10,           //* poll timer for battery soc polling.
                        1,           //* 1- enable battery percent notification. 0-disable battery percent notification
                        2000,        //* debug board Min battery ID in Ohm
                        14000        //* debug board Max battery ID in Ohm
                        })
                        Return (CFG0)
                }
                //ACPI methods for Interrupt Name
                Method (BCLQ) {
                        Name (CFG0,
                        Package(){
        "VCOMP_LOW0",           //vcomp_low0 IRQ
        "VCOMP_LOW1",       //vcomp_low1 IRQ
        "VCOMP_LOW2",       //vcomp_low2 IRQ
        "VCOMP_HI",         //vcomp_hi IRQ
        //"SYS_OK",           // sys_ok irq
        //"LVL0_PLM",       // LVL0_PLM IRQ
        //"LVL1_PLM"        // LVL1_PLM IRQ
        //"LVL2_PLM",       //LVL2_PLM IRQ
                  "BAN_ALARM",        // BAN_ALARM IRQ
        "IBATT_HI",         // IBATT HIGH IRQ
        "IBATT_THI",            // IBATT TOO HIGH IRQ
        "VBATT_LOW",        // VBATT_LOW IRQ
                "VBATT_TLOW",       // VBATT TOO LOW IRQ
                "MSOC_LOW",         //monotonic soc low IRQ
                "MSOC_HI",          //monotonic soc high IRQ
                "LMH_LVL0",       //LMH_LVL0 IRQ
                "LMH_LVL1",       //LMH_LVL1 IRQ
                "LMH_LVL2",       //LMH_LVL2 IRQ
                        })
                        Return (CFG0)
                }
}

//
//PMIC Type-C Controler Driver (PMICTCC) Driver
//
Device(PTCC)
{
    Name (_HID, "QCOM02E6")
        Alias(\_SB.PSUB, _SUB)
    Name (_DEP, Package(0x1) {\_SB_.PMIC})
    Method (_CRS, 0x0, NotSerialized) {
      Name (RBUF, ResourceTemplate () {
        GpioInt(Edge, ActiveHigh, SharedAndWake, PullNone, 0, "\\_SB.PM01",,,,) {239} // 0x9F - PM_INT__SCHG_USB__TYPE_C_OR_RID_DETECTION_CHANGE - CC State Changed IRQ
        GpioInt(Edge, ActiveHigh, SharedAndWake, PullNone, 0, "\\_SB.PM01",,,,) {270} // 0xBE - PM_INT__USB_PD__MESSAGE_RX_DISCARDED - Message RX Discarded IRQ
        GpioInt(Edge, ActiveHigh, SharedAndWake, PullNone, 0, "\\_SB.PM01",,,,) {269} // 0xBD - PM_INT__USB_PD__MESSAGE_TX_DISCARDED - Message TX Discarded IRQ
        GpioInt(Edge, ActiveHigh, SharedAndWake, PullNone, 0, "\\_SB.PM01",,,,) {268} // 0xBC - PM_INT__USB_PD__MESSAGE_TX_FAILED - Message TX Failed IRQ
        GpioInt(Edge, ActiveHigh, SharedAndWake, PullNone, 0, "\\_SB.PM01",,,,) {267} // 0xBB - PM_INT__USB_PD__MESSAGE_RECEIVED - Message Received IRQ
        GpioInt(Edge, ActiveHigh, SharedAndWake, PullNone, 0, "\\_SB.PM01",,,,) {266} // 0xBA - PM_INT__USB_PD__MESSAGE_SENT - Message Sent IRQ
        GpioInt(Edge, ActiveHigh, SharedAndWake, PullNone, 0, "\\_SB.PM01",,,,) {265} // 0xB9 - PM_INT__USB_PD__SIGNAL_RECEIVED - Singal Received IRQ
        GpioInt(Edge, ActiveHigh, SharedAndWake, PullNone, 0, "\\_SB.PM01",,,,) {264} // 0xB8 - PM_INT__USB_PD__SIGNAL_SENT - Signal Sent IRQ
        GpioInt(Edge, ActiveHigh, Exclusive, PullUp, 0, "\\_SB.PM01",,,,) {217} // 0x89 - PM_INT__SCHG_OTG__OTG_OVERCURRENT - OTG_OC_IRQ
        GpioInt(Edge, ActiveBoth, Exclusive, PullUp, 0, "\\_SB.PM01",,,,) {263} // 0xB7 - PM_INT__SCHG_MISC__SWITCHER_POWER_OK - SWITCHER_POWER_OK (CHG_MISC)
        GpioInt(Edge, ActiveHigh, Exclusive, PullUp, 0, "\\_SB.PM01",,,,) {235} // 0x9B - PM_INT__SCHG_USB__USBIN_OV - USBIN_OV (CHG_USB)
        // GpioIo (Exclusive, PullUp, 0, 0, , "\\_SB.PM01", , , , ) {493} // 0x668 - PM_INT__PM2_GPIO14__GPIO_IN_STS - GPIO14B – For Type-C Debug Accessory Mode
      })
      Return (RBUF)
    }
}
