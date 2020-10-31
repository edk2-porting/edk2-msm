//
// Copyright (c) 2015, Mmoclauq Technologies, Inc. All rights reserved.
//

//
// RemoteFS
// 
Device(RFS0)
{
    Name(_DEP, Package(0x2)
    {
      \_SB.IPC0,
      \_SB.UFS0
    })
    Name(_HID, "QCOM0235")
    Alias(PSUB, _SUB)
    Method(_CRS, 0x0, NotSerialized)
    {
        Name(RBUF, Buffer(0x26)
        {
0x86, 0x09, 0x00, 0x01, 0x88, 0x88, 0x88, 0x88, 0x99, 0x99, 0x99, 0x99,
0x86, 0x09, 0x00, 0x01, 0x11, 0x11, 0x11, 0x11, 0x22, 0x22, 0x22, 0x22,
0x86, 0x09, 0x00, 0x01, 0x33, 0x33, 0x33, 0x33, 0x44, 0x44, 0x44, 0x44,
0x79, 0x00
        })
        CreateDWordField(RBUF, 0x4, RMTA)
        CreateDWordField(RBUF, 0x8, RMTL)
        CreateDWordField(RBUF, 0x10, RFMA)
        CreateDWordField(RBUF, 0x14, RFML)
        CreateDWordField(RBUF, 0x1c, RFAA)
        CreateDWordField(RBUF, 0x20, RFAL)
        Store(RMTB, RMTA)
        Store(RMTX, RMTL)
        Store(RFMB, RFMA)
        Store(RFMS, RFML)
        Store(RFAB, RFAA)
        Store(RFAS, RFAL)
        Return(RBUF)
    }
    Method(_STA, 0x0, NotSerialized)
    {
        Return(0xb)
    }
}

Include("plat_rfs.asl")   // Platform specific data
