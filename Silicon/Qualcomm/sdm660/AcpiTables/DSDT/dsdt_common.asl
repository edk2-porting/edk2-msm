Name (SOID, 0xffffffff)          // Holds the Chip Id
Name (SIDS, "899800000000000")   // Holds the Chip ID translated to a string
Name (SIDV, 0xffffffff)          // Holds the Chip Version as (major<<16)|(minor&0xffff)
Name (SVMJ, 0xffff)              // Holds the major Chip Version
Name (SVMI, 0xffff)              // Holds the minor Chip Version
Name (SDFE, 0xffff)              // Holds the Chip Family enum
Name (SFES, "899800000000000")   // Holds the Chip Family translated to a string
Name (SIDM, 0xfffffffff)         // Holds the Modem Support bit field
Name (SOSN, 0xaaaaaaaabbbbbbbb)  // Holds the Chip Serial Number
Name (PLST, 0xffffffff)  		 // Holds the Device platform subtype
Name (RMTB, 0xaaaaaaaa)
Name (RMTX, 0xbbbbbbbb)
Name (RFMB, 0xcccccccc)
Name (RFMS, 0xdddddddd)
Name (RFAB, 0xeeeeeeee)
Name (RFAS, 0x77777777)
Name (PRP0, 0x0)                // Holds the enable/disable flag for PCIe
Name (WLEN, One)                // Holds the enable/disable flag for WLAN
	
//
// Storage - EMMC 
//
// TODO: We need to repair some PEPs to repair some equipment
Include("emmc.asl") 

//
// SPMI driver 
//
Include("spmi.asl")

//
// PMIC driver 
//
Include("pmic_core.asl")

// copied from msm8998, need to check   
Include("pep_lpi.asl")
