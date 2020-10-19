/* Copyright (c) 2013-2016, The Linux Foundation. All rights reserved.
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

#include <Library/LcmLib.h>
#include <Library/MallocLib.h>
#include <Library/UefiBootServicesTableLib.h>

#include <Chipset/sdhci.h>

#include "sdhci_msm.h"
// Must come in order
#include "MMCHS.h"

static void sdhci_dumpregs(struct sdhci_host *host)
{
  DBG("****************** SDHC REG DUMP START ********************\n");

  DBG("Version:      0x%08x\n", REG_READ32(host, SDHCI_ARG2_REG));
  DBG("Arg2:         0x%08x\t Blk Cnt:      0x%08x\n",
      REG_READ32(host, SDHCI_ARG2_REG), REG_READ16(host, SDHCI_BLK_CNT_REG));
  DBG("Arg1:         0x%08x\t Blk Sz :      0x%08x\n",
      REG_READ32(host, SDHCI_ARGUMENT_REG), REG_READ16(host, SDHCI_BLKSZ_REG));
  DBG("Command:      0x%08x\t Trans mode:   0x%08x\n",
      REG_READ16(host, SDHCI_CMD_REG), REG_READ16(host, SDHCI_TRANS_MODE_REG));
  DBG("Resp0:        0x%08x\t Resp1:        0x%08x\n",
      REG_READ32(host, SDHCI_RESP_REG), REG_READ32(host, SDHCI_RESP_REG + 0x4));
  DBG("Resp2:        0x%08x\t Resp3:        0x%08x\n",
      REG_READ32(host, SDHCI_RESP_REG + 0x8),
      REG_READ32(host, SDHCI_RESP_REG + 0xC));
  DBG("Prsnt State:  0x%08x\t Host Ctrl1:   0x%08x\n",
      REG_READ32(host, SDHCI_PRESENT_STATE_REG),
      REG_READ8(host, SDHCI_HOST_CTRL1_REG));
  DBG("Timeout ctrl: 0x%08x\t Power Ctrl:   0x%08x\n",
      REG_READ8(host, SDHCI_TIMEOUT_REG), REG_READ8(host, SDHCI_PWR_CTRL_REG));
  DBG("Error stat:   0x%08x\t Int Status:   0x%08x\n",
      REG_READ16(host, SDHCI_ERR_INT_STS_REG),
      REG_READ16(host, SDHCI_NRML_INT_STS_REG));
  DBG("Host Ctrl2:   0x%08x\t Clock ctrl:   0x%08x\n",
      REG_READ16(host, SDHCI_HOST_CTRL2_REG),
      REG_READ16(host, SDHCI_CLK_CTRL_REG));
  DBG("Caps1:        0x%08x\t Caps2:        0x%08x\n",
      REG_READ32(host, SDHCI_CAPS_REG1), REG_READ32(host, SDHCI_CAPS_REG1));
  DBG("Adma Err:     0x%08x\t Auto Cmd err: 0x%08x\n",
      REG_READ8(host, SDHCI_ADM_ERR_REG), REG_READ16(host, SDHCI_AUTO_CMD_ERR));
  DBG("Adma addr1:   0x%08x\t Adma addr2:   0x%08x\n",
      REG_READ32(host, SDHCI_ADM_ADDR_REG),
      REG_READ32(host, SDHCI_ADM_ADDR_REG + 0x4));

  DBG("****************** SDHC REG DUMP END ********************\n");

  DBG("************* SDHC VENDOR REG DUMPS START ***************\n");
  DBG("SDCC_DLL_CONFIG_REG:       0x%08x\n",
      REG_READ32(host, SDCC_DLL_CONFIG_REG));
  DBG("SDCC_VENDOR_SPECIFIC_FUNC: 0x%08x\n",
      REG_READ32(host, SDCC_VENDOR_SPECIFIC_FUNC));
  DBG("SDCC_REG_DLL_STATUS:       0x%08x\n",
      REG_READ32(host, SDCC_REG_DLL_STATUS));
  DBG("************* SDHC VENDOR REG DUMPS END   ***************\n");
}

/*
 * Function: sdhci reset
 * Arg     : Host structure & mask to write to reset register
 * Return  : None
 * Flow:   : Reset the host controller
 */
void sdhci_reset(struct sdhci_host *host, uint8_t mask)
{
  uint32_t reg;
  uint32_t timeout = SDHCI_RESET_MAX_TIMEOUT;

  REG_WRITE8(host, mask, SDHCI_RESET_REG);

  /* Wait for the reset to complete */
  do {
    reg = REG_READ8(host, SDHCI_RESET_REG);
    reg &= mask;

    if (!reg)
      break;
    if (!timeout) {
      dprintf(CRITICAL, "Error: sdhci reset failed for: %x\n", mask);
      break;
    }

    timeout--;
    gBS->Stall(1000);

  } while (1);
}

