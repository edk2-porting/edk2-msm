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

#ifndef __EFICHIPINFO_H__
#define __EFICHIPINFO_H__

#include "EFIChipInfoTypes.h"

/** @cond */
typedef struct _EFI_CHIPINFO_PROTOCOL EFI_CHIPINFO_PROTOCOL;
/** @endcond */

/** @addtogroup efi_chipInfo_constants
@{ */
/**
  Protocol version.
*/
#define EFI_CHIPINFO_PROTOCOL_REVISION 0x0000000000010002
/** @} */ /* end_addtogroup efi_chipInfo_constants */

/*  Protocol GUID definition */
/** @ingroup efi_chipInfo_protocol */
#define EFI_CHIPINFO_PROTOCOL_GUID                                             \
  {                                                                            \
    0x61224FBE, 0xB240, 0x4D53,                                                \
    {                                                                          \
      0xB6, 0x61, 0xA9, 0xA1, 0xF3, 0x43, 0xB0, 0x5C                           \
    }                                                                          \
  }

/** @cond */
/**
  External reference to the CHIPINFO Protocol GUID defined
  in the .dec file.
*/
extern EFI_GUID gEfiChipInfoProtocolGuid;
/** @endcond */

/** @addtogroup efi_chipInfo_constants
@{ */
/** Maximum length of a chip ID string. This can be used by clients when
  declaring space for the EFI_DALCHIPINFO_GETCHIPIDSTRING() function. */
#define EFICHIPINFO_MAX_ID_LENGTH 16

/** Macro to generate the hardware version number from a specified major
  and minor number. This is used when comparing against the return value of
  hw_version(). For example, to check if the version is at least Version 1.2: \n

  @code
  EFI_ChipInfo_GetVersion(h, &version);
  if (version >= EFI_CHIPINFO_VERSION(1,2)) ...
  @endcode
*/
#define EFI_CHIPINFO_VERSION(major, minor) (((major) << 16) | (minor))
/** @} */ /* end_addtogroup efi_chipInfo_constants */

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

typedef UINT32 EFIChipInfoSerialNumType;
typedef UINT32 EFIChipInfoQFPROMChipIdType;

/** @} */ /* end_addtogroup efi_chipInfo_data_types */

/*==============================================================================

                             API IMPLEMENTATION

==============================================================================*/

/* ============================================================================
**  Function : EFI_DalChipInfo_GetChipVersion
** ============================================================================
*/
/** @ingroup efi_chipInfo_getChipVersion
  @par Summary
  Gets the chip version.

  @param[in]   This       Pointer to the EFI_CHIPINFO_PROTOCOL instance.
  @param[out]  pnVersion  Pointer to the #EFIChipInfoVersionType type
                          passed by the caller that will be populated by
                          the driver.

  @return
  EFI_SUCCESS        -- Function completed successfully. \n
  EFI_PROTOCOL_ERROR -- Error occurred during the operation.
*/
typedef EFI_STATUS (EFIAPI *EFI_DALCHIPINFO_GETCHIPVERSION) (
    IN EFI_CHIPINFO_PROTOCOL *This,
    OUT EFIChipInfoVersionType *pnVersion);

/* ============================================================================
**  Function : EFI_DalChipInfo_GetRawChipVersion
** ============================================================================
*/
/** @ingroup efi_chipInfo_getRawChipVersion
  @par Summary
  Gets the chip version as read from the hardware register.

  @param[in]   This       Pointer to the EFI_CHIPINFO_PROTOCOL instance.
  @param[out]  pnVersion  Pointer to a UINT32 passed by the caller that
                          will be populated by the driver.

  @return
  EFI_SUCCESS        -- Function completed successfully. \n
  EFI_PROTOCOL_ERROR -- Error occurred during the operation.
*/
typedef EFI_STATUS (EFIAPI *EFI_DALCHIPINFO_GETRAWCHIPVERSION) (
    IN EFI_CHIPINFO_PROTOCOL *This,
    OUT UINT32 *pnVersion);

/* ============================================================================
**  Function : EFI_DalChipInfo_GetChipId
** ============================================================================
*/
/** @ingroup efi_chipInfo_getChipId
  @par Summary
  Gets the chip ID.

  @param[in]   This  Pointer to the EFI_CHIPINFO_PROTOCOL instance.
  @param[out]  peId  Pointer to the #EFIChipInfoIdType enumeration
                     passed by the caller that will be populated by
                     the driver.

  @return
  EFI_SUCCESS        -- Function completed successfully. \n
  EFI_PROTOCOL_ERROR -- Error occurred during the operation.
*/
typedef EFI_STATUS (EFIAPI *EFI_DALCHIPINFO_GETCHIPID) (
    IN EFI_CHIPINFO_PROTOCOL *This,
    OUT EFIChipInfoIdType *peId);

