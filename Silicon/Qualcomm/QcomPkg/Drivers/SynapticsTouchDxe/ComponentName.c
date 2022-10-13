#include <Uefi.h>

#include <Library/MemoryAllocationLib.h>
#include <Library/PcdLib.h>
#include <Library/UefiBootServicesTableLib.h>
#include <Library/UefiLib.h>
#include <Library/DebugLib.h>

#include <Protocol/AbsolutePointer.h>
#include <Protocol/EFITlmm.h>
#include <Protocol/EFII2C.h>

#include "SynapticsRmi4.h"

//
// EFI Component Name Protocol
//
GLOBAL_REMOVE_IF_UNREFERENCED EFI_COMPONENT_NAME_PROTOCOL
    gRmi4DriverComponentName = {Rmi4DriverComponentNameGetDriverName,
                                Rmi4DriverComponentNameGetControllerName,
                                "eng"};

//
// EFI Component Name 2 Protocol
//
GLOBAL_REMOVE_IF_UNREFERENCED EFI_COMPONENT_NAME2_PROTOCOL
    gRmi4DriverComponentName2 = {(EFI_COMPONENT_NAME2_GET_DRIVER_NAME)
                                     Rmi4DriverComponentNameGetDriverName,
                                 (EFI_COMPONENT_NAME2_GET_CONTROLLER_NAME)
                                     Rmi4DriverComponentNameGetControllerName,
                                 "en"};

GLOBAL_REMOVE_IF_UNREFERENCED EFI_UNICODE_STRING_TABLE mRmi4DriverNameTable[] =
    {{"eng;en", L"Synaptics RMI4 Absolute Pointer Driver"}, {NULL, NULL}};

EFI_STATUS
EFIAPI
Rmi4DriverComponentNameGetDriverName(
    IN EFI_COMPONENT_NAME_PROTOCOL *This, IN CHAR8 *Language,
    OUT CHAR16 **DriverName)
{
  return LookupUnicodeString2(
      Language, This->SupportedLanguages, mRmi4DriverNameTable, DriverName,
      (BOOLEAN)(This == &gRmi4DriverComponentName));
}

EFI_STATUS
EFIAPI
Rmi4DriverComponentNameGetControllerName(
    IN EFI_COMPONENT_NAME_PROTOCOL *This, IN EFI_HANDLE ControllerHandle,
    IN EFI_HANDLE ChildHandle OPTIONAL, IN CHAR8 *Language,
    OUT CHAR16 **ControllerName)
{
  EFI_STATUS                     Status;
  RMI4_INTERNAL_DATA *           Instance;
  EFI_ABSOLUTE_POINTER_PROTOCOL *AbsolutePointerProtocol;

  //
  // This is a device driver, so ChildHandle must be NULL.
  //
  if (ChildHandle != NULL) {
    return EFI_UNSUPPORTED;
  }

  //
  // Get the device context
  //
  Status = gBS->OpenProtocol(
      ControllerHandle, &gEfiAbsolutePointerProtocolGuid,
      (VOID **)&AbsolutePointerProtocol, gRmi4DriverBinding.DriverBindingHandle,
      ControllerHandle, EFI_OPEN_PROTOCOL_GET_PROTOCOL);

  if (EFI_ERROR(Status)) {
    return Status;
  }

  Instance = RMI4_TCH_INSTANCE_FROM_ABSTCH_THIS(AbsolutePointerProtocol);

  return LookupUnicodeString2(
      Language, This->SupportedLanguages, Instance->ControllerNameTable,
      ControllerName, (BOOLEAN)(This == &gRmi4DriverComponentName));
}
