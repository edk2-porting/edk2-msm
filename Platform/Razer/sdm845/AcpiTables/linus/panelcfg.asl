Name (PCFG, Buffer(){"
<?xml version='1.0' encoding='utf-8'?>
<PanelName>NT36830</PanelName>
<PanelDescription>Novatek Dual DSI WQHD Cmd Mode Panel External CLK (1440x2560 10-bit)</PanelDescription>
<Group id='Active Timing'> 
 <HorizontalActive>1440</HorizontalActive> 
 <HorizontalFrontPorch>20</HorizontalFrontPorch> 
 <HorizontalBackPorch>12</HorizontalBackPorch> 
 <HorizontalSyncPulse>8</HorizontalSyncPulse> 
 <HorizontalSyncSkew>0</HorizontalSyncSkew> 
 <HorizontalLeftBorder>0</HorizontalLeftBorder> 
 <HorizontalRightBorder>0</HorizontalRightBorder> 
 <VerticalActive>2560</VerticalActive> 
 <VerticalFrontPorch>16</VerticalFrontPorch> 
 <VerticalBackPorch>14</VerticalBackPorch> 
 <VerticalSyncPulse>2</VerticalSyncPulse> 
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
 <DSIDSCEnable>True</DSIDSCEnable> 
 <DSIDSCMajor>1</DSIDSCMajor> 
 <DSIDSCMinor>1</DSIDSCMinor> 
 <DSIDSCScr>0</DSIDSCScr> 
 <DSIDSCProfileID>0xA</DSIDSCProfileID> 
 <DSIDSCSliceWidth>720</DSIDSCSliceWidth> 
 <DSIDSCSliceHeight>8</DSIDSCSliceHeight> 
 <DSILanes>4</DSILanes> 
 <DSIHsaHseAfterVsVe>False</DSIHsaHseAfterVsVe>
 <DSILowPowerModeInHFP>False</DSILowPowerModeInHFP>
 <DSILowPowerModeInHBP>False</DSILowPowerModeInHBP>
 <DSILowPowerModeInHSA>False</DSILowPowerModeInHSA>
 <DSILowPowerModeInBLLPEOF>True</DSILowPowerModeInBLLPEOF>
 <DSILowPowerModeInBLLP>True</DSILowPowerModeInBLLP>
 <DSIRefreshRate>0x780000</DSIRefreshRate> 
 <DSIBitClockFrequency>531000000</DSIBitClockFrequency> 
 <DSICmdSwapInterface>False</DSICmdSwapInterface> 
 <DSICmdUsingTrigger>False</DSICmdUsingTrigger> 
 <DSIEnableAutoRefresh>True</DSIEnableAutoRefresh> 
 <DSIAutoRefreshFrameNumDiv>4</DSIAutoRefreshFrameNumDiv> 
 <DSITECheckEnable>True</DSITECheckEnable> 
 <DSITEUsingDedicatedTEPin>True</DSITEUsingDedicatedTEPin> 
 <DSITEvSyncStartPos>2560</DSITEvSyncStartPos> 
 <DSITEvSyncInitVal>2560</DSITEvSyncInitVal> 
 <DSIPacketTransferHS>True</DSIPacketTransferHS> 
 <DSILP11AtInit>True</DSILP11AtInit> 
 <DSIControllerMapping>
  00 01
 </DSIControllerMapping>
 <DSITimingCLKZeroOverride>True</DSITimingCLKZeroOverride> 
 <DSITimingCLKZeroValue>0x13</DSITimingCLKZeroValue> 
 <DSITimingCLKPrepareOverride>True</DSITimingCLKPrepareOverride> 
 <DSITimingCLKPrepareValue>0x05</DSITimingCLKPrepareValue> 
 <DSITimingCLKTrailOverride>True</DSITimingCLKTrailOverride> 
 <DSITimingCLKTrailValue>0x04</DSITimingCLKTrailValue> 
 <DSITimingHSExitOverride>True</DSITimingHSExitOverride> 
 <DSITimingHSExitValue>0x1f</DSITimingHSExitValue> 
 <DSITimingHSZeroOverride>True</DSITimingHSZeroOverride> 
 <DSITimingHSZeroValue>0x1e</DSITimingHSZeroValue> 
 <DSITimingHSPrepareOverride>True</DSITimingHSPrepareOverride> 
 <DSITimingHSPrepareValue>0x05</DSITimingHSPrepareValue> 
 <DSITimingHSTrailOverride>True</DSITimingHSTrailOverride> 
 <DSITimingHSTrailValue>0x05</DSITimingHSTrailValue> 
 <DSITimingHSRequestOverride>True</DSITimingHSRequestOverride> 
 <DSITimingHSRequestValue>0x03</DSITimingHSRequestValue> 
 <DSITimingTASureOverride>True</DSITimingTASureOverride> 
 <DSITimingTASureValue>0</DSITimingTASureValue> 
 <DSITimingTAGoOverride>True</DSITimingTAGoOverride> 
 <DSITimingTAGoValue>3</DSITimingTAGoValue> 
 <DSITimingTAGetOverride>True</DSITimingTAGetOverride> 
 <DSITimingTAGetValue>4</DSITimingTAGetValue> 
 <DSITimingCLKPreOverride>True</DSITimingCLKPreOverride> 
 <DSITimingCLKPreValue>0x21</DSITimingCLKPreValue> 
 <DSITimingCLKPostOverride>True</DSITimingCLKPostOverride> 
 <DSITimingCLKPostValue>0x0b</DSITimingCLKPostValue>
</Group>
<DSIInitSequence> 
 FF 01
 29 FF D0
 29 75 40
 29 F1 40
 FF 0A
 29 FF 10
 39 2C 01 02 04 08 10
 FF 0A
 29 FF D0
 29 75 00
 29 F1 00
 FF 0A
 29 FF 10
 29 FB 01
 29 BA 03
 29 BC 00
 29 C0 83
 39 C1 ab 28 00 08 02 00 02 68 00 d5 00 0a 0d b7 09 89
 39 C2 10 f0
 29 D5 00
 29 D6 00
 29 DE 00
 29 E1 00
 29 E5 01
 29 BB 10
 29 F6 71
 29 F7 80
 29 35 00
 29 FF 20
 29 FB 01
 29 87 02
 29 5D 00
 29 5E 14
 29 5F EB
 29 96 00
 29 97 6D
 29 98 6D
 29 AE 00
 29 FF 21
 29 FB 01
 29 e0 24
 39 e1 42 0a 86 53 1b 97 0a 86 42 1b 97 53
 39 e2 86 42 0a 97 53 1b 0a 86 42 1b 97 53
 29 FF 20
 29 FB 01
 39 B0 00 01 00 21 00 43 00 5B 00 72 00 83 00 96 00 A5
 39 B1 00 B2 00 E1 01 09 01 4B 01 80 01 D3 02 16 02 19
 39 B2 02 58 02 9B 02 C4 02 FB 03 1F 03 4B 03 5B 03 69
 39 B3 03 7C 03 93 03 B7 03 CF 03 E1 03 E6 00 00
 39 B4 00 C0 00 CA 00 D5 00 E0 00 EA 00 F4 00 FD 01 06
 39 B5 01 0F 01 2F 01 4B 01 7B 01 A6 01 EC 02 28 02 2A
 39 B6 02 65 02 A6 02 CE 03 04 03 27 03 51 03 62 03 71
 39 B7 03 86 03 9E 03 B6 03 CD 03 DF 03 E6 00 BF
 39 B8 01 12 01 18 01 20 01 27 01 2E 01 35 01 3B 01 42
 39 B9 01 48 01 61 01 77 01 9E 01 C2 02 00 02 37 02 39
 39 BA 02 71 02 B0 02 D9 03 11 03 37 03 5C 03 6E 03 81
 39 BB 03 9D 03 B6 03 CA 03 DA 03 E4 03 E6 01 11
 29 FF 21
 29 FB 01
 39 B0 00 01 00 21 00 43 00 5B 00 72 00 83 00 96 00 A5
 39 B1 00 B2 00 E1 01 09 01 4B 01 80 01 D3 02 16 02 19
 39 B2 02 58 02 9B 02 C4 02 FB 03 1F 03 4B 03 5B 03 69
 39 B3 03 7C 03 93 03 B7 03 CF 03 E1 03 E6 00 00
 39 B4 00 C0 00 CA 00 D5 00 E0 00 EA 00 F4 00 FD 01 06
 39 B5 01 0F 01 2F 01 4B 01 7B 01 A6 01 EC 02 28 02 2A
 39 B6 02 65 02 A6 02 CE 03 04 03 27 03 51 03 62 03 71
 39 B7 03 86 03 9E 03 B6 03 CD 03 DF 03 E6 00 BF
 39 B8 01 12 01 18 01 20 01 27 01 2E 01 35 01 3B 01 42
 39 B9 01 48 01 61 01 77 01 9E 01 C2 02 00 02 37 02 39
 39 BA 02 71 02 B0 02 D9 03 11 03 37 03 5C 03 6E 03 81
 39 BB 03 9D 03 B6 03 CA 03 DA 03 E4 03 E6 01 11
 29 FF 23
 29 FB 01
 29 06 22
 29 FF 24
 29 FB 01
 29 14 00
 29 15 10
 29 16 00
 29 17 10
 29 B4 00
 29 B6 30
 29 24 0F
 29 25 40
 29 FF 26
 29 FB 01
 29 60 00
 29 62 00
 29 40 00
 29 FF 28
 29 FB 01
 29 91 02
 29 FF E0
 29 FB 01
 29 48 81
 29 8E 09
 29 FF F0
 29 FB 01
 29 33 20
 29 34 35
 29 FF 10
 39 51 0F FF
 29 55 03
 29 53 2C
 29 B1 04
 05 11 00
 FF 78
 05 29 00
</DSIInitSequence>
<DSITermSequence>
 15 FF 10
 15 bc 00
 05 28 00
 FF 22
 05 10 00
 FF B4
</DSITermSequence>
<TLMMGPIODefaultLow>5B</TLMMGPIODefaultLow>
<Group id='Backlight Configuration'> 
 <BacklightType>1</BacklightType>
 <BacklightPmicControlType>2</BacklightPmicControlType>
</Group>
"})
