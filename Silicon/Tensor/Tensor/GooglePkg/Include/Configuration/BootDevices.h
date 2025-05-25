#ifndef _BOOT_DEVICES_H_
#define _BOOT_DEVICES_H_

#include <Library/DevicePathLib.h>
#include <Uefi.h>

#define PLAT_KEYPAD_DEVICE_GUID                                                \
  {                                                                            \
    0xD7F58A0E, 0xBED2, 0x4B5A,                                                \
    {                                                                          \
      0xBB, 0x43, 0x8A, 0xB2, 0x3D, 0xD0, 0xE2, 0xB0                           \
    }                                                                          \
  }

/* DevicePath definition for Button driver */
#pragma pack(1)
typedef struct {
  VENDOR_DEVICE_PATH       VendorDevicePath;
  EFI_DEVICE_PATH_PROTOCOL End;
} EFI_KEYPAD_DEVICE_PATH;
#pragma pack()

EFI_KEYPAD_DEVICE_PATH KeyPadDxeDevicePath = {
    {{HARDWARE_DEVICE_PATH,
      HW_VENDOR_DP,
      {(UINT8)(sizeof(VENDOR_DEVICE_PATH)),
       (UINT8)((sizeof(VENDOR_DEVICE_PATH)) >> 8)}},
     PLAT_KEYPAD_DEVICE_GUID},
    {END_DEVICE_PATH_TYPE,
     END_ENTIRE_DEVICE_PATH_SUBTYPE,
     {(UINT8)(END_DEVICE_PATH_LENGTH),
      (UINT8)((END_DEVICE_PATH_LENGTH) >> 8)}}};

#endif