
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
      Name (_HID, "HID_fastRPC_driver_to_make_RPC_from_apps_to_ADSP")
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
  Name (_HID, "HID_ARPD")
  Alias(\_SB.PSUB, _SUB)
}

