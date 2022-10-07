#ifndef _TOUCH_DEVICE_PATH_H_
#define _TOUCH_DEVICE_PATH_H_

typedef struct {
  VENDOR_DEVICE_PATH       VendorDevicePath;
  EFI_DEVICE_PATH_PROTOCOL End;
} EFI_TOUCH_DEVICE_PATH;

#define TOUCH_DEVICE_GUID                                                      \
  {                                                                            \
    0x0A861D79, 0x6D25, 0x4170,                                                \
    {                                                                          \
      0xB6, 0xC4, 0x48, 0x7A, 0xA3, 0x57, 0xCC, 0x79                           \
    }                                                                          \
  }

EFI_TOUCH_DEVICE_PATH TouchDxeDevicePath = {
    {
        {
            HARDWARE_DEVICE_PATH,
            HW_VENDOR_DP,
            {
                sizeof(VENDOR_DEVICE_PATH),
                0,
            },
        },
        TOUCH_DEVICE_GUID,
    },
    {
        END_DEVICE_PATH_TYPE,
        END_ENTIRE_DEVICE_PATH_SUBTYPE,
        {
            sizeof(EFI_DEVICE_PATH_PROTOCOL),
            0,
        },
    },
};

#endif
