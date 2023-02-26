/* Copyright (c) 2017 - 2019, The Linux Foundation. All rights reserved.
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

#ifndef SCM_SIP_INTERFACE_H
#define SCM_SIP_INTERFACE_H

/*----------------------------------------------------------------------------
 * Include Files
 * -------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
 * Documentation
 * -------------------------------------------------------------------------*/

/*   ARMV8 SMC ID bit layout
 ___________________________________________________
|    |     |        |          |          |         |
| 31 |  30 |29----24|23------16|15-------8|7-------0|
|IRQ |AARCH|  Owner | Reserved |Service ID|  Func # |
|____|_____|________|__________|__________|_________|
                               \_________  _________/
                                         \/
                                     Command ID
*/

/*   Parameter ID bit layout
 ___________________________________________________________________________
|          |     |     |     |     |     |     |     |    |    |    |       |
|31------24|23-22|21-20|19-18|17-16|15-14|13-12|11-10|9--8|7--6|5--4|3-----0|
| Reserved | p10 | p9  | p8  | p7  | p6  | p5  | p4  | p3 | p2 | p1 | nargs |
|          |type |type |type |type |type |type |type |type|type|type|       |
|__________|_____|_____|_____|_____|_____|_____|_____|____|____|____|_______|

*/

/** @addtogroup tz_macros_constants
@{ */

/*----------------------------------------------------------------------------
 * Preprocessor Definitions and Constants
 * -------------------------------------------------------------------------*/
/** @name Helper Macros
@{ */
/** General helper macro to create a bitmask from bits low to high. */
#define TZ_MASK_BITS(h,l)     ((0xffffffff >> (32 - ((h - l) + 1))) << l)

/** Helper macro to extract the IRQ settings from SMC ID. */
#define TZ_SYSCALL_IRQ(r0)        ((r0 & TZ_MASK_BITS(31,31)) >> 31)
/** Helper macro to extract the AArch used from SMC ID. */
#define TZ_SYSCALL_AARCH(r0)      ((r0 & TZ_MASK_BITS(30,30)) >> 30)
/** Helper macro to extract the Owning entity from SMC ID. */
#define TZ_SYSCALL_OWNER_ID(r0)   ((r0 & TZ_MASK_BITS(29,24)) >> 24)
/** Helper macro to extract the reserved bits from SMC ID. */
#define TZ_SYSCALL_RESERVED(r0)   ((r0 & TZ_MASK_BITS(23,16)) >> 16)
/** Helper macro to extract the function ID from SMC ID. */
#define TZ_SYSCALL_FUNC_ID(r0)    (r0 & TZ_MASK_BITS(15,0))
/** Helper macro to extract the app ID from SMC ID */
#define TZ_SYSCALL_APP_ID(r0)     ((r0 & TZ_MASK_BITS(15,8)) >> 8)
/** Helper macro to extract SVC ID from function id in SMC ID */
#define TZ_SYSCALL_SVC_ID(r0)     ((r0 & TZ_MASK_BITS(15,8)) >> 8)

/** Helper macro to extract the number of arguments from Param ID */
#define TZ_SYSCALL_NUM_ARGS(r1)   (r1 & TZ_MASK_BITS(3,0))
/** Helper macro to extract an arg type from Param ID. 10 args max */
#define TZ_SYSCALL_ARG_TYPE(r1, n) \
  ((n<10)?((r1 & TZ_MASK_BITS(((n*2)+5),((n*2)+4))) >> ((n * 2) + 4)):0xFFFFFFFF)

/** Helper macro for checking if an owning entity is of type Trusted OS */
#define IS_OWNER_TRUSTED_OS(owner_id) \
  (((owner_id >= 50) && (owner_id <= 63))?TRUE:FALSE)
/** Helper macro for checking if an owning entity is of type TZ APPS */
#define IS_OWNER_TRUSTED_TEE(owner_id) \
  (((owner_id == 51))?TRUE:FALSE)
#define IS_OWNER_TZ_APPS(owner_id) \
  (((owner_id >= 48) && (owner_id <= 49))?TRUE:FALSE)

/**
   Macro used to define an SMC ID based on the owner ID,
   service ID, and function number.
*/
#define TZ_SYSCALL_CREATE_SMC_ID(o, s, f) \
  ((UINT32)((((o & 0x3f) << 24 ) | (s & 0xff) << 8) | (f & 0xff)))

#define TZ_SYSCALL_PARAM_NARGS_MASK  TZ_MASK_BITS(3,0)
#define TZ_SYSCALL_PARAM_TYPE_MASK   TZ_MASK_BITS(1,0)

#define _TZ_SYSCALL_CREATE_PARAM_ID(nargs, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10) \
  ((nargs&TZ_SYSCALL_PARAM_NARGS_MASK)+ \
  ((p1&TZ_SYSCALL_PARAM_TYPE_MASK)<<4)+ \
  ((p2&TZ_SYSCALL_PARAM_TYPE_MASK)<<6)+ \
  ((p3&TZ_SYSCALL_PARAM_TYPE_MASK)<<8)+ \
  ((p4&TZ_SYSCALL_PARAM_TYPE_MASK)<<10)+ \
  ((p5&TZ_SYSCALL_PARAM_TYPE_MASK)<<12)+ \
  ((p6&TZ_SYSCALL_PARAM_TYPE_MASK)<<14)+ \
  ((p7&TZ_SYSCALL_PARAM_TYPE_MASK)<<16)+ \
  ((p8&TZ_SYSCALL_PARAM_TYPE_MASK)<<18)+ \
  ((p9&TZ_SYSCALL_PARAM_TYPE_MASK)<<20)+ \
  ((p10&TZ_SYSCALL_PARAM_TYPE_MASK)<<22))

/**
   Macros used to create the Parameter ID associated with the syscall
 */
#define TZ_SYSCALL_CREATE_PARAM_ID_0 0
#define TZ_SYSCALL_CREATE_PARAM_ID_1(p1) \
  _TZ_SYSCALL_CREATE_PARAM_ID(1, p1, 0, 0, 0, 0, 0, 0, 0, 0, 0)
#define TZ_SYSCALL_CREATE_PARAM_ID_2(p1, p2) \
  _TZ_SYSCALL_CREATE_PARAM_ID(2, p1, p2, 0, 0, 0, 0, 0, 0, 0, 0)
#define TZ_SYSCALL_CREATE_PARAM_ID_3(p1, p2, p3) \
  _TZ_SYSCALL_CREATE_PARAM_ID(3, p1, p2, p3, 0, 0, 0, 0, 0, 0, 0)
#define TZ_SYSCALL_CREATE_PARAM_ID_4(p1, p2, p3, p4) \
  _TZ_SYSCALL_CREATE_PARAM_ID(4, p1, p2, p3, p4, 0, 0, 0, 0, 0, 0)
#define TZ_SYSCALL_CREATE_PARAM_ID_5(p1, p2, p3, p4, p5) \
  _TZ_SYSCALL_CREATE_PARAM_ID(5, p1, p2, p3, p4, p5, 0, 0, 0, 0, 0)
#define TZ_SYSCALL_CREATE_PARAM_ID_6(p1, p2, p3, p4, p5, p6) \
  _TZ_SYSCALL_CREATE_PARAM_ID(6, p1, p2, p3, p4, p5, p6, 0, 0, 0, 0)
#define TZ_SYSCALL_CREATE_PARAM_ID_7(p1, p2, p3, p4, p5, p6, p7) \
  _TZ_SYSCALL_CREATE_PARAM_ID(7, p1, p2, p3, p4, p5, p6, p7, 0, 0, 0)
#define TZ_SYSCALL_CREATE_PARAM_ID_8(p1, p2, p3, p4, p5, p6, p7, p8) \
  _TZ_SYSCALL_CREATE_PARAM_ID(8, p1, p2, p3, p4, p5, p6, p7, p8, 0, 0)
#define TZ_SYSCALL_CREATE_PARAM_ID_9(p1, p2, p3, p4, p5, p6, p7, p8, p9) \
  _TZ_SYSCALL_CREATE_PARAM_ID(9, p1, p2, p3, p4, p5, p6, p7, p8, p9, 0)
#define TZ_SYSCALL_CREATE_PARAM_ID_10(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10) \
  _TZ_SYSCALL_CREATE_PARAM_ID(10, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)

#define TZBSP_GET_NARGS(param_id) (param_id & 0xF)

/** @} */ /* end_namegroup Helper Macros */

/*----------------------------------------------------------------------------
 * Parameter ID values
 * -------------------------------------------------------------------------*/
/** @name Parameter ID values
@{ */

/** A parameter of type value */
#define TZ_SYSCALL_PARAM_TYPE_VAL              0x0
/** A parameter of type buffer read-only */
#define TZ_SYSCALL_PARAM_TYPE_BUF_RO           0x1
/** A parameter of type buffer read-write */
#define TZ_SYSCALL_PARAM_TYPE_BUF_RW           0x2

/** @} */ /* end_namegroup Parameter ID values */

/*----------------------------------------------------------------------------
 * Owning Entity IDs (defined by ARM SMC doc)
 * -------------------------------------------------------------------------*/

/** @name Owning Entity IDs
 @{ */

/** ARM Architecture call ID */
#define TZ_OWNER_ARM                     0
/** CPU service call ID */
#define TZ_OWNER_CPU                     1
/** SIP service call ID */
#define TZ_OWNER_SIP                     2
/** OEM service call ID */
#define TZ_OWNER_OEM                     3
/** Standard service call ID */
#define TZ_OWNER_STD                     4

/** Values 5-47 are reserved for future use */

/** Trusted Application call IDs */
#define TZ_OWNER_TZ_APPS                 48
#define TZ_OWNER_TZ_APPS_RESERVED        49
/** Trusted OS Call IDs */
#define TZ_OWNER_QSEE_OS                 50
#define TZ_OWNER_MOBI_OS                 51
#define TZ_OWNER_OS_RESERVED_3           52
#define TZ_OWNER_OS_RESERVED_4           53
#define TZ_OWNER_OS_RESERVED_5           54
#define TZ_OWNER_OS_RESERVED_6           55
#define TZ_OWNER_OS_RESERVED_7           56
#define TZ_OWNER_OS_RESERVED_8           57
#define TZ_OWNER_OS_RESERVED_9           58
#define TZ_OWNER_OS_RESERVED_10          59
#define TZ_OWNER_OS_RESERVED_11          60
#define TZ_OWNER_OS_RESERVED_12          61
#define TZ_OWNER_OS_RESERVED_13          62
#define TZ_OWNER_OS_RESERVED_14          63

/** @} */ /* end_namegroup Owning Entity IDs */

/*----------------------------------------------------------------------------
 * Service IDs
 * -------------------------------------------------------------------------*/

 /** @name Service IDs
 @{ */

#define TZ_SVC_INFO_CALL_ID   255

/** ARM Architecture call groups */
#define TZ_SVC_ARM_INFO           TZ_SVC_INFO_CALL_ID /* ARM syscall info   */

/** CPU service call groups */
#define TZ_SVC_CPU_INFO           TZ_SVC_INFO_CALL_ID /* CPU syscall info   */

/** SIP service call groups */
#define TZ_SVC_BOOT               1       /* Boot (cold boot/warm boot).    */
#define TZ_SVC_PIL                2       /* Peripheral image loading.      */
#define TZ_SVC_DUMP               3       /* Memory dumping.                */
#define TZ_SVC_RES_LOCKING        4       /* Resource locking.              */
#define TZ_SVC_IO_ACCESS          5       /* I/O protection.                */
#define TZ_SVC_INFO               6       /* Misc. information services.    */
#define TZ_SVC_SSD                7       /* SSD services.                  */
#define TZ_SVC_FUSE               8       /* Fuse services.                 */
#define TZ_SVC_POWER              9       /* Power related services.        */
#define TZ_SVC_CRYPTO             10      /* Crypto services.               */
#define TZ_SVC_SC_KEY_EXCHANGE    11      /* Secure channel key exchange.   */
#define TZ_SVC_MEMORY_PROTECTION  12      /* Memory protection service.     */
#define TZ_SVC_RESERVED_0         13      /* Reserved service ID.           */
#define TZ_SVC_NS_DEBUG_FIQ       14      /* Nonsecure debug FIQ.           */
#define TZ_SVC_OCMEM              15      /* OCMEM service.                 */
#define TZ_SVC_ES                 16      /* Enterprise-Security service    */
#define TZ_SVC_HDCP               17      /* HDCP service.                  */
#define TZ_SVC_MDTP               18      /* MDTP service.                  */
#define TZ_SVC_LMH                19      /* LMh Private driver             */
#define TZ_SVC_READ_DBG_POLICY    20      /* dbg_policy content retrieval   */
#define TZ_SVC_SMMU_PROGRAM       21      /* SMMU services.                 */
#define TZ_SVC_STORAGE            26      /* Storage Service.               */
#define TZ_SVC_TPM_INFO           32      /* TPM INFO service ID            */
#define TZ_SVC_TEST_1             253     /* TZT calls (continued)          */
#define TZ_SVC_TEST_0             254     /* TZT calls                      */
#define TZ_SVC_SIP_INFO           TZ_SVC_INFO_CALL_ID /* SIP syscall info   */

/** OEM service call groups */
#define TZ_SVC_OEM_INFO           TZ_SVC_INFO_CALL_ID /* OEM syscall info   */

/** Standards call groups */
#define TZ_SVC_STANDARD_INFO      TZ_SVC_INFO_CALL_ID /* Standard info      */

/** Trusted OS: QSEE call groups */
#define TZ_SVC_APP_MGR            1       /* Application management         */
#define TZ_SVC_LISTENER           2       /* Listener service management    */
#define TZ_SVC_EXTERNAL           3       /* External image loading         */
#define TZ_SVC_RPMB               4       /* Replay Protected Memory Block  */
#define TZ_SVC_KEYSTORE           5       /* Keystore management            */
#define TZ_SVC_QSEE_OS_INFO       TZ_SVC_INFO_CALL_ID /* Trusted OS info    */

/** Trusted OS: Mobicore call groups */
#define TZ_SVC_EXECUTIVE_EXT      250     /* Third party OS                 */
#define TZ_SVC_MOBI_OS_INFO       TZ_SVC_INFO_CALL_ID /* Trusted OS info    */

/** Trusted Application call groups */
#define TZ_SVC_APP_ID_PLACEHOLDER 0     /* SVC bits will be empty           */

/** @} */ /* end_namegroup Service IDs */

/** @} */ /* end_addtogroup tz_macros_constants */

/*----------------------------------------------------------------------------
 * Command IDs
 * -------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
                PSCI Command IDs: Do not reuse
 * -------------------------------------------------------------------------*/
#define PSCI_VERSION_ID                  \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_STD, 0x0, 0x0)
#define CPU_SUSPEND_ID                  \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_STD, 0x0, 0x1)
#define CPU_OFF_ID                  \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_STD, 0x0, 0x2)
#define CPU_ON_ID                  \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_STD, 0x0, 0x3)
#define AFFINITY_INFO_ID                  \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_STD, 0x0, 0x4)
#define MIGRATE_ID                  \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_STD, 0x0, 0x5)
#define MIGRATE_INFO_TYPE_ID                  \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_STD, 0x0, 0x6)
#define MIGRATE_INFO_UP_CPU_ID                  \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_STD, 0x0, 0x7)
#define SYSTEM_OFF_ID                  \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_STD, 0x0, 0x8)
#define SYSTEM_RESET_ID                  \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_STD, 0x0, 0x9)
#define CPU_FREEZE                   \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_STD, 0x0, 0xB)
#define CPU_DEFAULT_SUSPEND          \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_STD, 0x0, 0xC)


/*----------------------------------------------------------------------------
                Deprecated Command IDs: Do not reuse
 * -------------------------------------------------------------------------*/
#define TZ_SET_BOOT_ADDR_OLD_ID                  \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_BOOT, 0x01)

/**
   @ingroup terminate_pwr_collapse

   Called to terminate power collapse. The QSEE configures the
   processor, then issues the Wait For Interrupt (WFI) instruction.

   @note1hang Implementation takes place entirely in Monitor mode.

   @smc_id
     0x02000102

   @param_id
    0x00000001

   @return
     None.
*/
#define TZ_POWER_COLLAPSE_ID                     \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_BOOT, 0x02)

#define TZ_POWER_COLLAPSE_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_1( TZ_SYSCALL_PARAM_TYPE_VAL )



/*----------------------------------------------------------------------------
                Deprecated Command IDs: Do not reuse
 * -------------------------------------------------------------------------*/
#define TZ_BOOT_DEPRECATED_0                     \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_BOOT, 0x03)

/**
   @ingroup krait_errata_21_workaround_enable

   Monitor call to enable the Krait errata #21 workaround. This
   workaround sets BPCR[FBHTD]=1 and does the required branch
   predictor maintenance.

   @note1hang Implementation takes place entirely in Monitor mode.

   @smc_id
     0x02000104

   @param_id
     0x00000000

   @return
     E_SUCCESS (always).
*/
#define TZ_KRAIT_ERRATA_21_WORKAROUND_ENABLE_ID \
        TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_BOOT, 0x04)

#define TZ_KRAIT_ERRATA_21_WORKAROUND_ENABLE_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_0

/**
   @ingroup cpu_config

   Cold and warm boot time CPU configuration service.

   @smc_id
     0x02000105

   @param_id
     0x00000004

   @sys_call_params{tz_cpu_config_req_s}
     @table{weak__tz__cpu__config__req__s}

   @return
     Zero on success; a negative value on failure.
*/
#define TZ_CPU_CONFIG_ID \
        TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_BOOT, 0x05)

#define TZ_CPU_CONFIG_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_4( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup cpu_config_query

   Service for querying CPU configuration.

   @smc_id
     0x02000106

   @param_id
     0x00002004

   @sys_call_req_params{tz_cpu_config_query_req_s}
     @table{weak__tz__cpu__config__query__req__s}

   @sys_call_rsp_params{tz_cpu_config_query_rsp_s}
     @table{weak__tz__cpu__config__query__rsp__s}

   @return
     Zero on success; a negative value on failure.
*/
#define TZ_CPU_CONFIG_QUERY_ID \
        TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_BOOT, 0x06)

#define TZ_CPU_CONFIG_QUERY_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_4( \
      TZ_SYSCALL_PARAM_TYPE_VAL,    TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL,    TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup secure_wdog_disable

   Subroutine used by the HLOS to disable, or enable, the secure watchdog.
   This call is a NOP when debug functionality is disabled.

   @smc_id
     0x02000107

   @param_id
     0x00000001

   @sys_call_params{tz_secure_wdog_disable_req_s}
     @table{weak__tz__secure__wdog__disable__req__s}

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define TZ_SECURE_WDOG_DISABLE_ID                \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_BOOT, 0x07)

#define TZ_SECURE_WDOG_DISABLE_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_1( TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup secure_wdog_trigger

   Subroutine used by the HLOS to trigger a secure watchdog and reset
   the device. This call is a NOP when debug functionality is
   disabled.

   @smc_id
     0x02000108

   @param_id
     0x00000001

   @sys_call_params{tz_secure_wdog_trigger_req_s}
     @table{weak__tz__secure__wdog__trigger__req__s}

   @return
     An error code if parameters are invalid or watchdog
     reset is not permitted; does not return otherwise.
*/
#define TZ_SECURE_WDOG_TRIGGER_ID                \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_BOOT, 0x08)

#define TZ_SECURE_WDOG_TRIGGER_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_1( TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup config_hw_for_offline_ram_dump

   Subroutine used by the HLOS to configure hardware registers
   BOOT_PARTITION_SELECT and WDOG_DEBUG_EN for an offline RAM dump.

   @smc_id
     0x02000109

   @param_id
     0x00000002

   @sys_call_params{tz_config_hw_for_ram_dump_req_s}
     @table{weak__tz__config__hw__for__ram__dump__req__s}

   @return
     Zero on success; an error code if parameters are invalid or if xPU
     reconfiguration is not permitted.
*/
#define TZ_CONFIG_HW_FOR_RAM_DUMP_ID                \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_BOOT, 0x09)

#define TZ_CONFIG_HW_FOR_RAM_DUMP_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup video_cpu_set_state

   Controls changing the state of the Venus core (e.g. suspend/resume),
   without full subsystem restarts

   @smc_id
     0x0200010a

   @param_id
     0x00000002

   @sys_call_params{tz_video_set_state_req_s}
     @table{weak__tz__video__set__state__req__s}

   @sys_call_params{tz_video_set_state_rsp_s}
     @table{weak__tz__video__set__state__rsp__s}

   @return
     Zero on success; negative value on failure.
*/
#define TZ_VIDEO_SET_STATE_ID TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_BOOT, 0x0A)

#define TZ_VIDEO_SET_STATE_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup lock_xpu_peripheral

   Subroutine used by external bootloaders to request TZ to lock
   peripheral image area

   @smc_id
     0x0200010b

   @param_id
     0x00000003

   @sys_call_params{tz_lock_xpu_s}
     @table{weak__tz__lock__xpu__s}

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define TZ_XPU_LOCK_ID                      \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_BOOT, 0x0b)

/* TODO Syscall does not exist */
#define TZ_XPU_LOCK_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_3( \
    TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
    TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup spin_with_irqs_fiqs_disabled

   If secure watchdog debug is allowed, calling this syscall masks IRQs and
   FIQs and starts spinning in TZ and won't return. If secure watchdog debug is
   not allowed, the call will return without side effects.

   @smc_id
     0x0200010D

   @param_id
     0x00000001

   @sys_call_params{tz_spin_with_irqs_fiqs_disabled_s}
     @table{weak__tz__spin__with__irqs__fiqs__disabled__s}

   @return
     Zero on success; an error code if parameters are invalid or if xPU
     reconfiguration is not permitted.
*/

#define TZ_SPIN_WITH_IRQS_FIQS_DISABLED_ID          \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_BOOT, 0x0D)

#define TZ_SPIN_WITH_IRQS_FIQS_DISABLED_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_1( TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup set_milestone

   Subroutine used by external bootloaders to indicate the end
   of the bootloading stage, which is the beginning of HLOS booting.

   @smc_id
     0x0200010E

   @param_id
     0x00000003

   @sys_call_params{tz_set_milestone_s}
     @table{weak__tz__set__milestone__s}

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define TZ_MILESTONE_SET_ID                      \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_BOOT, 0x0E)

#define TZ_MILESTONE_SET_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_3( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup Do mode switch

   Used by Apps BL to switch EL1 mode to A64

   @smc_id
     0x0000010F

   @param_id
     0x00000012

   @sys_call_params{tz_do_modeswitch_s}
     @table{weak__tz__do__modeswitch__s}

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define TZ_DO_MODE_SWITCH                      \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_BOOT, 0x0F)

#define TZ_DO_MODE_SWITCH_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RO, TZ_SYSCALL_PARAM_TYPE_VAL )

/*----------------------------------------------------------------------------
                Deprecated Command IDs: Do not reuse
 * -------------------------------------------------------------------------*/
