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

#include <Library/LKEnvLib.h>

#include <Library/InterruptsLib.h>
#include <Library/MallocLib.h>
#include <Library/UefiBootServicesTableLib.h>

#include <Chipset/mmc_sdhci.h>
// Must come in order
#include <Chipset/sdhci.h>

#include "sdhci_msm.h"
// Must come in order
#include "MMCHS.h"

/* SDHCI */
#define SDCC_MCI_HC_MODE ((UINTN)PcdGet64(PcdSdccMciHcMode))
#define SDCC_HC_PWRCTL_STATUS_REG ((UINTN)PcdGet64(PcdSdccHcPwrctlStatusReg))
#define SDCC_HC_PWRCTL_MASK_REG ((UINTN)PcdGet64(PcdSdccHcPwrctlMaskReg))
#define SDCC_HC_PWRCTL_CLEAR_REG ((UINTN)PcdGet64(PcdSdccHcPwrctlClearReg))
#define SDCC_HC_PWRCTL_CTL_REG ((UINTN)PcdGet64(PcdSdccHcPwrctlCtlReg))

#define MX_DRV_SUPPORTED_HS200 3
static bool attempt_cdr_unlock;

/* Known data stored in the card & read during tuning
 * process. 64 bytes for 4bit bus width & 128 bytes
 * of data for 8 bit bus width.
 * These values are derived from HPG
 */
static const uint32_t tuning_block_64[] = {
    0x00FF0FFF, 0xCCC3CCFF, 0xFFCC3CC3, 0xEFFEFFFE, 0xDDFFDFFF, 0xFBFFFBFF,
    0xFF7FFFBF, 0xEFBDF777, 0xF0FFF0FF, 0x3CCCFC0F, 0xCFCC33CC, 0xEEFFEFFF,
    0xFDFFFDFF, 0xFFBFFFDF, 0xFFF7FFBB, 0xDE7B7FF7};

static const uint32_t tuning_block_128[] = {
    0xFF00FFFF, 0x0000FFFF, 0xCCCCFFFF, 0xCCCC33CC, 0xCC3333CC, 0xFFFFCCCC,
    0xFFFFEEFF, 0xFFEEEEFF, 0xFFDDFFFF, 0xDDDDFFFF, 0xBBFFFFFF, 0xBBFFFFFF,
    0xFFFFFFBB, 0xFFFFFF77, 0x77FF7777, 0xFFEEDDBB, 0x00FFFFFF, 0x00FFFFFF,
    0xCCFFFF00, 0xCC33CCCC, 0x3333CCCC, 0xFFCCCCCC, 0xFFEEFFFF, 0xEEEEFFFF,
    0xDDFFFFFF, 0xDDFFFFFF, 0xFFFFFFDD, 0xFFFFFFBB, 0xFFFFBBBB, 0xFFFF77FF,
    0xFF7777FF, 0xEEDDBB77};

/*
 * Function: sdhci int handler
 * Arg     : MSM specific data for sdhci
 * Return  : 0
 * Flow:   : 1. Read the power control mask register
 *           2. Check if bus is ON
 *           3. Write success to ack regiser
 * Details : This is power control interrupt handler.
 *           Once we receive the interrupt, we will ack the power control
 *           register that we have successfully completed pmic transactions
 */
static enum handler_return sdhci_int_handler(struct sdhci_msm_data *data)
{
  uint32_t ack;
  uint32_t status;

  /*
   * Read the mask register to check if BUS & IO level
   * interrupts are enabled
   */
  status = readl(data->pwrctl_base + SDCC_HC_PWRCTL_MASK_REG);

  if (status & (SDCC_HC_BUS_ON | SDCC_HC_BUS_OFF))
    ack = SDCC_HC_BUS_ON_OFF_SUCC;
  if (status & (SDCC_HC_IO_SIG_LOW | SDCC_HC_IO_SIG_HIGH))
    ack |= SDCC_HC_IO_SIG_SUCC;

  /* Write success to power control register */
  writel(ack, (data->pwrctl_base + SDCC_HC_PWRCTL_CTL_REG));

  if (data->sdhc_event != NULL) {
    gBS->SignalEvent(data->sdhc_event);
  }

  return 0;
}

/*
 * Function: sdhci clear pending interrupts
 * Arg     : MSM specific data for sdhci
 * Return  : None
 * Flow:   : Clear pending interrupts
 */
