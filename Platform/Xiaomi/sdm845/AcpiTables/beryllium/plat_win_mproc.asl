Scope(\_SB.PILC)
{
  	Method (_SUB) {
	   return(\_SB.PSUB)
	}
}

Scope(\_SB.AMSS)
{
  	Method (_SUB) {
	   return(\_SB.PSUB)
	}
}

//Disabling SCSS
Scope(\_SB.SCSS)
{
    Method(_STA, 0)
    {
       Return (Zero)
    }
}

Scope(\_SB.CDSP)
{
    Method(_STA, 0)
    {
       Return (0x0F)
    }
}

Scope(\_SB.ADSP)
{
    Method(_STA, 0)
    {
       Return (0x0F)
    }
}
