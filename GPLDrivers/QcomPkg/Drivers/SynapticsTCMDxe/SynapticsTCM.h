#ifndef _SYNAPTICS_TCM_H_
#define _SYNAPTICS_TCM_H_

#define MESSAGE_MARKER			0xA5
#define MESSAGE_PADDING			0x5A
#define MESSAGE_HEADER_SIZE		4
#define MESSAGE_BUFFER_SIZE		512

#define MAX_FINGER 10

#define DEFAULT_CHUNK_SIZE 1024

#define TOUCH_DELAY_TO_COMMUNICATE 200000
#define TOUCH_POWER_RAIL_STABLE_TIME 2000

#define TIMER_INTERVAL_TOUCH_POLL 100000
#define TOUCH_BUFFER_SIZE 25
#define TOUCH_DATA_BYTES 8

#define FAILURE_THRESHOLD 25

typedef struct _TOUCH_DATA {
  UINT16 TouchX;
  UINT16 TouchY;
  UINT8  TouchStatus;
} TOUCH_DATA, *PTOUCH_DATA;

// TCM device

extern EFI_GUID gSynapticsTouchDeviceProtocolGuid;

typedef struct _TCM_STATE
{
	BOOLEAN Init;
	BOOLEAN Config;
	BOOLEAN EsdRecovery;
	BOOLEAN Power;
} TCM_STATE;

#pragma pack(push)
#pragma pack(1)
typedef struct _TCM_CUSTOMER_CONFIG_ID
{
	UINT8 Key : 4;
	UINT8 Maker : 4;
	UINT8 Inch0 : 4;
	UINT8 Supplier : 4;
	UINT8 Panel : 4;
	UINT8 Inch1 : 4;
	UINT8 Version : 7;
	UINT8 Release : 1;
	UINT8 Reserved[12];
} TCM_CUSTOMER_CONFIG_ID;

typedef struct _TCM_ID_INFO
{
	UINT8 Version;
	UINT8 Mode;
	UINT8 PartNumber[16];
	UINT32 BuildId;
	UINT16 MaxWriteSize;
} TCM_ID_INFO;

typedef struct _TCM_APP_INFO
{
	UINT16 PacketVersion;
	UINT16 Status;
	UINT16 StaticConfigSize;
	UINT16 DynamicConfigSize;
	UINT16 AppConfigStartWriteBlock;
	UINT16 AppConfigSize;
	UINT16 MaxTouchReportConfigSize;
	UINT16 MaxTouchReportPayloadSize;
	TCM_CUSTOMER_CONFIG_ID CustomerConfigID;
	UINT16 MaxX;
	UINT16 MaxY;
	UINT16 MaxObjects;
	UINT16 NumOfButtons;
	UINT16 NumOfImageRows;
	UINT16 NumOfImageCols;
	UINT16 HasHybridData;
	UINT16 NumOfForceElecs;
} TCM_APP_INFO;

typedef struct _TCM_BOOT_INFO
{
	UINT8 PacketVersion;
	UINT8 Status;
	UINT16 ASICID;
	UINT8 WriteBlockSizeWords;
	UINT16 ErasePageSizeWords;
	UINT16 MaxWritePayloadSize;
	UINT8 LastResetReason;
	UINT16 PcAtTimeOfLastReset;
	UINT16 BootConfigStartBlock;
	UINT16 BootConfigSizeBlocks;
	UINT32 DisplayConfigStartBlock;
	UINT16 DisplayConfigLengthBlocks;
	UINT32 BackupDisplayConfigStartBlock;
	UINT16 BackupDisplayConfigLengthBlocks;
	UINT16 CustomOtpStartBlock;
	UINT16 CustomOtpLengthBlocks;
} TCM_BOOT_INFO;

typedef struct _TCM_ROMBOOT_INFO
{
	UINT8 PacketVersion;
	UINT8 Status;
	UINT16 ASICID;
	UINT8 WriteBlockSizeWords;
	UINT16 MaxWritePayloadSize;
	UINT8 LastResetReason;
	UINT16 PcAtTimeOfLastReset;
} TCM_ROMBOOT_INFO;