static void sdhci_clear_power_ctrl_irq(struct sdhci_msm_data *data)
{
  uint32_t irq_ctl;
  uint32_t irq_stat;

  /*
   * Read the power control status register to know
   * the status of BUS & IO_HIGH_V
   */
  irq_stat = readl(data->pwrctl_base + SDCC_HC_PWRCTL_STATUS_REG);

  /* Clear the power control status */
  writel(irq_stat, (data->pwrctl_base + SDCC_HC_PWRCTL_CLEAR_REG));

  /*
   * Handle the pending irq by ack'ing the bus & IO switch
   */
  irq_ctl = readl(data->pwrctl_base + SDCC_HC_PWRCTL_CTL_REG);

  if (irq_stat & (SDCC_HC_BUS_ON | SDCC_HC_BUS_OFF))
    irq_ctl |= SDCC_HC_BUS_ON_OFF_SUCC;
  if (irq_stat & (SDCC_HC_IO_SIG_LOW | SDCC_HC_IO_SIG_HIGH))
    irq_ctl |= SDCC_HC_IO_SIG_SUCC;

  writel(irq_ctl, (data->pwrctl_base + SDCC_HC_PWRCTL_CTL_REG));
}

/*
 * Function: sdhci msm init
 * Arg     : MSM specific config data for sdhci
 * Return  : None
 * Flow:   : Enable sdhci mode & do msm specific init
 */
void sdhci_msm_init(struct sdhci_host *host, struct sdhci_msm_data *config)
{
  uint32_t io_switch;
  uint32_t caps = 0;
  uint32_t version;

  REG_WRITE32(host, 0xA1C, SDCC_VENDOR_SPECIFIC_FUNC);

  /* Enable sdhc mode */
  RMWREG32(
      (config->pwrctl_base + SDCC_MCI_HC_MODE), SDHCI_HC_START_BIT,
      SDHCI_HC_WIDTH, SDHCI_HC_MODE_EN);

  /* Set the FF_CLK_SW_RST_DIS to 1 */
  RMWREG32(
      (config->pwrctl_base + SDCC_MCI_HC_MODE), FF_CLK_SW_RST_DIS_START,
      FF_CLK_SW_RST_DIS_WIDTH, 1);

  /*
   * Reset the controller
   */
  sdhci_reset(host, SDHCI_SOFT_RESET);

  /*
   * Some platforms have same SDC instance shared between emmc & sd card.
   * For such platforms the emmc IO voltage has to be switched from 3.3 to
   * 1.8 for the contoller to work with emmc.
   */

  if (config->use_io_switch) {
    io_switch = REG_READ32(host, SDCC_VENDOR_SPECIFIC_FUNC);
    io_switch |= HC_IO_PAD_PWR_SWITCH | HC_IO_PAD_PWR_SWITCH_EN;
    REG_WRITE32(host, io_switch, SDCC_VENDOR_SPECIFIC_FUNC);
  }

  /*
   * CORE_SW_RST may trigger power irq if previous status of PWRCTL
   * was either BUS_ON or IO_HIGH. So before we enable the power irq
   * interrupt in GIC (by registering the interrupt handler), we need to
   * ensure that any pending power irq interrupt status is acknowledged
   * otherwise power irq interrupt handler would be fired prematurely.
   */
  sdhci_clear_power_ctrl_irq(config);

  /*
   * Register the interrupt handler for pwr irq
   */
  register_int_handler(
      config->pwr_irq, (int_handler)sdhci_int_handler, (void *)config);

  unmask_interrupt(config->pwr_irq);

  /* Enable pwr control interrupt */
  writel(SDCC_HC_PWR_CTRL_INT, (config->pwrctl_base + SDCC_HC_PWRCTL_MASK_REG));

  version = readl(host->msm_host->pwrctl_base + MCI_VERSION);

  host->major = (version & CORE_VERSION_MAJOR_MASK) >> CORE_VERSION_MAJOR_SHIFT;
  host->minor = (version & CORE_VERSION_MINOR_MASK);

  /*
   * For SDCC5 the capabilities registers does not have voltage advertised
   * Override the values using SDCC_HC_VENDOR_SPECIFIC_CAPABILITIES0
   */
  if (host->major >= 1 && host->minor != 0x11 && host->minor != 0x12) {
    caps = REG_READ32(host, SDHCI_CAPS_REG1);

    if (config->slot == 0x1)
      REG_WRITE32(
          host, (caps | SDHCI_1_8_VOL_MASK),
          SDCC_HC_VENDOR_SPECIFIC_CAPABILITIES0);
    else
      REG_WRITE32(
          host, (caps | SDHCI_3_0_VOL_MASK),
          SDCC_HC_VENDOR_SPECIFIC_CAPABILITIES0);
  }

  config->tuning_done      = false;
  config->calibration_done = false;
  host->tuning_in_progress = false;
}

/*
 * Function: sdhci msm set mci clk
 * Arg     : Host structure
 * Return  : None
 * Flow:   : Set HC_SELECT & HC_SELECT_EN for hs400
 */
