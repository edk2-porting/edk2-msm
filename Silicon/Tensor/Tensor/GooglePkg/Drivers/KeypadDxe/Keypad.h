/** @file
  Keypad driver header file

Copyright (c) 2006 - 2016, Intel Corporation. All rights reserved.<BR>
This program and the accompanying materials
are licensed and made available under the terms and conditions of the BSD
License which accompanies this distribution.  The full text of the license may
be found at http://opensource.org/licenses/bsd-license.php

THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.

**/

#ifndef _KEYPAD_H_
#define _KEYPAD_H_

#include <Uefi.h>

#include <Protocol/KeypadDevice.h>
#include <Protocol/SimpleTextIn.h>
#include <Protocol/SimpleTextInEx.h>

#include <Library/BaseLib.h>
#include <Library/BaseMemoryLib.h>
#include <Library/DebugLib.h>
#include <Library/IoLib.h>
#include <Library/MemoryAllocationLib.h>
#include <Library/PcdLib.h>
#include <Library/TimerLib.h>
#include <Library/UefiBootServicesTableLib.h>
#include <Library/UefiDriverEntryPoint.h>
#include <Library/UefiLib.h>
#include <Library/UefiRuntimeServicesTableLib.h>

//
// Global Variables
//
extern EFI_DRIVER_BINDING_PROTOCOL  gKeypadControllerDriver;
extern EFI_COMPONENT_NAME_PROTOCOL  gKeypadComponentName;
extern EFI_COMPONENT_NAME2_PROTOCOL gKeypadComponentName2;

//
// Driver Private Data
//
#define KEYPAD_CONSOLE_IN_DEV_SIGNATURE SIGNATURE_32('k', 'k', 'e', 'y')
#define KEYPAD_CONSOLE_IN_EX_NOTIFY_SIGNATURE SIGNATURE_32('k', 'c', 'e', 'n')

typedef struct _KEYPAD_CONSOLE_IN_EX_NOTIFY {
  UINTN                   Signature;
  EFI_KEY_DATA            KeyData;
  EFI_KEY_NOTIFY_FUNCTION KeyNotificationFn;
  LIST_ENTRY              NotifyEntry;
} KEYPAD_CONSOLE_IN_EX_NOTIFY;

#define KEYPAD_EFI_KEY_MAX_COUNT 256
typedef struct {
  EFI_KEY_DATA Buffer[KEYPAD_EFI_KEY_MAX_COUNT];
  UINTN        Head;
  UINTN        Tail;
} EFI_KEY_QUEUE;

typedef struct {
  UINTN Signature;

  EFI_HANDLE                        Handle;
  EFI_SIMPLE_TEXT_INPUT_PROTOCOL    ConIn;
  EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL ConInEx;

  EFI_EVENT TimerEvent;

  KEYPAD_DEVICE_PROTOCOL *KeypadDevice;
  KEYPAD_RETURN_API       KeypadReturnApi;

  // counter value of the last poll
  UINT64 Last;

  BOOLEAN LeftCtrl;
  BOOLEAN RightCtrl;
  BOOLEAN LeftAlt;
  BOOLEAN RightAlt;
  BOOLEAN LeftShift;
  BOOLEAN RightShift;
  BOOLEAN LeftLogo;
  BOOLEAN RightLogo;
  BOOLEAN Menu;
  BOOLEAN SysReq;

  BOOLEAN CapsLock;
  BOOLEAN NumLock;
  BOOLEAN ScrollLock;

  BOOLEAN IsSupportPartialKey;
  //
  // Queue storing key scancodes
  //
  EFI_KEY_QUEUE EfiKeyQueue;
  EFI_KEY_QUEUE EfiKeyQueueForNotify;

  //
  // Error state
  //
  BOOLEAN KeypadErr;

  EFI_UNICODE_STRING_TABLE *ControllerNameTable;

  //
  // Notification Function List
  //
  LIST_ENTRY NotifyList;
  EFI_EVENT  KeyNotifyProcessEvent;
} KEYPAD_CONSOLE_IN_DEV;

#define KEYPAD_CONSOLE_IN_DEV_FROM_KEYPAD_RETURN_API(a)                        \
  CR(a, KEYPAD_CONSOLE_IN_DEV, KeypadReturnApi, KEYPAD_CONSOLE_IN_DEV_SIGNATURE)