/* ============================================================================
**  Function : EFI_DalChipInfo_GetRawChipId
** ============================================================================
*/
/** @ingroup efi_chipInfo_getRawChipId
  @par Summary
  Gets the chip ID as read from the hardware register.

  @param[in]   This       Pointer to the EFI_CHIPINFO_PROTOCOL instance.
  @param[out]  pnId       Pointer to a UINT32 passed by the caller that
                          will be populated by the driver.

  @return
  EFI_SUCCESS        -- Function completed successfully. \n
  EFI_PROTOCOL_ERROR -- Error occurred during the operation.
*/
typedef EFI_STATUS (EFIAPI *EFI_DALCHIPINFO_GETRAWCHIPID) (
    IN EFI_CHIPINFO_PROTOCOL *This,
    OUT UINT32 *pnId);

/* ============================================================================
**  Function : EFI_DalChipInfo_GetChipIdString
** ============================================================================
*/
/** @ingroup efi_chipInfo_getChipIdString
  @par Summary
  Gets the string representing the chip name. The pin configuration can be
  overwritten by any user after the retrieval.

  @param[in]   This        Pointer to the EFI_CHIPINFO_PROTOCOL instance.
  @param[out]  szIdString  Pointer passed by the caller that will be
                           populated by the driver.
  @param[in]   nMaxLength  Length of the string  to be passed by the caller.
                           EFICHIPINFO_MAX_ID_LENGTH is the maximum length
                           supported.
  @return
  EFI_SUCCESS        -- Function completed successfully. \n
  EFI_PROTOCOL_ERROR -- Error occurred during the operation.
*/
typedef EFI_STATUS (EFIAPI *EFI_DALCHIPINFO_GETCHIPIDSTRING) (
    IN EFI_CHIPINFO_PROTOCOL *This,
    OUT CHAR8 *szIdString,
    IN UINT32 nMaxLength);

/* ============================================================================
**  Function : EFI_DalChipInfo_GetChipFamily
** ============================================================================
*/
/** @ingroup efi_chipInfo_getChipFamily
  @par Summary
  Gets the chip family.

  @param[in]   This        Pointer to the EFI_CHIPINFO_PROTOCOL instance.
  @param[out]  peFamily    Pointer to the #EFIChipInfoFamilyType enumeration
                           passed by the caller that will be populated by
                           the driver.

  @return
  EFI_SUCCESS        -- Function completed successfully. \n
  EFI_PROTOCOL_ERROR -- Error occurred during the operation.
*/
typedef EFI_STATUS (EFIAPI *EFI_DALCHIPINFO_GETCHIPFAMILY) (
    IN EFI_CHIPINFO_PROTOCOL *This,
    OUT EFIChipInfoFamilyType *peFamily);

/* ============================================================================
**  Function : EFI_DalChipInfo_GetModemSupport
** ============================================================================
*/
/** @ingroup efi_chipInfo_getModemSupport
  @par Summary
  Gets the modem support information of the chip.

  @param[in]   This       Pointer to the EFI_CHIPINFO_PROTOCOL instance.
  @param[out]  pnModem    Pointer to the #EFIChipInfoModemType type
                          passed by the caller that will be populated by
                          the driver.

  @return
  EFI_SUCCESS        -- Function completed successfully. \n
  EFI_PROTOCOL_ERROR -- Error occurred during the operation.
*/
typedef EFI_STATUS (EFIAPI *EFI_DALCHIPINFO_GETMODEMSUPPORT) (
    IN EFI_CHIPINFO_PROTOCOL *This,
    OUT EFIChipInfoModemType *pnModem);

/* ============================================================================
**  Function : EFI_DalChipInfo_GetProcessorNameString
** ============================================================================
*/
/** @ingroup efi_chipInfo_getProcessorNameString
  @par Summary
  Gets the string representing the processor name.

  @param[in]   This        Pointer to the EFI_CHIPINFO_PROTOCOL instance.
  @param[out]  szNameString  Pointer passed by the caller that will be
                           populated by the driver.
  @param[in]   nMaxLength  Length of the string  to be passed by the caller.
                           EFICHIPINFO_MAX_NAME_LENGTH is the maximum length
                           supported.
  @return
  EFI_SUCCESS        -- Function completed successfully. \n
  EFI_PROTOCOL_ERROR -- Error occurred during the operation.
*/
typedef EFI_STATUS (EFIAPI *EFI_DALCHIPINFO_GETPROCESSORNAMESTRING) (
    IN EFI_CHIPINFO_PROTOCOL *This,
    OUT CHAR8 *szNameString,
    IN UINT32 nMaxLength);

