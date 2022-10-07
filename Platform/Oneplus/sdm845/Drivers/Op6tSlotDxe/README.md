# [Op6TSlot](https://github.com/longjunyu2/Op6TSlot)
Add A/B slot support for OnePlus 6T EFI-EDK2 firmware.

## Introduction
&ensp;&ensp;The OnePlus 6T device uses the A/B slot mode proposed by AOSP. Each time it is started, the bootloader checks if the current slot is available or switches if not.
Therefore, when we use a non-Android system, bootloader will assume that the current slot used is damaged and switch between the slots, since the slot status cannot be updated.
When the same thing happens in another slot, bootloader forces it into fastboot.  
&ensp;&ensp;This UEFI Application module is designed to automatically update the slot state after entering UEFI firmware, without requiring an OS level solution to this problem.  
&ensp;&ensp;[Implementing A/B Updates](https://source.android.com/devices/tech/ota/ab/ab_implement)  
&ensp;&ensp;[About GPT](https://uefi.org/sites/default/files/resources/UEFI_Spec_2_9_2021_03_18.pdf)  
  
## Current Status
- [x] Find the disk with the flag.
- [x] Write Slot flag(Active/Bootable/Unbootable) to the disk
- [x] Read GPT partition entry
- [x] Generating CRC32 code for GPT partition entry
- [x] Write the CRC32 code of GPT partition entry to the specified position
- [x] Read the first 92 bytes of the GPT header
- [x] Generating CRC32 code of GPT header
- [x] Write the CRC32 code of GPT header to the specified position
- [x] Has the problem been solved?

## License
The software is distributed under GPL v3 with additional terms.