typedef struct _TCM_PRODUCT_INFO
{
	UINT8 ProductID[6];
	UINT8 ChipVersion;
	UINT8 FPCVersion;
	UINT8 SensorVersion;
	UINT8 InspectChannel;
	UINT8 InspectDate[3];
	UINT8 InspectTime[3];
} TCM_PRODUCT_INFO;

typedef struct _TCM_MSG_HEADER
{
	UINT8 Marker;
	UINT8 Code;
	UINT16 Length;
} TCM_MSG_HEADER;

#pragma pack(pop)

typedef struct _TCM_BUFFER
{
	UINT8 Buffer[MESSAGE_BUFFER_SIZE];
	UINT32 DataLength;
} TCM_BUFFER;

typedef struct _SYNAPTICS_I2C_DEVICE {
  UINT32                   Signature;
  UINT32                   XMax;
  UINT32                   YMax;
  UINT32                   XMin;
  UINT32                   YMin;
  BOOLEAN                  XInverted;
  BOOLEAN                  YInverted;
  UINT32                   ControllerResetPin;
  UINT32                   ControllerInterruptPin;
  UINT32                   ControllerVddPin;
  UINT32                   ControllerVddIoPin;
  BOOLEAN				   ControllerVddCtlActiveLow;
  UINT32                   ControllerI2cDevice;
  EFI_QCOM_TLMM_PROTOCOL   *GpioTlmmProtocol;
  EFI_QCOM_I2C_PROTOCOL    *I2cQupProtocol;
  I2C_SLAVE_CONFIG         SlaveCfg;
} SYNAPTICS_I2C_DEVICE;

#define TCM_DEV_INSTANCE_SIGNATURE SIGNATURE_32('t', 'c', 'm', 'd')

// TCM driver internals

typedef struct _TCM_INTERNAL_DATA {
  UINT32                        Signature;
  UINT16                        LastX;
  UINT16                        LastY;
  EFI_ABSOLUTE_POINTER_PROTOCOL AbsPointerProtocol;
  EFI_ABSOLUTE_POINTER_MODE     AbsPointerMode;
  EFI_EVENT                     PollingTimerEvent;
  BOOLEAN                       Initialized;
  UINT8                         PageF12;
  UINT32                        TouchDataAddress;
  UINT32                        FailureCount;
  VOID                          *I2cController;
  BOOLEAN                       StateChanged;
  SYNAPTICS_I2C_DEVICE          *TCMDevice;
  EFI_UNICODE_STRING_TABLE      *ControllerNameTable;
  TCM_ID_INFO					*IDInfo;
  TCM_BUFFER					*ConfigData;
  UINT32						ChunkSize;
  UINT32 						CommandStatus;
  UINT32 						CurrentCommand;
  UINT32 						CurrentResponse;
} TCM_INTERNAL_DATA;

#define TCM_TCH_INSTANCE_SIGNATURE SIGNATURE_32('r', 'm', 'i', '4')
#define TCM_TCH_INSTANCE_FROM_ABSTCH_THIS(a)                                  \
  CR(a, TCM_INTERNAL_DATA, AbsPointerProtocol, TCM_TCH_INSTANCE_SIGNATURE)

// Below is the driver binding section

extern EFI_DRIVER_BINDING_PROTOCOL  gTCMDriverBinding;
extern EFI_COMPONENT_NAME_PROTOCOL  gTCMDriverComponentName;
extern EFI_COMPONENT_NAME2_PROTOCOL gTCMDriverComponentName2;

EFI_STATUS
EFIAPI
TCMAbsolutePointerDriverBindingSupported(
    IN EFI_DRIVER_BINDING_PROTOCOL *This, IN EFI_HANDLE Controller,
    IN EFI_DEVICE_PATH_PROTOCOL *RemainingDevicePath);

