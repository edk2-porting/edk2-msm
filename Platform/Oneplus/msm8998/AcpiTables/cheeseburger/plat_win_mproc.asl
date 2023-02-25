Scope (\_SB.ADSP)
{
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        Return (0x0F)
    }
}

Scope (\_SB.AMSS)
{
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        Return (0x0F)
    }
    Method (SSRE, 0, NotSerialized)
    {
        Return (Package (0x01)
        {
            Zero
        })
    }

}

Scope (\_SB.SCSS)
{
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        Return (0x0)
    }
}
