#include <Uefi.h>

#include <Library/MemoryAllocationLib.h>
#include <Library/PcdLib.h>
#include <Library/UefiBootServicesTableLib.h>
#include <Library/UefiLib.h>
#include <Library/DebugLib.h>

#include <Protocol/AbsolutePointer.h>
#include <Protocol/EFITlmm.h>
#include <Protocol/EFII2C.h>

#include "SynapticsRmi4.h"
#include <Device/TouchDevicePath.h>

SYNAPTICS_I2C_DEVICE mTemplate = {
  .Signature              = RMI4_DEV_INSTANCE_SIGNATURE,
  .XMax                   = 0,
  .YMax                   = 0,
  .XMin                   = 0,
  .YMin                   = 0,
  .XInverted              = FALSE,
  .YInverted              = FALSE,
  .ControllerResetPin     = 0,
  .ControllerInterruptPin = 0,
  .ControllerI2cDevice    = 0,
  .GpioTlmmProtocol       = NULL,
  .I2cQupProtocol         = NULL,
  .SlaveCfg               = {
    .BusFrequency         = I2C_FAST_MODE_FREQ_KHZ,
    .SlaveAddress         = 0,
    .Mode                 = I2C,
    .SlaveMaxClockStretch = 500,
    .CoreConfiguration1   = 0,
    .CoreConfiguration2   = 0,
  },
};

EFI_STATUS EFIAPI SynaDeviceInitialize(
    IN EFI_HANDLE ImageHandle, IN EFI_SYSTEM_TABLE *SystemTable)
{
  SYNAPTICS_I2C_DEVICE *Instance;
  EFI_STATUS            Status;

  // Device instance
  Instance = AllocateCopyPool(sizeof(SYNAPTICS_I2C_DEVICE), &mTemplate);
  if (Instance == NULL) {
    Status = EFI_OUT_OF_RESOURCES;
    goto exit;
  }

  // Config
  Instance->SlaveCfg.SlaveAddress  = PcdGet16(PcdTouchCtlrAddress);
  Instance->ControllerI2cDevice    = PcdGet32(PcdTouchCtlrI2cDevice);
  Instance->ControllerResetPin     = PcdGet32(PcdTouchCtlrResetPin);
  Instance->ControllerInterruptPin = PcdGet32(PcdTouchCtlrIntPin);
  Instance->ControllerVddPin       = PcdGet32(PcdTouchCtlrVddPin);
  Instance->ControllerVddIoPin     = PcdGet32(PcdTouchCtlrVddIoPin);
  Instance->ControllerVddCtlActiveLow     = PcdGetBool(PcdTouchCtlrVddPinActiveLow);
  Instance->XMax                   = PcdGet32(PcdTouchMaxX);
  Instance->XMin                   = PcdGet32(PcdTouchMinX);
  Instance->XInverted              = PcdGetBool(PcdTouchInvertedX);
  Instance->YMax                   = PcdGet32(PcdTouchMaxY);
  Instance->YMin                   = PcdGet32(PcdTouchMinY);
  Instance->YInverted              = PcdGetBool(PcdTouchInvertedY);
  DEBUG((EFI_D_INFO,
    "SynapticsTouchDevice: "
    "Address: 0x%X Device: %d "
    "ResetPin: %d IntPin: %d "
    "X: %d - %d (Inverted: %d) "
    "Y: %d - %d (Inverted: %d)\n",
    Instance->SlaveCfg.SlaveAddress, Instance->ControllerI2cDevice,
    Instance->ControllerResetPin, Instance->ControllerInterruptPin,
    Instance->XMin, Instance->XMax, Instance->XInverted,
    Instance->YMax, Instance->YMax, Instance->YInverted
    ));

  // I2C Protocol
  Status = gBS->LocateProtocol(
      &gQcomI2cProtocolGuid, NULL, (VOID *)&Instance->I2cQupProtocol);
  if (EFI_ERROR(Status)) {
    DEBUG((EFI_D_ERROR, "SynapticsTouchDevice: Unable to locate I2C protocol: %r\n", Status));
    goto exit;
  }

  // GPIO Processing
  Status = gBS->LocateProtocol(
      &gQcomTlmmProtocolGuid, NULL, (VOID *)&Instance->GpioTlmmProtocol);
  if (EFI_ERROR(Status)) {
    DEBUG((EFI_D_ERROR, "SynapticsTouchDevice: Unable to locate GPIO protocol: %r\n", Status));
    goto exit;
  }

  // Looks good and publish the protocol
  Status = gBS->InstallMultipleProtocolInterfaces(
      &ImageHandle, &gSynapticsTouchDeviceProtocolGuid, Instance,
      &gEfiDevicePathProtocolGuid, &TouchDxeDevicePath, NULL);
  if (EFI_ERROR(Status)) {
    DEBUG((EFI_D_ERROR, "SynapticsTouchDevice: Unable to install protocol: %r\n", Status));
  }

exit:
  return Status;
}
