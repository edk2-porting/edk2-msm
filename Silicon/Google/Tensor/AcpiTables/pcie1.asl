//PCIE1 asl

// PARF
OperationRegion(CP08, SystemMemory, 0x01C08000, 0x1004)
Field(CP08, DWordAcc, NoLock, Preserve){
	PSC1, 32, //0x00 PARF_SYS_CTRL
	Offset(0x20),
	PPC1, 32, //0x20 PARF_PM_CTRL
	PPS1, 32, //0x24 PARF_PM_STTS
	Offset(0x1b0),
	PLT1, 32, //0x1b0 PARF_LTSSM
	Offset(0x358),
	PSL1, 32, //0x358 PARF_SLV_ADDR_SPACE_SIZE
	Offset(0x360),
	LBW0, 32, //0x360 PARF_BLOCK_SLV_AXI_WR_BASE
	HBW0, 32, //0x364 PARF_BLOCK_SLV_AXI_WR_BASE_HI
	LLW0, 32, //0x368 PARF_BLOCK_SLV_AXI_WR_LIMIT
	HLW0, 32, //0x36C PARF_BLOCK_SLV_AXI_WR_LIMIT_HI
	LBR0, 32, //0x370 PARF_BLOCK_SLV_AXI_RD_BASE
	HBR0, 32, //0x374 PARF_BLOCK_SLV_AXI_RD_BASE_HI
	LLR0, 32, //0x378 PARF_BLOCK_SLV_AXI_RD_LIMIT
	HLR0, 32, //0x37C PARF_BLOCK_SLV_AXI_RD_LIMIT_HI
	PEB1, 32, //0x380 PARF_ECAM_BASE
	Offset(0x398),
	LBW1, 32, //0x398 PARF_BLOCK_SLV_AXI_WR_BASE_2
	HBW1, 32, //0x39C PARF_BLOCK_SLV_AXI_WR_BASE_2_HI
	LLW1, 32, //0x3A0 PARF_BLOCK_SLV_AXI_WR_LIMIT_2
	HLW1, 32, //0x3A4 PARF_BLOCK_SLV_AXI_WR_LIMIT_2_HI
	LBR1, 32, //0x3A8 PARF_BLOCK_SLV_AXI_RD_BASE_2
	HBR1, 32, //0x3AC PARF_BLOCK_SLV_AXI_RD_BASE_2_HI
	LLR1, 32, //0x3B0 PARF_BLOCK_SLV_AXI_RD_LIMIT_2
	HLR1, 32, //0x3B4 PARF_BLOCK_SLV_AXI_RD_LIMIT_2_HI
	Offset(0x1000),
	PDT1, 32, //0x1000 PARF_DEVICE_TYPE
}

// PCIE_GEN3_QHP_COM_HP_PCIE_COM_REG_BASE
OperationRegion(CP09, SystemMemory, 0x01C0A000, 0x26C)
Field(CP09, DWordAcc, NoLock, Preserve){
	Offset (0x014),
	HSEC, 32, //0x014 PCIE_GEN3_QHP_COM_SSC_EN_CENTER
	HAP1, 32, //0x018 PCIE_GEN3_QHP_COM_SSC_ADJ_PER1
	HAP2, 32, //0x01C PCIE_GEN3_QHP_COM_SSC_ADJ_PER2
	HSP1, 32, //0x020 PCIE_GEN3_QHP_COM_SSC_PER1
	HSP2, 32, //0x024 PCIE_GEN3_QHP_COM_SSC_PER2
	HSS1, 32, //0x028 PCIE_GEN3_QHP_COM_SSC_STEP_SIZE1
	HSS2, 32, //0x02C PCIE_GEN3_QHP_COM_SSC_STEP_SIZE2
	Offset (0x034),
	HSM1, 32, //0x034 PCIE_GEN3_QHP_COM_SSC_STEP_SIZE1_MODE1
	HSM2, 32, //0x038 PCIE_GEN3_QHP_COM_SSC_STEP_SIZE2_MODE1
	Offset (0x054),
	HECE, 32, //0x054 PCIE_GEN3_QHP_COM_BIAS_EN_CLKBUFLR_EN
	HCE1, 32, //0x058 PCIE_GEN3_QHP_COM_CLK_ENABLE1
	HSCC, 32, //0x05C PCIE_GEN3_COM_SYS_CLK_CTRL
	HSBE, 32, //0x060 PCIE_GEN3_COM_SYSCLK_BUF_ENABLE
	HPLE, 32, //0x064 PCIE_GEN3_QHP_COM_PLL_EN
	HCPI, 32, //0x068 PCIE_GEN3_QHP_COM_PLL_IVCO
	C1M0, 32, //0x06C PCIE_GEN3_QHP_COM_LOCK_CMP1_MODE0
	C2M0, 32, //0x070 PCIE_GEN3_QHP_COM_LOCK_CMP2_MODE0
	C3M0, 32, //0x074 PCIE_GEN3_QHP_COM_LOCK_CMP3_MODE0
	C1M1, 32, //0x078 PCIE_GEN3_QHP_COM_LOCK_CMP1_MODE1
	C2M1, 32, //0x07C PCIE_GEN3_QHP_COM_LOCK_CMP2_MODE1
	C3M1, 32, //0x080 PCIE_GEN3_QHP_COM_LOCK_CMP3_MODE1
	Offset (0x098),
	BGTR, 32, //0x098 PCIE_GEN3_QHP_COM_BGV_TRIM
	Offset (0x0B4),
	HCM0, 32, //0x0B4 PCIE_GEN3_QHP_COM_CP_CTRL_MODE0
	HCM1, 32, //0x0B8 PCIE_GEN3_QHP_COM_CP_CTRL_MODE1
	Offset (0x0C0),
	HPR0, 32, //0x0C0 PCIE_GEN3_QHP_COM_PLL_RCTRL_MODE0
	HPR1, 32, //0x0C4 PCIE_GEN3_QHP_COM_PLL_RCTRL_MODE1
	HPR2, 32, //0x0C8 PCIE_GEN3_QHP_COM_PLL_RCTRL_MODE2
	HPC0, 32, //0x0CC PCIE_GEN3_QHP_COM_PLL_CCTRL_MODE0
	HPC1, 32, //0x0D0 PCIE_GEN3_QHP_COM_PLL_CCTRL_MODE1
	HPC2, 32, //0x0D4 PCIE_GEN3_QHP_COM_PLL_CCTRL_MODE2
	Offset (0x0DC),
	HSES, 32, //0x0DC PCIE_GEN3_QHP_COM_SYSCLK_EN_SEL
	Offset (0x0F0),
	HRC2, 32, //0x0F0 PCIE_GEN3_QHP_COM_RESTRIM_CTRL2
	Offset (0x0F8),
	HCLC, 32, //0x0F8 PCIE_GEN3_QHP_COM_LOCK_CMP_EN
	Offset (0x100),
	HRM0, 32, //0x100 PCIE_GEN3_QHP_COM_DEC_START_MODE0
	Offset (0x108),
	HRM1, 32, //0x108 PCIE_GEN3_QHP_COM_DEC_START_MODE1
	Offset (0x11C),
	S1M0, 32, //0x11C PCIE_GEN3_QHP_COM_DIV_FRAC_START1_MODE0
	S2M0, 32, //0x120 PCIE_GEN3_QHP_COM_DIV_FRAC_START2_MODE0
	S3M0, 32, //0x124 PCIE_GEN3_QHP_COM_DIV_FRAC_START3_MODE0
	S1M1, 32, //0x128 PCIE_GEN3_QHP_COM_DIV_FRAC_START1_MODE1
	S2M1, 32, //0x12C PCIE_GEN3_QHP_COM_DIV_FRAC_START2_MODE1
	S3M1, 32, //0x130 PCIE_GEN3_QHP_COM_DIV_FRAC_START3_MODE1
	Offset (0x150),
	G0M0, 32, //0x150 PCIE_GEN3_QHP_COM_INTEGLOOP_GAIN0_MODE0
	Offset (0x158),
	G0M1, 32, //0x158 PCIE_GEN3_QHP_COM_INTEGLOOP_GAIN0_MODE1
	Offset (0x178),
	HCVT, 32, //0x178 PCIE_GEN3_QHP_COM_VCO_TUNE_MAP
	Offset (0x1C8),
	BGCT, 32, //0x1C8 PCIE_GEN3_QHP_COM_BG_CTRL
	HCCS, 32, //0x1CC PCIE_GEN3_QHP_COM_CLK_SELECT
	HCHS, 32, //0x1D0 PCIE_GEN3_QHP_COM_HSCLK_SEL1
	Offset (0x1E0),
	HCDV, 32, //0x1E0 PCIE_GEN3_QHP_COM_CORECLK_DIV
	Offset (0x1E8),
	HCCE, 32, //0x1E8 PCIE_GEN3_QHP_COM_CORE_CLK_EN
	Offset (0x1F0),
	HCCC, 32, //0x1F0 PCIE_GEN3_QHP_COM_CMN_CONFIG
	Offset (0x1FC),
	HMCS, 32, //0x1FC PCIE_GEN3_QHP_COM_SVS_MODE_CLK_SEL
	Offset (0x21C),
	HDM1, 32, //0x21C PCIE_GEN3_QHP_COM_CORECLK_DIV_MODE1
	Offset (0x224),
	HCCM, 32, //0x224 PCIE_GEN3_QHP_COM_CMN_MODE
	HVD1, 32, //0x228 PCIE_GEN3_QHP_COM_VREGCLK_DIV1
	HVD2, 32, //0x22C PCIE_GEN3_QHP_COM_VREGCLK_DIV2
}