/* Functionality moved to Secure IO syscall for atomicity */
#define TZ_FORCE_DLOAD_ID                              \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_BOOT, 0x10)

#define TZ_FORCE_DLOAD_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup set_boot_addr

   Sets the address of execution for the nonsecure execution
   environment after a CPU is brought out of reset.

   @smc_id
     0x02000111

   @param_id
     0x00000006

   @sys_call_params{tz_set_boot_addr_s}
     @table{weak__tz__set__boot__addr__s}

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define TZ_SET_BOOT_ADDR_ID                      \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_BOOT, 0x11)

#define TZ_SET_BOOT_ADDR_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_6( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @weakgroup weak_tz_get_ablfv_entry_point_rsp_s
@{
*/
/**
   @ingroup get_ablfv_entry_point

   Get the entry point of the Apps Boot Loader Firmware Volume
   (ABL.FV) image for UEFI. Can only be called once per cold boot.

   @smc_id
     0x02000113

   @param_id
     0x00000000

   @sys_call_params{tz_get_ablfv_entry_point_rsp_s}
     @table{weak__tz__get__ablfv__entry__point__rsp__s}

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define TZ_GET_IMAGE_ENTRY_POINT_ID                      \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_BOOT, 0x13)

#define TZ_GET_IMAGE_ENTRY_POINT_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_0  

/**
   @ingroup init_image_syscall

   Verifies whether the memory at the specified Executable and Linkable
   Format (ELF) header pointer is a valid ELF file. Once that has been
   verified, the QSEE copies the ELF header, program header, and hash
   segment into secure memory.

   @smc_id
     0x02000201

   @param_id
     0x00000082

   @sys_call_params{tz_pil_init_req_s}
     @table{weak__tz__pil__init__req__s}

   @return
     Zero on success; a negative value on failure.
*/
#define TZ_PIL_INIT_ID TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_PIL,  0x01)

#define TZ_PIL_INIT_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_BUF_RW )

/**
   @ingroup get_pil_mem_usage

   Confirms whether the memory region used to load the specified
   peripheral image matches the static region that the QSEE supports
   for the specified region, and that the region is appropriate for the
   ELF header specified in the secure Peripheral Image Loader (PIL)
   initialization call.

   @smc_id
     0x02000202

   @param_id
     0x00000003

   @sys_call_params{tz_pil_mem_req_s}
     @table{weak__tz__pil__mem__req__s}

   @return
     Zero on success; a negative value on failure.
*/
#define TZ_PIL_MEM_ID TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_PIL,  0x02)

#define TZ_PIL_MEM_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_3( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL )

/** @cond */

/*----------------------------------------------------------------------------
                Deprecated Command IDs: Do not reuse
 * -------------------------------------------------------------------------*/
#define TZ_PIL_DEPRECATED_0 TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_PIL,  0x03)
#define TZ_PIL_DEPRECATED_1 TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_PIL,  0x04)
/** @endcond */

/**
   @ingroup auth_reset

   Authenticates and releases the specified peripheral from reset.
   The QSEE also protects the memory region for the specified
   peripheral image with a Memory Protection Unit (MPU).

   @smc_id
     0x02000205

   @param_id
     0x00000001

   @sys_call_params{tz_pil_auth_reset_req_s}
     @table{weak__tz__pil__auth__reset__req__s}

   @return
     Zero on success; a negative value on failure.
*/
#define TZ_PIL_AUTH_RESET_ID                     \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_PIL,  0x05)

#define TZ_PIL_AUTH_RESET_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_1( TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup unlock_xpu

   Stops the specified peripheral, then clears the peripheral image
   location and unlocks the memory area occupied by that region.

   @smc_id
     0x02000206

   @param_id
     0x00000001

   @sys_call_params{tz_pil_unlock_req_s}
     @table{weak__tz__pil__unlock__req__s}

   @return
     Zero on success; a negative value on failure.
*/
#define TZ_PIL_UNLOCK_XPU_ID                     \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_PIL,  0x06)

#define TZ_PIL_UNLOCK_XPU_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_1( TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup is_subsys_supported

   Queries whether the QSEE supports secure PIL for a specified
   subsystem.

   @smc_id
     0x02000207

   @param_id
     0x00000001

   @sys_call_req_params{tz_pil_subsystem_query_req_s}
     @table{weak__tz__pil__subsystem__query__req__s}

   @sys_call_rsp_params{tz_pil_subsystem_query_rsp_s}
     @table{weak__tz__pil__subsystem__query__rsp__s}

   @return
     E_SUCCESS if the request was successful; an error code otherwise.
*/
#define TZ_PIL_IS_SUBSYS_SUPPORTED_ID            \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_PIL,  0x07)

#define TZ_PIL_IS_SUBSYS_SUPPORTED_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_1( TZ_SYSCALL_PARAM_TYPE_VAL)

/**
   @ingroup is_subsys_mandated

   Queries whether QSEE security settings make it secure to the point
   where a PIL is required for the specified subsystem.

   @smc_id
     0x02000208

   @param_id
     0x00000001

   @sys_call_params
     Same request and response parameters as for
     #TZ_PIL_IS_SUBSYS_SUPPORTED_ID.

   @return
     E_SUCCESS if the request was successful; an error code otherwise.
*/
#define TZ_PIL_IS_SUBSYS_MANDATED_ID             \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_PIL,  0x08)

#define TZ_PIL_IS_SUBSYS_MANDATED_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_1( TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup get_mem_area

   Queries the start and end addresses in which subsystems are allowed
   to be loaded.

   @smc_id
     0x02000209

   @param_id
     0x00000001

   @sys_call_req_params{tz_pil_mem_area_query_req_s}
     @table{weak__tz__pil__mem__area__query__req__s}

   @sys_call_rsp_params{tz_pil_mem_area_query_rsp_s}
     @table{weak__tz__pil__mem__area__query__rsp__s}

   @return
     E_SUCCESS if the request was successful; error code otherwise.
*/
#define TZ_PIL_GET_MEM_AREA_ID                   \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_PIL,  0x09)

#define TZ_PIL_GET_MEM_AREA_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_1( TZ_SYSCALL_PARAM_TYPE_VAL)

/**
   @ingroup tzbsp_pil_modem_restart

   System call for modem start and stop. This is 8916
   specific but added in pil group on HLOS request.

   @smc_id
     0x0200020A

   @param_id
     0x00000002

    @sys_call_params{tz_pil_modem_restart_req_s}
     @table{weak__tz__pil__modem__restart__req__s}

   @return
     E_SUCCESS on success; a negative value on failure.
 */

#define TZ_PIL_MSS_RESTART_ID                     \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_PIL, 0x0A)

#define TZ_PIL_MSS_RESTART_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL )


/**
   @ingroup share_memory

   Configures xPUs to share/unshare HLOS memory with a specified subsystem.

   @smc_id
     0x0200020B

   @param_id
     0x00000004

   @sys_call_params{tz_pil_share_memory_s}
     @table{weak__tz__pil__share_memory__req__s}

   @return
     E_SUCCESS on success; a negative value on failure.
*/
#define TZ_PIL_SHARE_MEMORY_ID              \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_PIL,  0x0B)

#define TZ_PIL_SHARE_MEMORY_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_4( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL )

/*
   Deprecated: This command is no longer supported.
*/
#define TZ_DUMP_WRITE_LPASS_QDSP6_NMI_ID         \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_DUMP, 0x01)

/**
   @ingroup set_wdt_buff_addr

   System call for the nonsecure side to set the Watchdog Timer (WDT)
   reset context dump buffer address.

   @smc_id
     0x02000302

   @param_id
     0x00000022

   @sys_call_params{tz_dump_set_cpu_ctx_buf_req_s}
     @table{weak__tz__dump__set__cpu__ctx__buf__req__s}

   @return
     E_SUCCESS if the call succeeded; an error code otherwise.
*/
#define TZ_DUMP_SET_CPU_CTX_BUF_ID               \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_DUMP, 0x02)

#define TZ_DUMP_SET_CPU_CTX_BUF_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL )

/*
   Deprecated: Use of this command is no longer supported
*/
#define TZ_DUMP_WRITE_MSS_QDSP6_NMI_ID           \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_DUMP, 0x03)

/**
   @ingroup set_l1_dump_buffer

   System call for the nonsecure side to set the L1 dump buffer address.

   @smc_id
     0x02000304

   @param_id
     0x00000022

   @sys_call_params{tz_dump_set_cache_buf_req_s}
     @table{weak__tz__dump__set__cache__buf__req__s}

   @return
     E_SUCCESS if the call succeeded; an error code otherwise.
*/
#define TZ_DUMP_SET_L1_DUMP_BUF_ID \
        TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_DUMP, 0x04)

#define TZ_DUMP_SET_L1_DUMP_BUF_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup cache_dump_request

   Monitor call to request L0/L1/L2 cache dumping. Cache
   dumping is ignored if fuse settings indicate that secure boot
   is enabled or debug is disabled.

   A request to dump L0/L1 is assumed to indicate a fatal error condition
   in the nonsecure side. D-caches are not cleared before resetting the
   device. Entry to Download mode is controlled by the Download mode
   magic numbers that are controlled by the HLOS.

   @note1hang Implementation takes place entirely in Monitor mode. \n
   @note1hang This command uses a register-based QSEE interface.

   @smc_id
     0x02000305

   @param_id
     0x00000001

   @param[in]     0 -- Handle an L1 dump request similar to a WDT bark,
                       resulting in an L0/L1 cache dump, CPU context dumps
                       and a device reset. \n
                  1 -- Dump the L1 cache and return to the HLOS only after
                       the dump is done. \n
                  2 -- Only dump the L2 cache and return to HLOS after the
                       dump is done. \n
                  Any other value for r2 returns -4 (E_NOT_SUPPORTED).

   @return
     E_SUCCESS if the call succeeded; an error code otherwise.
*/
#define TZ_DUMP_REQUEST_CACHE_DUMP_ID \
        TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_DUMP, 0x05)

#define TZ_DUMP_REQUEST_CACHE_DUMP_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_1( TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup query_l1_buffer_size

   System call for the nonsecure side to query the L1 dump buffer size.

   @smc_id
     0x02000306

   @param_id
     0x00000083

   @sys_call_req_params{tz_dump_query_cache_buf_size_req_s}
     @table{weak__tz__dump__query__cache__buf__size__req__s}

   @sys_call_rsp_params{tz_dump_query_cache_buf_size_rsp_s}
     @table{weak__tz__dump__query__cache__buf__size__rsp__s}

   @return
     E_SUCCESS if the call succeeded; an error code otherwise.
*/
#define TZ_DUMP_QUERY_L1_DUMP_BUF_SIZE_ID \
        TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_DUMP, 0x06)

#define TZ_DUMP_QUERY_L1_DUMP_BUF_SIZE_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_3( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_BUF_RW, \
      TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup set_l2_dump_buffer

   System call for for the nonsecure side to set the L2 dump buffer address.

   @smc_id
     0x02000307

   @param_id
     0x00000002

   @sys_call_params{tz_dump_set_cache_buf_req_s}
     @table{weak__tz__dump__set__cache__buf__req__s}

   @return
     E_SUCCESS if the call succeeded; an error code otherwise.
*/
#define TZ_DUMP_SET_L2_DUMP_BUF_ID \
        TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_DUMP, 0x07)

#define TZ_DUMP_SET_L2_DUMP_BUF_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup query_l2_buffer_size

   System call for the nonsecure side to query the L2 dump buffer size.

   @smc_id
     0x02000308

   @param_id
     0x00000083

   @sys_call_req_params{tz_dump_query_cache_buf_size_req_s}
     @table{weak__tz__dump__query__cache__buf__size__req__s}

   @sys_call_rsp_params{tz_dump_query_cache_buf_size_rsp_s}
     @table{weak__tz__dump__query__cache__buf__size__rsp__s}

   @return
     SUCCESS if the call succeeded; an error code otherwise.
*/
#define TZ_DUMP_QUERY_L2_DUMP_BUF_SIZE_ID \
        TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_DUMP, 0x08)

#define TZ_DUMP_QUERY_L2_DUMP_BUF_SIZE_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_3( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_BUF_RW, \
      TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup set_ocmem_dump_buf

   System call for the nonsecure side to set the OCMEM dump buffer address.

   @smc_id
     0x02000309

   @param_id
     0x00000022

   @sys_call_req_params{tz_dump_set_ocmem_buf_req_s}
     @table{weak__tz__dump__set__ocmem__buf__req__s}

   @return
     SUCCESS if the call succeeded; an error code otherwise.
*/
#define TZ_DUMP_SET_OCMEM_DUMP_BUF_ID \
        TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_DUMP, 0x09)

#define TZ_DUMP_SET_OCMEM_DUMP_BUF_ID_PARAM_ID \
    TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup query_ocmem_dump_buf_size

   System call for the nonsecure side to query the OCMEM dump buffer size.

   @smc_id
     0x0200030A

   @param_id
     0x00000083

   @sys_call_req_params{tz_dump_query_ocmem_buf_size_req_s}
     @table{weak__tz__dump__query__ocmem__buf__size__req__s}

   @sys_call_rsp_params{tz_dump_query_ocmem_buf_size_rsp_s}
     @table{weak__tz__dump__query__ocmem__buf__size__rsp__s}

   @return
     SUCCESS if the call succeeded; an error code otherwise.
*/
#define TZ_DUMP_QUERY_OCMEM_DUMP_BUF_SIZE_ID \
        TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_DUMP, 0x0A)

#define TZ_DUMP_QUERY_OCMEM_DUMP_BUF_SIZE_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_3( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_BUF_RW, \
      TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup security_allows_mem_dump

   System call for the SBL to determine whether memory dumping
   (i.e., DLOAD mode) is allowed.

   @smc_id
     0x0200030b

   @param_id
     0x00000022

   @sys_call_req_params{tz_security_allows_mem_dump_legacy_req_s}
     @table{weak__tz__security__allows__mem__dump__legacy__req__s}

   @return
     SUCCESS if the call succeeded; an error code otherwise.
*/
#define TZ_DUMP_SECURITY_ALLOWS_MEM_DUMP_LEGACY_ID \
        TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_DUMP, 0x0B)

#define TZ_DUMP_SECURITY_ALLOWS_MEM_DUMP_LEGACY_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup smmu_dump_fault_syndrome

   System call for dumping the SMMU fault syndrome registers.

   @note1hang
     SMMU clocks must be ON.

   @smc_id
     0x0200030c

   @param_id
     0x00000204

   @sys_call_req_params{tz_smmu_fault_regs_dump_req_s}
     @table{weak__tzbsp__smmu__fault__regs__dump__req__s}

   @return
     SUCCESS if the call succeeded; error code otherwise.
*/
#define TZ_DUMP_SMMU_FAULT_REGS_ID \
        TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_DUMP, 0x0C)

#define TZ_DUMP_SMMU_FAULT_REGS_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_4( \
      TZ_SYSCALL_PARAM_TYPE_VAL,    TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup security_is_retail_unlock

   System call for the SBL to determine whether retail unlock is enable.

   @smc_id
     0x0200030d

   @param_id
     0x00000022

   @sys_call_req_params{tz_security_is_retail_unlock_req_s}
     @table{weak__tz__security__is__retail__unlock__req__s}

   @return
     SUCCESS if the call succeeded; an error code otherwise.
*/
#define TZ_DUMP_IS_RETAIL_UNLOCK_ID \
        TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_DUMP, 0x0D)

#define TZ_DUMP_IS_RETAIL_UNLOCK_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup

   System call for UEFI to dump the TZ diag.

   @smc_id
     0x0200030e

   @param_id
     0x00000002

   @sys_call_req_params{tz_set_address_to_dump_tz_diag_for_uefi_req_s}
     @table{weak__tz__set__address__to__dump__tz__diag__for__uefi__req__s}

    @return
     SUCCESS if the call succeeded; an error code otherwise.
   */

#define TZ_DUMP_SET_ADDRESS_TO_DUMP_TZ_DIAG_FOR_UEFI \
        TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_DUMP, 0x0E)

#define TZ_DUMP_SET_ADDRESS_TO_DUMP_TZ_DIAG_FOR_UEFI_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup  tzbsp_rpm_online_dump
  
   Notification to RPM to make its memory available to read by HLOS
   without resetting the device.
     
   @smc_id
     0x02000c0f
 
   @param_id
     0x00000001
 
   @sys_call_req_params{tz_rpm_online_dump_req_s}
     @table{weak__tz__rpm__online__dump__req__s}

   @return
     SUCCESS if the call succeeded; an error code otherwise.
  */
#define TZ_DUMP_RPM_ONLINE_ID \
        TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_DUMP, 0x0F)        
      
#define TZ_DUMP_RPM_ONLINE_PARAM_ID \
        TZ_SYSCALL_CREATE_PARAM_ID_1( TZ_SYSCALL_PARAM_TYPE_VAL )    
  
/**
   @ingroup security_allows_mem_dump

   System call for the SBL to determine whether memory dumping
   (i.e., DLOAD mode) is allowed.

   @smc_id
     0x0200030f

   @param_id
     0x00000000

   @sys_call_rsp_params{tz_security_allows_mem_dump_rsp_s}
     @table{weak__tz__security__allows__mem__dump__rsp__s}

    @return
     SUCCESS if the call succeeded; an error code otherwise.
*/
#define TZ_DUMP_SECURITY_ALLOWS_MEM_DUMP_ID \
        TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_DUMP, 0x10)

#define TZ_DUMP_SECURITY_ALLOWS_MEM_DUMP_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_0
   
    
/**
   @ingroup lock_shared_resource

   Locks a shared hardware resource.

   @smc_id
     0x02000401

   @param_id
     0x00000000

   @sys_call_req_params{tz_lock_resource_req_s}
     @table{weak__tz__lock__resource__req__s}

   @sys_call_rsp_params{tz_lock_resource_rsp_s}
     @table{weak__tz__lock__resource__rsp__s}

   @return
    Zero if the return code status is filled. \n
    E_BAD_ADDRESS if the return parameter address is bad or wrong. \n
    E_NOT_SUPPORTED if the wrong resource type is passed. \n
    E_INVALID_ARG if the lock is not a value of 0 or 1.
*/
#define TZ_RESOURCE_LOCK_ID                              \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_RES_LOCKING, 0x01)

/* TODO Syscall does not exist */
#define TZ_RESOURCE_LOCK_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_0

/**
   @ingroup change_resource_config

   System call to change resource configuration dynamically.

   @smc_id
     0x02000402

   @param_id
     0x00000002

   @sys_call_params{tz_config_resource_req_s}
     @table{weak__tz__config__resource__req__s}

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define TZ_RESOURCE_CONFIG_ID                            \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_RES_LOCKING, 0x02)

#define TZ_RESOURCE_CONFIG_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
  @ingroup blsp_modify_ownership

  @smc_id
    0x02000403

  @param_id
    0x00000002

  @sys_call_req_params{tz_modify_ownership_req_s}
     @table{weak__tz__modify__ownership__req__s}

  @return
    E_SUCCESS if success; else error code.
*/
#define TZ_BLSP_MODIFY_OWNERSHIP_ID                      \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_RES_LOCKING, 0x03)

#define TZ_BLSP_MODIFY_OWNERSHIP_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup unlock_debug_register

   System call to unlock debug register for QDSS

   @note1hang TZ will keep a persistent vote on QDSS clocks after calling this API
   
   @smc_id
     0x02001004

   @param_id
     0x00000000

   @return
     E_SUCCESS on success
*/
#define TZ_UNLOCK_DBG_REG                                \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_RES_LOCKING, 0x04)

#define TZ_UNLOCK_DBG_REG_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_0


/**
   @ingroup io_access_read

   Allows reading of memory areas that fall under Memory/Area/Register
   Protection Unit (xPU) protection but do not need to be secured.

   @note1hang Implementation takes place entirely in Monitor mode. \n

   @smc_id
     0x02000501

   @param_id
     0x00000001

   @param[in]  Address to be read.
   @param[out] Value at that address.

   @return
     Zero on success, negative otherwise.
*/
#define TZ_IO_ACCESS_READ_ID                           \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_IO_ACCESS, 0x01)

#define TZ_IO_ACCESS_READ_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_1( TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup io_access_write

   Allows writing to memory areas that fall under xPU protection
   but do not need to be secured.

   @note1hang Implementation takes place entirely in Monitor mode. \n

   @smc_id
     0x02000502

   @param_id
     0x00000002

   @param[in]  Address to be written.
   @param[in]  Value to write to address.

   @return
     E_INVALID_ARG on failure; zero otherwise.
*/
#define TZ_IO_ACCESS_WRITE_ID                          \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_IO_ACCESS, 0x02)

#define TZ_IO_ACCESS_WRITE_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL )

/*
 * Reserved ID.
 */
#define TZ_IO_ACCESS_RESERVED_3_ID                     \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_IO_ACCESS, 0x03)

/*
 * Reserved ID.
 */
#define TZ_IO_ACCESS_RESERVED_4_ID                     \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_IO_ACCESS, 0x04)

/**
   @ingroup is_svc_avail

   Checks if a system call is available.

   @smc_id
     0x02000601

   @param_id
     0x00000001

   @sys_call_req_params{tz_info_is_svc_available_req_s}
     @table{weak__tz__info__is__svc__available__req__s}

   @sys_call_rsp_params{tz_info_is_svc_available_rsp_s}
     @table{weak__tz__info__is__svc__available__rsp__s}

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define TZ_INFO_IS_SVC_AVAILABLE_ID              \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_INFO, 0x01)

#define TZ_INFO_IS_SVC_AVAILABLE_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_1(TZ_SYSCALL_PARAM_TYPE_VAL)

/**
   @ingroup get_diag_info

   Copies the QSEE software diagnostic region into the specified buffer.

   @smc_id
     0x02000602

   @param_id
     0x00000022

   @sys_call_params{tz_info_get_diag_req_s}
     @table{weak__tz__info__get__diag__req__s}

   @return
     E_SUCCESS on success; an error code otherwise.
 */
#define TZ_INFO_GET_DIAG_ID                      \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_INFO, 0x02)

#define TZ_INFO_GET_DIAG_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup get_feature_ver

   Returns the current version of a specified QSEE feature.

   @smc_id
     0x02000603

   @param_id
     0x00000001

   @sys_call_req_params{tz_feature_version_req_s}
     @table{weak__tz__feature__version__req__s}

   @sys_call_rsp_params{tz_feature_version_rsp_s}
     @table{weak__tz__feature__version__rsp__s}

   @returns
     E_SUCCESS on success; a negative value on failure.
*/
#define TZ_INFO_GET_FEATURE_VERSION_ID           \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_INFO, 0x03)

#define TZ_INFO_GET_FEATURE_VERSION_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_1(TZ_SYSCALL_PARAM_TYPE_VAL)


/**
   @ingroup tzos_register_log_buffer

   Register the secure application log buffer.

   @smc_id
     0x32000106

   @param_id
     0x00000022

   @sys_call_params{tz_os_register_log_buffer_req_s}
     @table{weak__tz__os__register__log__buffer__req__s}

   @sys_call_params{tz_os_rsp_s}
     @table{weak__tz__os__rsp__s}

   @return
     Zero on success, negative value on failure.
 */
