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
        Return (Zero)
    }
}
