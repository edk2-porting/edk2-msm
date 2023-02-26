#ifndef __EFISMEM_H__
#define __EFISMEM_H__

#include <Uefi.h>

typedef struct _EFI_SMEM_PROTOCOL EFI_SMEM_PROTOCOL;

#define EFI_SMEM_PROTOCOL_REVISION 0x0000000000010001
#define EFI_SMEM_PROTOCOL_GUID { 0xf4e5c7d0, 0xd239, 0x47cb, { 0xaa, 0xcd, 0x7f, 0x66, 0xef, 0x76, 0x32, 0x38 } }

extern EFI_GUID gEfiSMEMProtocolGuid;

typedef EFI_STATUS (EFIAPI *EFI_SMEM_ALLOCATE_ITEM)(int itemIndex, unsigned int size, void **pAddr);
typedef EFI_STATUS (EFIAPI *EFI_SMEM_GET_ITEM_ADDR)(int itemIndex, unsigned int* size, void **pAddr);
typedef EFI_STATUS (EFIAPI *EFI_SMEM_FUNC_2_3)(void* params);

struct _EFI_SMEM_PROTOCOL {
  UINT64 Revision;
  EFI_SMEM_ALLOCATE_ITEM AllocFunc;
  EFI_SMEM_GET_ITEM_ADDR GetFunc;
  EFI_SMEM_FUNC_2_3 Func2;
  EFI_SMEM_FUNC_2_3 Func3;
};

#endif /* EFISMEM_H */