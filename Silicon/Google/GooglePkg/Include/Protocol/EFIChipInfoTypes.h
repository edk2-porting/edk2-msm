/* Copyright (c) 2015-2016,2019 The Linux Foundation. All rights reserved.
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

#ifndef __EFICHIPINFOTYPES_H__
#define __EFICHIPINFOTYPES_H__

/** @addtogroup efi_chipInfo_constants
@{ */
/** Macro to generate the hardware version number from a specified major
  and minor number. This is used when comparing against the return value of
  hw_version(). For example, to check if the version is at least Version 1.2: \n

  @code
  EFI_ChipInfo_GetVersion(h, &version);
  if (version >= EFI_CHIPINFO_VERSION(1,2)) ...
  @endcode
*/
#define EFI_CHIPINFO_VERSION(major, minor)  (((major) << 16) | (minor))
#define EFI_CHIPINFO_VERSION_UNKNOWN 0

/** Maximum length of a chip ID string. This can be used by clients when
  declaring space for the EFI_DALCHIPINFO_GETCHIPIDSTRING() function. */
#define EFICHIPINFO_MAX_ID_LENGTH 16

/**
  Maximum length of a processor name string. This can be used
  by clients when declaring space for the
  EFI_DALCHIPINFO_GETPROCESSORNAMESTRING() function. */
#define EFICHIPINFO_MAX_NAME_LENGTH EFICHIPINFO_MAX_ID_LENGTH

/**
  Maximum number of CPU clusters supported by the GetDefectiveParts API
 **/
#define EFICHIPINFO_MAX_CPU_CLUSTERS 4

/**
 * Other macros used to indicate unknown values
 */
#define EFICHIPINFO_RAW_VERSION_UNKNOWN        0x0
#define EFICHIPINFO_RAW_ID_UNKNOWN             0x0
#define EFICHIPINFO_SERIAL_NUM_UNKNOWN         0x0
#define EFICHIPINFO_RAW_DEVICE_FAMILY_UNKNOWN  0x0
#define EFICHIPINFO_RAW_DEVICE_NUMBER_UNKNOWN  0x0
#define EFICHIPINFO_QFPROM_CHIPID_UNKNOWN      0x0

/** @endcond */

/** @addtogroup efi_chipInfo_data_types
@{ */
/** Chip version with the major number in the upper 16 bits and the
  minor number in the lower 16 bits. For example: \n
  - Version 1.0 is 0x00010000
  - Version 2.3 is 0x00020003

  The #EFI_CHIPINFO_VERSION macro must be used to generate the
  appropriate comparison value because the format is not guaranteed
  to remain unchanged.
*/
typedef UINT32 EFIChipInfoVersionType;

/** Stores information about modem hardware supported on the
  platform. */
typedef UINT32 EFIChipInfoModemType;

/** Chip identification. */
/* Any new IDs must be added to the end. */
typedef enum
{
  /** @cond */
  EFICHIPINFO_ID_UNKNOWN = 0, /**< Unknown chip. */
  EFICHIPINFO_ID_MSM8998 = 292,
  EFICHIPINFO_ID_APQ8098 = 319,
  EFICHIPINFO_ID_SDM845 = 321,

  EFICHIPINFO_NUM_IDS = 401,
  EFICHIPINFO_ID_32BITS = 0x7FFFFFF
  /** @endcond */
} EFIChipInfoIdType;

/** Chip family. This is the family type of the chip on which the software is
  running. Each family may include multiple chip IDs.
*/
typedef enum
{
  /** @cond */
  EFICHIPINFO_FAMILY_UNKNOWN = 0, /**< Unknown family. */
  EFICHIPINFO_FAMILY_MSM8998 = 67,
  EFICHIPINFO_FAMILY_SDM845 = 79,

  /** @cond */
  EFICHIPINFO_NUM_FAMILIES = 102,
  EFICHIPINFO_FAMILY_32BITS = 0x7FFFFFF
  /** @endcond */
} EFIChipInfoFamilyType;

/**
Chip serial number. Unique within each EfiChipInfoFamily.
*/
typedef UINT32 EFIChipInfoSerialNumType;

/**
Chip serial number as read from QFPROM.
*/
typedef UINT32 EFIChipInfoQFPROMChipIdType;

/**
Chip Foundry type.
*/
typedef enum
{
  EFICHIPINFO_FOUNDRYID_UNKNOWN = 0,
  EFICHIPINFO_FOUNDRYID_TSMC    = 1,
  EFICHIPINFO_FOUNDRYID_GF      = 2,
  EFICHIPINFO_FOUNDRYID_SS      = 3,
  EFICHIPINFO_FOUNDRYID_IBM     = 4,
  EFICHIPINFO_FOUNDRYID_UMC     = 5,
  EFICHIPINFO_FOUNDRYID_SMIC    = 6,

  EFICHIPINFO_NUM_FOUNDRYIDS,
  EFICHIPINFO_FOUNDRYID_32BITS  = 0x7FFFFFF
} EFIChipInfoFoundryIdType;

/**
 * Defective parts supported by the GetDefectivePart API
 */
typedef enum
{
  EFICHIPINFO_PART_UNKNOWN      = 0,
  EFICHIPINFO_PART_GPU          = 1,
  EFICHIPINFO_PART_VIDEO        = 2,
  EFICHIPINFO_PART_CAMERA       = 3,
  EFICHIPINFO_PART_DISPLAY      = 4,
  EFICHIPINFO_PART_AUDIO        = 5,
  EFICHIPINFO_PART_MODEM        = 6,
  EFICHIPINFO_PART_WLAN         = 7,
  EFICHIPINFO_PART_COMP         = 8,
  EFICHIPINFO_PART_SENSORS      = 9,
  EFICHIPINFO_PART_NPU          = 10,
  EFICHIPINFO_PART_SPSS         = 11,
  EFICHIPINFO_PART_NAV          = 12,
  /*
   * TODO Add Group E parts
   * once they've been finalized
   */

  EFICHIPINFO_NUM_PARTS,
  EFICHIPINFO_PART_32BITS = 0x7FFFFFFF
} EFIChipInfoPartType;

#endif /* __EFICHIPINFOTYPES_H__ */
