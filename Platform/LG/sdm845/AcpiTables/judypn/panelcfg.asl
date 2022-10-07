Name (PCFG, Buffer(){"
<?xml version='1.0' encoding='utf-8'?>
<PanelName>SW43408A</PanelName>
<PanelDescription>LGD Single DSI Command Mode DSC POLED DV2 Panel (1440x3120 24bpp)</PanelDescription>
<Group id='Active Timing'>
 <HorizontalActive>1440</HorizontalActive>
 <HorizontalFrontPorch>168</HorizontalFrontPorch>
 <HorizontalBackPorch>88</HorizontalBackPorch>
 <HorizontalSyncPulse>4</HorizontalSyncPulse>
 <HorizontalSyncSkew>0</HorizontalSyncSkew>
 <HorizontalLeftBorder>0</HorizontalLeftBorder>
 <HorizontalRightBorder>0</HorizontalRightBorder>
 <VerticalActive>3120</VerticalActive>
 <VerticalFrontPorch>9</VerticalFrontPorch>
 <VerticalBackPorch>10</VerticalBackPorch>
 <VerticalSyncPulse>1</VerticalSyncPulse>
 <VerticalSyncSkew>0</VerticalSyncSkew>
 <VerticalTopBorder>0</VerticalTopBorder>
 <VerticalBottomBorder>0</VerticalBottomBorder>
 <InvertDataPolarity>False</InvertDataPolarity>
 <InvertVsyncPolairty>False</InvertVsyncPolairty>
 <InvertHsyncPolarity>False</InvertHsyncPolarity>
 <BorderColor>0x0</BorderColor>
 </Group>
 <Group id='Display Interface'>
 <InterfaceType>9</InterfaceType>
 <InterfaceColorFormat>3</InterfaceColorFormat>
 </Group>
 <Group id='DSI Interface'>
 <DSIChannelId>2</DSIChannelId>
 <DSIVirtualId>0</DSIVirtualId>
 <DSIColorFormat>36</DSIColorFormat>
 <DSITrafficMode>1</DSITrafficMode>
 <DSILanes>4</DSILanes>
 <DSIClockHSForceRequest>1</DSIClockHSForceRequest>
 <DSIRefreshRate>0x5A0000</DSIRefreshRate>
 <DSICmdSwapInterface>False</DSICmdSwapInterface>
 <DSICmdUsingTrigger>False</DSICmdUsingTrigger>
 <DSIEnableAutoRefresh>True</DSIEnableAutoRefresh>
 <DSIAutoRefreshFrameNumDiv>1</DSIAutoRefreshFrameNumDiv>
 <DSIDSCEnable>True</DSIDSCEnable>
 <DSIDSCMajor>1</DSIDSCMajor>
 <DSIDSCMinor>1</DSIDSCMinor>
 <DSIDSCScr>1</DSIDSCScr>
 <DSIDSCProfileID>7</DSIDSCProfileID>
 <DSILP11AtInit>True</DSILP11AtInit>
 <DSIDSCSliceWidth>720</DSIDSCSliceWidth>
 <DSIDSCSliceHeight>60</DSIDSCSliceHeight>
 <DSITECheckEnable>True</DSITECheckEnable>
 <DSITEUsingDedicatedTEPin>True</DSITEUsingDedicatedTEPin>
 <DSITEvSyncStartPos>3120</DSITEvSyncStartPos>
 <DSITEvSyncInitVal>3120</DSITEvSyncInitVal>
 <DSIControllerMapping>
  00
 </DSIControllerMapping>
 <DisplayResetInfo>0 2000 1000 10000 0</DisplayResetInfo>
</Group><DSIInitSequence>07 11 00
15 B0 AC
39 F7 01 49 0C FF 7F 04
15 B0 CA
39 55 00 70 DF 00 70 DF
05 11
FF BE
15 26 02
39 51 03 E1
39 53 0C 30
15 35 00
39 44 00 00
39 2A 00 00 05 9F
39 2B 00 00 0C 2F
15 B0 AC
39 B8 3D 01 1F 01 FF 3C
39 B9 11 00 00 89 30 80 0C 30 05 A0 00 3C 02 D0 02 D0 02 00 02 C2 00 20 05 D9 00 0A 00 0F 02 09 01 46
39 BA 11 00 00 89 30 80 09 24 04 38 00 3C 02 1C 02 1C 02 00 02 52 00 20 05 30 00 07 00 0F 02 09 01 B2
39 BB 11 00 00 89 30 80 06 18 02 D0 00 3C 01 68 01 68 02 00 01 E1 00 20 04 3A 00 05 00 0F 02 09 02 8B
15 B0 55
39 E3 01 93 E8 E8 E8 E8 E8 E8 E8 FF 00 ED
39 EC 3F 03 05 AF 03 01 6B 03 01 6B 00 FF 80 00 80 00 80 00 80 00 ED 7E FB 79 F7 75 F2 70 00 CA 79 F3
39 ED 6C E5 5F D8 52
39 CC 88 0A 4B 6C FF 58 60 60 80 67 70 80 7A 74 6E 60 79 65 60 60 68 74 67 87 7A 74 6A 60 7A 7A 5C 6C
39 CD 6C 80 80 7A 79 75 6A 68 7C 83 83 83 83 83 83 83 83 83 83 83 83 83 83 83 83 83 83 83 83 83 83 83
39 CE 83 83 83 83 83 83 83 7A 83 83 83 83 83 7F 7F 7F 7F 7F 7F 7F 7E 7E 7E 7F 7F F4 00 06 02 01 0A E4
39 CF EF EF EF F6 06 00 0A 81 D3 FF 4C 50 48 48 4C 50 50 4A 45 4E 4C 52 54 54 54 58 58 68 65 6B 53 5B
39 D0 50 56 66 66 6C 68 7A 6A 80 72 6F 66 68 6A 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80
39 D1 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 7F 7F 7F 7F 7F 7E 7F 7D 7E 7F 7F 7E FB 06
39 D2 FB F6 03 0C F4 E9 EF FB 03 01 00 0A 81 D3 FF 48 44 44 4E 53 52 50 50 4C 60 54 50 4C 50 4C 56 5A
39 D3 62 5F 60 5D 64 60 60 60 5D 61 69 68 79 77 6B 80 80 80 7D 80 80 80 80 80 80 80 80 80 80 80 80 80
39 D4 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 7F 7E 7F 7F 7F 7F 7F 7E 7F
39 D5 7D 7F 7F FB 0C 0A 0A 03 03 F8 F2 0A 15 01 F4 00 0A 81 D3 FF 48 46 40 3A 42 42 4C 4C 3C 38 38 44
39 D6 4D 54 46 4A 49 58 59 5D 42 38 3A 4A 5E 68 60 5A 68 58 70 66 56 4A 4A 5F 80 80 80 80 80 80 80 80
39 D7 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 7F 7F 7E 7E
39 D8 7F 7D 7F 7A 7C 7E 7F 7E FB F8 ED F2 06 15 F8 DC E2 F2 03 0C
39 55 16 29 C0 04 78 DB
FF 3C
05 29
</DSIInitSequence>
<DSITermSequence> 05 28
 FF 0A
 05 10
 FF 96
</DSITermSequence>
<DisplayHeight>3120</DisplayHeight>
<Group id='Backlight Configuration'>
 <BacklightType>3</BacklightType>
<BacklightSteps>1</BacklightSteps>
<BrightnessMaxLuminance>400000</ BrightnessMaxLuminance>
<BrightnessMinLuminance>100</BrightnessMinLuminance>
<BrightnessRangeLevel0>100 400000 1 0</BrightnessRangeLevel0>
</Group>
"})
