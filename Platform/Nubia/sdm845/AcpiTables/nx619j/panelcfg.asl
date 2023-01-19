Name (PCFG, Buffer (){
"<?xml version='1.0' encoding='utf-8'?>
<PanelName>TD4310</PanelName>
<PanelDescription>DSI JDI TD4310 1080 2160 5p99 video</PanelDescription>
<Group id='Active Timing'>       
 <HorizontalActive>1080</HorizontalActive>        
 <HorizontalFrontPorch>80</HorizontalFrontPorch>        
 <HorizontalBackPorch>42</HorizontalBackPorch>        
 <HorizontalSyncPulse>14</HorizontalSyncPulse>        
 <HorizontalSyncSkew>0</HorizontalSyncSkew>        
 <HorizontalLeftBorder>0</HorizontalLeftBorder>        
 <HorizontalRightBorder>0</HorizontalRightBorder>        
 <VerticalActive>2160</VerticalActive>        
 <VerticalFrontPorch>12</VerticalFrontPorch>        
 <VerticalBackPorch>14</VerticalBackPorch>        
 <VerticalSyncPulse>3</VerticalSyncPulse>        
 <VerticalSyncSkew>0</VerticalSyncSkew>        
 <VerticalTopBorder>0</VerticalTopBorder>        
 <VerticalBottomBorder>0</VerticalBottomBorder>        
 <InvertDataPolarity>False</InvertDataPolarity>        
 <InvertVsyncPolairty>False</InvertVsyncPolairty>        
 <InvertHsyncPolarity>False</InvertHsyncPolarity>        
 <BorderColor>0x0</BorderColor>
</Group>
<Group id='Display Interface'> 
 <InterfaceType>8</InterfaceType> 
 <InterfaceColorFormat>3</InterfaceColorFormat>
</Group>
<Group id='DSI Interface'> 
 <DSIChannelId>2</DSIChannelId> 
 <DSIVirtualId>0</DSIVirtualId> 
 <DSIColorFormat>36</DSIColorFormat> 	
 <DSITrafficMode>1</DSITrafficMode> 	
 <DSILanes>4</DSILanes>  	
 <DSICmdUsingTrigger>False</DSICmdUsingTrigger>	
 <DSICmdSwapInterface>False</DSICmdSwapInterface> 	
 <DSIHsaHseAfterVsVe units='Bool'>False</DSIHsaHseAfterVsVe>
 <DSILowPowerModeInHFP units='Bool'>False</DSILowPowerModeInHFP>
 <DSILowPowerModeInHBP units='Bool'>False</DSILowPowerModeInHBP>
 <DSILowPowerModeInHSA units='Bool'>False</DSILowPowerModeInHSA>
 <DSILowPowerModeInBLLPEOF units='Bool'>True</DSILowPowerModeInBLLPEOF>
 <DSILowPowerModeInBLLP units='Bool'>True</DSILowPowerModeInBLLP>
 <DSIRefreshRate units='integer Q16.16'>0x3C0000</DSIRefreshRate>
</Group>
<DSIInitSequence>
 15 35 00
 15 36 00
 39 44 03 E8
 15 53 0C
 15 55 00
 05 11
 FF 80
 05 29
 FF 2D
 15 51 FF
</DSIInitSequence>
<TLMMGPIODefaultHigh>5B</TLMMGPIODefaultHigh>
<Group id='Backlight Configuration'> 	
 <BacklightType>1</BacklightType>
 <BacklightPmicControlType>2</BacklightPmicControlType>
</Group>
"})
