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

EFI_STATUS
EFIAPI
SynaI2cRead(
    RMI4_INTERNAL_DATA *Instance, IN UINT8 Address, IN UINT8 *Data,
    IN UINT16 ReadBytes)
{
  UINT32     Reads       = 0;
  I2C_STATUS I2CStatus   = I2C_SUCCESS;
  EFI_STATUS Status      = EFI_SUCCESS;

  if (Instance == NULL || Instance->Rmi4Device == NULL ||
      Instance->I2cController == NULL ||
      Instance->Rmi4Device->I2cQupProtocol == NULL) {
    Status = EFI_INVALID_PARAMETER;
    goto exit;
  }

  if (Data == NULL) {
    Status = EFI_INVALID_PARAMETER;
    goto exit;
  }

  I2CStatus = Instance->Rmi4Device->I2cQupProtocol->Read(
    Instance->I2cController,
    &Instance->Rmi4Device->SlaveCfg,
    Address,
    sizeof(Address),
    Data,
    ReadBytes,
    &Reads,
    0
    );

  if (I2C_ERROR (I2CStatus)) {
    DEBUG((EFI_D_ERROR, "SynapticsTouchDxe: I2C Read Failed: %d\n", I2CStatus));
    Status = EFI_DEVICE_ERROR;
  }

exit:
  return Status;
}

EFI_STATUS
EFIAPI
SynaI2cWrite(
    RMI4_INTERNAL_DATA *Instance, IN UINT8 Address, IN UINT8 *Data,
    IN UINT16 WriteBytes)
{
  UINT32     Writes      = 0;
  I2C_STATUS I2CStatus   = I2C_SUCCESS;
  EFI_STATUS Status      = EFI_SUCCESS;

  if (Instance == NULL || Instance->Rmi4Device == NULL ||
      Instance->I2cController == NULL ||
      Instance->Rmi4Device->I2cQupProtocol == NULL) {
    Status = EFI_INVALID_PARAMETER;
    goto exit;
  }

  if (Data == NULL) {
    Status = EFI_INVALID_PARAMETER;
    goto exit;
  }

  I2CStatus = Instance->Rmi4Device->I2cQupProtocol->Write(
    Instance->I2cController,
    &Instance->Rmi4Device->SlaveCfg,
    Address,
    sizeof(Address),
    Data,
    WriteBytes,
    &Writes,
    0
    );

  if (I2C_ERROR (I2CStatus)) {
    DEBUG((EFI_D_ERROR, "SynapticsTouchDxe: I2C Read Failed: %d\n", I2CStatus));
    Status = EFI_DEVICE_ERROR;
  }

exit:
  return Status;
}
