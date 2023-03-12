Name (PCFG, Buffer(){" 
<?xml version='1.0' encoding='utf-8'?>
<PanelName>S6E3FA5</PanelName>
<PanelDescription>samsung s6e3fa5 cmd mode dsi panel(1080x1920 24bpp)</PanelDescription>
<Group id='Active Timing'>
 <HorizontalActive>1080</HorizontalActive>
 <HorizontalFrontPorch>120</HorizontalFrontPorch>
 <HorizontalBackPorch>70</HorizontalBackPorch>
 <HorizontalSyncPulse>19</HorizontalSyncPulse>
 <HorizontalSyncSkew>0</HorizontalSyncSkew>
 <HorizontalLeftBorder>0</HorizontalLeftBorder>
 <HorizontalRightBorder>0</HorizontalRightBorder>
 <VerticalActive>1920</VerticalActive>
 <VerticalFrontPorch>18</VerticalFrontPorch>
 <VerticalBackPorch>4</VerticalBackPorch>
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
 <DSILanes>4</DSILanes>
 <DSIRefreshRate>0x3C0000</DSIRefreshRate>
 <DSICmdSwapInterface>False</DSICmdSwapInterface>
 <DSICmdUsingTrigger>False</DSICmdUsingTrigger>
 <DSIEnableAutoRefresh>True</DSIEnableAutoRefresh>
 <DSIAutoRefreshFrameNumDiv>1</DSIAutoRefreshFrameNumDiv>
 <PanelOrientation>02</PanelOrientation>
 <DSIControllerMapping>
  00
 </DSIControllerMapping>
 <DSILP11AtInit>True</DSILP11AtInit>
 </Group>
 <DSIInitSequence> 05 11
 ff 78
 15 35 00
 39 F0 5A 5A
 39 B0 04
 39 B4 06 0C 12
 39 F0 A5 A5
 15 53 20
 15 55 00
 39 F0 5A 5A
 39 C3 01
 39 B0 18
 39 C3 00
 39 F0 A5 A5
 ff 0A
 05 29
</DSIInitSequence>
<DSITermSequence> 05 28
 ff 28
 05 10
 ff A0
</DSITermSequence>
<Group id='Backlight Configuration'>
 <BacklightType>3</BacklightType>
 <BacklightDefault>50</BacklightDefault>
 <BacklightSteps>100</BacklightSteps>
 <DisplayPrimaryFlags>0x4</DisplayPrimaryFlags>
 <BrightnessMinLuminance>2000</BrightnessMinLuminance>
 <BrightnessMaxLuminance>360000</BrightnessMaxLuminance>
 <DisplayResetInfo>0 2000 5000 12000 0</DisplayResetInfo>
 </Group>
"})
