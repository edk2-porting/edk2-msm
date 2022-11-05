/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20211217 (32-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembly of ./Pptt.acpi, Sat Oct 22 14:04:08 2022
 *
 * ACPI Data Table [PPTT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000   4]                    Signature : "PPTT"    [Processor Properties Topology Table]
[004h 0004   4]                 Table Length : 0000019E
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 00     /* Incorrect checksum, should be D4 */
[00Ah 0010   6]                       Oem ID : "QCOM  "
[010h 0016   8]                 Oem Table ID : "QCOMEDK2"
[018h 0024   4]                 Oem Revision : 00007280
[01Ch 0028   4]              Asl Compiler ID : "QCOM"
[020h 0032   4]        Asl Compiler Revision : 00000001


[024h 0036   1]                Subtable Type : 01 [Cache Type]
[025h 0037   1]                       Length : 18
[026h 0038   2]                     Reserved : 0000
[028h 0040   4]        Flags (decoded below) : 00000000
                                  Size valid : 0
                        Number of Sets valid : 0
                         Associativity valid : 0
                       Allocation Type valid : 0
                            Cache Type valid : 0
                          Write Policy valid : 0
                             Line Size valid : 0
                              Cache ID valid : 0
[02Ch 0044   4]          Next Level of Cache : 00000000
[030h 0048   4]                         Size : 00000000
[034h 0052   4]               Number of Sets : 00000000
[038h 0056   1]                Associativity : 00
[039h 0057   1]                   Attributes : 00
                             Allocation Type : 0
                                  Cache Type : 0
                                Write Policy : 0
[03Ah 0058   2]                    Line Size : 0000

[03Ch 0060   1]                Subtable Type : 02 [ID]
[03Dh 0061   1]                       Length : 1E
[03Eh 0062   2]                     Reserved : 0000
[040h 0064   4]                    Vendor ID : 00000000
[044h 0068   8]                    Level1 ID : 0000000000000000
[04Ch 0076   8]                    Level2 ID : 0000000000000000
[054h 0084   2]               Major revision : 0000
[056h 0086   2]               Minor revision : 0000
[058h 0088   2]                Spin revision : 0000

[05Ah 0090   1]                Subtable Type : 00 [Processor Hierarchy Node]
[05Bh 0091   1]                       Length : 1C
[05Ch 0092   2]                     Reserved : 0000
[05Eh 0094   4]        Flags (decoded below) : 00000001
                            Physical package : 1
                     ACPI Processor ID valid : 0
                       Processor is a thread : 0
                              Node is a leaf : 0
                    Identical Implementation : 0
[062h 0098   4]                       Parent : 00000000
[066h 0102   4]            ACPI Processor ID : 00000000
[06Ah 0106   4]      Private Resource Number : 00000002
[06Eh 0110   4]             Private Resource : 00000024
[072h 0114   4]             Private Resource : 0000003C

[076h 0118   1]                Subtable Type : 01 [Cache Type]
[077h 0119   1]                       Length : 18
[078h 0120   2]                     Reserved : 0000
[07Ah 0122   4]        Flags (decoded below) : 00000000
                                  Size valid : 0
                        Number of Sets valid : 0
                         Associativity valid : 0
                       Allocation Type valid : 0
                            Cache Type valid : 0
                          Write Policy valid : 0
                             Line Size valid : 0
                              Cache ID valid : 0
[07Eh 0126   4]          Next Level of Cache : 00000000
[082h 0130   4]                         Size : 00000000
[086h 0134   4]               Number of Sets : 00000000
[08Ah 0138   1]                Associativity : 00
[08Bh 0139   1]                   Attributes : 00
                             Allocation Type : 0
                                  Cache Type : 0
                                Write Policy : 0
[08Ch 0140   2]                    Line Size : 0000

[08Eh 0142   1]                Subtable Type : 01 [Cache Type]
[08Fh 0143   1]                       Length : 18
[090h 0144   2]                     Reserved : 0000
[092h 0146   4]        Flags (decoded below) : 00000000
                                  Size valid : 0
                        Number of Sets valid : 0
                         Associativity valid : 0
                       Allocation Type valid : 0
                            Cache Type valid : 0
                          Write Policy valid : 0
                             Line Size valid : 0
                              Cache ID valid : 0
[096h 0150   4]          Next Level of Cache : 00000076
[09Ah 0154   4]                         Size : 00000000
[09Eh 0158   4]               Number of Sets : 00000000
[0A2h 0162   1]                Associativity : 00
[0A3h 0163   1]                   Attributes : 00
                             Allocation Type : 0
                                  Cache Type : 0
                                Write Policy : 0
[0A4h 0164   2]                    Line Size : 0000

[0A6h 0166   1]                Subtable Type : 01 [Cache Type]
[0A7h 0167   1]                       Length : 18
[0A8h 0168   2]                     Reserved : 0000
[0AAh 0170   4]        Flags (decoded below) : 00000000
                                  Size valid : 0
                        Number of Sets valid : 0
                         Associativity valid : 0
                       Allocation Type valid : 0
                            Cache Type valid : 0
                          Write Policy valid : 0
                             Line Size valid : 0
                              Cache ID valid : 0
[0AEh 0174   4]          Next Level of Cache : 00000076
[0B2h 0178   4]                         Size : 00000000
[0B6h 0182   4]               Number of Sets : 00000000
[0BAh 0186   1]                Associativity : 00
[0BBh 0187   1]                   Attributes : 00
                             Allocation Type : 0
                                  Cache Type : 0
                                Write Policy : 0
[0BCh 0188   2]                    Line Size : 0000

[0BEh 0190   1]                Subtable Type : 00 [Processor Hierarchy Node]
[0BFh 0191   1]                       Length : 1C
[0C0h 0192   2]                     Reserved : 0000
[0C2h 0194   4]        Flags (decoded below) : 00000002
                            Physical package : 0
                     ACPI Processor ID valid : 1
                       Processor is a thread : 0
                              Node is a leaf : 0
                    Identical Implementation : 0
[0C6h 0198   4]                       Parent : 0000005A
[0CAh 0202   4]            ACPI Processor ID : 00000000
[0CEh 0206   4]      Private Resource Number : 00000002
[0D2h 0210   4]             Private Resource : 0000008E
[0D6h 0214   4]             Private Resource : 000000A6

[0DAh 0218   1]                Subtable Type : 00 [Processor Hierarchy Node]
[0DBh 0219   1]                       Length : 1C
[0DCh 0220   2]                     Reserved : 0000
[0DEh 0222   4]        Flags (decoded below) : 00000002
                            Physical package : 0
                     ACPI Processor ID valid : 1
                       Processor is a thread : 0
                              Node is a leaf : 0
                    Identical Implementation : 0
[0E2h 0226   4]                       Parent : 0000005A
[0E6h 0230   4]            ACPI Processor ID : 00000001
[0EAh 0234   4]      Private Resource Number : 00000002
[0EEh 0238   4]             Private Resource : 0000008E
[0F2h 0242   4]             Private Resource : 000000A6

[0F6h 0246   1]                Subtable Type : 00 [Processor Hierarchy Node]
[0F7h 0247   1]                       Length : 1C
[0F8h 0248   2]                     Reserved : 0000
[0FAh 0250   4]        Flags (decoded below) : 00000002
                            Physical package : 0
                     ACPI Processor ID valid : 1
                       Processor is a thread : 0
                              Node is a leaf : 0
                    Identical Implementation : 0
[0FEh 0254   4]                       Parent : 0000005A
[102h 0258   4]            ACPI Processor ID : 00000002
[106h 0262   4]      Private Resource Number : 00000002
[10Ah 0266   4]             Private Resource : 0000008E
[10Eh 0270   4]             Private Resource : 000000A6

[112h 0274   1]                Subtable Type : 00 [Processor Hierarchy Node]
[113h 0275   1]                       Length : 1C
[114h 0276   2]                     Reserved : 0000
[116h 0278   4]        Flags (decoded below) : 00000002
                            Physical package : 0
                     ACPI Processor ID valid : 1
                       Processor is a thread : 0
                              Node is a leaf : 0
                    Identical Implementation : 0
[11Ah 0282   4]                       Parent : 0000005A
[11Eh 0286   4]            ACPI Processor ID : 00000003
[122h 0290   4]      Private Resource Number : 00000002
[126h 0294   4]             Private Resource : 0000008E
[12Ah 0298   4]             Private Resource : 000000A6

[12Eh 0302   1]                Subtable Type : 00 [Processor Hierarchy Node]
[12Fh 0303   1]                       Length : 1C
[130h 0304   2]                     Reserved : 0000
[132h 0306   4]        Flags (decoded below) : 00000002
                            Physical package : 0
                     ACPI Processor ID valid : 1
                       Processor is a thread : 0
                              Node is a leaf : 0
                    Identical Implementation : 0
[136h 0310   4]                       Parent : 0000005A
[13Ah 0314   4]            ACPI Processor ID : 00000004
[13Eh 0318   4]      Private Resource Number : 00000002
[142h 0322   4]             Private Resource : 0000008E
[146h 0326   4]             Private Resource : 000000A6

[14Ah 0330   1]                Subtable Type : 00 [Processor Hierarchy Node]
[14Bh 0331   1]                       Length : 1C
[14Ch 0332   2]                     Reserved : 0000
[14Eh 0334   4]        Flags (decoded below) : 00000002
                            Physical package : 0
                     ACPI Processor ID valid : 1
                       Processor is a thread : 0
                              Node is a leaf : 0
                    Identical Implementation : 0
[152h 0338   4]                       Parent : 0000005A
[156h 0342   4]            ACPI Processor ID : 00000005
[15Ah 0346   4]      Private Resource Number : 00000002
[15Eh 0350   4]             Private Resource : 0000008E
[162h 0354   4]             Private Resource : 000000A6

[166h 0358   1]                Subtable Type : 00 [Processor Hierarchy Node]
[167h 0359   1]                       Length : 1C
[168h 0360   2]                     Reserved : 0000
[16Ah 0362   4]        Flags (decoded below) : 00000002
                            Physical package : 0
                     ACPI Processor ID valid : 1
                       Processor is a thread : 0
                              Node is a leaf : 0
                    Identical Implementation : 0
[16Eh 0366   4]                       Parent : 0000005A
[172h 0370   4]            ACPI Processor ID : 00000006
[176h 0374   4]      Private Resource Number : 00000002
[17Ah 0378   4]             Private Resource : 0000008E
[17Eh 0382   4]             Private Resource : 000000A6

[182h 0386   1]                Subtable Type : 00 [Processor Hierarchy Node]
[183h 0387   1]                       Length : 1C
[184h 0388   2]                     Reserved : 0000
[186h 0390   4]        Flags (decoded below) : 00000002
                            Physical package : 0
                     ACPI Processor ID valid : 1
                       Processor is a thread : 0
                              Node is a leaf : 0
                    Identical Implementation : 0
[18Ah 0394   4]                       Parent : 0000005A
[18Eh 0398   4]            ACPI Processor ID : 00000007
[192h 0402   4]      Private Resource Number : 00000002
[196h 0406   4]             Private Resource : 0000008E
[19Ah 0410   4]             Private Resource : 000000A6

Raw Table Data: Length 414 (0x19E)

    0000: 50 50 54 54 9E 01 00 00 01 00 51 43 4F 4D 20 20  // PPTT......QCOM  
    0010: 51 43 4F 4D 45 44 4B 32 80 72 00 00 51 43 4F 4D  // QCOMEDK2.r..QCOM
    0020: 01 00 00 00 01 18 00 00 00 00 00 00 00 00 00 00  // ................
    0030: 00 00 00 00 00 00 00 00 00 00 00 00 02 1E 00 00  // ................
    0040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0050: 00 00 00 00 00 00 00 00 00 00 00 1C 00 00 01 00  // ................
    0060: 00 00 00 00 00 00 00 00 00 00 02 00 00 00 24 00  // ..............$.
    0070: 00 00 3C 00 00 00 01 18 00 00 00 00 00 00 00 00  // ..<.............
    0080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 18  // ................
    0090: 00 00 00 00 00 00 76 00 00 00 00 00 00 00 00 00  // ......v.........
    00A0: 00 00 00 00 00 00 01 18 00 00 00 00 00 00 76 00  // ..............v.
    00B0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 1C  // ................
    00C0: 00 00 02 00 00 00 5A 00 00 00 00 00 00 00 02 00  // ......Z.........
    00D0: 00 00 8E 00 00 00 A6 00 00 00 00 1C 00 00 02 00  // ................
    00E0: 00 00 5A 00 00 00 01 00 00 00 02 00 00 00 8E 00  // ..Z.............
    00F0: 00 00 A6 00 00 00 00 1C 00 00 02 00 00 00 5A 00  // ..............Z.
    0100: 00 00 02 00 00 00 02 00 00 00 8E 00 00 00 A6 00  // ................
    0110: 00 00 00 1C 00 00 02 00 00 00 5A 00 00 00 03 00  // ..........Z.....
    0120: 00 00 02 00 00 00 8E 00 00 00 A6 00 00 00 00 1C  // ................
    0130: 00 00 02 00 00 00 5A 00 00 00 04 00 00 00 02 00  // ......Z.........
    0140: 00 00 8E 00 00 00 A6 00 00 00 00 1C 00 00 02 00  // ................
    0150: 00 00 5A 00 00 00 05 00 00 00 02 00 00 00 8E 00  // ..Z.............
    0160: 00 00 A6 00 00 00 00 1C 00 00 02 00 00 00 5A 00  // ..............Z.
    0170: 00 00 06 00 00 00 02 00 00 00 8E 00 00 00 A6 00  // ................
    0180: 00 00 00 1C 00 00 02 00 00 00 5A 00 00 00 07 00  // ..........Z.....
    0190: 00 00 02 00 00 00 8E 00 00 00 A6 00 00 00        // ..............