#define TZ_OS_REGISTER_LOG_BUFFER_ID \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_QSEE_OS, TZ_SVC_APP_MGR, 0x06)

#define TZ_OS_REGISTER_LOG_BUFFER_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup tzos_deregister_log_buffer

   Register the secure application log buffer.

   @smc_id
     0x3200010E

   @param_id
     0x00000000

   @sys_call_params{tz_os_deregister_log_buffer_req_s}
     @table{weak__tz__os__register__log__buffer__req__s}

   @sys_call_params{tz_os_rsp_s}
     @table{weak__tz__os__rsp__s}

   @return
     Zero on success, negative value on failure.
 */
#define TZ_OS_DEREGISTER_LOG_BUFFER_ID \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_QSEE_OS, TZ_SVC_APP_MGR, 0x0E)

#define TZ_OS_DEREGISTER_LOG_BUFFER_ID_PARAM_ID  TZ_SYSCALL_CREATE_PARAM_ID_0

/**
   @ingroup get_secure_state

   System call to check the security status of the system

   @smc_id
     0x02000604

   @param_id
     0x00000000

   @sys_call_params{tz_get_secure_state_rsp_s}
     @table{weak__tz__get__secure__state__rsp__s}

   @return
     E_SUCCESS on success; a negative value on failure.
 */
#define TZ_INFO_GET_SECURE_STATE                     \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_INFO, 0x4)

#define TZ_INFO_GET_SECURE_STATE_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_0

/** TODO: Shifted to SVC_PIL. Remove this ID once APPS changes are promoted.
  Changed ID from TZ_MSS_RESTART to TZBSP_MSS_RESTART to avoid compiler error.
   @ingroup tzbsp_modem_restart
  System call for modem start and stop. as this is 8916
  specific, adding in miscellaneous group.

	@smc_id
		0x02000605
		
	@param_id
    0x00000002

  @sys_call_params{tz_modem_restart_req_s}
    @table{weak__tz__modem__restart__req__s}
		
  @com_struct
     tz_syscall_rsp_s
	
  @return
  E_SUCCESS on success; a negative value on failure.
*/
#define TZBSP_MSS_RESTART_ID                     \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_INFO, 0x5)

#define TZBSP_MSS_RESTART_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL)

/**
   @ingroup get_secure_state_legacy

   System call to check the security status of the system.

   @smc_id
     0x02000604

   @param_id
     0x00000022

   @sys_call_params{tz_get_secure_state_legacy_req_s}
     @table{weak__tz__get__secure__state__legacy__req__s}

   @return
     E_SUCCESS on success; a negative value on failure.
 */
#define TZ_INFO_GET_SECURE_STATE_LEGACY                     \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_INFO, 0x6)

#define TZ_INFO_GET_SECURE_STATE_LEGACY_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL)

/**
   @ingroup decrypt_image

   Parses the XML in the encrypted bootloader image and
   decrypts the data in place.

   @smc_id
     0x02000701

   @param_id
     0x000000A2

   @sys_call_params{tz_ssd_decrypt_img_req_s}
     @table{weak__tz__ssd__decrypt__img__req__s}

   @return
     Zero on success; a negative value on failure.
*/
#define TZ_SSD_DECRYPT_IMG_ID                    \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_SSD, 0x01)

#define TZ_SSD_DECRYPT_IMG_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_BUF_RW)

/**
   @ingroup encrypt_keystore

   Encrypts the keystore with a key derived from the Crypto Engine (CE)
   hardware key.

   @smc_id
     0x02000702

   @param_id
     0x000000A2

   @sys_call_params{tz_ssd_encrypt_keystore_req_s}
     @table{weak__tz__ssd__encrypt__keystore__req__s}

   @return
     Zero on success; a negative value on failure.
*/
#define TZ_SSD_ENCRYPT_KEY_STORE_ID              \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_SSD, 0x02)

#define TZ_SSD_ENCRYPT_KEY_STORE_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_BUF_RW)

/*----------------------------------------------------------------------------
                Deprecated Command ID: Do not reuse
 * -------------------------------------------------------------------------*/
#define TZ_SSD_DEPRECATED_0                      \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_SSD, 0x03)

/*----------------------------------------------------------------------------
                Deprecated Command ID: Do not reuse
 * -------------------------------------------------------------------------*/
#define TZ_SSD_DEPRECATED_1                      \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_SSD, 0x04)

/**
   @ingroup protect_keystore

   Loads the Secure Software Download (SSD) keystore into the QSEE
   software for future use.

   @smc_id
     0x02000705

   @param_id
     0x00000022

   @sys_call_req_params{tz_ssd_protect_keystore_req_s}
     @table{weak__tz__ssd__protect__keystore__req__s}

   @sys_call_rsp_params{tz_ssd_protect_keystore_rsp_s}
     @table{weak__tz__ssd__protect__keystore__rsp__s}

   @return
     Zero on success; a negative value on failure.
*/
#define TZ_SSD_PROTECT_KEYSTORE_ID                  \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_SSD, 0x05)

#define TZ_SSD_PROTECT_KEYSTORE_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL)

/**
   @ingroup parse_md

   Parses the SSD XML header in a given encrypted image and stores the
   resulting metadata to use for subsequent calls to decrypt image
   fragments.

   @smc_id
     0x02000706

   @param_id
     0x00000082

   @sys_call_req_params{tz_ssd_parse_md_req_s}
     @table{weak__tz__ssd__parse__md__req__s}

   @sys_call_rsp_params{tz_ssd_parse_md_rsp_info_s}
     @table{weak__tz__ssd__parse__md__rsp__info__s}

   @par Parse MD response structure (tz_ssd_parse_md_rsp_info_s)
     @table{weak__tz__ssd__parse__md__rsp__info__s}

   @return
     Zero on success; a negative value on failure.
*/
#define TZ_SSD_PARSE_MD_ID                       \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_SSD, 0x06)

#define TZ_SSD_PARSE_MD_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_BUF_RW )

/**
   @ingroup decrypt_img_frag

   Decrypts the data in place for a specified fragment of an encrypted image.

   @smc_id
     0x02000707

   @param_id
     0x00000804

   @sys_call_req_params{tz_ssd_decrypt_img_frag_req_s}
     @table{weak__tz__ssd__decrypt__img__frag__req__s}

   @sys_call_rsp_params{tz_ssd_decrypt_frag_rsp_s}
     @table{weak__tz__ssd__decrypt__frag__rsp__s}

   @return
     Zero on success; a negative value on failure.
*/
#define TZ_SSD_DECRYPT_IMG_FRAG_ID               \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_SSD, 0x07)

#define TZ_SSD_DECRYPT_IMG_FRAG_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_4( \
      TZ_SYSCALL_PARAM_TYPE_VAL,    TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_BUF_RW )

/**
   @ingroup decrypt_elf_seg_frag

   Decrypts the data in place for a specified ELF segment from an
   encrypted image.

   @sys_call_req_params{tz_ssd_decrypt_elf_seg_frag_req_s}
     @table{weak__tz__ssd__decrypt__elf__seg__frag__req__s}

   @sys_call_rsp_params{tz_ssd_decrypt_frag_rsp_s}
     @table{weak__tz__ssd__decrypt__frag__rsp__s}

   @smc_id
     0x02000708

   @param_id
     0x00008006

   @return
     Zero on success; a negative value on failure.
*/
#define TZ_SSD_DECRYPT_ELF_SEG_FRAG_ID               \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_SSD, 0x08)

#define TZ_SSD_DECRYPT_ELF_SEG_FRAG_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_6( \
      TZ_SYSCALL_PARAM_TYPE_VAL,    TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL,    TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_BUF_RW )

/**
   @ingroup blow_sw_fuse

   Changes the state of the software fuse.

   @smc_id
     0x02000801

   @param_id
     0x00000001

   @sys_call_params{tz_sw_fuse_req_s}
     @table{weak__tz__sw__fuse__req__s}

   @com_struct
     See #TZ_IS_SW_FUSE_BLOWN_ID for the response structure.

   @return
     Zero on success; a negative value on failure.
*/
#define TZ_BLOW_SW_FUSE_ID                       \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_FUSE, 0x01)

#define TZ_BLOW_SW_FUSE_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_1( TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup is_sw_fuse_blown

   Queries whether the specified software fuse has been blown.

   @caution1hang This call is not thread safe.

   @smc_id
     0x02000802

   @param_id
     0x00000001

   @sys_call_params{tz_sw_fuse_rsp_s}
     @table{weak__tz__sw__fuse__rsp__s}

   @com_struct
     See #TZ_BLOW_SW_FUSE_ID for the request structure.

   @return
     Zero on success; a negative value on failure.
*/
#define TZ_IS_SW_FUSE_BLOWN_ID                   \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_FUSE, 0x02)

#define TZ_IS_SW_FUSE_BLOWN_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_1( TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup write_qfprom_fuse

   Writes a Qualcomm Field Programmable Read Only Memory (QFPROM) fuse row.

   @smc_id
     0x02000803

   @param_id
     0x00000884

   @sys_call_params{tz_qfprom_write_row_s}
     @table{weak__tz__qfprom__write__row__s}

   @return
     E_SUCCESS on success; a negative value on failure.
*/
#define TZ_QFPROM_WRITE_ROW_ID                   \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_FUSE, 0x03)

#define TZ_QFPROM_WRITE_ROW_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_4( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_BUF_RW, \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_BUF_RW )

/**
   @ingroup write_mult_qfprom_rows

   Writes multiple rows of QFPROM fuses.

   @note1hang This call is only available prior to a
              #TZ_MILESTONE_SET_ID call.

   @smc_id
     0x02000804

   @param_id
     0x00000824

   @sys_call_params{tz_qfprom_write_multiple_rows_s}
     @table{weak__tz__qfprom__write__multiple__rows__s}

   @return
     E_SUCCESS on success; a negative value on failure.
 */
#define TZ_QFPROM_WRITE_MULTIPLE_ROWS_ID         \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_FUSE, 0x04)

#define TZ_QFPROM_WRITE_MULTIPLE_ROWS_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_4( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL,    TZ_SYSCALL_PARAM_TYPE_BUF_RW )

/**
   @ingroup read_qfprom_fuse

   Reads QFPROM fuses.

   @smc_id
     0x02000805

   @param_id
     0x00000A04

   @sys_call_params{tz_qfprom_read_row_s}
     @table{weak__tz__qfprom__read__row__s}

   @return
     E_SUCCESS on success; a negative value on failure.
*/
#define TZ_QFPROM_READ_ROW_ID                    \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_FUSE, 0x05)

#define TZ_QFPROM_READ_ROW_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_4( \
      TZ_SYSCALL_PARAM_TYPE_VAL,    TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_BUF_RW )

/**
   @ingroup write_rollback_qfprom_fuse

   Write rollback-specific QFPROM fuses.

   @note1hang This call is only available prior to a
              #TZ_MILESTONE_SET_ID call.

   @smc_id
     0x02000806

   @param_id
     0x00000884

   @sys_call_params{tz_qfprom_rollback_write_row_s}
     @table{weak__tz__qfprom__rollback__write__row__s}

   @com_struct
     tz_syscall_rsp_s

   @return
     E_SUCCESS on success; a negative value on failure.
*/
#define TZ_QFPROM_ROLLBACK_WRITE_ROW_ID          \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_FUSE, 0x06)

#define TZ_QFPROM_ROLLBACK_WRITE_ROW_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_4( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_BUF_RW, \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_BUF_RW )


/*----------------------------------------------------------------------------
                Deprecated Command IDs: Do not reuse
 * -------------------------------------------------------------------------*/
#define TZ_POWER_SPMI_DISABLE_BUS_DEPRECATED_ID                \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_POWER, 0x01)

/**
   @ingroup spmi_disable_bus

   Disables SPMI bus to allow clean shutdowns then deasserts PS_HOLD.

   @note1hang Implementation takes place entirely in Monitor mode. \n
   @note1hang This command uses a register-based QSEE interface.

   @smc_id
     0x02000902

   @param_id
     0x00000001

   @param[in]     Reserved/spare, should be zero.

   @return
     E_SUCCESS if the call succeeded; an error code otherwise.
*/
#define TZ_POWER_SPMI_DISABLE_BUS_ID                \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_POWER, 0x02)

#define TZ_POWER_SPMI_DISABLE_BUS_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_1( TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup get_prng_data

   Retrieve random data from the Pseudo-Random Number Generator (PRNG)
   hardware.

   @smc_id
     0x02000A01

   @param_id
     0x00000022

   @sys_call_params{tz_get_prng_data_s}
     @table{weak__tz__get__prng__data__s}

   @return
     E_SUCCESS on success; a negative value on failure.
*/
#define TZ_PRNG_GETDATA_ID                         \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_CRYPTO, 0x01)

#define TZ_PRNG_GETDATA_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup init_secure_channel

   Writes the key material to the specified address.

   This function returns E_ALREADY_DONE if the keys are already written.

   @smc_id
     0x02000B01

   @param_id
     0x00000000

   @sys_call_params{tz_sc_init_s}
     @table{weak__tz__sc__init__s}

   @return
     E_SUCCESS      -- Function was successful. \n
     E_FAILURE      -- Secure channel could not be initialized. \n
     E_ALREADY_DONE -- Secure channel is already established.
*/
#define TZ_SECURE_CHANNEL_INIT_ID                            \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_SC_KEY_EXCHANGE, 0x01)

/* TODO Syscall does not exist */
#define TZ_SECURE_CHANNEL_INIT_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_0

/**
   @ingroup deinit_secure_channel

   Clears the keys and resets the channel state.

   @smc_id
     0x02000B02

   @param_id
     0x00000000

   @sys_call_params{tz_sc_deinit_s}
     @table{weak__tz__sc__deinit__s}

   @return
     E_SUCCESS on success; E_FAILURE otherwise.
*/
#define TZ_SECURE_CHANNEL_DEINIT_ID                          \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_SC_KEY_EXCHANGE, 0x02)

/* TODO Syscall does not exist */
#define TZ_SECURE_CHANNEL_DEINIT_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_0

/**
   @ingroup protect_memory

   Protects/unprotects a memory range with an MPU.

   @smc_id
     0x02000C01

   @param_id
     0x00000005

   @sys_call_params{tz_protect_memory_s}
     @table{weak__tz__protect__memory__s}

   @return
     E_SUCCESS on success; error code otherwise.
*/
#define TZ_PROTECT_MEMORY                                    \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_MEMORY_PROTECTION, 0x01)

#define TZ_PROTECT_MEMORY_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_5( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup install_nonsecure_debug_fiq

   Installs a nonsecure debug FIQ handler.

   @smc_id
     0x02000E01

   @param_id
     0x00000256

   @sys_call_params{tz_config_ns_debug_fiq_req_s}
     @table{weak__tz__config__ns__debug__fiq__req__s}

   @return
      E_SUCCESS if the nonsecure debug FIQ handler and context were
      installed successfully; error code otherwise.
*/
#define TZ_NS_DEBUG_FIQ_CONFIG_ID \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_NS_DEBUG_FIQ, 0x01)

#define TZ_NS_DEBUG_FIQ_CONFIG_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_6( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RO, TZ_SYSCALL_PARAM_TYPE_BUF_RO, \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL,    TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup query_nonsecure_debug_fiq_ctx_buf

   Queries the minimum size of a nonsecure debug FIQ context buffer. A pointer
   to the context buffer is passed to the nonsecure handler in register r0.

   @smc_id
     0x02000E02

   @param_id
     0x00000022

   @sys_call_params{tz_config_ns_debug_fiq_ctx_size_req_s}
     @table{weak__tz__config__ns__debug__fiq__ctx__size__req__s}

   @return
     E_SUCCESS if the context buffer size query was successful; error
     code otherwise.
*/
#define TZ_NS_DEBUG_FIQ_CTX_SIZE_ID \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_NS_DEBUG_FIQ, 0x02)

#define TZ_NS_DEBUG_FIQ_CTX_SIZE_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup query_nonsecure_debug_fiq_int

   Queries whether an interrupt is allowed to be configured as a nonsecure
   debug FIQ. The QSEE only allows a limited set of chipset-specific interrupts
   to be used for this purpose.

   @smc_id
     0x02000E03

   @param_id
     0x00000083

   @sys_call_params{tz_config_ns_debug_fiq_int_ok_req_s}
     @table{weak__tz__config__ns__debug__fiq__int__ok__req__s}

   @sys_call_params{tz_config_ns_debug_fiq_int_ok_rsp_s}
     @table{weak__tz__config__ns__debug__fiq__int__ok__rsp__s}

   @return
     E_SUCCESS if the context buffer size query was successfull; error
     code otherwise.
*/
#define TZ_NS_DEBUG_FIQ_INT_OK_ID \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_NS_DEBUG_FIQ, 0x03)

#define TZ_NS_DEBUG_FIQ_INT_OK_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_3( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_BUF_RW, \
      TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup restore_sec_cfg

   Restores VMIDMT/xPU/SMMU configuration of a device's System Memory
   Management Unit (SMMU) global space.

   @note1hang SMMU clocks must be ON.

   @smc_id
     0x02000C02

   @param_id
     0x00000002

   @sys_call_params{tz_restore_sec_cfg_req_s}
     @table{weak__tz__restore__sec__cfg__req__s}

   @return
     E_SUCCESS on success; an error code otherwise.
 */
#define TZ_RESTORE_SEC_CFG  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_MEMORY_PROTECTION, 0x02)

#define TZ_RESTORE_SEC_CFG_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup mem_protect_get_ptbl_mem_size

   Queries the memory size requirement for multimedia SMMU page
   tables.

   @smc_id
     0x02000C03

   @param_id
     0x00000001

   @sys_call_req_params{tz_memprot_ptbl_mem_size_req_s}
     @table{weak__tz__memprot__ptbl__mem__size__req__s}

   @sys_call_rsp_params{tz_memprot_ptbl_mem_size_rsp_s}
     @table{weak__tz__memprot__ptbl__mem__size__rsp__s}

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define TZ_MEM_PROTECT_GET_PTBL_MEM_SIZE  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_MEMORY_PROTECTION, 0x03)

#define TZ_MEM_PROTECT_GET_PTBL_MEM_SIZE_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_1( TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup mem_protect_ptbl_mem_init

   Provides memory used for page tables by multimedia SMMU
   devices involved in content protection.

   @smc_id
     0x02000C04

   @param_id
     0x00000023

   @sys_call_params{tz_memprot_ptbl_mem_init_req_s}
     @table{weak__tz__memprot__ptbl__mem__init__req__s}

   @sys_call_rsp_params{tz_memprot_rsp_s}
     @table{weak__tz__memprot__rsp__s}

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define TZ_MEM_PROTECT_PTBL_MEM_INIT  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_MEMORY_PROTECTION, 0x04)

#define TZ_MEM_PROTECT_PTBL_MEM_INIT_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_3( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL)

/**
   @ingroup mem_protect_set_cp_pool_size

   Provide the CP pool size to calculate translation table
   requirement

   @smc_id
     0x02000C05

   @param_id
     0x00000002

   @sys_call_params{tz_memprot_set_cp_pool_size_req_s}
     @table{weak__tz__memprot__set__cp__pool__size__req__s}

   @sys_call_rsp_params{tz_memprot_rsp_s}
     @table{weak__tz__memprot__rsp__s}

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define TZ_MEM_PROTECT_SET_CP_POOL_SIZE TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_MEMORY_PROTECTION, 0x05)

#define TZ_MEM_PROTECT_SET_CP_POOL_SIZE_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup mem_protect_video_var

   Sets secure Virtual Address Ranges (VAR) in the video device's
   virtual address map.

   @smc_id
     0x02000C08

   @param_id
     0x00000004

   @sys_call_params{tz_memprot_video_var_req_s}
     @table{weak__tz__memprot__video__var__req__s}

   @sys_call_rsp_params{tz_memprot_rsp_s}
     @table{weak__tz__memprot__rsp__s}

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define TZ_MEM_PROTECT_VIDEO_VAR TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_MEMORY_PROTECTION, 0x08)

#define TZ_MEM_PROTECT_VIDEO_VAR_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_4( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup vmidmt_set_memtype

   Sets the memtype attribute for a Virtual Machine ID Mapping Table (VMIDMT)
   associated with a given device.

   @smc_id
     0x02000C09

   @param_id
     0x00000003

   @sys_call_params{tz_set_vmidmt_memtype_req_s}
     @table{weak__tz__set__vmidmt__memtype__req__s}

   @return
     E_SUCCESS on success; an error code otherwise.
 */
#define TZ_VMIDMT_SET_MEMTYPE  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_MEMORY_PROTECTION, 0x09)

#define TZ_VMIDMT_SET_MEMTYPE_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_3( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup disable_mmss_sec

   Disable the QRIB security for the MMSS subsystems

   @smc_id
     0x02000C20

   @param_id
     0x00000000

   @return
     \c E_SUCCESS on success; an error code otherwise.
 */
#define TZ_DISABLE_MMSS_SEC  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_MEMORY_PROTECTION, 0x20)

#define TZ_DISABLE_MMSS_SEC_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_0

/**
   @ingroup prepare_smmu_ctx_bank_atos_operation

   Prepare SMMU context bank ATOS operation

   @smc_id
     0x02000C21

   @param_id
     0x00000003

   @param[in]  r0 Command ID.
   @param[in]  r1 Token ID.
   @param[in]  r2 SMMU instance/SMMU device ID.
   @param[in]  r3 Context bank number.
   @param[in]  r4 ATOS operation start (non-zero value) or end (zero value).

   @com_struct
     tz_syscall_req_s \n
     tz_syscall_rsp_s

   @return
     \c E_SUCCESS on success; an error code otherwise.
 */
#define HYP_PREPARE_SMMU_CTX_BANK_ATOS_OPERATION \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_MEMORY_PROTECTION, 0x21)

#define HYP_PREPARE_SMMU_CTX_BANK_ATOS_OPERATION_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_3( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup mem_protect_lock2

  Protects or removes protection from a list of memory chunks.

   @smc_id
     0x02000C0A

   @param_id
     0x00000024

   @sys_call_params{tz_memprot_lock2_legacy_req_s}
     @table{weak__tz__memprot__lock2__legacy__req__s}

   @sys_call_rsp_params{tz_memprot_rsp_s}
     @table{weak__tz__memprot__rsp__s}

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define TZ_MEM_PROTECT_LOCK2_LEGACY   TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_MEMORY_PROTECTION, 0x0A)

#define TZ_MEM_PROTECT_LOCK2_LEGACY_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_4( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL,    TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup mem_protect_map2

   Maps a list of memory chunks (sets up VA to PA mapping) on a
   QSEE-managed context bank.

   @smc_id
     0x02000C0B

   @param_id
     0x000000A3

   @sys_call_params{tz_memprot_map2_legacy_req_s}
     @table{weak__tz__memprot__map2__legacy__req__s}

   @sys_call_rsp_params{tz_memprot_rsp_s}
     @table{weak__tz__memprot__rsp__s}

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define TZ_MEM_PROTECT_MAP2_LEGACY    TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_MEMORY_PROTECTION, 0x0B)

