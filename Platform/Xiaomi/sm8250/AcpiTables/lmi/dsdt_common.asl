Name(SOID, 0xffffffff)          // Holds the Chip Id
Name(STOR, 0x1)                 // Holds boot options 0 = nvme, 1 = ufs
Name(SIDS, "899800000000000")   // Holds the Chip ID translated to a string
Name(SIDV, 0xffffffff)          // Holds the Chip Version as (major<<16)|(minor&0xffff)
Name(SVMJ, 0xffff)              // Holds the major Chip Version
Name(SVMI, 0xffff)              // Holds the minor Chip Version
Name(SDFE, 0xffff)              // Holds the Chip Family enum
Name(SFES, "899800000000000")   // Holds the Chip Family translated to a string
Name(SIDM, 0xfffffffff)         // Holds the Modem Support bit field
Name(SUFS, 0x0)                 // Holds secondary UFS enablement (1 = enabled)
Name(PUS3, 0x0)                 // Holds whether primary UFS has 3.0 part (1 = UFS 3.0 and newer)
Name(SUS3, 0x0)                 // Holds whether secondary UFS has 3.0 part (1 = UFS 3.0 and newer)
Name(SIDT, 0xffffffff)          // Holds the Chip Tier value
Name(SJTG, 0xffffffff)          // Holds the JTAG ID 
Name(SOSN, 0xaaaaaaaabbbbbbbb)  // Holds the Chip Serial Number
Name(PLST, 0xffffffff)  		// Holds the Device platform subtype
Name(EMUL, 0xffffffff)  		// Holds the Device emulation type
Name (RMTB, 0xaaaaaaaa)         // Holds the RemoteFS shared memory base address
Name (RMTX, 0xbbbbbbbb)         // Holds the RemoteFS shared memory length
Name (RFMB, 0xcccccccc)         // Holds the RFSA MPSS shared memory base address
Name (RFMS, 0xdddddddd)         // Holds the RFSA MPSS shared memory length
Name (RFAB, 0xeeeeeeee)         // Holds the RFSA ADSP shared memory base address
Name (RFAS, 0x77777777)         // Holds the RFSA ADSP shared memory length
Name (TCMA, 0xDEADBEEF)         // Holds TrEE Carveout Memory Address
Name (TCML, 0xBEEFDEAD)         // Holds TrEE Carveout Memory Length
Name (SOSI, 0xdeadbeefffffffff) // Holds the base address of the SoCInfo shared memory region used by ChipInfoLib
Name (PRP1, 0xFFFFFFFF)         // 0xFFFFFFFF - PCIe state unknown : 0x00000001 - PCIe root port 1 present : 0x00000000 - PCIe root port 1 not present
Name (SKUV, 0x1)                // Set SKU Version to 1

//Audio Drivers
// Include("audio.asl")
		
        //
        // Storage - UFS/SD 
        //
        Include("ufs.asl")
        // Include("sdc.asl") // No SD support on polaris
        
        //
        // ASL Bridge Device
        //
		// Include("abd.asl")
			
		 Name (ESNL, 20) // Exsoc name limit 20 characters
		 Name (DBFL, 23) // buffer Length, should be ESNL+3
			
//
// PMIC driver 
//
// Include("pmic_core.asl")

//
// PMICTCC driver
//
// Include("pmic_batt.asl")
			
        // Include("pep.asl")
        // Include("bam.asl")
        // Include("buses.asl")

        // MPROC Drivers (PIL Driver and Subsystem Drivers)
        // Include("win_mproc.asl")
        // Include("syscache.asl")
        // Include("HoyaSmmu.asl")
        // Include("graphics.asl")

        // Include("SCM.asl");

		//
		// SPMI driver 
        //
        // Include("spmi.asl")

        //
        // TLMM controller.
        //
        // Include("qcgpio.asl")

        // Include("pcie.asl")

        // Include("cbsp_mproc.asl")

        // Include("adsprpc.asl")
      
        //
        // RemoteFS
        // 
        // Include("rfs.asl")

        //
        // Qualcomm IPA
        // Include("ipa.asl")
		
        // Include("gsi.asl")
		
        // Include("qcdb.asl")    

        // copied from sm7325, need to check   
		Include("Pep_lpi.asl")

// QUPV3 GPI device node and resources
//
// Include("qgpi.asl")
