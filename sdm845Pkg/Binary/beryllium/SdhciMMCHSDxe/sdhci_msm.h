/* Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above
 *       copyright notice, this list of conditions and the following
 *       disclaimer in the documentation and/or other materials provided
 *       with the distribution.
 *     * Neither the name of The Linux Foundation nor the names of its
 *       contributors may be used to endorse or promote products derived
 *       from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
 * BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
 * IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#ifndef __SDHCI_MSM_H__
#define __SDHCI_MSM_H__

#include <Chipset/mmc_sdhci.h>

#define SDHCI_HC_START_BIT 0x0
#define SDHCI_HC_WIDTH 0x1

#define SDCC_MCI_POWER 0x0
#define CORE_SW_RST_START 0x7
#define CORE_SW_RST_WIDTH 0x1

/* DLL & CDC registers
 * DLL: Delay Line
 * CDC: Calibrated Delay Circuit
 */
#define SDCC_DLL_CONFIG_REG 0x100
#define SDCC_VENDOR_SPECIFIC_FUNC 0x10C
#define SDCC_REG_DLL_STATUS 0x108
#define SDCC_CDC_DDR200_CFG 0x184
#define SDCC_VENDOR_SPEC_CSR_CDC_CFG 0x178
#define SDCC_CSR_CDC_CTRL_CFG0 0x130
#define SDCC_CSR_CDC_CTRL_CFG1 0x134
#define SDCC_CSR_CDC_CAL_TIMER_CFG0 0x138
#define SDCC_CSR_CDC_CAL_TIMER_CFG1 0x13C
#define SDCC_CSR_CDC_REFCOUNT_CFG 0x140
#define SDCC_CSR_CDC_COARSE_CAL_CFG 0x144
#define SDCC_CSR_CDC_DELAY_CFG 0x150
#define SDCC_CDC_OFFSET_CFG 0x14C
#define SDCC_CDC_SLAVE_DDA_CFG 0x160
#define SDCC_CSR_CDC_STATUS0 0x164

/* Macros for CM_DLL_SDC4 related macros */
#define SDCC_HC_VENDOR_SPECIFIC_FUNC3 0x1B0
#define SDCC_HC_REG_DLL_CONFIG_2 0x1B4
#define SDCC_HC_REG_DDR_CONFIG 0x1B8

#define DDR_CAL_EN BIT(0)
#define DDR_CAL_TIMEOUT_MAX 50
#define DDR_DLL_LOCK_JDR BIT(11)
#define PWRSAVE_DLL BIT(3)
#define DDR_CONFIG_VAL 0x80040853

/* DLL & CDC helper macros */
#define SDCC_DLL_PWR_SAVE_EN BIT(1)
#define SDCC_DLL_LOCK_STAT BIT(7)
#define SDCC_DLL_EN BIT(16)
#define SDCC_DLL_CDR_EN BIT(17)
#define SDCC_DLL_CLK_OUT_EN BIT(18)
#define SDCC_FLL_CYCLE_CNT BIT(18)
#define SDCC_DLL_CDR_EXT_EN BIT(19)
#define SDCC_DLL_CLOCK_DISABLE BIT(21)
#define SDCC_DLL_PDN_EN BIT(29)
#define SDCC_DLL_RESET_EN BIT(30)
#define SDCC_DLL_CONFIG_MCLK_START 0x18
#define SDCC_DLL_CONFIG_MCLK_WIDTH 0x3
#define SDCC_DLL_GRAY_CODE_START 0x14
#define SDCC_DLL_GRAY_CODE_WIDTH 0x4
#define CMD_DAT_TRACK_SEL BIT(0)
#define CDC_T4_DLY_SEL BIT(0)
#define CDC_SWITCH_BYPASS_OFF BIT(0)
#define CDC_SWITCH_RC_EN BIT(1)
#define START_CDC_TRAFFIC BIT(6)
#define FF_CLK_SW_RST_DIS_START 0xD
#define FF_CLK_SW_RST_DIS_WIDTH 0x1
#define CDC_SW_TRIGGER_FULL_CALIB BIT(16)
#define CDC_HW_AUTO_CAL_EN BIT(17)
#define CDC_TIMER_EN BIT(16)
#define CSR_CDC_ERROR_MASK 0x7000000

/* SDCC macros for HS400 */
#define SDCC_HC_MCLK_SEL_HS400 0x3
#define SDCC_HC_MCLK_HS400_START 0x8
#define SDCC_HC_MCLK_HS400_WIDTH 0x2
#define SDCC_HC_MCLK_SEL_IN_HS400 0x6
#define SDCC_HC_MCLK_SEL_IN_DFLT 0x2
#define SDCC_HC_MCLK_SEL_IN_UHS 0x4
#define SDCC_HC_MCLK_SEL_IN_START 0x13
#define SDCC_HC_MCLK_SEL_IN_WIDTH 0x3
#define SDCC_HC_MCLK_SEL_IN_EN 0x1
#define SDCC_HC_MCLK_SEL_IN_EN_START 0x12
#define SDCC_HC_MCLK_SEL_IN_EN_WIDTH 0x1

#define MAX_PHASES 16

/* SDCC version macros */
#define MCI_VERSION 0x50
#define CORE_VERSION_MAJOR_MASK 0xF0000000
#define CORE_VERSION_MAJOR_SHIFT 0x1C
#define CORE_VERSION_MINOR_MASK 0x000000FF

#define SDHCI_DLL_TIMEOUT 50
#define CDC_STATUS_TIMEOUT 50

#define HC_IO_PAD_PWR_SWITCH_EN BIT(15)
#define HC_IO_PAD_PWR_SWITCH BIT(16)

#define SDCC_HC_VENDOR_SPECIFIC_CAPABILITIES0 0x11C

#define TCXO_FREQ 19200000

struct sdhci_msm_data {
  uint32_t  pwrctl_base;
  uint32_t  pwr_irq;
  uint8_t   tuning_done;
  uint8_t   calibration_done;
  uint8_t   saved_phase;
  uint8_t   slot;
  uint8_t   use_io_switch;
  EFI_EVENT sdhc_event;
};

void     sdhci_msm_init(struct sdhci_host *host, struct sdhci_msm_data *data);
uint32_t sdhci_msm_execute_tuning(
    struct sdhci_host *host, struct mmc_card *card, uint32_t bus_width);
void sdhci_mode_disable(struct sdhci_host *host);
/* API: Toggle the bit for clock-data recovery */
void sdhci_msm_toggle_cdr(struct sdhci_host *host, bool enable);
void sdhci_msm_set_mci_clk(struct sdhci_host *host);
#endif
