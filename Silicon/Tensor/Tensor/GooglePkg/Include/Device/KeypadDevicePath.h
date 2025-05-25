#ifndef __KEYPAD_DEVICE_PATH_H__
#define __KEYPAD_DEVICE_PATH_H__

typedef struct {
  VENDOR_DEVICE_PATH Keypad;
  EFI_DEVICE_PATH    End;
} KEYPAD_DEVICE_PATH;

KEYPAD_DEVICE_PATH mInternalKeypadDevicePath = {
    {
        {
            HARDWARE_DEVICE_PATH,
            HW_VENDOR_DP,
            {
                (UINT8)(sizeof(VENDOR_DEVICE_PATH)),
                (UINT8)((sizeof(VENDOR_DEVICE_PATH)) >> 8),
            },
        },
        // gMediaTekKeypadDeviceProtocolGuid
        {
            0xb27625b5,
            0x0b6c,
            0x4614,
            {0xaa, 0x3c, 0x33, 0x13, 0xb5, 0x1d, 0x36, 0x46},
        },
    },
    {
        END_DEVICE_PATH_TYPE,
        END_ENTIRE_DEVICE_PATH_SUBTYPE,
        {sizeof(EFI_DEVICE_PATH_PROTOCOL), 0},
    },
};

#endif
