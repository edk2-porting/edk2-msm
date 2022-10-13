/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 * * Redistributions of source code must retain the above copyright
 *  notice, this list of conditions and the following disclaimer.
 *  * Redistributions in binary form must reproduce the above
 * copyright notice, this list of conditions and the following
 * disclaimer in the documentation and/or other materials provided
 *  with the distribution.
 *   * Neither the name of The Linux Foundation nor the names of its
 * contributors may be used to endorse or promote products derived
 * from this software without specific prior written permission.
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

#ifndef __EFIPLATFORMINFOTYPES_H__
#define __EFIPLATFORMINFOTYPES_H__

/*===========================================================================
 *   INCLUDE FILES
 *===========================================================================*/

/*===========================================================================
 *   TYPE DEFINITIONS
 * ===========================================================================*/

/** @addtogroup efi_platformInfo_data_types
@{ */
/**
  Target type of the device on which the platform is running.
*/
typedef enum {
  EFI_PLATFORMINFO_TYPE_UNKNOWN = 0x00,     /**< Unknown target device. */
  EFI_PLATFORMINFO_TYPE_CDP = 0x01,         /**< CDP device. */
  EFI_PLATFORMINFO_TYPE_FFA = 0x02,         /**< Form-fit accurate device. */
  EFI_PLATFORMINFO_TYPE_FLUID = 0x03,       /**< Forward looking user interface
                                           demonstration device. */
  EFI_PLATFORMINFO_TYPE_OEM = 0x05,         /**< Original equipment manufacturer
                                                 device. */
  EFI_PLATFORMINFO_TYPE_QT = 0x06,          /**< Qualcomm tablet device. */
  EFI_PLATFORMINFO_TYPE_MTP = 0x08,         /**< MTP device. */
  EFI_PLATFORMINFO_TYPE_LIQUID = 0x09,      /**< LiQUID device. */
  EFI_PLATFORMINFO_TYPE_DRAGONBOARD = 0x0A, /**< DragonBoard@tm device. */
  EFI_PLATFORMINFO_TYPE_QRD = 0x0B,         /**< QRD device. */
  EFI_PLATFORMINFO_TYPE_EVB = 0x0C,         /**< EVB device. */
  EFI_PLATFORMINFO_TYPE_HRD = 0x0D,         /**< HRD device. */
  EFI_PLATFORMINFO_TYPE_DTV = 0x0E,  /**< DTV device. */
  EFI_PLATFORMINFO_TYPE_RUMI = 0x0F, /**< Target is on Rumi (ASIC emulation). */
  EFI_PLATFORMINFO_TYPE_VIRTIO = 0x10,  /**< Target is on Virtio
                                            (system-level simulation). */
  EFI_PLATFORMINFO_TYPE_GOBI = 0x11, /**< Gobi@tm device. */
  EFI_PLATFORMINFO_TYPE_CBH  = 0x12,  /**< CBH device. */
  EFI_PLATFORMINFO_TYPE_BTS = 0x13,  /**< BTS device. */
  EFI_PLATFORMINFO_TYPE_XPM = 0x14,  /**< XPM device. */
  EFI_PLATFORMINFO_TYPE_RCM = 0x15,  /**< RCM device. */
  EFI_PLATFORMINFO_TYPE_DMA = 0x16,  /**< DMA device. */
  EFI_PLATFORMINFO_TYPE_STP = 0x17,  /**< STP device. */
  EFI_PLATFORMINFO_TYPE_SBC = 0x18,  /**< SBC device. */
  EFI_PLATFORMINFO_TYPE_ADP = 0x19,  /**< ADP device. */
  EFI_PLATFORMINFO_TYPE_CHI = 0x1A,  /**< CHI device. */
  EFI_PLATFORMINFO_TYPE_SDP = 0x1B,  /**< SDP device. */
  EFI_PLATFORMINFO_TYPE_RRP = 0x1C,  /**< RRP device. */
  EFI_PLATFORMINFO_TYPE_CLS = 0x1D,  /**< CLS device. */
  EFI_PLATFORMINFO_TYPE_TTP = 0x1E,  /**< TTP device. */
  EFI_PLATFORMINFO_TYPE_HDK = 0x1F,  /**< HDK device. */
  EFI_PLATFORMINFO_TYPE_IOT = 0x20,  /**< IOT device. */
  EFI_PLATFORMINFO_TYPE_ATP = 0x21,  /**< ATP device. */
  EFI_PLATFORMINFO_TYPE_IDP = 0x22,  /**< IDP device. */

  EFI_PLATFORMINFO_NUM_TYPES, /**< Number of known targets
                                                 (including unknown). @newpage
                                 */
  /** @cond */
  EFI_PLATFORMINFO_TYPE_32BITS = 0x7FFFFFFF
  /** @endcond */
} EFI_PLATFORMINFO_PLATFORM_TYPE;

/**
 * Keys to get data out of the CDT.
 */
typedef enum {
  EFI_PLATFORMINFO_KEY_UNKNOWN = 0x00,
  EFI_PLATFORMINFO_KEY_DDR_FREQ = 0x01,
  EFI_PLATFORMINFO_KEY_GFX_FREQ = 0x02,
  EFI_PLATFORMINFO_KEY_CAMERA_FREQ = 0x03,
  EFI_PLATFORMINFO_KEY_FUSION = 0x04,
  EFI_PLATFORMINFO_KEY_CUST = 0x05,

  EFI_PLATFORMINFO_NUM_KEYS = 0x06,

  /** @cond */
  EFI_PLATFORMINFO_KEY_32BITS = 0x7FFFFFFF
  /** @endcond */
} EFI_PLATFORMINFO_KEY_TYPE;

#endif /* __EFIPLATFORMINFOTYPES_H__ */
