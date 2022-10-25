#include <Library/BaseLib.h>
#include <Library/MemoryMapHelperLib.h>
#include <Library/PlatformMemoryMapLib.h>

EFI_STATUS EFIAPI LocateMemoryMapAreaByName(
    CHAR8 *MemoryMapAreaName, ARM_MEMORY_REGION_DESCRIPTOR_EX *MemoryDescriptor)
{
  PARM_MEMORY_REGION_DESCRIPTOR_EX MemoryDescriptorEx = GetPlatformMemoryMap();

  // Run through each memory descriptor
  while (MemoryDescriptorEx->Length != 0) {
    if (AsciiStriCmp(MemoryMapAreaName, MemoryDescriptorEx->Name) == 0) {
      *MemoryDescriptor = *MemoryDescriptorEx;
      return EFI_SUCCESS;
    }
    MemoryDescriptorEx++;
  }

  return EFI_NOT_FOUND;
}

EFI_STATUS EFIAPI LocateMemoryMapAreaByAddress(
    EFI_PHYSICAL_ADDRESS             MemoryMapAreaAddress,
    ARM_MEMORY_REGION_DESCRIPTOR_EX *MemoryDescriptor)
{
  PARM_MEMORY_REGION_DESCRIPTOR_EX MemoryDescriptorEx = GetPlatformMemoryMap();

  // Run through each memory descriptor
  while (MemoryDescriptorEx->Length != 0) {
    if (MemoryDescriptorEx->Address == MemoryMapAreaAddress) {
      *MemoryDescriptor = *MemoryDescriptorEx;
      return EFI_SUCCESS;
    }
    MemoryDescriptorEx++;
  }

  return EFI_NOT_FOUND;
}
