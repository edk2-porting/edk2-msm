//PCIE asl

// Unused Memory range
OperationRegion(CP00, SystemMemory, 0x13000000, 0x24)
Field(CP00, DWordAcc, NoLock, Preserve){
	MVIO, 32, //0x00 Address to cause Memory violation
	MV01, 32, //0x04 Address to cause Memory violation
	MV02, 32, //0x08 Address to cause Memory violation
	MV03, 32, //0x0C Address to cause Memory violation
	MV04, 32, //0x10 Address to cause Memory violation
	MV11, 32, //0x14 Address to cause Memory violation
	MV12, 32, //0x18 Address to cause Memory violation
	MV13, 32, //0x1C Address to cause Memory violation
	MV14, 32, //0x20 Address to cause Memory violation
}
	
// PCIE_0_PCIE20_PARF
OperationRegion(CP01, SystemMemory, 0x01C00000, 0x1004)
Field(CP01, DWordAcc, NoLock, Preserve){
	PSC0, 32, //0x00 PCIE_0_PCIE20_PARF_SYS_CTRL
	Offset(0x20),
	PPC0, 32, //0x20 PCIE_0_PCIE20_PARF_PM_CTRL
	PPS0, 32, //0x24 PCIE_0_PCIE20_PARF_PM_STTS
	Offset(0x1b0),
	PLT0, 32, //0x1b0 PCIE_0_PCIE20_PARF_LTSSM
	Offset(0x358),
	PSL0, 32, //0x358 PCIE20_PARF_SLV_ADDR_SPACE_SIZE
	Offset(0x360),
	WBL0, 32, //0x360 PCIE20_PARF_BLOCK_SLV_AXI_WR_BASE
	WBH0, 32, //0x364 PCIE20_PARF_BLOCK_SLV_AXI_WR_BASE_HI
	WLL0, 32, //0x368 PCIE20_PARF_BLOCK_SLV_AXI_WR_LIMIT
	WLH0, 32, //0x36C PCIE20_PARF_BLOCK_SLV_AXI_WR_LIMIT_HI
	RBL0, 32, //0x370 PCIE20_PARF_BLOCK_SLV_AXI_RD_BASE
	RBH0, 32, //0x374 PCIE20_PARF_BLOCK_SLV_AXI_RD_BASE_HI
	RLL0, 32, //0x378 PCIE20_PARF_BLOCK_SLV_AXI_RD_LIMIT
	RLH0, 32, //0x37C PCIE20_PARF_BLOCK_SLV_AXI_RD_LIMIT_HI
	PPEB, 32, //0x380 PCIE_0_PCIE20_PARF_ECAM_BASE
	Offset(0x398),
	WBL1, 32, //0x398 PCIE20_PARF_BLOCK_SLV_AXI_WR_BASE_2
	WBH1, 32, //0x39C PCIE20_PARF_BLOCK_SLV_AXI_WR_BASE_2_HI
	WLL1, 32, //0x3A0 PCIE20_PARF_BLOCK_SLV_AXI_WR_LIMIT_2
	WLH1, 32, //0x3A4 PCIE20_PARF_BLOCK_SLV_AXI_WR_LIMIT_2_HI
	RBL1, 32, //0x3A8 PCIE20_PARF_BLOCK_SLV_AXI_RD_BASE_2
	RBH1, 32, //0x3AC PCIE20_PARF_BLOCK_SLV_AXI_RD_BASE_2_HI
	RLL1, 32, //0x3B0 PCIE20_PARF_BLOCK_SLV_AXI_RD_LIMIT_2
	RLH1, 32, //0x3B4 PCIE20_PARF_BLOCK_SLV_AXI_RD_LIMIT_2_HI
	Offset(0x1000),
	PDT0, 32, //0x1000 PCIE_0_PCIE20_PARF_DEVICE_TYPE
}