/*
 * Function: sdhci error status enable
 * Arg     : Host structure
 * Return  : None
 * Flow:   : Enable command error status
 */
static void sdhci_error_status_enable(struct sdhci_host *host)
{
  /* Enable all interrupt status */
  REG_WRITE16(host, SDHCI_NRML_INT_STS_EN, SDHCI_NRML_INT_STS_EN_REG);
  REG_WRITE16(host, SDHCI_ERR_INT_STS_EN, SDHCI_ERR_INT_STS_EN_REG);
  /* Enable all interrupt signal */
  REG_WRITE16(host, SDHCI_NRML_INT_SIG_EN, SDHCI_NRML_INT_SIG_EN_REG);
  REG_WRITE16(host, SDHCI_ERR_INT_SIG_EN, SDHCI_ERR_INT_SIG_EN_REG);
}

/*
 * Function: sdhci clock supply
 * Arg     : Host structure
 * Return  : 0 on Success, 1 on Failure
 * Flow:   : 1. Calculate the clock divider
 *           2. Set the clock divider
 *           3. Check if clock stable
 *           4. Enable Clock
 */
uint32_t sdhci_clk_supply(struct sdhci_host *host, uint32_t clk)
{
  uint32_t div     = 0;
  uint32_t freq    = 0;
  uint16_t clk_val = 0;

  if (clk >= host->caps.base_clk_rate)
    goto clk_ctrl;

  /* As per the sd spec div should be a multiplier of 2 */
  for (div = 2; div < SDHCI_CLK_MAX_DIV; div += 2) {
    freq = host->caps.base_clk_rate / div;
    if (freq <= clk)
      break;
  }

  div >>= 1;

clk_ctrl:
  /* As per the sdhci spec 3.0, bits 6-7 of the clock
   * control registers will be mapped to bit 8-9, to
   * support a 10 bit divider value.
   * This is needed when the divider value overflows
   * the 8 bit range.
   */
  clk_val = ((div & SDHCI_SDCLK_FREQ_MASK) << SDHCI_SDCLK_FREQ_SEL);
  clk_val |= ((div & SDHC_SDCLK_UP_BIT_MASK) >> SDHCI_SDCLK_FREQ_SEL)
             << SDHCI_SDCLK_UP_BIT_SEL;

  clk_val |= SDHCI_INT_CLK_EN;
  REG_WRITE16(host, clk_val, SDHCI_CLK_CTRL_REG);

  /* Check for clock stable */
  while (!(REG_READ16(host, SDHCI_CLK_CTRL_REG) & SDHCI_CLK_STABLE))
    ;

  /* Now clock is stable, enable it */
  clk_val = REG_READ16(host, SDHCI_CLK_CTRL_REG);
  clk_val |= SDHCI_CLK_EN;
  REG_WRITE16(host, clk_val, SDHCI_CLK_CTRL_REG);

  host->cur_clk_rate = clk;

  DBG("\n %s: clock_rate: %d clock_div:0x%08x\n", __func__, clk, div);

  return 0;
}

/*
 * Function: sdhci set bus power
 * Arg     : Host structure
 * Return  : None
 * Flow:   : 1. Set the voltage
 *           2. Set the sd power control register
 */
static void sdhci_set_bus_power_on(struct sdhci_host *host)
{
  uint8_t voltage;

  voltage = host->caps.voltage;

  voltage <<= SDHCI_BUS_VOL_SEL;
  REG_WRITE8(host, voltage, SDHCI_PWR_CTRL_REG);

  voltage |= SDHCI_BUS_PWR_EN;

  DBG("\n %s: voltage: 0x%02x\n", __func__, voltage);

  REG_WRITE8(host, voltage, SDHCI_PWR_CTRL_REG);
}

/*
 * Function: sdhci set SDR mode
 * Arg     : Host structure, UHS mode
 * Return  : None
 * Flow:   : 1. Disable the clock
 *           2. Enable UHS mode
 *           3. Enable the clock
 * Details : SDR50/SDR104 mode is nothing but HS200
 *			 mode SDCC spec refers to it as SDR mode
 *			 & emmc spec refers as HS200 mode.
 */