void sdhci_msm_set_mci_clk(struct sdhci_host *host)
{
  struct sdhci_msm_data *msm_host;

  msm_host = host->msm_host;

  if (host->timing == MMC_HS400_TIMING) {
    /*
     * If the current tuning mode is HS400 then we should set the MCLK to run
     * the clock @ MCLK/2. Also set HS400 mode in SELECT_IN of vendor specific
     * register
     */
    REG_RMW32(
        host, SDCC_VENDOR_SPECIFIC_FUNC, SDCC_HC_MCLK_HS400_START,
        SDCC_HC_MCLK_HS400_WIDTH, SDCC_HC_MCLK_SEL_HS400);

    /* Enable HS400 mode from HC_SELECT_IN bit of VENDOR_SPEC register
     * As the SDCC spec does not have matching mode for HS400
     */
    if (msm_host->tuning_done && !msm_host->calibration_done) {
      REG_RMW32(
          host, SDCC_VENDOR_SPECIFIC_FUNC, SDCC_HC_MCLK_SEL_IN_START,
          SDCC_HC_MCLK_SEL_IN_WIDTH, SDCC_HC_MCLK_SEL_IN_HS400);
      REG_RMW32(
          host, SDCC_VENDOR_SPECIFIC_FUNC, SDCC_HC_MCLK_SEL_IN_EN_START,
          SDCC_HC_MCLK_SEL_IN_EN_WIDTH, SDCC_HC_MCLK_SEL_IN_EN);
    }
  }
  else {
    /*
     * Set 0x0 mode in SELECT_IN of vendor specific register so that the
     * host control2 register settings from sdhc spec are used for
     * speed mode
     */
    REG_RMW32(
        host, SDCC_VENDOR_SPECIFIC_FUNC, SDCC_HC_MCLK_SEL_IN_START,
        SDCC_HC_MCLK_SEL_IN_WIDTH, 0x0);
    REG_RMW32(
        host, SDCC_VENDOR_SPECIFIC_FUNC, SDCC_HC_MCLK_SEL_IN_EN_START,
        SDCC_HC_MCLK_SEL_IN_EN_WIDTH, 0x0);
  }
}

/*
 * Set the value based on sdcc clock frequency
 */
static void msm_set_dll_freq(struct sdhci_host *host)
{
  uint32_t reg_val = 0;

  /* Set clock freq value based on clock range */
  if (host->cur_clk_rate <= 112000000)
    reg_val = 0x0;
  else if (host->cur_clk_rate <= 125000000)
    reg_val = 0x1;
  else if (host->cur_clk_rate <= 137000000)
    reg_val = 0x2;
  else if (host->cur_clk_rate <= 150000000)
    reg_val = 0x3;
  else if (host->cur_clk_rate <= 162000000)
    reg_val = 0x4;
  else if (host->cur_clk_rate <= 175000000)
    reg_val = 0x5;
  else if (host->cur_clk_rate <= 187000000)
    reg_val = 0x6;
  else if (host->cur_clk_rate <= 200000000)
    reg_val = 0x7;

  DBG("\n %s: DLL freq: 0x%08x\n", __func__, reg_val);

  REG_RMW32(
      host, SDCC_DLL_CONFIG_REG, SDCC_DLL_CONFIG_MCLK_START,
      SDCC_DLL_CONFIG_MCLK_WIDTH, reg_val);
}

static void sdhci_dll_clk_enable(struct sdhci_host *host, int enable)
{
  if (enable) {
    REG_WRITE32(
        host,
        (REG_READ32(host, SDCC_HC_REG_DLL_CONFIG_2) & ~SDCC_DLL_CLOCK_DISABLE),
        SDCC_HC_REG_DLL_CONFIG_2);
  }
  else {
    REG_WRITE32(
        host, (REG_READ32(host, SDCC_DLL_CONFIG_REG) & ~SDCC_DLL_CLK_OUT_EN),
        SDCC_DLL_CONFIG_REG);
    REG_WRITE32(
        host,
        (REG_READ32(host, SDCC_HC_REG_DLL_CONFIG_2) | SDCC_DLL_CLOCK_DISABLE),
        SDCC_HC_REG_DLL_CONFIG_2);
  }
}