// PCIE_0_QSERDES_COM_QSERDES_COM_PCIE_USB3_QMP_PLL
OperationRegion(CP02, SystemMemory, 0x01C06000, 0x188)
Field(CP02, DWordAcc, NoLock, Preserve){
	Offset (0x00C),
	QCB1, 32, //0x00C QSERDES_COM_BG_TIMER
	QSEC, 32, //0x010 QSERDES_COM_SSC_EN_CENTER
	QAP1, 32, //0x014 QSERDES_COM_SSC_ADJ_PER1
	QAP2, 32, //0x018 QSERDES_COM_SSC_ADJ_PER2
	QSP1, 32, //0x01C QSERDES_COM_SSC_PER1
	QSP2, 32, //0x020 QSERDES_COM_SSC_PER2
	QSS1, 32, //0x024 QSERDES_COM_SSC_STEP_SIZE1
	QSS2, 32, //0x028 QSERDES_COM_SSC_STEP_SIZE2
	Offset (0x034),
	QECE, 32, //0x034 QSERDES_COM_BIAS_EN_CLKBUFLR_EN
	QCE1, 32, //0x038 QSERDES_COM_CLK_ENABLE1
	QSCC, 32, //0x03C QSERDES_COM_SYS_CLK_CTRL
	QSBE, 32, //0x40  QSERDES_COM_SYSCLK_BUF_ENABLE
	Offset (0x048),
	QCPI, 32, //0x048 QSERDES_COM_PLL_IVCO
	Offset (0x05C),
	QCED, 32, //0x05C QSERDES_COM_CLK_EP_DIV
	QCP0, 32, //0x060 QSERDES_COM_CP_CTRL_MODE0
	Offset (0x068),
	QPR0, 32, //0x068 QSERDES_COM_PLL_RCTRL_MODE0
	Offset (0x070),
	QPC0, 32, //0x070 QSERDES_COM_PLL_CCTRL_MODE0
	Offset (0x080),
	QSES, 32, //0x080 QSERDES_COM_SYSCLK_EN_SEL
	Offset (0x088),
	QCRC, 32, //0x088 QSERDES_COM_RESETSM_CNTRL
	Offset (0x090),
	QCLC, 32, //0x090 QSERDES_COM_LOCK_CMP_EN
	Offset (0x098),
	QC1M, 32, //0x098 QSERDES_COM_LOCK_CMP1_MODE0
	QC2M, 32, //0x09C QSERDES_COM_LOCK_CMP2_MODE0
	QC3M, 32, //0x0A0 QSERDES_COM_LOCK_CMP3_MODE0
	Offset (0x0B0),
	QSM0, 32, //0x0B0 QSERDES_COM_DEC_START_MODE0
	Offset (0x0B8),
	QS1M, 32, //0x0B8 QSERDES_COM_DIV_FRAC_START1_MODE0
	QS2M, 32, //0x0BC QSERDES_COM_DIV_FRAC_START2_MODE0
	QS3M, 32, //0x0C0 QSERDES_COM_DIV_FRAC_START3_MODE0
	Offset (0x0D8),
	QIG0, 32, //0x0D8 QSERDES_COM_INTEGLOOP_GAIN0_MODE0
	QIG1, 32, //0x0DC QSERDES_COM_INTEGLOOP_GAIN1_MODE0
	Offset (0x0F0),
	QCVT, 32, //0x0F0 QSERDES_COM_VCO_TUNE_MAP
	QVT1, 32, //0x0F4 QSERDES_COM_VCO_TUNE1_MODE0
	QVT2, 32, //0x0F8 QSERDES_COM_VCO_TUNE2_MODE0
	Offset (0x11C),
	QTT1, 32, //0x11C QSERDES_COM_VCO_TUNE_TIMER1
	QTT2, 32, //0x120 QSERDES_COM_VCO_TUNE_TIMER2
	Offset (0x138),
	QCCS, 32, //0x138 QSERDES_COM_CLK_SELECT
	QCHS, 32, //0x13C QSERDES_COM_HSCLK_SEL
	Offset (0x148),
	QCD0, 32, //0x148 QSERDES_COM_CORECLK_DIV_MODE0
	Offset (0x154),
	QCCN, 32, //0x154 QSERDES_COM_CORE_CLK_EN
	Offset (0x15C),
	QCCC, 32, //0x15C QSERDES_COM_CMN_CONFIG
	Offset (0x164),
	QMCS, 32, //0x164 QSERDES_COM_SVS_MODE_CLK_SEL
	Offset (0x184),
	QCCM, 32, //0x184 QSERDES_COM_CMN_MODE
}

// PCIE_0_QSERDES_TX_QSERDES_TX_PCIE_USB3_QMP_TX
OperationRegion(CP03, SystemMemory, 0x01C06200, 0xA8)
Field(CP03, DWordAcc, NoLock, Preserve){	
	Offset (0x044),
	QTOT, 32, //0x044 QSERDES_TX_RES_CODE_LANE_OFFSET_TX
	Offset (0x060),
	QTDE, 32, //0x060 QSERDES_TX_HIGHZ_DRVR_EN
	Offset (0x08C),
	QTM1, 32, //0x08C QSERDES_TX_LANE_MODE_1
	Offset (0x0A4),
	QTL2, 32, //0x0A4 QSERDES_TX_RCV_DETECT_LVL_2
}

// PCIE_0_QSERDES_RX_QSERDES_RX_PCIE_USB3_QMP_RX
OperationRegion(CP04, SystemMemory, 0x01C06400, 0x16C)
Field(CP04, DWordAcc, NoLock, Preserve){
	Offset (0x00C),
	QRSH, 32, //0x00C QSERDES_RX_UCDR_SO_GAIN_HALF
	Offset (0x014),
	QRSG, 32, //0x014 QSERDES_RX_UCDR_SO_GAIN
	Offset (0x034),
	QRUS, 32, //0x034 QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE
	Offset (0x03C),
	QRFL, 32, //0x03C QSERDES_RX_UCDR_FASTLOCK_COUNT_LOW
	Offset (0x044),
	QRPC, 32, //0x044 QSERDES_RX_UCDR_PI_CONTROLS
	Offset (0x0D4),
	QRC2, 32, //0x0D4 QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2
	QRC3, 32, //0x0D8 QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3
	QRC4, 32, //0x0DC QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4
	Offset (0x0F8),
	QRA1, 32, //0x0F8 QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1
	QRA2, 32, //0x0FC QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2
	Offset (0x100),
	QRSE, 32, //0x100 QSERDES_RX_SIGDET_ENABLES
	QRSC, 32, //0x104 QSERDES_RX_SIGDET_CNTRL
	Offset (0x10C),
	QRDC, 32, //0x10C QSERDES_RX_SIGDET_DEGLITCH_CNTRL
	Offset (0x11C),
	QRIM, 32, //0x11C QSERDES_RX_RX_INTERFACE_MODE
	Offset (0x164),
	QRM0, 32, //0x164 QSERDES_RX_RX_MODE_00
	QRM1, 32, //0x168 QSERDES_RX_RX_MODE_01
}

// PCIE_0_PCIE_USB3_PCS_MISC_PCIE_USB3_PCS_MISC_PCIE_USB3_PCS_MISC
OperationRegion(CP05, SystemMemory, 0x01C06600, 0x70)
Field(CP05, DWordAcc, NoLock, Preserve){
	Offset (0x02C),
	PMDC, 32, //0x02C PCIE_PCS_MISC_OSC_DTCT_CONFIG2
	Offset (0x044),
	PAC1, 32, //0x044 PCIE_PCS_MISC_PCIE_INT_AUX_CLK_CONFIG1
	Offset (0x054),
	PMC2, 32, //0x054 PCIE_PCS_MISC_OSC_DTCT_MODE2_CONFIG2
	PMC3, 32, //0x058 PCIE_PCS_MISC_OSC_DTCT_MODE2_CONFIG3
	PMC4, 32, //0x05C PCIE_PCS_MISC_OSC_DTCT_MODE2_CONFIG4
	PMC5, 32, //0x060 PCIE_PCS_MISC_OSC_DTCT_MODE2_CONFIG5
}

