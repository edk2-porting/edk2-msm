#include <Uefi.h>

#include <Library/MemoryAllocationLib.h>
#include <Library/PcdLib.h>
#include <Library/UefiBootServicesTableLib.h>
#include <Library/UefiLib.h>
#include <Library/DebugLib.h>

#include <Protocol/AbsolutePointer.h>
#include <Protocol/EFITlmm.h>
#include <Protocol/EFII2C.h>

#include "SynapticsTCM.h"

EFI_STATUS
EFIAPI
SynaI2cRawRead(
    TCM_INTERNAL_DATA *Instance, IN UINT8 *Data,
    IN UINT16 ReadBytes)
{
  UINT32     Reads       = 0;
  I2C_STATUS I2CStatus   = I2C_SUCCESS;
  EFI_STATUS Status      = EFI_SUCCESS;
  I2C_DESCRIPTOR Desc;

  if (Instance == NULL || Instance->TCMDevice == NULL ||
      Instance->I2cController == NULL ||
      Instance->TCMDevice->I2cQupProtocol == NULL) {
    Status = EFI_INVALID_PARAMETER;
    goto exit;
  }

  if (Data == NULL) {
    Status = EFI_INVALID_PARAMETER;
    goto exit;
  }

  Desc.Buffer = Data;
  Desc.Length = ReadBytes;
  Desc.Flags = I2C_FLAG_START | I2C_FLAG_READ | I2C_FLAG_STOP;

  I2CStatus = Instance->TCMDevice->I2cQupProtocol->Transfer(
    Instance->I2cController,
    &Instance->TCMDevice->SlaveCfg,
    &Desc,
    1,
    NULL,
    NULL,
    0,
    &Reads
  );

  if (I2C_ERROR (I2CStatus)) {
    DEBUG((EFI_D_ERROR, "SynapticsTCMDxe: I2C Read Failed: %d\n", I2CStatus));
    Status = EFI_DEVICE_ERROR;
  }

exit:
  return Status;
}

EFI_STATUS
EFIAPI
SynaI2cRawWrite(
    TCM_INTERNAL_DATA *Instance, IN UINT8 *Data,
    IN UINT16 WriteBytes)
{
  UINT32     Writes      = 0;
  I2C_STATUS I2CStatus   = I2C_SUCCESS;
  EFI_STATUS Status      = EFI_SUCCESS;
  I2C_DESCRIPTOR Desc;

  if (Instance == NULL || Instance->TCMDevice == NULL ||
      Instance->I2cController == NULL ||
      Instance->TCMDevice->I2cQupProtocol == NULL) {
    Status = EFI_INVALID_PARAMETER;
    goto exit;
  }

  if (Data == NULL) {
    Status = EFI_INVALID_PARAMETER;
    goto exit;
  }

  Desc.Buffer = Data;
  Desc.Length = WriteBytes;
  Desc.Flags = I2C_FLAG_START | I2C_FLAG_WRITE | I2C_FLAG_STOP;

  I2CStatus = Instance->TCMDevice->I2cQupProtocol->Transfer(
    Instance->I2cController,
    &Instance->TCMDevice->SlaveCfg,
    &Desc,
    1,
    NULL,
    NULL,
    0,
    &Writes
  );

  if (I2C_ERROR (I2CStatus)) {
    DEBUG((EFI_D_ERROR, "SynapticsTCMDxe: I2C Read Failed: %d\n", I2CStatus));
    Status = EFI_DEVICE_ERROR;
  }

exit:
  return Status;
}
