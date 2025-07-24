#ifndef __EFI_QCOM_TLMM_H__
#define __EFI_QCOM_TLMM_H__

#define QCOM_TLMM_PROTOCOL_REVISION 0x0000000000000001
#define QCOM_TLMM_RT_PROTOCOL_VERSION 0x00010000
#define QCOM_TLMM_PROTOCOL_GUID                                                \
  {                                                                            \
    0xad9aec18, 0x7bf0, 0x4809,                                                \
    {                                                                          \
      0x9e, 0x96, 0x30, 0x12, 0x30, 0x9f, 0x3d, 0xf7                           \
    }                                                                          \
  }
#define QCOM_TLMM_RT_PROTOCOL_GUID \
  {                                                                            \
    0xcc3f4da6, 0xa51e, 0x4fb7,                                                \
    {                                                                          \
      0x98, 0xd1, 0xa0, 0x6e, 0xb8, 0x5d, 0x8e, 0x1e                           \
    }                                                                          \
  }
extern EFI_GUID gQcomTlmmProtocolGuid;
extern EFI_GUID gQcomTlmmRTProtocolGuid;

#define GPIO_ENUM_FORCE32(name) GPIO_##name##_SIZE = 0x7FFFFFFF
#define EFI_GPIO_CFG(gpio, func, dir, pull, drive) \
         (((gpio) & 0x3FF)<< 4 | \
          ((func) & 0xF)|        \
          ((dir)  & 0x1) << 14|  \
          ((pull) & 0x3) << 15|  \
          ((drive)& 0xF) << 17| 0x20000000)

typedef struct _EFI_QCOM_TLMM_PROTOCOL EFI_QCOM_TLMM_PROTOCOL;

typedef enum {
  TLMM_GPIO_DISABLE = 0,
  TLMM_GPIO_ENABLE  = 1,
  GPIO_ENUM_FORCE32(ENABLE)
} TLMM_ENABLE_TYPE;

typedef enum {
  GPIO_LOW_VALUE  = 0,
  GPIO_HIGH_VALUE = 1,
  GPIO_ENUM_FORCE32(VALUE)
} TLMM_VALUE_TYPE;

typedef enum {
  GPIO_INPUT   = 0,
  GPIO_OUTPUT  = 1,
  GPIO_ENUM_FORCE32(DIRECTION)
} TLMM_DIRECTION_TYPE;

typedef enum {
  GPIO_NO_PULL   = 0,
  GPIO_PULL_DOWN = 1,
  GPIO_KEEPER    = 2,
  GPIO_PULL_UP   = 3,
  GPIO_ENUM_FORCE32(PULL)
} TLMM_PULL_TYPE;

typedef enum {
  GPIO_2MA   = 0,
  GPIO_4MA   = 1,
  GPIO_6MA   = 2,
  GPIO_8MA   = 3,
  GPIO_10MA  = 4,
  GPIO_12MA  = 5,
  GPIO_14MA  = 6,
  GPIO_16MA  = 7,
  GPIO_ENUM_FORCE32(DRIVESTR)
} TLMM_DRIVE_STRENGTH_TYPE;

typedef
EFI_STATUS
(EFIAPI *EFI_TLMM_CONFIG_GPIO) (
  IN UINT32 Config,
  IN UINT32 Enable
  );

typedef
EFI_STATUS
(EFIAPI *EFI_TLMM_CONFIG_GPIO_GROUP) (
  IN UINT32 Enable,
  IN UINT32 *ConfigGroup,
  IN UINT32 Size
  );

typedef
EFI_STATUS
(EFIAPI *EFI_TLMM_GPIO_IN) (
  IN UINT32  Config,
  OUT UINT32 *Value
  );

typedef
EFI_STATUS
(EFIAPI *EFI_TLMM_GPIO_OUT) (
  IN UINT32 Config,
  IN UINT32 Value
  );

typedef
EFI_STATUS
(EFIAPI *EFI_TLMM_SET_INACTIVE_CONFIG) (
  IN UINT32 GpioNumber,
  IN UINT32 Config
  );

struct _EFI_QCOM_TLMM_PROTOCOL {
  UINT64                       Revision;
  EFI_TLMM_CONFIG_GPIO         ConfigGpio;
  EFI_TLMM_CONFIG_GPIO_GROUP   ConfigGpioGroup;
  EFI_TLMM_GPIO_IN             GpioIn;
  EFI_TLMM_GPIO_OUT            GpioOut;
  EFI_TLMM_SET_INACTIVE_CONFIG SetInactiveConfig;
};

#endif