// PCIE_0_PCIE_USB3_PCS_PCIE_USB3_PCS_PCIE_USB3_PCS
OperationRegion(CP06, SystemMemory, 0x01C06800, 0x210)
Field(CP06, DWordAcc, NoLock, Preserve){
	PPSR, 32, //0x000 PCIE_PCS_SW_RESET
	PPDC, 32, //0x004 PCIE_PCS_POWER_DOWN_CONTROL
	PCST, 32, //0x008 PCIE_PCS_START_CONTROL
	Offset (0x054),
	PERD, 32, //0x054 PCIE_PCS_ENDPOINT_REFCLK_DRIVE
	Offset (0x06C),
	PSC4, 32, //0x06C PCIE_PCS_POWER_STATE_CONFIG4
	Offset (0x0A0),
	PDTA, 32, //0x0A0 PCIE_PCS_PWRUP_RESET_DLY_TIME_AUXCLK
	PLTA, 32, //0x0A4 PCIE_PCS_LP_WAKEUP_DLY_TIME_AUXCLK
	PLCD, 32, //0x0A8 PCIE_PCS_PLL_LOCK_CHK_DLY_TIME
	Offset (0x0C4),
	PFC1, 32, //0x0C4 PCIE_PCS_FLL_CNTRL1
	PFC2, 32, //0x0C8 PCIE_PCS_FLL_CNTRL2
	PFVL, 32, //0x0CC PCIE_PCS_FLL_CNT_VAL_L
	PFVH, 32, //0x0D0 PCIE_PCS_FLL_CNT_VAL_H_TOL
	PFMC, 32, //0x0D4 PCIE_PCS_FLL_MAN_CODE
	Offset (0x174),
	PPPS, 32, //0x174 PCIE_PCS_PCS_STATUS
	Offset (0x1A8),
	PSDM, 32, //0x1A8 PCIE_PCS_LP_WAKEUP_DLY_TIME_AUXCLK_MSB
	PODA, 32, //0x1AC PCIE_PCS_OSC_DTCT_ACTIONS
	PPSC, 32, //0x1B0 PCIE_PCS_SIGDET_CNTRL
	Offset (0x1D8),
	PRSL, 32, //0x1D8 PCIE_PCS_RX_SIGDET_LVL	
	PDAL, 32, //0x1DC PCIE_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_LSB	
	PDAM, 32, //0x1E0 PCIE_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_MSB
	Offset (0x20C),
	PRC1, 32, //0x20C PCIE_PCS_REFGEN_REQ_CONFIG1	
}

// PCIE_0_PCIE20_DBI
OperationRegion(CP07, SystemMemory, 0x60000000, 0x1000)
Field(CP07, DWordAcc, NoLock, Preserve){
	Offset(0x4),
	SCR0, 32, //0x04 STATUS_COMMAND_REG
	CRI0, 32, //0x08 TYPE1_CLASS_CODE_REV_ID_REG
	Offset(0x10),
	R0B0, 32, //0x10 PCIE_0_BAR0_REG
	R0B1, 32, //0x14 PCIE_0_BAR1_REG
	BNR0, 32, //0x18 PCIE_0_SEC_LAT_TIMER_SUB_BUS_SEC_BUS_PRI_BUS_REG
	Offset(0x7C),
	LCA0, 32, //0x7C PCIE_0_LINK_CAPABILITIES_REG
	LCS0, 32, //0x80 PCIE_0_LINK_CONTROL_LINK_STATUS_REG
	Offset(0x88),
	SLC0, 32,  //0x88 SLOT_CAS
	Offset(0xa0),
	LC20, 32, //0xa0 PCIE_0_LINK_CONTROL2_LINK_STATUS2_REG
	Offset(0x8bc),
	CSW0, 32, // 0x8bc CS Write Access register
	Offset(0x900),
	IAV0, 32, //0x900 PCIE_0_IATU_VIEWPORT_REG
	CR10, 32, //0x904 PCIE_0_PL_IATU_REGION_CTRL_REG_1_OUTBOUND_0
	CR20, 32, //0x908 PCIE_0_PL_IATU_REGION_CTRL_REG_2_OUTBOUND_0
	ILB0, 32, //0x90C PCIE_0_PL_IATU_LWR_BASE_ADDR_REG_OUTBOUND_0
	IUB0, 32, //0x910 PCIE_0_PL_IATU_UPPER_BASE_ADDR_REG_OUTBOUND_0
	ILR0, 32, //0x914 PCIE_0_PL_IATU_LIMIT_ADDR_REG_OUTBOUND_0
	ILT0, 32, //0x918 PCIE_0_PL_IATU_LWR_TARGET_ADDR_REG_OUTBOUND_0
	IUT0, 32, //0x91C PCIE_0_PL_IATU_UPPER_TARGET_ADDR_REG_OUTBOUND_0
	Offset(0xF24),
	ESC0, 32, //0xF24 PCIE_0_PCIE20_ELBI_SYS_CTRL
	EST0, 32, //0xF28 PCIE_0_PCIE20_ELBI_SYS_STTS
	Offset(0xFC4),
	ECS0, 32, //0xFC4 PCIE_0_PCIE20_ELBI_CS2_ENABLE
}

