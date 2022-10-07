//
// The Driver for Dynamically Changing Thresholds
// of Thermal Zones
//

Method(THTZ, 0x4, NotSerialized)
{

 // Switch based on thermal zone number 
 Switch(toInteger(Arg0)) 
 {
    Case(1) 
	{
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ1.TPSV)
					Notify(\_SB.TZ1, 0x81)
				}
				Return(\_SB.TZ1._PSV)
			}				
			
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ1.TTSP)
					Notify(\_SB.TZ1, 0x81)
				}
				Return(\_SB.TZ1._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ1.TTC1)
					Notify(\_SB.TZ1, 0x81)
				}
				Return(\_SB.TZ1._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ1.TTC2)
					Notify(\_SB.TZ1, 0x81)
				}
				Return(\_SB.TZ1._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
	}

    Case(3) 
	{
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ3.TPSV)
					Notify(\_SB.TZ3, 0x81)
				}
				Return(\_SB.TZ3._PSV)
			}				
			
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ3.TTSP)
					Notify(\_SB.TZ3, 0x81)
				}
				Return(\_SB.TZ3._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ3.TTC1)
					Notify(\_SB.TZ3, 0x81)
				}
				Return(\_SB.TZ3._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ3.TTC2)
					Notify(\_SB.TZ3, 0x81)
				}
				Return(\_SB.TZ3._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }

    Case(20) 
	{
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ20.TPSV)
					Notify(\_SB.TZ20, 0x81)
				}
				Return(\_SB.TZ20._PSV)
			}				
			
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ20.TTSP)
					Notify(\_SB.TZ20, 0x81)
				}
				Return(\_SB.TZ20._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ20.TTC1)
					Notify(\_SB.TZ20, 0x81)
				}
				Return(\_SB.TZ20._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ20.TTC2)
					Notify(\_SB.TZ20, 0x81)
				}
				Return(\_SB.TZ20._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }

    Case(21) 
	{
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ21.TPSV)
					Notify(\_SB.TZ21, 0x81)
				}
				Return(\_SB.TZ21._PSV)
			}				
			
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ21.TTSP)
					Notify(\_SB.TZ21, 0x81)
				}
				Return(\_SB.TZ21._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ21.TTC1)
					Notify(\_SB.TZ21, 0x81)
				}
				Return(\_SB.TZ21._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ21.TTC2)
					Notify(\_SB.TZ21, 0x81)
				}
				Return(\_SB.TZ21._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }

    Case(33) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ33.TPSV)
					Notify(\_SB.TZ33, 0x81)
				}
				Return(\_SB.TZ33._PSV)
			}				
			
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ33.TTSP)
					Notify(\_SB.TZ33, 0x81)
				}
				Return(\_SB.TZ33._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ33.TTC1)
					Notify(\_SB.TZ33, 0x81)
				}
				Return(\_SB.TZ33._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ33.TTC2)
					Notify(\_SB.TZ33, 0x81)
				}
				Return(\_SB.TZ33._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }	    

    Case(36) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ36.TPSV)
					Notify(\_SB.TZ36, 0x81)
				}
				Return(\_SB.TZ36._PSV)
			}				
			
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ36.TTSP)
					Notify(\_SB.TZ36, 0x81)
				}
				Return(\_SB.TZ36._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ36.TTC1)
					Notify(\_SB.TZ36, 0x81)
				}
				Return(\_SB.TZ36._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ36.TTC2)
					Notify(\_SB.TZ36, 0x81)
				}
				Return(\_SB.TZ36._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }

    Case(37) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ37.TPSV)
					Notify(\_SB.TZ37, 0x81)
				}
				Return(\_SB.TZ37._PSV)
			}
			
			Case(1) 
			{
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ37.TCRT)
					Notify(\_SB.TZ37, 0x81)
				}
				Return(\_SB.TZ37._CRT)
			}
			
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ37.TTSP)
					Notify(\_SB.TZ37, 0x81)
				}
				Return(\_SB.TZ37._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ37.TTC1)
					Notify(\_SB.TZ37, 0x81)
				}
				Return(\_SB.TZ37._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ37.TTC2)
					Notify(\_SB.TZ37, 0x81)
				}
				Return(\_SB.TZ37._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }
	
	Case(38) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ38.TPSV)
					Notify(\_SB.TZ38, 0x81)
				}
				Return(\_SB.TZ38._PSV)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }

    Case(40) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ40.TPSV)
					Notify(\_SB.TZ40, 0x81)
				}
				Return(\_SB.TZ40._PSV)
			}				
			
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ40.TTSP)
					Notify(\_SB.TZ40, 0x81)
				}
				Return(\_SB.TZ40._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ40.TTC1)
					Notify(\_SB.TZ40, 0x81)
				}
				Return(\_SB.TZ40._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ40.TTC2)
					Notify(\_SB.TZ40, 0x81)
				}
				Return(\_SB.TZ40._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }
	
	Case(44) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ44.TPSV)
					Notify(\_SB.TZ44, 0x81)
				}
				Return(\_SB.TZ44._PSV)
			}				
			
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ44.TTSP)
					Notify(\_SB.TZ44, 0x81)
				}
				Return(\_SB.TZ44._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ44.TTC1)
					Notify(\_SB.TZ44, 0x81)
				}
				Return(\_SB.TZ44._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ44.TTC2)
					Notify(\_SB.TZ44, 0x81)
				}
				Return(\_SB.TZ44._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }
	
	Case(98) 
	{
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ98.TPSV)
					Notify(\_SB.TZ98, 0x81)
				}
				Return(\_SB.TZ98._PSV)
			}
			
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ98.TTSP)
					Notify(\_SB.TZ98, 0x81)
				}
				Return(\_SB.TZ98._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ98.TTC1)
					Notify(\_SB.TZ98, 0x81)
				}
				Return(\_SB.TZ98._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ98.TTC2)
					Notify(\_SB.TZ98, 0x81)
				}
				Return(\_SB.TZ98._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }

    Case(99) 
	{
		Switch(toInteger(Arg3))
		{				
            Case(1) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ99.TCRT)
					Notify(\_SB.TZ99, 0x81)
				}
				Return(\_SB.TZ99._CRT)
			}								
			
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ99.TTSP)
					Notify(\_SB.TZ99, 0x81)
				}
				Return(\_SB.TZ99._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ99.TTC1)
					Notify(\_SB.TZ99, 0x81)
				}
				Return(\_SB.TZ99._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ99.TTC2)
					Notify(\_SB.TZ99, 0x81)
				}
				Return(\_SB.TZ99._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }

    Default {
	    Return(0xFFFF)
    }
	}
}
