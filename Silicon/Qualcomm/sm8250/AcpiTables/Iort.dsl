/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20211217 (32-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembly of ./Iort.acpi, Sat Oct 22 14:02:07 2022
 *
 * ACPI Data Table [IORT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000   4]                    Signature : "IORT"    [IO Remapping Table]
[004h 0004   4]                 Table Length : 00001332
[008h 0008   1]                     Revision : 00
[009h 0009   1]                     Checksum : 00     /* Incorrect checksum, should be BB */
[00Ah 0010   6]                       Oem ID : "QCOM  "
[010h 0016   8]                 Oem Table ID : "QCOMEDK2"
[018h 0024   4]                 Oem Revision : 00007280
[01Ch 0028   4]              Asl Compiler ID : "QCOM"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   4]                   Node Count : 00000012
[028h 0040   4]                  Node Offset : 00000030
[02Ch 0044   4]                     Reserved : 00000000

[030h 0048   1]                         Type : 03
[031h 0049   2]                       Length : 0314
[033h 0051   1]                     Revision : 00
[034h 0052   4]                     Reserved : 00000000
[038h 0056   4]                Mapping Count : 00000000
[03Ch 0060   4]               Mapping Offset : 00000000

[040h 0064   8]                 Base Address : 0000000015000000
[048h 0072   8]                         Span : 0000000000100000
[050h 0080   4]                        Model : 00000003
[054h 0084   4]        Flags (decoded below) : 00000000
                               DVM Supported : 0
                               Coherent Walk : 0
[058h 0088   4]      Global Interrupt Offset : 0000003C
[05Ch 0092   4]      Context Interrupt Count : 00000050
[060h 0096   4]     Context Interrupt Offset : 0000004C
[064h 0100   4]          PMU Interrupt Count : 00000009
[068h 0104   4]         PMU Interrupt Offset : 000002CC

[06Ch 0108   4]                      NSgIrpt : 00000061
[070h 0112   4] NSgIrpt Flags (decoded below) : 00000000
                              Edge Triggered : 0
[074h 0116   4]                   NSgCfgIrpt : 00000000
[078h 0120   4] NSgCfgIrpt Flags (decoded below) : 00000000
                              Edge Triggered : 0
[07Ch 0124   8]            Context Interrupt : 0000000100000080
[084h 0132   8]            Context Interrupt : 0000000100000081
[08Ch 0140   8]            Context Interrupt : 0000000100000082
[094h 0148   8]            Context Interrupt : 0000000100000083
[09Ch 0156   8]            Context Interrupt : 0000000100000084
[0A4h 0164   8]            Context Interrupt : 0000000100000085
[0ACh 0172   8]            Context Interrupt : 0000000100000086
[0B4h 0180   8]            Context Interrupt : 0000000100000087
[0BCh 0188   8]            Context Interrupt : 0000000100000088
[0C4h 0196   8]            Context Interrupt : 0000000100000089
[0CCh 0204   8]            Context Interrupt : 000000010000008A
[0D4h 0212   8]            Context Interrupt : 000000010000008B
[0DCh 0220   8]            Context Interrupt : 000000010000008C
[0E4h 0228   8]            Context Interrupt : 000000010000008D
[0ECh 0236   8]            Context Interrupt : 000000010000008E
[0F4h 0244   8]            Context Interrupt : 000000010000008F
[0FCh 0252   8]            Context Interrupt : 0000000100000090
[104h 0260   8]            Context Interrupt : 0000000100000091
[10Ch 0268   8]            Context Interrupt : 0000000100000092
[114h 0276   8]            Context Interrupt : 0000000100000093
[11Ch 0284   8]            Context Interrupt : 0000000100000094
[124h 0292   8]            Context Interrupt : 0000000100000095
[12Ch 0300   8]            Context Interrupt : 0000000100000096
[134h 0308   8]            Context Interrupt : 00000001000000D5
[13Ch 0316   8]            Context Interrupt : 00000001000000D6
[144h 0324   8]            Context Interrupt : 00000001000000D7
[14Ch 0332   8]            Context Interrupt : 00000001000000D8
[154h 0340   8]            Context Interrupt : 00000001000000D9
[15Ch 0348   8]            Context Interrupt : 00000001000000DA
[164h 0356   8]            Context Interrupt : 00000001000000DB
[16Ch 0364   8]            Context Interrupt : 00000001000000DC
[174h 0372   8]            Context Interrupt : 00000001000000DD
[17Ch 0380   8]            Context Interrupt : 00000001000000DE
[184h 0388   8]            Context Interrupt : 00000001000000DF
[18Ch 0396   8]            Context Interrupt : 00000001000000E0
[194h 0404   8]            Context Interrupt : 000000010000015B
[19Ch 0412   8]            Context Interrupt : 000000010000015C
[1A4h 0420   8]            Context Interrupt : 000000010000015D
[1ACh 0428   8]            Context Interrupt : 000000010000015E
[1B4h 0436   8]            Context Interrupt : 000000010000015F
[1BCh 0444   8]            Context Interrupt : 0000000100000160
[1C4h 0452   8]            Context Interrupt : 0000000100000161
[1CCh 0460   8]            Context Interrupt : 0000000100000162
[1D4h 0468   8]            Context Interrupt : 0000000100000163
[1DCh 0476   8]            Context Interrupt : 0000000100000164
[1E4h 0484   8]            Context Interrupt : 0000000100000165
[1ECh 0492   8]            Context Interrupt : 0000000100000166
[1F4h 0500   8]            Context Interrupt : 0000000100000167
[1FCh 0508   8]            Context Interrupt : 0000000100000168
[204h 0516   8]            Context Interrupt : 0000000100000169
[20Ch 0524   8]            Context Interrupt : 000000010000016A
[214h 0532   8]            Context Interrupt : 000000010000016B
[21Ch 0540   8]            Context Interrupt : 000000010000016C
[224h 0548   8]            Context Interrupt : 000000010000016D
[22Ch 0556   8]            Context Interrupt : 000000010000016E
[234h 0564   8]            Context Interrupt : 000000010000016F
[23Ch 0572   8]            Context Interrupt : 0000000100000170
[244h 0580   8]            Context Interrupt : 0000000100000171
[24Ch 0588   8]            Context Interrupt : 0000000100000172
[254h 0596   8]            Context Interrupt : 0000000100000173
[25Ch 0604   8]            Context Interrupt : 0000000100000174
[264h 0612   8]            Context Interrupt : 0000000100000175
[26Ch 0620   8]            Context Interrupt : 0000000100000176
[274h 0628   8]            Context Interrupt : 0000000100000177
[27Ch 0636   8]            Context Interrupt : 0000000100000178
[284h 0644   8]            Context Interrupt : 0000000100000179
[28Ch 0652   8]            Context Interrupt : 00000001000001AB
[294h 0660   8]            Context Interrupt : 00000001000001AC
[29Ch 0668   8]            Context Interrupt : 00000001000001AD
[2A4h 0676   8]            Context Interrupt : 00000001000001AE
[2ACh 0684   8]            Context Interrupt : 00000001000001AF
[2B4h 0692   8]            Context Interrupt : 00000001000001B0
[2BCh 0700   8]            Context Interrupt : 00000001000001B1
[2C4h 0708   8]            Context Interrupt : 00000001000001B2
[2CCh 0716   8]            Context Interrupt : 00000001000001B3
[2D4h 0724   8]            Context Interrupt : 00000001000001B4
[2DCh 0732   8]            Context Interrupt : 00000001000001B5
[2E4h 0740   8]            Context Interrupt : 00000001000001B6
[2ECh 0748   8]            Context Interrupt : 00000001000001B7
[2F4h 0756   8]            Context Interrupt : 00000001000001B8
[2FCh 0764   8]                PMU Interrupt : 0000000100000064
[304h 0772   8]                PMU Interrupt : 0000000100000065
[30Ch 0780   8]                PMU Interrupt : 0000000100000066
[314h 0788   8]                PMU Interrupt : 0000000100000067
[31Ch 0796   8]                PMU Interrupt : 0000000100000068
[324h 0804   8]                PMU Interrupt : 0000000100000069
[32Ch 0812   8]                PMU Interrupt : 000000010000007E
[334h 0820   8]                PMU Interrupt : 000000010000007F
[33Ch 0828   8]                PMU Interrupt : 00000001000001CA

[344h 0836   1]                         Type : 03
[345h 0837   2]                       Length : 00AC
[347h 0839   1]                     Revision : 00
[348h 0840   4]                     Reserved : 00000000
[34Ch 0844   4]                Mapping Count : 00000000
[350h 0848   4]               Mapping Offset : 00000000

[354h 0852   8]                 Base Address : 0000000003DA0000
[35Ch 0860   8]                         Span : 0000000000020000
[364h 0868   4]                        Model : 00000003
[368h 0872   4]        Flags (decoded below) : 00000000
                               DVM Supported : 0
                               Coherent Walk : 0
[36Ch 0876   4]      Global Interrupt Offset : 0000003C
[370h 0880   4]      Context Interrupt Count : 0000000A
[374h 0884   4]     Context Interrupt Offset : 0000004C
[378h 0888   4]          PMU Interrupt Count : 00000002
[37Ch 0892   4]         PMU Interrupt Offset : 0000009C

[380h 0896   4]                      NSgIrpt : 000002C1
[384h 0900   4] NSgIrpt Flags (decoded below) : 00000000
                              Edge Triggered : 0
[388h 0904   4]                   NSgCfgIrpt : 00000000
[38Ch 0908   4] NSgCfgIrpt Flags (decoded below) : 00000000
                              Edge Triggered : 0
[390h 0912   8]            Context Interrupt : 00000001000002C6
[398h 0920   8]            Context Interrupt : 00000001000002C7
[3A0h 0928   8]            Context Interrupt : 00000001000002C8
[3A8h 0936   8]            Context Interrupt : 00000001000002C9
[3B0h 0944   8]            Context Interrupt : 00000001000002CA
[3B8h 0952   8]            Context Interrupt : 00000001000002CB
[3C0h 0960   8]            Context Interrupt : 00000001000002CC
[3C8h 0968   8]            Context Interrupt : 00000001000002CD
[3D0h 0976   8]            Context Interrupt : 00000001000002CE
[3D8h 0984   8]            Context Interrupt : 00000001000002CF
[3E0h 0992   8]                PMU Interrupt : 00000001000002C4
[3E8h 1000   8]                PMU Interrupt : 00000001000002C5

[3F0h 1008   1]                         Type : 02
[3F1h 1009   2]                       Length : 0088
[3F3h 1011   1]                     Revision : 00
[3F4h 1012   4]                     Reserved : 00000000
[3F8h 1016   4]                Mapping Count : 00000005
[3FCh 1020   4]               Mapping Offset : 00000024

[400h 1024   8]            Memory Properties : [IORT Memory Access Properties]
[400h 1024   4]              Cache Coherency : 00000001
[404h 1028   1]        Hints (decoded below) : 00
                                   Transient : 0
                              Write Allocate : 0
                               Read Allocate : 0
                                    Override : 0
[405h 1029   2]                     Reserved : 0000
[407h 1031   1] Memory Flags (decoded below) : 01
                                   Coherency : 1
                            Device Attribute : 0
[408h 1032   4]                ATS Attribute : 00000000
[40Ch 1036   4]           PCI Segment Number : 00000000
[410h 1040   1]            Memory Size Limit : 24
[411h 1041   3]                     Reserved : 000000

