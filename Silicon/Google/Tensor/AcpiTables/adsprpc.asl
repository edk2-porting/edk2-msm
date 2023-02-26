//
// ADSP RPC Driver
//
Device (ARPC)
{
      Name (_DEP, Package(0x3)
      {
	     \_SB_.MMU0,
           \_SB_.GLNK,
	     \_SB_.SCM0
      })
      Name (_HID, "QCOM0297")
	Alias(\_SB.PSUB, _SUB)
}
// ARPD AUDIO Daemon Driver
Device (ARPD)
{
    Name (_DEP, Package(0x2)
     {
     	\_SB_.ADSP,
           \_SB_.ARPC
     })
    Name (_HID, "QCOM02F3")
    Alias(\_SB.PSUB, _SUB)
}
