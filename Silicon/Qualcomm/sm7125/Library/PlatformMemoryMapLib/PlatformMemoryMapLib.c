#include <Library/BaseLib.h>
#include <Library/PlatformMemoryMapLib.h>

static ARM_MEMORY_REGION_DESCRIPTOR_EX gDeviceMemoryDescriptorEx[] = {
    /* Name               Address     Length      HobOption        ResourceAttribute    ArmAttributes
                                                          ResourceType          MemoryType */
   /* DDR Regions */
    {"HYP",               0x80000000, 0x00600000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN}, /* Added */
    {"MPSS_EFS",          0x80600000, 0x00200000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, UNCACHED_UNBUFFERED_XN},
    {"AOP Image",         0x80800000, 0x00020000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN}, /* Added */
    {"AOP CMD DB",        0x80820000, 0x00020000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},
    {"GPU PRR",           0x80840000, 0x00010000, AddMem, MEM_RES, WRITE_COMBINEABLE, Reserv, UNCACHED_UNBUFFERED_XN},
    {"RAM Partition",     0x80850000, 0x000AF000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, WRITE_BACK_XN},
    {"TZApps",            0x808ff000, 0x00001000, NoHob,  SYS_MEM, SYS_MEM_CAP, Reserv, NS_DEVICE},
    {"SMEM",              0x80900000, 0x00200000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED},
    {"QSEE",              0x80B00000, 0x03900000, NoHob,  SYS_MEM, SYS_MEM_CAP, Reserv, NS_DEVICE},
    {"HLOS Entry1",       0x84400000, 0x01700000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv,   UNCACHED_UNBUFFERED_XN},
    {"PIL Reserved",      0x85B00000, 0x0EB00000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},
    {"DXE Heap",          0x94600000, 0x04500000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv,   WRITE_BACK_XN},
    {"DBI Dump",          0x98B00000, 0x00D70000, NoHob,  MMAP_IO, INITIALIZED, Conv, UNCACHED_UNBUFFERED_XN},
    {"HLOS Entry2",       0x99870000, 0x01F90000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv,   WRITE_BACK_XN},
    {"Sched Heap",        0x9B800000, 0x00400000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK_XN},
    {"RAM Partition",     0x9BC00000, 0x00400000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv,  WRITE_BACK_XN},
    {"Display Reserved",  0x9C000000, 0x01800000, AddMem, MEM_RES, SYS_MEM_CAP, Reserv, WRITE_THROUGH_XN},
    {"RAM Partition",     0x9D800000, 0x00400000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, WRITE_BACK_XN},
    {"ADSP RPC",          0x9DC00000, 0x00800000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},
    {"TGCM",              0x9E400000, 0x01400000, AddMem, MEM_RES, WRITE_COMBINEABLE, Reserv, UNCACHED_UNBUFFERED_XN},
    {"FV Region",         0x9F800000, 0x00200000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK_XN},
    {"RAM Partition",     0x9FA00000, 0x00200000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv,   WRITE_BACK_XN},
    {"UEFI FD",           0x9FC00000, 0x00300000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK},
    {"SEC Heap",          0x9FF00000, 0x0008C000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK_XN},
    {"CPU Vectors",       0x9FF8C000, 0x00001000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK},
    {"MMU PageTables",    0x9FF8D000, 0x00003000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK_XN},
    {"USB UCSI Temp",     0x9FF90000, 0x00002000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, UNCACHED_UNBUFFERED_XN},
    {"RAM Partition",     0x9FF92000, 0x0001E000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, WRITE_BACK_XN},
    {"UEFI Stack",        0x9FFB0000, 0x00020000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK_XN},
    {"RSRV1",             0x9FFD0000, 0x0000A000, AddMem, SYS_MEM, SYS_MEM_CAP, RtData, WRITE_BACK_XN},
    {"TPMControl",        0x9FFDA000, 0x00003000, AddMem, MEM_RES, WRITE_COMBINEABLE, RtData, UNCACHED_UNBUFFERED_XN},
    {"Reset Data",        0x9FFDD000, 0x00004000, AddMem, SYS_MEM, SYS_MEM_CAP, RtData, UNCACHED_UNBUFFERED_XN},
    {"RSRV3",             0x9FFE1000, 0x00001000, AddMem, SYS_MEM, SYS_MEM_CAP, RtData, WRITE_BACK_XN},
    {"Capsule Header",    0x9FFE2000, 0x00001000, AddMem, SYS_MEM, SYS_MEM_CAP, RtData, UNCACHED_UNBUFFERED_XN},
    {"RSRV2",             0x9FFE3000, 0x00014000, AddMem, SYS_MEM, SYS_MEM_CAP, RtData, WRITE_BACK_XN},
    {"Log Buffer",        0x9FFF7000, 0x00008000, AddMem, SYS_MEM, SYS_MEM_CAP, RtData, WRITE_BACK_XN},
    {"Info Blk",          0x9FFFF000, 0x00001000, AddMem, SYS_MEM, SYS_MEM_CAP, RtData, WRITE_BACK_XN},


    /**************************************************
    *                                                 *
    *  RamPartitionDXE will add MLVM regions Later.   *
    *    0xA0000000 to MEMORY_HOLE_START_ADDR         *
    *                                                 *
    **************************************************/
//    {"Hypervisor",        0x85700000, 0x00600000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, NS_DEVICE}, /* Added */
//    {"TZ",                0x86200000, 0x01800000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, NS_DEVICE}, /* Added */
//    {"RAM Partition",     0x89B00000, 0x01C00000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},
//    {"RAM Partition",     0x9FF92000, 0x0001E000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},

//    {"Secure DSP",        0xA0000000, 0x01200000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv, WRITE_BACK_XN},
//    {"Kernel",            0xA1200000, 0x08000000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv, WRITE_BACK_XN},
//    {"MLVM_APSS",         0xA9200000, 0x03A00000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv, WRITE_BACK_XN},
//    {"MLVM_1",            0xACC00000, 0x0FC00000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv, WRITE_BACK_XN},

    //6GB
    // Memory hole: 0xBC800000 - 0xBFFFFFFF BC800000
    // Size: 0x33FFFFF

    /* RAM partition regions */
    {"RAM Partition",     0x0C0000000, 0x40000000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv, WRITE_BACK_XN},
    {"RAM Partition",     0x100000000, 0x80000000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv, WRITE_BACK_XN},

    /* Only need to map 4GB */

//    {"RAM Partition",     0x180000000, 0x80000000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv, WRITE_BACK_XN},

    /* Other memory regions */
    {"AOP_SS_MSG_RAM",    0x0C300000, 0x00100000,  NoHob,  MMAP_IO, INITIALIZED, Conv,   NS_DEVICE},
    {"IMEM Base",         0x14680000, 0x0002B000,  NoHob,  MMAP_IO, INITIALIZED, Conv,   NS_DEVICE},
    {"IMEM Cookie Base",  0x146AA000, 0x00001000,  AddDev, MMAP_IO, INITIALIZED, Conv,   NS_DEVICE},

    /* Register regions */
    {"GCC CLK CTL",       0x00100000, 0x00200000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"SECURITY CONTROL",  0x00780000, 0x00007000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"PRNG_CFG_PRNG",     0x00790000, 0x00010000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"SDC1_REG",          0x007C0000, 0x00020000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"QUPV3_0_GSI",       0x00800000, 0x00100000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"QUPV3_1_GSI",       0x00A00000, 0x00100000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"UFS UFS REGS",      0x01D80000, 0x00020000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"CRYPTO0 CRYPTO",    0x01DC0000, 0x00040000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"TCSR_TCSR_REGS",    0x01FC0000, 0x00040000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"TLMM_WEST",         0x03500000, 0x00300000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"TLMM_NORTH",        0x03900000, 0x00300000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"TLMM_SOUTH",        0x03D00000, 0x00300000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"GPU_CC",            0x05090000, 0x00009000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"GPU_CPR",           0x0509A000, 0x00004000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"RPMH_CPRF",         0x0C200000, 0x00010000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"QUPV3_SSC_GSI",     0x62B00000, 0x00060000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"PERIPH_SS",         0x08800000, 0x00200000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"MCCC_MCCC_MSTR",    0x090B0000, 0x00001000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"USB30_PRIM",        0x0A600000, 0x0011B000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"USB_RUMI",          0x0A720000, 0x00010000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"PDC_DISPLAY",       0x0B2A0000, 0x00010000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"PDC_DISP_SEQ",      0x0B4A0000, 0x00010000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"RPMH_BCM_BCM_TOP",  0x0BA00000, 0x00200000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"SLP_CNTR_TSENS",    0x0C221000, 0x00003000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"TSENS0_TM_PSHOLD",  0x0C263000, 0x00003000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"PMIC ARB SPMI",     0x0C400000, 0x02800000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"VIDEO_CC",          0x0AB00000, 0x00020000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"NPU_CC",            0x09980000, 0x00010000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"TITAN_CAM_CC",      0x0AD00000, 0x00020000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"DISP_CC",           0x0AF00000, 0x00020000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"SILVER_CLK_CTL",    0x18280000, 0x00001000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"GOLD_CLK_CTL",      0x18282000, 0x00001000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"L3_CLK_CTL",        0x18284000, 0x00001000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"APSS_RSC_RSCCR",    0x18200000, 0x00030000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"APSS_GIC500_GICD",  0x17A00000, 0x00010000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"APSS_GIC500_GICR",  0x17A60000, 0x00100000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"QTIMER",            0x17C20000, 0x00110000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"APSS_ACTPM_WRAP",   0x18300000, 0x000B0000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"MDSS",              0x0AE00000, 0x00134000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    {"SMMU",              0x15000000, 0x000D0000,  AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},

    /* Terminator for MMU */
    {"Terminator", 0, 0, 0, 0, 0, 0, 0}};

ARM_MEMORY_REGION_DESCRIPTOR_EX *GetPlatformMemoryMap()
{
  return gDeviceMemoryDescriptorEx;
}
