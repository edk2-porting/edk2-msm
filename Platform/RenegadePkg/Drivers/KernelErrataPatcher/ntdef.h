/** @file

  Patches NTOSKRNL to not cause a SError when reading/writing ACTLR_EL1
  Patches NTOSKRNL to not cause a bugcheck when attempting to use
  PSCI_MEMPROTECT Due to an issue in QHEE

  Based on https://github.com/SamuelTulach/rainbow

  Copyright (c) 2021 Samuel Tulach
  Copyright (c) 2022 DuoWoA authors

  SPDX-License-Identifier: MIT

**/
#ifndef _NTDEF_H_
#define _NTDEF_H_

/*
 * All sorts of defines related to Windows kernel
 * https://www.vergiliusproject.com/
 * Windows SDK/DDK
 */

typedef struct _UNICODE_STRING
{
    UINT16 Length;
    UINT16 MaximumLength;
    CHAR16* Buffer;
} UNICODE_STRING, * PUNICODE_STRING;

typedef struct _KLDR_DATA_TABLE_ENTRY
{
    struct _LIST_ENTRY InLoadOrderLinks;
    VOID* ExceptionTable;
    UINT32 ExceptionTableSize;
    VOID* GpValue;
    struct _NON_PAGED_DEBUG_INFO* NonPagedDebugInfo;
    VOID* DllBase;
    VOID* EntryPoint;
    UINT32 SizeOfImage;
    struct _UNICODE_STRING FullDllName;
    struct _UNICODE_STRING BaseDllName;
    UINT32 Flags;
    UINT16 LoadCount;
    union
    {
        UINT16 SignatureLevel : 4;
        UINT16 SignatureType : 3;
        UINT16 Unused : 9;
        UINT16 EntireField;
    } u1;
    VOID* SectionPointer;
    UINT32 CheckSum;
    UINT32 CoverageSectionSize;
    VOID* CoverageSection;
    VOID* LoadedImports;
    VOID* Spare;
    UINT32 SizeOfImageNotRounded;
    UINT32 TimeDateStamp;
} KLDR_DATA_TABLE_ENTRY, * PKLDR_DATA_TABLE_ENTRY;

typedef struct _LOADER_PARAMETER_BLOCK
{
    UINT32 OsMajorVersion;
    UINT32 OsMinorVersion;
    UINT32 Size;
    UINT32 OsLoaderSecurityVersion;
    struct _LIST_ENTRY LoadOrderListHead;
    struct _LIST_ENTRY MemoryDescriptorListHead;
    struct _LIST_ENTRY BootDriverListHead;
    struct _LIST_ENTRY EarlyLaunchListHead;
    struct _LIST_ENTRY CoreDriverListHead;
    struct _LIST_ENTRY CoreExtensionsDriverListHead;
    struct _LIST_ENTRY TpmCoreDriverListHead;
} LOADER_PARAMETER_BLOCK, * PLOADER_PARAMETER_BLOCK;

#define CONTAINING_RECORD(address, type, field) ((type *)( \
                                                  (char*)(address) - \
                                                  (UINT64)(&((type *)0)->field)))

enum WinloadContext
{
    ApplicationContext,
    FirmwareContext
};

#endif /* _NTDEF_H_ */