// PCIE_GEN3_QHP_L0_HP_PCIE_LANE_REG_BASE
OperationRegion(CP10, SystemMemory, 0x01C0A800, 0x2F0)
Field(CP10, DWordAcc, NoLock, Preserve){
	Offset (0x00C),
	L0C0, 32, //0x00C PCIE_GEN3_QHP_L0_DRVR_CTRL0
	L0C1, 32, //0x010 PCIE_GEN3_QHP_L0_DRVR_CTRL1
	L0C2, 32, //0x014 PCIE_GEN3_QHP_L0_DRVR_CTRL2
	Offset (0x018),
	L0TE, 32, //0x018 PCIE_GEN3_QHP_L0_DRVR_TAP_EN
	Offset (0x060),
	L0BM, 32, //0x060 PCIE_GEN3_QHP_L0_TX_BAND_MODE
	L0LM, 32, //0x060 PCIE_GEN3_QHP_L0_LANE_MODE
	Offset (0x07C),
	L0PR, 32, //0x07C PCIE_GEN3_QHP_L0_PARALLEL_RATE
	Offset (0x0C0),
	L0L0, 32, //0x0C0 PCIE_GEN3_QHP_L0_CML_CTRL_MODE0
	L0L1, 32, //0x0C4 PCIE_GEN3_QHP_L0_CML_CTRL_MODE1
	L0L2, 32, //0x0C8 PCIE_GEN3_QHP_L0_CML_CTRL_MODE2
	Offset (0x0D0),
	L0R1, 32, //0x0D0 PCIE_GEN3_QHP_L0_PREAMP_CTRL_MODE1
	L0R2, 32, //0x0D4 PCIE_GEN3_QHP_L0_PREAMP_CTRL_MODE2
	L0M0, 32, //0x0D8 PCIE_GEN3_QHP_L0_MIXER_CTRL_MODE0
	L0M1, 32, //0x0DC PCIE_GEN3_QHP_L0_MIXER_CTRL_MODE1
	L0M2, 32, //0x0E0 PCIE_GEN3_QHP_L0_MIXER_CTRL_MODE2
	Offset (0x0FC),
	L0CD, 32, //0x0FC PCIE_GEN3_QHP_L0_CTLE_THRESH_DFE
	L0VD, 32, //0x100 PCIE_GEN3_QHP_L0_VGA_THRESH_DFE
	Offset (0x108),
	L0X0, 32, //0x108 PCIE_GEN3_QHP_L0_RXENGINE_EN0
	Offset (0x114),
	L0TT, 32, //0x114 PCIE_GEN3_QHP_L0_CTLE_TRAIN_TIME
	L0OT, 32, //0x118 PCIE_GEN3_QHP_L0_CTLE_DFE_OVRLP_TIME
	L0RT, 32, //0x11C PCIE_GEN3_QHP_L0_DFE_REFRESH_TIME
	L0ET, 32, //0x120 PCIE_GEN3_QHP_L0_DFE_ENABLE_TIME
	L0VG, 32, //0x124 PCIE_GEN3_QHP_L0_VGA_GAIN
	L0DG, 32, //0x128 PCIE_GEN3_QHP_L0_DFE_GAIN
	Offset (0x130),
	L0EG, 32, //0x130 PCIE_GEN3_QHP_L0_EQ_GAIN
	L0OG, 32, //0x134 PCIE_GEN3_QHP_L0_OFFSET_GAIN
	L0PG, 32, //0x138 PCIE_GEN3_QHP_L0_PRE_GAIN
	L0IN, 32, //0x13C PCIE_GEN3_QHP_L0_VGA_INITVAL
	Offset (0x154),
	L0EI, 32, //0x154 PCIE_GEN3_QHP_L0_EQ_INITVAL
	Offset (0x160),
	L0DI, 32, //0x160 PCIE_GEN3_QHP_L0_EDAC_INITVAL
	Offset (0x168),
	L0B0, 32, //0x168 PCIE_GEN3_QHP_L0_RXEQ_INITB0
	L0B1, 32, //0x16C PCIE_GEN3_QHP_L0_RXEQ_INITB1
	Offset (0x178),
	L0T1, 32, //0x178 PCIE_GEN3_QHP_L0_RCVRDONE_THRESH1
	Offset (0x180),
	L0RC, 32, //0x180 PCIE_GEN3_QHP_L0_RXEQ_CTRL
	L0F0, 32, //0x184 PCIE_GEN3_QHP_L0_UCDR_FO_GAIN_MODE0
	L0F1, 32, //0x188 PCIE_GEN3_QHP_L0_UCDR_FO_GAIN_MODE1
	L0F2, 32, //0x18C PCIE_GEN3_QHP_L0_UCDR_FO_GAIN_MODE2
	L0S0, 32, //0x190 PCIE_GEN3_QHP_L0_UCDR_SO_GAIN_MODE0
	L0S1, 32, //0x194 PCIE_GEN3_QHP_L0_UCDR_SO_GAIN_MODE1
	L0S2, 32, //0x198 PCIE_GEN3_QHP_L0_UCDR_SO_GAIN_MODE2
	L0SC, 32, //0x19C PCIE_GEN3_QHP_L0_UCDR_SO_CONFIG
	Offset (0x1A4),
	L0RB, 32, //0x1A4 PCIE_GEN3_QHP_L0_RX_BAND
	Offset (0x1C0),
	L0P0, 32, //0x1C0 PCIE_GEN3_QHP_L0_RX_RCVR_PATH1_MODE0
	L0P1, 32, //0x1C4 PCIE_GEN3_QHP_L0_RX_RCVR_PATH1_MODE1
	L0P2, 32, //0x1C8 PCIE_GEN3_QHP_L0_RX_RCVR_PATH1_MODE2
	Offset (0x230),
	L0SE, 32, //0x230 PCIE_GEN3_QHP_L0_SIGDET_ENABLES
	L0SN, 32, //0x234 PCIE_GEN3_QHP_L0_SIGDET_CNTRL
	L0SD, 32, //0x238 PCIE_GEN3_QHP_L0_SIGDET_DEGLITCH_CNTRL
	Offset (0x2A4),
	L0DC, 32, //0x2A4 PCIE_GEN3_QHP_L0_DCC_GAIN
	L0ST, 32, //0x2A8 PCIE_GEN3_QHP_L0_RSM_START
	L0RE, 32, //0x2AC PCIE_GEN3_QHP_L0_RX_EN_SIGNAL
	L0PC, 32, //0x2B0 PCIE_GEN3_QHP_L0_PSM_RX_EN_CAL
	Offset (0x2B8),
	L0N0, 32, //0x2B8 PCIE_GEN3_QHP_L0_RX_MISC_CNTRL0
	Offset (0x2C0),
	L0ER, 32, //0x2C0 PCIE_GEN3_QHP_L0_TS0_TIMER
	L0HI, 32, //0x2C4 PCIE_GEN3_QHP_L0_DLL_HIGHDATARATE
	Offset (0x2CC),
	L0RR, 32, //0x2CC PCIE_GEN3_QHP_L0_RX_RESECODE_OFFSET
}	