EFI_STATUS
EFIAPI
TCMAbsolutePointerDriverBindingStart(
    IN EFI_DRIVER_BINDING_PROTOCOL *This, IN EFI_HANDLE Controller,
    IN EFI_DEVICE_PATH_PROTOCOL *RemainingDevicePath);

EFI_STATUS
EFIAPI
TCMAbsolutePointerDriverBindingStop(
    IN EFI_DRIVER_BINDING_PROTOCOL *This, IN EFI_HANDLE Controller,
    IN UINTN NumberOfChildren, IN EFI_HANDLE *ChildHandleBuffer);

EFI_STATUS
EFIAPI
TCMDriverComponentNameGetDriverName(
    IN EFI_COMPONENT_NAME_PROTOCOL *This, IN CHAR8 *Language,
    OUT CHAR16 **DriverName);

EFI_STATUS
EFIAPI
TCMDriverComponentNameGetControllerName(
    IN EFI_COMPONENT_NAME_PROTOCOL *This, IN EFI_HANDLE ControllerHandle,
    IN EFI_HANDLE ChildHandle OPTIONAL, IN CHAR8 *Language,
    OUT CHAR16 **ControllerName);

// Below is TCM driver code
EFI_STATUS
EFIAPI
SynaI2cRawRead(
    TCM_INTERNAL_DATA *Instance, IN UINT8 *Data,
    IN UINT16 ReadBytes);

EFI_STATUS
EFIAPI
SynaI2cRawWrite(
    TCM_INTERNAL_DATA *Instance, IN UINT8 *Data,
    IN UINT16 WriteBytes);

EFI_STATUS AbsPReset(
    IN EFI_ABSOLUTE_POINTER_PROTOCOL *This, IN BOOLEAN ExtendedVerification);

EFI_STATUS AbsPGetState(
    IN EFI_ABSOLUTE_POINTER_PROTOCOL *This,
    IN OUT EFI_ABSOLUTE_POINTER_STATE *State);

EFI_STATUS AbsStartPolling(IN TCM_INTERNAL_DATA *Instance);

VOID EFIAPI AbsPWaitForInput(IN EFI_EVENT Event, IN VOID *Context);

VOID EFIAPI SyncPollCallback(IN EFI_EVENT Event, IN VOID *Context);

EFI_STATUS EFIAPI SynaPowerUpController(TCM_INTERNAL_DATA *Instance);

EFI_STATUS
EFIAPI
SynaGetTouchData(
	TCM_INTERNAL_DATA *Instance,
	IN PTOUCH_DATA DataBuffer, 
	IN TCM_BUFFER *ResponseData
);

EFI_STATUS
EFIAPI
TcmDispatchReport(
	TCM_INTERNAL_DATA *Instance, 
	IN UINT8 *messageHeader, 
	IN UINT8 *payloadData, 
	IN UINT32 readLength,
	IN PTOUCH_DATA touchData
);

EFI_STATUS
EFIAPI
TcmParseSingleByte(
	UINT8 *Payload,
	UINT32 PayloadLength,
	UINT32 BitsOffset,
	UINT32 BitsToRead,
	UINT32 *OutputData
);

EFI_STATUS
EFIAPI
TcmGetReportConfig(TCM_INTERNAL_DATA *Instance);

enum tcm_status_code {
	TCM_STATUS_IDLE = 0x00,
	TCM_STATUS_OK = 0x01,
	TCM_STATUS_BUSY = 0x02,
	TCM_STATUS_CONTINUED_READ = 0x03,
	TCM_STATUS_NOT_EXECUTED_IN_DEEP_SLEEP = 0x0b,
	TCM_STATUS_RECEIVE_BUFFER_OVERFLOW = 0x0c,
	TCM_STATUS_PREVIOUS_COMMAND_PENDING = 0x0d,
	TCM_STATUS_NOT_IMPLEMENTED = 0x0e,
	TCM_STATUS_ERROR = 0x0f,
	TCM_STATUS_INVALID = 0xff,
};