/* Initialize DLL (Programmable Delay Line) */
static uint32_t sdhci_msm_init_dll(struct sdhci_host *host)
{
  uint32_t pwr_save = 0;
  uint32_t timeout  = SDHCI_DLL_TIMEOUT;
  uint32_t dll_cfg2;
  uint32_t mclk_clk_freq = 0;

  pwr_save = REG_READ32(host, SDCC_VENDOR_SPECIFIC_FUNC) & SDCC_DLL_PWR_SAVE_EN;

  /* Dll sequence needs additional steps for sdcc core version 42 */
  if (host->major == 1 && host->minor >= 0x42) {
    /* Disable DLL clock before configuring */
    sdhci_dll_clk_enable(host, 0);
  }

  /* PWR SAVE to 0 */
  if (pwr_save)
    REG_WRITE32(
        host,
        (REG_READ32(host, SDCC_VENDOR_SPECIFIC_FUNC) & ~SDCC_DLL_PWR_SAVE_EN),
        SDCC_VENDOR_SPECIFIC_FUNC);
  /* Set DLL_RST to 1 */
  REG_WRITE32(
      host, (REG_READ32(host, SDCC_DLL_CONFIG_REG) | SDCC_DLL_RESET_EN),
      SDCC_DLL_CONFIG_REG);
  /* Set DLL_PDN to 1 */
  REG_WRITE32(
      host, (REG_READ32(host, SDCC_DLL_CONFIG_REG) | SDCC_DLL_PDN_EN),
      SDCC_DLL_CONFIG_REG);

  /* Set frequency field in DLL_CONFIG */
  msm_set_dll_freq(host);

  /* Configure the mclk freq based on the current clock rate
   * and fll cycle count
   */
  if (host->major == 1 && host->minor >= 0x42) {
    dll_cfg2 = REG_READ32(host, SDCC_HC_REG_DLL_CONFIG_2);
    if (dll_cfg2 & SDCC_FLL_CYCLE_CNT)
      mclk_clk_freq = (host->cur_clk_rate / TCXO_FREQ) * 8;
    else
      mclk_clk_freq = (host->cur_clk_rate / TCXO_FREQ) * 4;

    REG_WRITE32(
        host,
        ((REG_READ32(host, SDCC_HC_REG_DLL_CONFIG_2) & ~(0xFF << 10)) |
         (mclk_clk_freq << 10)),
        SDCC_HC_REG_DLL_CONFIG_2);

    gBS->Stall(5);
  }

  /* Write 0 to DLL_RST */
  REG_WRITE32(
      host, (REG_READ32(host, SDCC_DLL_CONFIG_REG) & ~SDCC_DLL_RESET_EN),
      SDCC_DLL_CONFIG_REG);
  /* Write 0 to DLL_PDN */
  REG_WRITE32(
      host, (REG_READ32(host, SDCC_DLL_CONFIG_REG) & ~SDCC_DLL_PDN_EN),
      SDCC_DLL_CONFIG_REG);

  /* Set the mclk clock and enable the dll clock */
  if (host->major == 1 && host->minor >= 0x42) {
    msm_set_dll_freq(host);
    sdhci_dll_clk_enable(host, 1);
  }
  /* Write 1 to DLL_EN */
  REG_WRITE32(
      host, (REG_READ32(host, SDCC_DLL_CONFIG_REG) | SDCC_DLL_EN),
      SDCC_DLL_CONFIG_REG);
  /* Write 1 to CLK_OUT_EN */
  REG_WRITE32(
      host, (REG_READ32(host, SDCC_DLL_CONFIG_REG) | SDCC_DLL_CLK_OUT_EN),
      SDCC_DLL_CONFIG_REG);
  /* Wait for DLL_LOCK in DLL_STATUS register, wait time 50us */
  while (!((REG_READ32(host, SDCC_REG_DLL_STATUS)) & SDCC_DLL_LOCK_STAT)) {
    gBS->Stall(1);
    timeout--;
    if (!timeout) {
      dprintf(
          CRITICAL, "%s: Failed to get DLL lock: 0x%08x\n", __func__,
          REG_READ32(host, SDCC_REG_DLL_STATUS));
      return 1;
    }
  }

  /* Set the powersave back on */
  if (pwr_save)
    REG_WRITE32(
        host,
        (REG_READ32(host, SDCC_VENDOR_SPECIFIC_FUNC) | SDCC_DLL_PWR_SAVE_EN),
        SDCC_VENDOR_SPECIFIC_FUNC);

  return 0;
}

void sdhci_msm_toggle_cdr(struct sdhci_host *host, bool enable)
{
  uint32_t core_cfg;

  core_cfg = REG_READ32(host, SDCC_DLL_CONFIG_REG);

  if (enable) {
    core_cfg |= SDCC_DLL_CDR_EN;
    core_cfg &= ~SDCC_DLL_CDR_EXT_EN;
  }
  else {
    core_cfg &= ~SDCC_DLL_CDR_EN;
    core_cfg |= SDCC_DLL_CDR_EXT_EN;
  }

  REG_WRITE32(host, core_cfg, SDCC_DLL_CONFIG_REG);
}

