// To enable SOC revision based run time differentiation, uncomment following line
// and uncomment SSID method in ABD device. The original string is artificailly set as 
// 16 characters, so there is enough room to hold SOC revision string. 
// To adjust the number, the MAX_SOCID_LEN macro as defined in ABD device.h should be
// adjusted at the same time. 

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

Device (HAL0)
{
    Name (_HID, "QCOM0009")  // _HID: Hardware ID
    Name (_UID, Zero)  // _UID: Unique ID
    Alias (\_SB.PSUB, _SUB)
}

//
// Storage - UFS/SD 
//
Include("ufs.asl")
Include("sdc.asl")

//
// ASL Bridge Device
//
Include("abd.asl")
Name (ESNL, 0x14)   // Exsoc name limit 20 characters
Name (DBFL, 0x17)   // buffer Length, should be ESNL+3

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
Include("HoyaSmmu.asl")
Include("graphics.asl")

Include("SCM.asl")

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

//
// Qualcomm IPA
Include("ipa.asl")
Include("gsi.asl")

//
//  Qualcomm DIAG Service
//
Device (QDIG)
{
    Name (_DEP, Package (One)  // _DEP: Dependencies
    {
        \_SB.GLNK
    })
    Name (_HID, "QCOM0024")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
}

Include("qcdb.asl")
Include("ssm.asl")
Include("pep_lpi.asl")

//
//  QcRNG Driver (qcsecuremsm)
// 
Device (QRNG)
{
    Name (_DEP, Package (One)  // _DEP: Dependencies
    {
        \_SB.PEP0
    })
    Name (_HID, "QCOM0104")  // _HID: Hardware ID
    Name (_UID, Zero)  // _UID: Unique ID
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x00793000,         // Address Base
                0x00001000,         // Address Length
                )
        })
        Return (RBUF) /* \_SB_.QRNG._CRS.RBUF */
    }
}

//
// QCOM GPS 
// 
Include("gps.asl")