// PCIE_GEN3_QHP_L1_HP_PCIE_LANE_REG_BASE
OperationRegion(CP11, SystemMemory, 0x01C0B000, 0x2F0)
Field(CP11, DWordAcc, NoLock, Preserve){
	Offset (0x00C),
	L1C0, 32, //0x00C PCIE_GEN3_QHP_L1_DRVR_CTRL0
	L1C1, 32, //0x010 PCIE_GEN3_QHP_L1_DRVR_CTRL1
	L1C2, 32, //0x014 PCIE_GEN3_QHP_L1_DRVR_CTRL2
	Offset (0x018),
	L1TE, 32, //0x018 PCIE_GEN3_QHP_L1_DRVR_TAP_EN
	Offset (0x060),
	L1BM, 32, //0x060 PCIE_GEN3_QHP_L1_TX_BAND_MODE
	L1LM, 32, //0x060 PCIE_GEN3_QHP_L1_LANE_MODE
	Offset (0x07C),
	L1PR, 32, //0x07C PCIE_GEN3_QHP_L1_PARALLEL_RATE
	Offset (0x0C0),
	L1L0, 32, //0x0C0 PCIE_GEN3_QHP_L1_CML_CTRL_MODE0
	L1L1, 32, //0x0C4 PCIE_GEN3_QHP_L1_CML_CTRL_MODE1
	L1L2, 32, //0x0C8 PCIE_GEN3_QHP_L1_CML_CTRL_MODE2
	Offset (0x0D0),
	L1R1, 32, //0x0D0 PCIE_GEN3_QHP_L1_PREAMP_CTRL_MODE1
	L1R2, 32, //0x0D4 PCIE_GEN3_QHP_L1_PREAMP_CTRL_MODE2
	L1M0, 32, //0x0D8 PCIE_GEN3_QHP_L1_MIXER_CTRL_MODE0
	L1M1, 32, //0x0DC PCIE_GEN3_QHP_L1_MIXER_CTRL_MODE1
	L1M2, 32, //0x0E0 PCIE_GEN3_QHP_L1_MIXER_CTRL_MODE2
	Offset (0x0FC),
	L1CD, 32, //0x0FC PCIE_GEN3_QHP_L1_CTLE_THRESH_DFE
	L1VD, 32, //0x100 PCIE_GEN3_QHP_L1_VGA_THRESH_DFE
	Offset (0x108),
	L1X0, 32, //0x108 PCIE_GEN3_QHP_L1_RXENGINE_EN0
	Offset (0x114),
	L1TT, 32, //0x114 PCIE_GEN3_QHP_L1_CTLE_TRAIN_TIME
	L1OT, 32, //0x118 PCIE_GEN3_QHP_L1_CTLE_DFE_OVRLP_TIME
	L1RT, 32, //0x11C PCIE_GEN3_QHP_L1_DFE_REFRESH_TIME
	L1ET, 32, //0x120 PCIE_GEN3_QHP_L1_DFE_ENABLE_TIME
	L1VG, 32, //0x124 PCIE_GEN3_QHP_L1_VGA_GAIN
	L1DG, 32, //0x128 PCIE_GEN3_QHP_L1_DFE_GAIN
	Offset (0x130),
	L1EG, 32, //0x130 PCIE_GEN3_QHP_L1_EQ_GAIN
	L1OG, 32, //0x134 PCIE_GEN3_QHP_L1_OFFSET_GAIN
	L1PG, 32, //0x138 PCIE_GEN3_QHP_L1_PRE_GAIN
	L1IN, 32, //0x13C PCIE_GEN3_QHP_L1_VGA_INITVAL
	Offset (0x154),
	L1EI, 32, //0x154 PCIE_GEN3_QHP_L1_EQ_INITVAL
	Offset (0x160),
	L1DI, 32, //0x160 PCIE_GEN3_QHP_L1_EDAC_INITVAL
	Offset (0x168),
	L1B0, 32, //0x168 PCIE_GEN3_QHP_L1_RXEQ_INITB0
	L1B1, 32, //0x16C PCIE_GEN3_QHP_L1_RXEQ_INITB1
	Offset (0x178),
	L1T1, 32, //0x178 PCIE_GEN3_QHP_L1_RCVRDONE_THRESH1
	Offset (0x180),
	L1RC, 32, //0x180 PCIE_GEN3_QHP_L1_RXEQ_CTRL
	L1F0, 32, //0x184 PCIE_GEN3_QHP_L1_UCDR_FO_GAIN_MODE0
	L1F1, 32, //0x188 PCIE_GEN3_QHP_L1_UCDR_FO_GAIN_MODE1
	L1F2, 32, //0x18C PCIE_GEN3_QHP_L1_UCDR_FO_GAIN_MODE2
	L1S0, 32, //0x190 PCIE_GEN3_QHP_L1_UCDR_SO_GAIN_MODE0
	L1S1, 32, //0x194 PCIE_GEN3_QHP_L1_UCDR_SO_GAIN_MODE1
	L1S2, 32, //0x198 PCIE_GEN3_QHP_L1_UCDR_SO_GAIN_MODE2
	L1SC, 32, //0x19C PCIE_GEN3_QHP_L1_UCDR_SO_CONFIG
	Offset (0x1A4),
	L1RB, 32, //0x1A4 PCIE_GEN3_QHP_L1_RX_BAND
	Offset (0x1C0),
	L1P0, 32, //0x1C0 PCIE_GEN3_QHP_L1_RX_RCVR_PATH1_MODE0
	L1P1, 32, //0x1C4 PCIE_GEN3_QHP_L1_RX_RCVR_PATH1_MODE1
	L1P2, 32, //0x1C8 PCIE_GEN3_QHP_L1_RX_RCVR_PATH1_MODE2
	Offset (0x230),
	L1SE, 32, //0x230 PCIE_GEN3_QHP_L1_SIGDET_ENABLES
	L1SN, 32, //0x234 PCIE_GEN3_QHP_L1_SIGDET_CNTRL
	L1SD, 32, //0x238 PCIE_GEN3_QHP_L1_SIGDET_DEGLITCH_CNTRL
	Offset (0x2A4),
	L1DC, 32, //0x2A4 PCIE_GEN3_QHP_L1_DCC_GAIN
	L1ST, 32, //0x2A8 PCIE_GEN3_QHP_L1_RSM_START
	L1RE, 32, //0x2AC PCIE_GEN3_QHP_L1_RX_EN_SIGNAL
	L1PC, 32, //0x2B0 PCIE_GEN3_QHP_L1_PSM_RX_EN_CAL
	Offset (0x2B8),
	L1N0, 32, //0x2B8 PCIE_GEN3_QHP_L1_RX_MISC_CNTRL0
	Offset (0x2C0),
	L1ER, 32, //0x2C0 PCIE_GEN3_QHP_L1_TS0_TIMER
	L1HI, 32, //0x2C4 PCIE_GEN3_QHP_L1_DLL_HIGHDATARATE
	Offset (0x2CC),
	L1RR, 32, //0x2CC PCIE_GEN3_QHP_L1_RX_RESECODE_OFFSET
}

