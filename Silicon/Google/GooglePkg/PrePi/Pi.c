// Pi.c: Entry point for SEC(Security).

#include <PiPei.h>
#include <Pi/PiBootMode.h>

#include <Library/PrePiLib.h>
#include <Library/PrintLib.h>
#include <Library/PrePiHobListPointerLib.h>
#include <Library/CacheMaintenanceLib.h>
#include <Library/PlatformPrePiLib.h>

#include <Ppi/GuidedSectionExtraction.h>

#include <Library/MemoryMapHelperLib.h>

#include "Pi.h"

#define IS_XIP()  (((UINT64)FixedPcdGet64 (PcdFdBaseAddress) > mSystemMemoryEnd) ||\
                  ((FixedPcdGet64 (PcdFdBaseAddress) + FixedPcdGet32 (PcdFdSize)) <= FixedPcdGet64 (PcdSystemMemoryBase)))

UINT64  mSystemMemoryEnd = FixedPcdGet64 (PcdSystemMemoryBase) +
                           FixedPcdGet64 (PcdSystemMemorySize) - 1;

VOID EFIAPI ProcessLibraryConstructorList(VOID);

/*char* ptr = (char*)0xfd3ff000;

void printInRam(char* str){
	
  for(int i = 0; i < 3; i++){
  	*ptr = *str;
  	ptr++;
  	str++;
  }
  *ptr = '\n';
  ptr++;
	
}*/

int ramTest(char* start, long size){
  int out = 0;
  char* end = start + size;
  
  DEBUG((EFI_D_INFO, "Testing %llx-%llx\n", start, end));

  for(char* i; i < end; i++){
    *i = 0;
  }
  
  for(char* i; i < end; i++){
    out |= (*i != 0);
  }
  
  DEBUG((EFI_D_INFO, "Result %d\n", out));
  return out; //0 for success
  
}

VOID
PrePiMain(
  IN VOID *StackBase,
  IN UINTN StackSize
  )
{

  EFI_HOB_HANDOFF_INFO_TABLE *HobList;
  EFI_STATUS                  Status;

  UINTN MemoryBase     = 0;
  UINTN MemorySize     = 0;
  UINTN UefiMemoryBase = 0;
  UINTN UefiMemorySize = 0;

	//printInRam("HI!");

  //ramTest((char*)0x880000000, 0x280000000);

  // Architecture-specific initialization
  // Enable Floating Point
  ArmEnableVFP();
  
//printInRam("010");

  if (ArmReadCurrentEL() == AARCH64_EL2) {
    // Trap General Exceptions. All exceptions that would be routed to EL1 are routed to EL2
    ArmWriteHcr(ARM_HCR_TGE);

    /* Enable Timer access for non-secure EL1 and EL0
       The cnthctl_el2 register bits are architecturally
       UNKNOWN on reset.
       Disable event stream as it is not in use at this stage
    */
    ArmWriteCntHctl(CNTHCTL_EL2_EL1PCTEN | CNTHCTL_EL2_EL1PCEN);
  }
//printInRam("020");

  /* Enable program flow prediction, if supported */
  ArmEnableBranchPrediction();
//printInRam("030");

  ARM_MEMORY_REGION_DESCRIPTOR_EX DxeHeap;
  ARM_MEMORY_REGION_DESCRIPTOR_EX UefiStack;
  ARM_MEMORY_REGION_DESCRIPTOR_EX UefiFd;

  Status = LocateMemoryMapAreaByName("DXE Heap", &DxeHeap);
  ASSERT_EFI_ERROR (Status);

  Status = LocateMemoryMapAreaByName("UEFI Stack", &UefiStack);
  ASSERT_EFI_ERROR (Status);

  Status = LocateMemoryMapAreaByName("UEFI FD", &UefiFd);
  ASSERT_EFI_ERROR (Status);

  // Declare UEFI region
  MemoryBase     = FixedPcdGet32(PcdSystemMemoryBase);
  MemorySize     = FixedPcdGet32(PcdSystemMemorySize);
  UefiMemoryBase = DxeHeap.Address;
  UefiMemorySize = DxeHeap.Length;
  
  StackBase      = (VOID *)(UefiMemoryBase + UefiMemorySize - StackSize);

  DEBUG(
      (EFI_D_INFO | EFI_D_LOAD,
       "UEFI Memory Base = 0x%llx, Size = 0x%llx \n"
       "Stack Base = 0x%llx, Stack Size = 0x%llx \n",
       UefiMemoryBase, UefiMemorySize, StackBase, StackSize));

  // Set up HOB
  HobList = HobConstructor(
      (VOID *)UefiMemoryBase, UefiMemorySize, (VOID *)UefiMemoryBase,
      StackBase);
//printInRam("040");

  PrePeiSetHobList (HobList);
  
  //DEBUG((EFI_D_INFO, "HOB Base address: %llx", HobList.FirmwareVolume->BaseAddress));

  // Invalidate cache
  InvalidateDataCacheRange(
      (VOID *)(UINTN)PcdGet64(PcdFdBaseAddress), PcdGet32(PcdFdSize));
//printInRam("050");

  // Initialize MMU
  Status = MemoryPeim(UefiMemoryBase, UefiMemorySize);
  ASSERT_EFI_ERROR (Status);
  
//printInRam("060");
  // Add HOBs
  BuildStackHob ((UINTN)StackBase, StackSize);
//printInRam("070");

  // TODO: Call CpuPei as a library
  BuildCpuHob (ArmGetPhysicalAddressBits (), PcdGet8 (PcdPrePiCpuIoSize));
//printInRam("080");

  // Set the Boot Mode
  SetBootMode (BOOT_WITH_DEFAULT_SETTINGS);
//printInRam("090");

  // Initialize Platform HOBs (CpuHob and FvHob)
  DEBUG((EFI_D_INFO, "PlatformPeim In \n"));
  Status = PlatformPeim();
  ASSERT_EFI_ERROR (Status);
//printInRam("100");

  // Now, the HOB List has been initialized, we can register performance information
  // PERF_START (NULL, "PEI", NULL, StartTimeStamp);

  // SEC phase needs to run library constructors by hand.
  ProcessLibraryConstructorList();
//printInRam("105");

  // Assume the FV that contains the SEC (our code) also contains a compressed FV.
  DEBUG((EFI_D_INFO, "DecompressFirstFv In \n"));
  Status = DecompressFirstFv();
  ASSERT_EFI_ERROR (Status);
//printInRam("110");

	//while(1);

  // Load the DXE Core and transfer control to it
  DEBUG((EFI_D_INFO, "LoadDxeCoreFromFv In \n"));
  Status = LoadDxeCoreFromFv(NULL, 0);
  ASSERT_EFI_ERROR (Status);
  DEBUG((EFI_D_INFO, "AAAAAAAAAAAAAA\n")); //nabijen i ovaj mmu na kurac
//printInRam("120");
}

VOID
CEntryPoint(
  IN VOID *StackBase,
  IN UINTN StackSize
  )
{
  // Do platform specific initialization here
  PlatformInitialize();

  // Goto primary Main.
  PrePiMain(StackBase, StackSize);

  // DXE Core should always load and never return
  ASSERT(FALSE);
}

VOID
SecondaryCEntryPoint(
  IN  UINTN  MpId
  )
{
  // We must never get into this function on UniCore system
  ASSERT(FALSE);
}
