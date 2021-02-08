/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (32-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembly of ./nta/3.raw, Sat Jan 30 19:38:15 2021
 *
 * ACPI Data Table [GTDT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "GTDT"    [Generic Timer Description Table]
[004h 0004   4]                 Table Length : 0000009C
[008h 0008   1]                     Revision : 02
[009h 0009   1]                     Checksum : B3
[00Ah 0010   6]                       Oem ID : "QCOM  "
[010h 0016   8]                 Oem Table ID : "QCOMEDK2"
[018h 0024   4]                 Oem Revision : 00000850
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20200528

[024h 0036   8]        Counter Block Address : FFFFFFFFFFFFFFFF
[02Ch 0044   4]                     Reserved : 00000000

[030h 0048   4]         Secure EL1 Interrupt : 00000011
[034h 0052   4]    EL1 Flags (decoded below) : 00000000
                                Trigger Mode : 0
                                    Polarity : 0
                                   Always On : 0

[038h 0056   4]     Non-Secure EL1 Interrupt : 00000012
[03Ch 0060   4]   NEL1 Flags (decoded below) : 00000000
                                Trigger Mode : 0
                                    Polarity : 0
                                   Always On : 0

[040h 0064   4]      Virtual Timer Interrupt : 00000013
[044h 0068   4]     VT Flags (decoded below) : 00000000
                                Trigger Mode : 0
                                    Polarity : 0
                                   Always On : 0

[048h 0072   4]     Non-Secure EL2 Interrupt : 00000010
[04Ch 0076   4]   NEL2 Flags (decoded below) : 00000000
                                Trigger Mode : 0
                                    Polarity : 0
                                   Always On : 0
[050h 0080   8]   Counter Read Block Address : FFFFFFFFFFFFFFFF

[058h 0088   4]         Platform Timer Count : 00000001
[05Ch 0092   4]        Platform Timer Offset : 00000060

[060h 0096   1]                Subtable Type : 00 [Generic Timer Block]
[061h 0097   2]                       Length : 003C
[063h 0099   1]                     Reserved : 00
[064h 0100   8]                Block Address : 0000000017C90000
[06Ch 0108   4]                  Timer Count : 00000001
[070h 0112   4]                 Timer Offset : 00000014

[074h 0116   1]                 Frame Number : 00
[075h 0117   3]                     Reserved : 000000
[078h 0120   8]                 Base Address : 0000000017CA0000
[080h 0128   8]             EL0 Base Address : 0000000017CB0000
[088h 0136   4]              Timer Interrupt : 00000027
[08Ch 0140   4]  Timer Flags (decoded below) : 00000000
                                Trigger Mode : 0
                                    Polarity : 0
[090h 0144   4]      Virtual Timer Interrupt : 00000026
[094h 0148   4] Virtual Timer Flags (decoded below) : 00000000
                                Trigger Mode : 0
                                    Polarity : 0
[098h 0152   4] Common Flags (decoded below) : 00000002
                                      Secure : 0
                                   Always On : 1

Raw Table Data: Length 156 (0x9C)

    0000: 47 54 44 54 9C 00 00 00 02 B3 51 43 4F 4D 20 20  // GTDT......QCOM  
    0010: 51 43 4F 4D 45 44 4B 32 50 08 00 00 49 4E 54 4C  // QCOMEDK2P...INTL
    0020: 28 05 20 20 FF FF FF FF FF FF FF FF 00 00 00 00  // (.  ............
    0030: 11 00 00 00 00 00 00 00 12 00 00 00 00 00 00 00  // ................
    0040: 13 00 00 00 00 00 00 00 10 00 00 00 00 00 00 00  // ................
    0050: FF FF FF FF FF FF FF FF 01 00 00 00 60 00 00 00  // ............`...
    0060: 00 3C 00 00 00 00 C9 17 00 00 00 00 01 00 00 00  // .<..............
    0070: 14 00 00 00 00 00 00 00 00 00 CA 17 00 00 00 00  // ................
    0080: 00 00 CB 17 00 00 00 00 27 00 00 00 00 00 00 00  // ........'.......
    0090: 26 00 00 00 00 00 00 00 02 00 00 00              // &...........