enum tcm_app_status {
	APP_STATUS_OK = 0x00,
	APP_STATUS_BOOTING = 0x01,
	APP_STATUS_UPDATING = 0x02,
	APP_STATUS_BAD_APP_CONFIG = 0xff,
};

enum tcm_report_type {
	TCM_REPORT_IDENTIFY = 0x10,
	TCM_REPORT_TOUCH = 0x11,
	TCM_REPORT_DELTA = 0x12,
	TCM_REPORT_RAW = 0x13,
	TCM_REPORT_STATUS = 0x1b,
	TCM_REPORT_PRINTF = 0x82,
	TCM_REPORT_HDL_ROMBOOT = 0xfd,
	TCM_REPORT_HDL_F35 = 0xfe,
};

enum tcm_report_data_code {
	TOUCH_END = 0,
	TOUCH_FOREACH_ACTIVE_OBJECT,
	TOUCH_FOREACH_OBJECT,
	TOUCH_FOREACH_END,
	TOUCH_PAD_TO_NEXT_BYTE,
	TOUCH_TIMESTAMP,
	TOUCH_OBJECT_N_INDEX,				// 0x6
	TOUCH_OBJECT_N_CLASSIFICATION,
	TOUCH_OBJECT_N_X_POSITION,
	TOUCH_OBJECT_N_Y_POSITION,
	TOUCH_OBJECT_N_Z,				// 0xA
	TOUCH_OBJECT_N_X_WIDTH,
	TOUCH_OBJECT_N_Y_WIDTH,
	TOUCH_OBJECT_N_TX_POSITION_TIXELS,
	TOUCH_OBJECT_N_RX_POSITION_TIXELS,
	TOUCH_0D_BUTTONS_STATE,				// 0xF
	TOUCH_GESTURE_ID,				// 0x10
	TOUCH_FRAME_RATE,
	TOUCH_POWER_IM,					// 0x12
	TOUCH_CID_IM,
	TOUCH_RAIL_IM,
	TOUCH_CID_VARIANCE_IM,
	TOUCH_NSM_FREQUENCY,
	TOUCH_NSM_STATE,				// 0x17
	TOUCH_NUM_OF_ACTIVE_OBJECTS,			// 0x18
	TOUCH_NUM_OF_CPU_CYCLES_USED_SINCE_LAST_FRAME,
	TOUCH_FACE_DETECT,				// 0x1A
	TOUCH_GESTURE_DATA,
	TOUCH_OBJECT_N_FORCE,
	TOUCH_FINGERPRINT_AREA_MEET,
	TOUCH_TUNING_GAUSSIAN_WIDTHS = 0x80,
	TOUCH_TUNING_SMALL_OBJECT_PARAMS,
	TOUCH_TUNING_0D_BUTTONS_VARIANCE,
	// LGE Custom report code
	TOUCH_OBJECT_N_AREA = 0xC0,
	TOUCH_OBJECT_N_ANGLE,
	TOUCH_OBJECT_N_MAJOR,
	TOUCH_OBJECT_N_MINOR,
	TOUCH_BASELINE_ERR_LOG,				// 0xC4
	TOUCH_PALM_DETECTED,				// 0xC5
	TOUCH_CUSTOMER_GESTURE_DETECTED,
	TOUCH_CUSTOMER_GESTURE_INFO,
	TOUCH_CUSTOMER_GESTURE_INFO2,
};

enum gesture_detected_data {
	DETECT_NORMAL_TOUCH = 0x0,
	DETECT_KNOCK_ON = 0x1,
	DETECT_KNOCK_CODE = 0x2,
	DETECT_LONG_PRESS_DOWN = 0x4,
	DETECT_LONG_PRESS_UP = 0x8,
	DETECT_SWIPE = 0x10,
	DETECT_LONG_PRESS = 0x20,
	DETECT_ONE_TAP = 0x40,
};

