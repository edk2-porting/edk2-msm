#ifndef __LIBRARY_KEYPAD_DEVICE_IMPL_H__
#define __LIBRARY_KEYPAD_DEVICE_IMPL_H__

#include <Protocol/KeypadDevice.h>

EFI_STATUS EFIAPI KeypadDeviceImplReset(KEYPAD_DEVICE_PROTOCOL *This);
EFI_STATUS        KeypadDeviceImplGetKeys(
           KEYPAD_DEVICE_PROTOCOL *This, KEYPAD_RETURN_API *KeypadReturnApi,
           UINT64 Delta);


typedef enum {
  KEYSTATE_RELEASED,
  KEYSTATE_PRESSED,
  KEYSTATE_LONGPRESS_RELEASE,
} KEY_STATE;

typedef struct {
  // keydata to be send to the driver
  EFI_KEY_DATA KeyData;

  // the time the current action has been running
  UINT64 Time;

  // the current state of the key
  KEY_STATE State;

  // the current key has to repeat sending events
  BOOLEAN Repeat;

  // the user did a longpress
  BOOLEAN Longpress;
} KEY_CONTEXT;

#endif