/* Configure DLL with delay value based on 'phase' */
static uint32_t sdhci_msm_config_dll(struct sdhci_host *host, uint32_t phase)
{
  uint32_t core_cfg = 0;
  uint32_t timeout  = SDHCI_DLL_TIMEOUT;

  /* Gray code values from SWI */
  uint32_t gray_code[] = {0x0, 0x1, 0x3, 0x2, 0x6, 0x7, 0x5, 0x4,
                          0xC, 0xD, 0xF, 0xE, 0xA, 0xB, 0x9, 0x8};

  /* set CDR_EN & CLK_OUT_EN to 0 and
   * CDR_EXT_EN & DLL_EN to 1*/
  core_cfg = REG_READ32(host, SDCC_DLL_CONFIG_REG);
  core_cfg &= ~(SDCC_DLL_CDR_EN | SDCC_DLL_CLK_OUT_EN);
  core_cfg |= (SDCC_DLL_CDR_EXT_EN | SDCC_DLL_EN);
  REG_WRITE32(host, core_cfg, SDCC_DLL_CONFIG_REG);

  /* Wait until CLK_OUT_EN is 0 */
  while (REG_READ32(host, SDCC_DLL_CONFIG_REG) & SDCC_DLL_CLK_OUT_EN)
    ;

  REG_RMW32(
      host, SDCC_DLL_CONFIG_REG, SDCC_DLL_GRAY_CODE_START,
      SDCC_DLL_GRAY_CODE_WIDTH, gray_code[phase]);

  REG_WRITE32(
      host, (REG_READ32(host, SDCC_DLL_CONFIG_REG) | SDCC_DLL_CLK_OUT_EN),
      SDCC_DLL_CONFIG_REG);

  /* Wait until CLK_OUT_EN is 1, wait time 50us */
  while (!(REG_READ32(host, SDCC_DLL_CONFIG_REG) & SDCC_DLL_CLK_OUT_EN)) {
    timeout--;
    gBS->Stall(1);
    if (!timeout) {
      dprintf(
          CRITICAL, "%s: clk_out_en timed out: %08x\n", __func__,
          REG_READ32(host, SDCC_DLL_CONFIG_REG));
      return 1;
    }
  }

  core_cfg = REG_READ32(host, SDCC_DLL_CONFIG_REG);

  core_cfg |= SDCC_DLL_CDR_EN;
  core_cfg &= ~SDCC_DLL_CDR_EXT_EN;

  REG_WRITE32(host, core_cfg, SDCC_DLL_CONFIG_REG);

  return 0;
}

/*
 * Find the right tuning delay, this function finds the largest
 * consecutive sequence of phases & then selects the 3/4 th of
 * the range which has max entries
 * For eg: If we get the following sequence in phase_table[]
 * (A) phase_table[] = 0x1, 0x2, 0x3, 0x4 , 0x5
 * (B) phase_table[] = 0xA, 0xB, 0xC
 * In the above case the (A) has maximum consecutive entries with '5' entries
 * So delay would be phase_table[(0x5 * 3) / 4] = 0x3
 */
static int sdhci_msm_find_appropriate_phase(
    struct sdhci_host *host, uint32_t *phase_table, uint32_t total_phases)
{
  int      sub_phases[MAX_PHASES][MAX_PHASES] = {{0}};
  uint32_t phases_per_row[MAX_PHASES]         = {0};
  uint32_t i, j;
  int      selected_phase     = 0;
  uint32_t row_index          = 0;
  uint32_t col_index          = 0;
  uint32_t phase_15_row_idx   = 0;
  uint32_t phases_0_row_idx   = 0;
  uint32_t max_phases_3_4_idx = 0;
  uint32_t max_phases         = 0;
  uint32_t max_phases_row     = 0;
  bool     found_loop         = false;

  if (!phase_table[0] && phase_table[total_phases - 1] == (MAX_PHASES - 1))
    found_loop = true;

  for (i = 0; i < total_phases; i++) {
    /* Break the phase table entries into different sub arrays based
     * on the consecutive entries. Each row will have one sub array
     * of consecutive entries.
     * for eg: phase_table [] = { 0x0, 0x1, 0x2, 0xA, 0xB}
     * sub_phases [0][] = { 0x0, 0x1, 0x2}
     * sub_phases [1][] = { 0xA, 0xB}
     */
    sub_phases[row_index][col_index] = phase_table[i];
    phases_per_row[row_index]++;
    col_index++;

    /* If we are at the last phase no need to check further */
    if ((i + 1) == total_phases)
      break;

    /* If phase_table does not have consecutive entries, move to next entry */
    if (phase_table[i] + 1 != phase_table[i + 1]) {
      row_index++;
      col_index = 0;
    }
  }

  if (found_loop && total_phases < MAX_PHASES) {
    /* For consecutive entries we need to consider loops.
     * If the phase_table contains 0x0 & 0xF then we have
     * a loop, the number after 0xF in the sequence would be
     * 0x0.
     * for eg:
     * phase_table = { 0x0, 0x1, 0x2, 0xD, 0xE, 0xF }
     * then
     * sub_phase [0][] = { 0x0, 0x1, 0x2 }
     * sub_phase [1][] = { 0xD, 0xE, 0xF }
     * Since we have a loop here, we need to merge the sub arrays as:
     * sub_phase [1][] = { 0xD, 0xE, 0xF, 0x0, 0x1, 0x2 }
     */

    /* The entry 0xF will always be in the last row
     * and entry 0x0 will always be in the first row
     */
    phase_15_row_idx = row_index;
    j                = 0;
    for (i = phases_per_row[phase_15_row_idx]; i < MAX_PHASES; i++) {
      sub_phases[phase_15_row_idx][i] = sub_phases[phases_0_row_idx][j];
      if (++j >= phases_per_row[phases_0_row_idx])
        break;
    }

    /* Update the number of entries for the sub_phase after the merger */
    phases_per_row[phase_15_row_idx] =
        phases_per_row[phase_15_row_idx] + phases_per_row[phases_0_row_idx];
    phases_per_row[phases_0_row_idx] = 0;
  }