void sdhci_set_uhs_mode(struct sdhci_host *host, uint32_t mode)
{
  uint16_t clk;
  uint16_t ctrl    = 0;
  uint32_t clk_val = 0;

  /* Disable the clock */
  clk = REG_READ16(host, SDHCI_CLK_CTRL_REG);
  clk &= ~SDHCI_CLK_EN;
  REG_WRITE16(host, clk, SDHCI_CLK_CTRL_REG);

  ctrl = REG_READ16(host, SDHCI_HOST_CTRL2_REG);

  ctrl &= ~SDHCI_UHS_MODE_MASK;

  /* Enable SDR50/SDR104/DDR50 mode */
  switch (mode) {
  case SDHCI_SDR104_MODE:
    ctrl |= SDHCI_SDR104_MODE_EN;
    clk_val = SDHCI_CLK_200MHZ;
    break;
  case SDHCI_SDR50_MODE:
    ctrl |= SDHCI_SDR50_MODE_EN;
    clk_val = SDHCI_CLK_100MHZ;
    break;
  case SDHCI_DDR50_MODE:
    ctrl |= SDHCI_DDR50_MODE_EN;
    clk_val = SDHCI_CLK_50MHZ;
    break;
  case SDHCI_SDR25_MODE:
    ctrl |= SDHCI_SDR25_MODE_EN;
    clk_val = SDHCI_CLK_50MHZ;
    break;
  case SDHCI_SDR12_MODE_EN:
    ctrl |= SDHCI_SDR12_MODE_EN;
    clk_val = SDHCI_CLK_25MHZ;
    break;
  default:
    dprintf(CRITICAL, "Error: Invalid UHS mode: %x\n", mode);
    ASSERT(0);
  };

  REG_WRITE16(host, ctrl, SDHCI_HOST_CTRL2_REG);

  /* Run the clock back */
  sdhci_clk_supply(host, clk_val);
}

/*
 * Function: sdhci set adma mode
 * Arg     : Host structure
 * Return  : None
 * Flow:   : Set adma mode
 */
static void sdhci_set_adma_mode(struct sdhci_host *host)
{
  /* Select 32 Bit ADMA2 type */
  REG_WRITE8(host, SDHCI_ADMA_32BIT, SDHCI_HOST_CTRL1_REG);
}

/*
 * Function: sdhci set bus width
 * Arg     : Host & width
 * Return  : 0 on Sucess, 1 on Failure
 * Flow:   : Set the bus width for controller
 */
uint8_t sdhci_set_bus_width(struct sdhci_host *host, uint16_t width)
{
  uint16_t reg = 0;

  reg = REG_READ8(host, SDHCI_HOST_CTRL1_REG);

  switch (width) {
  case DATA_BUS_WIDTH_8BIT:
    width = SDHCI_BUS_WITDH_8BIT;
    break;
  case DATA_BUS_WIDTH_4BIT:
    width = SDHCI_BUS_WITDH_4BIT;
    break;
  case DATA_BUS_WIDTH_1BIT:
    width = SDHCI_BUS_WITDH_1BIT;
    break;
  default:
    dprintf(CRITICAL, "Bus width is invalid: %u\n", width);
    return 1;
  }

  DBG("\n %s: bus width:0x%04x\n", __func__, width);

  REG_WRITE8(host, (reg | width), SDHCI_HOST_CTRL1_REG);

  return 0;
}

/*
 * Function: sdhci command err status
 * Arg     : Host structure
 * Return  : 0 on Sucess, 1 on Failure
 * Flow:   : Look for error status
 */
static uint8_t sdhci_cmd_err_status(struct sdhci_host *host)
{
  uint32_t err;

  err = REG_READ16(host, SDHCI_ERR_INT_STS_REG);

  if (err & SDHCI_CMD_TIMEOUT_MASK) {
    dprintf(CRITICAL, "Error: Command timeout error\n");
    return 1;
  }
  else if (err & SDHCI_CMD_CRC_MASK) {
    dprintf(CRITICAL, "Error: Command CRC error\n");
    return 1;
  }
  else if (err & SDHCI_CMD_END_BIT_MASK) {
    dprintf(CRITICAL, "Error: CMD end bit error\n");
    return 1;
  }
  else if (err & SDHCI_CMD_IDX_MASK) {
    dprintf(CRITICAL, "Error: Command Index error\n");
    return 1;
  }
  else if (err & SDHCI_DAT_TIMEOUT_MASK) {
    dprintf(CRITICAL, "Error: DATA time out error\n");
    return 1;
  }
  else if (err & SDHCI_DAT_CRC_MASK) {
    dprintf(CRITICAL, "Error: DATA CRC error\n");
    return 1;
  }
  else if (err & SDHCI_DAT_END_BIT_MASK) {
    dprintf(CRITICAL, "Error: DATA end bit error\n");
    return 1;
  }
  else if (err & SDHCI_CUR_LIM_MASK) {
    dprintf(CRITICAL, "Error: Current limit error\n");
    return 1;
  }
  else if (err & SDHCI_AUTO_CMD12_MASK) {
    dprintf(CRITICAL, "Error: Auto CMD12 error\n");
    return 1;
  }
  else if (err & SDHCI_ADMA_MASK) {
    dprintf(CRITICAL, "Error: ADMA error\n");
    return 1;
  }

  return 0;
}