// Setup PHY
Method(PPU0, 0x0, Serialized) {
	Name(TOUT, Zero)
	Store (0x04, PDT0) // PCIE20_PARF_DEVICE_TYPE
	Store (0x01, PPDC) // PCIE_PCS_POWER_DOWN_CONTROL
	Store (0x14, QECE) // QSERDES_COM_BIAS_EN_CLKBUFLR_EN
	Store (0x30, QCCS) // QSERDES_COM_CLK_SELECT
	Store (0x07, QCPI) // QSERDES_COM_PLL_IVCO
	Store (0x06, QCCC) // QSERDES_COM_CMN_CONFIG
	Store (0x01, QCLC) // QSERDES_COM_LOCK_CMP_EN
	Store (0x20, QCRC) // QSERDES_COM_RESETSM_CNTRL
	Store (0x00, QCVT) // QSERDES_COM_VCO_TUNE_MAP
	Store (0x01, QVT2) // QSERDES_COM_VCO_TUNE2_MODE0
	Store (0xC9, QVT1) // QSERDES_COM_VCO_TUNE1_MODE0
	Store (0xFF, QTT1) // QSERDES_COM_VCO_TUNE_TIMER1
	Store (0x3F, QTT2) // QSERDES_COM_VCO_TUNE_TIMER2
	Store (0x01, QMCS) // QSERDES_COM_SVS_MODE_CLK_SEL
	Store (0x00, QCCN) // QSERDES_COM_CORE_CLK_EN
	Store (0x0A, QCD0) // QSERDES_COM_CORECLK_DIV_MODE0
	Store (0x19, QCED) // QSERDES_COM_CLK_EP_DIV
	Store (0x90, QCE1) // QSERDES_COM_CLK_ENABLE1
	Store (0x82, QSM0) // QSERDES_COM_DEC_START_MODE0
	Store (0x02, QS3M) // QSERDES_COM_DIV_FRAC_START3_MODE0
	Store (0xEA, QS2M) // QSERDES_COM_DIV_FRAC_START2_MODE0
	Store (0xAB, QS1M) // QSERDES_COM_DIV_FRAC_START1_MODE0
	Store (0x00, QC3M) // QSERDES_COM_LOCK_CMP3_MODE0
	Store (0x0D, QC2M) // QSERDES_COM_LOCK_CMP2_MODE0
	Store (0x04, QC1M) // QSERDES_COM_LOCK_CMP1_MODE0
	Store (0x00, QCHS) // QSERDES_COM_HSCLK_SEL
	Store (0x06, QCP0) // QSERDES_COM_CP_CTRL_MODE0
	Store (0x16, QPR0) // QSERDES_COM_PLL_RCTRL_MODE0
	Store (0x36, QPC0) // QSERDES_COM_PLL_CCTRL_MODE0
	Store (0x01, QCCM) // QSERDES_COM_CMN_MODE
	Store (0x02, QSCC) // QSERDES_COM_SYS_CLK_CTRL
	Store (0x06, QSBE) // QSERDES_COM_SYSCLK_BUF_ENABLE
	Store (0x04, QSES) // QSERDES_COM_SYSCLK_EN_SEL
	Store (0x00, QIG1) // QSERDES_COM_INTEGLOOP_GAIN1_MODE0
	Store (0x3F, QIG0) // QSERDES_COM_INTEGLOOP_GAIN0_MODE0
	Store (0x09, QCB1) // QSERDES_COM_BG_TIMER
	Store (0x01, QSEC) // QSERDES_COM_SSC_EN_CENTER
	Store (0x40, QSP1) // QSERDES_COM_SSC_PER1
	Store (0x01, QSP2) // QSERDES_COM_SSC_PER2
	Store (0x02, QAP1) // QSERDES_COM_SSC_ADJ_PER1
	Store (0x00, QAP2) // QSERDES_COM_SSC_ADJ_PER2
	Store (0x7E, QSS1) // QSERDES_COM_SSC_STEP_SIZE1
	Store (0x15, QSS2) // QSERDES_COM_SSC_STEP_SIZE2
	Store (0x02, QTOT) // QSERDES_TX_RES_CODE_LANE_OFFSET_TX
	Store (0x12, QTL2) // QSERDES_TX_RCV_DETECT_LVL_2
	Store (0x10, QTDE) // QSERDES_TX_HIGHZ_DRVR_EN
	Store (0x06, QTM1) // QSERDES_TX_LANE_MODE_1
	Store (0x03, QRSC) // QSERDES_RX_SIGDET_CNTRL
	Store (0x10, QRSE) // QSERDES_RX_SIGDET_ENABLES
	Store (0x14, QRDC) // QSERDES_RX_SIGDET_DEGLITCH_CNTRL
	Store (0x0E, QRC2) // QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2
	Store (0x04, QRC3) // QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3
	Store (0x1A, QRC4) // QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4
	Store (0x4B, QRUS) // QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE
	Store (0x04, QRSG) // QSERDES_RX_UCDR_SO_GAIN
	Store (0x04, QRSH) // QSERDES_RX_UCDR_SO_GAIN_HALF
	Store (0x71, QRA1) // QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1
	Store (0x59, QRM0) // QSERDES_RX_RX_MODE_00
	Store (0x59, QRM1) // QSERDES_RX_RX_MODE_01
	Store (0x80, QRA2) // QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2
	Store (0x40, QRIM) // QSERDES_RX_RX_INTERFACE_MODE
	Store (0x71, QRPC) // QSERDES_RX_UCDR_PI_CONTROLS
	Store (0x40, QRFL) // QSERDES_RX_UCDR_FASTLOCK_COUNT_LOW
	Store (0x04, PERD) // PCIE_PCS_ENDPOINT_REFCLK_DRIVE
	Store (0x52, PMDC) // PCIE_PCS_MISC_OSC_DTCT_CONFIG2
	Store (0x10, PMC2) // PCIE_PCS_MISC_OSC_DTCT_MODE2_CONFIG2
	Store (0x1A, PMC4) // PCIE_PCS_MISC_OSC_DTCT_MODE2_CONFIG4
	Store (0x06, PMC5) // PCIE_PCS_MISC_OSC_DTCT_MODE2_CONFIG5
	Store (0x83, PFC2) // PCIE_PCS_FLL_CNTRL2
	Store (0x09, PFVL) // PCIE_PCS_FLL_CNT_VAL_L
	Store (0xA2, PFVH) // PCIE_PCS_FLL_CNT_VAL_H_TOL
	Store (0x40, PFMC) // PCIE_PCS_FLL_MAN_CODE
	Store (0x02, PFC1) // PCIE_PCS_FLL_CNTRL1
	Store (0x00, PODA) // PCIE_PCS_OSC_DTCT_ACTIONS
	Store (0x01, PDTA) // PCIE_PCS_PWRUP_RESET_DLY_TIME_AUXCLK
	Store (0x00, PDAM) // PCIE_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_MSB 
	Store (0x20, PDAL) // PCIE_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_LSB 
	Store (0x00, PSDM) // PCIE_PCS_LP_WAKEUP_DLY_TIME_AUXCLK_MSB
	Store (0x01, PLTA) // PCIE_PCS_LP_WAKEUP_DLY_TIME_AUXCLK 
	Store (0x73, PLCD) // PCIE_PCS_PLL_LOCK_CHK_DLY_TIME 
	Store (0xBB, PRSL) // PCIE_PCS_RX_SIGDET_LVL
	Store (0x03, PPSC) // PCIE_PCS_SIGDET_CNTRL
	Store (0x0D, PRC1) // PCIE_PCS_REFGEN_REQ_CONFIG1	
	Store (0x00, PSC4) // PCIE_PCS_POWER_STATE_CONFIG4
	Store (0x00, PAC1) // PCIE_PCS_MISC_PCIE_INT_AUX_CLK_CONFIG1

	// Version 2 and Higher Changes
	If (LGreaterEqual (\_SB.SIDV,0x00020000))
	{
		//V1 and V2 PHY settings are same for PCI0
	}
	
	Store (0x03, PPDC) // PCIE_PCS_POWER_DOWN_CONTROL
	Store (0x00, PPSR) // PCIE_PCS_SW_RESET
	Store (0x03, PCST) // PCIE_PCS_START_CONTROL
	
	Store (PPPS, Local0) // PCIE_PCS_PCS_STATUS
	// loop until HWIO_PCIE_PCS_PCS_STATUS_PHYSTATUS_BMSK is '0'
	While(And (Local0 , 0x40))
	{
		Sleep(1)
		Increment(TOUT)
		If (LEqual(TOUT, 0xF))
		{
			Break
		}
		Store (PPPS, Local0)
	}
	
	If(LEqual(TOUT, 0xF))
	{
		//Timeout occurred after 15 ms, so return an error value
		Return(One)
	}
	Else
	{
		// PHY Init success
		Return(Zero)
	}
}

