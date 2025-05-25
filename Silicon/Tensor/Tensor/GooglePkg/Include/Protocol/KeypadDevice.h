#ifndef __PROTOCOL_KEYPAD_DEVICE_H__
#define __PROTOCOL_KEYPAD_DEVICE_H__

#include <Protocol/SimpleTextInEx.h>

#define KEYPAD_DEVICE_PROTOCOL_GUID                                            \
  {                                                                            \
    0xb27625b5, 0x0b6c, 0x4614,                                                \
    {                                                                          \
      0xaa, 0x3c, 0x33, 0x13, 0xb5, 0x1d, 0x36, 0x46                           \
    }                                                                          \
  }

typedef struct _KEYPAD_DEVICE_PROTOCOL KEYPAD_DEVICE_PROTOCOL;
typedef struct _KEYPAD_RETURN_API      KEYPAD_RETURN_API;

typedef VOID(EFIAPI *PUSH_EFI_KEY_BUF_TAIL)(
    KEYPAD_RETURN_API *This, EFI_KEY_DATA *KeyData);

struct _KEYPAD_RETURN_API {
  PUSH_EFI_KEY_BUF_TAIL PushEfikeyBufTail;
};

typedef EFI_STATUS(EFIAPI *KEYPAD_RESET)(KEYPAD_DEVICE_PROTOCOL *This);
typedef EFI_STATUS(EFIAPI *KEYPAD_GET_KEYS)(
    KEYPAD_DEVICE_PROTOCOL *This, KEYPAD_RETURN_API *KeypadReturnApi,
    UINT64 Delta);

struct _KEYPAD_DEVICE_PROTOCOL {
  KEYPAD_RESET    Reset;
  KEYPAD_GET_KEYS GetKeys;
};

extern EFI_GUID gMediaTekKeypadDeviceProtocolGuid;

#endif
