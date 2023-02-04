Name (PCFG, Buffer (){"<?xml version='1.0' encoding='utf-8'?>
<PanelDescription>NUBIA JDI DSI Command Mode Panel (1080x2160 24bpp)</PanelDescription>
<Group id='Active Timing'>
 <HorizontalActive>1080</HorizontalActive>
 <HorizontalFrontPorch>96</HorizontalFrontPorch>
 <HorizontalBackPorch>64</HorizontalBackPorch>
 <HorizontalSyncPulse>16</HorizontalSyncPulse>
 <HorizontalSyncSkew>0</HorizontalSyncSkew>
 <HorizontalLeftBorder>0</HorizontalLeftBorder>
 <HorizontalRightBorder>0</HorizontalRightBorder>
 <VerticalActive>2160</VerticalActive>
 <VerticalFrontPorch>4</VerticalFrontPorch>
 <VerticalBackPorch>16</VerticalBackPorch>
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
 <DSIRefreshRate>0x3C0000</DSIRefreshRate>
 <DSICmdSwapInterface>False</DSICmdSwapInterface>
 <DSICmdUsingTrigger>False</DSICmdUsingTrigger>
 <DSIEnableAutoRefresh>True</DSIEnableAutoRefresh>
 <DSIAutoRefreshFrameNumDiv>1</DSIAutoRefreshFrameNumDiv>
 <DSIClockHSForceRequest>1</DSIClockHSForceRequest>
 <DSITECheckEnable>True</DSITECheckEnable>
 <DSITEUsingDedicatedTEPin>True</DSITEUsingDedicatedTEPin>
 <DSITEvSyncStartPos>1920</DSITEvSyncStartPos>
 <DSITEvSyncInitVal>1920</DSITEvSyncInitVal>
 <DSIControllerMapping>00</DSIControllerMapping>
</Group>
<DSIInitSequence>
 15 35 00
 39 2a 00 00 04 37
 39 2b 00 00 08 6f
 39 51 0f ff
 15 53 24
 29 F0 5A 5A
 29 F1 5A 5A
 29 E8 56 7F 03 06 08 0B 15 20 1D 1C 5E 49 5D 73 83 99 39 4B 63 73 41 7F 04 08 0C 10 1E 2E 31 33 75 5E 6F 80 8E A2 3E 4D 64 74 00 7F 11 21 2E 38 4E 67 6E 6D AA 8C 95 9C A7 B6 4B 57 69 76
 29 E9 56 7F 03 06 08 0B 15 20 1D 1C 5E 49 5D 73 83 99 39 4B 63 73 41 7F 04 08 0C 10 1E 2E 31 33 75 5E 6F 80 8E A2 3E 4D 64 74 00 7F 11 21 2E 38 4E 67 6E 6D AA 8C 95 9C A7 B6 4B 57 69 76
 23 D0 08
 29 F0 A5 A5
 29 F1 5A 5A
 39 44 08 00
 05 11
 ff 50
 29 F0 5A 5A
 39 B0 05
 39 C4 AE
 39 B0 07
 39 C4 41
 39 BE 02 CC CC CC 65 43 21 01 0C 0D 0E 0F 05 0B 1C 1C 1C 1C 1C 1C 07 1C 05 0F 0E 0D 0C 03 00
 39 BD 78 00 05 14 B5 10 02 80 00 00 01 09 1C 00 22 45 41 40 68 00 00 18 40 02 2A 00 00 02 00 05 37 00 05 18 18 00 00 20 00 00 00 00 00 00 01 00 10 00 35 06 06 1B 00 00 10 80 80
 29 F0 A5 A5
 39 2c
 15 29
 15 35 00
</DSIInitSequence>
<TLMMGPIODefaultHigh units='hex list'>34</TLMMGPIODefaultHigh>
<Group id='Backlight Configuration'>
 <BacklightType>1</BacklightType>
 <BacklightPmicControlType>2</BacklightPmicControlType>
</Group>
"})
