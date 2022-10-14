// To enable SOC revision based run time differentiation, uncomment following line
// and uncomment SSID method in ABD device. The original string is artificailly set as 
// 16 characters, so there is enough room to hold SOC revision string. 
// To adjust the number, the MAX_SOCID_LEN macro as defined in ABD device.h should be
// adjusted at the same time. 

Name (SOID, 0x00000124)         // Holds the Chip Id
Name (SIDS, "MSM8998")          // Holds the Chip ID translated to a string
Name (SIDV, 0x00020001)         // Holds the Chip Version
Name (SVMJ, 0x0002)             // Holds the major Chip Version
Name (SVMI, 0x0001)             // Holds the minor Chip Version
Name (SDFE, 0x0043)             // Holds the Chip Family enum
Name (SFES, "899800000000000")  // Holds the Chip Family translated to a string
Name (SIDM, 0x0000000FFFFF00FF) // Holds the Modem Support bit field
Name (SOSN, 0x000003F2741EA3B7) // SoC serial number
Name (RMTB, 0x85E00000)         // RemoteFS Shared Memory base
Name (RMTX, 0x00200000)         // RemoteFS Shared Memory size
Name (FUCB, 0x94500000)         // MBA subsystem load address
Name (FUCX, 0x00200000)         // MBA subsystem size
Name (RFMB, 0x00000000)         // RFSA MPSS Shared Memory base
Name (RFMS, 0x00000000)         // RFSA MPSS Shared Memory size
Name (RFAB, 0x00000000)         // RFSA ADSP Shared Memory base
Name (RFAS, 0x00000000)         // RFSA ADSP Shared Memory size
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
Include("../Common/ufs.asl")
Include("../Common/sdc.asl")

//
// ASL Bridge Device
//
Include("../Common/abd.asl")
Name (ESNL, 0x14)   // Exsoc name limit 20 characters
Name (DBFL, 0x17)   // buffer Length, should be ESNL+3

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
Include("../Common/HoyaSmmu.asl")
Include("graphics.asl")

Include("../Common/SCM.asl")

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

//
// Qualcomm IPA
Include("../Common/ipa.asl")
Include("../Common/gsi.asl")

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

Include("../Common/qcdb.asl")
Include("../Common/ssm.asl")
Include("../Common/pep_lpi.asl")

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
Include("../Common/gps.asl")
