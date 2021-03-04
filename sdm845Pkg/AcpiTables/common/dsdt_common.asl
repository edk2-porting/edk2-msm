
// To enable SOC revision based run time differentiation, uncomment following line
// and uncomment SSID method in ABD device. The original string is artificailly set as 
// 16 characters, so there is enough room to hold SOC revision string. 
// To adjust the number, the MAX_SOCID_LEN macro as defined in ABD device.h should be
// adjusted at the same time. 

Name(SOID, 0xffffffff)          // Holds the Chip Id
Name(SIDS, "899800000000000")   // Holds the Chip ID translated to a string
Name(SIDV, 0xffffffff)          // Holds the Chip Version as (major<<16)|(minor&0xffff)
Name(SVMJ, 0xffff)              // Holds the major Chip Version
Name(SVMI, 0xffff)              // Holds the minor Chip Version
Name(SDFE, 0xffff)              // Holds the Chip Family enum
Name(SFES, "899800000000000")   // Holds the Chip Family translated to a string
Name(SIDM, 0xfffffffff)         // Holds the Modem Support bit field
Name(SOSN, 0xaaaaaaaabbbbbbbb)
Name (RMTB, 0xaaaaaaaa)
Name (RMTX, 0xbbbbbbbb)
Name (RFMB, 0xcccccccc)
Name (RFMS, 0xdddddddd)
Name (RFAB, 0xeeeeeeee)
Name (RFAS, 0x77777777)
Name (TPMA, 0x11111111)   // Holds whether TPM is seperate app or combined with Winsecapp
Name (TDTV, 0x6654504D)   // Holds TPM type, by default it set to fTPM type
Name (TCMA, 0xDEADBEEF)   // Holds TrEE Carveout Memory Address
Name (TCML, 0xBEEFDEAD)   // Holds TrEE Carveout Memory Length
Name (SOSI, 0xdeadbeefffffffff) // Holds the base address of the SoCInfo shared memory region used by ChipInfoLib

//Include("cust_dsdt_common.asl")

//Audio Drivers
Include("audio.asl")
		
        //
        // Storage - UFS/SD 
        //
        Include("ufs.asl")
        Include("sdc.asl")
        
        //
        // ASL Bridge Device
        //
		Include("abd.asl")
			
		 Name (ESNL, 20) // Exsoc name limit 20 characters
		 Name (DBFL, 23) // buffer Length, should be ESNL+3
			
//
// PMIC driver 
//
Include("pmic_core.asl")

//
// PMICTCC driver
//
Include("pmic_batt.asl")
			
        Include("pep.asl")
        Include("bam.asl")
        Include("buses.asl")
        // MPROC Drivers (PIL Driver and Subsystem Drivers)
        Include("win_mproc.asl")
        Include("syscache.asl")
        Include("HoyaSmmu.asl")
        //Include("Ocmem.asl")
        Include("graphics.asl")
        //Include("OcmemTest.asl")

        Include("SCM.asl");

		//
		// SPMI driver 
        //
        Include("spmi.asl")

        //
        // TLMM controller.
        //
        Include("qcgpio.asl")

        Include("pcie.asl")

        Include("cbsp_mproc.asl")

Include("adsprpc.asl")
      
        //
        // RemoteFS
        // 
        Include("rfs.asl")


        // Test Drivers
        Include("testdev.asl")
		//

        //
        // Qualcomm IPA
        Include("ipa.asl")
		
        Include("gsi.asl")

        //
//	Device (IPA)
//        {
//            // Indicates dependency on PEP
//           Name (_DEP, Package () { \_SB_.PEP0 })
//           Name(_HID, "HID_IPA")
//           Name (_UID, 0)
//        }
		
        //
        //Qualcomm DIAG Service
        //
        Device (QDIG)
        {
            Name (_DEP, Package(0x1)
            {
                \_SB_.GLNK
            })
           Name (_HID, "HID_QDIG")
		   Alias(\_SB.PSUB, _SUB)
        }
        Include("qcdb.asl")       
        //Include("ssm.asl")
		Include("Pep_lpi.asl")

	//
	//  QcRNG Driver (qcsecuremsm)
	// 
	Device (QRNG)
	{
		Name (_DEP, Package(0x1) {
			   \_SB_.PEP0,
		})
		Name (_HID, "HID_QRNG")
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
	Include("gps.asl")
		
	//
	// Qualcomm GPS driver
	//
	//Device (GPS)
	//{
	//	Name (_DEP, Package(0x1)
	//	{
	//	\_SB_.GLNK
	//	})
	//	
	//	Name (_HID, "HID_GPS")
	//	Name (_CID, "ACPI\HID_GPS")
	//	Name (_UID, 0)
	//}
		
//	Name (_HID, "QCOM_GPS")
//	Name (_CID, "ACPI\QCOM_GPS")
//	Name (_UID, 0)
//	}
		
    // QDSS driver
    Include("Qdss.asl")

// QUPV3 GPI device node and resources
//
Include("qgpi.asl")

Include("qwpp.asl")
//Include("nfc.asl")
// Disabling QCSP Changes 
//Include("qcsp.asl")

Include("sar_manager.asl")
