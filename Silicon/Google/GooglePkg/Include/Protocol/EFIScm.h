/* Copyright (c) 2017, The Linux Foundation. All rights reserved.
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
#ifndef __EFISCM_H__
#define __EFISCM_H__

/*===========================================================================
  INCLUDE FILES
===========================================================================*/
#include <Uefi.h>

/*===========================================================================
  MACRO DECLARATIONS
===========================================================================*/
/** @ingroup efi_scm_constants
  Protocol version.
*/
#define QCOM_SCM_PROTOCOL_REVISION 0x0000000000010001

/*===========================================================================
  EXTERNAL VARIABLES
===========================================================================*/
/** @ingroup efi_scm_protocol */
extern EFI_GUID gQcomScmProtocolGuid;

/*===========================================================================
  TYPE DEFINITIONS
===========================================================================*/

/** @ingroup efi_scm_data_types
  Commands supported by TrustZone QSEE (Qualcomm  Technologies Inc Secure
  Execution Environment)
  structures.
*/
typedef enum {
  APP_START_APP_CMD = 0x01,          /**< Start application. */
  APP_SHUTDOWN_CMD,                  /**< Shut down. */
  APP_QUERY_APPID_CMD,               /**< Query application ID. */
  APP_REGISTER_LISTENER_CMD,         /**< Register listener. */
  APP_DEREGISTER_LISTENER_CMD,       /**< Deregister listener. */
  APP_SEND_DATA_CMD,                 /**< Send data. */
  APP_LISTENER_DATA_RSP_CMD,         /**< Listener data response. */
  APP_LOAD_EXTERNAL_ELF_CMD,         /**< Load external ELF. */
  APP_UNLOAD_EXTERNAL_ELF_CMD,       /**< Unload external ELF. */
  APP_GET_APP_STATE_CMD,             /**< Get application state. */
  APP_LOAD_SERV_IMAGE_CMD,           /**< Load server image. */
  APP_UNLOAD_SERV_IMAGE_CMD,         /**< Unload server image. */
  APP_REGION_NOTIFICATION_CMD,       /**< Region notification. */
  APP_REGISTER_LOG_BUF_COMMAND,      /**< Register log buffer. */
  APP_PROVISION_RPMB_KEY_COMMAND,    /**< Provision RPMB key. */
  APP_RPMB_ERASE_COMMAND,            /**< Erase RPMB. */
  APP_RPMB_CHECK_PROV_STATUS_COMMAND /**< Checks the RPMB provisioning status.
                                        */

} AppCmdType;

#define SCM_MAX_NUM_PARAMETERS 10
#define SCM_MAX_NUM_RESULTS 4

/** @cond */
/* Protocol declaration.  */
typedef struct _QCOM_SCM_PROTOCOL QCOM_SCM_PROTOCOL;
/** @endcond */

/*===========================================================================
  FUNCTION DEFINITIONS
===========================================================================*/
/* QCOM_SCM_SYS_CALL */
/** @ingroup efi_scm_sys_call
  @par Summary
  Slow call into TrustZone.

  @param[in]     This  Pointer to the QCOM_SCM_PROTOCOL instance.
  @param[in,out] Cmd   Command data pointer passed into TrustZone.

  @return
  EFI_SUCCESS  -- Function completed successfully. \n
  Other values -- Failure.
*/

typedef EFI_STATUS (EFIAPI *QCOM_SCM_SYS_CALL) (IN QCOM_SCM_PROTOCOL *This,
                                                IN OUT const VOID *Cmd);

/* QCOM_SCM_SIP_SYS_CALL */
/** @ingroup efi_scm_sys_call
  @par Summary
  Slow call into TrustZone.

  @param[in]     This       Pointer to the QCOM_SCM_PROTOCOL instance.
  @param[in]     SmcId      Function ID for the TZ SIP Syscall to be made.
  @param[in]     ParamId    Parameter ID for TZ SIP Syscall.
  @param[in]     Parameters Parameters struct for TZ SIP Sycall.
  @param[out]    Results    Result struct from TZ SIP Syscall.

  @return
  EFI_SUCCESS  -- Function completed successfully. \n
  Other values -- Failure.
*/

