#include <Library/ArmGicLib.h>
#include <Library/ArmLib.h>
#include <Library/BaseLib.h>
#include <Library/BaseMemoryLib.h>
#include <Library/DebugLib.h>
#include <Library/HobLib.h>
#include <Library/IoLib.h>
#include <Library/MemoryAllocationLib.h>
#include <Library/PcdLib.h>
#include <Library/PrintLib.h>
#include <Library/SerialPortLib.h>

#include <IndustryStandard/ArmStdSmc.h>
#include <Library/ArmSmcLib.h>
#include <Library/PlatformPrePiLib.h>

#include "EarlyQGic/EarlyQGic.h"
#include "PlatformUtils.h"
#include <Configuration/DeviceMemoryMap.h>

BOOLEAN IsLinuxBootRequested(VOID)
{
  return (MmioRead32(LID0_GPIO38_STATUS_ADDR) & 1) == 0;
}

EFI_STATUS
EFIAPI
SerialPortLocateArea(PARM_MEMORY_REGION_DESCRIPTOR_EX *MemoryDescriptor)
{
  PARM_MEMORY_REGION_DESCRIPTOR_EX MemoryDescriptorEx =
      gDeviceMemoryDescriptorEx;

  // Run through each memory descriptor
  while (MemoryDescriptorEx->Length != 0) {
    if (AsciiStriCmp("PStore", MemoryDescriptorEx->Name) == 0) {
      *MemoryDescriptor = MemoryDescriptorEx;
      return EFI_SUCCESS;
    }
    MemoryDescriptorEx++;
  }

  return EFI_NOT_FOUND;
}

