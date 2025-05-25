#include <Base.h>

#include <Library/ArmPlatformSysConfigLib.h>
#include <Library/DebugLib.h>
#include <Library/ResetSystemLib.h>
#include <Library/IoLib.h>


VOID
EFIAPI
ResetCold (
  VOID
  )
{
  MmioWrite32(0x10060008, 0x80);
  MmioWrite32(0x10060004, 0x80);
  MmioWrite32(0x10060000, (1 << 5) | (0 << 3) | (1 << 0) | (0x20 << 8));
  MmioWrite32(0x10070008, 0x80);
  MmioWrite32(0x10070004, 0x80);
  MmioWrite32(0x10070000, (1 << 5) | (0 << 3) | (1 << 0) | (0x20 << 8));
}

VOID
EFIAPI
ResetWarm (
  VOID
  )
{
  ResetCold ();
}

VOID
EFIAPI
ResetShutdown (
  VOID
  )
{
  // not implemented
}

VOID
EFIAPI
EnterS3WithImmediateWake (
  VOID
  )
{
  // not implemented
}

VOID
EFIAPI
ResetPlatformSpecific (
  IN UINTN   DataSize,
  IN VOID    *ResetData
  )
{
  ResetCold ();
}

VOID
EFIAPI
ResetSystem (
  IN EFI_RESET_TYPE               ResetType,
  IN EFI_STATUS                   ResetStatus,
  IN UINTN                        DataSize,
  IN VOID                         *ResetData OPTIONAL
  )
{
  switch (ResetType) {
  case EfiResetWarm:
    ResetWarm ();
    break;

  case EfiResetCold:
    ResetCold ();
    break;

  case EfiResetShutdown:
    ResetShutdown ();
    return;

  case EfiResetPlatformSpecific:
    ResetPlatformSpecific (DataSize, ResetData);
    return;

  default:
    return;
  }
}