  for (i = 0; i <= row_index; i++) {
    if (phases_per_row[i] > max_phases) {
      max_phases     = phases_per_row[i];
      max_phases_row = i;
    }
  }

  max_phases_3_4_idx = (max_phases * 3) / 4;
  if (max_phases_3_4_idx)
    max_phases_3_4_idx--;

  selected_phase = sub_phases[max_phases_row][max_phases_3_4_idx];

  return selected_phase;
}

static uint32_t sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
{
  uint32_t timeout = 0;

  DBG("\n CM_DLL_SDC4 Calibration Start\n");

  /*1.Write the DDR config value to SDCC_HC_REG_DDR_CONFIG register*/
  REG_WRITE32(
      host, (UINTN)PcdGet64(PcdMmcSdhciDdrCfgVal), SDCC_HC_REG_DDR_CONFIG);

  /*2. Write DDR_CAL_EN to '1' */
  REG_WRITE32(
      host, (REG_READ32(host, SDCC_HC_REG_DLL_CONFIG_2) | DDR_CAL_EN),
      SDCC_HC_REG_DLL_CONFIG_2);

  /*3. Wait for DLL_LOCK for hs400 to be set */
  timeout = DDR_CAL_TIMEOUT_MAX;
  while (!(REG_READ32(host, SDCC_REG_DLL_STATUS) & DDR_DLL_LOCK_JDR)) {
    timeout--;
    gBS->Stall(1000);
    if (!timeout) {
      dprintf(CRITICAL, "Error: DLL lock for hs400 operation is not set\n");
      return 1;
    }
  }

  /*4. Set powersave dll */
  REG_WRITE32(
      host, (REG_READ32(host, SDCC_HC_VENDOR_SPECIFIC_FUNC3) | PWRSAVE_DLL),
      SDCC_HC_VENDOR_SPECIFIC_FUNC3);

  DBG("\n CM_DLL_SDC4 Calibration Done\n");

  return 0;
}

