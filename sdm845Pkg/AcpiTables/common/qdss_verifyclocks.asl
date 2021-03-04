//===========================================================================
//                           <qdss_verifyclocks.asl>
// DESCRIPTION
//   This file contains the clock registers needed by qdss driver.
//
//
//
//===========================================================================

Scope(\_SB.QDSS)
{
    Method (QVCR) // Qdss Verify Clock Register
    {
        Return
        (
            Package()
            {  // CBC register Address, Enable bit position
                Package() {0x00109024, 0},  // GCC_MMNOC_AT_CBCR,             CLK_ENABLE
                Package() {0x00172024, 0},  // GCC_SP_AT_CBCR,                CLK_ENABLE
				
                Package() {0x00151004, 2},  // GCC_RPM_CLOCK_BRANCH_ENA_VOTE, QDSS_CFG_AHB_CLK_ENA
				
                Package() {0x0010C004, 0},  // GCC_QDSS_DAP_AHB_CBCR,         CLK_ENABLE
                Package() {0x0010C038, 0},  // GCC_QDSS_XO_CBCR,              CLK_ENABLE
                Package() {0x0010C01C, 0},  // GCC_QDSS_ETR_USB_CBCR,         CLK_ENABLE
                Package() {0x0010C020, 0},  // GCC_QDSS_STM_CBCR,             CLK_ENABLE
                Package() {0x0010C024, 0},  // GCC_QDSS_TRACECLKIN_CBCR,      CLK_ENABLE
                Package() {0x0010C030, 0},  // GCC_QDSS_DAP_CBCR,             CLK_ENABLE
                Package() {0x00104154, 0},  // GCC_SYS_NOC_AT_CBCR,           CLK_ENABLE
                Package() {0x0010C00C, 0},  // GCC_QDSS_CENTER_AT_CBCR,       CLK_ENABLE
                Package() {0x0010C010, 0},  // GCC_SOUTH_AT_CBCR,             CLK_ENABLE
                Package() {0x0010C014, 0},  // GCC_EAST_AT_CBCR,              CLK_ENABLE
                Package() {0x0010C018, 0},  // GCC_NORTH_AT_CBCR,             CLK_ENABLE
                Package() {0x0013C008, 0},  // GCC_AOSS_AT_CBCR,              CLK_ENABLE
                Package() {0x00144034, 0},  // GCC_DDRSS_AT_CBCR,             CLK_ENABLE
                Package() {0x00147010, 0},  // GCC_LPASS_AT_CBCR,             CLK_ENABLE
                Package() {0x00145010, 0},  // GCC_TURING_AT_CBCR,            CLK_ENABLE
                Package() {0x00148010, 0},  // GCC_CPUSS_AT_CBCR,             CLK_ENABLE
                Package() {0x0018A014, 0},  // GCC_MSS_AT_CBCR,               CLK_ENABLE
                Package() {0x00111010, 0},  // GCC_WCSS_AT_CBCR,              CLK_ENABLE
                Package() {0x00171008, 0},  // GCC_GPU_AT_CBCR,               CLK_ENABLE
                Package() {0x00148198, 0},  // GCC_APSS_QDSS_APB_CBCR,        CLK_ENABLE
                Package() {0x0018901C, 0},  // GCC_IPA_APB_CBCR,              CLK_ENABLE
                Package() {0x00111014, 0},  // GCC_WCSS_APB_CBCR,             CLK_ENABLE
                Package() {0x0010C02C, 0},  // GCC_QDSS_TRIG_CBCR,            CLK_ENABLE
                Package() {0x0014700C, 0},  // GCC_LPASS_TRIG_CBCR,           CLK_ENABLE
                Package() {0x0014800C, 0},  // GCC_CPUSS_TRIG_CBCR,           CLK_ENABLE
                Package() {0x0018A010, 0},  // GCC_MSS_TRIG_CBCR,             CLK_ENABLE
                Package() {0x00171014, 0},  // GCC_GPU_TRIG_CBCR,             CLK_ENABLE
                Package() {0x00172020, 0},  // GCC_SP_TRIG_CBCR,              CLK_ENABLE
                Package() {0x00148194, 0},  // GCC_APSS_QDSS_TSCTR_CBCR,      CLK_ENABLE
                Package() {0x00104148, 0},  // GCC_SYS_NOC_QDSS_STM_AXI_CBCR, CLK_ENABLE
                Package() {0x0010B034, 0},  // GCC_MMSS_AT_CBCR,              CLK_ENABLE
                Package() {0x0010B03C, 0},  // GCC_MMSS_TRIG_CBCR,            CLK_ENABLE
                Package() {0x0010C028, 0},  // GCC_QDSS_TSCTR_CBCR,           CLK_ENABLE
            }
        )
    }	   
}