/*
 * Function: sdhci command complete
 * Arg     : Host & command structure
 * Return  : 0 on Sucess, 1 on Failure
 * Flow:   : 1. Check for command complete
 *           2. Check for transfer complete
 *           3. Get the command response
 *           4. Check for errors
 */
static uint8_t
sdhci_cmd_complete(struct sdhci_host *host, struct mmc_command *cmd)
{
  uint8_t  i;
  uint8_t  ret        = 0;
  uint8_t  need_reset = 0;
  uint64_t retry      = 0;
  uint32_t int_status;
  uint32_t trans_complete = 0;
  uint32_t err_status;
  uint64_t max_trans_retry =
      (cmd->cmd_timeout ? cmd->cmd_timeout : SDHCI_MAX_TRANS_RETRY);

  do {
    int_status = REG_READ16(host, SDHCI_NRML_INT_STS_REG);

    if (int_status & SDHCI_INT_STS_CMD_COMPLETE)
      break;
    else if (int_status & SDHCI_ERR_INT_STAT_MASK && !host->tuning_in_progress)
      goto err;

    /*
     * If Tuning is in progress ignore cmd crc, cmd timeout & cmd end bit errors
     */
    if (host->tuning_in_progress) {
      err_status = REG_READ16(host, SDHCI_ERR_INT_STS_REG);
      if ((err_status & SDHCI_CMD_CRC_MASK) ||
          (err_status & SDHCI_CMD_END_BIT_MASK) ||
          err_status & SDHCI_CMD_TIMEOUT_MASK) {
        sdhci_reset(host, (SOFT_RESET_CMD | SOFT_RESET_DATA));
        return 0;
      }
    }

    retry++;
    gBS->Stall(1);
    if (retry == SDHCI_MAX_CMD_RETRY) {
      dprintf(CRITICAL, "Error: Command never completed\n");
      ret = 1;
      goto err;
    }
  } while (1);

  /* Command is complete, clear the interrupt bit */
  REG_WRITE16(host, SDHCI_INT_STS_CMD_COMPLETE, SDHCI_NRML_INT_STS_REG);

  /* Copy the command response,
   * The valid bits for R2 response are 0-119, & but the actual response
   * is stored in bits 8-128. We need to move 8 bits of MSB of each
   * response to register 8 bits of LSB of next response register.
   * As:
   * MSB 8 bits of RESP0 --> LSB 8 bits of RESP1
   * MSB 8 bits of RESP1 --> LSB 8 bits of RESP2
   * MSB 8 bits of RESP2 --> LSB 8 bits of RESP3
   */
  if (cmd->resp_type == SDHCI_CMD_RESP_R2) {
    for (i = 0; i < 4; i++) {
      cmd->resp[i] = REG_READ32(host, SDHCI_RESP_REG + (i * 4));
      cmd->resp[i] <<= SDHCI_RESP_LSHIFT;

      if (i != 0)
        cmd->resp[i] |=
            (REG_READ32(host, SDHCI_RESP_REG + ((i - 1) * 4)) >>
             SDHCI_RESP_RSHIFT);
    }
  }
  else
    cmd->resp[0] = REG_READ32(host, SDHCI_RESP_REG);

  retry = 0;

  /*
   * Clear the transfer complete interrupt
   */
  if (cmd->data_present || cmd->resp_type == SDHCI_CMD_RESP_R1B) {
    do {
      int_status = REG_READ16(host, SDHCI_NRML_INT_STS_REG);

      if (int_status & SDHCI_INT_STS_TRANS_COMPLETE) {
        trans_complete = 1;
        break;
      }
      /*
       * Some controllers set the data timout first on issuing an erase & take
       * time to set data complete interrupt. We need to wait hoping the
       * controller would set data complete
       */
      else if (
          int_status & SDHCI_ERR_INT_STAT_MASK && !host->tuning_in_progress &&
          !((REG_READ16(host, SDHCI_ERR_INT_STS_REG) & SDHCI_DAT_TIMEOUT_MASK)))
        goto err;

      /*
       * If we are in tuning then we need to wait until Data timeout , Data end
       * or Data CRC error
       */
      if (host->tuning_in_progress) {
        err_status = REG_READ16(host, SDHCI_ERR_INT_STS_REG);
        if ((err_status & SDHCI_DAT_TIMEOUT_MASK) ||
            (err_status & SDHCI_DAT_CRC_MASK)) {
          sdhci_reset(host, (SOFT_RESET_CMD | SOFT_RESET_DATA));
          return 0;
        }
      }

      retry++;
      gBS->Stall(1);
      if (retry == max_trans_retry) {
        dprintf(CRITICAL, "Error: Transfer never completed\n");
        ret = 1;
        goto err;
      }
    } while (1);

    /* Transfer is complete, clear the interrupt bit */
    REG_WRITE16(host, SDHCI_INT_STS_TRANS_COMPLETE, SDHCI_NRML_INT_STS_REG);
  }

err:
  /* Look for errors */
  int_status = REG_READ16(host, SDHCI_NRML_INT_STS_REG);

  if (int_status & SDHCI_ERR_INT_STAT_MASK) {
    /*
     * As per SDHC spec transfer complete has higher priority than data timeout
     * If both transfer complete & data timeout are set then we should ignore
     * data timeout error.
     * ---------------------------------------------------------------------------
     * | Transfer complete | Data timeout error | Meaning of the Status |
     * |--------------------------------------------------------------------------|
     * |      0            |       0            | Interrupted by another factor
     * |
     * |--------------------------------------------------------------------------|
     * |      0            |       1            | Time out occured during
     * transfer|
     * |--------------------------------------------------------------------------|
     * |      1            |  Don't Care        | Command execution complete |
     *  --------------------------------------------------------------------------
     */
    if ((REG_READ16(host, SDHCI_ERR_INT_STS_REG) & SDHCI_DAT_TIMEOUT_MASK) &&
        trans_complete) {
      ret = 0;
    }
    else if (sdhci_cmd_err_status(host)) {
      ret = 1;
      /* Dump sdhc registers on error */
      sdhci_dumpregs(host);
    }
    /* Reset Command & Dat lines on error */
    need_reset = 1;
  }

  /* Reset data & command line */
  if (need_reset)
    sdhci_reset(host, (SOFT_RESET_CMD | SOFT_RESET_DATA));

  return ret;
}

