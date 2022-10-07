Name (PCFG, Buffer(){" 
<?xml version='1.0' encoding='utf-8'?>
<PanelName>SW49410_rev1</PanelName>
<PanelDescription>LGD Single DSI Command Mode DSC Panel Rev1(1440x3120 24bpp)</PanelDescription>
<Group id='Active Timing'>
  <HorizontalActive>1440</HorizontalActive>
  <HorizontalFrontPorch>92</HorizontalFrontPorch>
  <HorizontalBackPorch>48</HorizontalBackPorch>
  <HorizontalSyncPulse>32</HorizontalSyncPulse>
  <HorizontalSyncSkew>0</HorizontalSyncSkew>
  <HorizontalLeftBorder>0</HorizontalLeftBorder>
  <HorizontalRightBorder>0</HorizontalRightBorder>
  <VerticalActive>3120</VerticalActive>
  <VerticalFrontPorch>10</VerticalFrontPorch>
  <VerticalBackPorch>25</VerticalBackPorch>
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
  <DSIRefreshRate>0x3C0000</DSIRefreshRate>
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
  <DSIDSCSliceHeight>16</DSIDSCSliceHeight>
  <DSITECheckEnable>True</DSITECheckEnable>
  <DSITEUsingDedicatedTEPin>True</DSITEUsingDedicatedTEPin>
  <DSITEvSyncStartPos>2880</DSITEvSyncStartPos>
  <DSITEvSyncInitVal>2880</DSITEvSyncInitVal>
  <DSIControllerMapping>
  00
 </DSIControllerMapping>
 <DisplayResetInfo>0 10000 1000 5000 0</DisplayResetInfo>
</Group>
<DSIInitSequence>15 35 00
39 2B 00 00 0C 2F
15 51 FF
15 53 2C
15 5E 00
15 55 81
15 B0 AC
39 30 00 00 03 1F
39 B3 04 04 28 08 5A 12 23 02
39 B4 11 04 02 02 02 02 02 01 01 01 01 01 01 D0 E4 E4 E4 93 4E 39 0A 10 18 25 24 00 00 00 00 00 00
39 B5 2E 0F 10 C0 00 10 C0 00
39 B6 03 05 0B B3 30
39 B8 57 02 90 40 5D D0 05 00 00 18 22 04 01 02 90 40 4C C0 04 00 00 18 22 04 01 08 00 3A 86 83 00
39 B9 64 64 2A 3F EE
39 BA 3D 1F 01 FF 01 3C 1F 01 FF 01 00
39 BC 00 00 00 10
39 BD 00 00
39 BF 4F 02
39 C0 00 04 18 07 11 11 3C 00 0A 0A
39 C1 01 00 F0 C2 CF 0C
39 C2 CC 44 44 20 22 26 21 00
39 C3 92 11 09 09 11 CC 02 02 A4 A4 02 A2 38 28 14 40 38 C0
39 C4 26 00
39 C9 05 5D 03 04 00
39 CA 9B 10
39 CB F3 90 3D 30 CC
39 CC 00 40 50 90 41
39 CD 09 86 C2 80 00 00 00 00 00 00 00 00 0C 12 00 00 00
39 CE 00 00
39 D0 12 05 20 1B 2C 28 3F 3D 4F 4F 66 66 6E 6E 76 76 80 80 88 88 95 95 3F 3F A2 A2 94 94 8B 8B 81 81 75 75 66 66 47 47 2D 2D 00 01 12 05 20 1B 2C 28 3F 3D 4f 4f 66 66 6e 6e 76 76 80 80 88 88 95 95 3F 3F A2 A2 94 94 8b 8b 81 81 75 75 66 66 47 47 2d 2d 00 01 12 05 20 1B 2C 28 3F 3D 4f 4f 66 66 6e 6e 76 76 80 80 88 88 95 95 3F 3F A2 A2 94 94 8b 8b 81 81 75 75 66 66 47 47 2d 2d 00 01 12 05 20 1B 2C 28 3F 3D 4f 4f 66 66 6e 6e 76 76 80 80 88 88 94 94 3F 3F A4 A4 95 95 8b 8b 81 81 75 75 66 66 47 47 2d 2d 00 01
39 D1 12 05 20 1B 2C 28 3F 3D 4F 4F 66 66 6E 6E 76 76 80 80 88 88 95 95 3F 3F A2 A2 94 94 8B 8B 81 81 75 75 66 66 47 47 2D 2D 00 01 12 05 20 1B 2C 28 3F 3D 4f 4f 66 66 6e 6e 76 76 80 80 88 88 95 95 3F 3F A2 A2 94 94 8b 8b 81 81 75 75 66 66 47 47 2d 2d 00 01 12 05 20 1B 2C 28 3F 3D 4f 4f 66 66 6e 6e 76 76 80 80 88 88 95 95 3F 3F A2 A2 94 94 8b 8b 81 81 75 75 66 66 47 47 2d 2d 00 01 12 05 20 1B 2C 28 3F 3D 4f 4f 66 66 6e 6e 76 76 80 80 88 88 94 94 3F 3F A4 A4 95 95 8b 8b 81 81 75 75 66 66 47 47 2d 2d 00 01
39 D2 12 05 20 1B 2C 28 3F 3D 4F 4F 66 66 6E 6E 76 76 80 80 88 88 95 95 3F 3F A2 A2 94 94 8B 8B 81 81 75 75 66 66 47 47 2D 2D 00 01 12 05 20 1B 2C 28 3F 3D 4f 4f 66 66 6e 6e 76 76 80 80 88 88 95 95 3F 3F A2 A2 94 94 8b 8b 81 81 75 75 66 66 47 47 2d 2d 00 01 12 05 20 1B 2C 28 3F 3D 4f 4f 66 66 6e 6e 76 76 80 80 88 88 95 95 3F 3F A2 A2 94 94 8b 8b 81 81 75 75 66 66 47 47 2d 2d 00 01 12 05 20 1B 2C 28 3F 3D 4f 4f 66 66 6e 6e 76 76 80 80 88 88 94 94 3F 3F A4 A4 95 95 8b 8b 81 81 75 75 66 66 47 47 2d 2d 00 01
39 D3 12 01 00 00
39 D4 DC 5F 9C BE 39 39 39 47 48 48 48 3A 00 03 6D 80 00 00 8C 66 00 00 8C 66 00 00 8C 66 00 0A 48 80 00 0A 48 80 00 0A 48 80 00 0A 48 80 20 0A 14 0A 18 00 1C CC 23 9E 23 9E 01 01 01 01 04 04 04 04 01 00 02 80 00 10 00 10 00 10 13 9E 13 9E 13 9E 13 9E 05 05 05 05 05 05 05 05 23 9E FF FF 13 33 18 00 16 66 10 00 FF 01 00 02 00 03 00 04 00 05 00 06 00 07 00 08 00 09 00 0A 00 0B 00 0C 00 0D 00 0E 00 0F 00 1B 25 DC 18 00 20 00 1C E1 00 FF E0 C8 C8 41 8F
39 AD 01 02 03 04 05 06 06 06 06 06 06 06 06 06 06 06 20 40 60 90 C0 F0 FF FF FF FF FF FF FF FF FF FF
39 AE 01 02 03 04 05 06 06 06 06 06 06 06 06 06 06 06 20 40 60 90 C0 F0 FF FF FF FF FF FF FF FF FF FF
39 E5 0B 0A 0C 00 02 04 06 08 0F 1B 02 1A 1A 0B 0A 0C 01 03 05 07 09 10 1B 03 1A 1A
39 E6 11 12 13 14 15 16 17 18 11 12 13 14 15 16 17 18
39 ED 21 49 00 00 00 00
15 55 81
39 F3 00 01 00 0D 00
39 F4 00 00 40 83 C5 00 01 00 00 00 00 00 00
39 F5 00
39 F6 40 40 40 40 40 40 40 40 00 00 00 00 00 00 00 00
39 F7 40 40 40 40 40 40 40 40 00 00 00 00 00 00 00 00
39 F8 40 40 40 40 40 40 40 40 00 00 00 00 00 00 00 00
39 FB 20 40 60 80 a0 c0 e0 13 18 18 18 16 0D 0D 00 C7 CF D8 E1 EA F3 F9 FF
39 FC 13 70 D0 26 30 7C 02 FF 12 22 22 10 00
05 13
05 11
FF 80
05 29
FF 5A
</DSIInitSequence>
<DSITermSequence>
05 28 00
FF 20
05 10 00
FF 80
</DSITermSequence>
<Group id='Backlight Configuration'>
 <BacklightType>1</BacklightType>
 <BacklightPmicControlType>2</BacklightPmicControlType>
 <BacklightSteps>100</BacklightSteps>
 <BacklightPMICBankSelect>15</BacklightPMICBankSelect>
 <BacklightPMICPWMFrequency>600000</BacklightPMICPWMFrequency>
 <BacklightDefault>80</BacklightDefault>
 <BacklightLowPower>40</BacklightLowPower>
 <PMIPowerPmicNumber>1</PMIPowerPmicNumber>
 <PMIPowerPmicModel>21</PMIPowerPmicModel>
 <PMIPowerconfig>1</PMIPowerConfig>
 <AdaptiveBrightnessFeature>1</AdaptiveBrightnessFeature>
 <CABLEnable>True</CABLEnable>
 <BrignessMinLuminance>0</BrignessMinLuminance>
 <BrignessMaxLuminance>600000</BrignessMaxLuminance>
</Group>
<WLEDStrings>0,1,2,3</WLEDStrings>
<DisplayHeight>3120</DisplayHeight>
"})
