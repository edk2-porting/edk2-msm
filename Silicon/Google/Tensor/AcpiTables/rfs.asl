//
// RemoteFS
// 
Device (RFS0)
{
    Name (_DEP, Package(0x2)
    {
      \_SB_.IPC0,
	  \_SB_.UFS0
    })

    Name (_HID, "QCOM0235")
	Alias(\_SB.PSUB, _SUB)

    Method (_CRS, 0x0, NotSerialized) {
          Name (RBUF, ResourceTemplate ()
          {
             // RemoteFS Shared Memory
             Memory32Fixed (ReadWrite, 0x88888888, 0x99999999, RMTS)

             // RFSA MPSS Shared Memory
             Memory32Fixed (ReadWrite, 0x11111111, 0x22222222, RFSM)

             // RFSA ADSP Shared Memory
             Memory32Fixed (ReadWrite, 0x33333333, 0x44444444, RFSA)
           })

           CreateDWordField (RBUF, RMTS._BAS, RMTA)
           CreateDWordField (RBUF, RMTS._LEN, RMTL)
           CreateDWordField (RBUF, RFSM._BAS, RFMA)
           CreateDWordField (RBUF, RFSM._LEN, RFML)
           CreateDWordField (RBUF, RFSA._BAS, RFAA)
           CreateDWordField (RBUF, RFSA._LEN, RFAL)

           Store(\_SB_.RMTB, RMTA)
           Store(\_SB_.RMTX, RMTL)
           Store(\_SB_.RFMB, RFMA)
           Store(\_SB_.RFMS, RFML)
           Store(\_SB_.RFAB, RFAA)
           Store(\_SB_.RFAS, RFAL)

           Return (RBUF)
    }

    Method (_STA) 
    {
        Return(0xF)
    }
}
