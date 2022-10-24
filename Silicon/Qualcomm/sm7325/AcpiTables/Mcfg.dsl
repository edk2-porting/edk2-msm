/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20211217 (32-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembly of ./Mcfg.acpi, Sat Oct 22 14:03:22 2022
 *
 * ACPI Data Table [MCFG]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000   4]                    Signature : "MCFG"    [Memory Mapped Configuration Table]
[004h 0004   4]                 Table Length : 0000004C
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 00     /* Incorrect checksum, should be 2A */
[00Ah 0010   6]                       Oem ID : "QCOM  "
[010h 0016   8]                 Oem Table ID : "QCOMEDK2"
[018h 0024   4]                 Oem Revision : 00007280
[01Ch 0028   4]              Asl Compiler ID : "QCOM"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   8]                     Reserved : 0000000000000000

[02Ch 0044   8]                 Base Address : 0000000060000000
[034h 0052   2]         Segment Group Number : 0000
[036h 0054   1]             Start Bus Number : 00
[037h 0055   1]               End Bus Number : 01
[038h 0056   4]                     Reserved : 00000000

[03Ch 0060   8]                 Base Address : 0000000040000000
[044h 0068   2]         Segment Group Number : 0001
[046h 0070   1]             Start Bus Number : 00
[047h 0071   1]               End Bus Number : 01
[048h 0072   4]                     Reserved : 00000000

Raw Table Data: Length 76 (0x4C)

    0000: 4D 43 46 47 4C 00 00 00 01 00 51 43 4F 4D 20 20  // MCFGL.....QCOM  
    0010: 51 43 4F 4D 45 44 4B 32 80 72 00 00 51 43 4F 4D  // QCOMEDK2.r..QCOM
    0020: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 60  // ...............`
    0030: 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 40  // ...............@
    0040: 00 00 00 00 01 00 00 01 00 00 00 00              // ............