// PCIE_GEN3_HP_PCIE_PHY_HP_PCIE_PCS_REG_BASE
OperationRegion(CP12, SystemMemory, 0x01C0B800, 0x2DC)
Field(CP12, DWordAcc, NoLock, Preserve){
	Offset (0x000),
	HPSR, 32, //0x000 PCIE_GEN3_HP_PCIE_PHY_SW_RESET
	HPDC, 32, //0x004 PCIE_GEN3_HP_PCIE_PHY_POWER_DOWN_CONTROL
	HSTC, 32, //0x008 PCIE_GEN3_HP_PCIE_PHY_START_CONTROL
	Offset (0x02C),
	HTM3, 32, //0x02C PCIE_GEN3_HP_PCIE_PHY_TXMGN_MAIN_V0_M3P5DB
	Offset (0x040),
	HTP3, 32, //0x040 PCIE_GEN3_HP_PCIE_PHY_TXMGN_POST_V0_M3P5DB
	Offset (0x054),
	HTM6, 32, //0x054 PCIE_GEN3_HP_PCIE_PHY_TXMGN_MAIN_V0_M6DB
	Offset (0x068),
	HTP6, 32, //0x068 PCIE_GEN3_HP_PCIE_PHY_TXMGN_POST_V0_M6DB
	Offset (0x15C),
	HPSG, 32, //0x15C PCIE_GEN3_HP_PCIE_PHY_POWER_STATE_CONFIG
	Offset (0x16C),
	HPG5, 32, //0x16C PCIE_GEN3_HP_PCIE_PHY_POWER_STATE_CONFIG5
	Offset (0x174),
	HTRC, 32, //0x174 PCIE_GEN3_HP_PCIE_PHY_PCS_TX_RX_CONFIG
	Offset (0x2AC),
	HPST, 32, //0x2AC PCIE_GEN3_HP_PCIE_PHY_PCS_STATUS
}
			
// PCIE_GEN3_PCIE20_DBI_REG_BASE
OperationRegion(CP13, SystemMemory, 0x40000000, 0x1000)
Field(CP13, DWordAcc, NoLock, Preserve){
	Offset(0x004),
	SCR1, 32, //0x004 STATUS_COMMAND_REG
	CRI1, 32, //0x008 TYPE1_CLASS_CODE_REV_ID_REG
	Offset(0x010),
	R1B0, 32, //0x010 BAR0_REG
	R1B1, 32, //0x014 BAR1_REG
	BNR1, 32, //0x018 SEC_LAT_TIMER_SUB_BUS_SEC_BUS_PRI_BUS_REG
	Offset(0x07C),
	LCA1, 32, //0x07C LINK_CAPABILITIES_REG
	LCS1, 32, //0x080 LINK_CONTROL_LINK_STATUS_REG
	SCA1, 32, //0x084 SLOT_CAP
	Offset(0x088),
	SLC1, 32, //0x088 SLOT_CAS
	Offset(0x0A0),
	LC21, 32, //0x0A0 LINK_CONTROL2_LINK_STATUS2_REG
	Offset(0x154),
	P1PR, 32, //0x154 PCIE PRESET
	Offset(0x710),
	GPLC, 32, //0x710 PCIE_GEN3_TYPE0_PORT_LINK_CTRL_REG
	Offset(0x80C),
	G32C, 32, //0x80C PCIE_GEN3_TYPE0_GEN2_CTRL_REG
	Offset(0x8A8),
	GEQC, 32, //0x8A8 PCIE_GEN3_TYPE0_GEN3_EQ_CONTROL_REG
	GMDC, 32, //0x8AC PCIE_GEN3_GEN3_EQ_FB_MODE_DIR_CHANGE_REG
	Offset(0x8BC),
	CSW1, 32, //0x8BC PCIE_GEN3_MISC_CONTROL_1_REG
	Offset(0x900),
	IAV1, 32, //0x900 IATU_VIEWPORT_REG
	CR11, 32, //0x904 PL_IATU_REGION_CTRL_REG_1_OUTBOUND_0
	CR21, 32, //0x908 PL_IATU_REGION_CTRL_REG_2_OUTBOUND_0
	ILB1, 32, //0x90C PL_IATU_LWR_BASE_ADDR_REG_OUTBOUND_0
	IUB1, 32, //0x910 PL_IATU_UPPER_BASE_ADDR_REG_OUTBOUND_0
	ILR1, 32, //0x914 PL_IATU_LIMIT_ADDR_REG_OUTBOUND_0
	ILT1, 32, //0x918 PL_IATU_LWR_TARGET_ADDR_REG_OUTBOUND_0
	IUT1, 32, //0x91C PL_IATU_UPPER_TARGET_ADDR_REG_OUTBOUND_0
	Offset(0xF24),
	ESC1, 32, //0xF24 ELBI_SYS_CTRL
	EST1, 32, //0xF28 ELBI_SYS_STTS
	Offset(0xFC4),
	ECS1, 32, //0xFC4 ELBI_CS2_ENABLE
}
  
// TLMM_GPIO_CFG113
OperationRegion(CP14, SystemMemory, 0x03971000, 0x10)
Field(CP14, DWordAcc, NoLock, Preserve){
	C113, 32, //0x00 TLMM_GPIO_CFGn
	I113, 32, //0x04 TLMM_GPIO_IN_OUTn
	N113, 32, //0x08 TLMM_GPIO_INTR_CFGn
	S113, 32, //0x0c TLMM_GPIO_INTR_STATUSn
}

// PCIE 0 GCC CLK CTRL REG
OperationRegion(CP15, SystemMemory, 0x16B000, 0x1020)
Field(CP15, DWordAcc, NoLock, Preserve){
	GP0B, 32, //0x0000 GCC_PCIE_0_BCR
	Offset(0x101C),
	G0PB, 32, //0x101C GCC_PCIE_0_PHY_BCR
}

// PCIE 1 GCC CLK CTRL REG
OperationRegion(CP16, SystemMemory, 0x18D000, 0x1030)
Field(CP16, DWordAcc, NoLock, Preserve){
	GP1B, 32, //0x0000 GCC_PCIE_1_BCR
	Offset(0x1014),
	G1LB, 32, //0x1014 GCC_PCIE_1_LINK_DOWN_BCR
	Offset(0x101C),
	G1PB, 32, //0x101C GCC_PCIE_1_PHY_BCR
	Offset(0x1020),
	G1NB, 32, //0x1020 GCC_PCIE_1_NOCSR_COM_PHY_BCR
}

