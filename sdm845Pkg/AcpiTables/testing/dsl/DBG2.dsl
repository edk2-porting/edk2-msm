/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (32-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembly of ./nta/1.raw, Sat Jan 30 19:38:07 2021
 *
 * ACPI Data Table [DBG2]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "DBG2"    [Debug Port table type 2]
[004h 0004   4]                 Table Length : 00000204
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 84
[00Ah 0010   6]                       Oem ID : "QCOM  "
[010h 0016   8]                 Oem Table ID : "QCOMEDK2"
[018h 0024   4]                 Oem Revision : 00000850
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20200528

[024h 0036   4]                  Info Offset : 0000002C
[028h 0040   4]                   Info Count : 00000003

[02Ch 0044   1]                     Revision : 01
[02Dh 0045   2]                       Length : 0030
[02Fh 0047   1]               Register Count : 01
[030h 0048   2]              Namepath Length : 000A
[032h 0050   2]              Namepath Offset : 0026
[034h 0052   2]              OEM Data Length : 0000 [Optional field not present]
[036h 0054   2]              OEM Data Offset : 0000 [Optional field not present]
[038h 0056   2]                    Port Type : 8000
[03Ah 0058   2]                 Port Subtype : 0011
[03Ch 0060   2]                     Reserved : 0000
[03Eh 0062   2]          Base Address Offset : 0016
[040h 0064   2]          Address Size Offset : 0022

[042h 0066  12]        Base Address Register : [Generic Address Structure]
[042h 0066   1]                     Space ID : 00 [SystemMemory]
[043h 0067   1]                    Bit Width : 20
[044h 0068   1]                   Bit Offset : 00
[045h 0069   1]         Encoded Access Width : 20 [Unknown Width Encoding]
[046h 0070   8]                      Address : 0000000000A84000

[04Eh 0078   4]                 Address Size : 00001000

[052h 0082  10]                     Namepath : "\_SB.UARD"

[05Ch 0092   1]                     Revision : 01
[05Dh 0093   2]                       Length : 00D4
[05Fh 0095   1]               Register Count : 02
[060h 0096   2]              Namepath Length : 000A
[062h 0098   2]              Namepath Offset : 0036
[064h 0100   2]              OEM Data Length : 0094
[066h 0102   2]              OEM Data Offset : 0040
[068h 0104   2]                    Port Type : 8003
[06Ah 0106   2]                 Port Subtype : 5143
[06Ch 0108   2]                     Reserved : 0000
[06Eh 0110   2]          Base Address Offset : 0016
[070h 0112   2]          Address Size Offset : 002E

[072h 0114  12]        Base Address Register : [Generic Address Structure]
[072h 0114   1]                     Space ID : 00 [SystemMemory]
[073h 0115   1]                    Bit Width : 20
[074h 0116   1]                   Bit Offset : 00
[075h 0117   1]         Encoded Access Width : 20 [Unknown Width Encoding]
[076h 0118   8]                      Address : 000000000A600000


[07Eh 0126  12]        Base Address Register : [Generic Address Structure]
[07Eh 0126   1]                     Space ID : 00 [SystemMemory]
[07Fh 0127   1]                    Bit Width : 20
[080h 0128   1]                   Bit Offset : 00
[081h 0129   1]         Encoded Access Width : 20 [Unknown Width Encoding]
[082h 0130   8]                      Address : 000000000A600000

[08Ah 0138   4]                 Address Size : 000FFFFF
[08Eh 0142   4]                 Address Size : 00001000

[092h 0146  10]                     Namepath : "\_SB.URS0"
[09Ch 0156 148]                     OEM Data : \
    05 00 00 00 32 58 49 46 02 00 00 00 00 02 00 00 \
    00 C7 00 00 F8 FF FF FF 00 00 00 00 00 02 00 00 \
    10 88 0F 00 00 00 00 00 00 00 10 10 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    43 42 53 55 

[130h 0304   1]                     Revision : 01
[131h 0305   2]                       Length : 00D4
[133h 0307   1]               Register Count : 02
[134h 0308   2]              Namepath Length : 000A
[136h 0310   2]              Namepath Offset : 0036
[138h 0312   2]              OEM Data Length : 0094
[13Ah 0314   2]              OEM Data Offset : 0040
[13Ch 0316   2]                    Port Type : 8003
[13Eh 0318   2]                 Port Subtype : 5143
[140h 0320   2]                     Reserved : 0000
[142h 0322   2]          Base Address Offset : 0016
[144h 0324   2]          Address Size Offset : 002E

[146h 0326  12]        Base Address Register : [Generic Address Structure]
[146h 0326   1]                     Space ID : 00 [SystemMemory]
[147h 0327   1]                    Bit Width : 20
[148h 0328   1]                   Bit Offset : 00
[149h 0329   1]         Encoded Access Width : 20 [Unknown Width Encoding]
[14Ah 0330   8]                      Address : 000000000A800000


[152h 0338  12]        Base Address Register : [Generic Address Structure]
[152h 0338   1]                     Space ID : 00 [SystemMemory]
[153h 0339   1]                    Bit Width : 20
[154h 0340   1]                   Bit Offset : 00
[155h 0341   1]         Encoded Access Width : 20 [Unknown Width Encoding]
[156h 0342   8]                      Address : 000000000A800000

[15Eh 0350   4]                 Address Size : 000FFFFF
[162h 0354   4]                 Address Size : 00001000

[166h 0358  10]                     Namepath : "\_SB.USB1"
[170h 0368 148]                     OEM Data : \
    05 00 00 00 32 58 49 46 02 00 00 00 00 02 00 00 \
    00 C7 00 00 F8 FF FF FF 00 00 00 00 00 02 00 00 \
    10 88 0F 00 00 00 00 00 00 00 10 10 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 \
    43 42 53 55 

Raw Table Data: Length 516 (0x204)

    0000: 44 42 47 32 04 02 00 00 01 84 51 43 4F 4D 20 20  // DBG2......QCOM  
    0010: 51 43 4F 4D 45 44 4B 32 50 08 00 00 49 4E 54 4C  // QCOMEDK2P...INTL
    0020: 28 05 20 20 2C 00 00 00 03 00 00 00 01 30 00 01  // (.  ,........0..
    0030: 0A 00 26 00 00 00 00 00 00 80 11 00 00 00 16 00  // ..&.............
    0040: 22 00 00 20 00 20 00 40 A8 00 00 00 00 00 00 10  // ".. . .@........
    0050: 00 00 5C 5F 53 42 2E 55 41 52 44 00 01 D4 00 02  // ..\_SB.UARD.....
    0060: 0A 00 36 00 94 00 40 00 03 80 43 51 00 00 16 00  // ..6...@...CQ....
    0070: 2E 00 00 20 00 20 00 00 60 0A 00 00 00 00 00 20  // ... . ..`...... 
    0080: 00 20 00 00 60 0A 00 00 00 00 FF FF 0F 00 00 10  // . ..`...........
    0090: 00 00 5C 5F 53 42 2E 55 52 53 30 00 05 00 00 00  // ..\_SB.URS0.....
    00A0: 32 58 49 46 02 00 00 00 00 02 00 00 00 C7 00 00  // 2XIF............
    00B0: F8 FF FF FF 00 00 00 00 00 02 00 00 10 88 0F 00  // ................
    00C0: 00 00 00 00 00 00 10 10 00 00 00 00 00 00 00 00  // ................
    00D0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00E0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00F0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0100: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0110: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0120: 00 00 00 00 00 00 00 00 00 00 00 00 43 42 53 55  // ............CBSU
    0130: 01 D4 00 02 0A 00 36 00 94 00 40 00 03 80 43 51  // ......6...@...CQ
    0140: 00 00 16 00 2E 00 00 20 00 20 00 00 80 0A 00 00  // ....... . ......
    0150: 00 00 00 20 00 20 00 00 80 0A 00 00 00 00 FF FF  // ... . ..........
    0160: 0F 00 00 10 00 00 5C 5F 53 42 2E 55 53 42 31 00  // ......\_SB.USB1.
    0170: 05 00 00 00 32 58 49 46 02 00 00 00 00 02 00 00  // ....2XIF........
    0180: 00 C7 00 00 F8 FF FF FF 00 00 00 00 00 02 00 00  // ................
    0190: 10 88 0F 00 00 00 00 00 00 00 10 10 00 00 00 00  // ................
    01A0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    01B0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    01C0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    01D0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    01E0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    01F0: 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00  // ................
    0200: 43 42 53 55                                      // CBSU