// Setup Link
Method(LTS0, 0x0, Serialized) {
	Name(TOUT, Zero)
	Store(LC20, Local0) ////PCIE_0_LINK_CONTROL2_LINK_STATUS2_REG
	OR(Local0, 0x40, Local0) //set 3.5dB transmitter de-emphassis
	Store(Local0, LC20)
	Store (0x100, PLT0)// PCIE_0_PCIE20_PARF_PCIE20_PARF_LTSSM = 0x100					
	Store (EST0, Local0)// PCIE20_ELBI_SYS_STTS
	While(LNotEqual(And(Local0 , 0x400), 0x400))// check for HWIO_PCIE20_ELBI_SYS_STTS_XMLH_LINK_UP_BMSK
	{
		Sleep(1)
		Increment(TOUT)
		If (LEqual(TOUT, 0x96))
		{
			Break
		}
		Store (EST0, Local0)
	}
	
	If(LEqual(TOUT, 0x96))
	{
		//Timeout occurred after 150 ms, so return an error value
		Return(One)
	}
	Else
	{
		// LTSSM success
		Return(Zero)
	}
}

// Setup iATU
Method(IAT0, 0x0, Serialized) {
	Store (0x01, IAV0)// IATU_VIEWPORT_REG
	Store (0x60100000, ILB0)//  PL_IATU_LWR_BASE_ADDR_REG_OUTBOUND_0
	Store (0x00, IUB0)// PL_IATU_UPPER_BASE_ADDR_REG_OUTBOUND_0
	Store (0x601FFFFF, ILR0)// PL_IATU_LIMIT_ADDR_REG_OUTBOUND_0
	Store (0x01000000, ILT0 )// PL_IATU_LWR_TARGET_ADDR_REG_OUTBOUND_0
	Store (0x00, IUT0)// PL_IATU_UPPER_TARGET_ADDR_REG_OUTBOUND_0
	Store (0x04, CR10)// PL_IATU_REGION_CTRL_REG_1_OUTBOUND_0
	Store (0x80000000, CR20)// PL_IATU_REGION_CTRL_REG_2_OUTBOUND_0
	Store (0x010100, BNR0)// SEC_LAT_TIMER_SUB_BUS_SEC_BUS_PRI_BUS_REG
}

