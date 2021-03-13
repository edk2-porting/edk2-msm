//
// Qualcomm Secure Procesor (QCSP) Driver
//
Device (QCSP)
{
      Name (_DEP, Package(0x1)
      {
         \_SB_.GLNK
      })
      Name (_HID, "QCOM0307")
	  Alias(\_SB.PSUB, _SUB)
}
