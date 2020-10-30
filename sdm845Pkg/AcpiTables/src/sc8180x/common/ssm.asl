
//
// SSM Driver
//
Device (SSM)
{
    Name (_DEP, Package(0x2)
    {
        \_SB_.GLNK,
        \_SB_.TREE
    })
   Name (_HID, "HID_SSM")
   Alias(\_SB.PSUB, _SUB)
   Method(_STA, 0)
    {
        return (0x0) //}  // Do not load driver. 
    }
}