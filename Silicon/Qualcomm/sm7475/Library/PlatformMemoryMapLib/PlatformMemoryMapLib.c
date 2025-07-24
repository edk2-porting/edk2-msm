#include <Library/BaseLib.h>  
#include <Library/PlatformMemoryMapLib.h>  
  
static ARM_MEMORY_REGION_DESCRIPTOR_EX gDeviceMemoryDescriptorEx[] = {  
    /* Name               Address     Length      HobOption        ResourceAttribute    ArmAttributes  
                                                          ResourceType          MemoryType */  
  
    /* DDR Regions */  
    /* DDR Bank 0 Start */  
    {"Hypervisor",        0x80000000, 0x00640000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, NS_DEVICE},  
    {"RAM Partition",     0x80640000, 0x001C0000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},  
    {"AOP",               0x80800000, 0x000F4000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},  
    {"RAM Partition",     0x808F4000, 0x0000C000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},  
    {"SMEM",              0x80900000, 0x002FF000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},  
    {"HLOS 1",            0x80C00000, 0x04600000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},  
    {"PIL Reserved",      0x85200000, 0x00500000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},  
    {"RAM Partition",     0x85700000, 0x00700000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},  
    {"Reserved",          0x85E00000, 0x02200000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},  
    {"HLOS 2",            0x88000000, 0x0391C000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},  
    {"RAM Partition",     0x8B91C000, 0x000E4000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},  
    {"Reserved",          0x8BA00000, 0x17400000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},  
    {"HLOS 3",            0xA2E00000, 0x03D80000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},  
    {"Reserved",          0xA6B80000, 0x002C0000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},  
    {"RAM Partition",     0xA6E40000, 0x000C0000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},  
    {"Reserved",          0xA6F00000, 0x00100000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},  
    {"HLOS 4",            0xA7000000, 0x38000000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},  
    
    /* UEFI Specific regions within HLOS 4 area */
    {"UEFI FD",           0x9F000000, 0x00500000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK},  
    {"SEC Heap",          0x9F500000, 0x0008C000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK_XN},  
    {"CPU Vectors",       0x9F58C000, 0x00001000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK},  
    {"MMU PageTables",    0x9F58D000, 0x00003000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK_XN},  
    {"UEFI Stack",        0x9F590000, 0x00040000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK_XN},  
    {"RAM Partition",     0x9F5D0000, 0x00027000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},  
    {"Log Buffer",        0x9F5F7000, 0x00008000, AddMem, SYS_MEM, SYS_MEM_CAP, RtData, WRITE_BACK_XN},  
    {"Info Blk",          0x9F5FF000, 0x00001000, AddMem, SYS_MEM, SYS_MEM_CAP, RtData, WRITE_BACK_XN},  
    {"Sched Resv Bckup",  0x9F600000, 0x00500000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK_XN},  
    {"Sched Heap",        0x9FB00000, 0x00400000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK_XN},  
    {"FV Region",         0x9FF00000, 0x00100000, AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK_XN},  
      
    // Fixed DXE Heap size 
    {"DXE Heap",          0xA0000000, 0x02E00000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},
    
    {"Reserved",          0xE0000000, 0x00B00000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},  
    {"HLOS 5",            0xE0B00000, 0x04AF3000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},  
    {"Reserved",          0xE55F3000, 0x0310D000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},  
    {"HLOS 6",            0xE8700000, 0x01900000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},  
    {"Reserved",          0xEA000000, 0x0A600000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},  
    {"HLOS 7",            0xF4600000, 0x0BA00000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},  
    
    /* High memory regions */  
    {"HLOS 8",            0x800000000,0x037500000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},  
    {"Reserved",          0x837500000,0x000600000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},  
    {"HLOS 9",            0x837B00000,0x001E90000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},  
    {"HLOS 10",           0x840000000,0x267FFFFFF, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},  
  
    /* IMEM regions */  
    {"IMEM Base",         0x14680000, 0x00040000, NoHob,  MMAP_IO, INITIALIZED, Conv,   NS_DEVICE},  
    {"IMEM Cookie Base",  0x146BF000, 0x00001000, AddDev, MMAP_IO, INITIALIZED, Conv,   NS_DEVICE},  
    
    /* Fixed Register regions based on actual iomem */  
    // Global Clock Controller
    {"GCC",               0x00100000, 0x001F5000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"SECURITY CONTROL",  0x00780000, 0x00007000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
      
    // I2C Controllers
    {"I2C_0",             0x00880000, 0x00004000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"I2C_1",             0x00994000, 0x00004000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"I2C_2",             0x00A84000, 0x00004000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
      
    // QUP/GENI SE regions  
    {"QUPV3_2_GSI",       0x008C0000, 0x00002000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"QUPV3_0_GSI",       0x009C0000, 0x00002000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"QUPV3_1_GSI",       0x00AC0000, 0x00002000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
      
    // Interconnect/NoC regions  
    {"CNOCS_CFG",         0x01500000, 0x0001C000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"INTERCONNECT_1",    0x01680000, 0x0001F000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"INTERCONNECT_2",    0x016C0000, 0x0000F000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"INTERCONNECT_3",    0x016E0000, 0x0001D000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"INTERCONNECT_4",    0x01700000, 0x00032000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"INTERCONNECT_5",    0x01740000, 0x00020000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
      
    // UFS Controller regions
    {"UFS_PHY",           0x01D80000, 0x00002000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"UFS_HC",            0x01D84000, 0x00003000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"UFS_ICE",           0x01D88000, 0x00008000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"UFS_ICE_HWKM",      0x01D90000, 0x00009000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
      
    // BAM DMA and SLIMBUS
    {"BAM_DMA",           0x03304000, 0x00020000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"SLIM_CTRL",         0x03340000, 0x0002C000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
      
    // GPU related regions
    {"INTERCONNECT_6",    0x03C40000, 0x00018000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"GPU_CLK_CTL",       0x03D90000, 0x0000A000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"GPU_SMMU",          0x03DA0000, 0x00040000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"GPU_TBU_0",         0x03DE9000, 0x00001000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"GPU_TBU_1",         0x03DED000, 0x00001000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    
    // SD/eMMC Controller
    {"SDHCI",             0x08804000, 0x00001000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    
    // USB related regions
    {"USB_EUD",           0x088E0000, 0x00002000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"USB_HSPHY_EN",      0x088E2000, 0x00000004, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"USB_HSPHY",         0x088E3000, 0x00000154, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"USB3_DWC3",         0x0A60C100, 0x0000183C, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},
    
    // Camera Clock Controller
    {"CAM_CLK_CTL",       0x0AAF0000, 0x00010000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    
    // Display Clock Controller  
    {"DISP_CLK_CTL",      0x0ADE0000, 0x00020000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    
    // Video Clock Controller
    {"VIDEO_CLK_CTL",     0x0AF00000, 0x00020000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    
    // Resource State Coordinator
    {"RSC_DRV",           0x0AF20000, 0x00010000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    
    // Thermal sensors
    {"TSENS_0",           0x0C222000, 0x000001FF, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"TSENS_1",           0x0C223000, 0x000001FF, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"TSENS_2",           0x0C263000, 0x000001FF, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"TSENS_3",           0x0C265000, 0x000001FF, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"TSENS_DETECT",      0x0C276000, 0x00000004, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    
    // Power Domain Controller
    {"PDC",               0x0C300000, 0x00000400, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    
    // SPMI Controllers
    {"SPMI_0_CNFG",       0x0C42D000, 0x00004000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"SPMI_1_CNFG",       0x0C432000, 0x00004000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"SPMI_0_INTR",       0x0C4C0000, 0x00010000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"SPMI_1_INTR",       0x0C4D0000, 0x00010000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    
    // Inter-Processor Communication Controller
    {"IPCC",              0x0ED18000, 0x00001000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    
    // Top Level Mode Multiplexer (GPIO/Pin Control)
    {"TLMM",              0x0F000000, 0x01000000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    
    // Coresight Debugging Infrastructure  
    {"STM",               0x10002000, 0x00001000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"TPDA_CENTER",       0x10004000, 0x00001000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"FUNNEL_CENTER",     0x10041000, 0x00001000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"ETF_CENTER",        0x10048000, 0x00001000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"REPLICATOR",        0x10046000, 0x00001000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    
    // System MMU
    {"APPS_SMMU",         0x15000000, 0x00100000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"APPS_SMMU_TCU",     0x151CE000, 0x00000020, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    
    // CPU performance monitor
    {"ARCH_TIMER",        0x17421000, 0x00001000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    
    // CPUSS RSC
    {"CPUSS_RSC",         0x17A20000, 0x00010000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    
    // CPU Frequency domains  
    {"CPUFREQ_HW_SRAM",   0x17D09400, 0x00000400, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"CPUFREQ_HW_0",      0x17D91000, 0x00001000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"CPUFREQ_HW_1",      0x17D92000, 0x00001000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"CPUFREQ_HW_2",      0x17D93000, 0x00001000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    
    // Last Level Cache Controller
    {"LLCC_PMU",          0x19095000, 0x00000300, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"LLCC_INTERCONNECT", 0x19100000, 0x000BB800, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"LLCC_BASE",         0x19200000, 0x00580000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"LLCC_BROADCAST",    0x19A00000, 0x00080000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    
    // QFPROM (Security fuses)
    {"QFPROM",            0x221C8000, 0x00001000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    
    // More interconnects
    {"INTERCONNECT_7",    0x320C0000, 0x00010000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    
    // PCIe (WiFi) 
    {"PCIE_MEM",          0x60200000, 0x03E00000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
    {"PCIE_CFG",          0x60600000, 0x00001000, AddDev, MMAP_IO, UNCACHEABLE, MmIO,   NS_DEVICE},  
      
    /* Terminator */  
    {"Terminator", 0, 0, 0, 0, 0, 0, 0}
};
  
ARM_MEMORY_REGION_DESCRIPTOR_EX *GetPlatformMemoryMap()  
{  
  return gDeviceMemoryDescriptorEx;  
}