Name (PCFG, Buffer(){"
<?xml version='1.0' encoding='utf-8'?>
<PanelName>TD4362-E</PanelName>
<PanelDescription>TD4362 Single DSI Cmd Mode Panel(1080*2160 24bpp)</PanelDescription>
<Group id='Active Timing'>
  <HorizontalActive>1080</HorizontalActive>
  <HorizontalFrontPorch>44</HorizontalFrontPorch>
  <HorizontalBackPorch>60</HorizontalBackPorch>
  <HorizontalSyncPulse>2</HorizontalSyncPulse>
  <VerticalActive>2242</VerticalActive>
  <VerticalFrontPorch>8</VerticalFrontPorch>
  <VerticalBackPorch>100</VerticalBackPorch>
  <VerticalSyncPulse>2</VerticalSyncPulse>
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
  <DSITrafficMode>2</DSITrafficMode>
  <DSILanes>4</DSILanes>
  <DSIRefreshRate>0x3C0000</DSIRefreshRate>
  <DSICmdSwapInterface>False</DSICmdSwapInterface>
  <DSICmdUsingTrigger>False</DSICmdUsingTrigger>
  <DSIEnableAutoRefresh>True</DSIEnableAutoRefresh>
  <DSITECheckEnable>True</DSITECheckEnable>
  <DSITEUsingDedicatedTEPin>True</DSITEUsingDedicatedTEPin>
  <DSITEvSyncStartPos>2242</DSITEvSyncStartPos>
  <DSITEvSyncInitVal>2242</DSITEvSyncInitVal>
  <DSIControllerMapping>
  00 
  </DSIControllerMapping>
</Group>
<DSIInitSequence> 39 51 ff
 39 53 24
 39 55 82
 39 35 00
 39 2a 00 00 04 37
 39 2b 00 00 08 c1
 39 44 07 fa
 05 11 00
 ff 78
 05 29 00
 ff 20
 29 B0 04
 29 B9 9B 51 07 E6 00 10 00
 29 BA BB 2F 1D BE 00 10 04
 29 CE 5D 40 60 78 87 94 9E AB B8 C4 CD D6 DE E5 EC F3 FD FF 04 28 04 04 42 00 69 5A 40 01 F4 00 00 04 FA 00
 29 CA 1D FC FC FC 00 07 07 00 00 00 EB E7 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 29 F9 64
 29 B0 03
</DSIInitSequence>
<DSITermSequence> 05 28
 ff ff
 05 10
 ff ff
</DSITermSequence>
<TLMMGPIODefaultHigh>34</TLMMGPIODefaultHigh>
<Group id='Backlight Configuration'>
  <BacklightType>1</BacklightType>
  <BacklightPmicControlType>2</BacklightPmicControlType>
  <DisplayResetInfo>0 5000 5000 1000 0</DisplayResetInfo>
</Group>
"})