#define TZ_MEM_PROTECT_MAP2_LEGACY_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_3( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_BUF_RW, \
      TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup mem_protect_unmap2

   Removes VA to PA mapping on a QSEE-managed context bank.

   @smc_id
     0x02000C0C

   @param_id
     0x00000022

   @sys_call_params{tz_memprot_unmap2_legacy_req_s}
     @table{weak__tz__memprot__unmap2__legacy__req__s}

   @sys_call_rsp_params{tz_memprot_rsp_s}
     @table{weak__tz__memprot__rsp__s}

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define TZ_MEM_PROTECT_UNMAP2_LEGACY  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_MEMORY_PROTECTION, 0x0C)

#define TZ_MEM_PROTECT_UNMAP2_LEGACY_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup mem_protect_tlbinval

   Invalidates Translation Lookaside Buffer (TLB) entries associated with a
   QSEE-managed context bank.

   @smc_id
     0x02000C0D

   @param_id
     0x00000004

   @sys_call_params{tz_memprot_tlbinval_req_s}
     @table{weak__tz__memprot__tlbinval__req__s}

   @sys_call_rsp_params{tz_memprot_rsp_s}
     @table{weak__tz__memprot__rsp__s}

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define TZ_MEM_PROTECT_TLBINVALIDATE  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_MEMORY_PROTECTION, 0x0D)

#define TZ_MEM_PROTECT_TLBINVALIDATE_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_4( \
      TZ_SYSCALL_PARAM_TYPE_VAL,    TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL,    TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup config_xpu_violation_err_fatal

   Subroutine used by the HLOS to enable/disable xPU violations becoming fatal
   errors. This can also be used to check whether xPU violations are currently
   fatal errors by sending TZ_XPU_VIOLATION_ERR_FATAL_NOOP as the parameter.

   The TZ may choose to force enable/disable xPU violations as fatal errors by
   default. It may also choose to disallow the HLOS from overriding this
   configuration. So, the HLOS must always check the output parameter (enabled)
   to see the current behavior and the return code to see if it was allowed to
   carry out the operation (-E_NOT_SUPPORTED is returned if the HLOS is not
   allowed to change the behavior).

   @smc_id
     0x02000C0E

   @param_id
     0x00000002

   @sys_call_req_params{tz_xpu_violation_err_fatal_req_s}
     @table{weak__tz__xpu__violation__err__fatal__req__s}

   @sys_call_rsp_params{tz_xpu_violation_err_fatal_rsp_s}
     @table{weak__tz__pil__subsystem__query__rsp__s}

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define TZ_CONFIG_XPU_VIOLATION_ERR_FATAL                \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_MEMORY_PROTECTION, 0x0E)

#define TZ_CONFIG_XPU_VIOLATION_ERR_FATAL_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL )

/**         Deprecated syscall - Do not reuse         */
#define TZ_MEM_PROTECT_SD_CTRL_DEPRECATED                       \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_MEMORY_PROTECTION, 0x0F)

/**
   @ingroup mem_protect_lock2

  Protects or removes protection from a list of memory chunks.

   @smc_id
     0x02000C11

   @param_id
     0x00000026

   @sys_call_params{tz_memprot_lock2_req_s}
     @table{weak__tz__memprot__lock2__req__s}

   @sys_call_rsp_params{tz_memprot_rsp_s}
     @table{weak__tz__memprot__rsp__s}

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define TZ_MEM_PROTECT_LOCK2   TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_MEMORY_PROTECTION, 0x11)

#define TZ_MEM_PROTECT_LOCK2_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_6( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL,    TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL,    TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup mem_protect_map2

   Maps a list of memory chunks (sets up VA to PA mapping) on a
   QSEE-managed context bank.

   @smc_id
     0x02000C12

   @param_id
     0x00000028

   @sys_call_params{tz_memprot_map2_req_s}
     @table{weak__tz__memprot__map2__req__s}

   @sys_call_rsp_params{tz_memprot_rsp_s}
     @table{weak__tz__memprot__rsp__s}

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define TZ_MEM_PROTECT_MAP2    TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_MEMORY_PROTECTION, 0x12)

#define TZ_MEM_PROTECT_MAP2_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_8( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL,    TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL,    TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL,    TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup mem_protect_unmap2

   Removes VA to PA mapping on a QSEE-managed context bank.

   @smc_id
     0x02000C13

   @param_id
     0x00000005

   @sys_call_params{tz_memprot_unmap2_req_s}
     @table{weak__tz__memprot__unmap2__req__s}

   @sys_call_rsp_params{tz_memprot_rsp_s}
     @table{weak__tz__memprot__rsp__s}

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define TZ_MEM_PROTECT_UNMAP2  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_MEMORY_PROTECTION, 0x13)

#define TZ_MEM_PROTECT_UNMAP2_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_5( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup secure_display_ctrl

   Enable/disable the secure display

   @smc_id
     0x02000C14

   @param_id
     0x00000001

   @sys_call_params{tz_memprot_sd_ctrl_req_s}
     @table{weak__tz__memprot__sd__ctrl__req__s}

   @sys_call_rsp_params{tz_memprot_rsp_s}
     @table{weak__tz__memprot__rsp__s}

   @return
     E_SUCCESS on success; error code otherwise.
*/
#define TZ_MEM_PROTECT_SD_CTRL                       \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_MEMORY_PROTECTION, 0x14)

#define TZ_MEM_PROTECT_SD_CTRL_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_1( TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup mem_protect_dev_var

   Sets secure Virtual Address Ranges (VAR) in the requested
   device's virtual address map in an specific device.

   @smc_id
     0x02000C15

   @param_id
     0x00000000

   @sys_call_params{tz_memprot_dev_var_req_s}
     @table{weak__tz__memprot__dev__var__req__s}

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define TZ_MEM_PROTECT_DEVICE_VAR                        \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_MEMORY_PROTECTION, 0x15)

/* TODO Syscall does not exist */
#define TZ_MEM_PROTECT_DEVICE_VAR_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_0

/**
   @ingroup mem_protect_assign

   Assigns a list of Intermediate PA's from
   Source Virtual Machine(VM) to destination VM

   @smc_id
     0x02000C16

   @param_id
     0x00001117

   @sys_call_params{hyp_memprot_assign_s}
     @table{weak__hyp__memprot__assign__s}

   @com_struct
     tz_common_rsp_s

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define HYP_MEM_PROTECT_ASSIGN                   \
   TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_MEMORY_PROTECTION, 0x16)

#define HYP_MEM_PROTECT_ASSIGN_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_7( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RO, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_BUF_RO, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_BUF_RO, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL)

/**
   @ingroup mem_protect_tag

   Memory that is assigned using HYP_MEM_PROTECT_ASSIGN for
   CPZ usecase is tagged in TZ using TZ_MEM_PROTECT_TAGVM
   for apps to know if memory is tagged

   @smc_id
     0x02000C17

   @param_id
     0x00000225

   @sys_call_params{tz_memprot_tagVM_s}
     @table{weak__tz__memprot__tagVM__s}

   @com_struct
     tz_common_rsp_s

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define TZ_MEM_PROTECT_TAGVM                   \
   TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_MEMORY_PROTECTION, 0x17)

#define TZ_MEM_PROTECT_TAGVM_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_5( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL)
   
   
/**
   @ingroup smmuv3_paravirtualization

   Paravirtualization API for EL1 to configure the SMMUv3

   @smc_id
     0x02001506

   @param_id
     0x0022200A

   @com_struct
     tz_common_rsp_s

   @return
     E_SUCCESS on success; an error code otherwise.
*/
#define TZ_MEM_PROTECT_SMMUV3_PARAVIRT                   \
   TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_SMMU_PROGRAM, 0x6)

#define TZ_MEM_PROTECT_SMMUV3_PARAVIRT_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_10( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL)

/**
   @ingroup ocmem_lock_region

   System call to lock an OCMEM region.

   @smc_id
     0x02000F01

   @param_id
     0x00000004

   @sys_call_params{tz_ocmem_lock_region_req_s}
     @table{weak__tz__ocmem__lock__region__req__s}

   @return
     E_SUCCESS on success; an error code otherwise.
 */
#define TZ_OCMEM_LOCK_REGION       TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_OCMEM, 0x1)

#define TZ_OCMEM_LOCK_REGION_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_4( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup ocmem_unlock_region

   System call to unlock an OCMEM region.

   @smc_id
     0x02000F02

   @param_id
     0x00000003

   @sys_call_params{tz_ocmem_unlock_region_req_s}
     @table{weak__tz__ocmem__unlock__region__req__s}

   @return
     E_SUCCESS on success; an error code otherwise.
 */
#define TZ_OCMEM_UNLOCK_REGION     TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_OCMEM, 0x2)

#define TZ_OCMEM_UNLOCK_REGION_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_3( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup ocmem_enable_mem_dump

   System call to enable memory dumping for an OCMEM region.

   @smc_id
     0x02000F03

   @param_id
     0x00000003

   @sys_call_params{tz_ocmem_enable_mem_dump_req_s}
     @table{weak__tz__ocmem__enable__mem__dump__req__s}

   @return
     E_SUCCESS on success; an error code otherwise.
 */
#define TZ_OCMEM_ENABLE_MEM_DUMP   TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_OCMEM, 0x3)

#define TZ_OCMEM_ENABLE_MEM_DUMP_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_3( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup ocmem_disable_mem_dump

   System call to disable memory dumping for an OCMEM region.

   @smc_id
     0x02000F04

   @param_id
     0x00000003

   @sys_call_params{tz_ocmem_disable_mem_dump_req_s}
     @table{weak__tz__ocmem__disable__mem__dump__req__s}

   @return
     E_SUCCESS on success; an error code otherwise.
 */
#define TZ_OCMEM_DISABLE_MEM_DUMP  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_OCMEM, 0x4)

#define TZ_OCMEM_DISABLE_MEM_DUMP_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_3( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup tz_es_save_partition_hash

   Saves the eMMC partition kernel/system hash (SHA-256).
   This service is used by the LK to save the kernel partition hash
   and by the HLOS to save the system partition hash.

   @smc_id
     0x02001001

   @param_id
     0x000000082

   @sys_call_req_params{tz_es_save_partition_hash_req_s}
     @table{weak__tz__es__save__partition__hash__req__s}

   @return
     E_SUCCESS on success; negative value on failure.
*/
#define TZ_ES_SAVE_PARTITION_HASH_ID TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_ES, 0x1)

#define TZ_ES_SAVE_PARTITION_HASH_ID_PARAM_ID TZ_SYSCALL_CREATE_PARAM_ID_3( \
    TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_BUF_RW, \
    TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup tz_hdcp_write_registers

   This service is used to write registers in the
   HDCP HDMI Secure resource group. Additionally, whenever this syscall
   is invoked, TZ will attempt to update the MMSS_HDMI_HDCP_CTRL2 register
   to reflect if HDCP HDMI ecryption is to be enforced.

   Five registers can be written to with one invocation of this syscall.
   Note that the order in which these registers are written is not guanenteed,
   so the caller should take care to invoke this syscall multiple times if
   a certain order is required (as may be the case with the HWIO_MMSS_HDMI_HDCP_SHA_CTRL
   and HWIO_MMSS_HDMI_HDCP_SHA_DATA registers).

   @smc_id
     0x02001101

   @param_id
     0x0000000A

   @sys_call_req_params{tz_hdcp_write_registers_req_s}
     @table{weak__tz__hdcp__write__registers__req__s}

   @return
     E_SUCCESS on success; negative value on failure.
*/
#define TZ_HDCP_WRITE_REGISTERS TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_HDCP, 0x1)

#define TZ_HDCP_WRITE_REGISTERS_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_10( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup tz_mdtp_cipher_dip

   Encrypt or Decrypt a DIP structure using a HW derived key.
   This API is called from HLOS via QSEE.

   This service is used by the LK at boot time.
    
   @smc_id
     0x02001201

   @param_id
     0x00000215

   @sys_call_req_params{tz_mdtp_cipher_dip_req_s}
     @table{weak__tz__mdtp__cipher__dip__req__s}

   @return
     E_SUCCESS on success; negative value on failure.
*/
#define TZ_MDTP_CIPHER_DIP_ID TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_MDTP, 0x1)

#define TZ_MDTP_CIPHER_DIP_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_5( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RO, TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL)

/**
    LMH function stuff
*/

/**
   @ingroup tzbsp_lmh_change_profile

   System call to change the current LMH profile.
   
   @smc_id
     0x02001301

   @param_id
     0x00000001

   @sys_call_req_params{tzbsp_lmh_change_profile_req_s}
     @table{weak__tzbsp__lmh__change__profile__req__s}

   @return
     E_SUCCESS on success; negative value on failure.
 */
#define TZ_LMH_CHANGE_PROFILE_ID  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_LMH, 0x1)

#define TZ_LMH_CHANGE_PROFILE_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_1( \
      TZ_SYSCALL_PARAM_TYPE_VAL \
      )

/**
   @ingroup tzbsp_lmh_get_profiles

   System call to get a list of profile ids supported by LMH.
   Up to ten profiles are reported. 'start' argument tells the
   private driver where to start reporting.
   Returns the total number of profiles.

   @smc_id
     0x02001302

   @param_id
     0x00000023

   @sys_call_req_params{tzbsp_lmh_get_profiles_req_s}
     @table{weak__tzbsp__lmh__get__profiles__req__s}

   @return
     E_SUCCESS on success; negative value on failure.
 */
#define TZ_LMH_GET_PROFILES_ID  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_LMH, 0x2)

#define TZ_LMH_GET_PROFILES_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_3( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, \
      TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL \
      )

/**
   @ingroup tzbsp_lmh_enable_qpmda

   System call to enable/disable the qpmda hw debug interface for LMH.

   @smc_id
     0x02001303

   @param_id
     0x00000002

   @sys_call_req_params{tzbsp_lmh_enable_qpmda_req_s}
     @table{weak__tzbsp__lmh__enable__qpmda__req__s}

   @return
     E_SUCCESS on success; negative value on failure.
 */
#define TZ_LMH_ENABLE_QPMDA_ID  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_LMH, 0x3)

#define TZ_LMH_ENABLE_QPMDA_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL \
      )

/**
   @ingroup tzbsp_lmh_trim_error

   System call to notify LMH private driver of a periodic trim failure.

   @smc_id
     0x02001304

   @param_id
     0x00000000

   @return
     E_SUCCESS on success; negative value on failure.
 */
#define TZ_LMH_TRIM_ERROR_ID  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_LMH, 0x4)

#define TZ_LMH_TRIM_ERROR_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_0

/**
   @ingroup tzbsp_lmh_set_current_limit

   System call to change the current limit in an LMH profile.
   Profile is defined by type and id.
   Limit is only updated if limit is less than existing limit
   This API may only be called from SBL.

   @smc_id
     0x02001305

   @param_id
     0x00000003

   @sys_call_req_params{tzbsp_lmh_set_current_limit_req_s}
     @table{weak__tzbsp__lmh__set__current__limit__req__s}

   @return
     E_SUCCESS on success; negative value on failure.
 */
#define TZ_LMH_SET_CURRENT_LIMIT_ID  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_LMH, 0x5)

#define TZ_LMH_SET_CURRENT_LIMIT_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_3( \
      TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL \
      )

/**
   @ingroup tz_lmh_intensity

   System call to get a list of throttling nodes.
   Returns the ten highest throttling nodes, if fewer than ten nodes are
   throttling, only those are returned. Total number of nodes throttling
   is also returned.

   @smc_id
     0x02001306

   @param_id
     0x00000022

   @sys_call_req_params{tz_lmh_intensity_req_s}
     @table{weak__tz__lmh__intensity__req__s}

   @return
     E_SUCCESS on success; negative value on failure.
 */
#define TZ_LMH_INTENSITY_ID  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_LMH, 0x6)

#define TZ_LMH_INTENSITY_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, \
      TZ_SYSCALL_PARAM_TYPE_VAL \
      )

/**
   @ingroup tz_lmh_get_sensor_list

   System call to get list of sensor node available on this device.
   Up to ten nodes and their parameters are reported, starting at
   packet->count.
   Total number of nodes is reported by replacing packet->count.

   @smc_id
     0x00001307

   @param_id
     0x00000022

   @sys_call_req_params{tz_lmh_get_sensor_list_req_s}
     @table{weak__tz__lmh__get__sensor__list__req__s}

   @return
     E_SUCCESS on success; negative value on failure.
 */
#define TZ_LMH_GET_SENSOR_LIST_ID  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_LMH, 0x7)

#define TZ_LMH_GET_SENSOR_LIST_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, \
      TZ_SYSCALL_PARAM_TYPE_VAL \
      )

/**
   @ingroup tzbsp_lmh_sensor_init

   System call to init sensor specified sensor on this device.

   @smc_id
     0x02001311

   @param_id
     0x00000006

   @sys_call_req_params{tzbsp_lmh_sensor_init_req_s}
     @table{weak__tzbsp__lmh__sensor__init__req__s}

   @return
     E_SUCCESS on success; negative value on failure.
 */
 
 
/**
   @ingroup tzos_load_external_image

   Load an extenal image into memory.

   @smc_id
     0x32000301

   @param_id
     0x00000003

   @sys_call_params{tz_os_load_external_image_req_s}
     @table{weak__tz__os__load__external__image__req__s}

   @sys_call_params{tz_os_rsp_s}
     @table{weak__tz__os__rsp__s}

   @return
     Zero on success, negative value on failure.
 */
#define TZ_OS_LOAD_EXTERNAL_IMAGE_ID \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_QSEE_OS, TZ_SVC_EXTERNAL, 0x01)

#define TZ_OS_LOAD_EXTERNAL_IMAGE_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_3( \
      TZ_SYSCALL_PARAM_TYPE_VAL, TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup tzos_unload_external_image

   Unload an external image.

   @smc_id
     0x32000302

   @param_id
     0x00000000

   @sys_call_params{tz_os_rsp_s}
     @table{weak__tz__os__rsp__s}

   @return
     Zero on success, negative value on failure.
 */
#define TZ_OS_UNLOAD_EXTERNAL_IMAGE_ID \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_QSEE_OS, TZ_SVC_EXTERNAL, 0x02)

#define TZ_OS_UNLOAD_EXTERNAL_IMAGE_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_0 
 
 
#define TZ_LMH_SENSOR_INIT_ID  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_LMH, 0x11)

#define TZ_LMH_SENSOR_INIT_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_6( \
      TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL \
      )

/**
   @ingroup TZ_SVC_READ_DBG_POLICY_MEM

   If loaded by boot, the debug policy is maintained in secure memory. This service is
   used to expose a copy of the debug policy with the caller.

   @smc_id
     0x00001101

   @param_id
     0x00000022

   @sys_call_rsp_params{tz_read_debug_policy_content_rsp_t}
     @table{weak__tz__read__debug__policy__rsp__s}

   @return
     E_SUCCESS on success; negative value on failure.
*/
#define TZ_READ_DEBUG_POLICY_CONTENT TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_READ_DBG_POLICY, 0x1)

#define TZ_READ_DEBUG_POLICY_CONTENT_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_2( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RW, TZ_SYSCALL_PARAM_TYPE_VAL )

/**
   @ingroup send_qspinor_cmd

  Sends the commands to storage devices.

   @return
     Zero on success; a negative value on failure.
*/
#define TZ_SEND_STORAGE_CMD_ID                       \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_STORAGE, 0x01)

#define TZ_SEND_STORAGE_CMD_ID_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_4(TZ_SYSCALL_PARAM_TYPE_BUF_RO,TZ_SYSCALL_PARAM_TYPE_VAL,TZ_SYSCALL_PARAM_TYPE_BUF_RW,TZ_SYSCALL_PARAM_TYPE_VAL)

/**
   @ingroup query_tpm_type
     syetem call to query tpm type

   @smc_id
     0x02003201

   @param_id
     0x00000000

   @return
     None
*/
#define TZ_QUERY_TPM_TYPE_ID \
  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_TPM_INFO, 0x01)

#define TZ_QUERY_TPM_TYPE_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_0


/** @addtogroup tz_datatypes
@{ */

/**
   Common system call response header used in all system calls that
   have responses.
 */
typedef struct tz_syscall_rsp_s
{
   INT64   status;              /**< Status of the syscall_req
                                     executed: \n
                                     0 means the command was not completed \n
                                     1 means the command was completed */
} __attribute__ ((packed)) tz_syscall_rsp_t;

/**
   VA range structure in set VA range API.
 */
typedef struct tz_va_range_s
{
  UINT64  va_start; /**< VA Start Address. */
  UINT64  va_size;  /**< VA range size. */
}tz_va_range_t;

/** @} */ /* end_addtogroup tz_datatypes */
/*----------------------------------------------------------------------------
 * Control Class Structures
 * -------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
 * BOOT Service Structures
 * -------------------------------------------------------------------------*/

/** @addtogroup tz_macros_constants
@{ */

/**
   @name HLOS Start Address Slots
   HLOS start address slots provided by Core service
   TZ_CORE_SVC_START_ADDR_REQ_ID.
   @{
*/
/** CPU address is AArch64. */
#define TZ_BOOT_ADDR_AARCH64               0x00000001
/** CPU initial boot. */
#define TZ_BOOT_ADDR_COLD                  0x00000002
/** CPU subsequent boots/resets. */
#define TZ_BOOT_ADDR_WARM                  0x00000004

/** @} */ /* end_name_group HLOS Start Address Slots */

/** @} */ /* end_addtogroup tz_macros_constants */



