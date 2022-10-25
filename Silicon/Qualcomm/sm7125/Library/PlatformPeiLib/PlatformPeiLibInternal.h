#ifndef __PLATFORM_HOB_INTERNAL_H
#define __PLATFORM_HOB_INTERNAL_H

#include <Library/ArmLib.h>
#include <Library/BaseMemoryLib.h>
#include <Library/DebugLib.h>
#include <Library/HobLib.h>
#include <Library/IoLib.h>
#include <Library/MemoryAllocationLib.h>
#include <Library/PcdLib.h>
#include <Library/SerialPortLib.h>
#include <Library/MemoryMapHelperLib.h>

// This varies by device
#include <Configuration/DeviceConfigurationMap.h>

typedef EFI_STATUS (*GET_CONFIG_STRING)(
    CHAR8 *Key, CHAR8 *Value, UINTN *ValBuffSize);
typedef EFI_STATUS (*GET_CONFIG_VAL)(CHAR8 *Key, UINT32 *Value);
typedef EFI_STATUS (*GET_CONFIG_VAL64)(CHAR8 *Key, UINT64 *Value);

typedef EFI_STATUS (*GET_MEM_INFO_BY_NAME)(
    CHAR8 *RegionName, ARM_MEMORY_REGION_DESCRIPTOR_EX *MemRegions);

typedef EFI_STATUS (*GET_MEM_INFO_BY_ADDRESS)(
    UINT64 RegionBaseAddress, ARM_MEMORY_REGION_DESCRIPTOR_EX *MemRegions);

typedef struct {
  UINT32 LibVersion;
  GET_MEM_INFO_BY_NAME GetMemInfoByName;
  GET_CONFIG_STRING GetCfgInfoString;
  GET_CONFIG_VAL GetCfgInfoVal;
  GET_CONFIG_VAL64 GetCfgInfoVal64;
  GET_MEM_INFO_BY_ADDRESS GetMemInfoByAddress;
} UefiCfgLibType;

typedef UINTN (*SIO_READ)(OUT UINT8 *Buffer, IN UINTN NumberOfBytes);
typedef UINTN (*SIO_WRITE)(IN UINT8 *Buffer, IN UINTN NumberOfBytes);
typedef BOOLEAN (*SIO_POLL)(VOID);
typedef UINTN (*SIO_DRAIN)(VOID);
typedef UINTN (*SIO_FLUSH)(VOID);
typedef UINTN (*SIO_CONTROL)(IN UINTN Arg, IN UINTN Param);
typedef EFI_STATUS (*SIO_SETATTRIBUTES)(
    IN OUT UINT64 *BaudRate, IN OUT UINT32 *ReceiveFifoDepth,
    IN OUT UINT32 *Timeout, IN OUT EFI_PARITY_TYPE *Parity,
    IN OUT UINT8 *DataBits, IN OUT EFI_STOP_BITS_TYPE *StopBits);

typedef struct {
  UINT32            LibVersion;
  SIO_READ          Read;
  SIO_WRITE         Write;
  SIO_POLL          Poll;
  SIO_DRAIN         Drain;
  SIO_FLUSH         Flush;
  SIO_CONTROL       Control;
  SIO_SETATTRIBUTES SetAttributes;
} SioPortLibType;

typedef EFI_STATUS (*INSTALL_LIB)(
    IN CHAR8 *LibName, IN UINT32 LibVersion, IN VOID *LibIntf);

typedef EFI_STATUS (*LOAD_LIB)(
    IN CHAR8 *LibName, IN UINT32 LibVersion, OUT VOID **LibIntfPtr);

typedef struct {
  UINT32      LoaderVersion;
  INSTALL_LIB InstallLib;
  LOAD_LIB    LoadLib;
} ShLibLoaderType;

#define EFI_SHIM_LIBRARY_GUID                                                  \
  {                                                                            \
    0xbedaeabc, 0x5e70, 0x4d66,                                                \
    {                                                                          \
      0x97, 0x33, 0x21, 0x3d, 0x07, 0x2b, 0x9d, 0x04                           \
    }                                                                          \
  }

#define EFI_INFORMATION_BLOCK_GUID                                                  \
  {                                                                            \
    0x90a49afd, 0x422f, 0x08ae,                                                \
    {                                                                          \
      0x96, 0x11, 0xe7, 0x88, 0xd3, 0x80, 0x48, 0x45                           \
    }                                                                          \
  }

#endif // __PLATFORM_HOB_INTERNAL_H