#define KEYPAD_CONSOLE_IN_DEV_FROM_THIS(a)                                     \
  CR(a, KEYPAD_CONSOLE_IN_DEV, ConIn, KEYPAD_CONSOLE_IN_DEV_SIGNATURE)
#define TEXT_INPUT_EX_KEYPAD_CONSOLE_IN_DEV_FROM_THIS(a)                       \
  CR(a, KEYPAD_CONSOLE_IN_DEV, ConInEx, KEYPAD_CONSOLE_IN_DEV_SIGNATURE)

#define TABLE_END 0x0

#define KEYPAD_TIMER_INTERVAL 200000 // 0.02s

//
// Driver entry point
//
/**
  The user Entry Point for module KeypadDxe. The user code starts with this
function.

  @param[in] ImageHandle    The firmware allocated handle for the EFI image.
  @param[in] SystemTable    A pointer to the EFI System Table.

  @retval EFI_SUCCESS       The entry point is executed successfully.
  @retval other             Some error occurs when executing this entry point.

**/
EFI_STATUS
EFIAPI
InstallKeypadDriver(
    IN EFI_HANDLE ImageHandle, IN EFI_SYSTEM_TABLE *SystemTable);

//
// Other functions that are used among .c files
//

/**
  Process key notify.

  @param  Event                 Indicates the event that invoke this function.
  @param  Context               Indicates the calling context.
**/
VOID EFIAPI KeyNotifyProcessHandler(IN EFI_EVENT Event, IN VOID *Context);

/**
  Perform 8042 controller and keypad Initialization.
  If ExtendedVerification is TRUE, do additional test for
  the keypad interface

  @param ConsoleIn - KEYPAD_CONSOLE_IN_DEV instance pointer
  @param ExtendedVerification - indicates a thorough initialization

  @retval EFI_DEVICE_ERROR Fail to init keypad
  @retval EFI_SUCCESS      Success to init keypad
**/
EFI_STATUS
InitKeypad(
    IN OUT KEYPAD_CONSOLE_IN_DEV *ConsoleIn, IN BOOLEAN ExtendedVerification);

/**
  Timer event handler: read a series of scancodes from 8042
  and put them into memory scancode buffer.
  it read as much scancodes to either fill
  the memory buffer or empty the keypad buffer.
  It is registered as running under TPL_NOTIFY

  @param Event - The timer event
  @param Context - A KEYPAD_CONSOLE_IN_DEV pointer

**/
VOID EFIAPI KeypadTimerHandler(IN EFI_EVENT Event, IN VOID *Context);

/**
  logic reset keypad
  Implement SIMPLE_TEXT_IN.Reset()
  Perform 8042 controller and keypad initialization

  @param This    Pointer to instance of EFI_SIMPLE_TEXT_INPUT_PROTOCOL
  @param ExtendedVerification Indicate that the driver may perform a more
                              exhaustive verification operation of the device
during reset, now this par is ignored in this driver

**/
EFI_STATUS
EFIAPI
KeypadEfiReset(
    IN EFI_SIMPLE_TEXT_INPUT_PROTOCOL *This, IN BOOLEAN ExtendedVerification);

/**
  Implement SIMPLE_TEXT_IN.ReadKeyStroke().
  Retrieve key values for driver user.

  @param This    Pointer to instance of EFI_SIMPLE_TEXT_INPUT_PROTOCOL
  @param Key     The output buffer for key value

  @retval EFI_SUCCESS success to read key stroke
**/
EFI_STATUS
EFIAPI
KeypadReadKeyStroke(
    IN EFI_SIMPLE_TEXT_INPUT_PROTOCOL *This, OUT EFI_INPUT_KEY *Key);

/**
  Event notification function for SIMPLE_TEXT_IN.WaitForKey event
  Signal the event if there is key available

  @param Event    the event object
  @param Context  waitting context

**/
VOID EFIAPI KeypadWaitForKey(IN EFI_EVENT Event, IN VOID *Context);

/**
  Event notification function for SIMPLE_TEXT_INPUT_EX_PROTOCOL.WaitForKeyEx
event Signal the event if there is key available

  @param Event    event object
  @param Context  waiting context

**/
VOID EFIAPI KeypadWaitForKeyEx(IN EFI_EVENT Event, IN VOID *Context);

//
// Simple Text Input Ex protocol function prototypes
//

