Name (PCFG, Buffer (){
"<?xml version='1.0' encoding='utf-8'?>
  <PanelDescription>NUBIA BOE DSI Command Mode Panel (1080x2280 24bpp)</PanelDescription><Group id='Active Timing'>        
  <HorizontalActive>1080</HorizontalActive>        
  <HorizontalFrontPorch>20</HorizontalFrontPorch>        
  <HorizontalBackPorch>80</HorizontalBackPorch>        
  <HorizontalSyncPulse>8</HorizontalSyncPulse>        
  <HorizontalSyncSkew>0</HorizontalSyncSkew>        
  <HorizontalLeftBorder>0</HorizontalLeftBorder>        
  <HorizontalRightBorder>0</HorizontalRightBorder>        
  <VerticalActive>2280</VerticalActive>        
  <VerticalFrontPorch>20</VerticalFrontPorch>        
  <VerticalBackPorch>8</VerticalBackPorch>       
  <VerticalSyncPulse>4</VerticalSyncPulse>        
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
  <DSILP11AtInit>True</DSILP11AtInit>
  <DSIRefreshRate>0x3C0000</DSIRefreshRate> 
  <DSICmdSwapInterface>False</DSICmdSwapInterface> 
  <DSICmdUsingTrigger>False</DSICmdUsingTrigger> 
  <DSIEnableAutoRefresh>True</DSIEnableAutoRefresh> 
  <DSIClockHSForceRequest>1</DSIClockHSForceRequest> 
  <DSIAutoRefreshFrameNumDiv>1</DSIAutoRefreshFrameNumDiv> 
  <DSITECheckEnable>True</DSITECheckEnable> 
  <DSITEUsingDedicatedTEPin>True</DSITEUsingDedicatedTEPin> 
  <DSITEvSyncStartPos>2280</DSITEvSyncStartPos> 
  <DSITEvSyncInitVal>2280</DSITEvSyncInitVal> 
  <DSIControllerMapping>
   00 
  </DSIControllerMapping>
 </Group>

 <DSIInitSequence>
  39 51 0f ff
  39 53 24
  05 35
  39 53 2c
  39 55 01
  39 B9 83 11 2E
  39 BD 02
  39 DF 87 0E 00
  39 BD 03
  39 DF 20 20 20 7F 7F 20 B4 3D 2D B1 A5 92 C0 0C 00 7F 00 7F 00 00 00 00 10 7E 7D 08 7F 82 6C 22 50 26 96 0C 00 80 00 03 00 70 14 00 00 3E 00
  39 BD 00
  39 E3 09
  39 EF 10 08 7F 70 70 6A 6A 88 88
  05 11
  ff 80
  05 29
  ff 80
 </DSIInitSequence>

 <TLMMGPIODefaultHigh units='hex list'>
  34
 </TLMMGPIODefaultHigh>

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
  <BrignessMinLuminance>200</BrignessMinLuminance>
  <BrignessMaxLuminance>319970</BrignessMaxLuminance>
 </Group>
"})