enum {
	TCM_POWER_OFF = 0,
	TCM_POWER_SLEEP,
	TCM_POWER_WAKE,
	TCM_POWER_ON,
	TCM_POWER_HW_RESET_ASYNC,
	TCM_POWER_HW_RESET_SYNC,
	TCM_POWER_SW_RESET,
	TCM_POWER_DSV_TOGGLE,
	TCM_POWER_DSV_ALWAYS_ON,
};

enum firmware_mode {
	MODE_APPLICATION_FIRMWARE = 0x01,
	MODE_HOSTDOWNLOAD_FIRMWARE = 0x02,
	MODE_ROMBOOTLOADER = 0x04,
	MODE_BOOTLOADER = 0x0b,
	MODE_TDDI_BOOTLOADER = 0x0c,
	MODE_TDDI_HOSTDOWNLOAD_BOOTLOADER = 0x0d,
	MODE_PRODUCTIONTEST_FIRMWARE = 0x0e,
};

enum command {
	CMD_NONE = 0x00,
	CMD_CONTINUE_WRITE = 0x01,
	CMD_IDENTIFY = 0x02,
	CMD_RESET = 0x04,
	CMD_ENABLE_REPORT = 0x05,
	CMD_DISABLE_REPORT = 0x06,
	CMD_GET_BOOT_INFO = 0x10,
	CMD_ERASE_FLASH = 0x11,
	CMD_WRITE_FLASH = 0x12,
	CMD_READ_FLASH = 0x13,
	CMD_RUN_APPLICATION_FIRMWARE = 0x14,
	CMD_SPI_MASTER_WRITE_THEN_READ = 0x15,
	CMD_REBOOT_TO_ROM_BOOTLOADER = 0x16,
	CMD_RUN_BOOTLOADER_FIRMWARE = 0x1f,
	CMD_GET_APPLICATION_INFO = 0x20,
	CMD_GET_STATIC_CONFIG = 0x21,
	CMD_SET_STATIC_CONFIG = 0x22,
	CMD_GET_DYNAMIC_CONFIG = 0x23,
	CMD_SET_DYNAMIC_CONFIG = 0x24,
	CMD_GET_TOUCH_REPORT_CONFIG = 0x25,
	CMD_SET_TOUCH_REPORT_CONFIG = 0x26,
	CMD_REZERO = 0x27,
	CMD_COMMIT_CONFIG = 0x28,
	CMD_DESCRIBE_DYNAMIC_CONFIG = 0x29,
	CMD_PRODUCTION_TEST = 0x2a,
	CMD_SET_CONFIG_ID = 0x2b,
	CMD_ENTER_DEEP_SLEEP = 0x2c,
	CMD_EXIT_DEEP_SLEEP = 0x2d,
	CMD_GET_TOUCH_INFO = 0x2e,
	CMD_GET_DATA_LOCATION = 0x2f,
	CMD_DOWNLOAD_CONFIG = 0x30,
	CMD_ENTER_PRODUCTION_TEST_MODE = 0x31,
	CMD_GET_FEATURES = 0x32,
	CMD_GET_ROMBOOT_INFO = 0x40,
	CMD_WRITE_PROGRAM_RAM = 0x41,
	CMD_ROMBOOT_RUN_BOOTLOADER_FIRMWARE = 0x42,
	CMD_SPI_MASTER_WRITE_THEN_READ_EXTENDED = 0x43,
	CMD_ENTER_IO_BRIDGE_MODE = 0x44,
	CMD_ROMBOOT_DOWNLOAD = 0x45,
	CMD_SET_LGE_GESTURE_CONFIG = 0xc0,
	CMD_GET_LGE_GESTURE_FAILREASON = 0xc1,
};

enum command_status {
	CMD_IDLE = 0,
	CMD_BUSY = 1,
	CMD_ERROR = -1,
};

static inline unsigned int ceil_div(unsigned int dividend, unsigned divisor)
{
	return (dividend + divisor - 1) / divisor;
}

#endif