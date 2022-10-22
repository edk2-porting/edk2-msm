#include <Library/PcdLib.h>
#include <Library/DebugLib.h>
#include <Library/UefiDriverEntryPoint.h>
#include <Library/UefiBootServicesTableLib.h>

#include <Protocol/EFIClock.h>

STATIC EFI_HANDLE Handle = NULL;

EFI_STATUS
EFIAPI
SetCPUFreqDxeMain (
  IN EFI_HANDLE        ImageHandle,
  IN EFI_SYSTEM_TABLE  *SystemTable
  )
{
  EFI_STATUS             Status                       = EFI_SUCCESS;
  EFI_CLOCK_PROTOCOL    *pClockProtocol               = NULL;
  UINT32                 perfLevel                    = 0;
  UINT32                 frequencyHz                  = 0;

  Status = gBS->LocateProtocol(
      &gEfiClockProtocolGuid, 
      NULL, 
      (VOID **)&pClockProtocol
  );

  if (EFI_ERROR(Status)) {
    DEBUG((EFI_D_INFO, "%a: Failed to locate protocol\n", __FUNCTION__));
    return Status;
  }

  DEBUG((EFI_D_INFO, "\n\n\n\n\n\n\n\n\n\n\n\n\n"));

  // here we assume 4 cpu + 4 cpu + L3 cache
  for (int i = 0; i < 9; i++) {
    Status = pClockProtocol->GetMaxPerfLevel(pClockProtocol, i, &perfLevel);

    if (EFI_ERROR(Status)) {
      DEBUG((EFI_D_INFO, "%a: Failed to get the maximum performance level for CPU %d, Status: %r\n", __FUNCTION__, i, Status));
      DEBUG((EFI_D_INFO, "%a: This CPU may not exist on current platform\n", __FUNCTION__));
      // gBS->Stall(10 * 1000 * 1000);
      return Status;
    }

    // Helps to set proper freq in PrePi
    DEBUG((EFI_D_INFO, "CPU %d has max perfLevel of %d              \n", i, perfLevel));
    Status = pClockProtocol->SetCpuPerfLevel(pClockProtocol, i, perfLevel, &frequencyHz);

    if (EFI_ERROR(Status)) {
      DEBUG((EFI_D_INFO, "%a: Failed to set the maximum performance level for CPU %d, Status: %r\n", __FUNCTION__, i, Status));
      return Status;
    }

    DEBUG((EFI_D_INFO, "%a: CPU %d Now running at %d Hz\n", __FUNCTION__, i, frequencyHz));
  }

  // gBS->Stall(10 * 1000 * 1000);
  return Status;
}