static uint32_t sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
{
  uint32_t timeout;
  uint32_t cdc_err;

  DBG("\n CDCLP533 Calibration Start\n");

  /* Write 0 to CDC_T4_DLY_SEL field in VENDOR_SPEC_DDR200_CFG */
  REG_WRITE32(
      host, (REG_READ32(host, SDCC_CDC_DDR200_CFG) & ~CDC_T4_DLY_SEL),
      SDCC_CDC_DDR200_CFG);

  /* Write 0 to START_CDC_TRAFFIC field in CORE_DDR200_CFG */
  REG_WRITE32(
      host, (REG_READ32(host, SDCC_CDC_DDR200_CFG) & ~START_CDC_TRAFFIC),
      SDCC_CDC_DDR200_CFG);

  /* Write 0 to CDC_SWITCH_BYPASS_OFF field in CSR_CDC_GEN_CFG */
  REG_WRITE32(
      host,
      (REG_READ32(host, SDCC_VENDOR_SPEC_CSR_CDC_CFG) & ~CDC_SWITCH_BYPASS_OFF),
      SDCC_VENDOR_SPEC_CSR_CDC_CFG);

  /* Write 1 to CDC_SWITCH_RC_EN field in CSR_CDC_GEN_CFG */
  REG_WRITE32(
      host, (REG_READ32(host, SDCC_VENDOR_SPEC_CSR_CDC_CFG) | CDC_SWITCH_RC_EN),
      SDCC_VENDOR_SPEC_CSR_CDC_CFG);

  /* Write 0 to START_CDC_TRAFFIC field in CORE_DDR200_CFG */
  REG_WRITE32(
      host, (REG_READ32(host, SDCC_CDC_DDR200_CFG) & ~START_CDC_TRAFFIC),
      SDCC_CDC_DDR200_CFG);

  /* Perform CDCLP533 initialization sequence
   * SDCC_CSR_CDC_CTRL_CFG0 --> 0x11800EC
   * SDCC_CSR_CDC_CTRL_CFG1 --> 0x3011111
   * SDCC_CSR_CDC_CAL_TIMER_CFG0 -->  0x1201000
   * SDCC_CSR_CDC_CAL_TIMER_CFG1 -->  0x4
   * SDCC_CSR_CDC_REFCOUNT_CFG -->   0xCB732020
   * SDCC_CSR_CDC_COARSE_CAL_CFG -->  0xB19
   * SDCC_CSR_CDC_DELAY_CFG  -->   0x4E2
   * SDCC_CDC_OFFSET_CFG     -->   0x0
   * SDCC_CDC_SLAVE_DDA_CFG  -->   0x16334
   */

  REG_WRITE32(host, 0x11800EC, SDCC_CSR_CDC_CTRL_CFG0);
  REG_WRITE32(host, 0x3011111, SDCC_CSR_CDC_CTRL_CFG1);
  REG_WRITE32(host, 0x1201000, SDCC_CSR_CDC_CAL_TIMER_CFG0);
  REG_WRITE32(host, 0x4, SDCC_CSR_CDC_CAL_TIMER_CFG1);
  REG_WRITE32(host, 0xCB732020, SDCC_CSR_CDC_REFCOUNT_CFG);
  REG_WRITE32(host, 0xB19, SDCC_CSR_CDC_COARSE_CAL_CFG);
  REG_WRITE32(host, 0x4E2, SDCC_CSR_CDC_DELAY_CFG);
  REG_WRITE32(host, 0x0, SDCC_CDC_OFFSET_CFG);
  REG_WRITE32(host, 0x16334, SDCC_CDC_SLAVE_DDA_CFG);

  /* Write 1 to SW_TRIGGER_FULL_CALIB */
  REG_WRITE32(
      host,
      (REG_READ32(host, SDCC_CSR_CDC_CTRL_CFG0) | CDC_SW_TRIGGER_FULL_CALIB),
      SDCC_CSR_CDC_CTRL_CFG0);

  /* Write 0 to SW_TRIGGER_FULL_CALIB */
  REG_WRITE32(
      host,
      (REG_READ32(host, SDCC_CSR_CDC_CTRL_CFG0) & ~CDC_SW_TRIGGER_FULL_CALIB),
      SDCC_CSR_CDC_CTRL_CFG0);

  /* Write 1 to HW_AUTO_CAL_EN */
  REG_WRITE32(
      host, (REG_READ32(host, SDCC_CSR_CDC_CTRL_CFG0) | CDC_HW_AUTO_CAL_EN),
      SDCC_CSR_CDC_CTRL_CFG0);

  /* Write 1 to TIMER_ENA */
  REG_WRITE32(
      host, (REG_READ32(host, SDCC_CSR_CDC_CAL_TIMER_CFG0) | CDC_TIMER_EN),
      SDCC_CSR_CDC_CAL_TIMER_CFG0);

  /* Wait for CALIBRATION_DONE in CDC_STATUS */
  timeout = CDC_STATUS_TIMEOUT;
  while (!(REG_READ32(host, SDCC_CSR_CDC_STATUS0) & BIT(0))) {
    timeout--;
    gBS->Stall(1000);
    if (!timeout) {
      dprintf(CRITICAL, "Error: Calibration done in CDC status not set\n");
      return 1;
    }
  }

  cdc_err = REG_READ32(host, SDCC_CSR_CDC_STATUS0) & CSR_CDC_ERROR_MASK;
  if (cdc_err) {
    dprintf(CRITICAL, "CDC error set during calibration: %x\n", cdc_err);
    return 1;
  }
  /* Write 1 to START_CDC_TRAFFIC field in CORE_DDR200_CFG */
  REG_WRITE32(
      host, (REG_READ32(host, SDCC_CDC_DDR200_CFG) | START_CDC_TRAFFIC),
      SDCC_CDC_DDR200_CFG);

  DBG("\n CDCLP533 Calibration Done\n");

  return 0;
}

static uint32_t sdhci_msm_hs400_calibration(struct sdhci_host *host)
{
  DBG("\n HS400 Calibration Start\n");

  /* Reset & Initialize the DLL block */
  if (sdhci_msm_init_dll(host))
    return 1;

  /* Write the save phase */
  if (sdhci_msm_config_dll(host, host->msm_host->saved_phase))
    return 1;

  /* Write 1 to CMD_DAT_TRACK_SEL field in DLL_CONFIG */
  REG_WRITE32(
      host, (REG_READ32(host, SDCC_DLL_CONFIG_REG) | CMD_DAT_TRACK_SEL),
      SDCC_DLL_CONFIG_REG);

  if (host->use_cdclp533)
    return sdhci_msm_cdclp533_calibration(host);
  else
    return sdhci_msm_cm_dll_sdc4_calibration(host);

  DBG("\n HS400 Calibration Done\n");

  return 0;
}

/*
 * Function: sdhci msm execute tuning
 * Arg     : Host structure & bus width
 * Return  : 0 on Success, 1 on Failure
 * Flow:   : Execute Tuning sequence for HS200 and calibration for hs400
 */
uint32_t sdhci_msm_execute_tuning(
    struct sdhci_host *host, struct mmc_card *card, uint32_t bus_width)
{
  uint32_t *             tuning_block;
  uint32_t *             tuning_data;
  uint32_t               tuned_phases[MAX_PHASES] = {0};
  uint32_t               size;
  uint32_t               phase            = 0;
  uint32_t               tuned_phase_cnt  = 0;
  uint8_t                drv_type         = 0;
  bool                   drv_type_changed = false;
  int                    ret              = 0;
  uint32_t               i;
  struct sdhci_msm_data *msm_host;

  msm_host = host->msm_host;

  /* In Tuning mode */
  host->tuning_in_progress = true;

