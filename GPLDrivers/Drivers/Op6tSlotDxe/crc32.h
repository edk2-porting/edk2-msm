/*
 * Op6tSlot Module
 * Copyright (C) 2021 longjunyu <ljy122@qq.com>
 * Copyright (C) 2021 Junyue Wang <wjyue2001@qq.com>
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

#include <Protocol/BlockIo.h>
#include <Protocol/DiskIo.h>

#define GPT_HEADER_CRC32_LBA1_OFFSET 0x10

#define GPT_ENTRY_CRC32_LBA1_OFFSET 0x58

#define GPT_CRC32_LEN 4

#define GPT_HEADER_SIZE 92

#define GPT_ENTRY_COUNT 3

int reflect(int, int);

unsigned int calculate_crc32(unsigned char *, int);

void get_result_array(unsigned int, unsigned char *);

EFI_STATUS FixGptCRC32(
    EFI_BLOCK_IO_PROTOCOL *, EFI_DISK_IO_PROTOCOL *, EFI_SYSTEM_TABLE *);
