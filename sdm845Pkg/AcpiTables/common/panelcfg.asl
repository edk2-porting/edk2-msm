Name (PCFG, 
    Buffer() {"<?xml version='1.0' encoding='utf-8'?>
<PanelName>TFT2P2827-E</PanelName>    
<PanelDescription>Truly Dual DSI Command Mode Panel (1440x2560 24bpp)</PanelDescription>
<Group id='EDID Configuration'>
    <ManufactureID>0x104D</ManufactureID>
    <ProductCode>850</ProductCode>
    <SerialNumber>0x000001</SerialNumber>
    <WeekofManufacture>0x01</WeekofManufacture>
    <YearofManufacture>0x1B</YearofManufacture>
    <EDIDVersion>1</EDIDVersion>
    <EDIDRevision>3</EDIDRevision>
    <VideoInputDefinition>0x80</VideoInputDefinition>
    <HorizontalScreenSize>0x07</HorizontalScreenSize>
    <VerticalScreenSize>0x0C</VerticalScreenSize>
    <DisplayTransferCharacteristics>0x78</DisplayTransferCharacteristics>
    <FeatureSupport>0x2</FeatureSupport>
    <Red.GreenBits>0xC8</Red.GreenBits>
    <Blue.WhiteBits>0xC0</Blue.WhiteBits>
    <RedX>0xA6</RedX>
    <RedY>0x51</RedY>
    <GreenX>0x4B</GreenX>
    <GreenY>0x9E</GreenY>
    <BlueX>0x25</BlueX>
    <BlueY>0x0E</BlueY>
    <WhiteX>0x48</WhiteX>
    <WhiteY>0x4B</WhiteY>
    <EstablishedTimingsI>0x0</EstablishedTimingsI>
    <EstablishedTimingsII>0x0</EstablishedTimingsII>
    <ManufacturesTiming>0x0</ManufacturesTiming>
    <StandardTimings1/>
    <StandardTimings2/>
    <StandardTimings3/>
    <StandardTimings4/>
    <StandardTimings5/>
    <StandardTimings6/>
    <StandardTimings7/>
    <SignalTimingInterface/>
</Group>
<Group id='Detailed Timing'>
    <HorizontalScreenSizeMM>0x44</HorizontalScreenSizeMM>
    <VerticalScreenSizeMM>0x78</VerticalScreenSizeMM>
    <HorizontalVerticalScreenSizeMM>0x00</HorizontalVerticalScreenSizeMM>
</Group>
<Group id='Active Timing'>
    <HorizontalActive>1440</HorizontalActive>
    <HorizontalFrontPorch>100</HorizontalFrontPorch>
    <HorizontalBackPorch>32</HorizontalBackPorch>
    <HorizontalSyncPulse>16</HorizontalSyncPulse>
    <HorizontalSyncSkew>0</HorizontalSyncSkew>
    <HorizontalLeftBorder>0</HorizontalLeftBorder>
    <HorizontalRightBorder>0</HorizontalRightBorder>
    <VerticalActive>2560</VerticalActive>
    <VerticalFrontPorch>8</VerticalFrontPorch>
    <VerticalBackPorch>7</VerticalBackPorch>
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
    <DSIInitMasterTime>120</DSIInitMasterTime>
    <DSIClockHSForceRequest>1</DSIClockHSForceRequest>
    <DSITECheckEnable>False</DSITECheckEnable>
    <DSITEUsingDedicatedTEPin>True</DSITEUsingDedicatedTEPin>
    <DSITEvSyncInitVal>0</DSITEvSyncInitVal>
    <DSITEvSyncRdPtrIrqLine>2400</DSITEvSyncRdPtrIrqLine>
    <DSIControllerMapping>
        00 01
    </DSIControllerMapping> 
</Group>
<DSIInitSequence>
    15 FF 20
    15 fb 01
    15 00 01
    15 01 55
    15 02 45
    15 05 40
    15 06 19
    15 07 1E
    15 0B 73
    15 0C 73
    15 0E B0
    15 0F AE
    15 11 B8
    15 13 00
    15 58 80
    15 59 01
    15 5A 00
    15 5B 01
    15 5C 80
    15 5D 81
    15 5E 00
    15 5F 01
    15 72 31
    15 68 03
    15 ff 24
    15 fb 01
    15 00 1C
    15 01 0B
    15 02 0C
    15 03 01
    15 04 0F
    15 05 10
    15 06 10
    15 07 10
    15 08 89
    15 09 8A
    15 0A 13
    15 0B 13
    15 0C 15
    15 0D 15
    15 0E 17
    15 0F 17
    15 10 1C
    15 11 0B
    15 12 0C
    15 13 01
    15 14 0F
    15 15 10
    15 16 10
    15 17 10
    15 18 89
    15 19 8A
    15 1A 13
    15 1B 13
    15 1C 15
    15 1D 15
    15 1E 17
    15 1F 17
    15 20 40
    15 21 01
    15 22 00
    15 23 40
    15 24 40
    15 25 6D
    15 26 40
    15 27 40
    15 E0 00
    15 DC 21
    15 DD 22
    15 DE 07
    15 DF 07
    15 E3 6D
    15 E1 07
    15 E2 07
    15 29 D8
    15 2A 2A
    15 4B 03
    15 4C 11
    15 4D 10
    15 4E 01
    15 4F 01
    15 50 10
    15 51 00
    15 52 80
    15 53 00
    15 56 00
    15 54 07
    15 58 07
    15 55 25
    15 5B 43
    15 5C 00
    15 5F 73
    15 60 73
    15 63 22
    15 64 00
    15 67 08
    15 68 04
    15 72 02
    15 7A 80
    15 7B 91
    15 7C D8
    15 7D 60
    15 7F 15
    15 75 15
    15 B3 C0
    15 B4 00
    15 B5 00
    15 78 00
    15 79 00
    15 80 00
    15 83 00
    15 93 0A
    15 94 0A
    15 8A 00
    15 9B FF
    15 9D B0
    15 9F 63
    15 98 10
    15 EC 00
    15 ff 10
    39 3B 03 0A 0A
    15 35 00
    15 E5 01
    15 BB 10
    15 FB 01
    05 11 00
    ff ff
    05 29 00
</DSIInitSequence>
<DSIStatusSequence>
    06 0a 9c 
</DSIStatusSequence>
<DSITermSequence>
    05 28 00
    FF 20
    05 10 00
    FF 80
</DSITermSequence>
<Group id='Backlight Configuration'>
    <BacklightType>1</BacklightType>
    <BacklightPmicControlType>2</BacklightPmicControlType>  
    <BacklightPMICBankSelect>3</BacklightPMICBankSelect>
    <BacklightPMICPWMFrequency>800000</BacklightPMICPWMFrequency>
    <BacklightSteps>100</BacklightSteps>
    <BacklightDefault>80</BacklightDefault>
    <BacklightLowPower>40</BacklightLowPower>
    <PMIPowerPmicNum>1</PMIPowerPmicNum>
    <PMIPowerPmicModel>21</PMIPowerPmicModel>
    <PMIPowerConfig>1</PMIPowerConfig>
    <AdaptiveBrightnessFeature>1</AdaptiveBrightnessFeature>
    <CABLEnable>True</CABLEnable>
    <BrightnessMinLuminance>200</BrightnessMinLuminance>
    <BrightnessMaxLuminance>319970</BrightnessMaxLuminance>
</Group>
<Group id='AD Configuration'>
    <ADMaxIterations>30</ADMaxIterations>
    <ADInitParam001>0x0000 0x0800 0x1000 0x1800 0x2000 0x2800 0x3000 0x3800 0x4000 0x4800 0x5000 0x5800 0x6000 0x6800 0x7000 0x7800 0x8000 0x87FF 0x8FFF 0x97FF 0x9FFF 0xA7FF 0xAFFF 0xB7FF 0xBFFF 0xC7FF 0xCFFF 0xD7FF 0xDFFF 0xE7FF 0xEFFF 0xF7FF 0xFFFF </ADInitParam001>
    <ADInitParam002>0x0000 0x0800 0x1000 0x1800 0x2000 0x2800 0x3000 0x3800 0x4000 0x4800 0x5000 0x5800 0x6000 0x6800 0x7000 0x7800 0x8000 0x87FF 0x8FFF 0x97FF 0x9FFF 0xA7FF 0xAFFF 0xB7FF 0xBFFF 0xC7FF 0xCFFF 0xD7FF 0xDFFF 0xE7FF 0xEFFF 0xF7FF 0xFFFF </ADInitParam002>
    <ADInitParam003>0x0000 0x0800 0x1000 0x1800 0x2000 0x2800 0x3000 0x3800 0x4000 0x4800 0x5000 0x5800 0x6000 0x6800 0x7000 0x7800 0x8000 0x87FF 0x8FFF 0x97FF 0x9FFF 0xA7FF 0xAFFF 0xB7FF 0xBFFF 0xC7FF 0xCFFF 0xD7FF 0xDFFF 0xE7FF 0xEFFF 0xF7FF 0xFFFF </ADInitParam003>	
    <ADInitParam004>0x0000 0x0800 0x1000 0x1801 0x1D61 0x22F2 0x26A2 0x2993 0x2C23 0x2E94 0x3114 0x33A5 0x3685 0x39C6 0x3D66 0x4177 0x45E7 0x4AE8 0x5058 0x5669 0x5D29 0x648A 0x6CAA 0x759B 0x7F7B 0x8A5C 0x965C 0xA3AD 0xB25D 0xC2BE 0xD4EE 0xE93F 0xFFFF </ADInitParam004>
    <ADInitParam005>0x0001 0x0032 0x0064 0x0096 0x00FA 0x015E 0x0190 0x0384 0x04E2 0x0708 0x08FC 0x0BB8 0x1770 0x2EE0 0x5DC0 0xC350 0x04B0 0x2125 0x2EE0 0x3969 0x4A1E 0x57B2 0x5DC0 0x8CA0 0xA5BA 0xC6E0 0xE0CE 0xFFFF 0xFFFF 0xFFFF 0xFFFF 0xFFFF </ADInitParam005>
    <ADInitParam006>0x0000 0x000A 0x0019 0x0032 0x0064 0x00C8 0x0190 0x02BC 0x03E8 0x05DC 0x09C4 0x0FA0 0x1F40 0x3A98 0x7530 0xFFFF 0x0000 0x000A 0x0019 0x0032 0x0064 0x00C8 0x0190 0x02BC 0x03E8 0x05DC 0x09C4 0x0FA0 0x1F40 0x3A98 0x7530 0xFFFF </ADInitParam006>
    <ADInitParam007>0x0000 0x0095 0x0128 0x01B9 0x0249 0x02D8 0x0365 0x03F1 0x047B 0x0504 0x058C 0x0612 0x0697 0x071A 0x079D 0x081E 0x089E 0x091C 0x099A 0x0A16 0x0A91 0x0B0B 0x0B83 0x0BFB 0x0C71 0x0CE7 0x0D5B 0x0DCE 0x0E41 0x0EB2 0x0F22 0x0F91 0x0FFF </ADInitParam007>
    <ADInitParam008>0x00FF 0x0116 0x012E 0x0146 0x015E 0x0176 0x018E 0x01A6 0x01BE 0x01D6 0x01EE 0x0205 0x021D 0x0235 0x024D 0x0265 0x027D 0x0295 0x02AC 0x02C4 0x02DC 0x02F3 0x030B 0x0323 0x033A 0x0352 0x036A 0x0381 0x0399 0x03B1 0x03C8 0x03E0 0x03F8 </ADInitParam008>
    <ADInitParam009>0x03</ADInitParam009>
    <ADInitParam010>0x3F</ADInitParam010>
    <ADInitParam011>0x0780</ADInitParam011>
    <ADInitParam012>0x0438</ADInitParam012>
    <ADInitParam013>0x0002</ADInitParam013>
    <ADInitParam014>0x0002</ADInitParam014>
    <ADInitParam015>0xFFFF</ADInitParam015>
    <ADInitParam016>0x06</ADInitParam016>
    <ADInitParam017>0x030</ADInitParam017>
    <ADInitParam018>0x012</ADInitParam018>
    <ADInitParam019>0x044</ADInitParam019>
    <ADInitParam020>0xFFFF</ADInitParam020>
    <ADInitParam021>0x80</ADInitParam021>
    <ADInitParam022>0x80</ADInitParam022>
    <ADInitParam023>0x07AE</ADInitParam023>
    <ADInitParam024>0x0800</ADInitParam024>
    <ADInitParam025>0x0333</ADInitParam025>
    <ADInitParam026>0x0800</ADInitParam026>
    <ADInitParam027>0x0333</ADInitParam027>
    <ADInitParam028>0x0006</ADInitParam028>
    <ADInitParam029>0x0222</ADInitParam029>
    <ADInitParam030>0x1000</ADInitParam030>
    <ADInitParam031>0x012C</ADInitParam031>
    <ADInitParam032>0x0BB8</ADInitParam032>
    <ADInitParam033>0x1DB0</ADInitParam033>
    <ADInitParam034>0xFFFF</ADInitParam034>
    <ADInitParam035>0xFFFF</ADInitParam035>
    <ADInitParam036>0x10</ADInitParam036>
    <ADInitParam037>0x00</ADInitParam037>
    <ADInitParam038>0x10</ADInitParam038>
    <ADInitParam039>0x00</ADInitParam039>
    <ADInitParam040>0xFFFF</ADInitParam040>
    <ADInitParam041>0x10</ADInitParam041>
    <ADInitParam042>0x1000</ADInitParam042>
    <ADInitParam043>0x10</ADInitParam043>		
    <ADInitParam044>0x0200</ADInitParam044>
    <ADInitParam045>0x0080</ADInitParam045>
    <ADInitParam046>0x0</ADInitParam046>
    <ADInitParam047>0xFF</ADInitParam047>
    <ADInitParam048>0x07</ADInitParam048>
    <ADInitParam049>0xC6</ADInitParam049>
    <ADInitParam050>0x41</ADInitParam050>
    <ADInitParam051>0x3C</ADInitParam051>
    <ADInitParam052>0x80</ADInitParam052>
    <ADInitParam053>0x000</ADInitParam053>
    <ADInitParam054>0x3FF</ADInitParam054>
    <ADInitParam055>0xF0</ADInitParam055>
    <ADInitParam056>0x00</ADInitParam056>
    <ADInitParam057>0x01</ADInitParam057>
    <ADInitParam058>0x2</ADInitParam058>
    <ADInitParam059>0x05</ADInitParam059>
    <ADInitParam060>0x00</ADInitParam060>
    <ADInitParam061>0x00</ADInitParam061>
    <ADInitParam062>0x003</ADInitParam062>
    <ADInitParam063>0x001</ADInitParam063>
    <ADInitParam064>0x001</ADInitParam064>
    <ADInitParam065>0x3FF</ADInitParam065>
    <ADInitParam066>0x08</ADInitParam066>
    <ADInitParam067>0x08</ADInitParam067>
    <ADInitParam068>0x13</ADInitParam068>
    <ADInitParam069>0x0000</ADInitParam069>
    <ADInitParam070>0x001</ADInitParam070>
    <ADInitParam071>0x00C</ADInitParam071>
    <ADInitParam072>0x050</ADInitParam072>
    <ADInitParam073>0x80</ADInitParam073>
    <ADInitParam074>0x040</ADInitParam074>
    <ADInitParam075>0x008</ADInitParam075>

    <ADCfgParam001>0x0000</ADCfgParam001>
    <ADCfgParam002>0xFFFF</ADCfgParam002>
    <ADCfgParam003>0x0000</ADCfgParam003>
    <ADCfgParam004>0xFFFF</ADCfgParam004>
    <ADCfgParam005>0x86</ADCfgParam005>
    <ADCfgParam006>0x10</ADCfgParam006>
    <ADCfgParam007>0x80</ADCfgParam007>
    <ADCfgParam008>0x54</ADCfgParam008>
    <ADCfgParam009>0x200</ADCfgParam009>
    <ADCfgParam010>0x500</ADCfgParam010>
    <ADCfgParam011>0x0400</ADCfgParam011>
    <ADCfgParam012>0x0400</ADCfgParam012>
    <ADCfgParam013>0x80</ADCfgParam013>
    <ADCfgParam014>0x5025</ADCfgParam014>
    <ADCfgParam015>0x0000</ADCfgParam015>
    <ADCfgParam016>0x200</ADCfgParam016>
    <ADCfgParam017>0x0020</ADCfgParam017>
    <ADCfgParam018>0x0222</ADCfgParam018>
    <ADCfgParam019>0x0400</ADCfgParam019>
    <ADCfgParam020>0x0400</ADCfgParam020>
    <ADCfgParam021>0x0001</ADCfgParam021>
    <ADCfgParam022>0x0222</ADCfgParam022>
    <ADCfgParam023>0x0400</ADCfgParam023>
    <ADCfgParam024>0x1000</ADCfgParam024>
    <ADCfgParam025>0x0018</ADCfgParam025>
    <ADCfgParam026>0x005F</ADCfgParam026>
    <ADCfgParam027>0x0008</ADCfgParam027>
    <ADCfgParam028>0x0000</ADCfgParam028>
    <ADCfgParam029>0x0000</ADCfgParam029>
    <ADCfgParam030>0x0010</ADCfgParam030>
    <ADCfgParam031>0x080</ADCfgParam031>
    <ADCfgParam032>0x200</ADCfgParam032>
    <ADCfgParam033>0x80</ADCfgParam033>
    <ADCfgParam034>0x0020</ADCfgParam034>
    <ADCfgParam035>0x022</ADCfgParam035>
    <ADCfgParam036>0x600</ADCfgParam036>
    <ADCfgParam037>0x310</ADCfgParam037>
    <ADCfgParam038>0x80</ADCfgParam038>
    <ADCfgParam039>0x30</ADCfgParam039>
    <ADCfgParam040>0x19A</ADCfgParam040>
    <ADCfgParam041>0x03</ADCfgParam041>
    <ADCfgParam042>0x200</ADCfgParam042>
    <ADCfgParam043>0x200</ADCfgParam043>
    <ADCfgParam044>0x80</ADCfgParam044>      
    <ADCfgParam045>0x90</ADCfgParam045>           
    <ADCfgParam046>0x2000</ADCfgParam046>	
</Group>
<Group id='Connection Configuration'>
    <Display1Reset1Info>DSI_PANEL_RESET, 0, 30</Display1Reset1Info>
    <Display1Power1Info>DSI_PANEL_MODE_SELECT, 0, 0, 0, 0, TRUE</Display1Power1Info>
</Group>
"})

Name (PCF1, 
    Buffer() {"<?xml version='1.0' encoding='utf-8'?>
<PanelName>TFT2P2827-E</PanelName>
<PanelDescription>Truly Dual DSI Video Mode Panel (1440x2560 24bpp)</PanelDescription>
<Group id='EDID Configuration'>
    <ManufactureID>0x104D</ManufactureID>
    <ProductCode>850</ProductCode>
    <SerialNumber>0x000001</SerialNumber>
    <WeekofManufacture>0x01</WeekofManufacture>
    <YearofManufacture>0x1B</YearofManufacture>
    <EDIDVersion>1</EDIDVersion>
    <EDIDRevision>3</EDIDRevision>
    <VideoInputDefinition>0x80</VideoInputDefinition>
    <HorizontalScreenSize>0x07</HorizontalScreenSize>
    <VerticalScreenSize>0x0C</VerticalScreenSize>
    <DisplayTransferCharacteristics>0x78</DisplayTransferCharacteristics>
    <FeatureSupport>0x2</FeatureSupport>
    <Red.GreenBits>0xC8</Red.GreenBits>
    <Blue.WhiteBits>0xC0</Blue.WhiteBits>
    <RedX>0xA6</RedX>
    <RedY>0x51</RedY>
    <GreenX>0x4B</GreenX>
    <GreenY>0x9E</GreenY>
    <BlueX>0x25</BlueX>
    <BlueY>0x0E</BlueY>
    <WhiteX>0x48</WhiteX>
    <WhiteY>0x4B</WhiteY>
    <EstablishedTimingsI>0x0</EstablishedTimingsI>
    <EstablishedTimingsII>0x0</EstablishedTimingsII>
    <ManufacturesTiming>0x0</ManufacturesTiming>
    <StandardTimings1/>
    <StandardTimings2/>
    <StandardTimings3/>
    <StandardTimings4/>
    <StandardTimings5/>
    <StandardTimings6/>
    <StandardTimings7/>
    <SignalTimingInterface/>
</Group>
<Group id='Detailed Timing'>
    <HorizontalScreenSizeMM>0x44</HorizontalScreenSizeMM>
    <VerticalScreenSizeMM>0x78</VerticalScreenSizeMM>
    <HorizontalVerticalScreenSizeMM>0x00</HorizontalVerticalScreenSizeMM>
</Group>
<Group id='Active Timing'>
    <HorizontalActive>1440</HorizontalActive>
    <HorizontalFrontPorch>100</HorizontalFrontPorch>
    <HorizontalBackPorch>32</HorizontalBackPorch>
    <HorizontalSyncPulse>16</HorizontalSyncPulse>
    <HorizontalSyncSkew>0</HorizontalSyncSkew>
    <HorizontalLeftBorder>0</HorizontalLeftBorder>
    <HorizontalRightBorder>0</HorizontalRightBorder>
    <VerticalActive>2560</VerticalActive>
    <VerticalFrontPorch>8</VerticalFrontPorch>
    <VerticalBackPorch>7</VerticalBackPorch>
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
    <InterfaceType>8</InterfaceType>
    <InterfaceColorFormat>3</InterfaceColorFormat>
    <PanelOrientation>2</PanelOrientation>
</Group>
<Group id='DSI Interface'>
    <DSIChannelId>1</DSIChannelId>
    <DSIVirtualId>0</DSIVirtualId>
    <DSIColorFormat>36</DSIColorFormat>
    <DSITrafficMode>1</DSITrafficMode>
    <DSILanes>4</DSILanes>
    <DSIHsaHseAfterVsVe>False</DSIHsaHseAfterVsVe>
    <DSILowPowerModeInHFP>False</DSILowPowerModeInHFP>
    <DSILowPowerModeInHBP>False</DSILowPowerModeInHBP>
    <DSILowPowerModeInHSA>False</DSILowPowerModeInHSA>
    <DSILowPowerModeInBLLPEOF>True</DSILowPowerModeInBLLPEOF>
    <DSILowPowerModeInBLLP>True</DSILowPowerModeInBLLP>
    <DSIRefreshRate>0x3C0000</DSIRefreshRate>
    <DSIPhyDCDCMode>True</DSIPhyDCDCMode>
    <DSIInitMasterTime>32</DSIInitMasterTime>  
    <DSIControllerMapping>
        00 01
    </DSIControllerMapping>
    <DSIDynamicBlankingRefreshRateList>0x3C0000 0x300000</DSIDynamicBlankingRefreshRateList>
    <DSIDynamicVFrontPorchList>8 330</DSIDynamicVFrontPorchList>
    <DSIDynamicVBackPorchList>7 329</DSIDynamicVBackPorchList>
    <DSIDynamicVSyncPulseList>1 1</DSIDynamicVSyncPulseList>
    <DSIDynamicHFrontPorchList>100 100</DSIDynamicHFrontPorchList>
    <DSIDynamicHBackPorchList>32 32</DSIDynamicHBackPorchList>
    <DSIDynamicHSyncPulseList>16 16</DSIDynamicHSyncPulseList> 
</Group>
<DSIInitSequence>
    FF 20
    15 FF 20
    15 FB 01
    15 00 01
    15 01 55
    15 02 45
    15 05 40
    15 06 19
    15 07 1E
    15 0B 73
    15 0C 73
    15 0E B0
    15 0F AE
    15 11 B8
    15 13 00
    15 58 80
    15 59 01
    15 5A 00
    15 5B 01
    15 5C 80
    15 5D 81
    15 5E 00
    15 5F 01
    15 72 31
    15 68 03
    15 FF 24
    15 FB 01
    15 00 1C
    15 01 0B
    15 02 0C
    15 03 01
    15 04 0F
    15 05 10
    15 06 10
    15 07 10
    15 08 89
    15 09 8A
    15 0A 13
    15 0B 13
    15 0C 15
    15 0D 15
    15 0E 17
    15 0F 17
    15 10 1C
    15 11 0B
    15 12 0C
    15 13 01
    15 14 0F
    15 15 10
    15 16 10
    15 17 10
    15 18 89
    15 19 8A
    15 1A 13
    15 1B 13
    15 1C 15
    15 1D 15
    15 1E 17
    15 1F 17
    15 20 40
    15 21 01
    15 22 00
    15 23 40
    15 24 40
    15 25 6D
    15 26 40
    15 27 40
    15 E0 00
    15 DC 21
    15 DD 22
    15 DE 07
    15 DF 07
    15 E3 6D
    15 E1 07
    15 E2 07
    15 29 D8
    15 2A 2A
    15 4B 03
    15 4C 11
    15 4D 10
    15 4E 01
    15 4F 01
    15 50 10
    15 51 00
    15 52 80
    15 53 00
    15 56 00
    15 54 07
    15 58 07
    15 55 25
    15 5B 43
    15 5C 00
    15 5F 73
    15 60 73
    15 63 22
    15 64 00
    15 67 08
    15 68 04
    15 72 02
    15 7A 80
    15 7B 91
    15 7C D8
    15 7D 60
    15 7F 15
    15 75 15
    15 B3 C0
    15 B4 00
    15 B5 00
    15 78 00
    15 79 00
    15 80 00
    15 83 00
    15 93 0A
    15 94 0A
    15 8A 00
    15 9B FF
    15 9D B0
    15 9F 63
    15 98 10
    15 EC 00
    15 FF 10
    39 3B 03 0A 
    15 35 00
    15 E5 01
    15 BB 03
    15 FB 01
    05 11 00
    ff 64
    05 29 00
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
    <BacklightPMICBankSelect>3</BacklightPMICBankSelect>
    <BacklightPMICPWMFrequency>800000</BacklightPMICPWMFrequency>
    <BacklightSteps>100</BacklightSteps>
    <BacklightDefault>80</BacklightDefault>
    <BacklightLowPower>40</BacklightLowPower>
    <PMIPowerPmicNum>1</PMIPowerPmicNum>
    <PMIPowerPmicModel>21</PMIPowerPmicModel>
    <PMIPowerConfig>1</PMIPowerConfig>
    <AdaptiveBrightnessFeature>1</AdaptiveBrightnessFeature>
    <CABLEnable>True</CABLEnable>
    <BrightnessMinLuminance>200</BrightnessMinLuminance>
    <BrightnessMaxLuminance>319970</BrightnessMaxLuminance>
</Group>
<Group id='AD Configuration'>
    <ADMaxIterations>30</ADMaxIterations>
    <ADInitParam001>0x0000 0x0800 0x1000 0x1800 0x2000 0x2800 0x3000 0x3800 0x4000 0x4800 0x5000 0x5800 0x6000 0x6800 0x7000 0x7800 0x8000 0x87FF 0x8FFF 0x97FF 0x9FFF 0xA7FF 0xAFFF 0xB7FF 0xBFFF 0xC7FF 0xCFFF 0xD7FF 0xDFFF 0xE7FF 0xEFFF 0xF7FF 0xFFFF </ADInitParam001>
    <ADInitParam002>0x0000 0x0800 0x1000 0x1800 0x2000 0x2800 0x3000 0x3800 0x4000 0x4800 0x5000 0x5800 0x6000 0x6800 0x7000 0x7800 0x8000 0x87FF 0x8FFF 0x97FF 0x9FFF 0xA7FF 0xAFFF 0xB7FF 0xBFFF 0xC7FF 0xCFFF 0xD7FF 0xDFFF 0xE7FF 0xEFFF 0xF7FF 0xFFFF </ADInitParam002>
    <ADInitParam003>0x0000 0x0800 0x1000 0x1800 0x2000 0x2800 0x3000 0x3800 0x4000 0x4800 0x5000 0x5800 0x6000 0x6800 0x7000 0x7800 0x8000 0x87FF 0x8FFF 0x97FF 0x9FFF 0xA7FF 0xAFFF 0xB7FF 0xBFFF 0xC7FF 0xCFFF 0xD7FF 0xDFFF 0xE7FF 0xEFFF 0xF7FF 0xFFFF </ADInitParam003>	
    <ADInitParam004>0x0000 0x0800 0x1000 0x1801 0x1D61 0x22F2 0x26A2 0x2993 0x2C23 0x2E94 0x3114 0x33A5 0x3685 0x39C6 0x3D66 0x4177 0x45E7 0x4AE8 0x5058 0x5669 0x5D29 0x648A 0x6CAA 0x759B 0x7F7B 0x8A5C 0x965C 0xA3AD 0xB25D 0xC2BE 0xD4EE 0xE93F 0xFFFF </ADInitParam004>
    <ADInitParam005>0x0001 0x0032 0x0064 0x0096 0x00FA 0x015E 0x0190 0x0384 0x04E2 0x0708 0x08FC 0x0BB8 0x1770 0x2EE0 0x5DC0 0xC350 0x04B0 0x2125 0x2EE0 0x3969 0x4A1E 0x57B2 0x5DC0 0x8CA0 0xA5BA 0xC6E0 0xE0CE 0xFFFF 0xFFFF 0xFFFF 0xFFFF 0xFFFF </ADInitParam005>
    <ADInitParam006>0x0000 0x000A 0x0019 0x0032 0x0064 0x00C8 0x0190 0x02BC 0x03E8 0x05DC 0x09C4 0x0FA0 0x1F40 0x3A98 0x7530 0xFFFF 0x0000 0x000A 0x0019 0x0032 0x0064 0x00C8 0x0190 0x02BC 0x03E8 0x05DC 0x09C4 0x0FA0 0x1F40 0x3A98 0x7530 0xFFFF </ADInitParam006>
    <ADInitParam007>0x0000 0x0095 0x0128 0x01B9 0x0249 0x02D8 0x0365 0x03F1 0x047B 0x0504 0x058C 0x0612 0x0697 0x071A 0x079D 0x081E 0x089E 0x091C 0x099A 0x0A16 0x0A91 0x0B0B 0x0B83 0x0BFB 0x0C71 0x0CE7 0x0D5B 0x0DCE 0x0E41 0x0EB2 0x0F22 0x0F91 0x0FFF </ADInitParam007>
    <ADInitParam008>0x00FF 0x0116 0x012E 0x0146 0x015E 0x0176 0x018E 0x01A6 0x01BE 0x01D6 0x01EE 0x0205 0x021D 0x0235 0x024D 0x0265 0x027D 0x0295 0x02AC 0x02C4 0x02DC 0x02F3 0x030B 0x0323 0x033A 0x0352 0x036A 0x0381 0x0399 0x03B1 0x03C8 0x03E0 0x03F8 </ADInitParam008>
    <ADInitParam009>0x03</ADInitParam009>
    <ADInitParam010>0x3F</ADInitParam010>
    <ADInitParam011>0x0780</ADInitParam011>
    <ADInitParam012>0x0438</ADInitParam012>
    <ADInitParam013>0x0002</ADInitParam013>
    <ADInitParam014>0x0002</ADInitParam014>
    <ADInitParam015>0xFFFF</ADInitParam015>
    <ADInitParam016>0x06</ADInitParam016>
    <ADInitParam017>0x030</ADInitParam017>
    <ADInitParam018>0x012</ADInitParam018>
    <ADInitParam019>0x044</ADInitParam019>
    <ADInitParam020>0xFFFF</ADInitParam020>
    <ADInitParam021>0x80</ADInitParam021>
    <ADInitParam022>0x80</ADInitParam022>
    <ADInitParam023>0x07AE</ADInitParam023>
    <ADInitParam024>0x0800</ADInitParam024>
    <ADInitParam025>0x0333</ADInitParam025>
    <ADInitParam026>0x0800</ADInitParam026>
    <ADInitParam027>0x0333</ADInitParam027>
    <ADInitParam028>0x0006</ADInitParam028>
    <ADInitParam029>0x0222</ADInitParam029>
    <ADInitParam030>0x1000</ADInitParam030>
    <ADInitParam031>0x012C</ADInitParam031>
    <ADInitParam032>0x0BB8</ADInitParam032>
    <ADInitParam033>0x1DB0</ADInitParam033>
    <ADInitParam034>0xFFFF</ADInitParam034>
    <ADInitParam035>0xFFFF</ADInitParam035>
    <ADInitParam036>0x10</ADInitParam036>
    <ADInitParam037>0x00</ADInitParam037>
    <ADInitParam038>0x10</ADInitParam038>
    <ADInitParam039>0x00</ADInitParam039>
    <ADInitParam040>0xFFFF</ADInitParam040>
    <ADInitParam041>0x10</ADInitParam041>
    <ADInitParam042>0x1000</ADInitParam042>
    <ADInitParam043>0x10</ADInitParam043>		
    <ADInitParam044>0x0200</ADInitParam044>
    <ADInitParam045>0x0080</ADInitParam045>
    <ADInitParam046>0x0</ADInitParam046>
    <ADInitParam047>0xFF</ADInitParam047>
    <ADInitParam048>0x07</ADInitParam048>
    <ADInitParam049>0xC6</ADInitParam049>
    <ADInitParam050>0x41</ADInitParam050>
    <ADInitParam051>0x3C</ADInitParam051>
    <ADInitParam052>0x80</ADInitParam052>
    <ADInitParam053>0x000</ADInitParam053>
    <ADInitParam054>0x3FF</ADInitParam054>
    <ADInitParam055>0xF0</ADInitParam055>
    <ADInitParam056>0x00</ADInitParam056>
    <ADInitParam057>0x01</ADInitParam057>
    <ADInitParam058>0x2</ADInitParam058>
    <ADInitParam059>0x05</ADInitParam059>
    <ADInitParam060>0x00</ADInitParam060>
    <ADInitParam061>0x00</ADInitParam061>
    <ADInitParam062>0x003</ADInitParam062>
    <ADInitParam063>0x001</ADInitParam063>
    <ADInitParam064>0x001</ADInitParam064>
    <ADInitParam065>0x3FF</ADInitParam065>
    <ADInitParam066>0x08</ADInitParam066>
    <ADInitParam067>0x08</ADInitParam067>
    <ADInitParam068>0x13</ADInitParam068>
    <ADInitParam069>0x0000</ADInitParam069>
    <ADInitParam070>0x001</ADInitParam070>
    <ADInitParam071>0x00C</ADInitParam071>
    <ADInitParam072>0x050</ADInitParam072>
    <ADInitParam073>0x80</ADInitParam073>
    <ADInitParam074>0x040</ADInitParam074>
    <ADInitParam075>0x008</ADInitParam075>

    <ADCfgParam001>0x0000</ADCfgParam001>
    <ADCfgParam002>0xFFFF</ADCfgParam002>
    <ADCfgParam003>0x0000</ADCfgParam003>
    <ADCfgParam004>0xFFFF</ADCfgParam004>
    <ADCfgParam005>0x86</ADCfgParam005>
    <ADCfgParam006>0x10</ADCfgParam006>
    <ADCfgParam007>0x80</ADCfgParam007>
    <ADCfgParam008>0x54</ADCfgParam008>
    <ADCfgParam009>0x200</ADCfgParam009>
    <ADCfgParam010>0x500</ADCfgParam010>
    <ADCfgParam011>0x0400</ADCfgParam011>
    <ADCfgParam012>0x0400</ADCfgParam012>
    <ADCfgParam013>0x80</ADCfgParam013>
    <ADCfgParam014>0x5025</ADCfgParam014>
    <ADCfgParam015>0x0000</ADCfgParam015>
    <ADCfgParam016>0x200</ADCfgParam016>
    <ADCfgParam017>0x0020</ADCfgParam017>
    <ADCfgParam018>0x0222</ADCfgParam018>
    <ADCfgParam019>0x0400</ADCfgParam019>
    <ADCfgParam020>0x0400</ADCfgParam020>
    <ADCfgParam021>0x0001</ADCfgParam021>
    <ADCfgParam022>0x0222</ADCfgParam022>
    <ADCfgParam023>0x0400</ADCfgParam023>
    <ADCfgParam024>0x1000</ADCfgParam024>
    <ADCfgParam025>0x0018</ADCfgParam025>
    <ADCfgParam026>0x005F</ADCfgParam026>
    <ADCfgParam027>0x0008</ADCfgParam027>
    <ADCfgParam028>0x0000</ADCfgParam028>
    <ADCfgParam029>0x0000</ADCfgParam029>
    <ADCfgParam030>0x0010</ADCfgParam030>
    <ADCfgParam031>0x080</ADCfgParam031>
    <ADCfgParam032>0x200</ADCfgParam032>
    <ADCfgParam033>0x80</ADCfgParam033>
    <ADCfgParam034>0x0020</ADCfgParam034>
    <ADCfgParam035>0x022</ADCfgParam035>
    <ADCfgParam036>0x600</ADCfgParam036>
    <ADCfgParam037>0x310</ADCfgParam037>
    <ADCfgParam038>0x80</ADCfgParam038>
    <ADCfgParam039>0x30</ADCfgParam039>
    <ADCfgParam040>0x19A</ADCfgParam040>
    <ADCfgParam041>0x03</ADCfgParam041>
    <ADCfgParam042>0x200</ADCfgParam042>
    <ADCfgParam043>0x200</ADCfgParam043>
    <ADCfgParam044>0x80</ADCfgParam044>      
    <ADCfgParam045>0x90</ADCfgParam045>           
    <ADCfgParam046>0x2000</ADCfgParam046>	
</Group>
<Group id='Connection Configuration'>
    <Display1Reset1Info>DSI_PANEL_RESET, 0, 30</Display1Reset1Info>
    <Display1Power1Info>DSI_PANEL_MODE_SELECT, 0, 0, 0, 0, TRUE</Display1Power1Info>
</Group>
"})

Name (PCF2, 
    Buffer() {"<?xml version=\'1.0\' encoding=\'utf-8\'?>
<PanelName>TFT2P2827-E</PanelName>
<PanelDescription>Truly Single DSI Cmd Mode Panel with DSC (1440x2560 24bpp)</PanelDescription>
<Group id='EDID Configuration'>
    <ManufactureID>0x104D</ManufactureID>
    <ProductCode>850</ProductCode>
    <SerialNumber>0x000001</SerialNumber>
    <WeekofManufacture>0x01</WeekofManufacture>
    <YearofManufacture>0x1B</YearofManufacture>
    <EDIDVersion>1</EDIDVersion>
    <EDIDRevision>3</EDIDRevision>
    <VideoInputDefinition>0x80</VideoInputDefinition>
    <HorizontalScreenSize>0x07</HorizontalScreenSize>
    <VerticalScreenSize>0x0C</VerticalScreenSize>
    <DisplayTransferCharacteristics>0x78</DisplayTransferCharacteristics>
    <FeatureSupport>0x2</FeatureSupport>
    <Red.GreenBits>0xC8</Red.GreenBits>
    <Blue.WhiteBits>0xC0</Blue.WhiteBits>
    <RedX>0xA6</RedX>
    <RedY>0x51</RedY>
    <GreenX>0x4B</GreenX>
    <GreenY>0x9E</GreenY>
    <BlueX>0x25</BlueX>
    <BlueY>0x0E</BlueY>
    <WhiteX>0x48</WhiteX>
    <WhiteY>0x4B</WhiteY>
    <EstablishedTimingsI>0x0</EstablishedTimingsI>
    <EstablishedTimingsII>0x0</EstablishedTimingsII>
    <ManufacturesTiming>0x0</ManufacturesTiming>
    <StandardTimings1/>
    <StandardTimings2/>
    <StandardTimings3/>
    <StandardTimings4/>
    <StandardTimings5/>
    <StandardTimings6/>
    <StandardTimings7/>
    <SignalTimingInterface/>
</Group>
<Group id='Detailed Timing'>
    <HorizontalScreenSizeMM>0x44</HorizontalScreenSizeMM>
    <VerticalScreenSizeMM>0x78</VerticalScreenSizeMM>
    <HorizontalVerticalScreenSizeMM>0x00</HorizontalVerticalScreenSizeMM>
</Group>
<Group id='Active Timing'>
    <HorizontalActive>1440</HorizontalActive>
    <HorizontalFrontPorch>100</HorizontalFrontPorch>
    <HorizontalBackPorch>32</HorizontalBackPorch>
    <HorizontalSyncPulse>16</HorizontalSyncPulse>
    <HorizontalSyncSkew>0</HorizontalSyncSkew>
    <HorizontalLeftBorder>0</HorizontalLeftBorder>
    <HorizontalRightBorder>0</HorizontalRightBorder>
    <VerticalActive>2560</VerticalActive>
    <VerticalFrontPorch>8</VerticalFrontPorch>
    <VerticalBackPorch>7</VerticalBackPorch>
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
    <DSITECheckEnable>False</DSITECheckEnable>
    <DSITEUsingDedicatedTEPin>True</DSITEUsingDedicatedTEPin>
    <DSITEvSyncInitVal>0</DSITEvSyncInitVal>
    <DSITEvSyncRdPtrIrqLine>2400</DSITEvSyncRdPtrIrqLine>
    <DSIBitClkScalePercent>15</DSIBitClkScalePercent>
    <DSIDSCEnable>True</DSIDSCEnable>
    <DSIDSCMajorVersion>1</DSIDSCMajorVersion>
    <DSIDSCMinorVersion>1</DSIDSCMinorVersion>
    <DSIDSCScr>0</DSIDSCScr>
    <DSIDSCProfileID>7</DSIDSCProfileID>
    <DSIDSCSliceWidth>720</DSIDSCSliceWidth>
    <DSIDSCSliceHeight>16</DSIDSCSliceHeight>
    <DSIInitMasterTime>120</DSIInitMasterTime> 
    <DSIControllerMapping>
        01
    </DSIControllerMapping>
</Group>
<DSIInitSequence>
    15 FF 20
    15 fb 01
    15 00 01
    15 01 55
    15 02 45
    15 05 40
    15 06 19
    15 07 1E
    15 0B 73
    15 0C 73
    15 0E B0
    15 0F AE
    15 11 B8
    15 13 00
    15 58 80
    15 59 01
    15 5A 00
    15 5B 01
    15 5C 80
    15 5D 81
    15 5E 00
    15 5F 01
    15 72 31
    15 68 03
    15 ff 24
    15 fb 01
    15 00 1C
    15 01 0B
    15 02 0C
    15 03 01
    15 04 0F
    15 05 10
    15 06 10
    15 07 10
    15 08 89
    15 09 8A
    15 0A 13
    15 0B 13
    15 0C 15
    15 0D 15
    15 0E 17
    15 0F 17
    15 10 1C
    15 11 0B
    15 12 0C
    15 13 01
    15 14 0F
    15 15 10
    15 16 10
    15 17 10
    15 18 89
    15 19 8A
    15 1A 13
    15 1B 13
    15 1C 15
    15 1D 15
    15 1E 17
    15 1F 17
    15 20 40
    15 21 01
    15 22 00
    15 23 40
    15 24 40
    15 25 6D
    15 26 40
    15 27 40
    15 E0 00
    15 DC 21
    15 DD 22
    15 DE 07
    15 DF 07
    15 E3 6D
    15 E1 07
    15 E2 07
    15 29 D8
    15 2A 2A
    15 4B 03
    15 4C 11
    15 4D 10
    15 4E 01
    15 4F 01
    15 50 10
    15 51 00
    15 52 80
    15 53 00
    15 56 00
    15 54 07
    15 58 07
    15 55 25
    15 5B 43
    15 5C 00
    15 5F 73
    15 60 73
    15 63 22
    15 64 00
    15 67 08
    15 68 04
    15 72 02
    15 7A 80
    15 7B 91
    15 7C D8
    15 7D 60
    15 7F 15
    15 75 15
    15 B3 C0
    15 B4 00
    15 B5 00
    15 78 00
    15 79 00
    15 80 00
    15 83 00
    15 93 0A
    15 94 0A
    15 8A 00
    15 9B FF
    15 9D B0
    15 9F 63
    15 98 10
    15 EC 00
    15 FF 10
    15 fb 01
    15 ba 03
    15 e5 01
    15 b0 03
    15 ff 28
    15 7a 02
    15 fb 01
    15 ff 10
    15 fb 01
    15 c0 03
    15 bb 10
    15 ff e0
    15 fb 01
    15 6b 3d
    15 6c 3d
    15 6d 3d
    15 6e 3d
    15 6f 3d
    15 35 02
    15 36 72
    15 37 10
    15 08 c0
    15 ff 24
    15 fb 01
    15 c6 06
    15 ff 10
    15 35 00
    05 11
    ff 64
    05 29
    ff 28
    07 01
</DSIInitSequence>
<DSIStatusSequence>
    06 0a 9c 
</DSIStatusSequence>
<DSITermSequence>
    05 28 00
    FF 20
    05 10 00
    FF 80
</DSITermSequence>
<TLMMGPIODefaultHigh>34</TLMMGPIODefaultHigh>
<Group id='Backlight Configuration'>
    <BacklightType>1</BacklightType>
    <BacklightPmicControlType>2</BacklightPmicControlType>  
    <BacklightPMICBankSelect>3</BacklightPMICBankSelect>
    <BacklightPMICPWMFrequency>800000</BacklightPMICPWMFrequency>
    <BacklightSteps>100</BacklightSteps>
    <BacklightDefault>80</BacklightDefault>
    <BacklightLowPower>40</BacklightLowPower>
    <PMIPowerPmicNum>1</PMIPowerPmicNum>
    <PMIPowerPmicModel>21</PMIPowerPmicModel>
    <PMIPowerConfig>1</PMIPowerConfig>
    <AdaptiveBrightnessFeature>1</AdaptiveBrightnessFeature>
    <CABLEnable>True</CABLEnable>
    <BrightnessMinLuminance>200</BrightnessMinLuminance>
    <BrightnessMaxLuminance>319970</BrightnessMaxLuminance>
</Group>
<Group id='AD Configuration'>
    <ADMaxIterations>30</ADMaxIterations>
    <ADInitParam001>0x0000 0x0800 0x1000 0x1800 0x2000 0x2800 0x3000 0x3800 0x4000 0x4800 0x5000 0x5800 0x6000 0x6800 0x7000 0x7800 0x8000 0x87FF 0x8FFF 0x97FF 0x9FFF 0xA7FF 0xAFFF 0xB7FF 0xBFFF 0xC7FF 0xCFFF 0xD7FF 0xDFFF 0xE7FF 0xEFFF 0xF7FF 0xFFFF </ADInitParam001>
    <ADInitParam002>0x0000 0x0800 0x1000 0x1800 0x2000 0x2800 0x3000 0x3800 0x4000 0x4800 0x5000 0x5800 0x6000 0x6800 0x7000 0x7800 0x8000 0x87FF 0x8FFF 0x97FF 0x9FFF 0xA7FF 0xAFFF 0xB7FF 0xBFFF 0xC7FF 0xCFFF 0xD7FF 0xDFFF 0xE7FF 0xEFFF 0xF7FF 0xFFFF </ADInitParam002>
    <ADInitParam003>0x0000 0x0800 0x1000 0x1800 0x2000 0x2800 0x3000 0x3800 0x4000 0x4800 0x5000 0x5800 0x6000 0x6800 0x7000 0x7800 0x8000 0x87FF 0x8FFF 0x97FF 0x9FFF 0xA7FF 0xAFFF 0xB7FF 0xBFFF 0xC7FF 0xCFFF 0xD7FF 0xDFFF 0xE7FF 0xEFFF 0xF7FF 0xFFFF </ADInitParam003>	
    <ADInitParam004>0x0000 0x0800 0x1000 0x1801 0x1D61 0x22F2 0x26A2 0x2993 0x2C23 0x2E94 0x3114 0x33A5 0x3685 0x39C6 0x3D66 0x4177 0x45E7 0x4AE8 0x5058 0x5669 0x5D29 0x648A 0x6CAA 0x759B 0x7F7B 0x8A5C 0x965C 0xA3AD 0xB25D 0xC2BE 0xD4EE 0xE93F 0xFFFF </ADInitParam004>
    <ADInitParam005>0x0001 0x0032 0x0064 0x0096 0x00FA 0x015E 0x0190 0x0384 0x04E2 0x0708 0x08FC 0x0BB8 0x1770 0x2EE0 0x5DC0 0xC350 0x04B0 0x2125 0x2EE0 0x3969 0x4A1E 0x57B2 0x5DC0 0x8CA0 0xA5BA 0xC6E0 0xE0CE 0xFFFF 0xFFFF 0xFFFF 0xFFFF 0xFFFF </ADInitParam005>
    <ADInitParam006>0x0000 0x000A 0x0019 0x0032 0x0064 0x00C8 0x0190 0x02BC 0x03E8 0x05DC 0x09C4 0x0FA0 0x1F40 0x3A98 0x7530 0xFFFF 0x0000 0x000A 0x0019 0x0032 0x0064 0x00C8 0x0190 0x02BC 0x03E8 0x05DC 0x09C4 0x0FA0 0x1F40 0x3A98 0x7530 0xFFFF </ADInitParam006>
    <ADInitParam007>0x0000 0x0095 0x0128 0x01B9 0x0249 0x02D8 0x0365 0x03F1 0x047B 0x0504 0x058C 0x0612 0x0697 0x071A 0x079D 0x081E 0x089E 0x091C 0x099A 0x0A16 0x0A91 0x0B0B 0x0B83 0x0BFB 0x0C71 0x0CE7 0x0D5B 0x0DCE 0x0E41 0x0EB2 0x0F22 0x0F91 0x0FFF </ADInitParam007>
    <ADInitParam008>0x00FF 0x0116 0x012E 0x0146 0x015E 0x0176 0x018E 0x01A6 0x01BE 0x01D6 0x01EE 0x0205 0x021D 0x0235 0x024D 0x0265 0x027D 0x0295 0x02AC 0x02C4 0x02DC 0x02F3 0x030B 0x0323 0x033A 0x0352 0x036A 0x0381 0x0399 0x03B1 0x03C8 0x03E0 0x03F8 </ADInitParam008>
    <ADInitParam009>0x03</ADInitParam009>
    <ADInitParam010>0x3F</ADInitParam010>
    <ADInitParam011>0x0780</ADInitParam011>
    <ADInitParam012>0x0438</ADInitParam012>
    <ADInitParam013>0x0002</ADInitParam013>
    <ADInitParam014>0x0002</ADInitParam014>
    <ADInitParam015>0xFFFF</ADInitParam015>
    <ADInitParam016>0x06</ADInitParam016>
    <ADInitParam017>0x030</ADInitParam017>
    <ADInitParam018>0x012</ADInitParam018>
    <ADInitParam019>0x044</ADInitParam019>
    <ADInitParam020>0xFFFF</ADInitParam020>
    <ADInitParam021>0x80</ADInitParam021>
    <ADInitParam022>0x80</ADInitParam022>
    <ADInitParam023>0x07AE</ADInitParam023>
    <ADInitParam024>0x0800</ADInitParam024>
    <ADInitParam025>0x0333</ADInitParam025>
    <ADInitParam026>0x0800</ADInitParam026>
    <ADInitParam027>0x0333</ADInitParam027>
    <ADInitParam028>0x0006</ADInitParam028>
    <ADInitParam029>0x0222</ADInitParam029>
    <ADInitParam030>0x1000</ADInitParam030>
    <ADInitParam031>0x012C</ADInitParam031>
    <ADInitParam032>0x0BB8</ADInitParam032>
    <ADInitParam033>0x1DB0</ADInitParam033>
    <ADInitParam034>0xFFFF</ADInitParam034>
    <ADInitParam035>0xFFFF</ADInitParam035>
    <ADInitParam036>0x10</ADInitParam036>
    <ADInitParam037>0x00</ADInitParam037>
    <ADInitParam038>0x10</ADInitParam038>
    <ADInitParam039>0x00</ADInitParam039>
    <ADInitParam040>0xFFFF</ADInitParam040>
    <ADInitParam041>0x10</ADInitParam041>
    <ADInitParam042>0x1000</ADInitParam042>
    <ADInitParam043>0x10</ADInitParam043>		
    <ADInitParam044>0x0200</ADInitParam044>
    <ADInitParam045>0x0080</ADInitParam045>
    <ADInitParam046>0x0</ADInitParam046>
    <ADInitParam047>0xFF</ADInitParam047>
    <ADInitParam048>0x07</ADInitParam048>
    <ADInitParam049>0xC6</ADInitParam049>
    <ADInitParam050>0x41</ADInitParam050>
    <ADInitParam051>0x3C</ADInitParam051>
    <ADInitParam052>0x80</ADInitParam052>
    <ADInitParam053>0x000</ADInitParam053>
    <ADInitParam054>0x3FF</ADInitParam054>
    <ADInitParam055>0xF0</ADInitParam055>
    <ADInitParam056>0x00</ADInitParam056>
    <ADInitParam057>0x01</ADInitParam057>
    <ADInitParam058>0x2</ADInitParam058>
    <ADInitParam059>0x05</ADInitParam059>
    <ADInitParam060>0x00</ADInitParam060>
    <ADInitParam061>0x00</ADInitParam061>
    <ADInitParam062>0x003</ADInitParam062>
    <ADInitParam063>0x001</ADInitParam063>
    <ADInitParam064>0x001</ADInitParam064>
    <ADInitParam065>0x3FF</ADInitParam065>
    <ADInitParam066>0x08</ADInitParam066>
    <ADInitParam067>0x08</ADInitParam067>
    <ADInitParam068>0x13</ADInitParam068>
    <ADInitParam069>0x0000</ADInitParam069>
    <ADInitParam070>0x001</ADInitParam070>
    <ADInitParam071>0x00C</ADInitParam071>
    <ADInitParam072>0x050</ADInitParam072>
    <ADInitParam073>0x80</ADInitParam073>
    <ADInitParam074>0x040</ADInitParam074>
    <ADInitParam075>0x008</ADInitParam075>

    <ADCfgParam001>0x0000</ADCfgParam001>
    <ADCfgParam002>0xFFFF</ADCfgParam002>
    <ADCfgParam003>0x0000</ADCfgParam003>
    <ADCfgParam004>0xFFFF</ADCfgParam004>
    <ADCfgParam005>0x86</ADCfgParam005>
    <ADCfgParam006>0x10</ADCfgParam006>
    <ADCfgParam007>0x80</ADCfgParam007>
    <ADCfgParam008>0x54</ADCfgParam008>
    <ADCfgParam009>0x200</ADCfgParam009>
    <ADCfgParam010>0x500</ADCfgParam010>
    <ADCfgParam011>0x0400</ADCfgParam011>
    <ADCfgParam012>0x0400</ADCfgParam012>
    <ADCfgParam013>0x80</ADCfgParam013>
    <ADCfgParam014>0x5025</ADCfgParam014>
    <ADCfgParam015>0x0000</ADCfgParam015>
    <ADCfgParam016>0x200</ADCfgParam016>
    <ADCfgParam017>0x0020</ADCfgParam017>
    <ADCfgParam018>0x0222</ADCfgParam018>
    <ADCfgParam019>0x0400</ADCfgParam019>
    <ADCfgParam020>0x0400</ADCfgParam020>
    <ADCfgParam021>0x0001</ADCfgParam021>
    <ADCfgParam022>0x0222</ADCfgParam022>
    <ADCfgParam023>0x0400</ADCfgParam023>
    <ADCfgParam024>0x1000</ADCfgParam024>
    <ADCfgParam025>0x0018</ADCfgParam025>
    <ADCfgParam026>0x005F</ADCfgParam026>
    <ADCfgParam027>0x0008</ADCfgParam027>
    <ADCfgParam028>0x0000</ADCfgParam028>
    <ADCfgParam029>0x0000</ADCfgParam029>
    <ADCfgParam030>0x0010</ADCfgParam030>
    <ADCfgParam031>0x080</ADCfgParam031>
    <ADCfgParam032>0x200</ADCfgParam032>
    <ADCfgParam033>0x80</ADCfgParam033>
    <ADCfgParam034>0x0020</ADCfgParam034>
    <ADCfgParam035>0x022</ADCfgParam035>
    <ADCfgParam036>0x600</ADCfgParam036>
    <ADCfgParam037>0x310</ADCfgParam037>
    <ADCfgParam038>0x80</ADCfgParam038>
    <ADCfgParam039>0x30</ADCfgParam039>
    <ADCfgParam040>0x19A</ADCfgParam040>
    <ADCfgParam041>0x03</ADCfgParam041>
    <ADCfgParam042>0x200</ADCfgParam042>
    <ADCfgParam043>0x200</ADCfgParam043>
    <ADCfgParam044>0x80</ADCfgParam044>      
    <ADCfgParam045>0x90</ADCfgParam045>           
    <ADCfgParam046>0x2000</ADCfgParam046>	
 </Group>
<Group id='Connection Configuration'>
    <Display1Reset1Info>DSI_PANEL_RESET, 0, 30</Display1Reset1Info>
    <Display1Power1Info>DSI_PANEL_MODE_SELECT, 1, 0, 0, 0, TRUE</Display1Power1Info>
</Group>
"})

Name (PCF3, 
    Buffer() {"<?xml version=\'1.0\' encoding=\'utf-8\'?>
<PanelName>TFT2P2827-E</PanelName>
<PanelDescription>Truly Single DSI Video Mode Panel with DSC (1440x2560 24bpp)</PanelDescription>
<Group id='EDID Configuration'>
    <ManufactureID>0x104D</ManufactureID>
    <ProductCode>850</ProductCode>
    <SerialNumber>0x000001</SerialNumber>
    <WeekofManufacture>0x01</WeekofManufacture>
    <YearofManufacture>0x1B</YearofManufacture>
    <EDIDVersion>1</EDIDVersion>
    <EDIDRevision>3</EDIDRevision>
    <VideoInputDefinition>0x80</VideoInputDefinition>
    <HorizontalScreenSize>0x07</HorizontalScreenSize>
    <VerticalScreenSize>0x0C</VerticalScreenSize>
    <DisplayTransferCharacteristics>0x78</DisplayTransferCharacteristics>
    <FeatureSupport>0x2</FeatureSupport>
    <Red.GreenBits>0xC8</Red.GreenBits>
    <Blue.WhiteBits>0xC0</Blue.WhiteBits>
    <RedX>0xA6</RedX>
    <RedY>0x51</RedY>
    <GreenX>0x4B</GreenX>
    <GreenY>0x9E</GreenY>
    <BlueX>0x25</BlueX>
    <BlueY>0x0E</BlueY>
    <WhiteX>0x48</WhiteX>
    <WhiteY>0x4B</WhiteY>
    <EstablishedTimingsI>0x0</EstablishedTimingsI>
    <EstablishedTimingsII>0x0</EstablishedTimingsII>
    <ManufacturesTiming>0x0</ManufacturesTiming>
    <StandardTimings1/>
    <StandardTimings2/>
    <StandardTimings3/>
    <StandardTimings4/>
    <StandardTimings5/>
    <StandardTimings6/>
    <StandardTimings7/>
    <SignalTimingInterface/>
</Group>
<Group id='Detailed Timing'>
    <HorizontalScreenSizeMM>0x44</HorizontalScreenSizeMM>
    <VerticalScreenSizeMM>0x78</VerticalScreenSizeMM>
    <HorizontalVerticalScreenSizeMM>0x00</HorizontalVerticalScreenSizeMM>
</Group>
<Group id='Active Timing'>
    <HorizontalActive>1440</HorizontalActive>
    <HorizontalFrontPorch>100</HorizontalFrontPorch>
    <HorizontalBackPorch>32</HorizontalBackPorch>
    <HorizontalSyncPulse>16</HorizontalSyncPulse>
    <HorizontalSyncSkew>0</HorizontalSyncSkew>
    <HorizontalLeftBorder>0</HorizontalLeftBorder>
    <HorizontalRightBorder>0</HorizontalRightBorder>
    <VerticalActive>2560</VerticalActive>
    <VerticalFrontPorch>8</VerticalFrontPorch>
    <VerticalBackPorch>7</VerticalBackPorch>
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
    <InterfaceType>8</InterfaceType>
    <InterfaceColorFormat>3</InterfaceColorFormat>
</Group>
<Group id='DSI Interface'>
    <DSIChannelId>1</DSIChannelId>
    <DSIVirtualId>0</DSIVirtualId>
    <DSIColorFormat>36</DSIColorFormat>
    <DSITrafficMode>1</DSITrafficMode>
    <DSIDSCEnable>True</DSIDSCEnable>
    <DSIDSCMajorVersion>1</DSIDSCMajorVersion>
    <DSIDSCMinorVersion>1</DSIDSCMinorVersion>
    <DSIDSCScr>0</DSIDSCScr>
    <DSIDSCProfileID>7</DSIDSCProfileID>
    <DSIDSCSliceWidth>720</DSIDSCSliceWidth>
    <DSIDSCSliceHeight>16</DSIDSCSliceHeight>
    <DSILanes>4</DSILanes>
    <DSIHsaHseAfterVsVe>False</DSIHsaHseAfterVsVe>
    <DSILowPowerModeInHFP>False</DSILowPowerModeInHFP>
    <DSILowPowerModeInHBP>False</DSILowPowerModeInHBP>
    <DSILowPowerModeInHSA>False</DSILowPowerModeInHSA>
    <DSILowPowerModeInBLLPEOF>True</DSILowPowerModeInBLLPEOF>
    <DSILowPowerModeInBLLP>True</DSILowPowerModeInBLLP>
    <DSIRefreshRate>0x3C0000</DSIRefreshRate>
    <DSIPhyDCDCMode>True</DSIPhyDCDCMode>
    <DSIInitMasterTime>32</DSIInitMasterTime>  
    <DSIControllerMapping>
        01
    </DSIControllerMapping> 
</Group>
<DSIInitSequence>
    FF 20
    15 FF 20
    15 FB 01
    15 00 01
    15 01 55
    15 02 45
    15 05 40
    15 06 19
    15 07 1E
    15 0B 73
    15 0C 73
    15 0E B0
    15 0F AE
    15 11 B8
    15 13 00
    15 58 80
    15 59 01
    15 5A 00
    15 5B 01
    15 5C 80
    15 5D 81
    15 5E 00
    15 5F 01
    15 72 31
    15 68 03
    15 FF 24
    15 FB 01
    15 00 1C
    15 01 0B
    15 02 0C
    15 03 01
    15 04 0F
    15 05 10
    15 06 10
    15 07 10
    15 08 89
    15 09 8A
    15 0A 13
    15 0B 13
    15 0C 15
    15 0D 15
    15 0E 17
    15 0F 17
    15 10 1C
    15 11 0B
    15 12 0C
    15 13 01
    15 14 0F
    15 15 10
    15 16 10
    15 17 10
    15 18 89
    15 19 8A
    15 1A 13
    15 1B 13
    15 1C 15
    15 1D 15
    15 1E 17
    15 1F 17
    15 20 40
    15 21 01
    15 22 00
    15 23 40
    15 24 40
    15 25 6D
    15 26 40
    15 27 40
    15 E0 00
    15 DC 21
    15 DD 22
    15 DE 07
    15 DF 07
    15 E3 6D
    15 E1 07
    15 E2 07
    15 29 D8
    15 2A 2A
    15 4B 03
    15 4C 11
    15 4D 10
    15 4E 01
    15 4F 01
    15 50 10
    15 51 00
    15 52 80
    15 53 00
    15 56 00
    15 54 07
    15 58 07
    15 55 25
    15 5B 43
    15 5C 00
    15 5F 73
    15 60 73
    15 63 22
    15 64 00
    15 67 08
    15 68 04
    15 72 02
    15 7A 80
    15 7B 91
    15 7C D8
    15 7D 60
    15 7F 15
    15 75 15
    15 B3 C0
    15 B4 00
    15 B5 00
    15 78 00
    15 79 00
    15 80 00
    15 83 00
    15 93 0A
    15 94 0A
    15 8A 00
    15 9B FF
    15 9D B0
    15 9F 63
    15 98 10
    15 EC 00
    15 FF 10
    15 fb 01
    15 ba 03
    15 e5 01
    15 b0 03
    39 3B 03 08 08 2e 64
    15 FF 28
    15 7a 02
    15 fb 01
    15 FF 10
    15 fb 01
    15 c0 03
    15 bb 03
    15 FF e0
    15 fb 01
    15 6b 3d
    15 6c 3d
    15 6d 3d
    15 6e 3d
    15 6f 3d
    15 35 02
    15 36 72
    15 37 10
    15 08 c0
    15 FF 10
    05 11 00
    ff 64
    05 29
    ff 28
    07 01
</DSIInitSequence>
<DSITermSequence>
    05 28 00
    FF 20
    05 10 00
    FF 80
</DSITermSequence>
<TLMMGPIODefaultHigh>34</TLMMGPIODefaultHigh>
<Group id='Backlight Configuration'>
    <BacklightType>1</BacklightType>
    <BacklightPmicControlType>2</BacklightPmicControlType>  
    <BacklightPMICBankSelect>3</BacklightPMICBankSelect>
    <BacklightPMICPWMFrequency>800000</BacklightPMICPWMFrequency>
    <BacklightSteps>100</BacklightSteps>
    <BacklightDefault>80</BacklightDefault>
    <BacklightLowPower>40</BacklightLowPower>
    <PMIPowerPmicNum>1</PMIPowerPmicNum>
    <PMIPowerPmicModel>21</PMIPowerPmicModel>
    <PMIPowerConfig>1</PMIPowerConfig>
    <AdaptiveBrightnessFeature>1</AdaptiveBrightnessFeature>
    <CABLEnable>True</CABLEnable>
    <BrightnessMinLuminance>200</BrightnessMinLuminance>
    <BrightnessMaxLuminance>319970</BrightnessMaxLuminance>
</Group>
<Group id='AD Configuration'>
    <ADMaxIterations>30</ADMaxIterations>
    <ADInitParam001>0x0000 0x0800 0x1000 0x1800 0x2000 0x2800 0x3000 0x3800 0x4000 0x4800 0x5000 0x5800 0x6000 0x6800 0x7000 0x7800 0x8000 0x87FF 0x8FFF 0x97FF 0x9FFF 0xA7FF 0xAFFF 0xB7FF 0xBFFF 0xC7FF 0xCFFF 0xD7FF 0xDFFF 0xE7FF 0xEFFF 0xF7FF 0xFFFF </ADInitParam001>
    <ADInitParam002>0x0000 0x0800 0x1000 0x1800 0x2000 0x2800 0x3000 0x3800 0x4000 0x4800 0x5000 0x5800 0x6000 0x6800 0x7000 0x7800 0x8000 0x87FF 0x8FFF 0x97FF 0x9FFF 0xA7FF 0xAFFF 0xB7FF 0xBFFF 0xC7FF 0xCFFF 0xD7FF 0xDFFF 0xE7FF 0xEFFF 0xF7FF 0xFFFF </ADInitParam002>
    <ADInitParam003>0x0000 0x0800 0x1000 0x1800 0x2000 0x2800 0x3000 0x3800 0x4000 0x4800 0x5000 0x5800 0x6000 0x6800 0x7000 0x7800 0x8000 0x87FF 0x8FFF 0x97FF 0x9FFF 0xA7FF 0xAFFF 0xB7FF 0xBFFF 0xC7FF 0xCFFF 0xD7FF 0xDFFF 0xE7FF 0xEFFF 0xF7FF 0xFFFF </ADInitParam003>	
    <ADInitParam004>0x0000 0x0800 0x1000 0x1801 0x1D61 0x22F2 0x26A2 0x2993 0x2C23 0x2E94 0x3114 0x33A5 0x3685 0x39C6 0x3D66 0x4177 0x45E7 0x4AE8 0x5058 0x5669 0x5D29 0x648A 0x6CAA 0x759B 0x7F7B 0x8A5C 0x965C 0xA3AD 0xB25D 0xC2BE 0xD4EE 0xE93F 0xFFFF </ADInitParam004>
    <ADInitParam005>0x0001 0x0032 0x0064 0x0096 0x00FA 0x015E 0x0190 0x0384 0x04E2 0x0708 0x08FC 0x0BB8 0x1770 0x2EE0 0x5DC0 0xC350 0x04B0 0x2125 0x2EE0 0x3969 0x4A1E 0x57B2 0x5DC0 0x8CA0 0xA5BA 0xC6E0 0xE0CE 0xFFFF 0xFFFF 0xFFFF 0xFFFF 0xFFFF </ADInitParam005>
    <ADInitParam006>0x0000 0x000A 0x0019 0x0032 0x0064 0x00C8 0x0190 0x02BC 0x03E8 0x05DC 0x09C4 0x0FA0 0x1F40 0x3A98 0x7530 0xFFFF 0x0000 0x000A 0x0019 0x0032 0x0064 0x00C8 0x0190 0x02BC 0x03E8 0x05DC 0x09C4 0x0FA0 0x1F40 0x3A98 0x7530 0xFFFF </ADInitParam006>
    <ADInitParam007>0x0000 0x0095 0x0128 0x01B9 0x0249 0x02D8 0x0365 0x03F1 0x047B 0x0504 0x058C 0x0612 0x0697 0x071A 0x079D 0x081E 0x089E 0x091C 0x099A 0x0A16 0x0A91 0x0B0B 0x0B83 0x0BFB 0x0C71 0x0CE7 0x0D5B 0x0DCE 0x0E41 0x0EB2 0x0F22 0x0F91 0x0FFF </ADInitParam007>
    <ADInitParam008>0x00FF 0x0116 0x012E 0x0146 0x015E 0x0176 0x018E 0x01A6 0x01BE 0x01D6 0x01EE 0x0205 0x021D 0x0235 0x024D 0x0265 0x027D 0x0295 0x02AC 0x02C4 0x02DC 0x02F3 0x030B 0x0323 0x033A 0x0352 0x036A 0x0381 0x0399 0x03B1 0x03C8 0x03E0 0x03F8 </ADInitParam008>
    <ADInitParam009>0x03</ADInitParam009>
    <ADInitParam010>0x3F</ADInitParam010>
    <ADInitParam011>0x0780</ADInitParam011>
    <ADInitParam012>0x0438</ADInitParam012>
    <ADInitParam013>0x0002</ADInitParam013>
    <ADInitParam014>0x0002</ADInitParam014>
    <ADInitParam015>0xFFFF</ADInitParam015>
    <ADInitParam016>0x06</ADInitParam016>
    <ADInitParam017>0x030</ADInitParam017>
    <ADInitParam018>0x012</ADInitParam018>
    <ADInitParam019>0x044</ADInitParam019>
    <ADInitParam020>0xFFFF</ADInitParam020>
    <ADInitParam021>0x80</ADInitParam021>
    <ADInitParam022>0x80</ADInitParam022>
    <ADInitParam023>0x07AE</ADInitParam023>
    <ADInitParam024>0x0800</ADInitParam024>
    <ADInitParam025>0x0333</ADInitParam025>
    <ADInitParam026>0x0800</ADInitParam026>
    <ADInitParam027>0x0333</ADInitParam027>
    <ADInitParam028>0x0006</ADInitParam028>
    <ADInitParam029>0x0222</ADInitParam029>
    <ADInitParam030>0x1000</ADInitParam030>
    <ADInitParam031>0x012C</ADInitParam031>
    <ADInitParam032>0x0BB8</ADInitParam032>
    <ADInitParam033>0x1DB0</ADInitParam033>
    <ADInitParam034>0xFFFF</ADInitParam034>
    <ADInitParam035>0xFFFF</ADInitParam035>
    <ADInitParam036>0x10</ADInitParam036>
    <ADInitParam037>0x00</ADInitParam037>
    <ADInitParam038>0x10</ADInitParam038>
    <ADInitParam039>0x00</ADInitParam039>
    <ADInitParam040>0xFFFF</ADInitParam040>
    <ADInitParam041>0x10</ADInitParam041>
    <ADInitParam042>0x1000</ADInitParam042>
    <ADInitParam043>0x10</ADInitParam043>		
    <ADInitParam044>0x0200</ADInitParam044>
    <ADInitParam045>0x0080</ADInitParam045>
    <ADInitParam046>0x0</ADInitParam046>
    <ADInitParam047>0xFF</ADInitParam047>
    <ADInitParam048>0x07</ADInitParam048>
    <ADInitParam049>0xC6</ADInitParam049>
    <ADInitParam050>0x41</ADInitParam050>
    <ADInitParam051>0x3C</ADInitParam051>
    <ADInitParam052>0x80</ADInitParam052>
    <ADInitParam053>0x000</ADInitParam053>
    <ADInitParam054>0x3FF</ADInitParam054>
    <ADInitParam055>0xF0</ADInitParam055>
    <ADInitParam056>0x00</ADInitParam056>
    <ADInitParam057>0x01</ADInitParam057>
    <ADInitParam058>0x2</ADInitParam058>
    <ADInitParam059>0x05</ADInitParam059>
    <ADInitParam060>0x00</ADInitParam060>
    <ADInitParam061>0x00</ADInitParam061>
    <ADInitParam062>0x003</ADInitParam062>
    <ADInitParam063>0x001</ADInitParam063>
    <ADInitParam064>0x001</ADInitParam064>
    <ADInitParam065>0x3FF</ADInitParam065>
    <ADInitParam066>0x08</ADInitParam066>
    <ADInitParam067>0x08</ADInitParam067>
    <ADInitParam068>0x13</ADInitParam068>
    <ADInitParam069>0x0000</ADInitParam069>
    <ADInitParam070>0x001</ADInitParam070>
    <ADInitParam071>0x00C</ADInitParam071>
    <ADInitParam072>0x050</ADInitParam072>
    <ADInitParam073>0x80</ADInitParam073>
    <ADInitParam074>0x040</ADInitParam074>
    <ADInitParam075>0x008</ADInitParam075>

    <ADCfgParam001>0x0000</ADCfgParam001>
    <ADCfgParam002>0xFFFF</ADCfgParam002>
    <ADCfgParam003>0x0000</ADCfgParam003>
    <ADCfgParam004>0xFFFF</ADCfgParam004>
    <ADCfgParam005>0x86</ADCfgParam005>
    <ADCfgParam006>0x10</ADCfgParam006>
    <ADCfgParam007>0x80</ADCfgParam007>
    <ADCfgParam008>0x54</ADCfgParam008>
    <ADCfgParam009>0x200</ADCfgParam009>
    <ADCfgParam010>0x500</ADCfgParam010>
    <ADCfgParam011>0x0400</ADCfgParam011>
    <ADCfgParam012>0x0400</ADCfgParam012>
    <ADCfgParam013>0x80</ADCfgParam013>
    <ADCfgParam014>0x5025</ADCfgParam014>
    <ADCfgParam015>0x0000</ADCfgParam015>
    <ADCfgParam016>0x200</ADCfgParam016>
    <ADCfgParam017>0x0020</ADCfgParam017>
    <ADCfgParam018>0x0222</ADCfgParam018>
    <ADCfgParam019>0x0400</ADCfgParam019>
    <ADCfgParam020>0x0400</ADCfgParam020>
    <ADCfgParam021>0x0001</ADCfgParam021>
    <ADCfgParam022>0x0222</ADCfgParam022>
    <ADCfgParam023>0x0400</ADCfgParam023>
    <ADCfgParam024>0x1000</ADCfgParam024>
    <ADCfgParam025>0x0018</ADCfgParam025>
    <ADCfgParam026>0x005F</ADCfgParam026>
    <ADCfgParam027>0x0008</ADCfgParam027>
    <ADCfgParam028>0x0000</ADCfgParam028>
    <ADCfgParam029>0x0000</ADCfgParam029>
    <ADCfgParam030>0x0010</ADCfgParam030>
    <ADCfgParam031>0x080</ADCfgParam031>
    <ADCfgParam032>0x200</ADCfgParam032>
    <ADCfgParam033>0x80</ADCfgParam033>
    <ADCfgParam034>0x0020</ADCfgParam034>
    <ADCfgParam035>0x022</ADCfgParam035>
    <ADCfgParam036>0x600</ADCfgParam036>
    <ADCfgParam037>0x310</ADCfgParam037>
    <ADCfgParam038>0x80</ADCfgParam038>
    <ADCfgParam039>0x30</ADCfgParam039>
    <ADCfgParam040>0x19A</ADCfgParam040>
    <ADCfgParam041>0x03</ADCfgParam041>
    <ADCfgParam042>0x200</ADCfgParam042>
    <ADCfgParam043>0x200</ADCfgParam043>
    <ADCfgParam044>0x80</ADCfgParam044>      
    <ADCfgParam045>0x90</ADCfgParam045>           
    <ADCfgParam046>0x2000</ADCfgParam046>	
</Group>
<Group id='Connection Configuration'>
    <Display1Reset1Info>DSI_PANEL_RESET, 0, 30</Display1Reset1Info>
    <Display1Power1Info>DSI_PANEL_MODE_SELECT, 1, 0, 0, 0, TRUE</Display1Power1Info>
</Group>
"})

Name (PCF4,
    Buffer() {"<?xml version='1.0' encoding='utf-8'?>
<PanelName>LS060R1SX03</PanelName>
<PanelDescription>Sharp Dual DSI Command Mode DSC Panel (2160x3840 24bpp)</PanelDescription>
<Group id='EDID Configuration'>
    <ManufactureID>0x104D</ManufactureID>
    <ProductCode>850</ProductCode>
    <SerialNumber>0x000001</SerialNumber>
    <WeekofManufacture>0x01</WeekofManufacture>
    <YearofManufacture>0x1B</YearofManufacture>
    <EDIDVersion>1</EDIDVersion>
    <EDIDRevision>3</EDIDRevision>
    <VideoInputDefinition>0x80</VideoInputDefinition>
    <HorizontalScreenSize>0x07</HorizontalScreenSize>
    <VerticalScreenSize>0x0C</VerticalScreenSize>
    <DisplayTransferCharacteristics>0x78</DisplayTransferCharacteristics>
    <FeatureSupport>0x2</FeatureSupport>
    <Red.GreenBits>0xA5</Red.GreenBits>
    <Blue.WhiteBits>0x58</Blue.WhiteBits>
    <RedX>0xA6</RedX>
    <RedY>0x54</RedY>
    <GreenX>0x33</GreenX>
    <GreenY>0xB3</GreenY>
    <BlueX>0x26</BlueX>
    <BlueY>0x12</BlueY>
    <WhiteX>0x4F</WhiteX>
    <WhiteY>0x54</WhiteY>
    <EstablishedTimingsI>0x0</EstablishedTimingsI>
    <EstablishedTimingsII>0x0</EstablishedTimingsII>
    <ManufacturesTiming>0x0</ManufacturesTiming>
    <StandardTimings1/>
    <StandardTimings2/>
    <StandardTimings3/>
    <StandardTimings4/>
    <StandardTimings5/>
    <StandardTimings6/>
    <StandardTimings7/>
    <SignalTimingInterface/>
</Group>
<Group id='Detailed Timing'>
    <HorizontalScreenSizeMM>0x44</HorizontalScreenSizeMM>
    <VerticalScreenSizeMM>0x78</VerticalScreenSizeMM>
    <HorizontalVerticalScreenSizeMM>0x00</HorizontalVerticalScreenSizeMM>
</Group>
<Group id='Active Timing'>
    <HorizontalActive>2160</HorizontalActive>
    <HorizontalFrontPorch>30</HorizontalFrontPorch>
    <HorizontalBackPorch>100</HorizontalBackPorch>
    <HorizontalSyncPulse>4</HorizontalSyncPulse>
    <HorizontalSyncSkew>0</HorizontalSyncSkew>
    <HorizontalLeftBorder>0</HorizontalLeftBorder>
    <HorizontalRightBorder>0</HorizontalRightBorder>
    <VerticalActive>3840</VerticalActive>
    <VerticalFrontPorch>8</VerticalFrontPorch>
    <VerticalBackPorch>7</VerticalBackPorch>
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
    <DSITECheckEnable>False</DSITECheckEnable>
    <DSITEUsingDedicatedTEPin>True</DSITEUsingDedicatedTEPin>
    <DSITEvSyncInitVal>0</DSITEvSyncInitVal>
    <DSITEvSyncRdPtrIrqLine>3600</DSITEvSyncRdPtrIrqLine>
    <DSIDSCEnable>True</DSIDSCEnable>
    <DSIDSCMajorVersion>1</DSIDSCMajorVersion>
    <DSIDSCMinorVersion>1</DSIDSCMinorVersion>
    <DSIDSCScr>0</DSIDSCScr>
    <DSIDSCProfileID>4</DSIDSCProfileID>
    <DSIDSCSliceWidth>1080</DSIDSCSliceWidth>
    <DSIDSCSliceHeight>32</DSIDSCSliceHeight>
    <DSIInitMasterTime>128</DSIInitMasterTime>  
    <DSIControllerMapping>
        00 01
    </DSIControllerMapping> 
</Group>
<DSIInitSequence>
    39 91 09 20 00 20 02 00 03 1c 04 21 00 0f 03 19 01 97
    39 92 10 f0
    15 90 03
    15 03 01
    39 f0 55 aa 52 08 04
    15 c0 03
    39 f0 55 aa 52 08 07
    15 ef 01
    39 f0 55 aa 52 08 00
    15 b4 01
    15 35 00
    39 f0 55 aa 52 08 01
    39 ff aa 55 a5 80
    15 6f 01
    15 f3 10
    39 ff aa 55 a5 00
    05 11
    ff 78
    05 29
    ff 78
</DSIInitSequence>
<DSITermSequence>
    05 28 00
    FF 20
    05 10 00
    FF 80
</DSITermSequence>
<Group id='Connection Configuration'>
    <Display1Reset1Info>DSI_PANEL_RESET, 0, 30</Display1Reset1Info>
    <Display1Power1Info>DSI_PANEL_MODE_SELECT, 0, 0, 0, 0, TRUE</Display1Power1Info>
</Group>
<Group id='Backlight Configuration'>
    <BacklightType>1</BacklightType>
    <BacklightPmicControlType>2</BacklightPmicControlType>
    <BacklightSteps>100</BacklightSteps>
    <BacklightPMICBankSelect>3</BacklightPMICBankSelect>
    <BacklightPMICPWMFrequency>800000</BacklightPMICPWMFrequency>
    <BacklightSteps>100</BacklightSteps>
    <BacklightDefault>80</BacklightDefault>
    <BacklightLowPower>40</BacklightLowPower>
    <PMIPowerPmicNum>1</PMIPowerPmicNum>
    <PMIPowerPmicModel>21</PMIPowerPmicModel>
    <PMIPowerConfig>1</PMIPowerConfig>
    <AdaptiveBrightnessFeature>1</AdaptiveBrightnessFeature>
    <CABLEnable>True</CABLEnable>
    <BrightnessMinLuminance>200</BrightnessMinLuminance>
    <BrightnessMaxLuminance>319970</BrightnessMaxLuminance>
</Group>
<Group id='AD Configuration'>
    <ADMaxIterations>30</ADMaxIterations>
    <ADInitParam001>0x0000 0x0800 0x1000 0x1800 0x2000 0x2800 0x3000 0x3800 0x4000 0x4800 0x5000 0x5800 0x6000 0x6800 0x7000 0x7800 0x8000 0x87FF 0x8FFF 0x97FF 0x9FFF 0xA7FF 0xAFFF 0xB7FF 0xBFFF 0xC7FF 0xCFFF 0xD7FF 0xDFFF 0xE7FF 0xEFFF 0xF7FF 0xFFFF </ADInitParam001>
    <ADInitParam002>0x0000 0x0800 0x1000 0x1800 0x2000 0x2800 0x3000 0x3800 0x4000 0x4800 0x5000 0x5800 0x6000 0x6800 0x7000 0x7800 0x8000 0x87FF 0x8FFF 0x97FF 0x9FFF 0xA7FF 0xAFFF 0xB7FF 0xBFFF 0xC7FF 0xCFFF 0xD7FF 0xDFFF 0xE7FF 0xEFFF 0xF7FF 0xFFFF </ADInitParam002>
    <ADInitParam003>0x0000 0x0800 0x1000 0x1800 0x2000 0x2800 0x3000 0x3800 0x4000 0x4800 0x5000 0x5800 0x6000 0x6800 0x7000 0x7800 0x8000 0x87FF 0x8FFF 0x97FF 0x9FFF 0xA7FF 0xAFFF 0xB7FF 0xBFFF 0xC7FF 0xCFFF 0xD7FF 0xDFFF 0xE7FF 0xEFFF 0xF7FF 0xFFFF </ADInitParam003>	
    <ADInitParam004>0x0000 0x0800 0x1000 0x1801 0x1D61 0x22F2 0x26A2 0x2993 0x2C23 0x2E94 0x3114 0x33A5 0x3685 0x39C6 0x3D66 0x4177 0x45E7 0x4AE8 0x5058 0x5669 0x5D29 0x648A 0x6CAA 0x759B 0x7F7B 0x8A5C 0x965C 0xA3AD 0xB25D 0xC2BE 0xD4EE 0xE93F 0xFFFF </ADInitParam004>
    <ADInitParam005>0x0001 0x0032 0x0064 0x0096 0x00FA 0x015E 0x0190 0x0384 0x04E2 0x0708 0x08FC 0x0BB8 0x1770 0x2EE0 0x5DC0 0xC350 0x04B0 0x2125 0x2EE0 0x3969 0x4A1E 0x57B2 0x5DC0 0x8CA0 0xA5BA 0xC6E0 0xE0CE 0xFFFF 0xFFFF 0xFFFF 0xFFFF 0xFFFF </ADInitParam005>
    <ADInitParam006>0x0000 0x000A 0x0019 0x0032 0x0064 0x00C8 0x0190 0x02BC 0x03E8 0x05DC 0x09C4 0x0FA0 0x1F40 0x3A98 0x7530 0xFFFF 0x0000 0x000A 0x0019 0x0032 0x0064 0x00C8 0x0190 0x02BC 0x03E8 0x05DC 0x09C4 0x0FA0 0x1F40 0x3A98 0x7530 0xFFFF </ADInitParam006>
    <ADInitParam007>0x0000 0x0095 0x0128 0x01B9 0x0249 0x02D8 0x0365 0x03F1 0x047B 0x0504 0x058C 0x0612 0x0697 0x071A 0x079D 0x081E 0x089E 0x091C 0x099A 0x0A16 0x0A91 0x0B0B 0x0B83 0x0BFB 0x0C71 0x0CE7 0x0D5B 0x0DCE 0x0E41 0x0EB2 0x0F22 0x0F91 0x0FFF </ADInitParam007>
    <ADInitParam008>0x00FF 0x0116 0x012E 0x0146 0x015E 0x0176 0x018E 0x01A6 0x01BE 0x01D6 0x01EE 0x0205 0x021D 0x0235 0x024D 0x0265 0x027D 0x0295 0x02AC 0x02C4 0x02DC 0x02F3 0x030B 0x0323 0x033A 0x0352 0x036A 0x0381 0x0399 0x03B1 0x03C8 0x03E0 0x03F8 </ADInitParam008>
    <ADInitParam009>0x03</ADInitParam009>
    <ADInitParam010>0x3F</ADInitParam010>
    <ADInitParam011>0x0780</ADInitParam011>
    <ADInitParam012>0x0438</ADInitParam012>
    <ADInitParam013>0x0002</ADInitParam013>
    <ADInitParam014>0x0002</ADInitParam014>
    <ADInitParam015>0xFFFF</ADInitParam015>
    <ADInitParam016>0x06</ADInitParam016>
    <ADInitParam017>0x030</ADInitParam017>
    <ADInitParam018>0x012</ADInitParam018>
    <ADInitParam019>0x044</ADInitParam019>
    <ADInitParam020>0xFFFF</ADInitParam020>
    <ADInitParam021>0x80</ADInitParam021>
    <ADInitParam022>0x80</ADInitParam022>
    <ADInitParam023>0x07AE</ADInitParam023>
    <ADInitParam024>0x0800</ADInitParam024>
    <ADInitParam025>0x0333</ADInitParam025>
    <ADInitParam026>0x0800</ADInitParam026>
    <ADInitParam027>0x0333</ADInitParam027>
    <ADInitParam028>0x0006</ADInitParam028>
    <ADInitParam029>0x0222</ADInitParam029>
    <ADInitParam030>0x1000</ADInitParam030>
    <ADInitParam031>0x012C</ADInitParam031>
    <ADInitParam032>0x0BB8</ADInitParam032>
    <ADInitParam033>0x1DB0</ADInitParam033>
    <ADInitParam034>0xFFFF</ADInitParam034>
    <ADInitParam035>0xFFFF</ADInitParam035>
    <ADInitParam036>0x10</ADInitParam036>
    <ADInitParam037>0x00</ADInitParam037>
    <ADInitParam038>0x10</ADInitParam038>
    <ADInitParam039>0x00</ADInitParam039>
    <ADInitParam040>0xFFFF</ADInitParam040>
    <ADInitParam041>0x10</ADInitParam041>
    <ADInitParam042>0x1000</ADInitParam042>
    <ADInitParam043>0x10</ADInitParam043>		
    <ADInitParam044>0x0200</ADInitParam044>
    <ADInitParam045>0x0080</ADInitParam045>
    <ADInitParam046>0x0</ADInitParam046>
    <ADInitParam047>0xFF</ADInitParam047>
    <ADInitParam048>0x07</ADInitParam048>
    <ADInitParam049>0xC6</ADInitParam049>
    <ADInitParam050>0x41</ADInitParam050>
    <ADInitParam051>0x3C</ADInitParam051>
    <ADInitParam052>0x80</ADInitParam052>
    <ADInitParam053>0x000</ADInitParam053>
    <ADInitParam054>0x3FF</ADInitParam054>
    <ADInitParam055>0xF0</ADInitParam055>
    <ADInitParam056>0x00</ADInitParam056>
    <ADInitParam057>0x01</ADInitParam057>
    <ADInitParam058>0x2</ADInitParam058>
    <ADInitParam059>0x05</ADInitParam059>
    <ADInitParam060>0x00</ADInitParam060>
    <ADInitParam061>0x00</ADInitParam061>
    <ADInitParam062>0x003</ADInitParam062>
    <ADInitParam063>0x001</ADInitParam063>
    <ADInitParam064>0x001</ADInitParam064>
    <ADInitParam065>0x3FF</ADInitParam065>
    <ADInitParam066>0x08</ADInitParam066>
    <ADInitParam067>0x08</ADInitParam067>
    <ADInitParam068>0x13</ADInitParam068>
    <ADInitParam069>0x0000</ADInitParam069>
    <ADInitParam070>0x001</ADInitParam070>
    <ADInitParam071>0x00C</ADInitParam071>
    <ADInitParam072>0x050</ADInitParam072>
    <ADInitParam073>0x80</ADInitParam073>
    <ADInitParam074>0x040</ADInitParam074>
    <ADInitParam075>0x008</ADInitParam075>

    <ADCfgParam001>0x0000</ADCfgParam001>
    <ADCfgParam002>0xFFFF</ADCfgParam002>
    <ADCfgParam003>0x0000</ADCfgParam003>
    <ADCfgParam004>0xFFFF</ADCfgParam004>
    <ADCfgParam005>0x86</ADCfgParam005>
    <ADCfgParam006>0x10</ADCfgParam006>
    <ADCfgParam007>0x80</ADCfgParam007>
    <ADCfgParam008>0x54</ADCfgParam008>
    <ADCfgParam009>0x200</ADCfgParam009>
    <ADCfgParam010>0x500</ADCfgParam010>
    <ADCfgParam011>0x0400</ADCfgParam011>
    <ADCfgParam012>0x0400</ADCfgParam012>
    <ADCfgParam013>0x80</ADCfgParam013>
    <ADCfgParam014>0x5025</ADCfgParam014>
    <ADCfgParam015>0x0000</ADCfgParam015>
    <ADCfgParam016>0x200</ADCfgParam016>
    <ADCfgParam017>0x0020</ADCfgParam017>
    <ADCfgParam018>0x0222</ADCfgParam018>
    <ADCfgParam019>0x0400</ADCfgParam019>
    <ADCfgParam020>0x0400</ADCfgParam020>
    <ADCfgParam021>0x0001</ADCfgParam021>
    <ADCfgParam022>0x0222</ADCfgParam022>
    <ADCfgParam023>0x0400</ADCfgParam023>
    <ADCfgParam024>0x1000</ADCfgParam024>
    <ADCfgParam025>0x0018</ADCfgParam025>
    <ADCfgParam026>0x005F</ADCfgParam026>
    <ADCfgParam027>0x0008</ADCfgParam027>
    <ADCfgParam028>0x0000</ADCfgParam028>
    <ADCfgParam029>0x0000</ADCfgParam029>
    <ADCfgParam030>0x0010</ADCfgParam030>
    <ADCfgParam031>0x080</ADCfgParam031>
    <ADCfgParam032>0x200</ADCfgParam032>
    <ADCfgParam033>0x80</ADCfgParam033>
    <ADCfgParam034>0x0020</ADCfgParam034>
    <ADCfgParam035>0x022</ADCfgParam035>
    <ADCfgParam036>0x600</ADCfgParam036>
    <ADCfgParam037>0x310</ADCfgParam037>
    <ADCfgParam038>0x80</ADCfgParam038>
    <ADCfgParam039>0x30</ADCfgParam039>
    <ADCfgParam040>0x19A</ADCfgParam040>
    <ADCfgParam041>0x03</ADCfgParam041>
    <ADCfgParam042>0x200</ADCfgParam042>
    <ADCfgParam043>0x200</ADCfgParam043>
    <ADCfgParam044>0x80</ADCfgParam044>      
    <ADCfgParam045>0x90</ADCfgParam045>           
    <ADCfgParam046>0x2000</ADCfgParam046>	
</Group>
"})

Name (PCF5,
    Buffer() {"<?xml version='1.0' encoding='utf-8'?>
<PanelName>LS060R1SX03</PanelName>
<PanelDescription>Sharp Dual DSI Video Mode Panel with DSC (2160x3840 24bpp)</PanelDescription>
<Group id='EDID Configuration'>
    <ManufactureID>0x104D</ManufactureID>
    <ProductCode>850</ProductCode>
    <SerialNumber>0x000001</SerialNumber>
    <WeekofManufacture>0x01</WeekofManufacture>
    <YearofManufacture>0x1B</YearofManufacture>
    <EDIDVersion>1</EDIDVersion>
    <EDIDRevision>3</EDIDRevision>
    <VideoInputDefinition>0x80</VideoInputDefinition>
    <HorizontalScreenSize>0x07</HorizontalScreenSize>
    <VerticalScreenSize>0x0C</VerticalScreenSize>
    <DisplayTransferCharacteristics>0x78</DisplayTransferCharacteristics>
    <FeatureSupport>0x2</FeatureSupport>
    <Red.GreenBits>0xA5</Red.GreenBits>
    <Blue.WhiteBits>0x58</Blue.WhiteBits>
    <RedX>0xA6</RedX>
    <RedY>0x54</RedY>
    <GreenX>0x33</GreenX>
    <GreenY>0xB3</GreenY>
    <BlueX>0x26</BlueX>
    <BlueY>0x12</BlueY>
    <WhiteX>0x4F</WhiteX>
    <WhiteY>0x54</WhiteY>
    <EstablishedTimingsI>0x0</EstablishedTimingsI>
    <EstablishedTimingsII>0x0</EstablishedTimingsII>
    <ManufacturesTiming>0x0</ManufacturesTiming>
    <StandardTimings1/>
    <StandardTimings2/>
    <StandardTimings3/>
    <StandardTimings4/>
    <StandardTimings5/>
    <StandardTimings6/>
    <StandardTimings7/>
    <SignalTimingInterface/>
</Group>
<Group id='Detailed Timing'>
    <HorizontalScreenSizeMM>0x44</HorizontalScreenSizeMM>
    <VerticalScreenSizeMM>0x78</VerticalScreenSizeMM>
    <HorizontalVerticalScreenSizeMM>0x00</HorizontalVerticalScreenSizeMM>
</Group>
<Group id='Active Timing'>
    <HorizontalActive>2160</HorizontalActive>
    <HorizontalFrontPorch>30</HorizontalFrontPorch>
    <HorizontalBackPorch>100</HorizontalBackPorch>
    <HorizontalSyncPulse>4</HorizontalSyncPulse>
    <HorizontalSyncSkew>0</HorizontalSyncSkew>
    <HorizontalLeftBorder>0</HorizontalLeftBorder>
    <HorizontalRightBorder>0</HorizontalRightBorder>
    <VerticalActive>3840</VerticalActive>
    <VerticalFrontPorch>8</VerticalFrontPorch>
    <VerticalBackPorch>7</VerticalBackPorch>
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
    <InterfaceType>8</InterfaceType>
    <InterfaceColorFormat>3</InterfaceColorFormat>
</Group>
<Group id='DSI Interface'>
    <DSIChannelId>1</DSIChannelId>
    <DSIVirtualId>0</DSIVirtualId>
    <DSIColorFormat>36</DSIColorFormat>
    <DSITrafficMode>1</DSITrafficMode>
    <DSIDSCEnable>True</DSIDSCEnable>
    <DSIDSCMajorVersion>1</DSIDSCMajorVersion>
    <DSIDSCMinorVersion>1</DSIDSCMinorVersion>
    <DSIDSCScr>0</DSIDSCScr>
    <DSIDSCProfileID>4</DSIDSCProfileID>
    <DSIDSCSliceWidth>1080</DSIDSCSliceWidth>
    <DSIDSCSliceHeight>32</DSIDSCSliceHeight>
    <DSILanes>4</DSILanes>
    <DSIHsaHseAfterVsVe>False</DSIHsaHseAfterVsVe>
    <DSILowPowerModeInHFP>False</DSILowPowerModeInHFP>
    <DSILowPowerModeInHBP>False</DSILowPowerModeInHBP>
    <DSILowPowerModeInHSA>False</DSILowPowerModeInHSA>
    <DSILowPowerModeInBLLPEOF>True</DSILowPowerModeInBLLPEOF>
    <DSILowPowerModeInBLLP>True</DSILowPowerModeInBLLP>
    <DSIRefreshRate>0x3C0000</DSIRefreshRate>
    <DSIPhyDCDCMode>True</DSIPhyDCDCMode>
    <DSIInitMasterTime>128</DSIInitMasterTime>  
    <DSIControllerMapping>
        00 01
    </DSIControllerMapping> 
</Group>
<DSIInitSequence>
    39 91 09 20 00 20 02 00 03 1c 04 21 00 0f 03 19 01 97
    39 92 10 f0
    15 90 03
    15 03 01
    39 f0 55 aa 52 08 04
    15 c0 03
    39 f0 55 aa 52 08 07
    15 ef 01
    39 f0 55 aa 52 08 00
    15 b4 10
    15 35 00
    39 f0 55 aa 52 08 01
    39 ff aa 55 a5 80
    15 6f 01
    15 f3 10
    39 ff aa 55 a5 00
    05 11
    ff 78
    05 29
    ff 78
</DSIInitSequence>
<DSITermSequence>
    05 28 00
    FF 20
    05 10 00
    FF 80
</DSITermSequence>
<Group id='Connection Configuration'>
    <Display1Reset1Info>DSI_PANEL_RESET, 0, 30</Display1Reset1Info>
    <Display1Power1Info>DSI_PANEL_MODE_SELECT, 0, 0, 0, 0, TRUE</Display1Power1Info>
</Group>
<Group id='Backlight Configuration'>
    <BacklightType>1</BacklightType>
    <BacklightPmicControlType>2</BacklightPmicControlType>
    <BacklightSteps>100</BacklightSteps>
    <BacklightPMICBankSelect>3</BacklightPMICBankSelect>
    <BacklightPMICPWMFrequency>800000</BacklightPMICPWMFrequency>
    <BacklightSteps>100</BacklightSteps>
    <BacklightDefault>80</BacklightDefault>
    <BacklightLowPower>40</BacklightLowPower>
    <PMIPowerPmicNum>1</PMIPowerPmicNum>
    <PMIPowerPmicModel>21</PMIPowerPmicModel>
    <PMIPowerConfig>1</PMIPowerConfig>
    <AdaptiveBrightnessFeature>1</AdaptiveBrightnessFeature>
    <CABLEnable>True</CABLEnable>
    <BrightnessMinLuminance>200</BrightnessMinLuminance>
    <BrightnessMaxLuminance>319970</BrightnessMaxLuminance>
</Group>
<Group id='AD Configuration'>
    <ADMaxIterations>30</ADMaxIterations>
    <ADInitParam001>0x0000 0x0800 0x1000 0x1800 0x2000 0x2800 0x3000 0x3800 0x4000 0x4800 0x5000 0x5800 0x6000 0x6800 0x7000 0x7800 0x8000 0x87FF 0x8FFF 0x97FF 0x9FFF 0xA7FF 0xAFFF 0xB7FF 0xBFFF 0xC7FF 0xCFFF 0xD7FF 0xDFFF 0xE7FF 0xEFFF 0xF7FF 0xFFFF </ADInitParam001>
    <ADInitParam002>0x0000 0x0800 0x1000 0x1800 0x2000 0x2800 0x3000 0x3800 0x4000 0x4800 0x5000 0x5800 0x6000 0x6800 0x7000 0x7800 0x8000 0x87FF 0x8FFF 0x97FF 0x9FFF 0xA7FF 0xAFFF 0xB7FF 0xBFFF 0xC7FF 0xCFFF 0xD7FF 0xDFFF 0xE7FF 0xEFFF 0xF7FF 0xFFFF </ADInitParam002>
    <ADInitParam003>0x0000 0x0800 0x1000 0x1800 0x2000 0x2800 0x3000 0x3800 0x4000 0x4800 0x5000 0x5800 0x6000 0x6800 0x7000 0x7800 0x8000 0x87FF 0x8FFF 0x97FF 0x9FFF 0xA7FF 0xAFFF 0xB7FF 0xBFFF 0xC7FF 0xCFFF 0xD7FF 0xDFFF 0xE7FF 0xEFFF 0xF7FF 0xFFFF </ADInitParam003>	
    <ADInitParam004>0x0000 0x0800 0x1000 0x1801 0x1D61 0x22F2 0x26A2 0x2993 0x2C23 0x2E94 0x3114 0x33A5 0x3685 0x39C6 0x3D66 0x4177 0x45E7 0x4AE8 0x5058 0x5669 0x5D29 0x648A 0x6CAA 0x759B 0x7F7B 0x8A5C 0x965C 0xA3AD 0xB25D 0xC2BE 0xD4EE 0xE93F 0xFFFF </ADInitParam004>
    <ADInitParam005>0x0001 0x0032 0x0064 0x0096 0x00FA 0x015E 0x0190 0x0384 0x04E2 0x0708 0x08FC 0x0BB8 0x1770 0x2EE0 0x5DC0 0xC350 0x04B0 0x2125 0x2EE0 0x3969 0x4A1E 0x57B2 0x5DC0 0x8CA0 0xA5BA 0xC6E0 0xE0CE 0xFFFF 0xFFFF 0xFFFF 0xFFFF 0xFFFF </ADInitParam005>
    <ADInitParam006>0x0000 0x000A 0x0019 0x0032 0x0064 0x00C8 0x0190 0x02BC 0x03E8 0x05DC 0x09C4 0x0FA0 0x1F40 0x3A98 0x7530 0xFFFF 0x0000 0x000A 0x0019 0x0032 0x0064 0x00C8 0x0190 0x02BC 0x03E8 0x05DC 0x09C4 0x0FA0 0x1F40 0x3A98 0x7530 0xFFFF </ADInitParam006>
    <ADInitParam007>0x0000 0x0095 0x0128 0x01B9 0x0249 0x02D8 0x0365 0x03F1 0x047B 0x0504 0x058C 0x0612 0x0697 0x071A 0x079D 0x081E 0x089E 0x091C 0x099A 0x0A16 0x0A91 0x0B0B 0x0B83 0x0BFB 0x0C71 0x0CE7 0x0D5B 0x0DCE 0x0E41 0x0EB2 0x0F22 0x0F91 0x0FFF </ADInitParam007>
    <ADInitParam008>0x00FF 0x0116 0x012E 0x0146 0x015E 0x0176 0x018E 0x01A6 0x01BE 0x01D6 0x01EE 0x0205 0x021D 0x0235 0x024D 0x0265 0x027D 0x0295 0x02AC 0x02C4 0x02DC 0x02F3 0x030B 0x0323 0x033A 0x0352 0x036A 0x0381 0x0399 0x03B1 0x03C8 0x03E0 0x03F8 </ADInitParam008>
    <ADInitParam009>0x03</ADInitParam009>
    <ADInitParam010>0x3F</ADInitParam010>
    <ADInitParam011>0x0780</ADInitParam011>
    <ADInitParam012>0x0438</ADInitParam012>
    <ADInitParam013>0x0002</ADInitParam013>
    <ADInitParam014>0x0002</ADInitParam014>
    <ADInitParam015>0xFFFF</ADInitParam015>
    <ADInitParam016>0x06</ADInitParam016>
    <ADInitParam017>0x030</ADInitParam017>
    <ADInitParam018>0x012</ADInitParam018>
    <ADInitParam019>0x044</ADInitParam019>
    <ADInitParam020>0xFFFF</ADInitParam020>
    <ADInitParam021>0x80</ADInitParam021>
    <ADInitParam022>0x80</ADInitParam022>
    <ADInitParam023>0x07AE</ADInitParam023>
    <ADInitParam024>0x0800</ADInitParam024>
    <ADInitParam025>0x0333</ADInitParam025>
    <ADInitParam026>0x0800</ADInitParam026>
    <ADInitParam027>0x0333</ADInitParam027>
    <ADInitParam028>0x0006</ADInitParam028>
    <ADInitParam029>0x0222</ADInitParam029>
    <ADInitParam030>0x1000</ADInitParam030>
    <ADInitParam031>0x012C</ADInitParam031>
    <ADInitParam032>0x0BB8</ADInitParam032>
    <ADInitParam033>0x1DB0</ADInitParam033>
    <ADInitParam034>0xFFFF</ADInitParam034>
    <ADInitParam035>0xFFFF</ADInitParam035>
    <ADInitParam036>0x10</ADInitParam036>
    <ADInitParam037>0x00</ADInitParam037>
    <ADInitParam038>0x10</ADInitParam038>
    <ADInitParam039>0x00</ADInitParam039>
    <ADInitParam040>0xFFFF</ADInitParam040>
    <ADInitParam041>0x10</ADInitParam041>
    <ADInitParam042>0x1000</ADInitParam042>
    <ADInitParam043>0x10</ADInitParam043>		
    <ADInitParam044>0x0200</ADInitParam044>
    <ADInitParam045>0x0080</ADInitParam045>
    <ADInitParam046>0x0</ADInitParam046>
    <ADInitParam047>0xFF</ADInitParam047>
    <ADInitParam048>0x07</ADInitParam048>
    <ADInitParam049>0xC6</ADInitParam049>
    <ADInitParam050>0x41</ADInitParam050>
    <ADInitParam051>0x3C</ADInitParam051>
    <ADInitParam052>0x80</ADInitParam052>
    <ADInitParam053>0x000</ADInitParam053>
    <ADInitParam054>0x3FF</ADInitParam054>
    <ADInitParam055>0xF0</ADInitParam055>
    <ADInitParam056>0x00</ADInitParam056>
    <ADInitParam057>0x01</ADInitParam057>
    <ADInitParam058>0x2</ADInitParam058>
    <ADInitParam059>0x05</ADInitParam059>
    <ADInitParam060>0x00</ADInitParam060>
    <ADInitParam061>0x00</ADInitParam061>
    <ADInitParam062>0x003</ADInitParam062>
    <ADInitParam063>0x001</ADInitParam063>
    <ADInitParam064>0x001</ADInitParam064>
    <ADInitParam065>0x3FF</ADInitParam065>
    <ADInitParam066>0x08</ADInitParam066>
    <ADInitParam067>0x08</ADInitParam067>
    <ADInitParam068>0x13</ADInitParam068>
    <ADInitParam069>0x0000</ADInitParam069>
    <ADInitParam070>0x001</ADInitParam070>
    <ADInitParam071>0x00C</ADInitParam071>
    <ADInitParam072>0x050</ADInitParam072>
    <ADInitParam073>0x80</ADInitParam073>
    <ADInitParam074>0x040</ADInitParam074>
    <ADInitParam075>0x008</ADInitParam075>

    <ADCfgParam001>0x0000</ADCfgParam001>
    <ADCfgParam002>0xFFFF</ADCfgParam002>
    <ADCfgParam003>0x0000</ADCfgParam003>
    <ADCfgParam004>0xFFFF</ADCfgParam004>
    <ADCfgParam005>0x86</ADCfgParam005>
    <ADCfgParam006>0x10</ADCfgParam006>
    <ADCfgParam007>0x80</ADCfgParam007>
    <ADCfgParam008>0x54</ADCfgParam008>
    <ADCfgParam009>0x200</ADCfgParam009>
    <ADCfgParam010>0x500</ADCfgParam010>
    <ADCfgParam011>0x0400</ADCfgParam011>
    <ADCfgParam012>0x0400</ADCfgParam012>
    <ADCfgParam013>0x80</ADCfgParam013>
    <ADCfgParam014>0x5025</ADCfgParam014>
    <ADCfgParam015>0x0000</ADCfgParam015>
    <ADCfgParam016>0x200</ADCfgParam016>
    <ADCfgParam017>0x0020</ADCfgParam017>
    <ADCfgParam018>0x0222</ADCfgParam018>
    <ADCfgParam019>0x0400</ADCfgParam019>
    <ADCfgParam020>0x0400</ADCfgParam020>
    <ADCfgParam021>0x0001</ADCfgParam021>
    <ADCfgParam022>0x0222</ADCfgParam022>
    <ADCfgParam023>0x0400</ADCfgParam023>
    <ADCfgParam024>0x1000</ADCfgParam024>
    <ADCfgParam025>0x0018</ADCfgParam025>
    <ADCfgParam026>0x005F</ADCfgParam026>
    <ADCfgParam027>0x0008</ADCfgParam027>
    <ADCfgParam028>0x0000</ADCfgParam028>
    <ADCfgParam029>0x0000</ADCfgParam029>
    <ADCfgParam030>0x0010</ADCfgParam030>
    <ADCfgParam031>0x080</ADCfgParam031>
    <ADCfgParam032>0x200</ADCfgParam032>
    <ADCfgParam033>0x80</ADCfgParam033>
    <ADCfgParam034>0x0020</ADCfgParam034>
    <ADCfgParam035>0x022</ADCfgParam035>
    <ADCfgParam036>0x600</ADCfgParam036>
    <ADCfgParam037>0x310</ADCfgParam037>
    <ADCfgParam038>0x80</ADCfgParam038>
    <ADCfgParam039>0x30</ADCfgParam039>
    <ADCfgParam040>0x19A</ADCfgParam040>
    <ADCfgParam041>0x03</ADCfgParam041>
    <ADCfgParam042>0x200</ADCfgParam042>
    <ADCfgParam043>0x200</ADCfgParam043>
    <ADCfgParam044>0x80</ADCfgParam044>      
    <ADCfgParam045>0x90</ADCfgParam045>           
    <ADCfgParam046>0x2000</ADCfgParam046>	
</Group>"})
