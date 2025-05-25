#include <Library/BaseLib.h>
#include <Library/PlatformMemoryMapLib.h>

static ARM_MEMORY_REGION_DESCRIPTOR_EX gDeviceMemoryDescriptorEx[] = {
    /* Name               Address     Length      HobOption        ResourceAttribute    ArmAttributes
                                                          ResourceType          MemoryType */
	{"Peripherals",       0x00000000, 0x20000000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"Display Reserved",  0xFAC00000, 0x01124000, AddMem, MEM_RES, SYS_MEM_CAP, Reserv, WRITE_THROUGH_XN},
    // Note: Runtime memory has to be on an alignment of 0x10000
    {"PStore",            0xfd3ff000, 0x00100000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, WRITE_THROUGH_XN},
    {"NotPStore",         0xFD4FF000, 0x00100000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, WRITE_THROUGH_XN},
    {"UEFI FD",           0x880000000, 0x02000000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK}, // original 0xfa800000, potentialy a bad location
    {"CPU Vectors",       0xfd902000, 0x00001000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK},
    {"UEFI Stack",        0xfa800000, 0x00040000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK}, // original 0x90600000
    {"DXE Heap",          0x882000000, 0x2E000000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN}, // original 0x97400000
    {"RAM Partition",     0x8AF000000, 0x0FDFA0000, Mem4G,  SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK},
    //{"RAM Partition",     0x80000000, 0x0FDFA0000, Mem4G,  SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK},
    {"APSS_GIC500_GICD",  0x10400000, 0x00010000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"APSS_GIC500_GICR",  0x10440000, 0x00100000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},

    /* Terminator for MMU */
    {"Terminator", 0, 0, 0, 0, 0, 0, 0}};

ARM_MEMORY_REGION_DESCRIPTOR_EX *GetPlatformMemoryMap()
{
  return gDeviceMemoryDescriptorEx;
}