/* ============================================================================
**  Function : EFI_DalChipInfo_GetSerialNumber
** ============================================================================
*/
/** @ingroup efi_chipInfo_getSerialNumber
  @par Summary
  Gets the Serial number of this device.

  @param[in]   This        Pointer to the EFI_CHIPINFO_PROTOCOL instance.
  @param[in,out]  peId       Pointer to a DalChipInfoSerialNumType variable
                             passed by the caller that will be populated by
                             the driver.
  @return
  EFI_SUCCESS        -- Function completed successfully. \n
  EFI_PROTOCOL_ERROR -- Error occurred during the operation.
*/
typedef EFI_STATUS (EFIAPI *EFI_DALCHIPINFO_GETSERIALNUMBER) (
    IN EFI_CHIPINFO_PROTOCOL *This,
    OUT EFIChipInfoSerialNumType *peId);

/* ============================================================================
**  Function : EFI_DalChipInfo_GetFoundryId
** ============================================================================
*/
/** @ingroup efi_chipInfo_getFoundryId
  @par Summary
  Gets the Foundry Id.

  @param[in]   This        Pointer to the EFI_CHIPINFO_PROTOCOL instance.
  @param[in,out]  peId       Pointer to a DalChipInfoFoundryIdType type
                             structure passed by the caller that
                             will be populated by the driver.
  @return
  EFI_SUCCESS        -- Function completed successfully. \n
  EFI_PROTOCOL_ERROR -- Error occurred during the operation.
*/
typedef EFI_STATUS (EFIAPI *EFI_DALCHIPINFO_GETFOUNDRYID) (
    IN EFI_CHIPINFO_PROTOCOL *This,
    OUT EFIChipInfoFoundryIdType *peId);

/* ============================================================================
**  Function : EFI_DalChipInfo_GetRawDeviceFamily
** ============================================================================
*/
/** @ingroup efi_chipInfo_getRawDeviceFamily
  @par Summary
   Returns the RawDeviceFamily as read from TCSR_SOC_VERSION register.

  @param[in]   This        Pointer to the EFI_CHIPINFO_PROTOCOL instance.
  @param[in,out]  peId       Pointer to a uint32 type variable
                             passed by the caller that
                             will be populated by the driver.
  @return
  EFI_SUCCESS        -- Function completed successfully. \n
  EFI_PROTOCOL_ERROR -- Error occurred during the operation.
*/
typedef EFI_STATUS (EFIAPI *EFI_DALCHIPINFO_GETRAWDEVICEFAMILY) (
    IN EFI_CHIPINFO_PROTOCOL *This,
    OUT UINT32 *pnId);

/* ============================================================================
**  Function : EFI_DalChipInfo_GetRawDeviceNumber
** ============================================================================
*/
/** @ingroup efi_chipInfo_GETRAWDEVICENUMBER
  @par Summary
  Returns the RawDeviceNumber as read from TCSR_SOC_VERSION register.

  @param[in]   This        Pointer to the EFI_CHIPINFO_PROTOCOL instance.
  @param[in,out]  peId       Pointer to a uint32 type variable
                            passed by the caller that
                             will be populated by the driver.
  @return
  EFI_SUCCESS        -- Function completed successfully. \n
  EFI_PROTOCOL_ERROR -- Error occurred during the operation.
*/
typedef EFI_STATUS (EFIAPI *EFI_DALCHIPINFO_GETRAWDEVICENUMBER) (
    IN EFI_CHIPINFO_PROTOCOL *This,
    OUT UINT32 *pnId);

/* ============================================================================
**  Function : EFI_DalChipInfo_GetQFPROMChipId
** ============================================================================
*/
/** @ingroup efi_chipInfo_getQFPROMChipId
  @par Summary
  Gets the QFPROM Chip Id of this device.

  @param[in]   This        Pointer to the EFI_CHIPINFO_PROTOCOL instance.
  @param[in,out]  peId       Pointer to a DalChipInfoQFPROMChipIdType variable
                             passed by the caller that will be populated by
                             the driver.
  @return
  EFI_SUCCESS        -- Function completed successfully. \n
  EFI_PROTOCOL_ERROR -- Error occurred during the operation.
*/
typedef EFI_STATUS (EFIAPI *EFI_DALCHIPINFO_GETQFPROMCHIPID) (
    IN EFI_CHIPINFO_PROTOCOL *This,
    OUT EFIChipInfoQFPROMChipIdType *pnId);