  if (bus_width == DATA_BUS_WIDTH_8BIT) {
    tuning_block = (uint32_t *)tuning_block_128;
    size         = sizeof(tuning_block_128);
  }
  else {
    tuning_block = (uint32_t *)tuning_block_64;
    size         = sizeof(tuning_block_64);
  }

  tuning_data = (uint32_t *)memalign(CACHE_LINE, ROUNDUP(size, CACHE_LINE));

  ASSERT(tuning_data);

  /* Calibration for CDCLP533 needed for HS400 mode */
  if (msm_host->tuning_done && !msm_host->calibration_done &&
      host->timing == MMC_HS400_TIMING) {
    ret = sdhci_msm_hs400_calibration(host);
    if (!ret)
      msm_host->calibration_done = true;
    goto out;
  }

  /* Reset & Initialize the DLL block */
  if (sdhci_msm_init_dll(host)) {
    ret = 1;
    goto out;
  }

retry_tuning:
  tuned_phase_cnt        = 0;
  phase                  = 0;
  struct mmc_command cmd = {0};

  while (phase < MAX_PHASES) {
    /* configure dll to set phase delay */
    if (sdhci_msm_config_dll(host, phase)) {
      ret = 1;
      goto out;
    }

    cmd.cmd_index       = CMD21_SEND_TUNING_BLOCK;
    cmd.argument        = 0x0;
    cmd.cmd_type        = SDHCI_CMD_TYPE_NORMAL;
    cmd.resp_type       = SDHCI_CMD_RESP_R1;
    cmd.trans_mode      = SDHCI_MMC_READ;
    cmd.data_present    = 0x1;
    cmd.data.data_ptr   = tuning_data;
    cmd.data.blk_sz     = size;
    cmd.data.num_blocks = 0x1;

    /* send command */
    if (!sdhci_send_command(host, &cmd) &&
        !memcmp(tuning_data, tuning_block, size))
      tuned_phases[tuned_phase_cnt++] = phase;

    phase++;
  }

  /*
   * Check if all the tuning phases passed */
  if (tuned_phase_cnt == MAX_PHASES) {
    /* Change the driver type & rerun tuning */
    while (++drv_type <= MX_DRV_SUPPORTED_HS200) {
      drv_type_changed = mmc_set_drv_type(host, card, drv_type);
      if (drv_type_changed) {
        goto retry_tuning;
      }
    }
  }

  /* Restore the driver strength to default value */
  if (drv_type_changed)
    mmc_set_drv_type(host, card, 0);

  if (tuned_phase_cnt == MAX_PHASES) {
    attempt_cdr_unlock = true;
    dprintf(
        CRITICAL,
        "WARNING: All phase passed.The selected phase may not be optimal\n");
  }

  /* Find the appropriate tuned phase */
  if (tuned_phase_cnt) {
    DBG("\n Tuned phase\n");
    for (i = 0; i < tuned_phase_cnt; i++) {
      DBG("%d\t", tuned_phases[i]);
    }

    ret = sdhci_msm_find_appropriate_phase(host, tuned_phases, tuned_phase_cnt);

    if (ret < 0) {
      dprintf(CRITICAL, "Failed in selecting the tuning phase\n");
      ret = 1;
      goto out;
    }

    phase = (uint32_t)ret;
    ret   = 0;

    DBG("\n: %s: Tuned Phase: 0x%08x\n", __func__, phase);

    if (sdhci_msm_config_dll(host, phase))
      goto out;

    /* Save the tuned phase */
    host->msm_host->saved_phase = phase;
  }
  else {
    dprintf(CRITICAL, "Failed to get tuned phase\n");
    ret = 1;
  }

out:
  /* If all the tuning phases passed, send CMD21 after enabling
   * CDR to make sure right tuning phase is selected by CDR
   */
  if (attempt_cdr_unlock) {
    cmd.cmd_index       = CMD21_SEND_TUNING_BLOCK;
    cmd.argument        = 0x0;
    cmd.cmd_type        = SDHCI_CMD_TYPE_NORMAL;
    cmd.resp_type       = SDHCI_CMD_RESP_R1;
    cmd.trans_mode      = SDHCI_MMC_READ;
    cmd.data_present    = 0x1;
    cmd.data.data_ptr   = tuning_data;
    cmd.data.blk_sz     = size;
    cmd.data.num_blocks = 0x1;

    /* send command */
    if (!sdhci_send_command(host, &cmd)) {
      DBG("\n: %s: Sending CMD21 after CDR enable with default phases fail\n",
          __func__);
    }
  }

  free(tuning_data);
  /* Tuning done */
  host->tuning_in_progress    = false;
  host->msm_host->tuning_done = true;
  return ret;
}

/*
 * API to disable HC mode
 */
void sdhci_mode_disable(struct sdhci_host *host)
{
  /* Disable HC mode */
  RMWREG32(
      (host->msm_host->pwrctl_base + SDCC_MCI_HC_MODE), SDHCI_HC_START_BIT,
      SDHCI_HC_WIDTH, 0);
}