// Rootport Ecam-Blocker Method
// Arg0 - Block Base Address
// Arg1 - Block Limit Address
Method(REB0, 0x2, Serialized) {
	Store (PSC0, Local0)
	// Disable ECAM Blocker Region-0 at 26th bit
	AND (Local0, 0xFBFFFFFF, Local0)
	Store (Local0, PSC0)
	
	// Configure Region Base and Limit
	Store (Arg0, WBL0)
	Store (0x00, WBH0)
	Store (Arg1, WLL0)
	Store (0x00, WLH0)
	Store (Arg0, RBL0)
	Store (0x00, RBH0)
	Store (Arg1, RLL0)
	Store (0x00, RLH0)
	
	Store (PSC0, Local0)
	// Enable ECAM Blocker Region-0 at 26th bit
	OR (Local0, 0x04000000, Local0)
	Store (Local0, PSC0)
}

// Endpoint Ecam-Blocker Method
// Arg0 - Block Base Address
// Arg1 - Block Limit Address
Method(EEB0, 0x2, Serialized) {
	Store (PSC0, Local0)
	// Disable ECAM Blocker Region-2 at 30th bit
	AND (Local0, 0xBFFFFFFF, Local0)
	Store (Local0, PSC0)
	
	// Configure Region Base and Limit
	Store (Arg0, WBL1)
	Store (0x00, WBH1)
	Store (Arg1, WLL1)
	Store (0x00, WLH1)
	Store (Arg0, RBL1)
	Store (0x00, RBH1)
	Store (Arg1, RLL1)
	Store (0x00, RLH1)
	
	Store (PSC0, Local0)
	// Enable ECAM Blocker Region-2 at 30th bit
	OR (Local0, 0x40000000, Local0)
	Store (Local0, PSC0)
}

// Configure the limit for PCIe0 RP ECAM blocker
Name(E0LT, 0x600FFFFF)

// Setup Misc Configuration
Method(MSC0, 0x0, Serialized) {
	// Memory Enable Compliance
	Store (SCR0, Local0)
	OR (Local0, 0x2, Local0)
	Store (Local0, SCR0) 

	// Writing Slave address space size as 16MB
	Store (0x01000000, PSL0)// PCIE20_PARF_SLV_ADDR_SPACE_SIZE
	
	// Clear REQ_NOT_ENTER_L1 Field
	Store(PPC0, Local0)
	AND (Local0, 0xFFFFFFDF, Local0)
	Store (Local0, PPC0)
	
	// Enable DBI_RO_WR_EN to access CS1 region
	Store (0x01, CSW0)

	// Writing Link capability for enabling L1 and disabling L0s 
	Store(LCA0, Local0)
	// Enable Optionality Compliance
	OR(Local0, 0x00400000, Local0)
	// Disable L0s
	AND(Local0, 0xFFFFFBFF, Local0)
	// Enable L1
	OR(Local0, 0x00000800, Local0)
	Store(Local0 , LCA0)

	// Writing Bridge Class code
	Store (CRI0, Local0)
	AND (Local0, 0xFFFF, Local0)
	OR (Local0, 0x06040000, Local0)
	Store (Local0, CRI0)
	
	// Assert CS2
	Store (0x1, ECS0)
	// Disable BAR0 and BAR1
	Store (0x0, R0B0)
	Store (0x0, R0B1)
	// De-Assert CS2
	Store (0x0, ECS0)

	// Disable DBI_RO_WR_EN to access CS1 region
	Store (0x00, CSW0)
	
	// Store ECAM Base
	Store (0x60000000, PPEB)
	// Rootport Ecam-Blocker Method
	REB0 (0x60001000, \_SB.E0LT)
	// Endpoint Ecam-Blocker Method
	EEB0 (0x60101000, 0x601FFFFF)
}

Name(G0D3, Zero)
PowerResource(P0ON, 0x5, 0) {
	Name (_DEP, Package(0x1) {
		\_SB.GIO0
	})
	Method(_STA){Return(0)}
	Method(_ON) {
		If(G0D3)
		{
			Store(0x1, GP0B)
			Sleep(1)
			Store(0x0, GP0B)
		
			If(LEqual(\_SB.GIO0.GABL, 0x1))
			{
				Store (0x01, \_SB.PCI0.MOD1)
				Sleep(5)
				Store (0x00, \_SB.PCI0.MOD2)
			}

			Store (0x00, G0D3)

			// Setup PHY
			if ( \_SB.PPU0() )
			{
				// Method not returned 0x00, So handle the error
				Store("PHY Init failed for Port 0", Debug)
				// Store(0x0, MV01)
				// This infinite loop would cause a bug check in Windows
				While (One)
				{
				}
			}
                                     
			Sleep(5)
			If(LEqual(\_SB.GIO0.GABL, 0x1))
			{
				Store (0x1, \_SB.PCI0.MOD2)
			}
								
			// Setup the Link
			If( \_SB.LTS0() )
			{
				// Link training Failed!, block any potential access to Endpoint
				// by extending the ECAM blocker region to hide the Endpoint
				// config space
				Store(0x601FFFFF, \_SB.E0LT)
			}
			Else
			{
				Store(0x600FFFFF, \_SB.E0LT)
			}
								
			// Setup iATU					
			\_SB.IAT0()
			
			// Misc Configuration
			\_SB.MSC0()
		}
	}
	Method(_OFF) { 
		If(LEqual(G0D3, 0x0))
		{
			BreakPoint
			Name(PTO0, Zero)
			Store(1,G0D3)
			Store(PSC0 , Local0)
			OR(Local0, 0x10, Local0)
			Store(Local0, PSC0)
			Store(ESC0, Local0)
			OR(Local0, 0x10, Local0)
			Store(Local0 , ESC0)
			
			Store (PPS0, Local0)
			While(LNotEqual(And(Local0 , 0x20, Local0), 0x20)) 
			{
				Sleep(10)						
				Add(PTO0, 0x1, PTO0)
				If(LEqual(PTO0, 0xA))
				{
					Break
				}
				Store (PPS0, Local0)
			}
			
			If(LEqual(\_SB.GIO0.GABL, 0x1))
			{
				Store (0x0, \_SB.PCI0.MOD2)
			}
			
			// Power Down Sequence for Port PHY
			Store(0x0, PPDC)// PCIE_PCS_POWER_DOWN_CONTROL
			Store(0x0, PCST)// PCIE_PCS_START_CONTROL
		}
	}
}

