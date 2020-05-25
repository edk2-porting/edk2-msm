/** @file
*
*  Copyright (c) 2011, ARM Limited. All rights reserved.
*  Copyright (c) 2019, RUIKAI LIU and MR TUNNEL. All rights reserved.
*
*  This program and the accompanying materials
*  are licensed and made available under the terms and conditions of the BSD License
*  which accompanies this distribution.  The full text of the license may be found at
*  http://opensource.org/licenses/bsd-license.php
*
*  THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
*  WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
*
**/

#include <Library/ArmPlatformLib.h>
#include <Library/MemoryAllocationLib.h>
#include <Library/DebugLib.h>
#include <Library/HobLib.h>
#include <Configuration/DeviceMemoryMap.h>
/**
  Return the Virtual Memory Map of your platform
  This Virtual Memory Map is used by MemoryInitPei Module to initialize the MMU on your platform.
  @param[out]   VirtualMemoryMap    Array of ARM_MEMORY_REGION_DESCRIPTOR describing a Physical-to-
                                    Virtual Memory mapping. This array must be ended by a zero-filled
                                    entry
**/

STATIC
VOID
AddHob
(
    ARM_MEMORY_REGION_DESCRIPTOR_EX Desc
)
{
	BuildResourceDescriptorHob(
		Desc.ResourceType,
		Desc.ResourceAttribute,
		Desc.Address,
		Desc.Length
	);

	BuildMemoryAllocationHob(
		Desc.Address,
		Desc.Length,
		Desc.MemoryType
	);
}

VOID
ArmPlatformGetVirtualMemoryMap (
  IN ARM_MEMORY_REGION_DESCRIPTOR** VirtualMemoryMap
  )
{
  //TO-DO:ADD MEMORY MAP HERE
    ARM_MEMORY_REGION_DESCRIPTOR* MemoryDescriptor;
    UINTN Index = 0;

    MemoryDescriptor = (ARM_MEMORY_REGION_DESCRIPTOR*)AllocatePages
                       (EFI_SIZE_TO_PAGES (sizeof (ARM_MEMORY_REGION_DESCRIPTOR) *
                       MAX_ARM_MEMORY_REGION_DESCRIPTOR_COUNT));

    // Run through each memory descriptor
    while (gDeviceMemoryDescriptorEx[Index].Address != (EFI_PHYSICAL_ADDRESS)0xFFFFFFFF)
    {
        switch (gDeviceMemoryDescriptorEx[Index].HobOption)
        {
            case AddMem:
			case AddDev:
                AddHob(gDeviceMemoryDescriptorEx[Index]);
                break;
            case NoHob:
            default:
                goto update;
        }

    update:
        ASSERT(Index < MAX_ARM_MEMORY_REGION_DESCRIPTOR_COUNT);

        MemoryDescriptor[Index].PhysicalBase = gDeviceMemoryDescriptorEx[Index].Address;
        MemoryDescriptor[Index].VirtualBase = gDeviceMemoryDescriptorEx[Index].Address;
        MemoryDescriptor[Index].Length = gDeviceMemoryDescriptorEx[Index].Length;
	MemoryDescriptor[Index].Attributes = gDeviceMemoryDescriptorEx[Index].ArmAttributes;

        Index++;
    }

    // Last one (terminator)
    MemoryDescriptor[Index].PhysicalBase = 0;
    MemoryDescriptor[Index].VirtualBase = 0;
    MemoryDescriptor[Index].Length = 0;
    MemoryDescriptor[Index++].Attributes = (ARM_MEMORY_REGION_ATTRIBUTES)0;
    ASSERT(Index <= MAX_ARM_MEMORY_REGION_DESCRIPTOR_COUNT);

    *VirtualMemoryMap = &MemoryDescriptor[0];
  //ASSERT(0);
}