typedef EFI_STATUS (EFIAPI *QCOM_SCM_SIP_SYS_CALL) (
    IN QCOM_SCM_PROTOCOL *This,
    IN UINT32 SmcId,
    IN UINT32 ParamId,
    IN UINT64 Parameters[SCM_MAX_NUM_PARAMETERS],
    OUT UINT64 Results[SCM_MAX_NUM_RESULTS]);

/* QCOM_SCM_FAST_CALL_2 */
/** @ingroup efi_scm_fast_call_2
  @par Summary
  Fast call with two parameters.

  @param[in]  This    Pointer to the QCOM_SCM_PROTOCOL instance.
  @param[in]  Id      Token ID.
  @param[in]  Param0  Parameter 0.
  @param[in]  Param1  Parameter 1.

  @return
  EFI_SUCCESS  -- Function completed successfully. \n
  Other values -- Failure.
*/
typedef EFI_STATUS (EFIAPI *QCOM_SCM_FAST_CALL_2) (IN QCOM_SCM_PROTOCOL *This,
                                                   IN UINT32 Id,
                                                   IN UINT32 Param0,
                                                   IN UINT32 Param1);

/* QCOM_SCM_GET_VERSION */
/** @ingroup efi_scm_get_version
  @par Summary
  Calls into TrustZone to get the TrustZone version.

  @param[in]     This     Pointer to the QCOM_SCM_PROTOCOL instance.
  @param[in,out] Version  Pointer to the TrustZone version address.

  @return
  EFI_SUCCESS  -- Function completed successfully. \n
  Other values -- Failure.
*/
typedef EFI_STATUS (EFIAPI *QCOM_SCM_GET_VERSION) (IN QCOM_SCM_PROTOCOL *This,
                                                   IN OUT UINT32 *Version);

/* QCOM_SCM_SEND_COMMAND */
/* This is designed to fit the new TZ 1.4 interface structures.
   Here is how it is used:

  APP_START_APP_CMD            AppId = NULL, Req = &(Your request), Rsp=NULL
  APP_SHUTDOWN_CMD             AppId =&(Your AppID), Req = NULL, Rsp = NULL
  APP_QUERY_APPID_CMD          AppId==&(Your AppID), Req = &(your ascii app name
  string), Rsp=NULL
  APP_REGISTER_LISTENER_CMD    separate interface
  APP_DEREGISTER_LISTENER_CMD  handled internally
  APP_SEND_DATA_CMD            AppId =&(Your AppID), Req = &(Your request), Rsp
  =&(your response)
  APP_LISTENER_DATA_RSP_CMD    handled internally
  APP_PROVISION_RPMB_KEY_COMMAND   AppId=NULL  ,Req=&(your key_type), Rsp !=NULL
  RspLen >=4
  APP_PROVISION_RPMB_KEY_COMMAND   AppId=NULL  ,Req=NULL, ReqLen = 0, Rsp !=NULL
  RspLen >=4
*/
/** @ingroup efi_scm_send_command
  @par Summary
  Interface for sending a command to the SCM DXE.

  @param[in]     This    Pointer to the QCOM_SCM_PROTOCOL instance.
  @param[in]     CmdId   Command type; see #AppCmdType for details.
  @param[in]     AppId   Pointer to the application ID.
  @param[in,out] Req     Request pointer.
  @param[in]     ReqLen  Request data length in bytes.
  @param[in,out] Rsp     Response pointer.
  @param[in]     RspLen  Response data length in bytes.

  @par Description
  The following describes how this function is used:
  - APP_START_APP_CMD
@vertspace{3}
@code
AppId = NULL, Req = &(Your request), Rsp=NULL
@endcode
  - APP_SHUTDOWN_CMD
@vertspace{3}
@code
AppId =&(Your AppID), Req = NULL, Rsp = NULL
@endcode
  - APP_QUERY_APPID_CMD
@vertspace{3}
@code
AppId==&(Your AppID), Req = &(Your ascii app name string), Rsp=NULL
@endcode
  - APP_REGISTER_LISTENER_CMD -- Separate interface
  - APP_DEREGISTER_LISTENER_CMD -- Handled internally
  - APP_SEND_DATA_CMD
@vertspace{3}
@code
AppId =&(Your AppID), Req = &(Your request), Rsp =&(your response)
@endcode
  - APP_LISTENER_DATA_RSP_CMD -- Handled internally
  - APP_PROVISION_RPMB_KEY_COMMAND
@vertspace{3}
@code
AppId=NULL  ,Req=&(your key_type), Rsp !=NULL RspLen >=4
@endcode
  - APP_RPMB_ERASE_COMMAND
@vertspace{3}
@code
AppId=NULL  ,Req=NULL, ReqLen = 0, Rsp !=NULL RspLen >=4
@endcode

  @return
  EFI_SUCCESS  -- Function completed successfully. \n
  Other values -- Failure.
*/
typedef EFI_STATUS (EFIAPI *QCOM_SCM_SEND_COMMAND) (IN QCOM_SCM_PROTOCOL *This,
                                                    IN AppCmdType CmdId,
                                                    IN UINT32 *AppId,
                                                    IN OUT VOID *Req,
                                                    IN UINTN ReqLen,
                                                    IN OUT VOID *Rsp,
                                                    IN UINTN RspLen);