PowerResource(P0OF, 0x5, 0) {
	Name (_DEP, Package(0x1) {		 
		\_SB.GIO0
	})
	Method(_STA){Return(0)}  
	Method(_ON) {

	}
	Method(_OFF) {
		 
	}
	Method(_RST, 0x0, NotSerialized) {
		Store(0x1, GP0B)
		Sleep(1)
		Store(0x0, GP0B)
	
		If(LEqual(\_SB.GIO0.GABL, 0x1))
		{
			Store (0x00, \_SB.PCI0.MOD1)
			Sleep(1)
			Store (0x01, \_SB.PCI0.MOD1)
			Sleep(5)
			Store (0x00, \_SB.PCI0.MOD2)
		}

		Store (0x00, G0D3)

		// Setup PHY
		if ( \_SB.PPU0() )
		{
			// Method not returned 0x00, So handle the error
			Store("PHY Init failed for Port 0", Debug)
			// Store(0x0, MV03)
			// This infinite loop would cause a bug check in Windows
			While (One)
			{
			}
		}
                                 
		Sleep(5)
		If(LEqual(\_SB.GIO0.GABL, 0x1))
		{
			Store (0x1, \_SB.PCI0.MOD2)
		}
							
		// Setup the Link
		If( \_SB.LTS0() )
		{
			// Link training Failed!, block any potential access to Endpoint
			// by extending the ECAM blocker region to hide the Endpoint
			// config space
			Store(0x601FFFFF, \_SB.E0LT)
		}
		Else
		{
			Store(0x600FFFFF, \_SB.E0LT)
		}
							
		// Setup iATU					
		\_SB.IAT0()
		
		// Misc Configuration
		\_SB.MSC0()	
	}
}