/*
 * Function: sdhci prep desc table
 * Arg     : Pointer data & length
 * Return  : Pointer to desc table
 * Flow:   : Prepare the adma table as per the sd spec v 3.0
 */
static struct desc_entry *sdhci_prep_desc_table(void *data, uint32_t len)
{
  struct desc_entry *sg_list;
  uint32_t           sg_len = 0;
  uint32_t           remain = 0;
  uint32_t           i;
  uint32_t           table_len = 0;

  if (len <= SDHCI_ADMA_DESC_LINE_SZ) {
    /* Allocate only one descriptor */
    sg_list = (struct desc_entry *)memalign(
        lcm(4, CACHE_LINE), ROUNDUP(sizeof(struct desc_entry), CACHE_LINE));

    if (!sg_list) {
      dprintf(CRITICAL, "Error allocating memory\n");
      ASSERT(0);
    }

    sg_list[0].addr = (uint32_t)data;
    sg_list[0].len  = (len < SDHCI_ADMA_DESC_LINE_SZ)
                         ? len
                         : (SDHCI_ADMA_DESC_LINE_SZ & 0xffff);
    sg_list[0].tran_att =
        SDHCI_ADMA_TRANS_VALID | SDHCI_ADMA_TRANS_DATA | SDHCI_ADMA_TRANS_END;

    sg_len    = 1;
    table_len = sizeof(struct desc_entry);
  }
  else {
    /* Calculate the number of entries in desc table */
    sg_len = len / SDHCI_ADMA_DESC_LINE_SZ;
    remain = len - (sg_len * SDHCI_ADMA_DESC_LINE_SZ);

    /* Allocate sg_len + 1 entries if there are remaining bytes at the end */
    if (remain)
      sg_len++;

    table_len = (sg_len * sizeof(struct desc_entry));

    sg_list = (struct desc_entry *)memalign(
        lcm(4, CACHE_LINE), ROUNDUP(table_len, CACHE_LINE));

    if (!sg_list) {
      dprintf(CRITICAL, "Error allocating memory\n");
      ASSERT(0);
    }

    memset((void *)sg_list, 0, table_len);

    /*
     * Prepare sglist in the format:
     *  ___________________________________________________
     * |Transfer Len | Transfer ATTR | Data Address        |
     * | (16 bit)    | (16 bit)      | (32 bit)            |
     * |_____________|_______________|_____________________|
     */
    for (i = 0; i < (sg_len - 1); i++) {
      sg_list[i].addr = (uint32_t)data;
      /*
       * Length attribute is 16 bit value & max transfer size for one
       * descriptor line is 65536 bytes, As per SD Spec3.0 'len = 0'
       * implies 65536 bytes. Truncate the length to limit to 16 bit
       * range.
       */
      sg_list[i].len      = (SDHCI_ADMA_DESC_LINE_SZ & 0xffff);
      sg_list[i].tran_att = SDHCI_ADMA_TRANS_VALID | SDHCI_ADMA_TRANS_DATA;
      data += SDHCI_ADMA_DESC_LINE_SZ;
      len -= SDHCI_ADMA_DESC_LINE_SZ;
    }

    /* Fill the last entry of the table with Valid & End
     * attributes
     */
    sg_list[sg_len - 1].addr = (uint32_t)data;
    sg_list[sg_len - 1].len  = (len < SDHCI_ADMA_DESC_LINE_SZ)
                                  ? len
                                  : (SDHCI_ADMA_DESC_LINE_SZ & 0xffff);
    sg_list[sg_len - 1].tran_att =
        SDHCI_ADMA_TRANS_VALID | SDHCI_ADMA_TRANS_DATA | SDHCI_ADMA_TRANS_END;
  }

