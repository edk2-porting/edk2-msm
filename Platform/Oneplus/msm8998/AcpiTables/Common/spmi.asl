//
//SPMI driver.
//
Device (SPMI)
{
    Name (_HID, "QCOM0015")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, One)  // _UID: Unique ID
    Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x08000000,         // Address Base
                0x02800000,         // Address Length
                )
        })
        Return (RBUF) /* \_SB_.SPMI._CRS.RBUF */
    }

    Method (CONF, 0, NotSerialized)
    {
        Name (XBUF, Buffer (0x1A)
        {
            /* 0000 */  0x00, 0x01, 0x01, 0x01, 0xFF, 0x00, 0x02, 0x00,  // ........
            /* 0008 */  0x07, 0x06, 0x04, 0x07, 0x01, 0xFF, 0x10, 0x01,  // ........
            /* 0010 */  0x00, 0x01, 0x08, 0x00, 0x00, 0x00, 0x02, 0x80,  // ........
            /* 0018 */  0x00, 0x00                                       // ..
        })
        Return (XBUF) /* \_SB_.SPMI.CONF.XBUF */
    }
}
