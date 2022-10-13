#ifndef __EFI_QCOM_PMIC_VREG_H__
#define __EFI_QCOM_PMIC_VREG_H__
#define EFI_PMICVREG_PROTOCOL_GUID                                             \
  {                                                                            \
    0x22d38d3d, 0xe8b6, 0x4f8f,                                                \
    {                                                                          \
      0x9c, 0x26, 0xbc, 0xeb, 0x07, 0xd6, 0xcb, 0x68                           \
    }                                                                          \
  }
#define PMIC_VREG_REVISION 0x0000000000010005
typedef struct _EFI_QCOM_PMIC_VREG_PROTOCOL EFI_QCOM_PMIC_VREG_PROTOCOL;
extern EFI_GUID gQcomPmicVregProtocolGuid;
typedef enum {
  EFI_PM_LDO_1,
  EFI_PM_LDO_2,
  EFI_PM_LDO_3,
  EFI_PM_LDO_4,
  EFI_PM_LDO_5,
  EFI_PM_LDO_6,
  EFI_PM_LDO_7,
  EFI_PM_LDO_8,
  EFI_PM_LDO_9,
  EFI_PM_LDO_10,
  EFI_PM_LDO_11,
  EFI_PM_LDO_12,
  EFI_PM_LDO_13,
  EFI_PM_LDO_14,
  EFI_PM_LDO_15,
  EFI_PM_LDO_16,
  EFI_PM_LDO_17,
  EFI_PM_LDO_18,
  EFI_PM_LDO_19,
  EFI_PM_LDO_20,
  EFI_PM_LDO_21,
  EFI_PM_LDO_22,
  EFI_PM_LDO_23,
  EFI_PM_LDO_24,
  EFI_PM_LDO_25,
  EFI_PM_LDO_26,
  EFI_PM_LDO_27,
  EFI_PM_LDO_28,
  EFI_PM_LDO_29,
  EFI_PM_LDO_30,
  EFI_PM_LDO_31,
  EFI_PM_LDO_32,
  EFI_PM_LDO_33,
  EFI_PM_LDO_INVALID,
  EFI_PM_SMPS_1,
  EFI_PM_SMPS_2,
  EFI_PM_SMPS_3,
  EFI_PM_SMPS_4,
  EFI_PM_SMPS_5,
  EFI_PM_SMPS_6,
  EFI_PM_SMPS_7,
  EFI_PM_SMPS_8,
  EFI_PM_SMPS_9,
  EFI_PM_SMPS_10,
  EFI_PM_SMPS_11,
  EFI_PM_SMPS_12,
  EFI_PM_SMPS_13,
  EFI_PM_SMPS_14,
  EFI_PM_SMPS_15,
  EFI_PM_SMPS_16,
  EFI_PM_SMPS_17,
  EFI_PM_SMPS_18,
  EFI_PM_SMPS_19,
  EFI_PM_SMPS_20,
  EFI_PM_SMPS_INVALID,
  EFI_PM_VS_LVS_1,
  EFI_PM_VS_LVS_2,
  EFI_PM_VS_LVS_3,
  EFI_PM_VS_LVS_4,
  EFI_PM_VS_LVS_5,
  EFI_PM_VREG_INVALID
} EFI_PM_VREG_ID_TYPE;

typedef enum {
  EFI_PM_PWR_SW_MODE_PFM = 0,
  EFI_PM_PWR_SW_MODE_BYPASS = 1,
  EFI_PM_PWR_SW_MODE_AUTO = 2,
  EFI_PM_PWR_SW_MODE_NPM = 4,
  EFI_PM_PWR_SW_MODE_INVALID
} EFI_PM_PWR_SW_MODE_TYPE;

typedef enum {
  EFI_PM_OFF,
  EFI_PM_ON,
  EFI_PM_INVALID
} EFI_PM_ON_OFF_TYPE;

typedef struct {
  EFI_PM_ON_OFF_TYPE      PullDown;
  EFI_PM_PWR_SW_MODE_TYPE SwMode;
  EFI_PM_ON_OFF_TYPE      PinCtrled;
  EFI_PM_ON_OFF_TYPE      SwEnable;
  BOOLEAN                 VregOk;
} EFI_PM_VREG_STATUS_TYPE;

typedef
EFI_STATUS
(EFIAPI *EFI_PM_VREG_CONTROL) (
  IN UINT32              PmicDeviceIndex,
  IN EFI_PM_VREG_ID_TYPE VregId,
  IN BOOLEAN             Enable
  );

typedef
EFI_STATUS
(EFIAPI *EFI_PM_VREG_SET_LEVEL) (
  IN UINT32              PmicDeviceIndex,
  IN EFI_PM_VREG_ID_TYPE VregId,
  IN UINT32              VoltageInMv
  );

typedef
EFI_STATUS
(EFIAPI *EFI_PM_VREG_GET_LEVEL) (
  IN UINT32                 PmicDeviceIndex,
  IN  EFI_PM_VREG_ID_TYPE   VregId,
  OUT UINT32                *Voltage
  );

typedef
EFI_STATUS
(EFIAPI *EFI_PM_VREG_SET_PWR_MODE) (
  IN UINT32                  PmicDeviceIndex,
  IN EFI_PM_VREG_ID_TYPE     VregId,
  IN EFI_PM_PWR_SW_MODE_TYPE SwMode
  );

typedef
EFI_STATUS
(EFIAPI *EFI_PM_VREG_MULTIPHASE_CTRL) (
  IN UINT32              PmicDeviceIndex,
  IN EFI_PM_VREG_ID_TYPE VregId,
  IN UINT32              NumberOfPhase
  );

typedef
EFI_STATUS
(EFIAPI *EFI_PM_VREG_GET_STATUS) (
  IN  UINT32                  PmicDeviceIndex,
  IN  EFI_PM_VREG_ID_TYPE     VregId,
  OUT EFI_PM_VREG_STATUS_TYPE *VregStatus
  );

typedef
EFI_STATUS
(EFIAPI *EFI_PM_VREG_SET_LEVEL_IN_MICRO_VOLT) (
  IN UINT32              PmicDeviceIndex,
  IN EFI_PM_VREG_ID_TYPE VregId,
  IN UINT32              VoltageInMicroVolt
  );

struct _EFI_QCOM_PMIC_VREG_PROTOCOL {
  UINT64                              Revision;
  EFI_PM_VREG_CONTROL                 VregControl;
  EFI_PM_VREG_SET_LEVEL               VregSetLevel;
  EFI_PM_VREG_GET_LEVEL               VregGetLevel;
  EFI_PM_VREG_SET_PWR_MODE            VregSetPwrMode;
  EFI_PM_VREG_MULTIPHASE_CTRL         VregMultiphaseCtrl;
  EFI_PM_VREG_GET_STATUS              VregGetStatus;
  EFI_PM_VREG_SET_LEVEL_IN_MICRO_VOLT VregSetLevelUv;
};

#endif