/* ============================================================================
**  Function : EFI_DalChipInfo_GetMarketingNameString
** ============================================================================
*/
/** @ingroup efi_chipInfo_getMarketingNameString
  @par Summary
  Gets the string representing the chip's marketing name.

  @param[in]   This        Pointer to the EFI_CHIPINFO_PROTOCOL instance.
  @param[out]  szNameString  Pointer passed by the caller that will be
                           populated by the driver.
  @param[in]   nMaxLength  Length of the string  to be passed by the caller.
                           EFICHIPINFO_MAX_NAME_LENGTH is the maximum length
                           supported.
  @return
  EFI_SUCCESS        -- Function completed successfully. \n
  EFI_PROTOCOL_ERROR -- Error occurred during the operation.
*/
typedef EFI_STATUS (EFIAPI *EFI_DALCHIPINFO_GETMARKETINGNAMESTRING) (
    IN EFI_CHIPINFO_PROTOCOL *This,
    OUT CHAR8 *szNameString,
    IN UINT32 nMaxLength);

/* ============================================================================
**  Function : EFI_DalChipInfo_GetDefectivePart
** ============================================================================
*/
/** @ingroup efi_chipInfo_getDefectivePart
  @par Summary
  Gets the defectiveness of the selected part

  @param[in]   This     Pointer to the EFI_CHIPINFO_PROTOCOL instance.
  @param[in]   ePart    The EFIChipInfoPartType to check
  @param[out]  pnMask   Pointer to hold a mask signifying defectiveness.
                          A non-zero mask implies that the part is defective

  @return
  EFI_SUCCESS         -- Function completed successfully. \n
  EFI_NOT_FOUND       -- The specified part is out of range
  EFI_PROTOCOL_ERROR  -- Error occurred during the operation.
*/
typedef EFI_STATUS (EFIAPI *EFI_DALCHIPINFO_GETDEFECTIVEPART) (
    IN EFI_CHIPINFO_PROTOCOL *This,
    IN EFIChipInfoPartType ePart,
    OUT UINT32 *pnMask);

/* ============================================================================
**  Function : EFI_DalChipInfo_GetDefectiveCPUs
** ============================================================================
*/
/** @ingroup efi_chipInfo_getDefectiveCPUs
 * @par Summary
 * Gets the cores within the selected cluster which are marked "defective"
 * in PTE fuses
 *
 * @param[in]   This          Pointer to the EFI_CHIPINFO_PROTOCOL instance
 * @param[in]   nCPUCluster   The cluster whose defective cores need to be
 * retrieved
 * @param[out]  pnMask        Mask of defective cores in this cluster.
 *
 * @return
 * EFI_SUCCESS        -- Function completed successfully \n
 * EFI_NOT_FOUND      -- The provided nCPUCluster is outside the range of
 * supported clusters \n
 * EFI_PROTOCOL_ERROR -- Other error occured during the operation
 */
typedef EFI_STATUS (EFIAPI *EFI_DALCHIPINFO_GETDEFECTIVECPUS) (
    IN EFI_CHIPINFO_PROTOCOL *This,
    IN UINT32 nCPUCluster,
    OUT UINT32 *pnMask);

/*===========================================================================
  PROTOCOL INTERFACE
===========================================================================*/
/** @ingroup efi_chipInfo_protocol
  @par Summary
  Chip Information Protocol interface.

  @par Parameters
  @inputprotoparams{chip_info_proto_params.tex}
*/
struct _EFI_CHIPINFO_PROTOCOL {
  UINT64 Revision;
  EFI_DALCHIPINFO_GETCHIPVERSION GetChipVersion;
  EFI_DALCHIPINFO_GETRAWCHIPVERSION GetRawChipVersion;
  EFI_DALCHIPINFO_GETCHIPID GetChipId;
  EFI_DALCHIPINFO_GETRAWCHIPID GetRawChipId;
  EFI_DALCHIPINFO_GETCHIPIDSTRING GetChipIdString;
  EFI_DALCHIPINFO_GETCHIPFAMILY GetChipFamily;
  EFI_DALCHIPINFO_GETMODEMSUPPORT GetModemSupport;
  EFI_DALCHIPINFO_GETPROCESSORNAMESTRING GetProcessorNameString;
  EFI_DALCHIPINFO_GETSERIALNUMBER GetSerialNumber;
  EFI_DALCHIPINFO_GETFOUNDRYID GetFoundryId;
  EFI_DALCHIPINFO_GETRAWDEVICEFAMILY GetRawDeviceFamily;
  EFI_DALCHIPINFO_GETRAWDEVICENUMBER GetRawDeviceNumber;
  EFI_DALCHIPINFO_GETQFPROMCHIPID GetQFPROMChipId;
  EFI_DALCHIPINFO_GETMARKETINGNAMESTRING GetMarketingNameString;
  EFI_DALCHIPINFO_GETDEFECTIVEPART GetDefectivePart;
  EFI_DALCHIPINFO_GETDEFECTIVECPUS GetDefectiveCPUs;
};

#endif /* __EFICHIPINFO_H__ */