[414h 1044   4]                   Input base : 87030000
[418h 1048   4]                     ID Count : 00000003
[41Ch 1052   4]                  Output Base : 00001C04
[420h 1056   4]             Output Reference : 00000030
[424h 1060   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[428h 1064   4]                   Input base : 87030004
[42Ch 1068   4]                     ID Count : 00000007
[430h 1072   4]                  Output Base : 00001C08
[434h 1076   4]             Output Reference : 00000030
[438h 1080   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[43Ch 1084   4]                   Input base : 8703000C
[440h 1088   4]                     ID Count : 0000000F
[444h 1092   4]                  Output Base : 00001C10
[448h 1096   4]             Output Reference : 00000030
[44Ch 1100   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[450h 1104   4]                   Input base : 8703001C
[454h 1108   4]                     ID Count : 0000001F
[458h 1112   4]                  Output Base : 00001C20
[45Ch 1116   4]             Output Reference : 00000030
[460h 1120   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[464h 1124   4]                   Input base : 8703003C
[468h 1128   4]                     ID Count : 0000003F
[46Ch 1132   4]                  Output Base : 00001C40
[470h 1136   4]             Output Reference : 00000030
[474h 1140   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[478h 1144   1]                         Type : 02
[479h 1145   2]                       Length : 009C
[47Bh 1147   1]                     Revision : 00
[47Ch 1148   4]                     Reserved : 00000000
[480h 1152   4]                Mapping Count : 00000006
[484h 1156   4]               Mapping Offset : 00000024

[488h 1160   8]            Memory Properties : [IORT Memory Access Properties]
[488h 1160   4]              Cache Coherency : 00000001
[48Ch 1164   1]        Hints (decoded below) : 00
                                   Transient : 0
                              Write Allocate : 0
                               Read Allocate : 0
                                    Override : 0
[48Dh 1165   2]                     Reserved : 0000
[48Fh 1167   1] Memory Flags (decoded below) : 01
                                   Coherency : 1
                            Device Attribute : 0
[490h 1168   4]                ATS Attribute : 00000000
[494h 1172   4]           PCI Segment Number : 00000001
[498h 1176   1]            Memory Size Limit : 24
[499h 1177   3]                     Reserved : 000000

[49Ch 1180   4]                   Input base : 87030100
[4A0h 1184   4]                     ID Count : 00000001
[4A4h 1188   4]                  Output Base : 00001C80
[4A8h 1192   4]             Output Reference : 00000030
[4ACh 1196   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[4B0h 1200   4]                   Input base : 87030102
[4B4h 1204   4]                     ID Count : 00000003
[4B8h 1208   4]                  Output Base : 00001C84
[4BCh 1212   4]             Output Reference : 00000030
[4C0h 1216   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[4C4h 1220   4]                   Input base : 87030106
[4C8h 1224   4]                     ID Count : 00000007
[4CCh 1228   4]                  Output Base : 00001C88
[4D0h 1232   4]             Output Reference : 00000030
[4D4h 1236   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[4D8h 1240   4]                   Input base : 87030110
[4DCh 1244   4]                     ID Count : 0000000F
[4E0h 1248   4]                  Output Base : 00001C90
[4E4h 1252   4]             Output Reference : 00000030
[4E8h 1256   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[4ECh 1260   4]                   Input base : 87030120
[4F0h 1264   4]                     ID Count : 0000001F
[4F4h 1268   4]                  Output Base : 00001CA0
[4F8h 1272   4]             Output Reference : 00000030
[4FCh 1276   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[500h 1280   4]                   Input base : 87030150
[504h 1284   4]                     ID Count : 0000003F
[508h 1288   4]                  Output Base : 00001CC0
[50Ch 1292   4]             Output Reference : 00000030
[510h 1296   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[514h 1300   1]                         Type : 01
[515h 1301   2]                       Length : 035D
[517h 1303   1]                     Revision : 00
[518h 1304   4]                     Reserved : 00000000
[51Ch 1308   4]                Mapping Count : 00000028
[520h 1312   4]               Mapping Offset : 0000003D

[524h 1316   4]                   Node Flags : 00000000
[528h 1320   8]            Memory Properties : [IORT Memory Access Properties]
[528h 1320   4]              Cache Coherency : 00000000
[52Ch 1324   1]        Hints (decoded below) : 00
                                   Transient : 0
                              Write Allocate : 0
                               Read Allocate : 0
                                    Override : 0
[52Dh 1325   2]                     Reserved : 0000
[52Fh 1327   1] Memory Flags (decoded below) : 00
                                   Coherency : 0
                            Device Attribute : 0
[530h 1328   1]            Memory Size Limit : 30
[531h 1329  10]                  Device Name : "\_SB.GPU0"
[53Bh 1339  22]                      Padding : 49 4F 52 54 32 13 00 00 00 00 51 43 4F 4D 20 20 /* IORT2.....QCOM   */\
/* 54Bh 1355   6 */                            51 43 4F 4D 45 44                               /* QCOMED */\

[551h 1361   4]                   Input base : 030A0000
[555h 1365   4]                     ID Count : 00000000
[559h 1369   4]                  Output Base : 00000002
[55Dh 1373   4]             Output Reference : 00000344
[561h 1377   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[565h 1381   4]                   Input base : 030A0001
[569h 1385   4]                     ID Count : 00000000
[56Dh 1389   4]                  Output Base : 00000402
[571h 1393   4]             Output Reference : 00000344
[575h 1397   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[579h 1401   4]                   Input base : 03030000
[57Dh 1405   4]                     ID Count : 00000000
[581h 1409   4]                  Output Base : 00000000
[585h 1413   4]             Output Reference : 00000344
[589h 1417   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[58Dh 1421   4]                   Input base : 03030001
[591h 1425   4]                     ID Count : 00000000
[595h 1429   4]                  Output Base : 00000400
[599h 1433   4]             Output Reference : 00000344
[59Dh 1437   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[5A1h 1441   4]                   Input base : 03030002
[5A5h 1445   4]                     ID Count : 00000000
[5A9h 1449   4]                  Output Base : 00000004
[5ADh 1453   4]             Output Reference : 00000344
[5B1h 1457   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[5B5h 1461   4]                   Input base : 03030003
[5B9h 1465   4]                     ID Count : 00000000
[5BDh 1469   4]                  Output Base : 00000404
[5C1h 1473   4]             Output Reference : 00000344
[5C5h 1477   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[5C9h 1481   4]                   Input base : 03030004
[5CDh 1485   4]                     ID Count : 00000000
[5D1h 1489   4]                  Output Base : 00000005
[5D5h 1493   4]             Output Reference : 00000344
[5D9h 1497   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[5DDh 1501   4]                   Input base : 03030005
[5E1h 1505   4]                     ID Count : 00000000
[5E5h 1509   4]                  Output Base : 00000405
[5E9h 1513   4]             Output Reference : 00000344
[5EDh 1517   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[5F1h 1521   4]                   Input base : 03030006
[5F5h 1525   4]                     ID Count : 00000000
[5F9h 1529   4]                  Output Base : 00000001
[5FDh 1533   4]             Output Reference : 00000344
[601h 1537   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[605h 1541   4]                   Input base : 03030007
[609h 1545   4]                     ID Count : 00000000
[60Dh 1549   4]                  Output Base : 00000401
[611h 1553   4]             Output Reference : 00000344
[615h 1557   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[619h 1561   4]                   Input base : 00030000
[61Dh 1565   4]                     ID Count : 00000000
[621h 1569   4]                  Output Base : 00000900
[625h 1573   4]             Output Reference : 00000030
[629h 1577   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[62Dh 1581   4]                   Input base : 00030001
[631h 1585   4]                     ID Count : 00000000
[635h 1589   4]                  Output Base : 00000902
[639h 1593   4]             Output Reference : 00000030
[63Dh 1597   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[641h 1601   4]                   Input base : 00030002
[645h 1605   4]                     ID Count : 00000000
[649h 1609   4]                  Output Base : 00000D00
[64Dh 1613   4]             Output Reference : 00000030
[651h 1617   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[655h 1621   4]                   Input base : 00030003
[659h 1625   4]                     ID Count : 00000000
[65Dh 1629   4]                  Output Base : 00000D02
[661h 1633   4]             Output Reference : 00000030
[665h 1637   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[669h 1641   4]                   Input base : 000A0000
[66Dh 1645   4]                     ID Count : 00000000
[671h 1649   4]                  Output Base : 00000901
[675h 1653   4]             Output Reference : 00000030
[679h 1657   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[67Dh 1661   4]                   Input base : 000A0001
[681h 1665   4]                     ID Count : 00000000
[685h 1669   4]                  Output Base : 00000D01
[689h 1673   4]             Output Reference : 00000030
[68Dh 1677   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[691h 1681   4]                   Input base : 06030000
[695h 1685   4]                     ID Count : 00000000
[699h 1689   4]                  Output Base : 000029DC
[69Dh 1693   4]             Output Reference : 00000030
[6A1h 1697   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[6A5h 1701   4]                   Input base : 06030001
[6A9h 1705   4]                     ID Count : 00000000
[6ADh 1709   4]                  Output Base : 00002DDC
[6B1h 1713   4]             Output Reference : 00000030
[6B5h 1717   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[6B9h 1721   4]                   Input base : 06030002
[6BDh 1725   4]                     ID Count : 00000000
[6C1h 1729   4]                  Output Base : 000029FC
[6C5h 1733   4]             Output Reference : 00000030
[6C9h 1737   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[6CDh 1741   4]                   Input base : 06030003
[6D1h 1745   4]                     ID Count : 00000000
[6D5h 1749   4]                  Output Base : 00002DFC
[6D9h 1753   4]             Output Reference : 00000030
[6DDh 1757   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[6E1h 1761   4]                   Input base : 060A0000
[6E5h 1765   4]                     ID Count : 00000000
[6E9h 1769   4]                  Output Base : 000029DD
[6EDh 1773   4]             Output Reference : 00000030
[6F1h 1777   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[6F5h 1781   4]                   Input base : 060A0001
[6F9h 1785   4]                     ID Count : 00000000
[6FDh 1789   4]                  Output Base : 00002DDD
[701h 1793   4]             Output Reference : 00000030
[705h 1797   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[709h 1801   4]                   Input base : 060A0002
[70Dh 1805   4]                     ID Count : 00000000
[711h 1809   4]                  Output Base : 000029FD
[715h 1813   4]             Output Reference : 00000030
[719h 1817   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[71Dh 1821   4]                   Input base : 060A0003
[721h 1825   4]                     ID Count : 00000000
[725h 1829   4]                  Output Base : 00002DFD
[729h 1833   4]             Output Reference : 00000030
[72Dh 1837   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[731h 1841   4]                   Input base : 0C030000
[735h 1845   4]                     ID Count : 00000001
[739h 1849   4]                  Output Base : 000004E6
[73Dh 1853   4]             Output Reference : 00000030
[741h 1857   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[745h 1861   4]                   Input base : 0C030002
[749h 1865   4]                     ID Count : 00000000
[74Dh 1869   4]                  Output Base : 000004F2
[751h 1873   4]             Output Reference : 00000030
[755h 1877   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[759h 1881   4]                   Input base : 0C030003
[75Dh 1885   4]                     ID Count : 00000001
[761h 1889   4]                  Output Base : 000004F6
[765h 1893   4]             Output Reference : 00000030
[769h 1897   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[76Dh 1901   4]                   Input base : 0C030005
[771h 1905   4]                     ID Count : 00000001
[775h 1909   4]                  Output Base : 000004F8
[779h 1913   4]             Output Reference : 00000030
[77Dh 1917   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[781h 1921   4]                   Input base : 0C030007
[785h 1925   4]                     ID Count : 00000000
[789h 1929   4]                  Output Base : 000004FF
[78Dh 1933   4]             Output Reference : 00000030
[791h 1937   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[795h 1941   4]                   Input base : 0C090000
[799h 1945   4]                     ID Count : 00000000
[79Dh 1949   4]                  Output Base : 000004F3
[7A1h 1953   4]             Output Reference : 00000030
[7A5h 1957   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[7A9h 1961   4]                   Input base : 0C090001
[7ADh 1965   4]                     ID Count : 00000001
[7B1h 1969   4]                  Output Base : 000004FC
[7B5h 1973   4]             Output Reference : 00000030
[7B9h 1977   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[7BDh 1981   4]                   Input base : 0C090003
[7C1h 1985   4]                     ID Count : 00000000
[7C5h 1989   4]                  Output Base : 000004FE
[7C9h 1993   4]             Output Reference : 00000030
[7CDh 1997   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[7D1h 2001   4]                   Input base : 04030000
[7D5h 2005   4]                     ID Count : 00000000
[7D9h 2009   4]                  Output Base : 00002180
[7DDh 2013   4]             Output Reference : 00000030
[7E1h 2017   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[7E5h 2021   4]                   Input base : 04030001
[7E9h 2025   4]                     ID Count : 00000000
[7EDh 2029   4]                  Output Base : 000021A0
[7F1h 2033   4]             Output Reference : 00000030
[7F5h 2037   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[7F9h 2041   4]                   Input base : 04030002
[7FDh 2045   4]                     ID Count : 00000000
[801h 2049   4]                  Output Base : 00002187
[805h 2053   4]             Output Reference : 00000030
[809h 2057   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[80Dh 2061   4]                   Input base : 04090000
[811h 2065   4]                     ID Count : 00000000
[815h 2069   4]                  Output Base : 00002181
[819h 2073   4]             Output Reference : 00000030
[81Dh 2077   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[821h 2081   4]                   Input base : 04090001
[825h 2085   4]                     ID Count : 00000000
[829h 2089   4]                  Output Base : 00002185
[82Dh 2093   4]             Output Reference : 00000030
[831h 2097   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[835h 2101   4]                   Input base : 040A0000
[839h 2105   4]                     ID Count : 00000000
[83Dh 2109   4]                  Output Base : 00002183
[841h 2113   4]             Output Reference : 00000030
[845h 2117   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[849h 2121   4]                   Input base : 040B0000
[84Dh 2125   4]                     ID Count : 00000000
[851h 2129   4]                  Output Base : 00002184
[855h 2133   4]             Output Reference : 00000030
[859h 2137   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[85Dh 2141   4]                   Input base : 040B0001
[861h 2145   4]                     ID Count : 00000000
[865h 2149   4]                  Output Base : 000021A4
[869h 2153   4]             Output Reference : 00000030
[86Dh 2157   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[871h 2161   1]                         Type : 01
[872h 2162   2]                       Length : 0065
[874h 2164   1]                     Revision : 00
[875h 2165   4]                     Reserved : 00000000
[879h 2169   4]                Mapping Count : 00000002
[87Dh 2173   4]               Mapping Offset : 0000003D

[881h 2177   4]                   Node Flags : 00000000
[885h 2181   8]            Memory Properties : [IORT Memory Access Properties]
[885h 2181   4]              Cache Coherency : 00000000
[889h 2185   1]        Hints (decoded below) : 00
                                   Transient : 0
                              Write Allocate : 0
                               Read Allocate : 0
                                    Override : 0
[88Ah 2186   2]                     Reserved : 0000
[88Ch 2188   1] Memory Flags (decoded below) : 00
                                   Coherency : 0
                            Device Attribute : 0
[88Dh 2189   1]            Memory Size Limit : 24
[88Eh 2190  10]                  Device Name : "\_SB.JPGE"
[898h 2200  22]                      Padding : 49 4F 52 54 32 13 00 00 00 00 51 43 4F 4D 20 20 /* IORT2.....QCOM   */\
/* 8A8h 2216   6 */                            51 43 4F 4D 45 44                               /* QCOMED */\

[8AEh 2222   4]                   Input base : 02030000
[8B2h 2226   4]                     ID Count : 00000000
[8B6h 2230   4]                  Output Base : 000020C0
[8BAh 2234   4]             Output Reference : 00000030
[8BEh 2238   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[8C2h 2242   4]                   Input base : 02030001
[8C6h 2246   4]                     ID Count : 00000000
[8CAh 2250   4]                  Output Base : 000020E0
[8CEh 2254   4]             Output Reference : 00000030
[8D2h 2258   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[8D6h 2262   1]                         Type : 01
[8D7h 2263   2]                       Length : 0489
[8D9h 2265   1]                     Revision : 00
[8DAh 2266   4]                     Reserved : 00000000
[8DEh 2270   4]                Mapping Count : 00000037
[8E2h 2274   4]               Mapping Offset : 0000003D

[8E6h 2278   4]                   Node Flags : 00000000
[8EAh 2282   8]            Memory Properties : [IORT Memory Access Properties]
[8EAh 2282   4]              Cache Coherency : 00000000
[8EEh 2286   1]        Hints (decoded below) : 00
                                   Transient : 0
                              Write Allocate : 0
                               Read Allocate : 0
                                    Override : 0
[8EFh 2287   2]                     Reserved : 0000
[8F1h 2289   1] Memory Flags (decoded below) : 00
                                   Coherency : 0
                            Device Attribute : 0
[8F2h 2290   1]            Memory Size Limit : 24
[8F3h 2291  10]                  Device Name : "\_SB.ARPC"
[8FDh 2301  22]                      Padding : 49 4F 52 54 32 13 00 00 00 00 51 43 4F 4D 20 20 /* IORT2.....QCOM   */\
/* 90Dh 2317   6 */                            51 43 4F 4D 45 44                               /* QCOMED */\

[913h 2323   4]                   Input base : 17030034
[917h 2327   4]                     ID Count : 00000000
[91Bh 2331   4]                  Output Base : 00001803
[91Fh 2335   4]             Output Reference : 00000030
[923h 2339   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[927h 2343   4]                   Input base : 17030035
[92Bh 2347   4]                     ID Count : 00000000
[92Fh 2351   4]                  Output Base : 00001804
[933h 2355   4]             Output Reference : 00000030
[937h 2359   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[93Bh 2363   4]                   Input base : 17030036
[93Fh 2367   4]                     ID Count : 00000000
[943h 2371   4]                  Output Base : 00001805
[947h 2375   4]             Output Reference : 00000030
[94Bh 2379   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[94Fh 2383   4]                   Input base : 17030000
[953h 2387   4]                     ID Count : 00000000
[957h 2391   4]                  Output Base : 00001181
[95Bh 2395   4]             Output Reference : 00000030
[95Fh 2399   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[963h 2403   4]                   Input base : 17030001
[967h 2407   4]                     ID Count : 00000000
[96Bh 2411   4]                  Output Base : 000011A1
[96Fh 2415   4]             Output Reference : 00000030
[973h 2419   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[977h 2423   4]                   Input base : 17030002
[97Bh 2427   4]                     ID Count : 00000000
[97Fh 2431   4]                  Output Base : 00001581
[983h 2435   4]             Output Reference : 00000030
[987h 2439   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[98Bh 2443   4]                   Input base : 17030003
[98Fh 2447   4]                     ID Count : 00000000
[993h 2451   4]                  Output Base : 000015A1
[997h 2455   4]             Output Reference : 00000030
[99Bh 2459   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[99Fh 2463   4]                   Input base : 17030004
[9A3h 2467   4]                     ID Count : 00000000
[9A7h 2471   4]                  Output Base : 00001182
[9ABh 2475   4]             Output Reference : 00000030
[9AFh 2479   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[9B3h 2483   4]                   Input base : 17030005
[9B7h 2487   4]                     ID Count : 00000000
[9BBh 2491   4]                  Output Base : 000011A2
[9BFh 2495   4]             Output Reference : 00000030
[9C3h 2499   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[9C7h 2503   4]                   Input base : 17030006
[9CBh 2507   4]                     ID Count : 00000000
[9CFh 2511   4]                  Output Base : 00001582
[9D3h 2515   4]             Output Reference : 00000030
[9D7h 2519   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[9DBh 2523   4]                   Input base : 17030007
[9DFh 2527   4]                     ID Count : 00000000
[9E3h 2531   4]                  Output Base : 000015A2
[9E7h 2535   4]             Output Reference : 00000030
[9EBh 2539   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[9EFh 2543   4]                   Input base : 17030008
[9F3h 2547   4]                     ID Count : 00000000
[9F7h 2551   4]                  Output Base : 00001183
[9FBh 2555   4]             Output Reference : 00000030
[9FFh 2559   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[A03h 2563   4]                   Input base : 17030009
[A07h 2567   4]                     ID Count : 00000000
[A0Bh 2571   4]                  Output Base : 000011A3
[A0Fh 2575   4]             Output Reference : 00000030
[A13h 2579   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[A17h 2583   4]                   Input base : 1703000A
[A1Bh 2587   4]                     ID Count : 00000000
[A1Fh 2591   4]                  Output Base : 00001583
[A23h 2595   4]             Output Reference : 00000030
[A27h 2599   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[A2Bh 2603   4]                   Input base : 1703000B
[A2Fh 2607   4]                     ID Count : 00000000
[A33h 2611   4]                  Output Base : 000015A3
[A37h 2615   4]             Output Reference : 00000030
[A3Bh 2619   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[A3Fh 2623   4]                   Input base : 1703000C
[A43h 2627   4]                     ID Count : 00000000
[A47h 2631   4]                  Output Base : 00001184
[A4Bh 2635   4]             Output Reference : 00000030
[A4Fh 2639   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[A53h 2643   4]                   Input base : 1703000D
[A57h 2647   4]                     ID Count : 00000000
[A5Bh 2651   4]                  Output Base : 000011A4
[A5Fh 2655   4]             Output Reference : 00000030
[A63h 2659   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[A67h 2663   4]                   Input base : 1703000E
[A6Bh 2667   4]                     ID Count : 00000000
[A6Fh 2671   4]                  Output Base : 00001584
[A73h 2675   4]             Output Reference : 00000030
[A77h 2679   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[A7Bh 2683   4]                   Input base : 1703000F
[A7Fh 2687   4]                     ID Count : 00000000
[A83h 2691   4]                  Output Base : 000015A4
[A87h 2695   4]             Output Reference : 00000030
[A8Bh 2699   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[A8Fh 2703   4]                   Input base : 17030010
[A93h 2707   4]                     ID Count : 00000000
[A97h 2711   4]                  Output Base : 00001185
[A9Bh 2715   4]             Output Reference : 00000030
[A9Fh 2719   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[AA3h 2723   4]                   Input base : 17030011
[AA7h 2727   4]                     ID Count : 00000000
[AABh 2731   4]                  Output Base : 000011A5
[AAFh 2735   4]             Output Reference : 00000030
[AB3h 2739   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[AB7h 2743   4]                   Input base : 17030012
[ABBh 2747   4]                     ID Count : 00000000
[ABFh 2751   4]                  Output Base : 00001585
[AC3h 2755   4]             Output Reference : 00000030
[AC7h 2759   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[ACBh 2763   4]                   Input base : 17030013
[ACFh 2767   4]                     ID Count : 00000000
[AD3h 2771   4]                  Output Base : 000015A5
[AD7h 2775   4]             Output Reference : 00000030
[ADBh 2779   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[ADFh 2783   4]                   Input base : 17030014
[AE3h 2787   4]                     ID Count : 00000000
[AE7h 2791   4]                  Output Base : 00001186
[AEBh 2795   4]             Output Reference : 00000030
[AEFh 2799   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[AF3h 2803   4]                   Input base : 17030015
[AF7h 2807   4]                     ID Count : 00000000
[AFBh 2811   4]                  Output Base : 000011A6
[AFFh 2815   4]             Output Reference : 00000030
[B03h 2819   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[B07h 2823   4]                   Input base : 17030016
[B0Bh 2827   4]                     ID Count : 00000000
[B0Fh 2831   4]                  Output Base : 00001586
[B13h 2835   4]             Output Reference : 00000030
[B17h 2839   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[B1Bh 2843   4]                   Input base : 17030017
[B1Fh 2847   4]                     ID Count : 00000000
[B23h 2851   4]                  Output Base : 000015A6
[B27h 2855   4]             Output Reference : 00000030
[B2Bh 2859   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[B2Fh 2863   4]                   Input base : 17030018
[B33h 2867   4]                     ID Count : 00000000
[B37h 2871   4]                  Output Base : 00001187
[B3Bh 2875   4]             Output Reference : 00000030
[B3Fh 2879   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[B43h 2883   4]                   Input base : 17030019
[B47h 2887   4]                     ID Count : 00000000
[B4Bh 2891   4]                  Output Base : 000011A7
[B4Fh 2895   4]             Output Reference : 00000030
[B53h 2899   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[B57h 2903   4]                   Input base : 1703001A
[B5Bh 2907   4]                     ID Count : 00000000
[B5Fh 2911   4]                  Output Base : 00001587
[B63h 2915   4]             Output Reference : 00000030
[B67h 2919   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[B6Bh 2923   4]                   Input base : 1703001B
[B6Fh 2927   4]                     ID Count : 00000000
[B73h 2931   4]                  Output Base : 000015A7
[B77h 2935   4]             Output Reference : 00000030
[B7Bh 2939   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[B7Fh 2943   4]                   Input base : 1703001C
[B83h 2947   4]                     ID Count : 00000000
[B87h 2951   4]                  Output Base : 00001188
[B8Bh 2955   4]             Output Reference : 00000030
[B8Fh 2959   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[B93h 2963   4]                   Input base : 1703001D
[B97h 2967   4]                     ID Count : 00000000
[B9Bh 2971   4]                  Output Base : 000011A8
[B9Fh 2975   4]             Output Reference : 00000030
[BA3h 2979   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[BA7h 2983   4]                   Input base : 1703001E
[BABh 2987   4]                     ID Count : 00000000
[BAFh 2991   4]                  Output Base : 00001588
[BB3h 2995   4]             Output Reference : 00000030
[BB7h 2999   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[BBBh 3003   4]                   Input base : 1703001F
[BBFh 3007   4]                     ID Count : 00000000
[BC3h 3011   4]                  Output Base : 000015A8
[BC7h 3015   4]             Output Reference : 00000030
[BCBh 3019   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[BCFh 3023   4]                   Input base : 17030020
[BD3h 3027   4]                     ID Count : 00000000
[BD7h 3031   4]                  Output Base : 0000118B
[BDBh 3035   4]             Output Reference : 00000030
[BDFh 3039   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[BE3h 3043   4]                   Input base : 17030021
[BE7h 3047   4]                     ID Count : 00000000
[BEBh 3051   4]                  Output Base : 000011AB
[BEFh 3055   4]             Output Reference : 00000030
[BF3h 3059   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[BF7h 3063   4]                   Input base : 17030022
[BFBh 3067   4]                     ID Count : 00000000
[BFFh 3071   4]                  Output Base : 0000158B
[C03h 3075   4]             Output Reference : 00000030
[C07h 3079   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[C0Bh 3083   4]                   Input base : 17030023
[C0Fh 3087   4]                     ID Count : 00000000
[C13h 3091   4]                  Output Base : 000015AB
[C17h 3095   4]             Output Reference : 00000030
[C1Bh 3099   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[C1Fh 3103   4]                   Input base : 17030024
[C23h 3107   4]                     ID Count : 00000000
[C27h 3111   4]                  Output Base : 0000118C
[C2Bh 3115   4]             Output Reference : 00000030
[C2Fh 3119   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[C33h 3123   4]                   Input base : 17030025
[C37h 3127   4]                     ID Count : 00000000
[C3Bh 3131   4]                  Output Base : 000011AC
[C3Fh 3135   4]             Output Reference : 00000030
[C43h 3139   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[C47h 3143   4]                   Input base : 17030026
[C4Bh 3147   4]                     ID Count : 00000000
[C4Fh 3151   4]                  Output Base : 0000158C
[C53h 3155   4]             Output Reference : 00000030
[C57h 3159   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[C5Bh 3163   4]                   Input base : 17030027
[C5Fh 3167   4]                     ID Count : 00000000
[C63h 3171   4]                  Output Base : 000015AC
[C67h 3175   4]             Output Reference : 00000030
[C6Bh 3179   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[C6Fh 3183   4]                   Input base : 17030028
[C73h 3187   4]                     ID Count : 00000000
[C77h 3191   4]                  Output Base : 0000118D
[C7Bh 3195   4]             Output Reference : 00000030
[C7Fh 3199   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[C83h 3203   4]                   Input base : 17030029
[C87h 3207   4]                     ID Count : 00000000
[C8Bh 3211   4]                  Output Base : 000011AD
[C8Fh 3215   4]             Output Reference : 00000030
[C93h 3219   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[C97h 3223   4]                   Input base : 1703002A
[C9Bh 3227   4]                     ID Count : 00000000
[C9Fh 3231   4]                  Output Base : 0000158D
[CA3h 3235   4]             Output Reference : 00000030
[CA7h 3239   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[CABh 3243   4]                   Input base : 1703002B
[CAFh 3247   4]                     ID Count : 00000000
[CB3h 3251   4]                  Output Base : 000015AD
[CB7h 3255   4]             Output Reference : 00000030
[CBBh 3259   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[CBFh 3263   4]                   Input base : 1703002C
[CC3h 3267   4]                     ID Count : 00000000
[CC7h 3271   4]                  Output Base : 0000118E
[CCBh 3275   4]             Output Reference : 00000030
[CCFh 3279   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[CD3h 3283   4]                   Input base : 1703002D
[CD7h 3287   4]                     ID Count : 00000000
[CDBh 3291   4]                  Output Base : 000011AE
[CDFh 3295   4]             Output Reference : 00000030
[CE3h 3299   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[CE7h 3303   4]                   Input base : 1703002E
[CEBh 3307   4]                     ID Count : 00000000
[CEFh 3311   4]                  Output Base : 0000158E
[CF3h 3315   4]             Output Reference : 00000030
[CF7h 3319   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[CFBh 3323   4]                   Input base : 1703002F
[CFFh 3327   4]                     ID Count : 00000000
[D03h 3331   4]                  Output Base : 000015AE
[D07h 3335   4]             Output Reference : 00000030
[D0Bh 3339   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[D0Fh 3343   4]                   Input base : 17030030
[D13h 3347   4]                     ID Count : 00000000
[D17h 3351   4]                  Output Base : 0000118F
[D1Bh 3355   4]             Output Reference : 00000030
[D1Fh 3359   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[D23h 3363   4]                   Input base : 17030031
[D27h 3367   4]                     ID Count : 00000000
[D2Bh 3371   4]                  Output Base : 000011AF
[D2Fh 3375   4]             Output Reference : 00000030
[D33h 3379   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[D37h 3383   4]                   Input base : 17030032
[D3Bh 3387   4]                     ID Count : 00000000
[D3Fh 3391   4]                  Output Base : 0000158F
[D43h 3395   4]             Output Reference : 00000030
[D47h 3399   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[D4Bh 3403   4]                   Input base : 17030033
[D4Fh 3407   4]                     ID Count : 00000000
[D53h 3411   4]                  Output Base : 000015AF
[D57h 3415   4]             Output Reference : 00000030
[D5Bh 3419   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[D5Fh 3423   1]                         Type : 01
[D60h 3424   2]                       Length : 00A1
[D62h 3426   1]                     Revision : 00
[D63h 3427   4]                     Reserved : 00000000
[D67h 3431   4]                Mapping Count : 00000005
[D6Bh 3435   4]               Mapping Offset : 0000003D

[D6Fh 3439   4]                   Node Flags : 00000000
[D73h 3443   8]            Memory Properties : [IORT Memory Access Properties]
[D73h 3443   4]              Cache Coherency : 00000000
[D77h 3447   1]        Hints (decoded below) : 00
                                   Transient : 0
                              Write Allocate : 0
                               Read Allocate : 0
                                    Override : 0
[D78h 3448   2]                     Reserved : 0000
[D7Ah 3450   1] Memory Flags (decoded below) : 00
                                   Coherency : 0
                            Device Attribute : 0
[D7Bh 3451   1]            Memory Size Limit : 24
[D7Ch 3452   9]                  Device Name : "\_SB.IPA"
[D85h 3461  23]                      Padding : 49 4F 52 54 32 13 00 00 00 00 51 43 4F 4D 20 20 /* IORT2.....QCOM   */\
/* D95h 3477   7 */                            51 43 4F 4D 45 44 4B                            /* QCOMEDK */\

[D9Ch 3484   4]                   Input base : 0B030000
[DA0h 3488   4]                     ID Count : 00000000
[DA4h 3492   4]                  Output Base : 00000480
[DA8h 3496   4]             Output Reference : 00000030
[DACh 3500   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[DB0h 3504   4]                   Input base : 0B030001
[DB4h 3508   4]                     ID Count : 00000000
[DB8h 3512   4]                  Output Base : 00000481
[DBCh 3516   4]             Output Reference : 00000030
[DC0h 3520   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[DC4h 3524   4]                   Input base : 0B030002
[DC8h 3528   4]                     ID Count : 00000000
[DCCh 3532   4]                  Output Base : 00000482
[DD0h 3536   4]             Output Reference : 00000030
[DD4h 3540   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[DD8h 3544   4]                   Input base : 0B030003
[DDCh 3548   4]                     ID Count : 00000000
[DE0h 3552   4]                  Output Base : 00000483
[DE4h 3556   4]             Output Reference : 00000030
[DE8h 3560   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[DECh 3564   4]                   Input base : 0B030004
[DF0h 3568   4]                     ID Count : 00000000
[DF4h 3572   4]                  Output Base : 00000484
[DF8h 3576   4]             Output Reference : 00000030
[DFCh 3580   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[E00h 3584   1]                         Type : 01
[E01h 3585   2]                       Length : 0051
[E03h 3587   1]                     Revision : 00
[E04h 3588   4]                     Reserved : 00000000
[E08h 3592   4]                Mapping Count : 00000001
[E0Ch 3596   4]               Mapping Offset : 0000003D

[E10h 3600   4]                   Node Flags : 00000000
[E14h 3604   8]            Memory Properties : [IORT Memory Access Properties]
[E14h 3604   4]              Cache Coherency : 00000000
[E18h 3608   1]        Hints (decoded below) : 00
                                   Transient : 0
                              Write Allocate : 0
                               Read Allocate : 0
                                    Override : 0
[E19h 3609   2]                     Reserved : 0000
[E1Bh 3611   1] Memory Flags (decoded below) : 00
                                   Coherency : 0
                            Device Attribute : 0
[E1Ch 3612   1]            Memory Size Limit : 24
[E1Dh 3613  10]                  Device Name : "\_SB.USBA"
[E27h 3623  22]                      Padding : 49 4F 52 54 32 13 00 00 00 00 51 43 4F 4D 20 20 /* IORT2.....QCOM   */\
/* E37h 3639   6 */                            51 43 4F 4D 45 44                               /* QCOMED */\

[E3Dh 3645   4]                   Input base : 07030002
[E41h 3649   4]                     ID Count : 00000000
[E45h 3653   4]                  Output Base : 0000180F
[E49h 3657   4]             Output Reference : 00000030
[E4Dh 3661   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[E51h 3665   1]                         Type : 01
[E52h 3666   2]                       Length : 0065
[E54h 3668   1]                     Revision : 00
[E55h 3669   4]                     Reserved : 00000000
[E59h 3673   4]                Mapping Count : 00000002
[E5Dh 3677   4]               Mapping Offset : 0000003D

[E61h 3681   4]                   Node Flags : 00000000
[E65h 3685   8]            Memory Properties : [IORT Memory Access Properties]
[E65h 3685   4]              Cache Coherency : 00000000
[E69h 3689   1]        Hints (decoded below) : 00
                                   Transient : 0
                              Write Allocate : 0
                               Read Allocate : 0
                                    Override : 0
[E6Ah 3690   2]                     Reserved : 0000
[E6Ch 3692   1] Memory Flags (decoded below) : 00
                                   Coherency : 0
                            Device Attribute : 0
[E6Dh 3693   1]            Memory Size Limit : 24
[E6Eh 3694  10]                  Device Name : "\_SB.QDSS"
[E78h 3704  22]                      Padding : 49 4F 52 54 32 13 00 00 00 00 51 43 4F 4D 20 20 /* IORT2.....QCOM   */\
/* E88h 3720   6 */                            51 43 4F 4D 45 44                               /* QCOMED */\

[E8Eh 3726   4]                   Input base : 19030000
[E92h 3730   4]                     ID Count : 00000000
[E96h 3734   4]                  Output Base : 000004A0
[E9Ah 3738   4]             Output Reference : 00000030
[E9Eh 3742   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[EA2h 3746   4]                   Input base : 19030001
[EA6h 3750   4]                     ID Count : 00000000
[EAAh 3754   4]                  Output Base : 000004C0
[EAEh 3758   4]             Output Reference : 00000030
[EB2h 3762   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[EB6h 3766   1]                         Type : 01
[EB7h 3767   2]                       Length : 0051
[EB9h 3769   1]                     Revision : 00
[EBAh 3770   4]                     Reserved : 00000000
[EBEh 3774   4]                Mapping Count : 00000001
[EC2h 3778   4]               Mapping Offset : 0000003D

[EC6h 3782   4]                   Node Flags : 00000000
[ECAh 3786   8]            Memory Properties : [IORT Memory Access Properties]
[ECAh 3786   4]              Cache Coherency : 00000000
[ECEh 3790   1]        Hints (decoded below) : 00
                                   Transient : 0
                              Write Allocate : 0
                               Read Allocate : 0
                                    Override : 0
[ECFh 3791   2]                     Reserved : 0000
[ED1h 3793   1] Memory Flags (decoded below) : 00
                                   Coherency : 0
                            Device Attribute : 0
[ED2h 3794   1]            Memory Size Limit : 24
[ED3h 3795  15]                  Device Name : "\_SB.ADSP.ADCM"
[EE2h 3810  17]                      Padding : 49 4F 52 54 32 13 00 00 00 00 51 43 4F 4D 20 20 /* IORT2.....QCOM   */\
/* EF2h 3826   1 */                            51                                              /* Q */\

[EF3h 3827   4]                   Input base : 07030000
[EF7h 3831   4]                     ID Count : 00000000
[EFBh 3835   4]                  Output Base : 00001801
[EFFh 3839   4]             Output Reference : 00000030
[F03h 3843   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[F07h 3847   1]                         Type : 01
[F08h 3848   2]                       Length : 0051
[F0Ah 3850   1]                     Revision : 00
[F0Bh 3851   4]                     Reserved : 00000000
[F0Fh 3855   4]                Mapping Count : 00000001
[F13h 3859   4]               Mapping Offset : 0000003D

[F17h 3863   4]                   Node Flags : 00000000
[F1Bh 3867   8]            Memory Properties : [IORT Memory Access Properties]
[F1Bh 3867   4]              Cache Coherency : 00000000
[F1Fh 3871   1]        Hints (decoded below) : 00
                                   Transient : 0
                              Write Allocate : 0
                               Read Allocate : 0
                                    Override : 0
[F20h 3872   2]                     Reserved : 0000
[F22h 3874   1] Memory Flags (decoded below) : 00
                                   Coherency : 0
                            Device Attribute : 0
[F23h 3875   1]            Memory Size Limit : 24
[F24h 3876  10]                  Device Name : "\_SB.SDC1"
[F2Eh 3886  22]                      Padding : 49 4F 52 54 32 13 00 00 00 00 51 43 4F 4D 20 20 /* IORT2.....QCOM   */\
/* F3Eh 3902   6 */                            51 43 4F 4D 45 44                               /* QCOMED */\

[F44h 3908   4]                   Input base : 88030000
[F48h 3912   4]                     ID Count : 00000000
[F4Ch 3916   4]                  Output Base : 00000C00
[F50h 3920   4]             Output Reference : 00000030
[F54h 3924   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[F58h 3928   1]                         Type : 01
[F59h 3929   2]                       Length : 0065
[F5Bh 3931   1]                     Revision : 00
[F5Ch 3932   4]                     Reserved : 00000000
[F60h 3936   4]                Mapping Count : 00000002
[F64h 3940   4]               Mapping Offset : 0000003D

[F68h 3944   4]                   Node Flags : 00000000
[F6Ch 3948   8]            Memory Properties : [IORT Memory Access Properties]
[F6Ch 3948   4]              Cache Coherency : 00000000
[F70h 3952   1]        Hints (decoded below) : 00
                                   Transient : 0
                              Write Allocate : 0
                               Read Allocate : 0
                                    Override : 0
[F71h 3953   2]                     Reserved : 0000
[F73h 3955   1] Memory Flags (decoded below) : 00
                                   Coherency : 0
                            Device Attribute : 0
[F74h 3956   1]            Memory Size Limit : 24
[F75h 3957  10]                  Device Name : "\_SB.SDC2"
[F7Fh 3967  22]                      Padding : 49 4F 52 54 32 13 00 00 00 00 51 43 4F 4D 20 20 /* IORT2.....QCOM   */\
/* F8Fh 3983   6 */                            51 43 4F 4D 45 44                               /* QCOMED */\

[F95h 3989   4]                   Input base : 86030000
[F99h 3993   4]                     ID Count : 00000000
[F9Dh 3997   4]                  Output Base : 00000100
[FA1h 4001   4]             Output Reference : 00000030
[FA5h 4005   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[FA9h 4009   4]                   Input base : 86030001
[FADh 4013   4]                     ID Count : 00000000
[FB1h 4017   4]                  Output Base : 00000060
[FB5h 4021   4]             Output Reference : 00000030
[FB9h 4025   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[FBDh 4029   1]                         Type : 01
[FBEh 4030   2]                       Length : 0051
[FC0h 4032   1]                     Revision : 00
[FC1h 4033   4]                     Reserved : 00000000
[FC5h 4037   4]                Mapping Count : 00000001
[FC9h 4041   4]               Mapping Offset : 0000003D

[FCDh 4045   4]                   Node Flags : 00000000
[FD1h 4049   8]            Memory Properties : [IORT Memory Access Properties]
[FD1h 4049   4]              Cache Coherency : 00000001
[FD5h 4053   1]        Hints (decoded below) : 00
                                   Transient : 0
                              Write Allocate : 0
                               Read Allocate : 0
                                    Override : 0
[FD6h 4054   2]                     Reserved : 0000
[FD8h 4056   1] Memory Flags (decoded below) : 01
                                   Coherency : 1
                            Device Attribute : 0
[FD9h 4057   1]            Memory Size Limit : 24
[FDAh 4058  10]                  Device Name : "\_SB.UFS0"
[FE4h 4068  22]                      Padding : 49 4F 52 54 32 13 00 00 00 00 51 43 4F 4D 20 20 /* IORT2.....QCOM   */\
/* FF4h 4084   6 */                            51 43 4F 4D 45 44                               /* QCOMED */\

[FFAh 4090   4]                   Input base : 81030000
[FFEh 4094   4]                     ID Count : 00000000
[1002h 4098   4]                  Output Base : 00000080
[1006h 4102   4]             Output Reference : 00000030
[100Ah 4106   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[100Eh 4110   1]                         Type : 01
[100Fh 4111   2]                       Length : 0051
[1011h 4113   1]                     Revision : 00
[1012h 4114   4]                     Reserved : 00000000
[1016h 4118   4]                Mapping Count : 00000001
[101Ah 4122   4]               Mapping Offset : 0000003D

[101Eh 4126   4]                   Node Flags : 00000000
[1022h 4130   8]            Memory Properties : [IORT Memory Access Properties]
[1022h 4130   4]              Cache Coherency : 00000000
[1026h 4134   1]        Hints (decoded below) : 00
                                   Transient : 0
                              Write Allocate : 0
                               Read Allocate : 0
                                    Override : 0
[1027h 4135   2]                     Reserved : 0000
[1029h 4137   1] Memory Flags (decoded below) : 00
                                   Coherency : 0
                            Device Attribute : 0
[102Ah 4138   1]            Memory Size Limit : 24
[102Bh 4139  10]                  Device Name : "\_SB.URS0"
[1035h 4149  22]                      Padding : 49 4F 52 54 32 13 00 00 00 00 51 43 4F 4D 20 20 /* IORT2.....QCOM   */\
/* 1045h 4165   6 */                            51 43 4F 4D 45 44                               /* QCOMED */\

[104Bh 4171   4]                   Input base : 80030000
[104Fh 4175   4]                     ID Count : 00000000
[1053h 4179   4]                  Output Base : 000000E0
[1057h 4183   4]             Output Reference : 00000030
[105Bh 4187   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[105Fh 4191   1]                         Type : 01
[1060h 4192   2]                       Length : 0051
[1062h 4194   1]                     Revision : 00
[1063h 4195   4]                     Reserved : 00000000
[1067h 4199   4]                Mapping Count : 00000001
[106Bh 4203   4]               Mapping Offset : 0000003D

[106Fh 4207   4]                   Node Flags : 00000000
[1073h 4211   8]            Memory Properties : [IORT Memory Access Properties]
[1073h 4211   4]              Cache Coherency : 00000000
[1077h 4215   1]        Hints (decoded below) : 00
                                   Transient : 0
                              Write Allocate : 0
                               Read Allocate : 0
                                    Override : 0
[1078h 4216   2]                     Reserved : 0000
[107Ah 4218   1] Memory Flags (decoded below) : 00
                                   Coherency : 0
                            Device Attribute : 0
[107Bh 4219   1]            Memory Size Limit : 24
[107Ch 4220  10]                  Device Name : "\_SB.URS1"
[1086h 4230  22]                      Padding : 49 4F 52 54 32 13 00 00 00 00 51 43 4F 4D 20 20 /* IORT2.....QCOM   */\
/* 1096h 4246   6 */                            51 43 4F 4D 45 44                               /* QCOMED */\

[109Ch 4252   4]                   Input base : 80030001
[10A0h 4256   4]                     ID Count : 00000000
[10A4h 4260   4]                  Output Base : 000000A0
[10A8h 4264   4]             Output Reference : 00000030
[10ACh 4268   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[10B0h 4272   1]                         Type : 01
[10B1h 4273   2]                       Length : 0231
[10B3h 4275   1]                     Revision : 00
[10B4h 4276   4]                     Reserved : 00000000
[10B8h 4280   4]                Mapping Count : 00000019
[10BCh 4284   4]               Mapping Offset : 0000003D

[10C0h 4288   4]                   Node Flags : 00000000
[10C4h 4292   8]            Memory Properties : [IORT Memory Access Properties]
[10C4h 4292   4]              Cache Coherency : 00000000
[10C8h 4296   1]        Hints (decoded below) : 00
                                   Transient : 0
                              Write Allocate : 0
                               Read Allocate : 0
                                    Override : 0
[10C9h 4297   2]                     Reserved : 0000
[10CBh 4299   1] Memory Flags (decoded below) : 00
                                   Coherency : 0
                            Device Attribute : 0
[10CCh 4300   1]            Memory Size Limit : 24
[10CDh 4301  15]                  Device Name : "\_SB.GPU0.AVS0"
[10DCh 4316  17]                      Padding : 49 4F 52 54 32 13 00 00 00 00 51 43 4F 4D 20 20 /* IORT2.....QCOM   */\
/* 10ECh 4332   1 */                            51                                              /* Q */\

[10EDh 4333   4]                   Input base : 01030000
[10F1h 4337   4]                     ID Count : 00000000
[10F5h 4341   4]                  Output Base : 00002000
[10F9h 4345   4]             Output Reference : 00000030
[10FDh 4349   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[1101h 4353   4]                   Input base : 01030001
[1105h 4357   4]                     ID Count : 00000000
[1109h 4361   4]                  Output Base : 00002020
[110Dh 4365   4]             Output Reference : 00000030
[1111h 4369   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[1115h 4373   4]                   Input base : 01030002
[1119h 4377   4]                     ID Count : 00000000
[111Dh 4381   4]                  Output Base : 00002040
[1121h 4385   4]             Output Reference : 00000030
[1125h 4389   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[1129h 4393   4]                   Input base : 01030003
[112Dh 4397   4]                     ID Count : 00000000
[1131h 4401   4]                  Output Base : 00002062
[1135h 4405   4]             Output Reference : 00000030
[1139h 4409   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[113Dh 4413   4]                   Input base : 01030004
[1141h 4417   4]                     ID Count : 00000000
[1145h 4421   4]                  Output Base : 00000800
[1149h 4425   4]             Output Reference : 00000030
[114Dh 4429   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[1151h 4433   4]                   Input base : 01030005
[1155h 4437   4]                     ID Count : 00000000
[1159h 4441   4]                  Output Base : 00000820
[115Dh 4445   4]             Output Reference : 00000030
[1161h 4449   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[1165h 4453   4]                   Input base : 01030006
[1169h 4457   4]                     ID Count : 00000000
[116Dh 4461   4]                  Output Base : 00000840
[1171h 4465   4]             Output Reference : 00000030
[1175h 4469   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[1179h 4473   4]                   Input base : 01030007
[117Dh 4477   4]                     ID Count : 00000000
[1181h 4481   4]                  Output Base : 00000860
[1185h 4485   4]             Output Reference : 00000030
[1189h 4489   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[118Dh 4493   4]                   Input base : 01030008
[1191h 4497   4]                     ID Count : 00000000
[1195h 4501   4]                  Output Base : 00000880
[1199h 4505   4]             Output Reference : 00000030
[119Dh 4509   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[11A1h 4513   4]                   Input base : 01030009
[11A5h 4517   4]                     ID Count : 00000000
[11A9h 4521   4]                  Output Base : 000008A0
[11ADh 4525   4]             Output Reference : 00000030
[11B1h 4529   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[11B5h 4533   4]                   Input base : 0103000A
[11B9h 4537   4]                     ID Count : 00000000
[11BDh 4541   4]                  Output Base : 000008C0
[11C1h 4545   4]             Output Reference : 00000030
[11C5h 4549   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[11C9h 4553   4]                   Input base : 0103000B
[11CDh 4557   4]                     ID Count : 00000000
[11D1h 4561   4]                  Output Base : 000008E0
[11D5h 4565   4]             Output Reference : 00000030
[11D9h 4569   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[11DDh 4573   4]                   Input base : 0103000C
[11E1h 4577   4]                     ID Count : 00000000
[11E5h 4581   4]                  Output Base : 00000C00
[11E9h 4585   4]             Output Reference : 00000030
[11EDh 4589   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[11F1h 4593   4]                   Input base : 0103000D
[11F5h 4597   4]                     ID Count : 00000000
[11F9h 4601   4]                  Output Base : 00000C20
[11FDh 4605   4]             Output Reference : 00000030
[1201h 4609   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[1205h 4613   4]                   Input base : 0103000E
[1209h 4617   4]                     ID Count : 00000000
[120Dh 4621   4]                  Output Base : 00000C40
[1211h 4625   4]             Output Reference : 00000030
[1215h 4629   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[1219h 4633   4]                   Input base : 0103000F
[121Dh 4637   4]                     ID Count : 00000000
[1221h 4641   4]                  Output Base : 00000C60
[1225h 4645   4]             Output Reference : 00000030
[1229h 4649   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[122Dh 4653   4]                   Input base : 01030010
[1231h 4657   4]                     ID Count : 00000000
[1235h 4661   4]                  Output Base : 00000C80
[1239h 4665   4]             Output Reference : 00000030
[123Dh 4669   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[1241h 4673   4]                   Input base : 01030011
[1245h 4677   4]                     ID Count : 00000000
[1249h 4681   4]                  Output Base : 00000CA0
[124Dh 4685   4]             Output Reference : 00000030
[1251h 4689   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[1255h 4693   4]                   Input base : 01030012
[1259h 4697   4]                     ID Count : 00000000
[125Dh 4701   4]                  Output Base : 00000CC0
[1261h 4705   4]             Output Reference : 00000030
[1265h 4709   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[1269h 4713   4]                   Input base : 01030013
[126Dh 4717   4]                     ID Count : 00000000
[1271h 4721   4]                  Output Base : 00000CE0
[1275h 4725   4]             Output Reference : 00000030
[1279h 4729   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[127Dh 4733   4]                   Input base : 01030014
[1281h 4737   4]                     ID Count : 00000000
[1285h 4741   4]                  Output Base : 00002080
[1289h 4745   4]             Output Reference : 00000030
[128Dh 4749   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[1291h 4753   4]                   Input base : 01030015
[1295h 4757   4]                     ID Count : 00000000
[1299h 4761   4]                  Output Base : 000020A0
[129Dh 4765   4]             Output Reference : 00000030
[12A1h 4769   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[12A5h 4773   4]                   Input base : 01030016
[12A9h 4777   4]                     ID Count : 00000000
[12ADh 4781   4]                  Output Base : 00002140
[12B1h 4785   4]             Output Reference : 00000030
[12B5h 4789   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[12B9h 4793   4]                   Input base : 01030017
[12BDh 4797   4]                     ID Count : 00000000
[12C1h 4801   4]                  Output Base : 00002100
[12C5h 4805   4]             Output Reference : 00000030
[12C9h 4809   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[12CDh 4813   4]                   Input base : 01030018
[12D1h 4817   4]                     ID Count : 00000000
[12D5h 4821   4]                  Output Base : 00002120
[12D9h 4825   4]             Output Reference : 00000030
[12DDh 4829   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[12E1h 4833   1]                         Type : 01
[12E2h 4834   2]                       Length : 0051
[12E4h 4836   1]                     Revision : 00
[12E5h 4837   4]                     Reserved : 00000000
[12E9h 4841   4]                Mapping Count : 00000001
[12EDh 4845   4]               Mapping Offset : 0000003D

[12F1h 4849   4]                   Node Flags : 00000000
[12F5h 4853   8]            Memory Properties : [IORT Memory Access Properties]
[12F5h 4853   4]              Cache Coherency : 00000000
[12F9h 4857   1]        Hints (decoded below) : 00
                                   Transient : 0
                              Write Allocate : 0
                               Read Allocate : 0
                                    Override : 0
[12FAh 4858   2]                     Reserved : 0000
[12FCh 4860   1] Memory Flags (decoded below) : 00
                                   Coherency : 0
                            Device Attribute : 0
[12FDh 4861   1]            Memory Size Limit : 24
[12FEh 4862  15]                  Device Name : "\_SB.WPSS.QWLN"
[130Dh 4877  17]                      Padding : 49 4F 52 54 32 13 00 00 00 00 51 43 4F 4D 20 20 /* IORT2.....QCOM   */\
/* 131Dh 4893   1 */                            51                                              /* Q */\

[131Eh 4894   4]                   Input base : 11030000
[1322h 4898   4]                     ID Count : 00000001
[1326h 4902   4]                  Output Base : 00001C00
[132Ah 4906   4]             Output Reference : 00000030
[132Eh 4910   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

Raw Table Data: Length 4914 (0x1332)

    0000: 49 4F 52 54 32 13 00 00 00 00 51 43 4F 4D 20 20  // IORT2.....QCOM  
    0010: 51 43 4F 4D 45 44 4B 32 80 72 00 00 51 43 4F 4D  // QCOMEDK2.r..QCOM
    0020: 01 00 00 00 12 00 00 00 30 00 00 00 00 00 00 00  // ........0.......
    0030: 03 14 03 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0040: 00 00 00 15 00 00 00 00 00 00 10 00 00 00 00 00  // ................
    0050: 03 00 00 00 00 00 00 00 3C 00 00 00 50 00 00 00  // ........<...P...
    0060: 4C 00 00 00 09 00 00 00 CC 02 00 00 61 00 00 00  // L...........a...
    0070: 00 00 00 00 00 00 00 00 00 00 00 00 80 00 00 00  // ................
    0080: 01 00 00 00 81 00 00 00 01 00 00 00 82 00 00 00  // ................
    0090: 01 00 00 00 83 00 00 00 01 00 00 00 84 00 00 00  // ................
    00A0: 01 00 00 00 85 00 00 00 01 00 00 00 86 00 00 00  // ................
    00B0: 01 00 00 00 87 00 00 00 01 00 00 00 88 00 00 00  // ................
    00C0: 01 00 00 00 89 00 00 00 01 00 00 00 8A 00 00 00  // ................
    00D0: 01 00 00 00 8B 00 00 00 01 00 00 00 8C 00 00 00  // ................
    00E0: 01 00 00 00 8D 00 00 00 01 00 00 00 8E 00 00 00  // ................
    00F0: 01 00 00 00 8F 00 00 00 01 00 00 00 90 00 00 00  // ................
    0100: 01 00 00 00 91 00 00 00 01 00 00 00 92 00 00 00  // ................
    0110: 01 00 00 00 93 00 00 00 01 00 00 00 94 00 00 00  // ................
    0120: 01 00 00 00 95 00 00 00 01 00 00 00 96 00 00 00  // ................
    0130: 01 00 00 00 D5 00 00 00 01 00 00 00 D6 00 00 00  // ................
    0140: 01 00 00 00 D7 00 00 00 01 00 00 00 D8 00 00 00  // ................
    0150: 01 00 00 00 D9 00 00 00 01 00 00 00 DA 00 00 00  // ................
    0160: 01 00 00 00 DB 00 00 00 01 00 00 00 DC 00 00 00  // ................
    0170: 01 00 00 00 DD 00 00 00 01 00 00 00 DE 00 00 00  // ................
    0180: 01 00 00 00 DF 00 00 00 01 00 00 00 E0 00 00 00  // ................
    0190: 01 00 00 00 5B 01 00 00 01 00 00 00 5C 01 00 00  // ....[.......\...
    01A0: 01 00 00 00 5D 01 00 00 01 00 00 00 5E 01 00 00  // ....].......^...
    01B0: 01 00 00 00 5F 01 00 00 01 00 00 00 60 01 00 00  // ...._.......`...
    01C0: 01 00 00 00 61 01 00 00 01 00 00 00 62 01 00 00  // ....a.......b...
    01D0: 01 00 00 00 63 01 00 00 01 00 00 00 64 01 00 00  // ....c.......d...
    01E0: 01 00 00 00 65 01 00 00 01 00 00 00 66 01 00 00  // ....e.......f...
    01F0: 01 00 00 00 67 01 00 00 01 00 00 00 68 01 00 00  // ....g.......h...
    0200: 01 00 00 00 69 01 00 00 01 00 00 00 6A 01 00 00  // ....i.......j...
    0210: 01 00 00 00 6B 01 00 00 01 00 00 00 6C 01 00 00  // ....k.......l...
    0220: 01 00 00 00 6D 01 00 00 01 00 00 00 6E 01 00 00  // ....m.......n...
    0230: 01 00 00 00 6F 01 00 00 01 00 00 00 70 01 00 00  // ....o.......p...
    0240: 01 00 00 00 71 01 00 00 01 00 00 00 72 01 00 00  // ....q.......r...
    0250: 01 00 00 00 73 01 00 00 01 00 00 00 74 01 00 00  // ....s.......t...
    0260: 01 00 00 00 75 01 00 00 01 00 00 00 76 01 00 00  // ....u.......v...
    0270: 01 00 00 00 77 01 00 00 01 00 00 00 78 01 00 00  // ....w.......x...
    0280: 01 00 00 00 79 01 00 00 01 00 00 00 AB 01 00 00  // ....y...........
    0290: 01 00 00 00 AC 01 00 00 01 00 00 00 AD 01 00 00  // ................
    02A0: 01 00 00 00 AE 01 00 00 01 00 00 00 AF 01 00 00  // ................
    02B0: 01 00 00 00 B0 01 00 00 01 00 00 00 B1 01 00 00  // ................
    02C0: 01 00 00 00 B2 01 00 00 01 00 00 00 B3 01 00 00  // ................
    02D0: 01 00 00 00 B4 01 00 00 01 00 00 00 B5 01 00 00  // ................
    02E0: 01 00 00 00 B6 01 00 00 01 00 00 00 B7 01 00 00  // ................
    02F0: 01 00 00 00 B8 01 00 00 01 00 00 00 64 00 00 00  // ............d...
    0300: 01 00 00 00 65 00 00 00 01 00 00 00 66 00 00 00  // ....e.......f...
    0310: 01 00 00 00 67 00 00 00 01 00 00 00 68 00 00 00  // ....g.......h...
    0320: 01 00 00 00 69 00 00 00 01 00 00 00 7E 00 00 00  // ....i.......~...
    0330: 01 00 00 00 7F 00 00 00 01 00 00 00 CA 01 00 00  // ................
    0340: 01 00 00 00 03 AC 00 00 00 00 00 00 00 00 00 00  // ................
    0350: 00 00 00 00 00 00 DA 03 00 00 00 00 00 00 02 00  // ................
    0360: 00 00 00 00 03 00 00 00 00 00 00 00 3C 00 00 00  // ............<...
    0370: 0A 00 00 00 4C 00 00 00 02 00 00 00 9C 00 00 00  // ....L...........
    0380: C1 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0390: C6 02 00 00 01 00 00 00 C7 02 00 00 01 00 00 00  // ................
    03A0: C8 02 00 00 01 00 00 00 C9 02 00 00 01 00 00 00  // ................
    03B0: CA 02 00 00 01 00 00 00 CB 02 00 00 01 00 00 00  // ................
    03C0: CC 02 00 00 01 00 00 00 CD 02 00 00 01 00 00 00  // ................
    03D0: CE 02 00 00 01 00 00 00 CF 02 00 00 01 00 00 00  // ................
    03E0: C4 02 00 00 01 00 00 00 C5 02 00 00 01 00 00 00  // ................
    03F0: 02 88 00 00 00 00 00 00 05 00 00 00 24 00 00 00  // ............$...
    0400: 01 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00  // ................
    0410: 24 00 00 00 00 00 03 87 03 00 00 00 04 1C 00 00  // $...............
    0420: 30 00 00 00 00 00 00 00 04 00 03 87 07 00 00 00  // 0...............
    0430: 08 1C 00 00 30 00 00 00 00 00 00 00 0C 00 03 87  // ....0...........
    0440: 0F 00 00 00 10 1C 00 00 30 00 00 00 00 00 00 00  // ........0.......
    0450: 1C 00 03 87 1F 00 00 00 20 1C 00 00 30 00 00 00  // ........ ...0...
    0460: 00 00 00 00 3C 00 03 87 3F 00 00 00 40 1C 00 00  // ....<...?...@...
    0470: 30 00 00 00 00 00 00 00 02 9C 00 00 00 00 00 00  // 0...............
    0480: 06 00 00 00 24 00 00 00 01 00 00 00 00 00 00 01  // ....$...........
    0490: 00 00 00 00 01 00 00 00 24 00 00 00 00 01 03 87  // ........$.......
    04A0: 01 00 00 00 80 1C 00 00 30 00 00 00 00 00 00 00  // ........0.......
    04B0: 02 01 03 87 03 00 00 00 84 1C 00 00 30 00 00 00  // ............0...
    04C0: 00 00 00 00 06 01 03 87 07 00 00 00 88 1C 00 00  // ................
    04D0: 30 00 00 00 00 00 00 00 10 01 03 87 0F 00 00 00  // 0...............
    04E0: 90 1C 00 00 30 00 00 00 00 00 00 00 20 01 03 87  // ....0....... ...
    04F0: 1F 00 00 00 A0 1C 00 00 30 00 00 00 00 00 00 00  // ........0.......
    0500: 50 01 03 87 3F 00 00 00 C0 1C 00 00 30 00 00 00  // P...?.......0...
    0510: 00 00 00 00 01 5D 03 00 00 00 00 00 28 00 00 00  // .....]......(...
    0520: 3D 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // =...............
    0530: 30 5C 5F 53 42 2E 47 50 55 30 00 00 00 00 00 00  // 0\_SB.GPU0......
    0540: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0550: 00 00 00 0A 03 00 00 00 00 02 00 00 00 44 03 00  // .............D..
    0560: 00 00 00 00 00 01 00 0A 03 00 00 00 00 02 04 00  // ................
    0570: 00 44 03 00 00 00 00 00 00 00 00 03 03 00 00 00  // .D..............
    0580: 00 00 00 00 00 44 03 00 00 00 00 00 00 01 00 03  // .....D..........
    0590: 03 00 00 00 00 00 04 00 00 44 03 00 00 00 00 00  // .........D......
    05A0: 00 02 00 03 03 00 00 00 00 04 00 00 00 44 03 00  // .............D..
    05B0: 00 00 00 00 00 03 00 03 03 00 00 00 00 04 04 00  // ................
    05C0: 00 44 03 00 00 00 00 00 00 04 00 03 03 00 00 00  // .D..............
    05D0: 00 05 00 00 00 44 03 00 00 00 00 00 00 05 00 03  // .....D..........
    05E0: 03 00 00 00 00 05 04 00 00 44 03 00 00 00 00 00  // .........D......
    05F0: 00 06 00 03 03 00 00 00 00 01 00 00 00 44 03 00  // .............D..
    0600: 00 00 00 00 00 07 00 03 03 00 00 00 00 01 04 00  // ................
    0610: 00 44 03 00 00 00 00 00 00 00 00 03 00 00 00 00  // .D..............
    0620: 00 00 09 00 00 30 00 00 00 00 00 00 00 01 00 03  // .....0..........
    0630: 00 00 00 00 00 02 09 00 00 30 00 00 00 00 00 00  // .........0......
    0640: 00 02 00 03 00 00 00 00 00 00 0D 00 00 30 00 00  // .............0..
    0650: 00 00 00 00 00 03 00 03 00 00 00 00 00 02 0D 00  // ................
    0660: 00 30 00 00 00 00 00 00 00 00 00 0A 00 00 00 00  // .0..............
    0670: 00 01 09 00 00 30 00 00 00 00 00 00 00 01 00 0A  // .....0..........
    0680: 00 00 00 00 00 01 0D 00 00 30 00 00 00 00 00 00  // .........0......
    0690: 00 00 00 03 06 00 00 00 00 DC 29 00 00 30 00 00  // ..........)..0..
    06A0: 00 00 00 00 00 01 00 03 06 00 00 00 00 DC 2D 00  // ..............-.
    06B0: 00 30 00 00 00 00 00 00 00 02 00 03 06 00 00 00  // .0..............
    06C0: 00 FC 29 00 00 30 00 00 00 00 00 00 00 03 00 03  // ..)..0..........
    06D0: 06 00 00 00 00 FC 2D 00 00 30 00 00 00 00 00 00  // ......-..0......
    06E0: 00 00 00 0A 06 00 00 00 00 DD 29 00 00 30 00 00  // ..........)..0..
    06F0: 00 00 00 00 00 01 00 0A 06 00 00 00 00 DD 2D 00  // ..............-.
    0700: 00 30 00 00 00 00 00 00 00 02 00 0A 06 00 00 00  // .0..............
    0710: 00 FD 29 00 00 30 00 00 00 00 00 00 00 03 00 0A  // ..)..0..........
    0720: 06 00 00 00 00 FD 2D 00 00 30 00 00 00 00 00 00  // ......-..0......
    0730: 00 00 00 03 0C 01 00 00 00 E6 04 00 00 30 00 00  // .............0..
    0740: 00 00 00 00 00 02 00 03 0C 00 00 00 00 F2 04 00  // ................
    0750: 00 30 00 00 00 00 00 00 00 03 00 03 0C 01 00 00  // .0..............
    0760: 00 F6 04 00 00 30 00 00 00 00 00 00 00 05 00 03  // .....0..........
    0770: 0C 01 00 00 00 F8 04 00 00 30 00 00 00 00 00 00  // .........0......
    0780: 00 07 00 03 0C 00 00 00 00 FF 04 00 00 30 00 00  // .............0..
    0790: 00 00 00 00 00 00 00 09 0C 00 00 00 00 F3 04 00  // ................
    07A0: 00 30 00 00 00 00 00 00 00 01 00 09 0C 01 00 00  // .0..............
    07B0: 00 FC 04 00 00 30 00 00 00 00 00 00 00 03 00 09  // .....0..........
    07C0: 0C 00 00 00 00 FE 04 00 00 30 00 00 00 00 00 00  // .........0......
    07D0: 00 00 00 03 04 00 00 00 00 80 21 00 00 30 00 00  // ..........!..0..
    07E0: 00 00 00 00 00 01 00 03 04 00 00 00 00 A0 21 00  // ..............!.
    07F0: 00 30 00 00 00 00 00 00 00 02 00 03 04 00 00 00  // .0..............
    0800: 00 87 21 00 00 30 00 00 00 00 00 00 00 00 00 09  // ..!..0..........
    0810: 04 00 00 00 00 81 21 00 00 30 00 00 00 00 00 00  // ......!..0......
    0820: 00 01 00 09 04 00 00 00 00 85 21 00 00 30 00 00  // ..........!..0..
    0830: 00 00 00 00 00 00 00 0A 04 00 00 00 00 83 21 00  // ..............!.
    0840: 00 30 00 00 00 00 00 00 00 00 00 0B 04 00 00 00  // .0..............
    0850: 00 84 21 00 00 30 00 00 00 00 00 00 00 01 00 0B  // ..!..0..........
    0860: 04 00 00 00 00 A4 21 00 00 30 00 00 00 00 00 00  // ......!..0......
    0870: 00 01 65 00 00 00 00 00 00 02 00 00 00 3D 00 00  // ..e..........=..
    0880: 00 00 00 00 00 00 00 00 00 00 00 00 00 24 5C 5F  // .............$\_
    0890: 53 42 2E 4A 50 47 45 00 00 00 00 00 00 00 00 00  // SB.JPGE.........
    08A0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    08B0: 03 02 00 00 00 00 C0 20 00 00 30 00 00 00 00 00  // ....... ..0.....
    08C0: 00 00 01 00 03 02 00 00 00 00 E0 20 00 00 30 00  // ........... ..0.
    08D0: 00 00 00 00 00 00 01 89 04 00 00 00 00 00 37 00  // ..............7.
    08E0: 00 00 3D 00 00 00 00 00 00 00 00 00 00 00 00 00  // ..=.............
    08F0: 00 00 24 5C 5F 53 42 2E 41 52 50 43 00 00 00 00  // ..$\_SB.ARPC....
    0900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0910: 00 00 00 34 00 03 17 00 00 00 00 03 18 00 00 30  // ...4...........0
    0920: 00 00 00 00 00 00 00 35 00 03 17 00 00 00 00 04  // .......5........
    0930: 18 00 00 30 00 00 00 00 00 00 00 36 00 03 17 00  // ...0.......6....
    0940: 00 00 00 05 18 00 00 30 00 00 00 00 00 00 00 00  // .......0........
    0950: 00 03 17 00 00 00 00 81 11 00 00 30 00 00 00 00  // ...........0....
    0960: 00 00 00 01 00 03 17 00 00 00 00 A1 11 00 00 30  // ...............0
    0970: 00 00 00 00 00 00 00 02 00 03 17 00 00 00 00 81  // ................
    0980: 15 00 00 30 00 00 00 00 00 00 00 03 00 03 17 00  // ...0............
    0990: 00 00 00 A1 15 00 00 30 00 00 00 00 00 00 00 04  // .......0........
    09A0: 00 03 17 00 00 00 00 82 11 00 00 30 00 00 00 00  // ...........0....
    09B0: 00 00 00 05 00 03 17 00 00 00 00 A2 11 00 00 30  // ...............0
    09C0: 00 00 00 00 00 00 00 06 00 03 17 00 00 00 00 82  // ................
    09D0: 15 00 00 30 00 00 00 00 00 00 00 07 00 03 17 00  // ...0............
    09E0: 00 00 00 A2 15 00 00 30 00 00 00 00 00 00 00 08  // .......0........
    09F0: 00 03 17 00 00 00 00 83 11 00 00 30 00 00 00 00  // ...........0....
    0A00: 00 00 00 09 00 03 17 00 00 00 00 A3 11 00 00 30  // ...............0
    0A10: 00 00 00 00 00 00 00 0A 00 03 17 00 00 00 00 83  // ................
    0A20: 15 00 00 30 00 00 00 00 00 00 00 0B 00 03 17 00  // ...0............
    0A30: 00 00 00 A3 15 00 00 30 00 00 00 00 00 00 00 0C  // .......0........
    0A40: 00 03 17 00 00 00 00 84 11 00 00 30 00 00 00 00  // ...........0....
    0A50: 00 00 00 0D 00 03 17 00 00 00 00 A4 11 00 00 30  // ...............0
    0A60: 00 00 00 00 00 00 00 0E 00 03 17 00 00 00 00 84  // ................
    0A70: 15 00 00 30 00 00 00 00 00 00 00 0F 00 03 17 00  // ...0............
    0A80: 00 00 00 A4 15 00 00 30 00 00 00 00 00 00 00 10  // .......0........
    0A90: 00 03 17 00 00 00 00 85 11 00 00 30 00 00 00 00  // ...........0....
    0AA0: 00 00 00 11 00 03 17 00 00 00 00 A5 11 00 00 30  // ...............0
    0AB0: 00 00 00 00 00 00 00 12 00 03 17 00 00 00 00 85  // ................
    0AC0: 15 00 00 30 00 00 00 00 00 00 00 13 00 03 17 00  // ...0............
    0AD0: 00 00 00 A5 15 00 00 30 00 00 00 00 00 00 00 14  // .......0........
    0AE0: 00 03 17 00 00 00 00 86 11 00 00 30 00 00 00 00  // ...........0....
    0AF0: 00 00 00 15 00 03 17 00 00 00 00 A6 11 00 00 30  // ...............0
    0B00: 00 00 00 00 00 00 00 16 00 03 17 00 00 00 00 86  // ................
    0B10: 15 00 00 30 00 00 00 00 00 00 00 17 00 03 17 00  // ...0............
    0B20: 00 00 00 A6 15 00 00 30 00 00 00 00 00 00 00 18  // .......0........
    0B30: 00 03 17 00 00 00 00 87 11 00 00 30 00 00 00 00  // ...........0....
    0B40: 00 00 00 19 00 03 17 00 00 00 00 A7 11 00 00 30  // ...............0
    0B50: 00 00 00 00 00 00 00 1A 00 03 17 00 00 00 00 87  // ................
    0B60: 15 00 00 30 00 00 00 00 00 00 00 1B 00 03 17 00  // ...0............
    0B70: 00 00 00 A7 15 00 00 30 00 00 00 00 00 00 00 1C  // .......0........
    0B80: 00 03 17 00 00 00 00 88 11 00 00 30 00 00 00 00  // ...........0....
    0B90: 00 00 00 1D 00 03 17 00 00 00 00 A8 11 00 00 30  // ...............0
    0BA0: 00 00 00 00 00 00 00 1E 00 03 17 00 00 00 00 88  // ................
    0BB0: 15 00 00 30 00 00 00 00 00 00 00 1F 00 03 17 00  // ...0............
    0BC0: 00 00 00 A8 15 00 00 30 00 00 00 00 00 00 00 20  // .......0....... 
    0BD0: 00 03 17 00 00 00 00 8B 11 00 00 30 00 00 00 00  // ...........0....
    0BE0: 00 00 00 21 00 03 17 00 00 00 00 AB 11 00 00 30  // ...!...........0
    0BF0: 00 00 00 00 00 00 00 22 00 03 17 00 00 00 00 8B  // ......."........
    0C00: 15 00 00 30 00 00 00 00 00 00 00 23 00 03 17 00  // ...0.......#....
    0C10: 00 00 00 AB 15 00 00 30 00 00 00 00 00 00 00 24  // .......0.......$
    0C20: 00 03 17 00 00 00 00 8C 11 00 00 30 00 00 00 00  // ...........0....
    0C30: 00 00 00 25 00 03 17 00 00 00 00 AC 11 00 00 30  // ...%...........0
    0C40: 00 00 00 00 00 00 00 26 00 03 17 00 00 00 00 8C  // .......&........
    0C50: 15 00 00 30 00 00 00 00 00 00 00 27 00 03 17 00  // ...0.......'....
    0C60: 00 00 00 AC 15 00 00 30 00 00 00 00 00 00 00 28  // .......0.......(
    0C70: 00 03 17 00 00 00 00 8D 11 00 00 30 00 00 00 00  // ...........0....
    0C80: 00 00 00 29 00 03 17 00 00 00 00 AD 11 00 00 30  // ...)...........0
    0C90: 00 00 00 00 00 00 00 2A 00 03 17 00 00 00 00 8D  // .......*........
    0CA0: 15 00 00 30 00 00 00 00 00 00 00 2B 00 03 17 00  // ...0.......+....
    0CB0: 00 00 00 AD 15 00 00 30 00 00 00 00 00 00 00 2C  // .......0.......,
    0CC0: 00 03 17 00 00 00 00 8E 11 00 00 30 00 00 00 00  // ...........0....
    0CD0: 00 00 00 2D 00 03 17 00 00 00 00 AE 11 00 00 30  // ...-...........0
    0CE0: 00 00 00 00 00 00 00 2E 00 03 17 00 00 00 00 8E  // ................
    0CF0: 15 00 00 30 00 00 00 00 00 00 00 2F 00 03 17 00  // ...0......./....
    0D00: 00 00 00 AE 15 00 00 30 00 00 00 00 00 00 00 30  // .......0.......0
    0D10: 00 03 17 00 00 00 00 8F 11 00 00 30 00 00 00 00  // ...........0....
    0D20: 00 00 00 31 00 03 17 00 00 00 00 AF 11 00 00 30  // ...1...........0
    0D30: 00 00 00 00 00 00 00 32 00 03 17 00 00 00 00 8F  // .......2........
    0D40: 15 00 00 30 00 00 00 00 00 00 00 33 00 03 17 00  // ...0.......3....
    0D50: 00 00 00 AF 15 00 00 30 00 00 00 00 00 00 00 01  // .......0........
    0D60: A1 00 00 00 00 00 00 05 00 00 00 3D 00 00 00 00  // ...........=....
    0D70: 00 00 00 00 00 00 00 00 00 00 00 24 5C 5F 53 42  // ...........$\_SB
    0D80: 2E 49 50 41 00 00 00 00 00 00 00 00 00 00 00 00  // .IPA............
    0D90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 03 0B  // ................
    0DA0: 00 00 00 00 80 04 00 00 30 00 00 00 00 00 00 00  // ........0.......
    0DB0: 01 00 03 0B 00 00 00 00 81 04 00 00 30 00 00 00  // ............0...
    0DC0: 00 00 00 00 02 00 03 0B 00 00 00 00 82 04 00 00  // ................
    0DD0: 30 00 00 00 00 00 00 00 03 00 03 0B 00 00 00 00  // 0...............
    0DE0: 83 04 00 00 30 00 00 00 00 00 00 00 04 00 03 0B  // ....0...........
    0DF0: 00 00 00 00 84 04 00 00 30 00 00 00 00 00 00 00  // ........0.......
    0E00: 01 51 00 00 00 00 00 00 01 00 00 00 3D 00 00 00  // .Q..........=...
    0E10: 00 00 00 00 00 00 00 00 00 00 00 00 24 5C 5F 53  // ............$\_S
    0E20: 42 2E 55 53 42 41 00 00 00 00 00 00 00 00 00 00  // B.USBA..........
    0E30: 00 00 00 00 00 00 00 00 00 00 00 00 00 02 00 03  // ................
    0E40: 07 00 00 00 00 0F 18 00 00 30 00 00 00 00 00 00  // .........0......
    0E50: 00 01 65 00 00 00 00 00 00 02 00 00 00 3D 00 00  // ..e..........=..
    0E60: 00 00 00 00 00 00 00 00 00 00 00 00 00 24 5C 5F  // .............$\_
    0E70: 53 42 2E 51 44 53 53 00 00 00 00 00 00 00 00 00  // SB.QDSS.........
    0E80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0E90: 03 19 00 00 00 00 A0 04 00 00 30 00 00 00 00 00  // ..........0.....
    0EA0: 00 00 01 00 03 19 00 00 00 00 C0 04 00 00 30 00  // ..............0.
    0EB0: 00 00 00 00 00 00 01 51 00 00 00 00 00 00 01 00  // .......Q........
    0EC0: 00 00 3D 00 00 00 00 00 00 00 00 00 00 00 00 00  // ..=.............
    0ED0: 00 00 24 5C 5F 53 42 2E 41 44 53 50 2E 41 44 43  // ..$\_SB.ADSP.ADC
    0EE0: 4D 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // M...............
    0EF0: 00 00 00 00 00 03 07 00 00 00 00 01 18 00 00 30  // ...............0
    0F00: 00 00 00 00 00 00 00 01 51 00 00 00 00 00 00 01  // ........Q.......
    0F10: 00 00 00 3D 00 00 00 00 00 00 00 00 00 00 00 00  // ...=............
    0F20: 00 00 00 24 5C 5F 53 42 2E 53 44 43 31 00 00 00  // ...$\_SB.SDC1...
    0F30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0F40: 00 00 00 00 00 00 03 88 00 00 00 00 00 0C 00 00  // ................
    0F50: 30 00 00 00 00 00 00 00 01 65 00 00 00 00 00 00  // 0........e......
    0F60: 02 00 00 00 3D 00 00 00 00 00 00 00 00 00 00 00  // ....=...........
    0F70: 00 00 00 00 24 5C 5F 53 42 2E 53 44 43 32 00 00  // ....$\_SB.SDC2..
    0F80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0F90: 00 00 00 00 00 00 00 03 86 00 00 00 00 00 01 00  // ................
    0FA0: 00 30 00 00 00 00 00 00 00 01 00 03 86 00 00 00  // .0..............
    0FB0: 00 60 00 00 00 30 00 00 00 00 00 00 00 01 51 00  // .`...0........Q.
    0FC0: 00 00 00 00 00 01 00 00 00 3D 00 00 00 00 00 00  // .........=......
    0FD0: 00 01 00 00 00 00 00 00 01 24 5C 5F 53 42 2E 55  // .........$\_SB.U
    0FE0: 46 53 30 00 00 00 00 00 00 00 00 00 00 00 00 00  // FS0.............
    0FF0: 00 00 00 00 00 00 00 00 00 00 00 00 03 81 00 00  // ................
    1000: 00 00 80 00 00 00 30 00 00 00 00 00 00 00 01 51  // ......0........Q
    1010: 00 00 00 00 00 00 01 00 00 00 3D 00 00 00 00 00  // ..........=.....
    1020: 00 00 00 00 00 00 00 00 00 00 24 5C 5F 53 42 2E  // ..........$\_SB.
    1030: 55 52 53 30 00 00 00 00 00 00 00 00 00 00 00 00  // URS0............
    1040: 00 00 00 00 00 00 00 00 00 00 00 00 00 03 80 00  // ................
    1050: 00 00 00 E0 00 00 00 30 00 00 00 00 00 00 00 01  // .......0........
    1060: 51 00 00 00 00 00 00 01 00 00 00 3D 00 00 00 00  // Q..........=....
    1070: 00 00 00 00 00 00 00 00 00 00 00 24 5C 5F 53 42  // ...........$\_SB
    1080: 2E 55 52 53 31 00 00 00 00 00 00 00 00 00 00 00  // .URS1...........
    1090: 00 00 00 00 00 00 00 00 00 00 00 00 01 00 03 80  // ................
    10A0: 00 00 00 00 A0 00 00 00 30 00 00 00 00 00 00 00  // ........0.......
    10B0: 01 31 02 00 00 00 00 00 19 00 00 00 3D 00 00 00  // .1..........=...
    10C0: 00 00 00 00 00 00 00 00 00 00 00 00 24 5C 5F 53  // ............$\_S
    10D0: 42 2E 47 50 55 30 2E 41 56 53 30 00 00 00 00 00  // B.GPU0.AVS0.....
    10E0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 03  // ................
    10F0: 01 00 00 00 00 00 20 00 00 30 00 00 00 00 00 00  // ...... ..0......
    1100: 00 01 00 03 01 00 00 00 00 20 20 00 00 30 00 00  // .........  ..0..
    1110: 00 00 00 00 00 02 00 03 01 00 00 00 00 40 20 00  // .............@ .
    1120: 00 30 00 00 00 00 00 00 00 03 00 03 01 00 00 00  // .0..............
    1130: 00 62 20 00 00 30 00 00 00 00 00 00 00 04 00 03  // .b ..0..........
    1140: 01 00 00 00 00 00 08 00 00 30 00 00 00 00 00 00  // .........0......
    1150: 00 05 00 03 01 00 00 00 00 20 08 00 00 30 00 00  // ......... ...0..
    1160: 00 00 00 00 00 06 00 03 01 00 00 00 00 40 08 00  // .............@..
    1170: 00 30 00 00 00 00 00 00 00 07 00 03 01 00 00 00  // .0..............
    1180: 00 60 08 00 00 30 00 00 00 00 00 00 00 08 00 03  // .`...0..........
    1190: 01 00 00 00 00 80 08 00 00 30 00 00 00 00 00 00  // .........0......
    11A0: 00 09 00 03 01 00 00 00 00 A0 08 00 00 30 00 00  // .............0..
    11B0: 00 00 00 00 00 0A 00 03 01 00 00 00 00 C0 08 00  // ................
    11C0: 00 30 00 00 00 00 00 00 00 0B 00 03 01 00 00 00  // .0..............
    11D0: 00 E0 08 00 00 30 00 00 00 00 00 00 00 0C 00 03  // .....0..........
    11E0: 01 00 00 00 00 00 0C 00 00 30 00 00 00 00 00 00  // .........0......
    11F0: 00 0D 00 03 01 00 00 00 00 20 0C 00 00 30 00 00  // ......... ...0..
    1200: 00 00 00 00 00 0E 00 03 01 00 00 00 00 40 0C 00  // .............@..
    1210: 00 30 00 00 00 00 00 00 00 0F 00 03 01 00 00 00  // .0..............
    1220: 00 60 0C 00 00 30 00 00 00 00 00 00 00 10 00 03  // .`...0..........
    1230: 01 00 00 00 00 80 0C 00 00 30 00 00 00 00 00 00  // .........0......
    1240: 00 11 00 03 01 00 00 00 00 A0 0C 00 00 30 00 00  // .............0..
    1250: 00 00 00 00 00 12 00 03 01 00 00 00 00 C0 0C 00  // ................
    1260: 00 30 00 00 00 00 00 00 00 13 00 03 01 00 00 00  // .0..............
    1270: 00 E0 0C 00 00 30 00 00 00 00 00 00 00 14 00 03  // .....0..........
    1280: 01 00 00 00 00 80 20 00 00 30 00 00 00 00 00 00  // ...... ..0......
    1290: 00 15 00 03 01 00 00 00 00 A0 20 00 00 30 00 00  // .......... ..0..
    12A0: 00 00 00 00 00 16 00 03 01 00 00 00 00 40 21 00  // .............@!.
    12B0: 00 30 00 00 00 00 00 00 00 17 00 03 01 00 00 00  // .0..............
    12C0: 00 00 21 00 00 30 00 00 00 00 00 00 00 18 00 03  // ..!..0..........
    12D0: 01 00 00 00 00 20 21 00 00 30 00 00 00 00 00 00  // ..... !..0......
    12E0: 00 01 51 00 00 00 00 00 00 01 00 00 00 3D 00 00  // ..Q..........=..
    12F0: 00 00 00 00 00 00 00 00 00 00 00 00 00 24 5C 5F  // .............$\_
    1300: 53 42 2E 57 50 53 53 2E 51 57 4C 4E 00 00 00 00  // SB.WPSS.QWLN....
    1310: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    1320: 03 11 01 00 00 00 00 1C 00 00 30 00 00 00 00 00  // ..........0.....
    1330: 00 00                                            // ..
