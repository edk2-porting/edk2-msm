/** @file

  Copyright (c) 2011-2015, ARM Limited. All rights reserved.

  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#include <PiPei.h>

#include <Library/ArmMmuLib.h>
#include <Library/ArmPlatformLib.h>
#include <Library/DebugLib.h>
#include <Library/HobLib.h>
#include <Library/MemoryAllocationLib.h>
#include <Library/PcdLib.h>

// This varies by device
#include <Configuration/DeviceMemoryMap.h>

extern UINT64 mSystemMemoryEnd;

VOID BuildMemoryTypeInformationHob(VOID);


STATIC
VOID InitMmu(IN ARM_MEMORY_REGION_DESCRIPTOR *MemoryTable)
{

  VOID *        TranslationTableBase;
  UINTN         TranslationTableSize;
  RETURN_STATUS Status;

  // Note: Because we called PeiServicesInstallPeiMemory() before
  // to call InitMmu() the MMU Page Table resides in
  // RAM (even at the top of DRAM as it is the first permanent memory
  // allocation)
  Status = ArmConfigureMmu(
      MemoryTable, &TranslationTableBase, &TranslationTableSize);

  if (EFI_ERROR(Status)) {
    DEBUG((EFI_D_ERROR, "Error: Failed to enable MMU: %r\n", Status));
  }
}

STATIC
VOID AddHob(PARM_MEMORY_REGION_DESCRIPTOR_EX Desc)
{
  BuildResourceDescriptorHob(
      Desc->ResourceType, Desc->ResourceAttribute, Desc->Address, Desc->Length);

  if (Desc->ResourceType == EFI_RESOURCE_SYSTEM_MEMORY ||
      Desc->MemoryType == EfiRuntimeServicesData)
  {
    BuildMemoryAllocationHob(Desc->Address, Desc->Length, Desc->MemoryType);
  }
}

/*++

Routine Description:



Arguments:

  FileHandle  - Handle of the file being invoked.
  PeiServices - Describes the list of possible PEI Services.

Returns:

  Status -  EFI_SUCCESS if the boot mode could be set

--*/
EFI_STATUS
EFIAPI
MemoryPeim(IN EFI_PHYSICAL_ADDRESS UefiMemoryBase, IN UINT64 UefiMemorySize)
{

  PARM_MEMORY_REGION_DESCRIPTOR_EX MemoryDescriptorEx =
      gDeviceMemoryDescriptorEx;
  ARM_MEMORY_REGION_DESCRIPTOR
        MemoryDescriptor[MAX_ARM_MEMORY_REGION_DESCRIPTOR_COUNT];
  UINTN Index = 0;

  // Ensure PcdSystemMemorySize has been set
  ASSERT(PcdGet64(PcdSystemMemorySize) != 0);

  // Run through each memory descriptor
  while (MemoryDescriptorEx->Length != 0) {
    switch (MemoryDescriptorEx->HobOption) {
    case AddMem:
    case AddDev:
    case HobOnlyNoCacheSetting:
      AddHob(MemoryDescriptorEx);
      break;
    case NoHob:
    default:
      goto update;
    }

    if (MemoryDescriptorEx->HobOption == HobOnlyNoCacheSetting) {
      MemoryDescriptorEx++;
      continue;
    }

  update:
    ASSERT(Index < MAX_ARM_MEMORY_REGION_DESCRIPTOR_COUNT);

    DEBUG((EFI_D_INFO,"Base: 0x%llx Len:0x%llx                        ", 
              MemoryDescriptorEx->Address, MemoryDescriptorEx->Length));
    MemoryDescriptor[Index].PhysicalBase = MemoryDescriptorEx->Address;
    MemoryDescriptor[Index].VirtualBase  = MemoryDescriptorEx->Address;
    MemoryDescriptor[Index].Length       = MemoryDescriptorEx->Length;
    MemoryDescriptor[Index].Attributes   = MemoryDescriptorEx->ArmAttributes;

    Index++;
    MemoryDescriptorEx++;
  }

  // Last one (terminator)
  ASSERT(Index < MAX_ARM_MEMORY_REGION_DESCRIPTOR_COUNT);
  MemoryDescriptor[Index].PhysicalBase = 0;
  MemoryDescriptor[Index].VirtualBase  = 0;
  MemoryDescriptor[Index].Length       = 0;
  MemoryDescriptor[Index].Attributes   = 0;

  // Build Memory Allocation Hob
  DEBUG((EFI_D_INFO, "\nConfigure MMU In \n"));
  InitMmu(MemoryDescriptor);
  DEBUG((EFI_D_INFO, "Configure MMU Out \n"));

  if (FeaturePcdGet(PcdPrePiProduceMemoryTypeInformationHob)) {
    // Optional feature that helps prevent EFI memory map fragmentation.
    BuildMemoryTypeInformationHob();
  }

  return EFI_SUCCESS;
}