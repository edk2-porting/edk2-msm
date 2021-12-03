/** @file
 *
 *  Copyright (c) 2013-2017, ARM Limited. All rights reserved.
 *
 *  This program and the accompanying materials
 *  are licensed and made available under the terms and conditions of the BSD
 *License which accompanies this distribution.  The full text of the license may
 *be found at http://opensource.org/licenses/bsd-license.php
 *
 *  THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR
 *IMPLIED.
 *
 **/

#ifndef __ARM_JUNO_H__
#define __ARM_JUNO_H__

//#include <VExpressMotherBoard.h>

/***********************************************************************************
// Platform Memory Map
************************************************************************************/

// Motherboard Peripheral and On-chip peripheral

//
// ACPI table information used to initialize tables.
//
#define EFI_ACPI_ARM_OEM_ID 'A', 'R', 'M', 'L', 'T', 'D' // OEMID 6 bytes long
#define EFI_ACPI_ARM_OEM_TABLE_ID                                              \
  SIGNATURE_64(                                                                \
      'A', 'R', 'M', '-', 'J', 'U', 'N', 'O') // OEM table id 8 bytes long
#define EFI_ACPI_ARM_OEM_REVISION 0x20140727
#define EFI_ACPI_ARM_CREATOR_ID SIGNATURE_32('A', 'R', 'M', ' ')
#define EFI_ACPI_ARM_CREATOR_REVISION 0x00000099

// A macro to initialise the common header part of EFI ACPI tables as defined by
// EFI_ACPI_DESCRIPTION_HEADER structure.
#define ARM_ACPI_HEADER(Signature, Type, Revision)                             \
  {                                                                            \
    Signature,                        /* UINT32  Signature */                  \
        sizeof(Type),                 /* UINT32  Length */                     \
        Revision,                     /* UINT8   Revision */                   \
        0,                            /* UINT8   Checksum */                   \
        {EFI_ACPI_ARM_OEM_ID},        /* UINT8   OemId[6] */                   \
        EFI_ACPI_ARM_OEM_TABLE_ID,    /* UINT64  OemTableId */                 \
        EFI_ACPI_ARM_OEM_REVISION,    /* UINT32  OemRevision */                \
        EFI_ACPI_ARM_CREATOR_ID,      /* UINT32  CreatorId */                  \
        EFI_ACPI_ARM_CREATOR_REVISION /* UINT32  CreatorRevision */            \
  }

//
// Hardware platform identifiers
//
#define JUNO_REVISION_PROTOTYPE 0
#define JUNO_REVISION_R0 1
#define JUNO_REVISION_R1 2
#define JUNO_REVISION_R2 3
#define JUNO_REVISION_UKNOWN 0xFF

// Define if the exported ACPI Tables are based on ACPI 5.0 spec or latest
//#define ARM_JUNO_ACPI_5_0

//
// Address of the system registers that contain the MAC address
// assigned to the PCI Gigabyte Ethernet device.
//

/***********************************************************************************
// Motherboard memory-mapped peripherals
************************************************************************************/

// Define MotherBoard SYS flags offsets (from ARM_VE_BOARD_PERIPH_BASE)
//
// Sites where the peripheral is fitted
//
#endif
