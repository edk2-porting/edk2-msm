#ifndef _SYNAPTICS_RMI4_H_
#define _SYNAPTICS_RMI4_H_

#define TOUCH_RMI_PAGE_INFO_BYTES 6
#define TOUCH_RMI_PAGE_INFO_ADDRESS 0xE9
#define TOUCH_RMI_MAX_FUNCTIONS 10
#define TOUCH_RMI_F12_FUNCTION 0x12

#define TOUCH_DELAY_TO_COMMUNICATE 200000
#define TOUCH_POWER_RAIL_STABLE_TIME 2000

#define RMI_CHANGE_PAGE_ADDRESS 0xFF

#define TIMER_INTERVAL_TOUCH_POLL 100000
#define TOUCH_BUFFER_SIZE 25
#define TOUCH_DATA_BYTES 8

#define FAILURE_THRESHOLD 25

typedef struct _TOUCH_DATA {
  UINT16 TouchX;
  UINT16 TouchY;
  UINT8  TouchStatus;
} TOUCH_DATA, *PTOUCH_DATA;

// RMI4 device

extern EFI_GUID gSynapticsTouchDeviceProtocolGuid;

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
  UINT32                   ControllerI2cDevice;
  EFI_QCOM_TLMM_PROTOCOL   *GpioTlmmProtocol;
  EFI_QCOM_I2C_PROTOCOL    *I2cQupProtocol;
  I2C_SLAVE_CONFIG         SlaveCfg;
} SYNAPTICS_I2C_DEVICE;

#define RMI4_DEV_INSTANCE_SIGNATURE SIGNATURE_32('r', 'm', '4', 'd')

// RMI4 driver internals

typedef struct _RMI4_INTERNAL_DATA {
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
  SYNAPTICS_I2C_DEVICE          *Rmi4Device;
  EFI_UNICODE_STRING_TABLE      *ControllerNameTable;
} RMI4_INTERNAL_DATA;

#define RMI4_TCH_INSTANCE_SIGNATURE SIGNATURE_32('r', 'm', 'i', '4')
#define RMI4_TCH_INSTANCE_FROM_ABSTCH_THIS(a)                                  \
  CR(a, RMI4_INTERNAL_DATA, AbsPointerProtocol, RMI4_TCH_INSTANCE_SIGNATURE)

// Below is the driver binding section

extern EFI_DRIVER_BINDING_PROTOCOL  gRmi4DriverBinding;
extern EFI_COMPONENT_NAME_PROTOCOL  gRmi4DriverComponentName;
extern EFI_COMPONENT_NAME2_PROTOCOL gRmi4DriverComponentName2;

EFI_STATUS
EFIAPI
Rmi4AbsolutePointerDriverBindingSupported(
    IN EFI_DRIVER_BINDING_PROTOCOL *This, IN EFI_HANDLE Controller,
    IN EFI_DEVICE_PATH_PROTOCOL *RemainingDevicePath);

EFI_STATUS
EFIAPI
Rmi4AbsolutePointerDriverBindingStart(
    IN EFI_DRIVER_BINDING_PROTOCOL *This, IN EFI_HANDLE Controller,
    IN EFI_DEVICE_PATH_PROTOCOL *RemainingDevicePath);

EFI_STATUS
EFIAPI
Rmi4AbsolutePointerDriverBindingStop(
    IN EFI_DRIVER_BINDING_PROTOCOL *This, IN EFI_HANDLE Controller,
    IN UINTN NumberOfChildren, IN EFI_HANDLE *ChildHandleBuffer);

EFI_STATUS
EFIAPI
Rmi4DriverComponentNameGetDriverName(
    IN EFI_COMPONENT_NAME_PROTOCOL *This, IN CHAR8 *Language,
    OUT CHAR16 **DriverName);

EFI_STATUS
EFIAPI
Rmi4DriverComponentNameGetControllerName(
    IN EFI_COMPONENT_NAME_PROTOCOL *This, IN EFI_HANDLE ControllerHandle,
    IN EFI_HANDLE ChildHandle OPTIONAL, IN CHAR8 *Language,
    OUT CHAR16 **ControllerName);

// Below is RMI4 driver code
EFI_STATUS
EFIAPI
SynaI2cRead(
    RMI4_INTERNAL_DATA *Instance, IN UINT8 Address, IN UINT8 *Data,
    IN UINT16 ReadBytes);

EFI_STATUS
EFIAPI
SynaI2cWrite(
    RMI4_INTERNAL_DATA *Instance, IN UINT8 Address, IN UINT8 *Data,
    IN UINT16 WriteBytes);

EFI_STATUS AbsPReset(
    IN EFI_ABSOLUTE_POINTER_PROTOCOL *This, IN BOOLEAN ExtendedVerification);

EFI_STATUS AbsPGetState(
    IN EFI_ABSOLUTE_POINTER_PROTOCOL *This,
    IN OUT EFI_ABSOLUTE_POINTER_STATE *State);

EFI_STATUS AbsStartPolling(IN RMI4_INTERNAL_DATA *Instance);

VOID EFIAPI AbsPWaitForInput(IN EFI_EVENT Event, IN VOID *Context);

VOID EFIAPI SyncPollCallback(IN EFI_EVENT Event, IN VOID *Context);

EFI_STATUS EFIAPI SynaPowerUpController(RMI4_INTERNAL_DATA *Instance);

EFI_STATUS
EFIAPI
SyncGetTouchData(RMI4_INTERNAL_DATA *Instance, IN PTOUCH_DATA DataBuffer);

VOID EFIAPI SyncPollCallback(IN EFI_EVENT Event, IN VOID *Context);

#endif