  arch_clean_invalidate_cache_range((addr_t)sg_list, table_len);

  for (i = 0; i < sg_len; i++) {
    DBG("\n %s: sg_list: addr: 0x%08x len: 0x%04x attr: 0x%04x\n", __func__,
        sg_list[i].addr,
        (sg_list[i].len ? sg_list[i].len : SDHCI_ADMA_DESC_LINE_SZ),
        sg_list[i].tran_att);
  }

  return sg_list;
}

/*
 * Function: sdhci adma transfer
 * Arg     : Host structure & command stucture
 * Return  : Pointer to desc table
 * Flow    : 1. Prepare descriptor table
 *           2. Write adma register
 *           3. Write block size & block count register
 */
static struct desc_entry *
sdhci_adma_transfer(struct sdhci_host *host, struct mmc_command *cmd)
{
  uint32_t           num_blks = 0;
  uint32_t           sz;
  void *             data;
  struct desc_entry *adma_addr;

  num_blks = cmd->data.num_blocks;
  data     = cmd->data.data_ptr;

  /*
   * Some commands send data on DAT lines which is less
   * than SDHCI_MMC_BLK_SZ, in that case trying to read
   * more than the data sent by the card results in data
   * CRC errors. To avoid such errors allow data to pass
   * the required block size, if the block size is not
   * passed use the default value
   */
  if (cmd->data.blk_sz)
    sz = num_blks * cmd->data.blk_sz;
  else
    sz = num_blks * SDHCI_MMC_BLK_SZ;

  /* Prepare adma descriptor table */
  adma_addr = sdhci_prep_desc_table(data, sz);

  /* Write adma address to adma register */
  REG_WRITE32(host, (uint32_t)adma_addr, SDHCI_ADM_ADDR_REG);

  /* Write the block size */
  if (cmd->data.blk_sz)
    REG_WRITE16(host, cmd->data.blk_sz, SDHCI_BLKSZ_REG);
  else
    REG_WRITE16(host, SDHCI_MMC_BLK_SZ, SDHCI_BLKSZ_REG);

  /*
   * Set block count in block count register
   */
  REG_WRITE16(host, num_blks, SDHCI_BLK_CNT_REG);

  return adma_addr;
}

/*
 * Function: sdhci send command
 * Arg     : Host structure & command stucture
 * Return  : 0 on Success, 1 on Failure
 * Flow:   : 1. Prepare the command register
 *           2. If data is present, prepare adma table
 *           3. Run the command
 *           4. Check for command results & take action
 */
