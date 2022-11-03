// UFS Controller
Device (UFS0)
  {
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
      If ((STOR == One))
      {
        Return (0x0F)
      }
      Else
      {
        Return (Zero)
      }
    }
    Name (_DEP, Package (0x01)  // _DEP: Dependencies
    {
      \_SB.PEP0
    })
    Name (_HID, "QCOM24A5")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, Zero)  // _UID: Unique ID
    Name (_CCA, One)  // _CCA: Cache Coherency Attribute
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
      {
        Name (RBUF, ResourceTemplate ()
        {
          Memory32Fixed (ReadWrite,
            0x01D84000,         // Address Base
            0x00014000,         // Address Length
            )
          Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
          {
            0x00000129,
          }
        })
        Return (RBUF) /* \_SB_.UFS0._CRS.RBUF */
      }

      Device (DEV0)
      {
        Method (_ADR, 0, NotSerialized)  // _ADR: Address
        {
          Return (0x08)
        }

        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
        {
          eturn (Zero)
        }
      }
  }
  
  Device (UFS1)
  {
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
      If ((STOR == One))
      {
        Return (0x0F)
      }
      Else
      {
        Return (Zero)
      }
    }
    Name (_DEP, Package (0x01)  // _DEP: Dependencies
    {
      \_SB.PEP0
    })
    Name (_HID, "QCOM24A5")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, One)  // _UID: Unique ID
    Name (_CCA, One)  // _CCA: Cache Coherency Attribute
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
      {
        Name (RBUF, ResourceTemplate ()
        {
          Memory32Fixed (ReadWrite,
            0x01D64000,         // Address Base
            0x00014000,         // Address Length
            )
          Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
          {
            0x000002A9,
          }
        })
        Return (RBUF) /* \_SB_.UFS0._CRS.RBUF */
      }

      Device (DEV0)
      {
        Method (_ADR, 0, NotSerialized)  // _ADR: Address
        {
          Return (0x08)
        }

        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
        {
          eturn (Zero)
        }
      }
  }
