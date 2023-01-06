/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembly of MADT.aml, Fri Jan  6 18:55:05 2023
 *
 * ACPI Data Table [APIC]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
[004h 0004   4]                 Table Length : 000002ED
[008h 0008   1]                     Revision : 05
[009h 0009   1]                     Checksum : 00     /* Incorrect checksum, should be 10 */
[00Ah 0010   6]                       Oem ID : "QCOM  "
[010h 0016   8]                 Oem Table ID : "QCOMEDK2"
[018h 0024   4]                 Oem Revision : 00000660
[01Ch 0028   4]              Asl Compiler ID : "QCOM"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   4]           Local Apic Address : 17C00000
[028h 0040   4]        Flags (decoded below) : 00000000
                         PC-AT Compatibility : 0

[02Ch 0044   1]                Subtable Type : 0B [Generic Interrupt Controller]
[02Dh 0045   1]                       Length : 50
[02Eh 0046   2]                     Reserved : 0000
[030h 0048   4]         CPU Interface Number : 00000000
[034h 0052   4]                Processor UID : 00000000
[038h 0056   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
          Performance Interrupt Trigger Mode : 0
          Virtual GIC Interrupt Trigger Mode : 0
[03Ch 0060   4]     Parking Protocol Version : 00000000
[040h 0064   4]        Performance Interrupt : 00000016
[044h 0068   8]               Parked Address : 0000000000000000
[04Ch 0076   8]                 Base Address : 0000000000000000
[054h 0084   8]     Virtual GIC Base Address : 0000000017C20000
[05Ch 0092   8]  Hypervisor GIC Base Address : 0000000017C10000
[064h 0100   4]        Virtual GIC Interrupt : 0000001B
[068h 0104   8]   Redistributor Base Address : 0000000000000000
[070h 0112   8]                    ARM MPIDR : 0000000000000000
[078h 0120   1]             Efficiency Class : 00
[079h 0121   1]                     Reserved : 00
[07Ah 0122   2]       SPE Overflow Interrupt : 0000

[07Ch 0124   1]                Subtable Type : 0B [Generic Interrupt Controller]
[07Dh 0125   1]                       Length : 50
[07Eh 0126   2]                     Reserved : 0000
[080h 0128   4]         CPU Interface Number : 00000001
[084h 0132   4]                Processor UID : 00000001
[088h 0136   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
          Performance Interrupt Trigger Mode : 0
          Virtual GIC Interrupt Trigger Mode : 0
[08Ch 0140   4]     Parking Protocol Version : 00000000
[090h 0144   4]        Performance Interrupt : 00000016
[094h 0148   8]               Parked Address : 0000000000000000
[09Ch 0156   8]                 Base Address : 0000000000000000
[0A4h 0164   8]     Virtual GIC Base Address : 0000000017C20000
[0ACh 0172   8]  Hypervisor GIC Base Address : 0000000017C10000
[0B4h 0180   4]        Virtual GIC Interrupt : 0000001B
[0B8h 0184   8]   Redistributor Base Address : 0000000000000000
[0C0h 0192   8]                    ARM MPIDR : 0000000000000001
[0C8h 0200   1]             Efficiency Class : 00
[0C9h 0201   1]                     Reserved : 00
[0CAh 0202   2]       SPE Overflow Interrupt : 0000

[0CCh 0204   1]                Subtable Type : 0B [Generic Interrupt Controller]
[0CDh 0205   1]                       Length : 50
[0CEh 0206   2]                     Reserved : 0000
[0D0h 0208   4]         CPU Interface Number : 00000002
[0D4h 0212   4]                Processor UID : 00000002
[0D8h 0216   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
          Performance Interrupt Trigger Mode : 0
          Virtual GIC Interrupt Trigger Mode : 0
[0DCh 0220   4]     Parking Protocol Version : 00000000
[0E0h 0224   4]        Performance Interrupt : 00000016
[0E4h 0228   8]               Parked Address : 0000000000000000
[0ECh 0236   8]                 Base Address : 0000000000000000
[0F4h 0244   8]     Virtual GIC Base Address : 0000000017C20000
[0FCh 0252   8]  Hypervisor GIC Base Address : 0000000017C10000
[104h 0260   4]        Virtual GIC Interrupt : 0000001B
[108h 0264   8]   Redistributor Base Address : 0000000000000000
[110h 0272   8]                    ARM MPIDR : 0000000000000002
[118h 0280   1]             Efficiency Class : 00
[119h 0281   1]                     Reserved : 00
[11Ah 0282   2]       SPE Overflow Interrupt : 0000

[11Ch 0284   1]                Subtable Type : 0B [Generic Interrupt Controller]
[11Dh 0285   1]                       Length : 50
[11Eh 0286   2]                     Reserved : 0000
[120h 0288   4]         CPU Interface Number : 00000003
[124h 0292   4]                Processor UID : 00000003
[128h 0296   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
          Performance Interrupt Trigger Mode : 0
          Virtual GIC Interrupt Trigger Mode : 0
[12Ch 0300   4]     Parking Protocol Version : 00000000
[130h 0304   4]        Performance Interrupt : 00000016
[134h 0308   8]               Parked Address : 0000000000000000
[13Ch 0316   8]                 Base Address : 0000000000000000
[144h 0324   8]     Virtual GIC Base Address : 0000000017C20000
[14Ch 0332   8]  Hypervisor GIC Base Address : 0000000017C10000
[154h 0340   4]        Virtual GIC Interrupt : 0000001B
[158h 0344   8]   Redistributor Base Address : 0000000000000000
[160h 0352   8]                    ARM MPIDR : 0000000000000003
[168h 0360   1]             Efficiency Class : 00
[169h 0361   1]                     Reserved : 00
[16Ah 0362   2]       SPE Overflow Interrupt : 0000

[16Ch 0364   1]                Subtable Type : 0B [Generic Interrupt Controller]
[16Dh 0365   1]                       Length : 50
[16Eh 0366   2]                     Reserved : 0000
[170h 0368   4]         CPU Interface Number : 00000004
[174h 0372   4]                Processor UID : 00000004
[178h 0376   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
          Performance Interrupt Trigger Mode : 0
          Virtual GIC Interrupt Trigger Mode : 0
[17Ch 0380   4]     Parking Protocol Version : 00000000
[180h 0384   4]        Performance Interrupt : 00000016
[184h 0388   8]               Parked Address : 0000000000000000
[18Ch 0396   8]                 Base Address : 0000000000000000
[194h 0404   8]     Virtual GIC Base Address : 0000000017C20000
[19Ch 0412   8]  Hypervisor GIC Base Address : 0000000017C10000
[1A4h 0420   4]        Virtual GIC Interrupt : 0000001B
[1A8h 0424   8]   Redistributor Base Address : 0000000000000000
[1B0h 0432   8]                    ARM MPIDR : 0000000000000100
[1B8h 0440   1]             Efficiency Class : 01
[1B9h 0441   1]                     Reserved : 00
[1BAh 0442   2]       SPE Overflow Interrupt : 0000

[1BCh 0444   1]                Subtable Type : 0B [Generic Interrupt Controller]
[1BDh 0445   1]                       Length : 50
[1BEh 0446   2]                     Reserved : 0000
[1C0h 0448   4]         CPU Interface Number : 00000005
[1C4h 0452   4]                Processor UID : 00000005
[1C8h 0456   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
          Performance Interrupt Trigger Mode : 0
          Virtual GIC Interrupt Trigger Mode : 0
[1CCh 0460   4]     Parking Protocol Version : 00000000
[1D0h 0464   4]        Performance Interrupt : 00000016
[1D4h 0468   8]               Parked Address : 0000000000000000
[1DCh 0476   8]                 Base Address : 0000000000000000
[1E4h 0484   8]     Virtual GIC Base Address : 0000000017C20000
[1ECh 0492   8]  Hypervisor GIC Base Address : 0000000017C10000
[1F4h 0500   4]        Virtual GIC Interrupt : 0000001B
[1F8h 0504   8]   Redistributor Base Address : 0000000000000000
[200h 0512   8]                    ARM MPIDR : 0000000000000101
[208h 0520   1]             Efficiency Class : 01
[209h 0521   1]                     Reserved : 00
[20Ah 0522   2]       SPE Overflow Interrupt : 0000

[20Ch 0524   1]                Subtable Type : 0B [Generic Interrupt Controller]
[20Dh 0525   1]                       Length : 50
[20Eh 0526   2]                     Reserved : 0000
[210h 0528   4]         CPU Interface Number : 00000006
[214h 0532   4]                Processor UID : 00000006
[218h 0536   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
          Performance Interrupt Trigger Mode : 0
          Virtual GIC Interrupt Trigger Mode : 0
[21Ch 0540   4]     Parking Protocol Version : 00000000
[220h 0544   4]        Performance Interrupt : 00000016
[224h 0548   8]               Parked Address : 0000000000000000
[22Ch 0556   8]                 Base Address : 0000000000000000
[234h 0564   8]     Virtual GIC Base Address : 0000000017C20000
[23Ch 0572   8]  Hypervisor GIC Base Address : 0000000017C10000
[244h 0580   4]        Virtual GIC Interrupt : 0000001B
[248h 0584   8]   Redistributor Base Address : 0000000000000000
[250h 0592   8]                    ARM MPIDR : 0000000000000102
[258h 0600   1]             Efficiency Class : 01
[259h 0601   1]                     Reserved : 00
[25Ah 0602   2]       SPE Overflow Interrupt : 0000

[25Ch 0604   1]                Subtable Type : 0B [Generic Interrupt Controller]
[25Dh 0605   1]                       Length : 50
[25Eh 0606   2]                     Reserved : 0000
[260h 0608   4]         CPU Interface Number : 00000007
[264h 0612   4]                Processor UID : 00000007
[268h 0616   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
          Performance Interrupt Trigger Mode : 0
          Virtual GIC Interrupt Trigger Mode : 0
[26Ch 0620   4]     Parking Protocol Version : 00000000
[270h 0624   4]        Performance Interrupt : 00000016
[274h 0628   8]               Parked Address : 0000000000000000
[27Ch 0636   8]                 Base Address : 0000000000000000
[284h 0644   8]     Virtual GIC Base Address : 0000000017C20000
[28Ch 0652   8]  Hypervisor GIC Base Address : 0000000017C10000
[294h 0660   4]        Virtual GIC Interrupt : 0000001B
[298h 0664   8]   Redistributor Base Address : 0000000000000000
[2A0h 0672   8]                    ARM MPIDR : 0000000000000103
[2A8h 0680   1]             Efficiency Class : 01
[2A9h 0681   1]                     Reserved : 00
[2AAh 0682   2]       SPE Overflow Interrupt : 0000

[2ACh 0684   1]                Subtable Type : 0C [Generic Interrupt Distributor]
[2ADh 0685   1]                       Length : 19
[2AEh 0686   2]                     Reserved : 0000
[2B0h 0688   4]        Local GIC Hardware ID : 00000000
[2B4h 0692   8]                 Base Address : 0000000017A00000
[2BCh 0700   4]               Interrupt Base : 00000000
[2C0h 0704   1]                      Version : 03
[2C1h 0705   3]                     Reserved : 000000

[2C5h 0709   1]                Subtable Type : 0E [Generic Interrupt Redistributor]
[2C6h 0710   1]                       Length : 10
[2C7h 0711   2]                     Reserved : 0000
[2C9h 0713   8]                 Base Address : 0000000017B00000
[2D1h 0721   4]                       Length : 00100000

[2D5h 0725   1]                Subtable Type : 0D [Generic MSI Frame]
[2D6h 0726   1]                       Length : 18
[2D7h 0727   2]                     Reserved : 0000
[2D9h 0729   4]                 MSI Frame ID : 00000000
[2DDh 0733   8]                 Base Address : 0000000017A10000
[2E5h 0741   4]        Flags (decoded below) : 00000001
                                  Select SPI : 1
[2E9h 0745   2]                    SPI Count : 0020
[2EBh 0747   2]                     SPI Base : 0200

Raw Table Data: Length 749 (0x2ED)

    0000: 41 50 49 43 ED 02 00 00 05 00 51 43 4F 4D 20 20  // APIC......QCOM  
    0010: 51 43 4F 4D 45 44 4B 32 98 89 00 00 51 43 4F 4D  // QCOMEDK2....QCOM
    0020: 01 00 00 00 00 00 C0 17 00 00 00 00 0B 50 00 00  // .............P..
    0030: 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00  // ................
    0040: 16 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0050: 00 00 00 00 00 00 C2 17 00 00 00 00 00 00 C1 17  // ................
    0060: 00 00 00 00 1B 00 00 00 00 00 00 00 00 00 00 00  // ................
    0070: 00 00 00 00 00 00 00 00 00 00 00 00 0B 50 00 00  // .............P..
    0080: 01 00 00 00 01 00 00 00 01 00 00 00 00 00 00 00  // ................
    0090: 16 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00A0: 00 00 00 00 00 00 C2 17 00 00 00 00 00 00 C1 17  // ................
    00B0: 00 00 00 00 1B 00 00 00 00 00 00 00 00 00 00 00  // ................
    00C0: 01 00 00 00 00 00 00 00 00 00 00 00 0B 50 00 00  // .............P..
    00D0: 02 00 00 00 02 00 00 00 01 00 00 00 00 00 00 00  // ................
    00E0: 16 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00F0: 00 00 00 00 00 00 C2 17 00 00 00 00 00 00 C1 17  // ................
    0100: 00 00 00 00 1B 00 00 00 00 00 00 00 00 00 00 00  // ................
    0110: 02 00 00 00 00 00 00 00 00 00 00 00 0B 50 00 00  // .............P..
    0120: 03 00 00 00 03 00 00 00 01 00 00 00 00 00 00 00  // ................
    0130: 16 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0140: 00 00 00 00 00 00 C2 17 00 00 00 00 00 00 C1 17  // ................
    0150: 00 00 00 00 1B 00 00 00 00 00 00 00 00 00 00 00  // ................
    0160: 03 00 00 00 00 00 00 00 00 00 00 00 0B 50 00 00  // .............P..
    0170: 04 00 00 00 04 00 00 00 01 00 00 00 00 00 00 00  // ................
    0180: 16 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0190: 00 00 00 00 00 00 C2 17 00 00 00 00 00 00 C1 17  // ................
    01A0: 00 00 00 00 1B 00 00 00 00 00 00 00 00 00 00 00  // ................
    01B0: 00 01 00 00 00 00 00 00 01 00 00 00 0B 50 00 00  // .............P..
    01C0: 05 00 00 00 05 00 00 00 01 00 00 00 00 00 00 00  // ................
    01D0: 16 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    01E0: 00 00 00 00 00 00 C2 17 00 00 00 00 00 00 C1 17  // ................
    01F0: 00 00 00 00 1B 00 00 00 00 00 00 00 00 00 00 00  // ................
    0200: 01 01 00 00 00 00 00 00 01 00 00 00 0B 50 00 00  // .............P..
    0210: 06 00 00 00 06 00 00 00 01 00 00 00 00 00 00 00  // ................
    0220: 16 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0230: 00 00 00 00 00 00 C2 17 00 00 00 00 00 00 C1 17  // ................
    0240: 00 00 00 00 1B 00 00 00 00 00 00 00 00 00 00 00  // ................
    0250: 02 01 00 00 00 00 00 00 01 00 00 00 0B 50 00 00  // .............P..
    0260: 07 00 00 00 07 00 00 00 01 00 00 00 00 00 00 00  // ................
    0270: 16 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0280: 00 00 00 00 00 00 C2 17 00 00 00 00 00 00 C1 17  // ................
    0290: 00 00 00 00 1B 00 00 00 00 00 00 00 00 00 00 00  // ................
    02A0: 03 01 00 00 00 00 00 00 01 00 00 00 0C 19 00 00  // ................
    02B0: 00 00 00 00 00 00 A0 17 00 00 00 00 00 00 00 00  // ................
    02C0: 03 00 00 00 00 0E 10 00 00 00 00 B0 17 00 00 00  // ................
    02D0: 00 00 00 10 00 0D 18 00 00 00 00 00 00 00 00 A1  // ................
    02E0: 17 00 00 00 00 01 00 00 00 20 00 00 02           // ......... ...
