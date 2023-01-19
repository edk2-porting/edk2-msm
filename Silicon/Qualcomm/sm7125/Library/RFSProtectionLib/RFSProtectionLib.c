
#include <Uefi.h>

#include <Library/DebugLib.h>
#include <Library/DevicePathLib.h>
#include <Library/MemoryAllocationLib.h>
#include <Library/MsPlatformDevicesLib.h>
#include <Library/PrintLib.h>
#include <Library/UefiBootServicesTableLib.h>
#include <Library/UefiLib.h>
#include <Library/UefiRuntimeServicesTableLib.h>
#include <Library/MemoryMapHelperLib.h>

#include <Library/BaseMemoryLib.h>
#include <Protocol/EFIScm.h>
#include <Protocol/scm_sip_interface.h>

#include <Library/RFSProtectionLib.h>

#define MAX_DESTINATION_VMS 3

EFI_STATUS
EFIAPI
RFSProtectSharedArea(UINT64 efsBaseAddr, UINT64 efsBaseSize)
{
  EFI_STATUS             Status                       = EFI_SUCCESS;
  hyp_memprot_ipa_info_t ipaInfo;
  QCOM_SCM_PROTOCOL     *pQcomScmProtocol             = NULL;
  UINT32                 dataSize                     = 0;
  UINT32                 sourceVM                     = AC_VM_HLOS;
  UINT64                 results[SCM_MAX_NUM_RESULTS] = {0};
  VOID                  *data                         = NULL;

  // Allow both HLOS (Windows) and MSS (Modem Subsystem) to access the shared memory region
  // This is needed otherwise the Modem Subsystem will CRASH when attempting to read data
  hyp_memprot_dstVM_perm_info_t dstVM_perm_info[MAX_DESTINATION_VMS] = {
    {
      AC_VM_HLOS, 
      (VM_PERM_R | VM_PERM_W), 
      (UINT64)NULL, 
      0
    },
    {
      AC_VM_MSS_MSA, 
      (VM_PERM_R | VM_PERM_W), 
      (UINT64)NULL, 
      0
    },
    {
      AC_VM_MSS_NAV, 
      (VM_PERM_R | VM_PERM_W), 
      (UINT64)NULL, 
      0
    }
  };

  UINT64                 parameterArray[SCM_MAX_NUM_PARAMETERS] = {0};
  hyp_memprot_assign_t  *assign = (hyp_memprot_assign_t *)parameterArray;

  Status = gBS->LocateProtocol(
      &gQcomScmProtocolGuid, 
      NULL, 
      (VOID **)&pQcomScmProtocol
  );

  if (EFI_ERROR(Status)) {
    return Status;
  }

  // Fill in the address details
  ipaInfo.IPAaddr = efsBaseAddr;
  ipaInfo.IPAsize = efsBaseSize;

  dataSize = sizeof(hyp_memprot_ipa_info_t) + 
                  sizeof(sourceVM) +
                  (MAX_DESTINATION_VMS * sizeof(hyp_memprot_dstVM_perm_info_t)) + 
                  4;

  data = AllocateZeroPool(dataSize);
  if (data == NULL) {
    return EFI_OUT_OF_RESOURCES;
  }

  assign->IPAinfolist = (UINT64)data;

  CopyMem(
    (VOID *)assign->IPAinfolist, 
    &ipaInfo, 
    sizeof(hyp_memprot_ipa_info_t)
  );

  assign->IPAinfolistsize = sizeof(hyp_memprot_ipa_info_t);

  assign->sourceVMlist =
      (UINT64)data + 
      sizeof(hyp_memprot_ipa_info_t);

  CopyMem(
    (VOID *)assign->sourceVMlist, 
    &sourceVM, 
    sizeof(sourceVM)
  );

  assign->srcVMlistsize = sizeof(sourceVM);

  assign->destVMlist =
      (UINT64)data + 
      sizeof(hyp_memprot_ipa_info_t) + 
      sizeof(sourceVM) + 
      4;

  CopyMem(
      (VOID *)assign->destVMlist, 
      dstVM_perm_info,
      MAX_DESTINATION_VMS * sizeof(hyp_memprot_dstVM_perm_info_t)
  );

  assign->destVMlistsize = MAX_DESTINATION_VMS * sizeof(hyp_memprot_dstVM_perm_info_t);
  assign->spare          = 0;

  // Send the hypervisor call
  Status = pQcomScmProtocol->ScmSipSysCall(
      pQcomScmProtocol, 
      HYP_MEM_PROTECT_ASSIGN, 
      HYP_MEM_PROTECT_ASSIGN_PARAM_ID,
      parameterArray, 
      results
  );

  return Status;
}

EFI_STATUS
EFIAPI
RFSLocateAndProtectSharedArea()
{
  ARM_MEMORY_REGION_DESCRIPTOR_EX MpssEfs;

  if (!EFI_ERROR(LocateMemoryMapAreaByName("MPSS_EFS", &MpssEfs))) {
      return RFSProtectSharedArea(MpssEfs.Address, MpssEfs.Length);
  }

  return EFI_NOT_FOUND;
}
