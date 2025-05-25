#include <Library/PcdLib.h>
#include <Library/ArmLib.h>
#include <Library/BaseMemoryLib.h>
#include <Library/DebugLib.h>
#include <Library/IoLib.h>
#include <Library/MemoryAllocationLib.h>
#include <Library/HobLib.h>
#include <Library/SerialPortLib.h>
#include <Library/PrintLib.h>
#include <Library/BaseLib.h>
#include <Library/MemoryMapHelperLib.h>
#include <Library/PlatformPrePiLib.h>

#include "PlatformUtils.h"


VOID InitializeSharedUartBuffers(VOID)
{
  INTN* pFbConPosition = (INTN*)(FixedPcdGet32(PcdMipiFrameBufferAddress) + (FixedPcdGet32(PcdMipiFrameBufferWidth) * 
                                                                              FixedPcdGet32(PcdMipiFrameBufferHeight) * 
                                                                              FixedPcdGet32(PcdMipiFrameBufferPixelBpp) / 8));

  *(pFbConPosition + 0) = 0;
  *(pFbConPosition + 1) = 0;
}

VOID DisableWDT(VOID)
{
	UINT32 wtcon;
	// disable cl0
	wtcon = MmioRead32(0x10060000);
	wtcon &= ~((1 << 5) | (1 << 0));
	MmioWrite32(0x10060000, wtcon);
	// disable cl1
	wtcon = MmioRead32(0x10070000);
	wtcon &= ~((1 << 5) | (1 << 0));
	MmioWrite32(0x10070000, wtcon);
}

VOID UartInit(VOID)
{
  SerialPortInitialize();

  InitializeSharedUartBuffers();

  DEBUG((EFI_D_INFO, "\nRenegade Project edk2-msm (AArch64)\n"));
  DEBUG(
      (EFI_D_INFO, "Firmware version %s built %a %a\n\n",
       (CHAR16 *)PcdGetPtr(PcdFirmwareVersionString), __TIME__, __DATE__));
}

VOID SetWatchdogState(BOOLEAN Enable)
{
  MmioWrite32(APSS_WDT_BASE + APSS_WDT_ENABLE_OFFSET, Enable);
}

VOID PlatformInitialize()
{
  UartInit();

  // Disable WatchDog Timer
  DisableWDT();
}
