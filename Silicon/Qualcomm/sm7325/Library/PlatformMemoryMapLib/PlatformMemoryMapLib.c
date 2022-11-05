#include <Library/BaseLib.h>
#include <Library/PlatformMemoryMapLib.h>

static ARM_MEMORY_REGION_DESCRIPTOR_EX gDeviceMemoryDescriptorEx[] = {
    /* Name               Address     Length      HobOption        ResourceAttribute    ArmAttributes
                                                          ResourceType          MemoryType */

    /* DDR Regions */
    /* DDR Bank 0 Start */
    {"Hypervisor",        0x80000000, 0x00600000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, NS_DEVICE},
    {"Axon DMA",          0x80600000, 0x00100000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, WRITE_BACK_XN},
    {"RAM Partition",     0x80700000, 0x00100000, AddMem, SYS_MEM, SYS_MEM_CAP, RtCode, WRITE_BACK_XN},
    {"AOP",               0x80800000, 0x00060000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},
    {"AOP CMD DB",        0x80860000, 0x00020000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},
    {"HLOS 1",            0x80880000, 0x00014000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},
    {"GPU PRR",           0x80894000, 0x00010000, AddMem, MEM_RES, WRITE_COMBINEABLE, Reserv, UNCACHED_UNBUFFERED_XN},
    {"TPMControl",        0x808A4000, 0x00010000, AddMem, MEM_RES, WRITE_COMBINEABLE, RtData, UNCACHED_UNBUFFERED_XN},
    {"HLOS 2",            0x808B4000, 0x0004B000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},
    {"SecData",           0x808FF000, 0x00001000, AddMem, MEM_RES, SYS_MEM_CAP, Reserv, UNCACHED_UNBUFFERED_XN},
    {"SMEM",              0x80900000, 0x00200000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},
    {"CPUCP FW",          0x80B00000, 0x00100000, AddMem, MEM_RES, SYS_MEM_CAP, Reserv, UNCACHED_UNBUFFERED_XN},
    {"WLAN MSA",          0x80c00000, 0x00c00000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},
    {"CDSP Secure Heap",  0x81800000, 0x01e00000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, UNCACHED_UNBUFFERED_XN},
    {"Sched Heap",        0x83600000, 0x00400000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK_XN},
    {"HLOS 3",            0x83A00000, 0x01E00000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK_XN},
    {"PIL Reserved",      0x85800000, 0x18D00000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},
    {"RAM Partition",     0x9E500000, 0x01A00000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},
    {"SEC Heap",          0x9FF00000, 0x0008C000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK_XN},
    {"CPU Vectors",       0x9FF8C000, 0x00001000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK},
    {"MMU PageTables",    0x9FF8D000, 0x00003000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK_XN},
    {"UEFI Stack",        0x9FF90000, 0x00040000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK_XN},
    {"HLOS 4",            0x9FFD0000, 0x00027000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},
    {"Log Buffer",        0x9FFF7000, 0x00008000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, WRITE_BACK_XN},
    {"Info Blk",          0x9FFFF000, 0x00001000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, WRITE_BACK_XN},
    {"USB UCSI Temp",     0xA0000000, 0x00002000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, UNCACHED_UNBUFFERED_XN},
    {"HLOS 5",            0xA0002000, 0x007FE000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},
    {"MPSS_EFS",          0xA0800000, 0x00300000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, UNCACHED_UNBUFFERED_XN},
    {"HLOS 6",            0xA0B00000, 0x0F500000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},
    {"PStore HLOS",       0xB0000000, 0x00400000, AddMem, MEM_RES, SYS_MEM_CAP, Reserv, WRITE_THROUGH_XN},
    {"DXE Heap",          0xB0400000, 0x09300000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},
    /* DDR Bank 0 End (0xB9700000) */
    /* Carveout Region (0xB9700000 -> 0xB9D00000, size 0x00600000) */
    /* DDR Bank 1 0xB9D00000 -> 0xBBB00000 */
    /* Carveout Region (0xBBB00000 -> 0xC0000000, size 0x04500000) */

    /* DDR Bank 2 Start */ 
    // TZ
    {"Removed Mem",       0xc0000000, 0x01800000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, UNCACHED_UNBUFFERED_XN},
    // qseecom
    {"TZApps",            0xC1800000, 0x03900000, HobOnlyNoCacheSetting, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},
    {"RAM Partition",     0xC5100000, 0x08F00000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},
    {"UEFI FD",           0xCE000000, 0x02000000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK},
    {"RAM Partition",     0xD0000000, 0x00800000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},
    {"Trusted VM",        0xD0800000, 0x076F7000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},
    {"QRTR Haven",        0xD7EF7000, 0x00009000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},
    {"Neuron Haven",      0xD7F00000, 0x00100000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},
    {"RAM Partition",     0xD8000000, 0x08000000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},
    {"DBI Dump",          0xE0000000, 0x00F00000, NoHob,  MMAP_IO, INITIALIZED, Conv,   UNCACHED_UNBUFFERED_XN},
    {"RAM Partition",     0xE0F00000, 0x00100000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},
    {"Display Reserved",  0xE1000000, 0x02400000, AddMem, MEM_RES, SYS_MEM_CAP, Reserv, WRITE_THROUGH_XN},
    {"RAM Partition",     0xE3400000, 0x01C00000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},
    {"ADSP RPC",          0xE5000000, 0x00C00000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},
    // audio_ml
    {"LPASS_ML",          0xE5C00000, 0x01c00000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, UNCACHED_UNBUFFERED_XN},
    {"RAM Partition",     0xE7800000, 0x98800000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},
    {"RAM Partition",    0x180000000,0x100000000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},
    /* DDR Bank 2 End */

    /* Other memory regions */
    {"IMEM Base",         0x14680000, 0x0002B000, NoHob,  MMAP_IO, INITIALIZED, Conv,   NS_DEVICE},
    {"IMEM Cookie Base",  0x146AA000, 0x00001000, AddDev, MMAP_IO, INITIALIZED, Conv,   NS_DEVICE},

    /* Register regions */
    {"IPC_ROUTER_TOP",    0x00400000, 0x00100000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"SECURITY CONTROL",  0x00780000, 0x00010000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"QUP",               0x00900000, 0x00200000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"PRNG_CFG_PRNG",     0x010D0000, 0x00010000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"CRYPTO0 CRYPTO",    0x01DC0000, 0x00040000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"TCSR_TCSR_REGS",    0x01FC0000, 0x00030000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"PERIPH_SS_SDC1",    0x007C0000, 0x00100000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"PERIPH_SS",         0x08800000, 0x00500000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"USB",               0x0A600000, 0x04000000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"AOSS",              0x0B000000, 0x04000000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"TLMM",              0x0F100000, 0x00300000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"SMMU",              0x15000000, 0x00200000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"APSS_HM",           0x17800000, 0x00E00000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"PCIE_0_AXI",        0x60000000, 0x02000000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"PCIE_1_AXI",        0x40000000, 0x02000000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"PCIE_0_AHB",        0x01C00000, 0x00008000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"PCIE_1_AHB",        0x01C08000, 0x00008000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},

    /* Terminator for MMU */
    {"Terminator", 0, 0, 0, 0, 0, 0, 0}};

ARM_MEMORY_REGION_DESCRIPTOR_EX *GetPlatformMemoryMap()
{
  return gDeviceMemoryDescriptorEx;
}