uint32_t sdhci_send_command(struct sdhci_host *host, struct mmc_command *cmd)
{
  uint32_t           ret        = 0;
  uint8_t            retry      = 0;
  uint32_t           resp_type  = 0;
  uint16_t           trans_mode = 0;
  uint16_t           present_state;
  uint32_t           flags;
  struct desc_entry *sg_list = NULL;

  DBG("\n %s: START: cmd:%04d, arg:0x%08x, resp_type:0x%04x, data_present:%d\n",
      __func__, cmd->cmd_index, cmd->argument, cmd->resp_type,
      cmd->data_present);

  if (cmd->data_present)
    ASSERT(cmd->data.data_ptr);

  /*
   * Assert if the data buffer is not aligned to cache
   * line size for read operations.
   * For write operations this function assumes that
   * the cache is already flushed by the caller. As
   * the data buffer we receive for write operation
   * may not be aligned to cache boundary due to
   * certain image formats like sparse image.
   */
  if (cmd->trans_mode == SDHCI_READ_MODE)
    ASSERT(IS_CACHE_LINE_ALIGNED(cmd->data.data_ptr));

  do {
    present_state = REG_READ32(host, SDHCI_PRESENT_STATE_REG);
    /* check if CMD & DAT lines are free */
    present_state &= SDHCI_STATE_CMD_DAT_MASK;

    if (!present_state)
      break;
    gBS->Stall(1000);
    retry++;
    if (retry == 10) {
      dprintf(CRITICAL, "Error: CMD or DAT lines were never freed\n");
      return 1;
    }
  } while (1);

  switch (cmd->resp_type) {
  case SDHCI_CMD_RESP_R1:
  case SDHCI_CMD_RESP_R3:
  case SDHCI_CMD_RESP_R6:
  case SDHCI_CMD_RESP_R7:
    /* Response of length 48 have 32 bits
     * of response data stored in RESP0[0:31]
     */
    resp_type = SDHCI_CMD_RESP_48;
    break;

  case SDHCI_CMD_RESP_R2:
    /* Response of length 136 have 120 bits
     * of response data stored in RESP0[0:119]
     */
    resp_type = SDHCI_CMD_RESP_136;
    break;

  case SDHCI_CMD_RESP_R1B:
    /* Response of length 48 have 32 bits
     * of response data stored in RESP0[0:31]
     * & set CARD_BUSY status if card is busy
     */
    resp_type = SDHCI_CMD_RESP_48_BUSY;
    break;

  case SDHCI_CMD_RESP_NONE:
    resp_type = SDHCI_CMD_RESP_NONE;
    break;

  default:
    dprintf(CRITICAL, "Invalid response type for the command\n");
    return 1;
  };

  flags = (resp_type << SDHCI_CMD_RESP_TYPE_SEL_BIT);
  flags |= (cmd->data_present << SDHCI_CMD_DATA_PRESENT_BIT);
  flags |= (cmd->cmd_type << SDHCI_CMD_CMD_TYPE_BIT);

  /* Enable Command CRC & Index check for commands with response
   * R1, R6, R7 & R1B. Also only CRC check for R2 response
   */
  switch (cmd->resp_type) {
  case SDHCI_CMD_RESP_R1:
  case SDHCI_CMD_RESP_R6:
  case SDHCI_CMD_RESP_R7:
  case SDHCI_CMD_RESP_R1B:
    flags |= (1 << SDHCI_CMD_CRC_CHECK_BIT) | (1 << SDHCI_CMD_IDX_CHECK_BIT);
    break;
  case SDHCI_CMD_RESP_R2:
    flags |= (1 << SDHCI_CMD_CRC_CHECK_BIT);
    break;
  default:
    break;
  };

  /* Set the timeout value */
  REG_WRITE8(host, SDHCI_CMD_TIMEOUT, SDHCI_TIMEOUT_REG);

  /* Check if data needs to be processed */
  if (cmd->data_present)
    sg_list = sdhci_adma_transfer(host, cmd);

  /* Write the argument 1 */
  REG_WRITE32(host, cmd->argument, SDHCI_ARGUMENT_REG);

  /* Set the Transfer mode */
  if (cmd->data_present) {
    /* Enable DMA */
    trans_mode |= SDHCI_DMA_EN;

    if (cmd->trans_mode == SDHCI_MMC_READ) {
      trans_mode |= SDHCI_READ_MODE;
      if (cmd->cmd_index == CMD21_SEND_TUNING_BLOCK)
        sdhci_msm_toggle_cdr(host, false);
      else
        sdhci_msm_toggle_cdr(host, true);
    }
    else {
      sdhci_msm_toggle_cdr(host, false);
    }

    /* Enable auto cmd23 or cmd12 for multi block transfer
     * based on what command card supports
     */
    if (cmd->data.num_blocks > 1) {
      if (cmd->cmd23_support) {
        trans_mode |=
            SDHCI_TRANS_MULTI | SDHCI_AUTO_CMD23_EN | SDHCI_BLK_CNT_EN;
        REG_WRITE32(host, cmd->data.num_blocks, SDHCI_ARG2_REG);
      }
      else
        trans_mode |=
            SDHCI_TRANS_MULTI | SDHCI_AUTO_CMD12_EN | SDHCI_BLK_CNT_EN;
    }
  }

  /* Write to transfer mode register */
  REG_WRITE16(host, trans_mode, SDHCI_TRANS_MODE_REG);

  /* Write the command register */
  REG_WRITE16(host, SDHCI_PREP_CMD(cmd->cmd_index, flags), SDHCI_CMD_REG);

  /* Command complete sequence */
  if (sdhci_cmd_complete(host, cmd)) {
    ret = 1;
    goto err;
  }

  /* Invalidate the cache only for read operations */
  if (cmd->trans_mode == SDHCI_MMC_READ) {
    /* Read can be performed on block size < SDHCI_MMC_BLK_SZ, make sure to
     * flush the data only for the read size instead
     */
    arch_invalidate_cache_range(
        (addr_t)cmd->data.data_ptr,
        (cmd->data.blk_sz) ? (cmd->data.num_blocks * cmd->data.blk_sz)
                           : (cmd->data.num_blocks * SDHCI_MMC_BLK_SZ));
  }

  DBG("\n %s: END: cmd:%04d, arg:0x%08x, resp:0x%08x 0x%08x 0x%08x 0x%08x\n",
      __func__, cmd->cmd_index, cmd->argument, cmd->resp[0], cmd->resp[1],
      cmd->resp[2], cmd->resp[3]);
err:
  /* Free the scatter/gather list */
  if (sg_list)
    free(sg_list);

  return ret;
}

