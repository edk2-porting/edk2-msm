
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

#ifndef __BSL_EFIUTILS_H__
#define __BSL_EFIUTILS_H__

#include <Uefi.h>

void WaitAnyKey(EFI_SYSTEM_TABLE *mSystemTable);

void PrintAndWaitAnyKey(EFI_SYSTEM_TABLE *mSystemTable, CHAR16 *Message);

#endif