/**
  Reset the input device and optionaly run diagnostics

  @param This                 - Protocol instance pointer.
  @param ExtendedVerification - Driver may perform diagnostics on reset.

  @retval EFI_SUCCESS           - The device was reset.
  @retval EFI_DEVICE_ERROR      - The device is not functioning properly and
could not be reset.

**/
EFI_STATUS
EFIAPI
KeypadEfiResetEx(
    IN EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
    IN BOOLEAN ExtendedVerification);

/**
    Reads the next keystroke from the input device. The WaitForKey Event can
    be used to test for existance of a keystroke via WaitForEvent () call.


    @param This       - Protocol instance pointer.
    @param KeyData    - A pointer to a buffer that is filled in with the
keystroke state data for the key that was pressed.

    @retval EFI_SUCCESS           - The keystroke information was returned.
    @retval EFI_NOT_READY         - There was no keystroke data availiable.
    @retval EFI_DEVICE_ERROR      - The keystroke information was not returned
due to hardware errors.
    @retval EFI_INVALID_PARAMETER - KeyData is NULL.

**/
EFI_STATUS
EFIAPI
KeypadReadKeyStrokeEx(
    IN EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This, OUT EFI_KEY_DATA *KeyData);

/**
  Set certain state for the input device.

  @param This              - Protocol instance pointer.
  @param KeyToggleState    - A pointer to the EFI_KEY_TOGGLE_STATE to set the
                        state for the input device.

  @retval EFI_SUCCESS           - The device state was set successfully.
  @retval EFI_DEVICE_ERROR      - The device is not functioning correctly and
could not have the setting adjusted.
  @retval EFI_UNSUPPORTED       - The device does not have the ability to set
its state.
  @retval EFI_INVALID_PARAMETER - KeyToggleState is NULL.

**/
EFI_STATUS
EFIAPI
KeypadSetState(
    IN EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
    IN EFI_KEY_TOGGLE_STATE *KeyToggleState);

/**
    Register a notification function for a particular keystroke for the input
device.

    @param This                    - Protocol instance pointer.
    @param KeyData                 - A pointer to a buffer that is filled in
with the keystroke information data for the key that was pressed.
    @param KeyNotificationFunction - Points to the function to be called when
the key sequence is typed specified by KeyData.
    @param NotifyHandle            - Points to the unique handle assigned to the
registered notification.

    @retval EFI_SUCCESS             - The notification function was registered
successfully.
    @retval EFI_OUT_OF_RESOURCES    - Unable to allocate resources for
necesssary data structures.
    @retval EFI_INVALID_PARAMETER   - KeyData or NotifyHandle is NULL.

**/
EFI_STATUS
EFIAPI
KeypadRegisterKeyNotify(
    IN EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This, IN EFI_KEY_DATA *KeyData,
    IN EFI_KEY_NOTIFY_FUNCTION KeyNotificationFunction,
    OUT VOID **NotifyHandle);

/**
    Remove a registered notification function from a particular keystroke.

    @param This                    - Protocol instance pointer.
    @param NotificationHandle      - The handle of the notification function
being unregistered.


    @retval EFI_SUCCESS             - The notification function was unregistered
successfully.
    @retval EFI_INVALID_PARAMETER   - The NotificationHandle is invalid.
    @retval EFI_NOT_FOUND           - Can not find the matching entry in
database.

**/
EFI_STATUS
EFIAPI
KeypadUnregisterKeyNotify(
    IN EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This, IN VOID *NotificationHandle);

/**
  Push one key data to the EFI key buffer.

  @param Queue     Pointer to instance of EFI_KEY_QUEUE.
  @param KeyData   The key data to push.
**/
VOID PushEfikeyBufTail(IN EFI_KEY_QUEUE *Queue, IN EFI_KEY_DATA *KeyData);

/**
  Judge whether is a registed key

  @param RegsiteredData       A pointer to a buffer that is filled in with the
keystroke state data for the key that was registered.
  @param InputData            A pointer to a buffer that is filled in with the
keystroke state data for the key that was pressed.

  @retval TRUE                Key be pressed matches a registered key.
  @retval FLASE               Match failed.

**/
BOOLEAN
IsKeyRegistered(IN EFI_KEY_DATA *RegsiteredData, IN EFI_KEY_DATA *InputData);

#endif