/**
   @weakgroup weak_tz_set_boot_addr_s
@{
*/
typedef struct tz_set_boot_addr_s
{
  UINT64 boot_addr;                /**< The address to which the QSEE
                                        is to jump after CPU
                                        initialization.  It must be a
                                        physical address, but can be
                                        NULL. Addresses in the secure
                                        memory are not accepted and
                                        cause the service to return
                                        E_BAD_ADDRESS. */
  UINT64 affl0_bmsk;               /**< A bitmask of the CPUs
                                        identified by the AFFL0 field
                                        of the MPIDR. A value of zero
                                        is not allowed.*/
  UINT64 affl1_bmsk;               /**< A bitmask of the CPUs
                                        identified by the AFFL1 field
                                        of the MPIDR. A value of zero
                                        is not allowed. */
  UINT64 affl2_bmsk;               /**< A bitmask of the CPUs
                                        identified by the AFFL2 field
                                        of the MPIDR. A value of zero
                                        is not allowed. */
  UINT64 affl3_bmsk;               /**< A bitmask of the CPUs
                                        identified by the AFFL3 field
                                        of the MPIDR. A value of zero
                                        is not allowed. */
  UINT64 flags;                    /**< Combination of TZ_BOOT_ADDR_*
                                        values. The same address can
                                        be set to multiple HLOS start
                                        address slots by bitwise ORing
                                        the values. Unused bits are
                                        ignored and must be kept at
                                        zero. A value of zero is not
                                        allowed. */
} __attribute__ ((packed)) tz_set_boot_addr_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_set_milestone_s
@{
*/
typedef struct tz_set_milestone_s
{
  UINT64 e_entry;                  /**< Address to which the QSEE
                                        is to jump after the milestone call.
                                        It must be a physical address.
                                        Addresses in the secure memory are
                                        not accepted and cause the service
                                        to return E_BAD_ADDRESS. */
  UINT64 mode;                     /**< Used on targets that support
                                        flashless boot to provide boot
                                        mode information.  */
  UINT64 ei_class;                 /**< Info from ELF header of image
                                        to jump to after the milestone
                                        call.  */

} __attribute__ ((packed)) tz_set_milestone_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_do_modeswitch_s
@{
*/

typedef struct hlos_boot_params_s
{
  UINT64 el1_x0;
  UINT64 el1_x1;
  UINT64 el1_x2;
  UINT64 el1_x3;
  UINT64 el1_x4;
  UINT64 el1_x5;
  UINT64 el1_x6;
  UINT64 el1_x7;
  UINT64 el1_x8;
  UINT64 el1_elr;
} __attribute__ ((packed)) hlos_boot_params_t;

typedef struct tz_do_modeswitch_s
{
  hlos_boot_params_t hlos_boot_info;
                                   /**< hlos boot info. */
} __attribute__ ((packed)) tz_do_modeswitch_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_secure_wdog_disable_req_s
@{
*/
typedef struct tz_secure_wdog_disable_req_s
{
  BOOLEAN disable;                 /**< If TRUE, the secure WDOG is
                                        disabled; enabled otherwise. */
} __attribute__ ((packed)) tz_secure_wdog_disable_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_secure_wdog_trigger_req_s
@{
*/
typedef struct tz_secure_wdog_trigger_req_s
{
  BOOLEAN disable_debug;           /**< If TRUE, the watchdog debug image
                                        is disabled (i.e., it will not run
                                        after a watchdog reset). */
} __attribute__ ((packed)) tz_secure_wdog_trigger_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_lock_xpu_s
@{
*/
typedef struct tz_lock_xpu_s
{
  UINT64 elf_header_addr;          /**< Address to which the QSEE will
                                   extract elf header associated with
                                   proc id given as second argument. */
  UINT64 program_header;

  UINT64 proc_id;                  /**< Proc id associated with elf header  */

  UINT64 dummy;
} __attribute__ ((packed)) tz_lock_xpu_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_config_hw_for_ram_dump_req_s
@{
*/
typedef struct tz_config_hw_for_ram_dump_req_s
{
  UINT64 disable_wd_dbg;           /**< If TRUE, the watchdog debug image
                                        is disabled (i.e., it will not run
                                        after a watchdog reset). */

  UINT64 boot_partition_sel;       /**< Value programmed into the
                                        BOOT_PARTION_SELECT register. */
} __attribute__ ((packed)) tz_config_hw_for_ram_dump_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_force_dload_mode_req_s
@{
*/
typedef struct tz_force_dload_mode_req_s
{
  UINT64 config;                  /**< Value programmed into the
                                        TCSR_BOOT_MISC_DETECT register. */

  UINT64 spare;                  /**< Spare */
} __attribute__ ((packed)) tz_force_dload_mode_req_t;

/** @} */ /* end_weakgroup */

/** @addtogroup tz_datatypes
@{ */

/** Video Core State. */
typedef enum
{
  TZ_VIDEO_STATE_SUSPEND = 0,      /**< Assert reset to the video core. */
  TZ_VIDEO_STATE_RESUME,           /**< Re-initialize video HW, if required,
                                        and de-assert video core reset. */
} tz_video_state_e_type;

/** @} */ /* end_addtogroup tz_datatypes */

/**
   @weakgroup weak_tz_video_set_state_req_s
@{
*/
typedef struct tz_video_set_state_req_s
{
  UINT64 state;                    /**< Requested video state, one
                                        of #tz_video_state_e_type*/

  UINT64 spare;                    /**< Reserved for future use.
                                        Should be zero */
} __attribute__ ((packed)) tz_video_set_state_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_video_set_state_rsp_s
@{
*/
typedef struct tz_video_set_state_rsp_s
{
  UINT64 status;                    /**< Syscall status return val. */
} __attribute__ ((packed)) tz_video_set_state_rsp_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_config_hw_for_ram_dump_req_s
@{
*/
typedef struct tz_spin_with_irqs_fiqs_disabled_s
{
  UINT64 spare;                       /**< Reserved for future use. */
} __attribute__ ((packed)) tz_spin_with_irqs_fiqs_disabled_t;

/** @} */ /* end_weakgroup */


/** @addtogroup tz_datatypes
@{ */

/*----------------------------------------------------------------------------
 * PIL Service Structures
 * -------------------------------------------------------------------------*/
/**
    Peripheral types.
 */
typedef enum
{
  TZ_PIL_AUTH_MODEM_PROC,       /**< This enum member is deprecated.
                                     Use #TZ_PIL_AUTH_MODEM_FW_PROC. */
  TZ_PIL_AUTH_QDSP6_PROC,       /**< LPASS Hexagon@tm processor. */
  TZ_PIL_AUTH_SPS_PROC,         /**< This enum member is deprecated. */
  TZ_PIL_AUTH_EXEC,             /**< QSEE generic executive image. */
  TZ_PIL_AUTH_MODEM_SW_PROC,    /**< Modem software processor. */
  TZ_PIL_AUTH_MODEM_FW_PROC,    /**< Modem firmware processor. */
  TZ_PIL_AUTH_WLAN_PROC,        /**< Riva processor. */
  TZ_PIL_AUTH_SEC_APP,          /**< QSEE software secure applications. */
  TZ_PIL_AUTH_GNSS_PROC,        /**< GNSS processor. */
  TZ_PIL_AUTH_VIDEO_PROC,       /**< Video processor. */
  TZ_PIL_AUTH_VPU_PROC,         /**< VPU processor. */
  TZ_PIL_AUTH_BCSS_PROC,        /**< BCSS processor. */
  TZ_PIL_AUTH_SSC_PROC,         /**< SSC Hexagon@tm processor. */
  TZ_PIL_AUTH_GPU_UCODE_PROC,   /**< GPU Microcode. */
  TZ_PIL_AUTH_SPSS_PROC,        /**< Secure processor. */
  TZ_PIL_AUTH_IPA_GSI_PROC,     /**< IPA GSI Firmware. */
  TZ_PIL_AUTH_SEC_TEE,          /**< QSEE software secure TEE. */
  TZ_PIL_AUTH_SEC_LIB,          /**< QSEE software secure library. */
  TZ_PIL_AUTH_CDSP_PROC,        /**< CDSP processor. */
  TZ_PIL_AUTH_GSI_QUP_PROC,     /**< Firmware for the GSI/QUP. */
  TZ_PIL_AUTH_UEFIFV_PROC,      /**< UEFI Firmware Volumes. */
  TZ_PIL_AUTH_ABLFV_PROC,       /**< ABL (LinuxLoader). */
  TZ_PIL_AUTH_ACPI,             /**< ACPI Tables. */
  TZ_PIL_AUTH_NPU_PROC,         /**< NPU Firmware. */
  TZ_PIL_AUTH_EXT_DSP_PROC,     /**< External DSP Firmware. */
  TZ_PIL_AUTH_DAM_APP_PROC,     /**< Downloadable App Module (non-sec apps used in TX alone). */
  TZ_PIL_AUTH_CVP_PROC,         /**< CVP Firmware. */
  TZ_PIL_AUTH_IPA_UC_PROC,      /**< IPA uC Firmware. */
  TZ_PIL_AUTH_GUEST_OS_VM,       /**  GUEST OS VM  */
  TZ_PIL_AUTH_EXT_DSP_FWU_PROC,  /**< External DSP Firmware Update. */
  TZ_PIL_AUTH_CDSP1_PROC,        /**< CDSP1 processor. Some target will have 2 different CDSP subsystem, ex: Makena Auto */
  TZ_PIL_AUTH_UNSUPPORTED_PROC  /**< Processor not supported. */
} tz_pil_proc_e_type;

/** @} */ /* end_addtogroup tz_datatypes */

/**
   @weakgroup weak_tz_pil_init_req_s
@{
*/
typedef struct tz_pil_init_req_s
{
  UINT64               proc;           /**< Processor identifier for
                                            the current operation.
                                            See #tz_pil_proc_e_type. */
  UINT64               image_hdr_ptr;  /**< Pointer to the physical
                                            address location of the
                                            ELF header for the given
                                            processor identifier. */
} __attribute__ ((packed)) tz_pil_init_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_pil_mem_req_s
@{
*/
typedef struct tz_pil_mem_req_s
{
  UINT64               proc;        /**< Processor identifier for the
                                         current operation. See
                                         #tz_pil_proc_e_type. */

  UINT64               start_addr;  /**< The HLOS can load the image
                                         in any memory location, so
                                         this is used to take the
                                         difference between the
                                         program header addresses and
                                         start_addr. */

  UINT64               image_len;   /**< Total length of the image in
                                         memory. */
} __attribute__ ((packed)) tz_pil_mem_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_pil_auth_reset_req_s
@{
*/
typedef struct tz_pil_auth_reset_req_s
{
  UINT64               proc;        /**< Processor identifier for the
                                         current operation. See
                                         #tz_pil_proc_e_type. */
} __attribute__ ((packed)) tz_pil_auth_reset_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_pil_unlock_req_s
@{
*/
typedef struct tz_pil_unlock_req_s
{
  UINT64               proc;        /**< Processor ientifier for the
                                         current operation. See
                                         #tz_pil_proc_e_type. */
} __attribute__ ((packed)) tz_pil_unlock_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_pil_subsystem_query_req_s
@{
*/
typedef struct tz_pil_subsystem_query_req_s
{
  UINT64               proc;        /** Processor/subsystem
                                        identifier. See
                                        #tz_pil_proc_e_type. */

} __attribute__ ((packed)) tz_pil_subsystem_query_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_pil_subsystem_query_rsp_s
@{
*/
typedef struct tz_pil_subsystem_query_rsp_s
{
  tz_syscall_rsp_t     common_rsp; /**< Common response structure */
  UINT64               verdict;     /**< TRUE (1) if the answer to
                                         the query is true; FALSE
                                         (0) otherwise. */
} __attribute__ ((packed)) tz_pil_subsystem_query_rsp_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_pil_mem_area_query_req_s
@{
*/
typedef struct tz_pil_mem_area_query_req_s
{
  UINT64               spare;       /**< Unused; should be zero.   */

} __attribute__ ((packed)) tz_pil_mem_area_query_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_pil_mem_area_query_rsp_s
@{
*/
typedef struct tz_pil_mem_area_query_rsp_s
{
  tz_syscall_rsp_t     common_rsp; /**< Common response structure */
  UINT64               start;       /**< Start address of relocatable
                                         PIL region (inclusive). */

  UINT64               end;         /**< End address of relocatable
                                         PIL region (exclusive). */
} __attribute__ ((packed)) tz_pil_mem_area_query_rsp_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_pil_modem_restart_s
@{
*/
typedef struct tz_pil_modem_restart_s
{
  UINT64 config;                  /**< Value programmed into the
                                        MSS_RESTART register. */

  UINT64 spare;                  /**< Spare */
} __attribute__ ((packed)) tz_pil_modem_restart_t;

/** @} */ /* end_weakgroup */



/**
   @weakgroup weak_ tz_pil_share_memory_s
@{
*/
typedef struct tz_pil_share_memory_s
{
  UINT64  start;       /**< Start address of the memory. start=0 and size=0 means share full HLOS memory */
  UINT64  size;         /**< length of the memory. start=0 and size=0 means share full HLOS memory */
  UINT64  proc;        /**< Processor identifier for the current operation. See #tz_pil_proc_e_type. */
  UINT64  share_type;   /**< a bitwise OR of the TZ_PIL_SHARE_TYPE_* definitions. 
                            Zero to revoke sharing of previously shared memory. */
} __attribute__ ((packed)) tz_pil_share_memory_t;
/** @} */ /* end_weakgroup */

#define TZ_PIL_SHARE_TYPE_READ 0x1
#define TZ_PIL_SHARE_TYPE_WRITE 0x2


/*----------------------------------------------------------------------------
 * DUMP Service Structures
 * -------------------------------------------------------------------------*/
/** @addtogroup tz_datatypes
@{ */

/**
  * Memory protection-related device types.
  */
typedef enum
{
  TZ_DEVICE_VIDEO        =  0,      /**< Video subsystem. */
  TZ_DEVICE_MDSS         =  1,      /**< MDSS subsystem. */
  TZ_DEVICE_LPASS        =  2,      /**< Low-power audio subsystem. */
  TZ_DEVICE_MDSS_BOOT    =  3,      /**< MDSS subsystem at cold boot. */
  TZ_DEVICE_USB1_HS      =  4,      /**< High speed USB. */
  TZ_DEVICE_OCMEM        =  5,      /**< OCMEM registers. @newpage */
  TZ_DEVICE_LPASS_CORE   =  6,
  TZ_DEVICE_VPU          =  7,
  TZ_DEVICE_COPSS_SMMU   =  8,
  TZ_DEVICE_USB3_0       =  9,
  TZ_DEVICE_USB3_1       = 10,
  TZ_DEVICE_PCIE_0       = 11,
  TZ_DEVICE_PCIE_1       = 12,
  TZ_DEVICE_BCSS         = 13,
  TZ_DEVICE_VCAP         = 14,
  TZ_DEVICE_PCIE20       = 15,
  TZ_DEVICE_IPA          = 16,
  TZ_DEVICE_APPS         = 17,
  TZ_DEVICE_GPU          = 18,
  TZ_DEVICE_UFS          = 19,
  TZ_DEVICE_ICE          = 20,
  TZ_DEVICE_COUNT,
  TZ_DEVICE_MAX = 0x7FFFFFFF,
}tz_device_e_type;

/** @} */ /* end_addtogroup tz_datatypes */

/**
   @weakgroup weak_tz_pil_qdsp6_nmi_req_s
@{
*/
typedef struct tz_pil_qdsp6_nmi_req_s
{
  UINT64               val;         /**< Value for the LPASS Hexagon
                                         NMI register. Bits other
                                         than the least significant
                                         one are ignored by the
                                         call. */
} __attribute__ ((packed)) tz_pil_qdsp6_nmi_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_dump_set_cpu_ctx_buf_req_s
@{
*/
typedef struct tz_dump_set_cpu_ctx_buf_req_s
{
  UINT64               addr;        /**< Address of the WDT reset
                                         context dump buffer. When a
                                         nonsecure WDT expires, the
                                         CPU contexts are saved to
                                         this buffer. The entire
                                         buffer must be in nonsecure
                                         memory. */

  UINT64               size;        /**< Size of the WDT reset context
                                         dump buffer in bytes. */
} __attribute__ ((packed)) tz_dump_set_cpu_ctx_buf_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_dump_set_cache_buf_req_s
@{
*/
typedef struct tz_dump_set_cache_buf_req_s
{
  UINT64               addr;        /**< Address of L1 or L2 dump buffer.

                                         When a nonsecure WDT that is
                                         configured as a Fast Interrupt
                                         Request (FIQ) expires, or if the
                                         nonsecure side requests L1 dumping,
                                         L1 caches are saved to this buffer.

                                         The entire buffer must be in nonsecure
                                         memory and must be 4 KB aligned.
                                         L2 is dumped only on a nonsecure
                                         side request. */

  UINT64               size;        /**< Size of the L1 dump buffer in
                                         bytes. */
} __attribute__ ((packed)) tz_dump_set_cache_buf_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_dump_query_cache_buf_size_req_s
@{
*/
typedef struct tz_dump_query_cache_buf_size_req_s
{
  UINT64               spare;       /**< Spare field for future use;
                                         must be zero. */
} __attribute__ ((packed)) tz_dump_query_cache_buf_size_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_dump_query_cache_buf_size_rsp_s
@{
*/
typedef struct tz_dump_query_cache_buf_size_rsp_s
{
  struct tz_syscall_rsp_s  common_rsp;
  UINT64               size;        /**< After a successfull call, the L1/L2
                                         dump size in bytes is stored
                                         here. */
} __attribute__ ((packed)) tz_dump_query_cache_buf_size_rsp_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_dump_set_ocmem_buf_req_s
@{
*/
typedef struct tz_dump_set_ocmem_buf_req_s
{
  UINT64                        addr;
    /**< Address of OCMEM dump buffer. When a nonsecure WDT as an FIQ
         expires, or if the nonsecure side requests OCMEM dumping, OCMEM
         data is saved to this buffer.

         The entire buffer must be in nonsecure memory and must be 4KB aligned. */

  UINT64                        size;
    /**< Size of the dump buffer in bytes. */
} __attribute__ ((packed)) tz_dump_set_ocmem_buf_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_dump_query_ocmem_buf_size_req_s
@{
*/
typedef struct tz_dump_query_ocmem_buf_size_req_s
{
  UINT64               spare;       /**< Spare field for future use;
                                         must be zero. */
} __attribute__ ((packed)) tz_dump_query_ocmem_buf_size_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_dump_query_ocmem_buf_size_rsp_s
@{
*/
typedef struct tz_dump_query_ocmem_buf_size_rsp_s
{
  tz_syscall_rsp_t              common_rsp; /**< Common response structure */
  UINT64                        size;        /**< After a successfull call, the
                                                  OCMEM dump size in bytes is
                                                  stored here. */
} __attribute__ ((packed)) tz_dump_query_ocmem_buf_size_rsp_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_security_allows_mem_dump_legacy_req_s
@{
*/
typedef struct tz_security_allows_mem_dump_legacy_req_s
{
  UINT64                      rsp;
                                    /**< If non-zero, the security policy
                                         permits dumping memory for
                                         debugging. */
  UINT64                      rsp_len;
} __attribute__ ((packed)) tz_security_allows_mem_dump_legacy_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup tz_dump_smmu_fault_regs_req_s
@{
*/
typedef struct tz_dump_smmu_fault_regs_req_s
{
  UINT64               deviceid;    /**< SMMU ID see #tz_device_e_type. */
  UINT64               cb_number;   /**< CB # */
  UINT64               addr;        /**< Address of Fault regs dump buffer. */
  UINT64               size;       /**< Size of the Fault regs dump buffer. */
} __attribute__ ((packed)) tz_dump_smmu_fault_regs_req_t;

/** @} */ /* end_weakgroup */


/**
   @weakgroup weak_tz_security_is_retail_unlock_rsp_s
@{
*/
typedef struct tz_security_is_retail_unlock_rsp_s
{
  tz_syscall_rsp_t            common_rsp; /**< Common response structure */
  UINT64                      enabled;
                                    /**< If non-zero, the retail unlock
                                         is enable. */
} __attribute__ ((packed)) tz_security_is_retail_unlock_rsp_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_set_address_to_dump_tz_diag_for_uefi_req_s
@{
*/
typedef struct tz_set_address_to_dump_tz_diag_for_uefi_req_s
{
  UINT64               addr;        /**< Address to dump TZ diag at. */

  UINT64               size;        /**< Size of memory to dump. */
} __attribute__ ((packed)) tz_set_address_to_dump_tz_diag_for_uefi_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_rpm_online_dump_req_s
@{
*/
typedef struct tz_rpm_online_dump_req_s
{
  UINT64               unused;        /**< Unused. */
} __attribute__ ((packed)) tz_rpm_online_dump_req_s;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_security_allows_mem_dump_rsp_s
@{
*/
typedef struct tz_security_allows_mem_dump_rsp_s
{
  tz_syscall_rsp_t            common_rsp; /**< Common response structure */
  UINT64                      allowed;
                                    /**< If non-zero, the security policy
                                         permits dumping memory for
                                         debugging. */
} __attribute__ ((packed)) tz_security_allows_mem_dump_rsp_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_dump_rpm_online_req_s
@{
*/
typedef struct tz_dump_rpm_online_req_s
{
  UINT64                   spare;                 /**< spare argument for future use */
} tz_dump_rpm_online_req_t;

/** @} */ /* end_weakgroup */

/*----------------------------------------------------------------------------
 * RES_LOCKING Service Structures
 * -------------------------------------------------------------------------*/

/** @addtogroup tz_datatypes
@{ */

/**
   Hardware resources available for configuration and locking by
   the QSEE.

   @note1hang The CE numbering is logical and does not map to actual
              hardware CE naming directly.
*/
typedef enum
{
  TZ_RESOURCE_CE1    = 1, /**< @deprecated This enum member is deprecated.
                                  Use TZ_RESOURCE_CE_MSS. */
  TZ_RESOURCE_CE_MSS = 1, /**< Modem CE resource. */
  TZ_RESOURCE_CE2    = 2, /**< @deprecated This enum member is
                                  deprecated. Use TZ_RESOURCE_CE_AP. */
  TZ_RESOURCE_CE_AP  = 2, /**< Application processor's CE resource. */
  TZ_RESOURCE_RNG    = 3  /**< Random number generator. */
} TZ_XPU_RESOURCE_ET;

/** @} */ /* end_addtogroup tz_datatypes */

/**
   @weakgroup weak_tz_lock_resource_req_s
@{
*/
typedef struct tz_lock_resource_req_s
{
  UINT64               res;         /**< Resource to lock. See
                                         #TZ_XPU_RESOURCE_ET. */

  UINT64               lock;        /**< Set to 1 to lock the resource
                                         and 0 to unlock it. */
} __attribute__ ((packed)) tz_lock_resource_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_lock_resource_rsp_s
@{
*/
typedef struct tz_lock_resource_rsp_s
{
  tz_syscall_rsp_t     common_rsp; /**< Common response structure */
  INT64                ret;         /**< Return code: 0 means success;
                                         E_BUSY means the resource is
                                         locked; other negative
                                         values mean failure. */
} __attribute__ ((packed)) tz_lock_resource_rsp_t;

/** @} */ /* end_weakgroup */


/** @addtogroup tz_macros_constants
@{ */

/** @name Crypto Engine Access Method
@{ */

/**
   Application processor accesses the crypto engine using registers.
*/
#define TZ_RESCFG_AP_CE_REGISTER_USE  0
/**
   Application processor accesses the crypto engine using the data mover.
*/
#define TZ_RESCFG_AP_CE_ADM_USE       1

/** @} */ /* end_namegroup Crypto Engine Access Method */

/** @} */ /* end_addtogroup tz_macros_constants */


/**
   @weakgroup weak_tz_config_resource_req_s
@{
*/
typedef struct tz_config_resource_req_s
{
  UINT64               res;         /**< Resource to configure. See
                                         #TZ_XPU_RESOURCE_ET. */

  UINT64               arg;         /**< Argument to the resource
                                         configuration. */
} __attribute__ ((packed)) tz_config_resource_req_t;

/** @} */ /* end_weakgroup */

/** @addtogroup tz_datatypes
@{ */

/**
    List of software fuses supported by the QSEE.
 */
typedef enum
{
  TZ_HLOS_IMG_TAMPER_FUSE	= 0, /**< Used during boot to determine
                                        if the HLOS image has successfully
                                        been authenticated. */
  TZ_WINSECAPP_LOADED_FUSE  	= 1, /**< Used by the WinSec application to
                                        prevent reloading. */
  TZ_UEFISECAPP_LOADED_FUSE 	= 2, /**< Used by UefiSecApp to prevent
                                        reloading. */
  TZ_OEM_FUSE_1             	= 3, /**< Reserved fuse bit for OEMs. */

  TZ_OEM_FUSE_2             	= 4, /**< Reserved fuse bit for OEMs. */

  TZ_OEM_FUSE_3             	= 5, /**< Reserved fuse bit for OEMs. */

  TZ_OEM_FUSE_4             	= 6, /**< Reserved fuse bit for OEMs. */

  TZ_OEM_FUSE_5             	= 7, /**< Reserved fuse bit for OEMs. */

  TZ_OEM_FUSE_6             	= 8, /**< Reserved fuse bit for OEMs. */

  TZ_OEM_FUSE_7            	= 9, /**< Reserved fuse bit for OEMs. */

  TZ_OEM_FUSE_8             	= 10, /**< Reserved fuse bit for OEMs. */

  TZ_OEM_FUSE_9             	= 11, /**< Reserved fuse bit for OEMs. */

  TZ_OEM_FUSE_10            	= 12, /**< Reserved fuse bit for OEMs. */

  TZ_OEM_FUSE_11            	= 13, /**< Reserved fuse bit for OEMs. */

  TZ_OEM_FUSE_12            	= 14, /**< Reserved fuse bit for OEMs. */

  TZ_MDTP_RECOVERY_MS_FUSE  	= 15, /**< Used by MDTP to prevent
                                                                                                    access to Bootloader APIs. */
  TZ_MDTP_HLOS_MS_FUSE      	= 16, /**< Used by MDTP to prevent
                                                                                                    access to Bootloader & Recovery APIs. */
  TZ_QCOM_RESERVED_FUSE_1   	= 17, /**< Reserved fuse bit for QCOM. */

  TZ_QCOM_RESERVED_FUSE_2   	= 18, /**< Reserved fuse bit for QCOM. */

  TZ_QCOM_RESERVED_FUSE_3   	= 19, /**< Reserved fuse bit for QCOM. */

  TZ_QCOM_RESERVED_FUSE_4   	= 20, /**< Reserved fuse bit for QCOM. */

  TZ_QCOM_RESERVED_FUSE_5   	= 21, /**< Reserved fuse bit for QCOM. */

  TZ_HLOS_BL_MILESTONE_FUSE 	= 22, /**< Used to notify the bootloader milestone call.*/

  TZ_HLOS_TAMPER_NOTIFY_FUSE	= 23, /**< Used to notify TZ that HLOS has been tampered.*/  

  TZ_NUM_SW_FUSES           	= 24  /**< Number of supported software fuses.
                                        @newpage */
} tz_sw_fuse_t;

/* Enumerate BLSP subsystem owners */
typedef enum
{
  tzbsp_blsp_owner_none = 0,
  tzbsp_blsp_owner_apss = 1,
  tzbsp_blsp_owner_adsp = 2
} tzbsp_blsp_owner_ss_type;
/** @} */ /* end_addtogroup tz_datatypes */

/**
   @weakgroup weak_tz_modify_ownership_req_s
@{
*/
typedef struct tz_modify_blsp_ownership_req_s
{
  UINT64                   blsp_periph_num;         
                                    /* blsp peripheral number. */
  UINT64                   owner_ss;         
                                    /* Owner subsystem. See tzbsp_blsp_owner_ss_type */
} __attribute__ ((packed)) tz_modify_blsp_ownership_req_t;
/** @} */ /* end_weakgroup */


/*----------------------------------------------------------------------------
 * INFO Service Structures
 * -------------------------------------------------------------------------*/
/**
   @weakgroup weak_tz_info_is_svc_available_req_s
@{
*/
typedef struct tz_info_is_svc_available_req_s
{
  UINT64               id;          /**< Command ID of the queried service. */
} __attribute__ ((packed)) tz_info_is_svc_available_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_info_is_svc_available_rsp_s
@{
*/
typedef struct tz_info_is_svc_available_rsp_s
{
  tz_syscall_rsp_t     common_rsp; /**< Common response structure */
  BOOLEAN              found;       /**< If TRUE, the searched service
                                         was found; FALSE otherwise. */
} __attribute__ ((packed)) tz_info_is_svc_available_rsp_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_info_get_diag_req_s
@{
*/
typedef struct tz_info_get_diag_req_s
{
  UINT64               buffer;      /**< Pointer to the buffer to where the
                                         QSEE software copies the
                                         diagnostic area. */
  UINT64               buffer_size; /**< Size of the buffer in bytes.
                                         This must be at least the
                                         size of the diagnostic
                                         area. If the buffer is larger
                                         than the diagnostic area, the
                                         remaining bytes are ignored
                                         by the QSEE software. */
} __attribute__ ((packed)) tz_info_get_diag_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_feature_version_req_s
@{
*/
typedef struct tz_feature_version_req_s
{
  UINT64               feature_id;  /**< Feature for which to request
                                         the version information.
                                         See #tz_feature_t. */
} __attribute__ ((packed)) tz_feature_version_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_feature_version_rsp_s
@{
*/
typedef struct tz_feature_version_rsp_s
{
  tz_syscall_rsp_t     common_rsp; /**< Common response structure */
  UINT64               version;     /**< Version of the specified
                                         feature, or zero if the
                                         feature is undefined. */
} __attribute__ ((packed)) tz_feature_version_rsp_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_get_secure_state_rsp_s
@{
*/
typedef struct tz_get_secure_state_rsp_s
{
  tz_syscall_rsp_t              common_rsp; /**< Common response structure */
  UINT64                        status_0;  /**< First half of the secure status. */
  UINT64                        status_1;  /**< Second half of the secure status. */
}__attribute__ ((packed)) tz_get_secure_state_rsp_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_get_secure_state_legacy_req_s
@{
*/
typedef struct tz_get_secure_state_legacy_req_s
{
  UINT64                        status_ptr;  /**< Pointer to the query status struct. */
  UINT64                        status_len;  /**< Length of the query status struct. */
}__attribute__ ((packed)) tz_get_secure_state_legacy_req_t;

/** @} */ /* end_weakgroup */

/*----------------------------------------------------------------------------
 * SSD Service Structures
 * -------------------------------------------------------------------------*/
/**
   @weakgroup weak_tz_ssd_decrypt_img_req_s
@{
*/
typedef struct tz_ssd_decrypt_img_req_s
{
  UINT64               img_ptr;     /**< Double pointer to the image. */
  UINT64               img_len_ptr; /**< Pointer to the length of the
                                         image. */
} __attribute__ ((packed)) tz_ssd_decrypt_img_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_ssd_encrypt_keystore_req_s
@{
*/
typedef struct tz_ssd_encrypt_keystore_req_s
{
  UINT64               keystore_ptr;      /**< Double pointer to the
                                               keystore. */
  UINT64               keystore_len_ptr;  /**< Pointer to the length
                                               of the keystore. */
} __attribute__ ((packed)) tz_ssd_encrypt_keystore_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_ssd_protect_keystore_req_s
@{
*/
typedef struct tz_ssd_protect_keystore_req_s
{
  UINT64                        keystore_ptr;  /**< Pointer to SSD keystore. */
  UINT64                        keystore_len;  /**< Length of the keystore. */
} __attribute__ ((packed)) tz_ssd_protect_keystore_req_t;

/** @} */ /* end_weakgroup */

/** @addtogroup tz_datatypes
@{ */

/**
   Return types for the Load Keystore command.
*/
typedef enum
{
  TZ_SSD_PKS_SUCCESS            = 0, /**< Successful return. */
  TZ_SSD_PKS_INVALID_PTR        = 1, /**< Keystore pointer invalid. */
  TZ_SSD_PKS_INVALID_LEN        = 2, /**< Keystore length incorrect. */
  TZ_SSD_PKS_UNALIGNED_PTR      = 3, /**< Keystore pointer not word
                                             aligned. */
  TZ_SSD_PKS_PROTECT_MEM_FAILED = 4, /**< Failure when protecting
                                             the keystore memory.*/
  TZ_SSD_PKS_INVALID_NUM_KEYS   = 5, /**< Unsupported number of
                                          keys passed. If a valid
                                          pointer to nonsecure
                                          memory is passed that
                                          is not a keystore, this is
                                          a likely return code. */
  TZ_SSD_PKS_DECRYPT_FAILED     = 6  /**< Keystore could not be
                                          decrypted. */
} tz_ssd_pks_return_type;

/** @} */ /* end_addtogroup tz_datatypes */

/**
   @weakgroup weak_tz_ssd_protect_keystore_rsp_s
@{
*/
typedef struct tz_ssd_protect_keystore_rsp_s
{
  tz_syscall_rsp_t              common_rsp; /**< Common response structure */
  UINT64                        status;       /**< Status of the load keystore
                                                   call.  See
                                                   #tz_ssd_pks_return_type.
                                               */
} __attribute__ ((packed)) tz_ssd_protect_keystore_rsp_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_ssd_parse_md_req_s
@{
*/
typedef struct tz_ssd_parse_md_req_s
{
  UINT64                        md_len;       /**< Length of the metadata. */
  UINT64                        md;           /**< PoINTer to the metadata to
                                                   parse. The memory must be
                                                   word-aligned, as the type
                                                   implies. */
} __attribute__ ((packed)) tz_ssd_parse_md_req_t;

/** @} */ /* end_weakgroup */

/** @addtogroup tz_datatypes
@{ */

/**
   Return types for the parse metadata command.
*/
typedef enum
{
  TZ_SSD_PMD_ENCRYPTED             = 0,    /**< Parsing was successful
                                                   and the image is
                                                   encrypted. */
  TZ_SSD_PMD_NOT_ENCRYPTED         = 1,    /**< Parsing was successful
                                                   and the image is not
                                                   encrypted. */
  TZ_SSD_PMD_NO_MD_FOUND           = 3,    /**< No SSD metadata
                                                   start tag was found
                                                   in the given
                                                   memory. This
                                                   proably indicates
                                                   that the image is
                                                   not encrypted. It
                                                   could also indicate
                                                   the start tag was
                                                   truncated. */
  TZ_SSD_PMD_BUSY                  = 4,    /**< Parsing was not attempted
                                                   because no parsing context
                                                   was available at this
                                                   time. */
  TZ_SSD_PMD_BAD_MD_PTR_OR_LEN     = 5,    /**< Could not search the
                                                   memory because the
                                                   pointer or length was
                                                   bad. */
  TZ_SSD_PMD_PARSING_INCOMPLETE    = 6,    /**< The parsed metadata
                                                   is incomplete. Call
                                                   again with a larger
                                                   buffer to scan. */
  TZ_SSD_PMD_PARSING_FAILED        = 7,    /**< There was a parsing
                                                   error in the metadata. */
  TZ_SSD_PMD_SETUP_CIPHER_FAILED   = 8,    /**< There was a problem
                                                   finding the correct key
                                                   in the keystore or
                                                   initializing the crypto
                                                   hardware. */
} tz_ssd_pmd_return_type;

/** @} */ /* end_addtogroup tz_datatypes */


/**
   @weakgroup weak_tz_ssd_parse_md_rsp_info_s
@{
*/
typedef struct tz_ssd_parse_md_rsp_info_s
{
  UINT64                        status;       /**< Status of request. See
                                                   #tz_ssd_pmd_return_type.
                                               */
  UINT64                        md_ctx_id;    /**< Context ID to use for a
                                                   decrypt fragment call. */
  UINT64                        md_end_ptr;   /**< Pointer to the first memory
                                                   after the SSD metadata.
                                                   This pointer is always
                                                   word-aligned. If the
                                                   image was encrypted all at
                                                   once, this is the
                                                   start of the encrypted
                                                   data. */
} __attribute__ ((packed)) tz_ssd_parse_md_rsp_info_t;

/** @} */ /* end_weakgroup */


/**
   @weakgroup weak_tz_ssd_parse_md_rsp_s
@{
*/
typedef struct tz_ssd_parse_md_rsp_s
{
  tz_syscall_rsp_t              common_rsp; /**< Common response structure */
  struct tz_ssd_parse_md_rsp_info_s    rsp;   /**< Parse MD response
                                                   structure. */
} __attribute__ ((packed)) tz_ssd_parse_md_rsp_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_ssd_decrypt_img_frag_req_s
@{
*/
typedef struct tz_ssd_decrypt_img_frag_req_s
{
  UINT64                        md_ctx_id;    /**< Context ID given in the
                                                   parse metadata call. */
  UINT64                        last_frag;    /**< Whether the passed
                                                   fragment is the
                                                   last one (1 = last
                                                   fragment). */
  UINT64                        frag_len;     /**< Length of the
                                                   fragment. The
                                                   fragment length must
                                                   be a multiple of the
                                                   encryption block
                                                   size.  */
  UINT64                        frag;         /**< Encrypted fragment.
                                                   The fragment must
                                                   be word-aligned, as
                                                   noted by the
                                                   UINT32* type. */
} __attribute__ ((packed)) tz_ssd_decrypt_frag_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_ssd_decrypt_elf_seg_frag_req_s
@{
*/
typedef struct tz_ssd_decrypt_elf_seg_frag_req_s
{
  UINT64                        md_ctx_id;    /**< Context ID given in the
                                                   parse metadata call. */
  UINT64                        segment_num;  /**< ELF segment number
                                                   for the given
                                                   fragment. Note that
                                                   all the fragments
                                                   for a given ELF
                                                   segment must be
                                                   received before
                                                   going to the next
                                                   segment. */
  UINT64                        last_seg;     /**< Whether the current
                                                   segment is the last
                                                   one (1 = last segment). */
  UINT64                        last_frag;    /**< Whether the passed
                                                   fragment is the last
                                                   one for a given
                                                   segment_num (1 =
                                                   last fragment). */
  UINT64                        frag_len;     /**< Length of the fragment.
                                                   The fragment length
                                                   must be a multiple of the
                                                   encryption block size
                                                   unless the last_frag flag
                                                   is passed.  */
  UINT64                        frag;         /**< Encrypted fragment.
                                                   The fragment must
                                                   be word-aligned, as
                                                   noted by the
                                                   UINT32* type. */
} __attribute__ ((packed)) tz_ssd_decrypt_elf_seg_frag_req_t;

/** @} */ /* end_weakgroup */



/** @addtogroup tz_datatypes
@{ */

/**
   Return types for the Decrypt (image/ELF segment) Fragment command.
*/
typedef enum
{
  TZ_SSD_DF_SUCCESS               = 0,     /**< Fragment decrypted
                                                   successfully. */
  TZ_SSD_DF_BAD_FRAG_PTR_OR_LEN   = 1,     /**< Fragment pointer or
                                                   length incorrect. */
  TZ_SSD_DF_CTX_NOT_FOUND         = 2,     /**< Fragment context
                                                   not found in
                                                   currently available
                                                   contexts. */
  TZ_SSD_DF_LEN_ALIGNMENT_FAILED  = 3,     /**< Length alignment of the
                                                   fragment is incorrect. */
  TZ_SSD_DF_DECRYPTION_FAILED     = 4      /**< Problem with decryption. */
} tz_ssd_df_return_type;

/** @} */ /* end_addtogroup tz_datatypes */


/**
   @weakgroup weak_tz_ssd_decrypt_frag_rsp_s
@{
*/
typedef struct tz_ssd_decrypt_frag_rsp_s
{
  tz_syscall_rsp_t              common_rsp; /**< Common response structure */
  UINT64                        status;       /**< Status of the decrypt
                                                   request.  See
                                                   #tz_ssd_df_return_type.
                                               */
} __attribute__ ((packed)) tz_ssd_decrypt_frag_rsp_t;

/** @} */ /* end_weakgroup */

/*----------------------------------------------------------------------------
 * FUSE Service Structures
 * -------------------------------------------------------------------------*/
/**
   @weakgroup weak_tz_sw_fuse_req_s
@{
*/
typedef struct tz_sw_fuse_req_s
{
  UINT64               fuse_id;     /**< Fuse ID. See
                                         #tz_sw_fuse_t. */
} __attribute__ ((packed)) tz_sw_fuse_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_sw_fuse_rsp_s
@{
*/
typedef struct tz_sw_fuse_rsp_s
{
  tz_syscall_rsp_t     common_rsp; /**< Common response structure */
  BOOLEAN              fuse_blown;  /**< If TRUE, the specified fuse
                                         was blown; FALSE
                                         otherwise. */
} __attribute__ ((packed)) tz_sw_fuse_rsp_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_qfprom_write_row_s
@{
*/
typedef struct tz_qfprom_write_row_s
{
  UINT64               raw_row_address;    /**< Raw row address of the fuse
                                                to blow. */
  UINT64               row_data;           /**< Pointer to the data buffer. */
  UINT64               bus_clk_khz;        /**< Bus clock speed in KHz. */
  UINT64               qfprom_api_status;  /**< Status code from the QFPROM. */
} __attribute__ ((packed)) tz_qfprom_write_row_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_qfprom_write_multiple_rows_s
@{
*/
typedef struct tz_qfprom_write_multiple_rows_s
{
  UINT64               row_array;          /**< Row array. */
  UINT64               row_array_size;     /**< Size of the row array. */
  UINT64               bus_clk_khz;        /**< Bus clock in KHz. */
  UINT64               qfprom_api_status;  /**< Status code from the QFPROM. */
} __attribute__ ((packed)) tz_qfprom_write_multiple_rows_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_qfprom_read_row_s
@{
*/
typedef struct tz_qfprom_read_row_s
{
  UINT64               row_address;        /**< Row address of the fuse to
                                                read. */
  INT64                addr_type;          /**< Indicates whether the address
                                                is raw corrected. */
  UINT64               row_data;           /**< Pointer to the buffer that is
                                                to hold the read data. */
  UINT64               qfprom_api_status;  /**< Status code from the QFPROM. */
} __attribute__ ((packed)) tz_qfprom_read_row_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_qfprom_rollback_write_row_s
@{
*/
typedef struct tz_qfprom_rollback_write_row_s
{
  UINT64               raw_row_address;    /**< Raw row address of the fuse
                                                to blow. */
  UINT64               row_data;           /**< Pointer to the data buffer. */
  UINT64               bus_clk_khz;        /**< Bus clock in KHz. */
  UINT64               qfprom_api_status;  /**< Status code from the QFPROM. */
} __attribute__ ((packed)) tz_qfprom_rollback_write_row_t;

/** @} */ /* end_weakgroup */

/*----------------------------------------------------------------------------
 * CRYPTO Service Structures
 * -------------------------------------------------------------------------*/
/**
   @weakgroup weak_tz_get_prng_data_s
@{
*/
typedef struct tz_get_prng_data_s
{
  UINT64                out_buf;     /**< Pointer to the buffer to fill
                                          with data from the PRNG. */
  UINT64                out_buf_sz;  /**< Size of the output buffer. */
} __attribute__ ((packed)) tz_get_prng_data_t;

/** @} */ /* end_weakgroup */

/*----------------------------------------------------------------------------
 * SC_KEY_EXCHANGE Service Structures
 * -------------------------------------------------------------------------*/
/**
   @weakgroup weak_tz_sc_init_s
@{
*/
typedef struct tz_sc_init_s
{
  UINT64                ssid;        /**< Subsystem ID. See
                                          #tz_sc_ss_e_type. */
  UINT64                address_ptr; /**< Pointer to the address location. */
  UINT64                len;         /**< Length of the allocated memory. */
  INT64                 status_ptr;  /**< Return status. */
} __attribute__ ((packed)) tz_sc_init_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_sc_deinit_s
@{
*/
typedef struct tz_sc_deinit_s
{
  UINT64               ssid;          /**< Subsystem ID. */
  INT64                status_ptr;    /**< Return status. */
} __attribute__ ((packed)) tz_sc_deinit_t;

/** @} */ /* end_weakgroup */

/*----------------------------------------------------------------------------
 * MEMORY_PROTECTION Service Structures
 * -------------------------------------------------------------------------*/
/** @addtogroup tz_datatypes
@{ */

/**
   Enumerates memory usage hints.
*/
typedef enum
{
  /** Memory used for video SMMU page tables */
  TZBSP_MEM_MPU_USAGE_CP_PTBL             = 0x1,

  /** Memory used for QSEE Req/Rsp region  */
  TZBSP_MEM_MPU_USAGE_QSEE_REQRSP_REGION  = 0x2,

  /** Memory used for QSEE Secure Area region  */
  TZBSP_MEM_MPU_USAGE_QSEE_SA_REGION      = 0x3,

  /** Memory used for a variety of secure uses. */
  TZBSP_MEM_MPU_USAGE_SDDR_REGION         = 0x4,

  /** Memory used for QSEE Shared Buffer region  */
  TZBSP_MEM_MPU_USAGE_QSEE_SB_REGION      = 0x5,

  /** Max value */
  TZBSP_MEM_MPU_USAGE_MAX,

  TZBSP_MEM_MPU_USAGE_UNKNOWN  = 0x7fffffff
}tzbsp_mem_mpu_usage_e_type;


/** @} */ /* end_addtogroup tz_datatypes */

/**
   @weakgroup weak_hyp_memprot_chunks_info_s
@{
*/
typedef struct hyp_memprot_ipa_info_s
{
  UINT64              IPAaddr;         /**< IPA address is 64-bit intermediate physical
                                            address. */

  UINT64              IPAsize;         /**< sizes in bytes of IPA address */

} __attribute__ ((packed)) hyp_memprot_ipa_info_t;

/** @} */ /* end_weakgroup */

/** @addtogroup tz_datatypes
@{ */

typedef enum
{
  AC_VM_NONE,
  AC_VM_TZ,
  AC_VM_RPM,  /* Single stage */
  AC_VM_HLOS,
  AC_VM_HYP,
  AC_VM_SSC_Q6_ELF, /* Single */  /* IPA = PA */
  AC_VM_ADSP_Q6_ELF, /* Single */
  AC_VM_SSC_HLOS,   /* ??, may be we combine this with other SSC one */
  AC_VM_CP_TOUCH,
  AC_VM_CP_BITSTREAM,
  AC_VM_CP_PIXEL,
  AC_VM_CP_NON_PIXEL,
  AC_VM_VIDEO_FW,
  AC_VM_CP_CAMERA,
  AC_VM_HLOS_UNMAPPED,  /* Memory owned by HLOS but not currently mapped in HLOS VM */
  AC_VM_MSS_MSA, /* This is MSA=1 view */
  AC_VM_MSS_NONMSA, /* IPA not equal PA */
  AC_VM_CP_SPSS_SP = 0x1A,
  AC_VM_CP_SPSS_SP_SHARED = 0x22,
  AC_VM_CP_SPSS_HLOS_SHARED = 0x24,
  AC_VM_MSS_NAV = 0x2B,
  AC_VM_WLAN_DSP = 0x2C,
  AC_VM_LAST,
  AC_VM_MAX = 0x7FFFFFFF,
}ACVirtualMachineId;

#define VM_PERM_X 0x1
#define VM_PERM_W 0x2
#define VM_PERM_R 0x4

/** @} */ /* end_addtogroup tz_datatypes */

/**
   @weakgroup weak_hyp_memprot_dstVM_perm_info_s
@{
*/

typedef struct hyp_memprot_dstVM_perm_info_s
{
  UINT32              dstVM;         /**< Destination VM defined by ACVirtualMachineId*/

  UINT32              dstVMperm;     /**< Permissions of IPA to be mapped to VM, bitwise OR of AC_PERM_* */

  UINT64              ctx;          /**< destination VM specific Context information */

  UINT32              ctxsize;       /**< size of ctx buffer in bytes */

} hyp_memprot_dstVM_perm_info_t;


/**
   @weakgroup weak_hyp_memprot_assign_s
@{
*/
typedef struct hyp_memprot_assign_s
{
  UINT64                                 IPAinfolist;          /**< List of IPAinfo structures #hyp_memprot_ipa_info_t */

  UINT64                                 IPAinfolistsize; /**< size in bytes of IPAinfolist entries*/

  UINT64                                 sourceVMlist;   /**< Source VMlist, defined by ACVirtualMachineId #UINT32 */

  UINT64                                 srcVMlistsize;   /**< Size of  sourceVMlist in bytes*/

  UINT64                                 destVMlist;     /**< Defined by #hyp_memprot_dstVM_perm_info_t*/

  UINT64                                 destVMlistsize;   /**< size of  destVMlistAndPerm in bytes*/

  UINT64                                 spare;           /**< Reserved for future use */
} __attribute__ ((packed)) hyp_memprot_assign_t;

/** @} */ /* end_weakgroup */


/**
   @weakgroup weak_tz_memprot_tagVM_s
@{
*/
typedef struct tz_memprot_tagVM_t
{
  UINT64                         IPAinfolist;    /**< List of IPAinfo structures #hyp_memprot_ipa_info_t */

  UINT64                         IPAinfolistsize; /**< size in bytes of IPAinfolist entries*/

  UINT64                         destVMlist;     /**< Destination VMlist, defined by ACVirtualMachineId #UINT32 */

  UINT64                         dstVMlistsize;   /**< Total number of entries of the destVMlist */

  UINT64                         flags;           /**< Reserved for future use */
} __attribute__ ((packed)) tz_memprot_tagVM_t;

/** @} */ /* end_weakgroup */


/**
   @weakgroup weak_tz_protect_memory_s
@{
*/
typedef struct tz_protect_memory_s
{
  UINT64                     start;      /**< Start address of the range. */
  UINT64                     size;       /**< Size of the region in bytes. */
  UINT64                     tag_id;     /**< A tag that specifies this
                                              region's usage #tzbsp_mem_mpu_usage_e_type */
  UINT64                     lock;       /**< TRUE to protect; FALSE
                                         to unprotect. */
  UINT64                     flags;      /**< Optional Flags. */
} __attribute__ ((packed)) tz_protect_memory_t;

/** @} */ /* end_weakgroup */

/*----------------------------------------------------------------------------
 * Memory protection service structures
 * -------------------------------------------------------------------------*/

/**
   @weakgroup weak_tz_restore_sec_cfg_req_s
@{
*/

typedef struct tz_restore_sec_cfg_req_s
{
  UINT64                        device;
                                          /**< Device to be restored;
                                               see #tz_device_e_type. */
  UINT64                        spare;       /**< Spare. */
} __attribute__ ((packed)) tz_restore_sec_cfg_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_set_vmidmt_memtype_req_s
@{
*/
typedef struct tz_set_vmidmt_memtype_req_s
{
  UINT64                        device;
                                             /**< Device to be configured;
                                               see #tz_device_e_type. */
  UINT64                        vmid_idx;    /**< Index for the memtype to be set;
                                               0xFF for all indecies. */
  UINT64                        memtype;     /**< Memory type value to be set. */
} __attribute__ ((packed)) tz_set_vmidmt_memtype_req_t;

/** @} */ /* end_weakgroup */


/**
   @weakgroup weak_tz_memprot_video_var_req_s
@{
*/
typedef struct tz_memprot_video_var_req_s
{
  UINT64                     cp_start;
    /**< Start address of the secure memory (CP) range in the device's virtual
         address space. */
  UINT64                     cp_size;
    /**< Size of the secure memory range (CP) in the device's virtual address
         space. The end address is calculated as: cp_end = [cp_start +
         cp_size - 1]. */
  UINT64                     cp_nonpixel_start;
    /**< Start address of nonpixel data in the device's virtual address space.
         Set cp_start < cp_nonpixel_start < cp_end cp_nonpixel so that the
         range does not overlap with the firmware image.*/
  UINT64                     cp_nonpixel_size;
    /**< Size of nonpixel data in the device's virtual address space. The end
         address is calculated as: cp_nonpixel_end = [cp_nonpixel_start +
         cp_nonpixel_size - 1]. Also, set cp_nonpixel_start < cp_nonpixel_end
         @le cp_end cp_nonpixel so that the range does not overlap with the
         firmware image. */
} __attribute__ ((packed)) tz_memprot_video_var_req_t;

/** @} */ /* end_weakgroup */


/**
   @weakgroup weak_tz_memprot_dev_var_req_s
@{
*/
typedef struct tz_memprot_dev_var_req_s
{
  UINT64                     device_id;
  /**< ID of the device where this memory is to be mapped.
       See #tz_device_e_type. */
  UINT64                     va_list;
    /**< a list of start address and size of the secure memory ranges in the device's
         virtual address space. */
  UINT64                     list_size;
    /**< Size of VA range list. */
} __attribute__ ((packed)) tz_memprot_dev_var_req_t;

/** @} */ /* end_weakgroup */


/**
   @weakgroup weak_tz_memprot_ptbl_mem_size_req_s
@{
*/
typedef struct tz_memprot_ptbl_mem_size_req_s
{
   UINT64                        spare;      /**< Spare field for future use,
                                                  must be zero. */
} __attribute__ ((packed)) tz_memprot_ptbl_mem_size_req_t;

/** @} */ /* end_weakgroup */


/**
   @weakgroup weak_tz_memprot_ptbl_mem_size_rsp_s
@{
*/
typedef struct tz_memprot_ptbl_mem_size_rsp_s
{
  tz_syscall_rsp_t             common_rsp; /**< Common response structure */
  UINT64                       mem_size;    /**< Required size of the
                                                 page table memory
                                                 region in bytes. */
  INT64                        ret;         /**< Extended return code; 0 for
                                                 success; negative values
                                                 mean failure. */
} __attribute__ ((packed)) tz_memprot_ptbl_mem_size_rsp_t;

/** @} */ /* end_weakgroup */


/**
   @weakgroup weak_tz_memprot_ptbl_mem_init_req_s
@{
*/
typedef struct tz_memprot_ptbl_mem_init_req_s
{
  UINT64                        addr;       /**< Start address of the page
                                                 table memory region
                                                 (16 KB aligned).  */
  UINT64                        size;       /**< Size of page table memory
                                                 region in bytes. */
  UINT64                        spare;      /**< Spare field for future use;
                                                 must be zero. */
} __attribute__ ((packed)) tz_memprot_ptbl_mem_init_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_memprot_rsp_s
@{
*/
typedef struct tz_memprot_rsp_s
{
  tz_syscall_rsp_t              common_rsp; /**< Common response structure */
  UINT64                        rsp;       /**< Result of this syscall.  */
} __attribute__ ((packed)) tz_memprot_rsp_t;

/** @} */ /* end_weakgroup */


/**
   @weakgroup weak_tz_memprot_set_cp_pool_size_req_s
@{
*/
typedef struct tz_memprot_set_cp_pool_size_req_s
{
   UINT64                        size;       /**< CP pool size */
   UINT64                        spare;      /**< Spare field for future use,
                                                  must be zero. */
} __attribute__ ((packed)) tz_memprot_set_cp_pool_size_req_t;

/** @} */ /* end_weakgroup */


/** @addtogroup tz_datatypes
@{ */

/** Enumerates memory usage. */
typedef enum
{
  TZ_MEM_USAGE_CP_VIDEO_BITSTREAM  = 0x1, /**< Memory used for video
                                                  bistream (compressed)
                                                  CP data. */
  TZ_MEM_USAGE_CP_VIDEO_PIXEL      = 0x2, /**< Memory used for video
                                                  pixel (uncompressed)
                                                  CP data. */
  TZ_MEM_USAGE_CP_VIDEO_NONPIXEL   = 0x3, /**< Memory used for video
                                                  nonpixel CP data. */
  TZ_MEM_USAGE_CP_SD               = 0x4, /**< Memory used for Secure
                                                  Display data. */
  TZ_MEM_USAGE_CP_SC               = 0x5, /**< Memory used for Secure
                                                  Camera data. */
  TZ_MEM_USAGE_CP_APP              = 0x6, /**< Memory used for appliction
                                                  data. */
  TZ_MEM_USAGE_COUNT,
  TZ_MEM_USAGE_UNKNOWN  = 0x7fffffff
}tz_mem_usage_e_type;

/** @} */ /* end_addtogroup tz_datatypes */

/**
   @weakgroup weak_tz_memprot_chunks_info_s
@{
*/
typedef struct tz_memprot_chunks_info_s
{
  UINT64              chunk_list;     /**< Array of chunk addresses. Each entry
                                           is a 32-bit physical address.
                                           chunk_list_size gives the number of
                                           entries in the array. */
  UINT64              chunk_list_size;/**< Number of chunks in the chunk
                                           list.*/
  UINT64              chunk_size;     /**< Size of each memory chunk (in bytes)
                                           in the chunk list. */
} __attribute__ ((packed)) tz_memprot_chunks_info_t;

/** @} */ /* end_weakgroup */


/**
   @weakgroup weak_tz_memprot_map_info_s
@{
*/
typedef struct tz_memprot_map_info_s
{
  UINT64              device_id;    /**< ID of the device where this memory is
                                         to be mapped. See #tz_device_e_type.
                                         The usage hint provided while
                                         protecting the memory can be used to
                                         validate this request. */
  UINT64              ctxt_bank_id; /**< Context bank ID where this memory
                                         is to be (un)mapped. These
                                         correspond to context bank numbers
                                         and are unique only for the device.
                                         Values start from 0, which corresponds
                                         to CB0. */
  UINT64              dva_start;    /**< Start address in the device's virtual
                                         address space to which to map. */
  UINT64              size;         /**< Size in bytes of the virtual address
                                         range to map. The end address is:
                                         dva_end = dva_start + size - 1. */
} __attribute__ ((packed)) tz_memprot_map_info_t;

/** @} */ /* end_weakgroup */

/** @addtogroup tz_macros_constants
@{ */


/** @name Memory Protection Method Flags
@{ */

/**
   TLB invalidate as part of a map/unmap operation.
*/
#define TZ_MEMPROT_FLAG_TLBINVALIDATE       0x00000001

/** @} */ /* end_namegroup Memory Protection Method Flags */

/** @} */ /* end_addtogroup tz_macros_constants */

/**
   @weakgroup weak_tz_memprot_lock2_legacy_req_s
@{
*/
typedef struct tz_memprot_lock2_legacy_req_s
{
  tz_memprot_chunks_info_t      chunks;    /**< Memory chunk list. */
  UINT64                        mem_usage; /**< Hint on the memory usage.
                                                See #tz_mem_usage_e_type. */
  UINT64                        lock;      /**< 1 (TRUE) to lock (protect);
                                                0 (FALSE) to unlock (unprotect). */
  UINT64                        flags;     /**< Flags field for future use;
                                                must be zero when no flags are
                                                set. */
} __attribute__ ((packed)) tz_memprot_lock2_legacy_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_memprot_map2_legacy_req_s
@{
*/
typedef struct tz_memprot_map2_legacy_req_s
{
  tz_memprot_chunks_info_t       chunks;    /**< Memory chunk list. */
  tz_memprot_map_info_t          map;       /**< Map-to information. */
  UINT64                         flags;     /**< Flags field, which is a bitwise
                                                 OR of TZ_MEMPROT_FLAG_* flags.
                                                 Currently supported flags:
                                                 TLBINVALIDATE \n
                                                 Must be zero when no flags are
                                                 set. */
} __attribute__ ((packed)) tz_memprot_map2_legacy_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_memprot_unmap2_legacy_req_s
@{ */
typedef struct tz_memprot_unmap2_legacy_req_s
{
  tz_memprot_map_info_t         map;        /**< Mapped-at information. */
  UINT64                        flags;      /**< Flags field, which is a bitwise
                                                 OR of TZ_MEMPROT_FLAG_* flags.
                                                 Currently supported flags:
                                                 TLBINVALIDATE \n
                                                 Must be zero when no flags are
                                                 set. */
} __attribute__ ((packed)) tz_memprot_unmap2_legacy_req_t;

/** @} */ /* end_weakgroup */

/** @addtogroup tz_datatypes
@{ */

/**
 Common response type for QSEE blocking kernel layer system calls.
 Individual system call headers indicate whether they use this response
 structure.
*/
typedef struct tz_common_rsp_s
{
  tz_syscall_rsp_t             common_rsp; /**< Response header. */
  INT64                        ret;        /**< Extended return
                                                code; 0 for success;
                                                negative values
                                                mean failure. */
} __attribute__ ((packed)) tz_common_rsp_t;

/** @} */ /* end_addtogroup tz_datatypes */

/**
   @weakgroup weak_tz_memprot_tlbinval_req_s
@{ */
typedef struct tz_memprot_tlbinval_req_s
{
  UINT64                device_id;    /**< ID of the device that is to have its
                                           TLB invalidated.
                                           See #tz_device_e_type. */
  UINT64                ctxt_bank_id; /**< Context bank ID that is to have its
                                           TLB invalidated. These correspond to
                                           context bank numbers and are unique
                                           only for the device. Values start
                                           from 0, which corresponds to CB0. */
  UINT64                flags;        /**< Flags field for future use;
                                           must be zero when no flags are set. */
  UINT64                spare;        /**< Spare field for future use;
                                           must be zero. */
} __attribute__ ((packed)) tz_memprot_tlbinval_req_t;

/** @} */ /* end_weakgroup */

/** @addtogroup tz_datatypes
@{ */

/** Configure whether xPU violations are to be error fatal. */
typedef enum
{
  TZ_XPU_VIOLATION_ERR_FATAL_ENABLE  = 0, /**< xPU violations are error fatal. */
  TZ_XPU_VIOLATION_ERR_FATAL_DISABLE = 1, /**< xPU violations are not error
                                               fatal. */
  TZ_XPU_VIOLATION_ERR_FATAL_NOOP    = 2, /**< No operation. */
} tz_xpu_violation_err_fatal_t;

/** @} */ /* end_addtogroup tz_datatypes */

/**
   @weakgroup weak_tz_xpu_violation_err_fatal_req_s
@{
*/
typedef struct tz_xpu_violation_err_fatal_req_s
{
  UINT64                             config;     /**< Enable, disable, or NOOP.
                                                      See tz_xpu_violation_err_fatal_t. */
  UINT64                             spare;      /**< Unused. */
} __attribute__ ((packed)) tz_xpu_violation_err_fatal_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_xpu_violation_err_fatal_rsp_s
@{
*/
typedef struct tz_xpu_violation_err_fatal_rsp_s
{
  tz_syscall_rsp_t            common_rsp; /**< Common response structure */
  UINT64                      status   ;     /**< Enable or disable. */
} __attribute__ ((packed)) tz_xpu_violation_err_fatal_rsp_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_memprot_lock2_req_s
@{
*/
typedef struct tz_memprot_lock2_req_s
{
  UINT64              chunk_list;     /**< Array of chunk addresses. Each entry
                                           is a 32-bit physical address.
                                           chunk_list_size gives the number of
                                           entries in the array. */
  UINT64              chunk_list_size;/**< Number of chunks in the chunk
                                           list.*/
  UINT64              chunk_size;     /**< Size of each memory chunk (in bytes)
                                           in the chunk list. */
  UINT64              mem_usage;      /**< Hint on the memory usage.
                                                See #tz_mem_usage_e_type. */
  UINT64              lock;           /**< 1 (TRUE) to lock (protect);
                                                0 (FALSE) to unlock (unprotect). */
  UINT64              flags;          /**< Flags field for future use;
                                                must be zero when no flags are
                                                set. */
} __attribute__ ((packed)) tz_memprot_lock2_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_memprot_map2_req_s
@{
*/
typedef struct tz_memprot_map2_req_s
{
  UINT64              chunk_list;     /**< Array of chunk addresses. Each entry
                                           is a 32-bit physical address.
                                           chunk_list_size gives the number of
                                           entries in the array. */
  UINT64              chunk_list_size;/**< Number of chunks in the chunk
                                           list.*/
  UINT64              chunk_size;     /**< Size of each memory chunk (in bytes)
                                           in the chunk list. */
  UINT64              device_id;      /**< ID of the device where this memory is
                                           to be mapped. See #tz_device_e_type.
                                           The usage hint provided while
                                           protecting the memory can be used to
                                           validate this request. */
  UINT64              ctxt_bank_id;   /**< Context bank ID where this memory
                                           is to be (un)mapped. These
                                           correspond to context bank numbers
                                           and are unique only for the device.
                                           Values start from 0, which corresponds
                                           to CB0. */
  UINT64              dva_start;      /**< Start address in the device's virtual
                                           address space to which to map. */
  UINT64              size;           /**< Size in bytes of the virtual address
                                           range to map. The end address is:
                                           dva_end = dva_start + size - 1. */
  UINT64              flags;          /**< Flags field, which is a bitwise
                                           OR of TZ_MEMPROT_FLAG_* flags.
                                           Currently supported flags:
                                           TLBINVALIDATE \n
                                           Must be zero when no flags are
                                           set. */
} __attribute__ ((packed)) tz_memprot_map2_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_memprot_unmap2_req_s
@{ */
typedef struct tz_memprot_unmap2_req_s
{
  UINT64              device_id;    /**< ID of the device where this memory is
                                         to be mapped. See #tz_device_e_type.
                                         The usage hint provided while
                                         protecting the memory can be used to
                                         validate this request. */
  UINT64              ctxt_bank_id; /**< Context bank ID where this memory
                                         is to be (un)mapped. These
                                         correspond to context bank numbers
                                         and are unique only for the device.
                                         Values start from 0, which corresponds
                                         to CB0. */
  UINT64              dva_start;    /**< Start address in the device's virtual
                                         address space to which to map. */
  UINT64              size;         /**< Size in bytes of the virtual address
                                         range to map. The end address is:
                                         dva_end = dva_start + size - 1. */
  UINT64              flags;        /**< Flags field, which is a bitwise
                                         OR of TZ_MEMPROT_FLAG_* flags.
                                         Currently supported flags:
                                         TLBINVALIDATE \n
                                         Must be zero when no flags are
                                         set. */
} __attribute__ ((packed)) tz_memprot_unmap2_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_memprot_sd_ctrl_req_s
@{ */
typedef struct tz_memprot_sd_ctrl_req_s
{
  UINT64                enable;    /**< 1 to enable, 0 to disable */
} __attribute__ ((packed)) tz_memprot_sd_ctrl_req_t;

/** @} */ /* end_weakgroup */

/*----------------------------------------------------------------------------
 * OCMEM commands
 * -------------------------------------------------------------------------*/

/** @addtogroup tz_datatypes
@{ */

/** Enumerates OCMEM client IDs. */
typedef enum
{
  TZ_OCMEM_CLNT_UNUSED,       /**< Default client when unused. */
  TZ_OCMEM_CLNT_GRAPHICS,     /**< Maps to Oxili Virtual Machine ID (VMID). */
  TZ_OCMEM_CLNT_VIDEO,        /**< Maps to Venus CP_VMID. */
  TZ_OCMEM_CLNT_LP_AUDIO,     /**< Maps to ADSP_VMID. */
  TZ_OCMEM_CLNT_SENSORS,      /**< Maps to ADSP_VMID. */
  TZ_OCMEM_CLNT_BLAST,        /**< Maps to ADSP_VMID. */
  TZ_OCMEM_CLNT_DEBUG,        /**< Maps to HLOS_VMID; for debugging only. */
}tz_ocmem_client_e_type;

/** Enumerates the OCMEM operation mode. */
typedef enum
{
  TZ_OCMEM_OP_MODE_WIDE,      /**< Wide mode. */
  TZ_OCMEM_OP_MODE_THIN,      /**< Thin mode. */
  TZ_OCMEM_OP_MODE_NOT_SET,   /**< Operation mode not set. */
}tz_ocmem_op_mode_e_type;

/** @} */ /* end_addtogroup tz_datatypes */

/**
   @weakgroup weak_tz_ocmem_lock_region_req_s
@{
*/
typedef struct tz_ocmem_lock_region_req_s
{
  UINT64                        client_id;   /**< OCMEM client requesting the
                                                  memory region. See
                                                  #tz_ocmem_client_e_type. */

  UINT64                        offset;      /**< Start offset of the memory
                                                  region in OCMEM. */

  UINT64                        size;        /**< Size of the requested region. */

  UINT64                        mode;        /**< Requested mode (wide or
                                                  narrow). See
                                                  #tz_ocmem_op_mode_e_type. */
}__attribute__ ((packed)) tz_ocmem_lock_region_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_ocmem_unlock_region_req_s
@{
*/
typedef struct tz_ocmem_unlock_region_req_s
{
  UINT64                        client_id;   /**< OCMEM client that currently
                                                  owns the region. See
                                                  #tz_ocmem_client_e_type. */

  UINT64                        offset;      /**< Start offset of the memory
                                                  region in OCMEM. */

  UINT64                        size;        /**< Size of requested region. */
}__attribute__ ((packed)) tz_ocmem_unlock_region_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_ocmem_enable_mem_dump_req_s
@{
*/
typedef struct tz_ocmem_enable_mem_dump_req_s
{
  UINT64                        client_id;   /**< OCMEM client that currently
                                                  has this region locked. See
                                                  #tz_ocmem_client_e_type. */

  UINT64                        offset;      /**< Start offset of the memory
                                                  region in OCMEM. */

  UINT64                        size;        /**< Size of the region. */
}__attribute__ ((packed)) tz_ocmem_enable_mem_dump_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_ocmem_disable_mem_dump_req_s
@{
*/
typedef struct tz_ocmem_disable_mem_dump_req_s
{
  UINT64                        client_id;   /**< OCMEM client that currently
                                                  has this region locked. See
                                                  #tz_ocmem_client_e_type */

  UINT64                        offset;      /**< Start offset of the memory
                                                  region in OCMEM. */

  UINT64                        size;        /**< Size of the region. */
}__attribute__ ((packed)) tz_ocmem_disable_mem_dump_req_t;

/** @} */ /* end_weakgroup */

/** @addtogroup tz_datatypes
@{ */

/** eMMC partition ID for the enterprise security servcie save hash. */
typedef enum
{
    TZ_ES_PARTITION_ID_KERNEL = 0,       /**< Kernel partition ID. */
    TZ_ES_PARTITION_ID_SYSTEM = 1,       /**< System partition ID. */
    TZ_ES_PARTITION_ID_RECOVERY = 2,     /**< Recovery partition ID. */
    TZ_ES_MAX_PARTITIONS                 /**< Maximum number of partitions. */
}tz_partition_id_e_type;

/** @} */ /* end_addtogroup tz_datatypes */

/**
   @weakgroup weak_tz_es_save_partition_hash_req_s
@{
*/
typedef struct tz_es_save_partition_hash_req_s
{
  UINT64                        partition_id;
                                /**< Partition ID (system, recovery, or kernel).
                                     See tz_partition_id_e_type. */

  UINT64                        hash;     /**< Hash digest for SHA-256. */
  UINT64                        hash_sz;  /**< Size of hash digest. */
}__attribute__ ((packed)) tz_es_save_partition_hash_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_mdtp_cipher_dip_req_s
@{
*/
typedef struct tz_mdtp_cipher_dip_req_s
{
  UINT64                        in_buf;         /**< IN buffer. */
  UINT64                        in_buf_size;    /**< Size of IN buffer. */
  UINT64                        out_buf;        /**< OUT buffer. */
  UINT64                        out_buf_size;   /**< Size of OUT buffer. */
  UINT64                        direction;      /**< Cipher direction. */
}__attribute__ ((packed)) tz_mdtp_cipher_dip_req_t;

/** @} */ /* end_weakgroup */

/*----------------------------------------------------------------------------
 * NS_FIQ_DEBUG Service Structures
 * -------------------------------------------------------------------------*/

/** @addtogroup tz_macros_constants
@{ */

/** @name Nonsecure Debug FIQ Flags
@{ */

/** Nonsecure debug FIQ is level triggered. */
#define TZ_NS_DEBUG_FIQ_LEVEL_TRIGGERED              0x0
/** Nonsecure debug FIQ is edge triggered. */
#define TZ_NS_DEBUG_FIQ_EDGE_TRIGGERED               0x1
/** Nonsecure debug FIQ handler runs in the Thumb state. */
#define TZ_NS_DEBUG_FIQ_THUMB                        0x2

/** @} */ /* end_namegroup Nonsecure Debug FIQ Flags */

/** @} */ /* end_addtogroup tz_macros_constants */

/**
   @weakgroup weak_tz_config_ns_debug_fiq_req_s
@{
*/
typedef struct tz_config_ns_debug_fiq_req_s
{
  UINT64  vector; /**< Base address of the nonsecure FIQ handler. The
                             handler executes in nonsecure SVC mode. */
  UINT64  stack; /**< Stack for the nonsecure FIQ handler. The
                            QSEE software never modifies the stack. */
  UINT64  ctx_buf; /**< Context buffer for the nonsecure FIQ handler. Passed
                        in to the handler via register r0. The TrustZone
                        software always modifies the entire context. */
  UINT64  ctx_size; /**< Context buffer size in bytes. */
  UINT64 intnum; /**< Number of the debug interrupt on the Qualcomm Generic
                      Interrupt Controller (QGIC). The QSEE software only
                      allows using designated interrupts as debug FIQs and
                      returns an error code if the interrupt is not one of
                      the supported ones. */
  UINT64 flags; /**< Configuration flags; a bitwise OR of the
                     TZ_NS_FIQ_DEBUG_* definitions. The handler is assumed
                     to execute in ARM mode. For Thumb mode handlers, flag
                     TZ_NS_FIQ_DEBUG_THUMB must be set. */
} __attribute__ ((packed)) tz_config_ns_debug_fiq_t;
/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_config_ns_debug_fiq_ctx_size_rsp_s
@{
*/
typedef struct tz_config_ns_debug_fiq_ctx_size_rsp_s
{
  struct tz_syscall_rsp_s common_rsp; /**< Common response structure */
  UINT64 size; /**< Context size in bytes. */
} __attribute__ ((packed)) tz_config_ns_debug_fiq_ctx_size_rsp_t;
/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_config_ns_debug_fiq_int_ok_req_s
@{
*/
typedef struct tz_config_ns_debug_fiq_int_ok_req_s
{
  UINT64 intnum; /**< QGIC interrupt number. */
} __attribute__ ((packed)) tz_config_ns_debug_fiq_int_ok_req_t;
/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_config_ns_debug_fiq_int_ok_rsp_s
@{
*/
typedef struct tz_config_ns_debug_fiq_int_ok_rsp_s
{
  struct tz_syscall_rsp_s common_rsp; /**< Common response structure. */
  UINT64 verdict; /**< Contains 1 if the interrupt is supported as an FIQ
                       debug interrupt; 0 otherwise. */
} __attribute__ ((packed)) tz_config_ns_debug_fiq_int_ok_rsp_t;
/** @} */ /* end_weakgroup */

/*----------------------------------------------------------------------------
 * CPU Configuration Service
 * -------------------------------------------------------------------------*/

/**
   @weakgroup weak_tz_cpu_config_req_s
@{
*/
typedef struct tz_cpu_config_req_s
{
  UINT64                        id;   /**< ID of the configured item. */
  UINT64                        arg0; /**< Generic argument 0. */
  UINT64                        arg1; /**< Generic argument 1. */
  UINT64                        arg2; /**< Generic argument 2. */
} __attribute__ ((packed)) tz_cpu_config_req_t;
/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_cpu_config_query_req_s
@{
*/
typedef struct tz_cpu_config_query_req_s
{
  UINT64                        id;   /**< ID of the queried item. */
  UINT64                        arg0; /**< Generic argument 0. */
  UINT64                        arg1; /**< Generic argument 1. */
  UINT64                        arg2; /**< Generic argument 2. */
} __attribute__ ((packed)) tz_cpu_config_query_req_t;
/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_cpu_config_query_rsp_s
@{
*/
typedef struct tz_cpu_config_query_rsp_s
{
  tz_syscall_rsp_t              common_rsp; /**< Common response structure */
  UINT64                        ret0; /**< Generic return value 0. */
  UINT64                        ret1; /**< Generic return value 1. */
  UINT64                        ret2; /**< Generic return value 2. */
} __attribute__ ((packed)) tz_cpu_config_query_rsp_t;
/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_hdcp_write_registers_req_s
@{
*/
typedef struct tz_hdcp_write_registers_req_s
{
  UINT64                         addr1;     /**< Address of register to write. */  
  UINT64                         value1;    /**< Value to be written. */
  UINT64                         addr2;
  UINT64                         value2;
  UINT64                         addr3;
  UINT64                         value3;
  UINT64                         addr4;
  UINT64                         value4;
  UINT64                         addr5;
  UINT64                         value5;
} __attribute__ ((packed)) tz_hdcp_write_registers_req_t;

/** @} */ /* end_weakgroup */

/*----------------------------------------------------------------------------
 * LMH Private Driver Structures
 * -------------------------------------------------------------------------*/

#define LMH_PACKET_NODE_COUNT 10

/**
   @weakgroup weak_tz_lmh_node_info_s
@{
*/
typedef struct tz_lmh_node_info_s
{
  UINT32                        node; /**< Node type (4-char string). */
  UINT32                        node_id; /**< Node id number. */
  UINT32                        intensity; /**< Current throttling intensity . */
  UINT32                        max_intensity; /**< Max throttling intensity. */
  UINT32                        type; /**< Sensor type. */
} __attribute__ ((packed)) tz_lmh_node_info_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_lmh_node_packet_s
@{
*/
typedef struct tz_lmh_node_packet_s
{
  UINT32                count;              /**< Number of nodes in packet. */
  tz_lmh_node_info_t    nodes[LMH_PACKET_NODE_COUNT];/**< Array of nodes. */
} __attribute__ ((packed)) tz_lmh_node_packet_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_lmh_change_profile_req_s
@{
*/
typedef struct tz_lmh_change_profile_req_s
{
  UINT64                profile;            /**< Profile id to switch to. */
} __attribute__ ((packed)) tz_lmh_change_profile_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_lmh_get_profiles_req_s
@{
*/
typedef struct tz_lmh_get_profiles_req_s
{
  UINT64                profile_list_addr;  /**< Array to return profile ids to. */
  UINT64                size;               /**< Size of profile_list array in bytes, must be 10*sizeof(UINT32). */
  UINT64                start;              /**< Number of profile_ids to skip before beginning list. */
} __attribute__ ((packed)) tz_lmh_get_profiles_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_lmh_enable_qpmda_req_s
@{
*/
typedef struct tz_tz_lmh_enable_qpmda_s
{
  UINT64                enable;             /**< Enable bitmask. */
  UINT64                rate;               /**< Timestamp request rate in XO-ticks. */
} __attribute__ ((packed)) tz_lmh_enable_qpmda_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_lmh_set_current_limit_req_s
@{
*/
typedef struct tz_lmh_set_current_limit_req_s
{
  UINT64                    limit;          /**< Value to set. */
  UINT64                    limit_type;     /**< Value type. */
  UINT64                    limit_id;       /**< Limit profile to update. */
} __attribute__ ((packed)) tz_lmh_set_current_limit_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_lmh_intensity_req_s
@{
*/
typedef struct tz_lmh_intensity_req_s
{
  UINT64                    packet;         /**< Packet buffer. #tz_lmh_node_packet_t */
  UINT64                    size;           /**< Size of packet buffer in bytes. */
} __attribute__ ((packed)) tz_lmh_intensity_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tz_lmh_get_sensor_list_req_s
@{
*/
typedef struct tz_lmh_get_sensor_list_req_s
{
  UINT64                    packet;         /**< Packet buffer. #tz_lmh_node_packet_t */
  UINT64                    size;           /**< Size of packet buffer in bytes. */
} __attribute__ ((packed)) tz_lmh_get_sensor_list_req_t;

/** @} */ /* end_weakgroup */

/**
   @weakgroup weak_tzbsp_lmh_sensor_init_req_s
@{
*/
typedef struct tzbsp_lmh_sensor_init_req_s
{
  UINT64                    sensor_id;      /**< Sensor id (8-character string). */
  UINT64                    cmd_id;         /**< Sensor init cmd. */
  UINT64                    arg0;           /**< Value to set. */
  UINT64                    arg1;           /**< Value to set. */
  UINT64                    arg2;           /**< Value to set. */
  UINT64                    arg3;           /**< Value to set. */
} __attribute__ ((packed)) tzbsp_lmh_sensor_init_req_t;

#define DBG_POLICY_HASH_DIGEST_SIZE_SHA256        32  /**< SHA256 size in bytes */
#define DBG_POLICY_ID_ARRAY_SIZE                  32  /**< The maximum number of image ids allowed */
#define DBG_POLICY_CERT_ARRAY_SIZE                8   /**< The maximum number of roots allowed */

/** The value of these flags must match the 'flags' element
  * of debug_policy_t
*/
#define DBG_POLICY_ENABLE_ONLINE_CRASH_DUMPS       0 /**< Bit in dbg_policy_t.flags enables online crash dumps */
#define DBG_POLICY_ENABLE_OFFLINE_CRASH_DUMPS      1 /**< Bit in dbg_policy_t.flags enables offline crash dumps */
#define DBG_POLICY_DISABLE_AUTHENTICATION          2 /**< Bit in dbg_policy_t.flags disables image authentication */
#define DBG_POLICY_ENABLE_JTAG                     3 /**< Bit in dbg_policy_t.flags enables jtag */
#define DBG_POLICY_ENABLE_LOGGING                  4 /**< Bit in dbg_policy_t.flags enables tz kernel logging */

/**
   @weakgroup weak_dbg_policy_t
@{
*/
typedef struct 
{
  CHAR8 magic[4];                                   /**< struct signature */
  UINT32 size;                                     /**< Size of this struct */
  UINT32 revision;                                 /**< Revision of this struct */
  UINT32 serial_num_start;                         /**< Start of range to which this policy applies */
  UINT32 serial_num_end;                           /**< End of range to which this policy applies */
  UINT32 reserved;                                 /**< Reserved, must be zero */
  struct {
    UINT32 reserved_bits               : 16; /**< reserved for QCT, must be zero */
    UINT32 oem_reserved_bits           : 16; /**< reserved for OEM */
  } flags2;
  struct {
    UINT32 enable_online_crash_dumps   :  1; /**< See DBG_POLICY_ENABLE_ONLINE_CRASH_DUMPS */
    UINT32 enable_offline_crash_dumps  :  1; /**< See DBG_POLICY_ENABLE_OFFLINE_CRASH_DUMPS */
    UINT32 disable_authentication      :  1; /**< See DBG_POLICY_DISABLE_AUTHENTICATION */
    UINT32 enable_jtag                 :  1; /**< See DBG_POLICY_ENABLE_JTAG */
    UINT32 enable_logs                 :  1; /**< See DBG_POLICY_ENABLE_LOGGING */
    UINT32 reserved_bits               : 27; /**< reserved for QCT, must be zero */
  } flags;
  UINT32 image_id_count;                           /**< Count of valid values in image_id_array */
  UINT32 image_id_array[DBG_POLICY_ID_ARRAY_SIZE]; /**< Image id values for which the policy is the ROT */
  UINT32 root_cert_hash_count;                     /**< Count of valid certificate hash values in root_cert_hash_array */
  UINT8  root_cert_hash_array[DBG_POLICY_CERT_ARRAY_SIZE][DBG_POLICY_HASH_DIGEST_SIZE_SHA256]; /**< Certificate hash values used as roots for authentication */
} __attribute__ ((packed)) dbg_policy_t;
/** @} */ /* end_weakgroup */

/* unique serial numbers that are allowed */
#define SEC_DBG_SERIAL_NUM_MAX_COUNT 200

/* The number of certificates that can be tried for testing/engineering */
#define SEC_DBG_CERT_ARRAY_SIZE       4

#define CEML_HASH_DIGEST_SIZE_SHA256  32
#define CEML_HASH_DIGEST_SIZE_SHA384  48

#define SEC_DBG_DEBUG_LEVEL_SUPPORT_VERSION          5
typedef struct __attribute__((__packed__))  
{
        UINT32 magic; /* Version of Debug Policy */
        UINT32 size;  /* Fixed size debug policy*/
        UINT32 revision; /* Revision of the debug policy*/
        struct {
                UINT32 enable_online_crash_dumps          :  1;
                UINT32 enable_offline_crash_dumps         :  1;
                UINT32 enable_jtag                        :  1;
                UINT32 enable_logs                        :  1;
                UINT32 enable_modem_inv_debug             :  1;
                UINT32 enable_modem_ninv_debug            :  1;
                UINT32 enable_apps_inv_debug              :  1;
                UINT32 enable_debug_level_bit0            :  1;
                UINT32 enable_debug_level_bit1            :  1;
                UINT32 reserved_bits_with_serialnum       : 15; // reserved for QCT, must be 0
                UINT32 enable_nonsecure_crash_dumps       :  1;
                UINT32 enable_apps_encrypted_mini_dumps   :  1;
                UINT32 enable_mpss_encrypted_mini_dumps   :  1;
                UINT32 enable_lpass_encrypted_mini_dumps  :  1;
                UINT32 enable_css_encrypted_mini_dumps    :  1;
                UINT32 enable_adsp_encrypted_mini_dumps   :  1;
                UINT32 enable_cdsp_encrypted_mini_dumps   :  1;
                UINT32 reserved_bits_without_serialnum1   :  1; // reserved for QCT, must be 0  
                UINT32 reserved_bits_without_serialnum2   : 16; // reserved for QCT, must be 0  
                UINT32 oem_reserved_bits                  : 16; // reserved for OEM
        } flags;
        UINT32 image_id_bitmap; /* Image ID Bit Map */
        UINT32 root_cert_hash_count; /* Root Cert Hash Count */
        UINT8  root_cert_hash_array[SEC_DBG_CERT_ARRAY_SIZE][CEML_HASH_DIGEST_SIZE_SHA384]; /* Hash Array*/
        UINT32 serial_num_count; /* Serial Number Count */
        UINT32 serial_num_array[SEC_DBG_SERIAL_NUM_MAX_COUNT]; /* Serial Numbers */
        UINT32 root_cert_hash_count_qc; /* Root Cert Hash Count */
        UINT8  root_cert_hash_array_qc[SEC_DBG_CERT_ARRAY_SIZE][CEML_HASH_DIGEST_SIZE_SHA384]; /* Hash Array*/
} __attribute__((__packed__))sec_dbg_t;

/**
   @weakgroup weak_tz_read_debug_policy_content_req_s
@{
*/
typedef struct tz_read_debug_policy_content_req_s
{
  UINT64        debug_policy;  /**< Buffer into which the debug policy will be copied type #dbg_policy_info_t */
  UINT64        debug_policy_size;/**< Size of buffer into which the debug policy will be copied */
} __attribute__ ((packed)) tz_read_debug_policy_content_req_t;
/** @} */ /* end_weakgroup */

/**
   @weakgroup dbg_policy_override definition
@{
*/
typedef struct
{
  CHAR8   magic[4];      /**< "DBGO" */
  UINT32  revision;      /**< must be 0 */
  UINT32  override;      /**< 0 = load debug policy; 1 = do not load debug policy */
} __attribute__((__packed__)) dbg_policy_override;

/**
   @weakgroup weak_tz_get_ablfv_entry_point_rsp_s
@{
*/

typedef struct tz_get_ablfv_entry_point_rsp_s
{
  tz_syscall_rsp_t  common_rsp; /**< Common response structure */
  UINT64            e_entry;    /**< Image entry point. */

} __attribute__ ((packed)) tz_get_ablfv_entry_point_rsp_t;

/**
   @ingroup tzbsp_lmh_dcvsh_config

   System call to configure a dcvsh node.

   @smc_id
     0x02001310

   @param_id
     0x00000015

   @sys_call_req_params{tzbsp_lmh_dcvsh_config_req_s}
     @table{weak__tzbsp__lmh__dcvsh__config__req__s}

   @return
     E_SUCCESS on success; negative value on failure.
*/
#define TZ_LMH_DCVSH_CONFIG_ID  TZ_SYSCALL_CREATE_SMC_ID(TZ_OWNER_SIP, TZ_SVC_LMH, 0x10)

#define TZ_LMH_DCVSH_CONFIG_PARAM_ID \
  TZ_SYSCALL_CREATE_PARAM_ID_5( \
      TZ_SYSCALL_PARAM_TYPE_BUF_RO, \
      TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL, \
      TZ_SYSCALL_PARAM_TYPE_VAL \
      )

typedef enum
{
  TZ_STORAGE_TYPE_NULL,
  TZ_STORAGE_TYPE_SPINOR,
  TZ_STORAGE_TYPE_MAX
} tz_storage_type;

typedef enum
{
  TZ_STORAGE_INIT =       0x00,
  TZ_STORAGE_READ =       0x01,
  TZ_STORAGE_WRITE =      0x02,
  TZ_STORAGE_ERASE =      0x03,
  TZ_STORAGE_GET_INFO =   0x04,
  TZ_STORAGE_DEINIT =     0x05,
  TZ_STORAGE_CMD_MAX =    0x06,
} tz_storage_cmd;

/**
   Storage response result values.  Unlisted negative values indicate failure.
*/
typedef enum
{
  STORAGE_CMD_RESULT_SUCCESS           = 0,
  STORAGE_CMD_RESULT_NO_MEMORY         = 1,
  STORAGE_CMD_RESULT_INVALID_PARAMETER = 2,
  STORAGE_CMD_RESULT_STORAGE_ERROR     = 3,
  STORAGE_CMD_RESULT_ACCESS_DENIED     = 4,
  STORAGE_CMD_RESULT_NOT_SUPPORTED     = 5,
  STORAGE_CMD_RESULT_RESERVED          = 0xFFFFFFFF  /* Required to make the enum 4 bytes. */
}tz_storage_resp_result;

typedef struct tz_storage_info
{
  UINT64 total_blocks;         /* Total number of blocks */
  UINT32 block_size;           /* Size of a block in bytes. */
  UINT32 page_size;            /* Size of a page/sector in bytes. */
  UINT32 num_physical;         /* Number of physical partitions. */
  UINT64 manufacturer_id;      /* ID of the manufacturer. */
  UINT64 serial_num;           /* Serial number of the device. */
  char   fw_version[32];       /* String containing the firmware version, null terminated. */
  char   memory_type[5];       /* String containing the Memory type: NOR, UFS, eMMC, NAND. */
  char   product_name[32];
} __attribute__ ((packed)) tz_storage_info;



/**
   SPINOR Sycall Command Structure
*/
typedef struct tz_stor_cmd
{
  UINT64 storage_type;     /* Type of Storage Device */
  UINT64 slot_num;         /* Hardware slot number */
  UINT64 LUN;              /* Storage LUN */
  UINT64 GUID_ptr;         /* Partition GUID Pointer  */
  UINT64 storage_cmd;      /* Storage Command */
}__attribute__ ((packed)) tz_stor_cmd;

typedef struct tz_stor_cmd_details
{
  UINT64 LBA;            /* Start address for the command */
  UINT64 length;         /* Size of the storage transaction. */
  UINT64 data_buffer_ptr;/* Address of the buffer */
  UINT64 data_buffer_size;
}__attribute__ ((packed)) tz_stor_cmd_details;

/**
   SPINOR Sycall response Structure
*/
typedef struct tz_stor_resp
{
  UINT64 storage_cmd;     /* Storage Command */
  UINT64 data_buffer_ptr; /* Address of the buffer */
  UINT64 data_buffer_size;/* size of the buffer */
}__attribute__ ((packed)) tz_stor_resp;

/**
   @weakgroup weak_tz_send_storage_cmd_req_s
   @{
*/
typedef struct tz_send_storage_cmd_req_s
{
  tz_stor_cmd         *cmd_metadata;/* tz_stor_cmd struct */
  UINT64              cmd_metadata_size;
  tz_stor_cmd_details *cmd_details;/*Pointer to the command details struct */
  UINT64              cmd_details_size;
} __attribute__ ((packed)) tz_send_storage_cmd_req_t;

/**
   @weakgroup weak_tz_send_storage_cmd_rsp_s
   @{
*/
typedef struct tz_send_storage_cmd_rsp_s
{
  tz_syscall_rsp_t       common_rsp;/**< Common response structure */
  tz_storage_resp_result result;    /**< Status result of the operation performed by the command. */
  tz_stor_resp           *response_buffer;/**< Pointer to the tz_stor_resp structure **/
  UINT64                 response_buffer_size;/**< length of the tz_stor_resp structure  **/
} __attribute__ ((packed)) tz_send_storage_cmd_rsp_t;

/**
   @weakgroup weak_tz_query_tpm_type_rsp_s
   @{
*/
typedef struct tz_query_tpm_type_rsp_s
{
  tz_syscall_rsp_t   common_rsp; /**< Common response structure */
  UINT64             tpm_type;
} __attribute__ ((packed)) tz_query_tpm_type_rsp_t;

/** @} */ /* end_weakgroup */

#endif