// Setup PHY
Method(PPU1, 0x0, Serialized) {
	Name(TOUT, Zero)
	Store (0x04, PDT1) // PCIE_0_PCIE20_PARF_DEVICE_TYPE
	Store (0x03, HPDC) // PCIE_GEN3_HP_PCIE_PHY_POWER_DOWN_CONTROL
	Store (0x27, HSES) // PCIE_GEN3_QHP_COM_SYSCLK_EN_SEL
	Store (0x01, HSEC) // PCIE_GEN3_QHP_COM_SSC_EN_CENTER
	Store (0x31, HSP1) // PCIE_GEN3_QHP_COM_SSC_PER1
	Store (0x01, HSP2) // PCIE_GEN3_QHP_COM_SSC_PER2
	Store (0xDE, HSS1) // PCIE_GEN3_QHP_COM_SSC_STEP_SIZE1
	Store (0x07, HSS2) // PCIE_GEN3_QHP_COM_SSC_STEP_SIZE2
	Store (0x4C, HSM1) // PCIE_GEN3_QHP_COM_SSC_STEP_SIZE1_MODE1
	Store (0x06, HSM2) // PCIE_GEN3_QHP_COM_SSC_STEP_SIZE2_MODE1
	Store (0x18, HECE) // PCIE_GEN3_QHP_COM_BIAS_EN_CLKBUFLR_EN
	Store (0xB0, HCE1) // PCIE_GEN3_QHP_COM_CLK_ENABLE1
	Store (0x8C, C1M0) // PCIE_GEN3_QHP_COM_LOCK_CMP1_MODE0
	Store (0x20, C2M0) // PCIE_GEN3_QHP_COM_LOCK_CMP2_MODE0
	Store (0x14, C1M1) // PCIE_GEN3_QHP_COM_LOCK_CMP1_MODE1
	Store (0x34, C2M1) // PCIE_GEN3_QHP_COM_LOCK_CMP2_MODE1
	Store (0x06, HCM0) // PCIE_GEN3_QHP_COM_CP_CTRL_MODE0
	Store (0x06, HCM1) // PCIE_GEN3_QHP_COM_CP_CTRL_MODE1
	Store (0x16, HPR0) // PCIE_GEN3_QHP_COM_PLL_RCTRL_MODE0
	Store (0x16, HPR1) // PCIE_GEN3_QHP_COM_PLL_RCTRL_MODE1
	Store (0x36, HPC0) // PCIE_GEN3_QHP_COM_PLL_CCTRL_MODE0
	Store (0x36, HPC1) // PCIE_GEN3_QHP_COM_PLL_CCTRL_MODE1
	Store (0x05, HRC2) // PCIE_GEN3_QHP_COM_RESTRIM_CTRL2
	Store (0x42, HCLC) // PCIE_GEN3_QHP_COM_LOCK_CMP_EN
	Store (0x82, HRM0) // PCIE_GEN3_QHP_COM_DEC_START_MODE0
	Store (0x68, HRM1) // PCIE_GEN3_QHP_COM_DEC_START_MODE1
	Store (0x55, S1M0) // PCIE_GEN3_QHP_COM_DIV_FRAC_START1_MODE0
	Store (0x55, S2M0) // PCIE_GEN3_QHP_COM_DIV_FRAC_START2_MODE0
	Store (0x03, S3M0) // PCIE_GEN3_QHP_COM_DIV_FRAC_START3_MODE0
	Store (0xAB, S1M1) // PCIE_GEN3_QHP_COM_DIV_FRAC_START1_MODE1
	Store (0xAA, S2M1) // PCIE_GEN3_QHP_COM_DIV_FRAC_START2_MODE1
	Store (0x02, S3M1) // PCIE_GEN3_QHP_COM_DIV_FRAC_START3_MODE1
	Store (0x3F, G0M0) // PCIE_GEN3_QHP_COM_INTEGLOOP_GAIN0_MODE0
	Store (0x3F, G0M1) // PCIE_GEN3_QHP_COM_INTEGLOOP_GAIN0_MODE1
	Store (0x10, HCVT) // PCIE_GEN3_QHP_COM_VCO_TUNE_MAP
	Store (0x04, HCCS) // PCIE_GEN3_QHP_COM_CLK_SELECT
	Store (0x30, HCHS) // PCIE_GEN3_QHP_COM_HSCLK_SEL1
	Store (0x04, HCDV) // PCIE_GEN3_QHP_COM_CORECLK_DIV
	Store (0x73, HCCE) // PCIE_GEN3_QHP_COM_CORE_CLK_EN
	Store (0x1C, HCCC) // PCIE_GEN3_QHP_COM_CMN_CONFIG
	Store (0x15, HMCS) // PCIE_GEN3_QHP_COM_SVS_MODE_CLK_SEL
	Store (0x04, HDM1) // PCIE_GEN3_QHP_COM_CORECLK_DIV_MODE1
	Store (0x01, HCCM) // PCIE_GEN3_QHP_COM_CMN_MODE
	Store (0x22, HVD1) // PCIE_GEN3_QHP_COM_VREGCLK_DIV1
	Store (0x00, HVD2) // PCIE_GEN3_QHP_COM_VREGCLK_DIV2
	Store (0x20, BGTR) // PCIE_GEN3_QHP_COM_BGV_TRIM
	Store (0x07, BGCT) // PCIE_GEN3_QHP_COM_BG_CTRL
	Store (0x00, L0C0) // PCIE_GEN3_QHP_L0_DRVR_CTRL0
	Store (0x0D, L0TE) // PCIE_GEN3_QHP_L0_DRVR_TAP_EN
	Store (0x01, L0BM) // PCIE_GEN3_QHP_L0_TX_BAND_MODE
	Store (0x3A, L0LM) // PCIE_GEN3_QHP_L0_LANE_MODE
	Store (0x2F, L0PR) // PCIE_GEN3_QHP_L0_PARALLEL_RATE
	Store (0x09, L0L0) // PCIE_GEN3_QHP_L0_CML_CTRL_MODE0
	Store (0x09, L0L1) // PCIE_GEN3_QHP_L0_CML_CTRL_MODE1
	Store (0x1B, L0L2) // PCIE_GEN3_QHP_L0_CML_CTRL_MODE2
	Store (0x01, L0R1) // PCIE_GEN3_QHP_L0_PREAMP_CTRL_MODE1
	Store (0x07, L0R2) // PCIE_GEN3_QHP_L0_PREAMP_CTRL_MODE2
	Store (0x31, L0M0) // PCIE_GEN3_QHP_L0_MIXER_CTRL_MODE0
	Store (0x31, L0M1) // PCIE_GEN3_QHP_L0_MIXER_CTRL_MODE1
	Store (0x03, L0M2) // PCIE_GEN3_QHP_L0_MIXER_CTRL_MODE2
	Store (0x02, L0CD) // PCIE_GEN3_QHP_L0_CTLE_THRESH_DFE
	Store (0x00, L0VD) // PCIE_GEN3_QHP_L0_VGA_THRESH_DFE
	Store (0x12, L0X0) // PCIE_GEN3_QHP_L0_RXENGINE_EN0
	Store (0x25, L0TT) // PCIE_GEN3_QHP_L0_CTLE_TRAIN_TIME
	Store (0x00, L0OT) // PCIE_GEN3_QHP_L0_CTLE_DFE_OVRLP_TIME
	Store (0x05, L0RT) // PCIE_GEN3_QHP_L0_DFE_REFRESH_TIME
	Store (0x01, L0ET) // PCIE_GEN3_QHP_L0_DFE_ENABLE_TIME
	Store (0x26, L0VG) // PCIE_GEN3_QHP_L0_VGA_GAIN
	Store (0x12, L0DG) // PCIE_GEN3_QHP_L0_DFE_GAIN
	Store (0x04, L0EG) // PCIE_GEN3_QHP_L0_EQ_GAIN
	Store (0x04, L0OG) // PCIE_GEN3_QHP_L0_OFFSET_GAIN
	Store (0x09, L0PG) // PCIE_GEN3_QHP_L0_PRE_GAIN
	Store (0x15, L0EI) // PCIE_GEN3_QHP_L0_EQ_INITVAL
	Store (0x28, L0DI) // PCIE_GEN3_QHP_L0_EDAC_INITVAL
	Store (0x7F, L0B0) // PCIE_GEN3_QHP_L0_RXEQ_INITB0
	Store (0x07, L0B1) // PCIE_GEN3_QHP_L0_RXEQ_INITB1
	Store (0x04, L0T1) // PCIE_GEN3_QHP_L0_RCVRDONE_THRESH1
	Store (0x70, L0RC) // PCIE_GEN3_QHP_L0_RXEQ_CTRL
	Store (0x8B, L0F0) // PCIE_GEN3_QHP_L0_UCDR_FO_GAIN_MODE0
	Store (0x08, L0F1) // PCIE_GEN3_QHP_L0_UCDR_FO_GAIN_MODE1
	Store (0x0A, L0F2) // PCIE_GEN3_QHP_L0_UCDR_FO_GAIN_MODE2
	Store (0x03, L0S0) // PCIE_GEN3_QHP_L0_UCDR_SO_GAIN_MODE0
	Store (0x04, L0S1) // PCIE_GEN3_QHP_L0_UCDR_SO_GAIN_MODE1
	Store (0x04, L0S2) // PCIE_GEN3_QHP_L0_UCDR_SO_GAIN_MODE2
	Store (0x0C, L0SC) // PCIE_GEN3_QHP_L0_UCDR_SO_CONFIG
	Store (0x02, L0RB) // PCIE_GEN3_QHP_L0_RX_BAND
	Store (0x5C, L0P0) // PCIE_GEN3_QHP_L0_RX_RCVR_PATH1_MODE0
	Store (0x3E, L0P1) // PCIE_GEN3_QHP_L0_RX_RCVR_PATH1_MODE1
	Store (0x3F, L0P2) // PCIE_GEN3_QHP_L0_RX_RCVR_PATH1_MODE2
	Store (0x01, L0SE) // PCIE_GEN3_QHP_L0_SIGDET_ENABLES
	Store (0xA0, L0SN) // PCIE_GEN3_QHP_L0_SIGDET_CNTRL
	Store (0x08, L0SD) // PCIE_GEN3_QHP_L0_SIGDET_DEGLITCH_CNTRL
	Store (0x01, L0DC) // PCIE_GEN3_QHP_L0_DCC_GAIN
	Store (0xC3, L0RE) // PCIE_GEN3_QHP_L0_RX_EN_SIGNAL
	Store (0x00, L0PC) // PCIE_GEN3_QHP_L0_PSM_RX_EN_CAL
	Store (0xBC, L0N0) // PCIE_GEN3_QHP_L0_RX_MISC_CNTRL0
	Store (0x7F, L0ER) // PCIE_GEN3_QHP_L0_TS0_TIMER
	Store (0x15, L0HI) // PCIE_GEN3_QHP_L0_DLL_HIGHDATARATE
	Store (0x0C, L0C1) // PCIE_GEN3_QHP_L0_DRVR_CTRL1
	Store (0x00, L0C2) // PCIE_GEN3_QHP_L0_DRVR_CTRL2
	Store (0x04, L0RR) // PCIE_GEN3_QHP_L0_RX_RESECODE_OFFSET
	Store (0x20, L0IN) // PCIE_GEN3_QHP_L0_VGA_INITVAL
	Store (0x00, L1C0) // PCIE_GEN3_QHP_L1_DRVR_CTRL0
	Store (0x0D, L1TE) // PCIE_GEN3_QHP_L1_DRVR_TAP_EN
	Store (0x01, L1BM) // PCIE_GEN3_QHP_L1_TX_BAND_MODE
	Store (0x3A, L1LM) // PCIE_GEN3_QHP_L1_LANE_MODE
	Store (0x2F, L1PR) // PCIE_GEN3_QHP_L1_PARALLEL_RATE
	Store (0x09, L1L0) // PCIE_GEN3_QHP_L1_CML_CTRL_MODE0
	Store (0x09, L1L1) // PCIE_GEN3_QHP_L1_CML_CTRL_MODE1
	Store (0x1B, L1L2) // PCIE_GEN3_QHP_L1_CML_CTRL_MODE2
	Store (0x01, L1R1) // PCIE_GEN3_QHP_L1_PREAMP_CTRL_MODE1
	Store (0x07, L1R2) // PCIE_GEN3_QHP_L1_PREAMP_CTRL_MODE2
	Store (0x31, L1M0) // PCIE_GEN3_QHP_L1_MIXER_CTRL_MODE0
	Store (0x31, L1M1) // PCIE_GEN3_QHP_L1_MIXER_CTRL_MODE1
	Store (0x03, L1M2) // PCIE_GEN3_QHP_L1_MIXER_CTRL_MODE2
	Store (0x02, L1CD) // PCIE_GEN3_QHP_L1_CTLE_THRESH_DFE
	Store (0x00, L1VD) // PCIE_GEN3_QHP_L1_VGA_THRESH_DFE
	Store (0x12, L1X0) // PCIE_GEN3_QHP_L1_RXENGINE_EN0
	Store (0x25, L1TT) // PCIE_GEN3_QHP_L1_CTLE_TRAIN_TIME
	Store (0x00, L1OT) // PCIE_GEN3_QHP_L1_CTLE_DFE_OVRLP_TIME
	Store (0x05, L1RT) // PCIE_GEN3_QHP_L1_DFE_REFRESH_TIME
	Store (0x01, L1ET) // PCIE_GEN3_QHP_L1_DFE_ENABLE_TIME
	Store (0x26, L1VG) // PCIE_GEN3_QHP_L1_VGA_GAIN
	Store (0x12, L1DG) // PCIE_GEN3_QHP_L1_DFE_GAIN
	Store (0x04, L1EG) // PCIE_GEN3_QHP_L1_EQ_GAIN
	Store (0x04, L1OG) // PCIE_GEN3_QHP_L1_OFFSET_GAIN
	Store (0x09, L1PG) // PCIE_GEN3_QHP_L1_PRE_GAIN
	Store (0x15, L1EI) // PCIE_GEN3_QHP_L1_EQ_INITVAL
	Store (0x28, L1DI) // PCIE_GEN3_QHP_L1_EDAC_INITVAL
	Store (0x7F, L1B0) // PCIE_GEN3_QHP_L1_RXEQ_INITB0
	Store (0x07, L1B1) // PCIE_GEN3_QHP_L1_RXEQ_INITB1
	Store (0x04, L1T1) // PCIE_GEN3_QHP_L1_RCVRDONE_THRESH1
	Store (0x70, L1RC) // PCIE_GEN3_QHP_L1_RXEQ_CTRL
	Store (0x8B, L1F0) // PCIE_GEN3_QHP_L1_UCDR_FO_GAIN_MODE0
	Store (0x08, L1F1) // PCIE_GEN3_QHP_L1_UCDR_FO_GAIN_MODE1
	Store (0x0A, L1F2) // PCIE_GEN3_QHP_L1_UCDR_FO_GAIN_MODE2
	Store (0x03, L1S0) // PCIE_GEN3_QHP_L1_UCDR_SO_GAIN_MODE0
	Store (0x04, L1S1) // PCIE_GEN3_QHP_L1_UCDR_SO_GAIN_MODE1
	Store (0x04, L1S2) // PCIE_GEN3_QHP_L1_UCDR_SO_GAIN_MODE2
	Store (0x0C, L1SC) // PCIE_GEN3_QHP_L1_UCDR_SO_CONFIG
	Store (0x02, L1RB) // PCIE_GEN3_QHP_L1_RX_BAND
	Store (0x5C, L1P0) // PCIE_GEN3_QHP_L1_RX_RCVR_PATH1_MODE0
	Store (0x3E, L1P1) // PCIE_GEN3_QHP_L1_RX_RCVR_PATH1_MODE1
	Store (0x3F, L1P2) // PCIE_GEN3_QHP_L1_RX_RCVR_PATH1_MODE2
	Store (0x01, L1SE) // PCIE_GEN3_QHP_L1_SIGDET_ENABLES
	Store (0xA0, L1SN) // PCIE_GEN3_QHP_L1_SIGDET_CNTRL
	Store (0x08, L1SD) // PCIE_GEN3_QHP_L1_SIGDET_DEGLITCH_CNTRL
	Store (0x01, L1DC) // PCIE_GEN3_QHP_L1_DCC_GAIN
	Store (0xC3, L1RE) // PCIE_GEN3_QHP_L1_RX_EN_SIGNAL
	Store (0x00, L1PC) // PCIE_GEN3_QHP_L1_PSM_RX_EN_CAL
	Store (0xBC, L1N0) // PCIE_GEN3_QHP_L1_RX_MISC_CNTRL0
	Store (0x7F, L1ER) // PCIE_GEN3_QHP_L1_TS0_TIMER
	Store (0x15, L1HI) // PCIE_GEN3_QHP_L1_DLL_HIGHDATARATE
	Store (0x0C, L1C1) // PCIE_GEN3_QHP_L1_DRVR_CTRL1
	Store (0x00, L1C2) // PCIE_GEN3_QHP_L1_DRVR_CTRL2
	Store (0x04, L1RR) // PCIE_GEN3_QHP_L1_RX_RESECODE_OFFSET
	Store (0x20, L1IN) // PCIE_GEN3_QHP_L1_VGA_INITVAL
	Store (0x3F, HPSG) // PCIE_GEN3_HP_PCIE_PHY_POWER_STATE_CONFIG
	Store (0x58, HTRC) // PCIE_GEN3_HP_PCIE_PHY_PCS_TX_RX_CONFIG
	Store (0x19, HTM3) // PCIE_GEN3_HP_PCIE_PHY_TXMGN_MAIN_V0_M3P5DB
	Store (0x07, HTP3) // PCIE_GEN3_HP_PCIE_PHY_TXMGN_POST_V0_M3P5DB
	Store (0x17, HTM6) // PCIE_GEN3_HP_PCIE_PHY_TXMGN_MAIN_V0_M6DB
	Store (0x09, HTP6) // PCIE_GEN3_HP_PCIE_PHY_TXMGN_POST_V0_M6DB
	Store (0x9F, HPG5) // PCIE_GEN3_HP_PCIE_PHY_POWER_STATE_CONFIG5
  
	// Version 2 and Higher Changes
	If (LGreaterEqual (\_SB.SIDV,0x00020000))
	{
		Store (0x0F, L0C2) // PCIE_GEN3_QHP_L0_DRVR_CTRL2
		Store (0x0F, L1C2) // PCIE_GEN3_QHP_L1_DRVR_CTRL2
		Store (0x50, HTRC) // PCIE_GEN3_HP_PCIE_PHY_PCS_TX_RX_CONFIG
	}

	Store (0x00, HPSR) // PCIE_GEN3_HP_PCIE_PHY_SW_RESET
	Store (0x01, L0ST) // PCIE_GEN3_QHP_L0_RSM_START
	Store (0x01, L1ST) // PCIE_GEN3_QHP_L1_RSM_START
	Store (0x01, HSTC) // PCIE_GEN3_HP_PCIE_PHY_START_CONTROL

	Store (HPST, Local0) // PCIE_PCS_PCS_STATUS
	// loop until HWIO_PCIE_GEN3_HP_PCIE_PHY_PCS_STATUS_PHYSTATUS_BMSK is '0'
	While(And (Local0 , 0x40))
	{
		Sleep(1)
		Increment(TOUT)
		If (LEqual(TOUT, 0xF))
		{
			Break
		}
		Store (HPST, Local0)
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
Method(LTS1, 0x0, Serialized) {
	Name(TOUT, Zero)

	Store (G32C, Local0)
	AND (Local0, 0xFFFFE0FF, Local0)
	OR (Local0, 0x0100, Local0)
	Store (Local0, G32C)  // PCIE_GEN3_TYPE0_GEN2_CTRL_REG
	
	Store (0x155A0, GMDC) // PCIE_GEN3_GEN3_EQ_FB_MODE_DIR_CHANGE_REG
	
	Store (GEQC, Local0)
	AND (Local0, 0xFFFFFFEF, Local0)
	Store (Local0, GEQC) // PCIE_GEN3_TYPE0_GEN3_EQ_CONTROL_REG
	
	Store (0x01, CSW1) // PCIE_GEN3_MISC_CONTROL_1_REG
	Store (0x77777777, P1PR) // PCIE PRESET
	Store (0x00, CSW1) // PCIE_GEN3_MISC_CONTROL_1_REG
	
	Store (GPLC, Local0)
	AND (Local0, 0xFFC0F0FF, Local0)
	OR  (Local0, 0x00030300, Local0)
	Store (Local0, GPLC)  // PCIE_GEN3_TYPE0_PORT_LINK_CTRL_REG
	
	Store (0x100, PLT1) // PARF_LTSSM = 0x100					
	Store (EST1, Local0)// ELBI_SYS_STTS
	While(LNotEqual(And(Local0 , 0x400), 0x400))// check for HWIO_PCIE20_ELBI_SYS_STTS_XMLH_LINK_UP_BMSK
	{
		Sleep(1)
		Increment(TOUT)
		If (LEqual(TOUT, 0x96))
		{
			Break
		}
		Store (EST1, Local0)
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
Method(IAT1, 0x0, Serialized) {
	Store (0x01, IAV1)// IATU_VIEWPORT_REG
	Store (0x40100000, ILB1)//  PL_IATU_LWR_BASE_ADDR_REG_OUTBOUND_0
	Store (0x00, IUB1)// PL_IATU_UPPER_BASE_ADDR_REG_OUTBOUND_0
	Store (0x401FFFFF, ILR1)// PL_IATU_LIMIT_ADDR_REG_OUTBOUND_0
	Store (0x01000000, ILT1)// PL_IATU_LWR_TARGET_ADDR_REG_OUTBOUND_0
	Store (0x00, IUT1)// PL_IATU_UPPER_TARGET_ADDR_REG_OUTBOUND_0
	Store (0x04, CR11)// PL_IATU_REGION_CTRL_REG_1_OUTBOUND_0
	Store (0x80000000, CR21)// PL_IATU_REGION_CTRL_REG_2_OUTBOUND_0
	Store (0x010100, BNR1)// SEC_LAT_TIMER_SUB_BUS_SEC_BUS_PRI_BUS_REG
}

// Rootport Ecam-Blocker Method
// Arg0 - Block Base Address
// Arg1 - Block Limit Address
Method(REB1, 0x2, Serialized) {
	Store (PSC1, Local0)
	// Disable ECAM Blocker Region-0 at 26th bit
	AND (Local0, 0xFBFFFFFF, Local0)
	Store (Local0, PSC1)
	
	// Configure Region Base and Limit
	Store (Arg0, LBW0)
	Store (0x00, HBW0)
	Store (Arg1, LLW0)
	Store (0x00, HLW0)
	Store (Arg0, LBR0)
	Store (0x00, HBR0)
	Store (Arg1, LLR0)
	Store (0x00, HLR0)
	
	Store (PSC1, Local0)
	// Enable ECAM Blocker Region-0 at 26th bit
	OR (Local0, 0x04000000, Local0)
	Store (Local0, PSC1)
}

// Endpoint Ecam-Blocker Method
// Arg0 - Block Base Address
// Arg1 - Block Limit Address
Method(EEB1, 0x2, Serialized) {
	Store (PSC1, Local0)
	// Disable ECAM Blocker Region-2 at 30th bit
	AND (Local0, 0xBFFFFFFF, Local0)
	Store (Local0, PSC1)
	
	// Configure Region Base and Limit
	Store (Arg0, LBW1)
	Store (0x00, HBW1)
	Store (Arg1, LLW1)
	Store (0x00, HLW1)
	Store (Arg0, LBR1)
	Store (0x00, HBR1)
	Store (Arg1, LLR1)
	Store (0x00, HLR1)
	
	Store (PSC1, Local0)
	// Enable ECAM Blocker Region-2 at 30th bit
	OR (Local0, 0x40000000, Local0)
	Store (Local0, PSC1)
}

// Configure the limit for PCIe0 RP ECAM blocker
Name(E1LT, 0x400FFFFF)

// Setup Misc Configuration
Method(MSC1, 0x0, Serialized) {
	// Memory Enable Compliance
	Store (SCR1, Local0)
	OR (Local0, 0x2, Local0)
	Store (Local0, SCR1) 

	// Writing Slave address space size as 512MB
	Store (0x20000000, PSL1)// PARF_SLV_ADDR_SPACE_SIZE
	
	// Clear REQ_NOT_ENTER_L1 Field
	Store(PPC1, Local0)
	AND (Local0, 0xFFFFFFDF, Local0)
	Store (Local0, PPC1)
	
	// Enable DBI_RO_WR_EN to access CS1 region
	Store (0x01, CSW1)

	// Writing Link capability for enabling L1 and disabling L0s 
	Store(LCA1, Local0)
	// Enable Optionality Compliance
	OR(Local0, 0x00400000, Local0)
	// Enable L0s & L1
	OR(Local0, 0x00000C00, Local0)
	Store(Local0 , LCA1)

	// Writing Bridge Class code
	Store (CRI1, Local0)
	AND (Local0, 0xFFFF, Local0)
	OR (Local0, 0x06040000, Local0)
	Store (Local0, CRI1)

	// Disable Hot Plug Enable in Slot capabilities register	
	Store (SCA1, Local0)
	AND (Local0, 0xFFFFFFBF, Local0)
	Store (Local0, SCA1)
	
	// Disable DBI_RO_WR_EN to access CS1 region
	Store (0x00, CSW1)
	
	// Assert CS2
	Store (0x1, ECS1)
	// Disable BAR0 and BAR1
	Store (0x0, R1B0)
	Store (0x0, R1B1)
	// De-Assert CS2
	Store (0x0, ECS1)
	
	// Store ECAM Base
	Store (0x40000000, PEB1)
	// Rootport Ecam-Blocker Method
	REB1 (0x40001000, \_SB.E1LT)
	// Endpoint Ecam-Blocker Method
	EEB1 (0x40101000, 0x401FFFFF)
}

Name(G1D3, Zero)
PowerResource(P1ON, 0x5, 0) {
	Name (_DEP, Package(0x1) {
		\_SB.GIO0
	})
	Method(_STA){Return(0)}  
	Method(_ON) {
		//BreakPoint						
		If(G1D3)
		{
			Store (0x00, G1D3)
			
			// Assert and De-Assert the PCIE_1_BCR	
			Store(0x1, GP1B)
			Sleep(1)
			Store(0x0, GP1B)
			
			// Assert and De-Assert the PCIE_1_PHY_BCR	
			Store(0x1, G1PB)
			Sleep(1)
			Store(0x0, G1PB)
			
			// Setup PHY
			if ( \_SB.PPU1() )
			{
				// Method not returned 0x00, So handle the error
				Store("PHY Init Failed for Port 1", Debug)
				// Store(0x0, MV11)
				// This infinite loop would cause a bug check in Windows
				While (One)
				{
				}
			}

			If(LEqual(\_SB.GIO0.GABL, 0x1))
			{
				Store (0x00, \_SB.PCI1.MOD2)
			}

			Sleep(10)
			
			If(LEqual(\_SB.GIO0.GABL, 0x1))
			{
				Store (0x1, \_SB.PCI1.MOD2)
			}
								
			// Setup the Link
			If( \_SB.LTS1() )
			{
				// Link training Failed!, block any potential access to Endpoint
				// by extending the ECAM blocker region to hide the Endpoint
				// config space
				Store(0x401FFFFF, \_SB.E1LT)
			}
			Else
			{
				Store(0x400FFFFF, \_SB.E1LT)
			}
								
			// Setup iATU					
			\_SB.IAT1()
			
			// Misc Configuration
			\_SB.MSC1()
		}
	}
	Method(_OFF) { 
		If(LEqual(G1D3, 0x0))
		{
			BreakPoint
			Name(PTO0, Zero)
			Store(1,G1D3)
			Store(PSC1 , Local0)
			OR(Local0, 0x10, Local0)
			Store(Local0, PSC1)
			Store(ESC1, Local0)
			OR(Local0, 0x10, Local0)
			Store(Local0 , ESC1)
			
			Store (PPS1, Local0)
			While(LNotEqual(And(Local0 , 0x20, Local0), 0x20)) 
			{
				Sleep(10)						
				Add(PTO0, 0x1, PTO0)
				If(LEqual(PTO0, 0xA))
				{
					Break
				}
				Store (PPS1, Local0)
			}
			
			If(LEqual(\_SB.GIO0.GABL, 0x1))
			{
				Store (0x0, \_SB.PCI1.MOD2)
			}
			
			// Power Down Sequence for Port PHY
			Store (0x00, HPSR) // PCIE_GEN3_HP_PCIE_PHY_SW_RESET
			Store (0x00, L0ST) // PCIE_GEN3_QHP_L0_RSM_START
			Store (0x00, L1ST) // PCIE_GEN3_QHP_L1_RSM_START
			Store (0x00, HSTC) // PCIE_GEN3_HP_PCIE_PHY_START_CONTROL
		}
	}
}

PowerResource(P1OF, 0x5, 0) {
	Name (_DEP, Package(0x1) {		 
		\_SB.GIO0
	})
	Method(_STA){Return(0)}  
	Method(_ON) {

	}
	Method(_OFF) {
		 
	}
	Method(_RST, 0x0, Serialized) {
		// Assert and De-Assert the PCIE_1_BCR	
		Store(0x1, GP1B)
		Sleep(1)
		Store(0x0, GP1B)
		
		// Assert and De-Assert the PCIE_1_PHY_BCR
		Store(0x1, G1PB)
		Sleep(1)
		Store(0x0, G1PB)

		// Setup PHY
		if ( \_SB.PPU1() )
		{
			// Method not returned 0x00, So handle the error
			Store("PHY Init Failed for Port 1", Debug)
			// Store(0x0, MV13)
			// This infinite loop would cause a bug check in Windows
			While (One)
			{
			}
		}

		If(LEqual(\_SB.GIO0.GABL, 0x1))
		{
			Store (0x00, \_SB.PCI1.MOD2)
		}

		Sleep(10)
		
		If(LEqual(\_SB.GIO0.GABL, 0x1))
		{
			Store (0x1, \_SB.PCI1.MOD2)
		}

		// Setup the Link
		If( \_SB.LTS1() )
		{
			// Link training Failed!, block any potential access to Endpoint
			// by extending the ECAM blocker region to hide the Endpoint
			// config space
			Store(0x401FFFFF, \_SB.E1LT)
		}
		Else
		{
			Store(0x400FFFFF, \_SB.E1LT)
		}
							
		// Setup iATU					
		\_SB.IAT1()
		
		// Misc Configuration
		\_SB.MSC1()	
	}
}

Device (PCI1) {
	Name (_DEP, Package(0x1) {
		 \_SB.PEP0
	})
	Name(_HID,EISAID("PNP0A08"))
	Alias(\_SB.PSUB, _SUB)
	Name(_CID,EISAID("PNP0A03"))
	Name(_UID, 0x1)
	Name(_SEG, 0x1)
	Name(_BBN, 0x0)
	Name(_PRT, Package(){
		Package(){0x0FFFF, 0, 0, 466},  // Slot 1, INTA
		Package(){0x0FFFF, 1, 0, 467},  // Slot 1, INTB
		Package(){0x0FFFF, 2, 0, 470},  // Slot 1, INTC
		Package(){0x0FFFF, 3, 0, 471}   // Slot 1, INTD
	})

	// On SDM850 CCA is supported default on GEN3 PCIe port
	Method (_CCA, 0)
	{
		Return (One)
	}

	Method(_STA, 0)
	{
		Return (0x0F) // EndPoints available
	}

	Method(_PSC) {
		Return(Zero)
	}	
	
	Method (_CRS, 0x0, NotSerialized) {
		Name (RBUF, ResourceTemplate ()
		{
			// [GEN3_DBI_BASE + 2MB(ECAM_SIZE)] to [GEN3_DBI_SIZE - 3MB(ECAM_SIZE) - 64KB IO Space]
			Memory32Fixed (ReadWrite, 0x40200000, 0x01FDF000)
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
							2
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

	Name (RST1, ResourceTemplate () 
	{
		GpioIo (Exclusive,PullNone,0,0, ,"\\_SB.GIO0", ,) {102}
	})
	
	Scope(\_SB.GIO0) {
		OperationRegion(P1PR, GeneralPurposeIO, 0, 1)
	}
	Field(\_SB.GIO0.P1PR, ByteAcc, NoLock, Preserve) 
	{
		Connection (\_SB.PCI1.RST1), // Following fields will be accessed atomically 
		MOD2, 1 // PERST
	}
	
	Name(_PR0, Package(){
		\_SB.P1ON
	})
	Name(_PR3, Package(){
		\_SB.P1ON
	})
	
	// PCIe Root Port 1
	Device(RP1) {
		Name(_ADR, 0x0)
		
		Name(_PR0, Package(){
			\_SB.P1OF			
		})
		Name(_PR3, Package(){
			\_SB.P1OF	
		})
		Name(_PRR, Package(){
			\_SB.P1OF
		})	

		Name (_DSD, Package () {
			ToUUID("6211E2C0-58A3-4AF3-90E1-927A4E0C55A4"),
			Package () {
				Package (2) {"HotPlugSupportInD3", 1},
			}
		})

		Name(_S0W, 4)
			
		Method (_CRS, 0x0, NotSerialized) {
			Name (RBUF, ResourceTemplate ()
			{
				//WAKE
				GpioInt(Edge, ActiveLow,  ExclusiveAndWake, PullUp, 0, "\\_SB.GIO0", 0 , ResourceConsumer, , ) {104}
				//PRSNT
				GpioInt(Edge, ActiveBoth, ExclusiveAndWake, PullUp, 0, "\\_SB.GIO0", 0 , ResourceConsumer, , ) {113}
			})
			Return (RBUF)
		}
		
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
} // End PCI1
