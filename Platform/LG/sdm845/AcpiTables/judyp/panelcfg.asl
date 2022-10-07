Name (PCFG, Buffer(){" 
<?xml version='1.0' encoding='utf-8'?>
<PanelName>SW43402</PanelName>
<PanelDescription>LGD Single DSI Command Mode DSC POLED DV4_0 Revision Panel (1440x2880 24bpp LowPower)</PanelDescription>
<Group id='Active Timing'>
 <HorizontalActive>1440</HorizontalActive>
 <HorizontalFrontPorch>92</HorizontalFrontPorch>
 <HorizontalBackPorch>48</HorizontalBackPorch>
 <HorizontalSyncPulse>32</HorizontalSyncPulse>
 <HorizontalSyncSkew>0</HorizontalSyncSkew>
 <HorizontalLeftBorder>0</HorizontalLeftBorder>
 <HorizontalRightBorder>0</HorizontalRightBorder>
 <VerticalActive>2880</VerticalActive>
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
 <DSIDSCSliceHeight>16</DSIDSCSliceHeight>
 <DSITECheckEnable>True</DSITECheckEnable>
 <DSITEUsingDedicatedTEPin>True</DSITEUsingDedicatedTEPin>
 <DSITEvSyncStartPos>2880</DSITEvSyncStartPos>
 <DSITEvSyncInitVal>2880</DSITEvSyncInitVal>
 <DSIControllerMapping>
  00
 </DSIControllerMapping>
 <DisplayResetInfo>0 10000 1000 25000 0</DisplayResetInfo>
</Group>
<DSIInitSequence>
 39 B0 20
 39 F2 00
 39 FF 03
 FF 01
 05 35
 05 11
 FF 3C
 15 53 07
 15 55 0C
 39 B0 A5
 39 B2 5D
 39 E8 08
 39 D4 10
 39 FB 03
 39 ED 13
 39 E2 20
 39 E7 00
 39 CE 81
 FF 5A
 39 E7 00
 FF 46
 05 29
</DSIInitSequence>
<DSIUsePostPanelOn>False</DSIUsePostPanelOn>
<DSIPostInitSequence>
 FF 14
 05 29
</DSIPostInitSequence><DSITermSequence>
 39 51 03
 05 28
 05 10
</DSITermSequence>
<Group id='Backlight Configuration'>
 <BacklightType>3</BacklightType>
    <BacklightPmicControlType>2</BacklightPmicControlType>
    <BacklightSteps>100</BacklightSteps>
    <BacklightPMICBankSelect>15</BacklightPMICBankSelect>
    <BacklightPMICPWMFrequency>600000</BacklightPMICPWMFrequency>
    <BacklightDefault>80</BacklightDefault>
    <BacklightLowPower>40</BacklightLowPower>
    <PMIPowerPmicNumber>1</PMIPowerPmicNumber>
    <PMIPowerPmicModel>21</PMIPowerPmicModel>
    <PMIPowerconfig>1</PMIPowerConfig>
    <BrightnessMinLuminance>3230</BrightnessMinLuminance>
    <BrightnessMaxLuminance>4300000</BrightnessMaxLuminance>
</Group>
"})
