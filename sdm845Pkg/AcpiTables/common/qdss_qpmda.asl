//===========================================================================
//                           <qdss_qpmda.asl>
// DESCRIPTION
//   This file contans the QPMDA details needed by qdss driver.
//
//
//===========================================================================

Scope(\_SB.QDSS)
{
    // References: napali_v2.0_p2q0r15.3_partitioned_rtl.FLAT
    // http://sew-napali.runq-sd-a-sm.qualcomm.com/prj/qct/chips/napali/sandiego/docs/SWI/HTML/latest_2.0/napali.index.html
    // https://sharepoint.qualcomm.com/qct/DHW/Projects/Napali/Documents/Design/debug/TPDM/Napali_TPDM_list.xlsx
    // https://sharepoint.qualcomm.com/qct/DHW/Projects/Napali/Documents/Design/debug/SOC%20DEBUG/Napali_ATB_Structure.xlsx
    Method (TPDA)
    {
        Return
        (	
			Package()
			{
			    //          QtfTpdaName Index,          positional value is Qdss Id
				Package() {  "QDSS",      0},        // QDSS Tpda Id 0 QDSS
				Package() {  "APSS",      6},        // QDSS Tpda Id 1 APSS
				Package() {  "MSS",       1},        // QDSS Tpda Id 2 MSS
				Package() {  "NAV",       4},        // QDSS Tpda Id 3 NAV
				Package() {  "OLC",       9},        // QDSS Tpda Id 4 OLC
				Package() {  "SP",        3},        // QDSS Tpda Id 5 SP
				Package() {  "SWAO",      5},        // QDSS Tpda Id 6 SWAO
				Package() {  "LLMGOLD",   8},        // QDSS Tpda Id 7 LLMGOLD
				Package() {  "LLMSILVER", 7},        // QDSS Tpda Id 8 LLMSILVER
				Package() {  "MSSDL",     2},        // QDSS Tpda Id 9 MSSDL
			}
        )
    }
	
    Method (TPDM)
    {
        Return
        (
			Package()
			{
				//          QtfTpdmName   Index,        positional value is Qdss Id
				Package() {  "VSENSE",      10},     // QDSS Tpda Id 0 VSENSE
				//Package() {  "DCC",         22},     // QDSS Tpda Id 1 DCC
				Package() {  "PRNG",        12},     // QDSS Tpda Id 1 PRNG
				Package() {  "QM",          17},     // QDSS Tpda Id 2 QM
				Package() {  "PIMEM",       13},     // QDSS Tpda Id 3 PIMEM
				Package() {  "KryoB",        1},     // QDSS Tpda Id 4 KryoB
				Package() {  "MSS1",         2},     // QDSS Tpda Id 5 MSS1
				Package() {  "NAV",          3},     // QDSS Tpda Id 6 NAV
				Package() {  "OLC",          4},     // QDSS Tpda Id 7 OLC
				Package() {  "SP",           5},     // QDSS Tpda Id 8 SP
				Package() {  "RPMH0",        6},     // QDSS Tpda Id 9 RPMH0
				Package() {  "RPMH1",       21},     // QDSS Tpda Id 10 RPMH1
				Package() {  "DDR",         18},     // QDSS Tpda Id 11 DDR
				Package() {  "MSS0",         9},     // QDSS Tpda Id 12 MSS0
				Package() {  "MMSS",        23},     // QDSS Tpda Id 13 MMSS
				Package() {  "LPASS",       11},     // QDSS Tpda Id 14 LPASS
				Package() {  "TURING",      14},     // QDSS Tpda Id 15 TOURING
				Package() {  "LLMGOLD",      7},     // QDSS Tpda Id 16 LLMGOLD
				Package() {  "LLMSILVER",    8},     // QDSS Tpda Id 17 LLMSILVER
			}
        )
    }
	
    Method (AGGC) // TPDA(Aggregator) Configuration
    {
        Return
        (
            Package()
            {
                Package()
                {
                    0,          // TpdaName(QDSS) Index
                    0x06004000, // Base address of this TPDA
                    0x1000,     // Length of this TPDA 
                    65,         // ATID
                    Package() 
                    { 
                        "BC",   // TPDM Subunit
                        Package() { 10, 32},  // QM TPDM Port number, size
                        Package() { 13, 32},  // PIMEM TPDM Port number, size
                    },
                    Package() 
                    { 
                        "DSB",  // TPDM Subunit
                        Package() {  0, 32},
                        Package() {  2, 32},  // MMSS TPDM Port number, size						
                        Package() {  3, 32},  // DDR TPDM Port number, size
                        Package() {  5, 32},  // LPASS TPDM Port number, size 
                        Package() {  6, 32},  // TOURING TPDM Port number, size
                        Package() { 10, 32},  // QM TPDM Port number, size
                        Package() { 11, 32},
                        Package() { 13, 32},
                    },
                    Package() 
                    { 
                        "CMB",  // TPDM Subunit
                        Package() {  3, 64},  // DDR TPDM Port number, size
                        Package() {  7, 64},  // VSENSE TPDM Port number, size
                        Package() {  8,  8},  // DCC TPDM Port number, size
                        Package() {  9, 64},  // PRNG TPDM Port number, size
                        Package() { 13, 64},  // PIMEM TPDM Port number, size
                    },
                },
    			
                Package()
                {
                    1,          // TpdaName(APSS) Index
                    0x07862000, // Base address of this TPDA
                    0x1000,     // Length of this TPDA 
                    66,         // ATID
                    Package() 
                    { 
                        "DSB",  // TPDM Subunit
                        Package() { 0, 32},  // KryoB TPDM Port number, size
                    },
                },
    			
                Package()
                {
                    2,          // TpdaName(MSS) Index
                    0x06833000, // Base address of this TPDA
                    0x1000,     // Length of this TPDA 
                    67,         // ATID
                    Package() 
                    { 
                        "DSB",  // TPDM Subunit
                        Package() { 0, 64},  // MSS1 TPDM Port number, size
                    },
                    Package() 
                    { 
                        "CMB",  // TPDM Subunit
                        Package() { 0, 64},  // MSS1 TPDM Port number, size
                    },
                },
    			
                Package()
                {
                    3,          // TpdaName(NAV) Index
                    0x06991000, // Base address of this TPDA
                    0x1000,     // Length of this TPDA 
                    68,         // ATID
                    Package() 
                    { 
                        "CMB",  // TPDM Subunit
                        Package() { 0, 32},  // NAV TPDM Port number, size
                    },
                },
    			
                Package()
                {
                    4,          // TpdaName(OLC) Index
                    0x07832000, // Base address of this TPDA
                    0x1000,     // Length of this TPDA 
                    69,         // ATID
                    Package() 
                    { 
                        "CMB",  // TPDM Subunit
                        Package() { 0, 64},  // OLC TPDM Port number, size
                    },
                },
    			
                Package()
                {
                    5,          // TpdaName(SP) Index
                    0x06882000, // Base address of this TPDA
                    0x1000,     // Length of this TPDA 
                    70,         // ATID
                    Package() 
                    { 
                        "DSB",  // TPDM Subunit
                        Package() { 0, 32},  // SP TPDM Port number, size
                    },
                },

                Package()
                {
                    6,          // TpdaName(SWAO) Index
                    0x06B01000, // Base address of this TPDA
                    0x1000,     // Length of this TPDA 
                    71,         // ATID
                    Package() 
                    { 
                        "DSB",  // TPDM Subunit
                        Package() { 1, 32},  // RPMH1 TPDM Port number, size
                    },
                    Package() 
                    { 
                        "CMB",  // TPDM Subunit
                        Package() { 0, 64},  // RPMH0 TPDM Port number, size
                    },
                },

                Package()
                {
                    7,          // TpdaName(LLMGOLD) Index
                    0x078D0000, // Base address of this TPDA
                    0x1000,     // Length of this TPDA 
                    73,         // ATID
                    Package() 
                    { 
                        "CMB",  // TPDM Subunit
                        Package() { 0, 32},  // LLMGOLD TPDM Port number, size
                    },
                },

                Package()
                {
                    8,          // TpdaName(LLMSILVER) Index
                    0x078C0000, // Base address of this TPDA
                    0x1000,     // Length of this TPDA 
                    72,         // ATID
                    Package() 
                    { 
                        "CMB",  // TPDM Subunit
                        Package() { 0, 32},  // LLMSILVER TPDM Port number, size
                    },
                },

                Package()
                {
                    9,          // TpdaName(MSSDL) Index
                    0x06831000, // Base address of this TPDA
                    0x1000,     // Length of this TPDA 
                    67,         // ATID
                    Package() 
                    { 
                        "DSB",  // TPDM Subunit
                        Package() { 0, 32},  // MSS0 TPDM Port number, size
                    },
                    Package() 
                    { 
                        "CMB",  // TPDM Subunit
                        Package() { 0, 64},  // MSS1 TPDM Port number, size
                    },
                },
            }
        )
    }
	
    Method (MONC) // TPDM(Monitor) Configuration
    {
        Return
        (
            Package()
            {
                Package()
                {
                    0,          // VSENSE TPDM index
                    0x06840000, // Base address of VSENSE TPDM
                    0x1000,     // Length of VSENSE TPDM 
                    0,          // QDSS TPDA name index to which VSENSE TPDM is connected
                    7,          // TPDA port number on which VSENSE TPDM is connected
                    0,			// MSR-fix-Req
                },

                // As there is not user case and it is crashing in secure device while accessing DCC TPDM
                // So we are removing the DCC TPDM details.
                // while enabling make sure TPDM method and this method has aligned indexes    			
                //Package()
                //{
                //    1,          // DCC TPDM index
                //    0x06870000, // Base address of DCC TPDM
                //    0x1000,     // Length of DCC TPDM 
                //    0,          // QDSS TPDA name index to which DCC TPDM is connected
                //    8,          // TPDA port number on which DCC TPDM is connected
                //    0,			// MSR-fix-Req
                //},
    			
                Package()
                {
                    1,          // PRNG TPDM index
                    0x0684C000, // Base address of PRNG TPDM
                    0x1000,     // Length of PRNG TPDM 
                    0,          // QDSS TPDA name index to which PRNG TPDM is connected
                    9,          // TPDA port number on which PRNG TPDM is connected
                    0,			// MSR-fix-Req
                },
    			
                Package()
                {
                    2,          // QM TPDM index
                    0x069D0000, // Base address of QM TPDM
                    0x1000,     // Length of QM TPDM 
                    0,          // QDSS TPDA name index to which QM TPDM is connected
                    10,          // TPDA port number on which this QM is connected
                    0,			// MSR-fix-Req
                },
    			
                Package()
                {
                    3,          // PIMEM TPDM index
                    0x06850000, // Base address of PIMEM TPDM
                    0x1000,     // Length of PIMEM TPDM 
                    0,          // QDSS TPDA name index to which PIMEM TPDM is connected
                    13,          // TPDA port number on which PIMEM TPDM is connected
                    0,			// MSR-fix-Req
                },
    			
                Package()
                {
                    4,          // KryoB TPDM index
                    0x07860000, // Base address of KryoB TPDM
                    0x1000,     // Length of this TPDM 
                    1,          // APSS TPDA name index to which KryoB TPDM is connected
                    0,          // TPDA port number on which KryoB TPDM is connected
                    0,			// MSR-fix-Req
                },
    			
                Package()
                {
                    5,          // MSS1 TPDM index
                    0x06834000, // Base address of MSS1 TPDM
                    0x1000,     // Length of MSS1 TPDM 
                    2,          // MSS TPDA name index to which MSS1 TPDM is connected
                    0,          // TPDA port number on which MSS1 TPDM is connected
                    0,			// MSR-fix-Req
                },
    			
                Package()
                {
                    6,          // NAV TPDM index
                    0x06990000, // Base address of NAV TPDM
                    0x1000,     // Length of NAV TPDM 
                    3,          // NAV TPDA name index to which NAV TPDM is connected
                    0,          // TPDA port number on which NAV TPDM is connected
                    0,			// MSR-fix-Req
                },
    			
                Package()
                {
                    7,          // OLC TPDM index
                    0x07830000, // Base address of OLC TPDM
                    0x1000,     // Length of OLC TPDM 
                    4,          // OLC TPDA name index to which OLC TPDM is connected
                    0,          // TPDA port number on which OLC TPDM is connected
                    0,			// MSR-fix-Req
                },
    			
                Package()
                {
                    8,          // SP TPDM index
                    0x06880000, // Base address of SP TPDM
                    0x1000,     // Length of SP TPDM 
                    5,          // SP TPDA name index to which SP TPDM is connected
                    0,          // TPDA port number on which SP TPDM is connected
                    0,			// MSR-fix-Req
                },

                Package()
                {
                    9,         // RPMH0 TPDM index
                    0x06B02000, // Base address of RPMH0 TPDM
                    0x1000,     // Length of RPMH0 TPDM 
                    6,          // SWAO TPDA name index to which RPMH0 TPDM is connected
                    0,          // TPDA port number on which RPMH0 TPDM is connected
                    0,			// MSR-fix-Req
                },

                Package()
                {
                    10,         // RPMH1 TPDM index
                    0x06B03000, // Base address of RPMH1 TPDM
                    0x1000,     // Length of RPMH1 TPDM 
                    6,          // SWAO TPDA name index to which RPMH1 TPDM is connected
                    1,          // TPDA port number on which RPMH1 TPDM is connected
                    1,			// MSR-fix-Req
                },

                Package()
                {
                    11,         // DDR TPDM index
                    0x069E0000, // Base address of DDR TPDM
                    0x1000,     // Length of DDR TPDM 
                    0,          // QDSS TPDA name index to which DDR TPDM is connected
                    3,          // TPDA port number on which DDR TPDM is connected
                    1,			// MSR-fix-Req
                },

                Package()
                {
                    12,         // MSS0 TPDM index
                    0x06830000, // Base address of MSS0 TPDM
                    0x1000,     // Length of MSS0 TPDM 
                    9,          // MSSDL TPDA name index to which MSS0 TPDM is connected
                    0,          // TPDA port number on which MSS0 TPDM is connected
                    0,			// MSR-fix-Req
                },

                Package()
                {
                    13,         // MMSS TPDM index
                    0x06C08000, // Base address of MMSS TPDM
                    0x1000,     // Length of MMSS TPDM 
                    0,          // QDSS TPDA name index to which MMSS TPDM is connected
                    2,          // TPDA port number on which MMSS TPDM is connected
                    1,			// MSR-fix-Req
                },

                Package()
                {
                    14,         // LPASS TPDM index
                    0x06844000, // Base address of LPASS TPDM
                    0x1000,     // Length of LPASS TPDM 
                    0,          // QDSS TPDA name index to which LPASS TPDM is connected
                    5,          // TPDA port number on which LPASS TPDM is connected
                    1,			// MSR-fix-Req
                },

                Package()
                {
                    15,         // TURING TPDM index
                    0x06860000, // Base address of TOURING TPDM
                    0x1000,     // Length of TOURING TPDM 
                    0,          // QDSS TPDA name index to which TOURING TPDM is connected
                    6,          // TPDA port number on which TOURING TPDM is connected
                    1,			// MSR-fix-Req
                },

                Package()
                {
                    16,         // LLMGOLD TPDM index
                    0x078B0000, // Base address of LLMGOLD TPDM
                    0x1000,     // Length of LLMGOLD TPDM 
                    7,          // LLMGOLD TPDA name index to which LLMGOLD TPDM is connected
                    0,          // TPDA port number on which LLMGOLD TPDM is connected
                    0,			// MSR-fix-Req
                },

                Package()
                {
                    17,         // LLMSILVER TPDM index
                    0x078A0000, // Base address of LLMSILVER TPDM
                    0x1000,     // Length of LLMSILVER TPDM 
                    8,          // LLMSILVER TPDA name index to which LLMSILVER TPDM is connected
                    0,          // TPDA port number on which LPASS LLMSILVER is connected
                    0,			// MSR-fix-Req
                },
            }
        )
    }
}
