#include <Uefi.h>
#include <Library/ArmLib.h>
#include <Library/BaseLib.h>
#include <Library/UefiLib.h>
#include <Library/PcdLib.h>
#include <Library/DebugLib.h>
#include <Library/UefiApplicationEntryPoint.h>
#include <Library/UefiBootServicesTableLib.h>
#include <Library/UefiRuntimeServicesTableLib.h>
#include <Library/CacheMaintenanceLib.h>

#define LINUX_BOOT_ACQUIRED_MAGIC 0x5241

EFI_STATUS
EFIAPI
Reboot2PayloadAppEntryPoint(
    IN EFI_HANDLE ImageHandle, IN EFI_SYSTEM_TABLE *SystemTable)
{
  
  UINT16* ptr = (UINT16*)0x17FE00000;

  for(int i = 0; i < 128; i++) {
    *(ptr + i) = LINUX_BOOT_ACQUIRED_MAGIC;
  }

  WriteBackInvalidateDataCacheRange(ptr, 256);
  gRT->ResetSystem(EfiResetWarm, EFI_SUCCESS, 0, NULL);
  CpuDeadLoop();
  return EFI_SUCCESS;
}