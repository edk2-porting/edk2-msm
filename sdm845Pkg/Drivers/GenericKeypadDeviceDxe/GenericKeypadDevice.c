#include <PiDxe.h>
#include <Protocol/KeypadDevice.h>
#include <Library/DebugLib.h>
#include <Library/KeypadDeviceImplLib.h>
#include <Library/UefiBootServicesTableLib.h>

typedef struct {
  VENDOR_DEVICE_PATH  Keypad;
  EFI_DEVICE_PATH     End;
} KEYPAD_DEVICE_PATH;

KEYPAD_DEVICE_PATH mInternalDevicePath = {
  {
    {
      HARDWARE_DEVICE_PATH,
      HW_VENDOR_DP,
      {
        (UINT8)(sizeof(VENDOR_DEVICE_PATH)),
        (UINT8)((sizeof(VENDOR_DEVICE_PATH)) >> 8),
      },
    },
    EFI_CALLER_ID_GUID,
  },
  {
    END_DEVICE_PATH_TYPE,
    END_ENTIRE_DEVICE_PATH_SUBTYPE,
    { sizeof (EFI_DEVICE_PATH_PROTOCOL), 0 }
  }
};

STATIC KEYPAD_DEVICE_PROTOCOL mInternalKeypadDevice = {
  KeypadDeviceImplReset,
  KeypadDeviceImplGetKeys,
};

EFI_STATUS
EFIAPI
KeypadDeviceDxeInitialize (
  IN EFI_HANDLE         ImageHandle,
  IN EFI_SYSTEM_TABLE   *SystemTable
  )
{
  EFI_STATUS Status;

  Status = gBS->InstallMultipleProtocolInterfaces(
                  &ImageHandle,
                  &gEFIDroidKeypadDeviceProtocolGuid,      
                  &mInternalKeypadDevice,
                  &gEfiDevicePathProtocolGuid,         
                  &mInternalDevicePath,
                  NULL
                  );
  ASSERT_EFI_ERROR(Status);

  return Status;
}
