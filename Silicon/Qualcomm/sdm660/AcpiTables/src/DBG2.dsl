/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembly of DBG2.aml, Fri Jan  6 19:05:40 2023
 *
 * ACPI Data Table [DBG2]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "DBG2"    [Debug Port table type 2]
[004h 0004   4]                 Table Length : 00000128
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 1B
[00Ah 0010   6]                       Oem ID : "QCOM  "
[010h 0016   8]                 Oem Table ID : "QCOMEDK2"
[018h 0024   4]                 Oem Revision : 00000660
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20200925

[024h 0036   4]                  Info Offset : 0000002C
[028h 0040   4]                   Info Count : 00000002

[02Ch 0044   1]                     Revision : 01
[02Dh 0045   2]                       Length : 0030
[02Fh 0047   1]               Register Count : 01
[030h 0048   2]              Namepath Length : 000A
[032h 0050   2]              Namepath Offset : 0026
[034h 0052   2]              OEM Data Length : 0000 [Optional field not present]
[036h 0054   2]              OEM Data Offset : 0000 [Optional field not present]
[038h 0056   2]                    Port Type : 8000
[03Ah 0058   2]                 Port Subtype : 0009
[03Ch 0060   2]                     Reserved : 0000
[03Eh 0062   2]          Base Address Offset : 0016
[040h 0064   2]          Address Size Offset : 0022

[042h 0066  12]        Base Address Register : [Generic Address Structure]
[042h 0066   1]                     Space ID : 00 [SystemMemory]
[043h 0067   1]                    Bit Width : 20
[044h 0068   1]                   Bit Offset : 00
[045h 0069   1]         Encoded Access Width : 20 [Unknown Width Encoding]
[046h 0070   8]                      Address : 000000000C1B0000

[04Eh 0078   4]                 Address Size : 00001000

[052h 0082  10]                     Namepath : "\_SB.UARD"

[05Ch 0092   1]                     Revision : 01
[05Dh 0093   2]                       Length : 00CC
[05Fh 0095   1]               Register Count : 02
[060h 0096   2]              Namepath Length : 000A
[062h 0098   2]              Namepath Offset : 0036
[064h 0100   2]              OEM Data Length : 008C
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
[076h 0118   8]                      Address : 000000000A800000


[07Eh 0126  12]        Base Address Register : [Generic Address Structure]
[07Eh 0126   1]                     Space ID : 00 [SystemMemory]
[07Fh 0127   1]                    Bit Width : 20
[080h 0128   1]                   Bit Offset : 00
[081h 0129   1]         Encoded Access Width : 20 [Unknown Width Encoding]
[082h 0130   8]                      Address : 000000000C012200

[08Ah 0138   4]                 Address Size : 000FFFFF
[08Eh 0142   4]                 Address Size : 000000A8

[092h 0146  10]                     Namepath : "\_SB.USB0"
[09Ch 0156 140]                     OEM Data : \
    05 00 00 00 32 58 49 46 03 00 00 00 01 02 00 00 \
    10 00 00 00 00 00 00 00 22 00 00 00 00 02 00 00 \
    00 C7 00 00 F8 FF FF FF 00 00 00 00 00 02 00 00 \
    10 88 0F 00 00 00 00 00 00 00 10 10 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 

Raw Table Data: Length 296 (0x128)

    0000: 44 42 47 32 28 01 00 00 01 1B 51 43 4F 4D 20 20  // DBG2(.....QCOM  
    0010: 51 43 4F 4D 45 44 4B 32 60 06 00 00 49 4E 54 4C  // QCOMEDK2`...INTL
    0020: 25 09 20 20 2C 00 00 00 02 00 00 00 01 30 00 01  // %.  ,........0..
    0030: 0A 00 26 00 00 00 00 00 00 80 09 00 00 00 16 00  // ..&.............
    0040: 22 00 00 20 00 20 00 00 1B 0C 00 00 00 00 00 10  // ".. . ..........
    0050: 00 00 5C 5F 53 42 2E 55 41 52 44 00 01 CC 00 02  // ..\_SB.UARD.....
    0060: 0A 00 36 00 8C 00 40 00 03 80 43 51 00 00 16 00  // ..6...@...CQ....
    0070: 2E 00 00 20 00 20 00 00 80 0A 00 00 00 00 00 20  // ... . ......... 
    0080: 00 20 00 22 01 0C 00 00 00 00 FF FF 0F 00 A8 00  // . ."............
    0090: 00 00 5C 5F 53 42 2E 55 53 42 30 00 05 00 00 00  // ..\_SB.USB0.....
    00A0: 32 58 49 46 03 00 00 00 01 02 00 00 10 00 00 00  // 2XIF............
    00B0: 00 00 00 00 22 00 00 00 00 02 00 00 00 C7 00 00  // ...."...........
    00C0: F8 FF FF FF 00 00 00 00 00 02 00 00 10 88 0F 00  // ................
    00D0: 00 00 00 00 00 00 10 10 00 00 00 00 00 00 00 00  // ................
    00E0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00F0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0100: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0110: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0120: 00 00 00 00 00 00 00 00                          // ........
