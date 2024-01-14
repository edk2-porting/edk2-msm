[000h 0000   4]                    Signature : "GTDT"    [Generic Timer Description Table]
[004h 0004   4]                 Table Length : 0000009C
[008h 0008   1]                     Revision : 02
[009h 0009   1]                     Checksum : 91
[00Ah 0010   6]                       Oem ID : "QCOM  "
[010h 0016   8]                 Oem Table ID : "QCOMEDK2"
[018h 0024   4]                 Oem Revision : 00006225
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20200925

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
[064h 0100   8]                Block Address : 000000000F120000
[06Ch 0108   4]                  Timer Count : 00000001
[070h 0112   4]                 Timer Offset : 00000014

[074h 0116   1]                 Frame Number : 00
[075h 0117   3]                     Reserved : 000000
[078h 0120   8]                 Base Address : 000000000F121000
[080h 0128   8]             EL0 Base Address : 000000000F122000
[088h 0136   4]              Timer Interrupt : 00000028
[08Ch 0140   4]  Timer Flags (decoded below) : 00000000
                                Trigger Mode : 0
                                    Polarity : 0
[090h 0144   4]      Virtual Timer Interrupt : 00000027
[094h 0148   4] Virtual Timer Flags (decoded below) : 00000000
                                Trigger Mode : 0
                                    Polarity : 0
[098h 0152   4] Common Flags (decoded below) : 00000002
                                      Secure : 0
                                   Always On : 1