Device (PCI0) {
	Name (_DEP, Package(0x1) {
		 \_SB.PEP0
	})
	Name(_HID,EISAID("PNP0A08"))
	Alias(\_SB.PSUB, _SUB)
	Name(_CID,EISAID("PNP0A03"))
	Name(_UID, 0x0)
	Name(_SEG, 0x0)
	Name(_BBN, 0x0)
	Name(_PRT, Package(){
		Package(){0x0FFFF, 0, 0, 181},  // Slot 1, INTA
		Package(){0x0FFFF, 1, 0, 182},  // Slot 1, INTB
		Package(){0x0FFFF, 2, 0, 183},  // Slot 1, INTC
		Package(){0x0FFFF, 3, 0, 184}   // Slot 1, INTD
	})
	
	// On SDM850 CCA is NOT supported by default for GEN2 port
	Method (_CCA, 0)
	{
		Return (Zero)
	}
	
	//Wlan_11ad ACPI Enumeration
	Include("wlan_11ad.asl")

	Method(_PSC) {
		Return(Zero)
	}	
	
	Method (_CRS, 0x0, NotSerialized) {
		Name (RBUF, ResourceTemplate ()
		{
			// [PCIE_0_PCIE20_DBI + 2MB(ECAM_SIZE)] to [DBI_SIZE - 2MB(ECAM_SIZE) - 64KB IO Space]
			Memory32Fixed (ReadWrite, 0x60200000, 0x00DF0000)
			WordBusNumber (ResourceProducer,
				MinFixed, // IsMinFixed
				MaxFixed, // IsMaxFixed
				,         // Decode: PosDecode
				0,        // AddressGranularity
				0,        // AddressMinimum
				1,        // AddressMaximum
				0,        // AddressTranslation
				2)        // RangeLength
		})
		
		Return (RBUF)
	}
	Name(SUPP, 0)
	Name(CTRL, 0)

	Method(_DSW, 0x3, NotSerialized) {
	
	}
	
	Method(_OSC, 4) {
		// Check for proper UUID
		If(LEqual(Arg0,ToUUID("33DB4D5B-1FF7-401C-9657-7441C03DD766")))
		{
			// Create DWord-adressable fields from the Capabilities Buffer
			CreateDWordField(Arg3,0,CDW1)
			CreateDWordField(Arg3,4,CDW2)
			CreateDWordField(Arg3,8,CDW3)
			
			// Save Capabilities DWord2 & 3
			Store(CDW2,SUPP)
			Store(CDW3,CTRL)
			
			//No native hot plug support 
			//ASPM supported
			//Clock PM supported
			//MSI/MSI-X
			
			If(LNotEqual(And(SUPP, 0x16), 0x16))
			{
				And(CTRL,0x1E) // Give control of everything to the OS
			}
			
			And(CTRL,0x15,CTRL) 
			
			If(LNotEqual(Arg1,One))
			{ // Unknown revision
				Or(CDW1,0x08,CDW1)
			}		
			If(LNotEqual(CDW3,CTRL))
			{ // Capabilities bits were masked
				Or(CDW1,0x10,CDW1)
			} // Update DWORD3 in the buffer
	
			Store(CTRL,CDW3)
			Return(Arg3)
		} 
		Else {
			Or(CDW1,4,CDW1) // Unrecognized UUID
			Return(Arg3)
		}
	} // End _OSC
	
	Method(_DSM, 0x4, NotSerialized) {
		If(LEqual(Arg0,ToUUID("E5C937D0-3553-4d7a-9117-EA4D19C3434D")))
		{
			// DSM Function
			switch(ToInteger(Arg2))
			{
			//
			// Function 0: Return supported functions, based on revision
			//
                                   
			case(0)
			{			   
				// revision 0: functions 1-9 are supported. 
				return (Buffer() {0xFF, 0x03})
			}
                                   
			//
			// Function 1: For emulated ActiveBoth controllers, returns
			//             a package of controller-relative pin numbers.
			//             Each corresponding pin will have an initial
			//             polarity of ActiveHigh. 
			//
	   
			case(1)
			{   
				
				Return (Package(2) {
							Package(1){
							1}, // Success
							Package(3){
							0,0x1,0x1}// Link Width supports x1??, PCI express card slot and WAKE# signal
				
				})
			} 
			case(2)
			{   
				
				Return (Package(1) {
							Package(4){
							1,3,0,7} //Random have to check 
				
				})
			}
			case(3)
			{   
				
				Return (Package(1) {
							0}) //Random have to check , not implemented yet
				
				
			}
			case(4) // Not implemented yet
			{   
				
				Return (Package(2) {
							Package(1){0},
							Package(4){
							1,3,0,7} //Random have to check 
				
				})
			}
			case(5) // PCI Boot Configuration
			{   
				
				Return (Package(1) {
							1			
				})
			}				
			case(6) // Latency Scale and Value
			{   
				
				Return (Package(4) {
							Package(1){0}, // Maximum Snoop Latency Scale
							Package(1){0}, // Maximum Snoop Latency Value
							Package(1){0}, // Maximum No-Snoop Latency Scale
							Package(1){0}  // Maximum No-Snoop Latency Value
				
				})
			}
			case(7) // PCI Express Slot Parsing
			{   
				
				Return (Package(1) {
							1			
				})
			}
			case(8) // DSM for Avoiding Power-On Reset Delay Duplication on Sx Resume
			{   
				Return (Package(1) {
						1 // Allow OS to avoid duplicating post power-on delay on Sx resume flow
				})
			}
			case(9) // DSM for Specifying Device Readiness Durations
			{   
				Return (Package(5) {
						0xFFFFFFFF, // FW Reset Time
						0xFFFFFFFF, // FW DL_Up Time
						0xFFFFFFFF, // FW FLR Reset Time
						0x00000000, // FW D3hot to D0 Time
						0xFFFFFFFF  // FW VF Enable Time
				}) 					
			}
			
			default
			{
			   // Functions 9+: not supported
			}
                                  
			}
		}
	}
	
	Name(_S0W, 4)
	
	Name (GWLE, ResourceTemplate () //An existing GPIO Connection (to be used later)
	{
		GpioIo (Exclusive,PullNone,0,0, ,"\\_SB.GIO0", ,) {39}
	})
	Name (GWLP, ResourceTemplate () //An existing GPIO Connection (to be used later)
	{
		GpioIo (Exclusive,PullNone,0,0, ,"\\_SB.GIO0", ,) {35}
	})
	Scope(\_SB.GIO0) {
		OperationRegion(WLEN, GeneralPurposeIO, 0, 1) // Note: Region is less than 8 pins long
		OperationRegion(WLPR, GeneralPurposeIO, 0, 1) // Note: Region is less than 8 pins long
	}

	Field(\_SB.GIO0.WLEN, ByteAcc, NoLock, Preserve) 
	{
		Connection (\_SB.PCI0.GWLE), // Following fields will be accessed atomically 
		MOD1, 1 // WIFI_EN 
	}
	Field(\_SB.GIO0.WLPR, ByteAcc, NoLock, Preserve) 
	{
		Connection (\_SB.PCI0.GWLP), // Following fields will be accessed atomically 
		MOD2, 1 // PERST
	}
	
	Name(_PR0, Package(){
		\_SB.P0ON
	})
	Name(_PR3, Package(){
		\_SB.P0ON
	})
	
	// PCIe Root Port 1
	Device(RP1) {
		Name(_ADR, 0x0)
		
		Name(_PR0, Package(){
			\_SB.P0OF			
		})
		Name(_PR3, Package(){
			\_SB.P0OF	
		})		
	
		Name(_PRR, Package(){
			\_SB.P0OF	
		})		
	
		Name(_S0W, 4)
			
		Method (_CRS, 0x0, NotSerialized) {
			Name (RBUF, ResourceTemplate ()
			{
				GpioInt(Edge, ActiveLow, ExclusiveAndWake, PullUp, 0, "\\_SB.GIO0", 0 , ResourceConsumer, , ) {37}
			})
			Return (RBUF)
		}

		Name (_DSD, Package () {
			ToUUID("6211E2C0-58A3-4AF3-90E1-927A4E0C55A4"),
			Package () {
				Package (2) {"HotPlugSupportInD3", 1},
			}
		})
			
		Method(_DSM, 0x4, NotSerialized) {
			If(LEqual(Arg0,ToUUID("E5C937D0-3553-4d7a-9117-EA4D19C3434D")))
			{
				// DSM Function
				switch(ToInteger(Arg2))
				{
					case(0)
					{			   
						// revision 0: functions 1-7 are not supported. 
						return (Buffer() {0x01, 0x03})
					}
					case(8) // DSM for Avoiding Power-On Reset Delay Duplication on Sx Resume
					{
						Return (Package(1) {
							1 // Allow OS to avoid duplicating post power-on delay on Sx resume flow
						})
					}
					case(9) // DSM for Specifying Device Readiness Durations
					{
						Return (Package(5) {
							0xFFFFFFFF, // FW Reset Time
							0xFFFFFFFF, // FW DL_Up Time
							0xFFFFFFFF, // FW FLR Reset Time
							0x00000000, // FW D3hot to D0 Time
							0xFFFFFFFF  // FW VF Enable Time
						})
					}
					default
					{
					   // Functions 1-7: not supported
					}
				}
			}
		}		
    }
} // End PCI0

Include("pcie1.asl")