/** @cond */
/* Listener callback function prototype */
typedef EFI_STATUS (*QcomScmListenerCallbackPtr) (IN VOID *CallbackHandle,
                                                  IN VOID *SharedBufferPtr,
                                                  IN UINT32 SharedBufferlen);
/** @endcond */

/* QCOM_SCM_REGISTER_CALLBACK */
/** @ingroup efi_scm_register_callback
  @par Summary
  Calls TrustZone to register a callback function.
  The SCM DXE also keeps a record of this registration.

  @param[in]  This             Pointer to the QCOM_SCM_PROTOCOL instance.
  @param[in]   ListenerID         Listener ID.
  @param[in]  CallbackPtr      Pointer to the callback function.
  @param[in]  CallbackHandle   Handle pointer from the caller.
  @param[in]  SharedBufferPtr  Pointer to the shared buffer.
  @param[in]  SharedBufferLen  Length of the shared buffer.

  @return
  EFI_SUCCESS  -- Function completed successfully. \n
  Other values -- Failure.
*/

typedef EFI_STATUS (EFIAPI *QCOM_SCM_REGISTER_CALLBACK) (
    IN QCOM_SCM_PROTOCOL *This,
    IN UINT32 ListenerID,
    IN QcomScmListenerCallbackPtr CallbackPtr,
    IN VOID *CallbackHandle,
    IN UINT8 *SharedBufferPtr,
    IN UINTN SharedBufferLen);

/* QCOM_SCM_EXIT_BOOT_SERVICES */
/** @ingroup efi_scm_exit_boot_services
  @par Summary
  Callback registered for ExitBootServices.

  @param[in]  This  Pointer to the QCOM_SCM_PROTOCOL instance.

  @return
  EFI_SUCCESS  -- Function completed successfully. \n
  Other values -- Failure.
*/
typedef EFI_STATUS (EFIAPI *QCOM_SCM_EXIT_BOOT_SERVICES) (
    IN QCOM_SCM_PROTOCOL *This);
/*===========================================================================
  PROTOCOL INTERFACE
===========================================================================*/
/** @ingroup efi_scm_protocol
  @par Summary
  Qualcomm Technologies Inc Secure Channel Messaging (SCM) Protocol interface.

  @par Parameters
  @inputprotoparams{scm_proto_params.tex}
*/
struct _QCOM_SCM_PROTOCOL {
  UINT64 Revision;
  QCOM_SCM_SYS_CALL ScmSysCall;
  QCOM_SCM_FAST_CALL_2 ScmFastCall2;
  QCOM_SCM_GET_VERSION ScmGetVersion;
  QCOM_SCM_REGISTER_CALLBACK ScmRegisterCallback;
  QCOM_SCM_SEND_COMMAND ScmSendCommand;
  QCOM_SCM_EXIT_BOOT_SERVICES ScmExitBootServicesHandler;
  QCOM_SCM_SIP_SYS_CALL ScmSipSysCall;
};

#endif /* __EFISCM_H__ */
