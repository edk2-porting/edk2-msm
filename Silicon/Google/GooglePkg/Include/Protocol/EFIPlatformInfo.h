/* Copyright (c) 2015-2016, The Linux Foundation. All rights reserved.
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

#ifndef __EFIPLATFORMINFO_H__
#define __EFIPLATFORMINFO_H__

/*===========================================================================
  INCLUDE FILES
===========================================================================*/

#include "EFIPlatformInfoTypes.h"

/*===========================================================================
  MACRO DECLARATIONS
===========================================================================*/
/** @addtogroup efi_platformInfo_constants
@{ */
/**
  Protocol version.
*/
#define EFI_PLATFORMINFO_PROTOCOL_VERSION 0x0000000000020000
/** @} */ /* end_addtogroup efi_platformInfo_constants */

/*  Protocol GUID definition */
/** @ingroup efi_platformInfo_protocol */
#define EFI_PLATFORMINFO_PROTOCOL_GUID                                         \
  {                                                                            \
    0x157a5c45, 0x21b2, 0x43c5,                                                \
    {                                                                          \
      0xba, 0x7c, 0x82, 0x2f, 0xee, 0x5f, 0xe5, 0x99                           \
    }                                                                          \
  }

/** @cond */
/*===========================================================================
  EXTERNAL VARIABLES
===========================================================================*/
/**
  External reference to the Platform Info Protocol GUID.
 */
extern EFI_GUID gEfiPlatformInfoProtocolGuid;

/*===========================================================================
  TYPE DEFINITIONS
===========================================================================*/
/**
  Protocol declaration.
 */
typedef struct _EFI_PLATFORMINFO_PROTOCOL EFI_PLATFORMINFO_PROTOCOL;
/** @endcond */

/**
  Stores the target platform, the platform version, and the subtype of the
  platform.
 */
typedef struct {
  EFI_PLATFORMINFO_PLATFORM_TYPE platform;
  /**< Type of the current target; see #EFI_PLATFORMINFO_PLATFORM_TYPE for
       details. */
  UINT32 version;
  /**< Version of the platform in use. */
  UINT32 subtype;
  /**< Subtype of the platform. */
  BOOLEAN fusion;
  /**< TRUE if Fusion; FALSE otherwise. */
} EFI_PLATFORMINFO_PLATFORM_INFO_TYPE;
/** @} */ /* end_addtogroup efi_platformInfo_data_types */

/*===========================================================================
  FUNCTION DEFINITIONS
===========================================================================*/
/* EFI_PLATFORMINFO_GET_PLATFORMINFO */
/** @ingroup efi_platformInfo_get_platformInfo
  @par Summary
  Gets information about the current platform. The information is returned
  in the PlatformInfo parameter.

  @param[in]  This          Pointer to the EFI_PLATFORMINFO_PROTOCOL instance.
  @param[out] PlatformInfo  Pointer to the platform information to be filled
                            in; see #EFI_PLATFORMINFO_PLATFORM_INFO_TYPE.

  @return
  EFI_SUCCESS        -- Function completed successfully.  \n
  EFI_PROTOCOL_ERROR -- Error occurred during the operation.
*/
typedef EFI_STATUS (EFIAPI *EFI_PLATFORMINFO_GET_PLATFORMINFO) (
    IN EFI_PLATFORMINFO_PROTOCOL *This,
    OUT EFI_PLATFORMINFO_PLATFORM_INFO_TYPE *PlatformInfo);

/* EFI_PLATFORMINFO_GET_KEYVALUE */
/** @ingroup efi_platformInfo_get_platformInfo
  @par Summary
  Gets a key value.

  @param[in]  This          Pointer to the EFI_PLATFORMINFO_PROTOCOL instance.
  @param[in]  Key           Key to get the value for;
                            see #EFI_PLATFORMINFO_KEY_TYPE.
  @param[out] Value         Key value.

  @return
  EFI_SUCCESS        -- Key found.  \n
  EFI_NOT_FOUND      -- Key not found.  \n
  EFI_INVALID_PARAMETER -- Key out of range or Value is NULL.
*/
typedef EFI_STATUS (EFIAPI *EFI_PLATFORMINFO_GET_KEYVALUE) (
    IN EFI_PLATFORMINFO_PROTOCOL *This,
    IN EFI_PLATFORMINFO_KEY_TYPE Key,
    OUT UINT32 *Value);

/*===========================================================================
  PROTOCOL INTERFACE
===========================================================================*/
/** @ingroup efi_platformInfo_protocol
  @par Summary
  Platform Information Protocol interface.

  @par Parameters
  @inputprotoparams{platform_info_proto_params.tex}
*/
struct _EFI_PLATFORMINFO_PROTOCOL {
  UINT64 Version;
  EFI_PLATFORMINFO_GET_PLATFORMINFO GetPlatformInfo;
  EFI_PLATFORMINFO_GET_KEYVALUE GetKeyValue;
};

#endif /* __EFIPLATFORMINFO_H__ */