/*
 * Function: sdhci init
 * Arg     : Host structure
 * Return  : None
 * Flow:   : 1. Reset the controller
 *           2. Read the capabilities register & populate the host
 *           controller capabilities for use by other functions
 *           3. Enable the power control
 *           4. Set initial bus width
 *           5. Set Adma mode
 *           6. Enable the error status
 */
void sdhci_init(struct sdhci_host *host)
{
  uint32_t   caps[2];
  uint32_t   version;
  UINTN      Index;
  EFI_STATUS Status;

  /* Read the capabilities register & store the info */
  caps[0] = REG_READ32(host, SDHCI_CAPS_REG1);
  caps[1] = REG_READ32(host, SDHCI_CAPS_REG2);

  DBG("\n %s: Host capability: cap1:0x%08x, cap2: 0x%08x\n", __func__, caps[0],
      caps[1]);

  host->caps.base_clk_rate =
      (caps[0] & SDHCI_CLK_RATE_MASK) >> SDHCI_CLK_RATE_BIT;
  host->caps.base_clk_rate *= 1000000;

  /* Get the max block length for mmc */
  host->caps.max_blk_len = (caps[0] & SDHCI_BLK_LEN_MASK) >> SDHCI_BLK_LEN_BIT;

  /* 8 bit Bus width */
  if (caps[0] & SDHCI_8BIT_WIDTH_MASK)
    host->caps.bus_width_8bit = 1;

  /* Adma support */
  if (caps[0] & SDHCI_BLK_ADMA_MASK)
    host->caps.adma_support = 1;

  /* Supported voltage */
  if (caps[0] & SDHCI_3_3_VOL_MASK)
    host->caps.voltage = SDHCI_VOL_3_3;
  else if (caps[0] & SDHCI_3_0_VOL_MASK)
    host->caps.voltage = SDHCI_VOL_3_0;
  else if (caps[0] & SDHCI_1_8_VOL_MASK)
    host->caps.voltage = SDHCI_VOL_1_8;

  /* DDR mode support */
  host->caps.ddr_support = (caps[1] & SDHCI_DDR50_MODE_MASK) ? 1 : 0;

  /* SDR50 mode support */
  host->caps.sdr50_support = (caps[1] & SDHCI_SDR50_MODE_MASK) ? 1 : 0;

  /* SDR104 mode support */
  host->caps.sdr104_support = (caps[1] & SDHCI_SDR104_MODE_MASK) ? 1 : 0;

  version = readl(host->msm_host->pwrctl_base + MCI_VERSION);

  host->major = (version & CORE_VERSION_MAJOR_MASK) >> CORE_VERSION_MAJOR_SHIFT;
  host->minor = (version & CORE_VERSION_MINOR_MASK);

  if (host->major == 0x1 && host->minor < 0x34)
    host->use_cdclp533 = true;
  else
    host->use_cdclp533 = false;

  /* Set bus power on */
  sdhci_set_bus_power_on(host);

  /* Wait for power interrupt to be handled */
  Status = gBS->WaitForEvent(1, &host->sdhc_event, &Index);
  ASSERT_EFI_ERROR(Status);

  /* Complete */
  gBS->CloseEvent(&host->sdhc_event);
  host->sdhc_event           = NULL;
  host->msm_host->sdhc_event = NULL;

  /* Set bus width */
  sdhci_set_bus_width(host, SDHCI_BUS_WITDH_1BIT);

  /* Set Adma mode */
  sdhci_set_adma_mode(host);

  /*
   * Enable error status
   */
  sdhci_error_status_enable(host);
}
