/** @file
  ASL dynamic update library definitions.

  This library provides dynamic update to various ASL structures.
  There may be different libraries for different environments (PEI, BS, RT, SMM).
  Make sure you meet the requirements for the library (protocol dependencies, use
  restrictions, etc).

  Note that the current version of the library updates AML.

  Copyright (c) 2020 Intel Corporation. All rights reserved. <BR>

  SPDX-License-Identifier: BSD-2-Clause-Patent
**/

#ifndef _ASL_UPDATE_LIB_H_
#define _ASL_UPDATE_LIB_H_

//
// Include files
//
#include <Uefi/UefiBaseType.h>
#include <IndustryStandard/Acpi.h>
#include <Protocol/AcpiTable.h>
#include <Protocol/AcpiSystemDescriptionTable.h>

/**
  This procedure will update immediate value assigned to a Name.

  @param[in] AslSignature               The signature of Operation Region that we want to update.
  @param[in] Buffer                     source of data to be written over original aml
  @param[in] Length                     length of data to be overwritten

   @retval EFI_SUCCESS                  The function completed successfully.
   @retval EFI_NOT_FOUND                Failed to locate AcpiTable.
   @retval EFI_NOT_READY                Not ready to locate AcpiTable.
   @retval EFI_UNSUPPORTED              The function is not supported in this library.
**/
EFI_STATUS
EFIAPI
UpdateNameAslCode (
  IN     UINT32  AslSignature,
  IN     VOID    *Buffer,
  IN     UINTN   Length
  );

/**
  This procedure will update immediate value assigned to a Name in SSDT table.

  @param[in] TableId           - Pointer to an ASCII string containing the OEM Table ID from the ACPI table header
  @param[in] TableIdSize       - Length of the TableId to match.  Table ID are 8 bytes long, this function
  @param[in] AslSignature      - The signature of Operation Region that we want to update.
  @param[in] Buffer            - source of data to be written over original aml
  @param[in] Length            - length of data to be overwritten

  @retval EFI_SUCCESS          - The function completed successfully.
  @retval EFI_NOT_FOUND        - Failed to locate AcpiTable.
  @retval EFI_NOT_READY        - Not ready to locate AcpiTable.
  @retval EFI_UNSUPPORTED      - The function is not supported in this library.
**/
EFI_STATUS
EFIAPI
UpdateSsdtNameAslCode (
  IN     UINT8   *TableId,
  IN     UINT8   TableIdSize,
  IN     UINT32  AslSignature,
  IN     VOID    *Buffer,
  IN     UINTN   Length
  );

/**
  This procedure will update the name of ASL Method.

  @param[in] AslSignature      - The signature of Operation Region that we want to update.
  @param[in] Buffer            - source of data to be written over original aml
  @param[in] Length            - length of data to be overwritten

  @retval EFI_SUCCESS          - The function completed successfully.
  @retval EFI_NOT_FOUND        - Failed to locate AcpiTable.
  @retval EFI_NOT_READY        - Not ready to locate AcpiTable.
  @retval EFI_UNSUPPORTED      - The function is not supported in this library.
**/
EFI_STATUS
EFIAPI
UpdateMethodAslCode (
  IN     UINT32  AslSignature,
  IN     VOID    *Buffer,
  IN     UINTN   Length
  );

/**
  This function uses the ACPI support protocol to locate an ACPI table.
  It is really only useful for finding tables that only have a single instance,
  e.g. FADT, FACS, MADT, etc.  It is not good for locating SSDT, etc.
  Matches are determined by finding the table with ACPI table that has
  a matching signature.

  @param[in] Signature                  Pointer to an ASCII string containing the Signature to match
  @param[in, out] Table                 Updated with a pointer to the table
  @param[in, out] Handle                AcpiSupport protocol table handle for the table found
                                        @see AcpiSupport protocol for details

  @retval EFI_SUCCESS                   The function completed successfully.
  @retval EFI_NOT_FOUND                 Failed to locate AcpiTable.
  @retval EFI_NOT_READY                 Not ready to locate AcpiTable.
  @retval EFI_UNSUPPORTED               The function is not supported in this library.
**/
EFI_STATUS
EFIAPI
LocateAcpiTableBySignature (
  IN      UINT32                       Signature,
  IN OUT  EFI_ACPI_DESCRIPTION_HEADER  **Table,
  IN OUT  UINTN                        *Handle
  );

#endif
