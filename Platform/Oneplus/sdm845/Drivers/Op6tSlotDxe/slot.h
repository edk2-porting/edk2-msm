/*
 * Op6tSlot Module
 * Copyright (C) 2021 longjunyu <ljy122@qq.com>
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

/*
 * Flags of OP6T slots
 */

const unsigned char OP6T_SLOT_FLAG_ACTIVE = 0x6F;

const unsigned char OP6T_SLOT_FLAG_BOOTABLE_1 = 0x07;

const unsigned char OP6T_SLOT_FLAG_BOOTABLE_2 = 0x0F;

const unsigned char OP6T_SLOT_FLAG_BOOTABLE_3 = 0x17;

const unsigned char OP6T_SLOT_FLAG_BOOTABLE_4 = 0x1F;

const unsigned char OP6T_SLOT_FLAG_BOOTABLE_5 = 0x27;

const unsigned char OP6T_SLOT_FLAG_BOOTABLE_6 = 0x2F;

const unsigned OP6T_SLOT_FLAG_BOOTABLE_7 = 0x37;

const unsigned OP6T_SLOT_FLAG_BOOTABLE =
    0x37; /* defaultly set bootable the same as bootable_7 */

const unsigned OP6T_SLOT_FLAG_UNBOOTABLE = 0xBA;

// const unsigned OP6T_SLOT_FLAG_SUCCESSFUL = 0xFF; /* OP6T_SLOT_FLAG_SUCCESSFUL
// maybe uncorrect in this file */

#define OP6T_SLOT_FLAG_SIZE 1

/*
 * Flag's offset on disk
 * The offset may very from device to device
 * Make sure the offset is correct before using it
 */

#define OP6T_SLOT_A_BOOT_FLAG_LBA2_OFFSET 0x536

#define OP6T_SLOT_B_BOOT_FLAG_LBA3_OFFSET 0x336

/*
 * Boot partitions name and their offsets
 * Find the right device by comparaing the partition name on the offset
 */

const unsigned char OP6T_SLOT_A_BOOT_BUFFER[] = {
    0x62, 0x00, 0x6F, 0x00, 0x6F, 0x00,
    0x74, 0x00, 0x5F, 0x00, 0x61}; /* ACSII: b.o.o.t._.a */

const unsigned char OP6T_SLOT_B_BOOT_BUFFER[] = {
    0x62, 0x00, 0x6F, 0x00, 0x6F, 0x00,
    0x74, 0x00, 0x5F, 0x00, 0x62}; /* ACSII: b.o.o.t._.b */

#define OP6T_SLOT_BOOT_BUFFER_LEN 11

#define OP6T_SLOT_A_BOOT_BUFFER_LBA2_OFFSET 0x538

#define OP6T_SLOT_B_BOOT_BUFFER_LBA3_OFFSET 0x338
