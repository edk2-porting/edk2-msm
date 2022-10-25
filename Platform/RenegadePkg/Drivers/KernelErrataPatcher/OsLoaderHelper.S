/** @file

  Patches NTOSKRNL to not cause a SError when reading/writing ACTLR_EL1
  Patches NTOSKRNL to not cause a bugcheck when attempting to use
  PSCI_MEMPROTECT Due to an issue in QHEE

  Copyright (c) 2022 DuoWoA authors

  SPDX-License-Identifier: MIT

**/
#include "KernelErrataPatcher.h"

GCC_ASM_IMPORT (KernelErrataPatcherExitBootServices)
GCC_ASM_EXPORT (ExitBootServicesWrapper)

// Wrapper around Exit boot service for hooking into winload.efi

//EFI_STATUS
//EFIAPI
//ExitBootServicesWrapper (
//  IN EFI_HANDLE ImageHandle, IN UINTN MapKey
//  );
ExitBootServicesWrapper:
        // winload's OslFwpKernelSetupPhase1 seems to
        // always save the OsLoaderBlock parameter into
        // the x19 register right after stack frame setup
        mov x2, x19

        // some older implementations may also use x20
        mov x3, x20

        // the x30 register contains the last return addr
        mov x4, x30

        // Go for it
        b KernelErrataPatcherExitBootServices