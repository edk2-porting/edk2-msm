// To enable SOC revision based run time differentiation, uncomment following line
// and uncomment SSID method in ABD device. The original string is artificailly set as 
// 16 characters, so there is enough room to hold SOC revision string. 
// To adjust the number, the MAX_SOCID_LEN macro as defined in ABD device.h should be
// adjusted at the same time. 

Name (SOID, 0x0141)             // Holds the Chip Id
Name (SIDS, "SDM845")           // Holds the Chip ID translated to a string
Name (SIDV, 0x00020001)         // Holds the Chip Version as (major<<16)|(minor&0xffff)
Name (SVMJ, 0x02)               // Holds the major Chip Version
Name (SVMI, One)                // Holds the minor Chip Version
Name (SDFE, 0x4F)               // Holds the Chip Family enum
Name (SFES, "899800000000000")  // Holds the Chip Family translated to a string
Name (SIDM, 0x0000000FFFFF00FF) // Holds the Modem Support bit field
Name (SOSN, 0x000003F48D126594)
Name (RMTB, 0x85D00000)
Name (RMTX, 0x00200000)
Name (RFMB, Zero)
Name (RFMS, Zero)
Name (RFAB, Zero)
Name (RFAS, Zero)
Name (TPMA, 0x11111111)         // Holds whether TPM is seperate app or combined with Winsecapp
Name (TDTV, 0x6654504D)         // Holds TPM type, by default it set to fTPM type
Name (TCMA, 0x8AB00000)         // Holds TrEE Carveout Memory Address
Name (TCML, 0x01400000)         // Holds TrEE Carveout Memory Length
// Name (SOSI, 0xdeadbeefffffffff) // Holds the base address of the SoCInfo shared memory region used by ChipInfoLib

//Audio Drivers
Include("audio.asl")
Include("audio_bus.asl")
		
        //
        // Storage - UFS/SD 
        //
        Include("../Common/ufs.asl")
        Include("../Common/sdc.asl")
        
        //
        // ASL Bridge Device
        //
		Include("../Common/abd.asl")
			
		 Name (ESNL, 20) // Exsoc name limit 20 characters
		 Name (DBFL, 23) // buffer Length, should be ESNL+3
			
//
// PMIC driver 
//
Include("../Common/pmic_core.asl")

//
// PMICTCC driver
//
Include("pmic_batt.asl")
			
        Include("pep.asl")
        Include("../Common/bam.asl")
        Include("buses.asl")
        // MPROC Drivers (PIL Driver and Subsystem Drivers)
        Include("../Common/win_mproc.asl")
        Include("../Common/syscache.asl")
        Include("../Common/HoyaSmmu.asl")
        Include("graphics.asl")

        Include("../Common/SCM.asl");

		//
		// SPMI driver 
        //
        Include("../Common/spmi.asl")

        //
        // TLMM controller.
        //
        Include("qcgpio.asl")

        Include("../Common/pcie.asl")

        Include("../Common/cbsp_mproc.asl")

        Include("../Common/adsprpc.asl")
      
        //
        // RemoteFS
        // 
        Include("../Common/rfs.asl")


        // Test Drivers
        Include("testdev.asl")
		//

        //
        // Qualcomm IPA
        Include("../Common/ipa.asl")
		
        Include("../Common/gsi.asl")
		
        //
        //Qualcomm DIAG Service
        //
        Device (QDIG)
        {
            Name (_DEP, Package(0x1)
            {
                \_SB_.GLNK
            })
           Name (_HID, "QCOM0225")
		   Alias(\_SB.PSUB, _SUB)
        }
        Include("../Common/qcdb.asl")       
		Include("../Common/pep_lpi.asl")

	//
	//  QcRNG Driver (qcsecuremsm)
	// 
	Device (QRNG)
	{
		Name (_DEP, Package(0x1) {
			\_SB_.PEP0,
		})
		Name (_HID, "QCOM02FE")
		Name (_UID, 0)
		Method (_CRS, 0x0, NotSerialized)
		{
			Name (RBUF, ResourceTemplate ()
			{
			  // PRNG_CFG_EE2_EE2_PRNG_SUB register address space
			  Memory32Fixed (ReadWrite, 0x00793000, 0x00001000)
			})
			Return (RBUF)
		}			
	}
	
	//
	// QCOM GPS 
	// 
	Include("../Common/gps.asl")
			
    // QDSS driver
    Include("../Common/Qdss.asl")

// QUPV3 GPI device node and resources
//
Include("../Common/qgpi.asl")

//Include("nfc.asl")

Include("../Common/sar_manager.asl")
