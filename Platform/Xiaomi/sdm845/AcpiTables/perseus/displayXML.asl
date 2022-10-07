Name (PCFG, Buffer(){"
<?xml version='1.0' encoding='utf-8'?>
<PanelName>SAMSUNG_EA8076_FHD</PanelName>
<PanelDescription>Samsung ea8076 Single DSI Command Mode Panel (1080x2340 24bpp)</PanelDescription>
<Group id='Active Timing'>
    <HorizontalActive>1080</HorizontalActive>
    <HorizontalFrontPorch>64</HorizontalFrontPorch>
    <HorizontalBackPorch>64</HorizontalBackPorch>
    <HorizontalSyncPulse>20</HorizontalSyncPulse>
    <HorizontalSyncSkew>0</HorizontalSyncSkew>
    <HorizontalLeftBorder>0</HorizontalLeftBorder>
    <HorizontalRightBorder>0</HorizontalRightBorder>
    <VerticalActive>2340</VerticalActive>
    <VerticalFrontPorch>64</VerticalFrontPorch>
    <VerticalBackPorch>64</VerticalBackPorch>
    <VerticalSyncPulse>20</VerticalSyncPulse>
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
    <DSIBitClockFrequency>1100000000</DSIBitClockFrequency>
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
    <DSIControllerMapping>
  00
    </DSIControllerMapping>
    <DSITECheckEnable>True</DSITECheckEnable>
    <DSITEUsingDedicatedTEPin>True</DSITEUsingDedicatedTEPin>
    <DSITimingCLKPrepareOverride>True</DSITimingCLKPrepareOverride>
    <DSITEvSyncStartPos>2340</DSITEvSyncStartPos>
    <DSITEvSyncInitVal>2340</DSITEvSyncInitVal>
    <DSITimingCLKPrepareValue>7</DSITimingCLKPrepareValue>
    <DSITimingHSPrepareOverride>True</DSITimingHSPrepareOverride>
    <DSITimingHSPrepareValue>7</DSITimingHSPrepareValue>
</Group>
<DSIInitSequence> 05 11
 FF 0A
 39 F0 5A 5A
 15 35 00
 39 B7 01 4B
 39 F0 A5 A5
 39 2B 00 00 09 23
 39 F0 5A 5A
 39 B0 07
 39 D9 88 2E
 39 F0 A5 A5
 39 F0 5A 5A
 39 FC 5A 5A
 39 E9 11 55 A6 75 A3 B8 BB 2A 00 1A B8
 39 F0 A5 A5
 39 FC A5 A5
 39 F0 5A 5A
 39 B0 09
 39 D8 00
 39 F0 A5 A5
 39 51 00 00
 15 53 28
 15 55 00
 FF 78
 05 29
</DSIInitSequence>
<Group id='Backlight Configuration'>
    <BacklightType>3</BacklightType>
    <BacklightPmicControlType>2</BacklightPmicControlType>
    <DisplayResetInfo>0 1000 1000 10000 0</DisplayResetInfo>
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