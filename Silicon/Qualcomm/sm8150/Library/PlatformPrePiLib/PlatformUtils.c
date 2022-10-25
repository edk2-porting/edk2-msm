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

VOID UartInit(VOID)
{
  SerialPortInitialize();

  InitializeSharedUartBuffers();

  DEBUG((EFI_D_INFO, "\nRenegade Project edk2-msm (AArch64)\n"));
  DEBUG(
      (EFI_D_INFO, "Firmware version %s built %a %a\n\n",
       (CHAR16 *)PcdGetPtr(PcdFirmwareVersionString), __TIME__, __DATE__));
}

VOID ConfigureIOMMUContextBankCacheSetting(
    UINT32 ContextBankId, BOOLEAN CacheCoherent)
{
  UINT32 ContextBankAddr =
      SMMU_BASE + SMMU_CTX_BANK_0_OFFSET + ContextBankId * SMMU_CTX_BANK_SIZE;
  MmioWrite32(
      ContextBankAddr + SMMU_CTX_BANK_SCTLR_OFFSET,
      CacheCoherent ? SMMU_CCA_SCTLR : SMMU_NON_CCA_SCTLR);
  MmioWrite32(ContextBankAddr + SMMU_CTX_BANK_TTBR0_0_OFFSET, 0);
  MmioWrite32(ContextBankAddr + SMMU_CTX_BANK_TTBR0_1_OFFSET, 0);
  MmioWrite32(ContextBankAddr + SMMU_CTX_BANK_TTBR1_0_OFFSET, 0);
  MmioWrite32(ContextBankAddr + SMMU_CTX_BANK_TTBR1_1_OFFSET, 0);
  MmioWrite32(ContextBankAddr + SMMU_CTX_BANK_MAIR0_OFFSET, 0);
  MmioWrite32(ContextBankAddr + SMMU_CTX_BANK_MAIR1_OFFSET, 0);
  MmioWrite32(ContextBankAddr + SMMU_CTX_BANK_TTBCR_OFFSET, 0);
}

VOID SetWatchdogState(BOOLEAN Enable)
{
  MmioWrite32(APSS_WDT_BASE + APSS_WDT_ENABLE_OFFSET, Enable);
}

VOID PlatformInitialize()
{
  UartInit();

  // Windows requires Cache Coherency for the UFS to work at its best
  // The UFS device is currently attached to the main IOMMU on Context Bank 1
  // (Previous firmware) But said configuration is non cache coherent compliant,
  // fix it.
  ConfigureIOMMUContextBankCacheSetting(UFS_CTX_BANK, TRUE);

  // Disable WatchDog Timer
  SetWatchdogState(FALSE);
}
