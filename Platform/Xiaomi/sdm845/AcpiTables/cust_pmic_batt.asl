// This file contains the Power Management IC (PMIC)
// customer-modifiable ACPI configurations.
// 

//******************************************
//Configs for Battery Manager Device: PMBT
//******************************************
//--------------------
//PMBT: Method(BBAT)
//--------------------
Name(BFCC, 13100)             //* (mWh), Full Charge Capacity  
Name(PCT1, 5)                 //* (% of FCC),  Default Alert 1  
Name(PCT2, 9)                 //* (% of FCC),  Default Alert 2  

//--------------------
//PMBT: Method(BMNR)
//--------------------
Name(CUST, "850_MTP")        //* cust file identifier  

//--------------------
//PMBT: Method(BPLT)
//--------------------
Name(VNOM, 3800)              //* (mV), Nominal Battery Voltage  
Name(VLOW, 3300)              //* (mV), Low Battery Voltage   
Name(EMPT, 3200)              //* (mV), VCutOff  
Name(DCMA, 900)               //* (mA), DC Current  
Name(BOCP, 4500)              //* (mA), OCP current used in BCL  
Name(BVLO, 3000)              //* (mV), BCL low Vbatt  
Name(BLOP, 20)                //* (%), BCL Low batt percent notification  
Name(BNOP, 22)                //* (%), BCL normal batt percent notification  
Name(IFGD, 50)                //* (mA), FG Iterm delta;  (iterm + this value) determines when FG report 100% 
Name(VFGD, 50)                //* (mV), CC to CV Vdelta; (Vfloat - this value) determine when FG report 100% 

//--------------------------------
//PMBT: Method(BJTA)/Method(BAT1)
//--------------------------------
Name(VDD1, 4350)              //* (mV), Battery-1: Float Voltage (Standard Zone)
Name(FCC1, 2100)              //* (mA), Battery-1: Full Charge Current (Standard Zone)
Name(HCLI, 0)                 //* (degree C), hard-cold temperature limit
Name(SCLI, 10)                //* (degree C), soft-cold temperature limit
Name(SHLI, 45)                //* (degree C), soft-hot temperature limit
Name(HHLI, 55)                //* (degree C), hard-hot temperature limit
Name(FVC1, 105)               //* (mV), Float voltage compensation, when battery in JEITA soft-limit
Name(CCC1, 1000)              //* (mA), Charge current compensation, when battery in JEITA soft-limit
 
//--------------------
//PMBT: Method(CTMC)
//--------------------
Name(RID2, 15000)            //* (Ohm), min RID for NORMAL category: 15K  
Name(RID3, 140000)           //* (Ohm), max RID for NORMAL category: 140K
