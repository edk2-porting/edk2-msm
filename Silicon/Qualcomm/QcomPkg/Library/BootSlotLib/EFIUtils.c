/*
 * SwitchSlotsApp Module
 * Copyright (C) 2021 Renard Gold <goldrenard@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/
 */

#include <Library/BootSlotLib/EFIUtils.h>
#include <Library/UefiLib.h>

void WaitAnyKey(EFI_SYSTEM_TABLE *mSystemTable)
{
  UINTN         index = 0;
  EFI_INPUT_KEY Key;
  mSystemTable->BootServices->WaitForEvent(
      1, &mSystemTable->ConIn->WaitForKey, &index);
  mSystemTable->ConIn->ReadKeyStroke(mSystemTable->ConIn, &Key);
}

void PrintAndWaitAnyKey(EFI_SYSTEM_TABLE *mSystemTable, CHAR16 *Message)
{
  Print(Message);
  WaitAnyKey(mSystemTable);
}