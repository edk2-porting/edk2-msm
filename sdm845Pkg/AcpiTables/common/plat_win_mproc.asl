//
Scope(\_SB.PILC)
{
  Method (_SUB) {
	If(LOr(Lequal(_MID, 0x1),Lequal(\_SB_.SOID, 341))) {
	    return("MTPA0850")
		}
	Else{
	   return(\_SB.PSUB)
		}
	}
}

Scope(\_SB.AMSS)
{
  Method (_SUB) {
	If(LOr(Lequal(_MID, 0x1),Lequal(\_SB_.SOID, 341))) {
	    return("MTPA0850")
		}
	Else{
	   return(\_SB.PSUB)
		}
	}
}

//Disabling SCSS CDSP and ADSP as per Hanami testing requirement
Scope(\_SB.SCSS)
{
    Method(_STA, 0)
    {
       If(LOr(Lequal(_MID, 0x1),Lequal(\_SB_.SOID, 341))) {
		return (0x0)
		}
		return (0xf)
    }
}

Scope(\_SB.CDSP)
{
    Method(_STA, 0)
    {
       If(LOr(Lequal(_MID, 0x1),Lequal(\_SB_.SOID, 341))) {
		return (0x0)
		}
		return (0xf)
    }
}

Scope(\_SB.ADSP)
{
    Method(_STA, 0)
    {
       If(LOr(Lequal(_MID, 0x1),Lequal(\_SB_.SOID, 341))) {
		return (0x0)
		}
		return (0xf)
    }
}
