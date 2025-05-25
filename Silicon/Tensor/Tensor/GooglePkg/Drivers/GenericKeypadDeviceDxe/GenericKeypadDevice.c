#include <PiDxe.h>

#include <Library/DebugLib.h>
#include <Library/KeypadDeviceImplLib.h>
#include <Library/UefiBootServicesTableLib.h>

#include <Protocol/KeypadDevice.h>
// Must follow
#include <Device/KeypadDevicePath.h>

STATIC KEYPAD_DEVICE_PROTOCOL mInternalKeypadDevice = {
    KeypadDeviceImplReset,
    KeypadDeviceImplGetKeys,
};

EFI_STATUS
EFIAPI
KeypadDeviceDxeInitialize(
    IN EFI_HANDLE ImageHandle, IN EFI_SYSTEM_TABLE *SystemTable)
{
  EFI_STATUS Status;

  Status = gBS->InstallMultipleProtocolInterfaces(
      &ImageHandle, &gGoogleKeypadDeviceProtocolGuid, &mInternalKeypadDevice,
      &gEfiDevicePathProtocolGuid, &mInternalKeypadDevicePath, NULL);
  ASSERT_EFI_ERROR(Status);

  return Status;
}