VOID InitializeSharedUartBuffers(VOID)
{
#if USE_MEMORY_FOR_SERIAL_OUTPUT == 1
  PARM_MEMORY_REGION_DESCRIPTOR_EX PStoreMemoryRegion = NULL;
#endif

  INTN *pFbConPosition =
      (INTN
           *)(FixedPcdGet32(PcdMipiFrameBufferAddress) + (FixedPcdGet32(PcdMipiFrameBufferWidth) * FixedPcdGet32(PcdMipiFrameBufferHeight) * FixedPcdGet32(PcdMipiFrameBufferPixelBpp) / 8));

  *(pFbConPosition + 0) = 0;
  *(pFbConPosition + 1) = 0;

#if USE_MEMORY_FOR_SERIAL_OUTPUT == 1
  // Clear PStore area
  SerialPortLocateArea(&PStoreMemoryRegion);
  UINT8 *base = (UINT8 *)PStoreMemoryRegion->Address;
  for (UINTN i = 0; i < PStoreMemoryRegion->Length; i++) {
    base[i] = 0;
  }
#endif
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

VOID DoSmcCall(ARM_SMC_ARGS *SmcArgs)
{
  ARM_SMC_ARGS StubArgsSmc;
  UINTN        InterruptId;
  UINTN        AcknowledgeInterrupt;

  UINT32 AttemptCount = 0;

  // Enable gic cpu interface
  ArmGicV3EnableInterruptInterface();

  // Enable gic distributor
  ArmGicEnableDistributor(PcdGet64(PcdGicDistributorBase));

  // Enable interrupts
  ArmEnableInterrupts();

  do {
    CopyMem(&StubArgsSmc, SmcArgs, sizeof(ARM_SMC_ARGS));
    ArmCallSmc(&StubArgsSmc);
    AttemptCount++;

    AcknowledgeInterrupt = ArmGicAcknowledgeInterrupt(
        FixedPcdGet64(PcdGicInterruptInterfaceBase), &InterruptId);
    if (InterruptId <
        ArmGicGetMaxNumInterrupts(FixedPcdGet64(PcdGicDistributorBase))) {
      // Got a valid SGI number hence signal End of Interrupt
      ArmGicEndOfInterrupt(
          FixedPcdGet64(PcdGicInterruptInterfaceBase), AcknowledgeInterrupt);
    }
  } while (StubArgsSmc.Arg0 == 1 &&
           AttemptCount < 1000); // Interrupted error code

  // Disable interrupts
  ArmDisableInterrupts();

  // Disable Gic Interface
  ArmGicV3DisableInterruptInterface();

  // Disable Gic Distributor
  ArmGicDisableDistributor(PcdGet64(PcdGicDistributorBase));

  CopyMem(SmcArgs, &StubArgsSmc, sizeof(ARM_SMC_ARGS));
}

VOID SetWatchdogState(BOOLEAN Enable)
{
  ARM_SMC_ARGS StubArgsSmc;

  StubArgsSmc.Arg0 = QHEE_SMC_VENDOR_HYP_WDOG_CONTROL;
  StubArgsSmc.Arg1 = Enable ? 3 : 2;
  StubArgsSmc.Arg2 = 0;
  StubArgsSmc.Arg3 = 0;
  StubArgsSmc.Arg4 = 0;
  StubArgsSmc.Arg5 = 0;
  StubArgsSmc.Arg6 = 0;
  StubArgsSmc.Arg7 = 0;
  DoSmcCall(&StubArgsSmc);

  if (StubArgsSmc.Arg0 == 1) {
    DEBUG(
        (EFI_D_ERROR,
         "Qualcomm Watchdog Reboot timer could not be disabled due to SMC call "
         "processing being interrupted by another CPU.\n"));
  }
  else if (StubArgsSmc.Arg0 != 0) {
    DEBUG(
        (EFI_D_ERROR,
         "Disabling Qualcomm Watchdog Reboot timer failed! Status=%d\n",
         StubArgsSmc.Arg0));
  }
}

VOID SetHypervisorUartState(BOOLEAN Enable)
{
  ARM_SMC_ARGS StubArgsSmc;

  StubArgsSmc.Arg0 = Enable ? QHEE_SMC_VENDOR_HYP_UART_ENABLE
                            : QHEE_SMC_VENDOR_HYP_UART_DISABLE;
  StubArgsSmc.Arg1 = 0;
  StubArgsSmc.Arg2 = 0;
  StubArgsSmc.Arg3 = 0;
  StubArgsSmc.Arg4 = 0;
  StubArgsSmc.Arg5 = 0;
  StubArgsSmc.Arg6 = 0;
  StubArgsSmc.Arg7 = 0;
  DoSmcCall(&StubArgsSmc);

  if (StubArgsSmc.Arg0 == 1) {
    DEBUG(
        (EFI_D_ERROR,
         "Qualcomm Hypervisor UART Logging could not be toggled due to SMC "
         "call processing being interrupted by another CPU.\n"));
  }
  else if (StubArgsSmc.Arg0 != 0) {
    DEBUG(
        (EFI_D_ERROR,
         "Toggling Qualcomm Hypervisor UART Logging failed! Status=%d\n",
         StubArgsSmc.Arg0));
  }
}

UINTN
PSCI_CPU_ON(UINTN target_cpu, UINTN entry_point_address, UINTN context_id)
{
  ARM_SMC_ARGS ArmSmcArgs;
  ArmSmcArgs.Arg0 = ARM_SMC_ID_PSCI_CPU_ON_AARCH64;
  ArmSmcArgs.Arg1 = target_cpu;
  ArmSmcArgs.Arg2 = entry_point_address;
  ArmSmcArgs.Arg3 = context_id;

  ArmCallSmc(&ArmSmcArgs);
  return ArmSmcArgs.Arg0;
}

UINTN
PSCI_CPU_OFF()
{
  ARM_SMC_ARGS ArmSmcArgs;
  ArmSmcArgs.Arg0 = ARM_SMC_ID_PSCI_CPU_OFF;

  ArmCallSmc(&ArmSmcArgs);
  return ArmSmcArgs.Arg0;
}

VOID EnsureRunningOnCorrectCPU()
{
  UINT64 MpId;
  UINT64 CpuTarget;

  MpId      = ArmReadMpidr();
  CpuTarget = MpId & 0xFFF;

  // Are we running on the CPU core we want?
  if (CpuTarget != 0x00000700) {
    // Jump to the CPU core we want
    PSCI_CPU_ON(0x00000700, (UINTN)&_SecondaryModuleEntryPoint, 0);

    // Turn off this CPU core
    PSCI_CPU_OFF();

    // We should never get here
    CpuDeadLoop();
  }
}

VOID PlatformInitialize(VOID)
{
  // For now given Multi Core support in Windows is a bit broken, let's move
  // ourselves to the last CPU for best performance.
  EnsureRunningOnCorrectCPU();

  // Initialize UART Serial
  UartInit();

  // Initialize GIC
  if (EFI_ERROR(QGicPeim())) {
    DEBUG((EFI_D_ERROR, "Failed to configure GIC\n"));
    CpuDeadLoop();
  }

  // Enable Hypervisor UART
  // SetHypervisorUartState(TRUE);

  // Disable WatchDog Timer
  // SetWatchdogState(FALSE);
}
