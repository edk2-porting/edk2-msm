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

    Case(5) 
	{
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ5.TPSV)
					Notify(\_SB.TZ5, 0x81)
				}
				Return(\_SB.TZ5._PSV)
			}				
			
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ5.TTSP)
					Notify(\_SB.TZ5, 0x81)
				}
				Return(\_SB.TZ5._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ5.TTC1)
					Notify(\_SB.TZ5, 0x81)
				}
				Return(\_SB.TZ5._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ5.TTC2)
					Notify(\_SB.TZ5, 0x81)
				}
				Return(\_SB.TZ5._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }

    Case(7) 
	{
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ7.TPSV)
					Notify(\_SB.TZ7, 0x81)
				}
				Return(\_SB.TZ7._PSV)
			}				
			
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ7.TTSP)
					Notify(\_SB.TZ7, 0x81)
				}
				Return(\_SB.TZ7._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ7.TTC1)
					Notify(\_SB.TZ7, 0x81)
				}
				Return(\_SB.TZ7._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ7.TTC2)
					Notify(\_SB.TZ7, 0x81)
				}
				Return(\_SB.TZ7._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }

    Case(9) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ9.TPSV)
					Notify(\_SB.TZ9, 0x81)
				}
				Return(\_SB.TZ9._PSV)
			}				
			
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ9.TTSP)
					Notify(\_SB.TZ9, 0x81)
				}
				Return(\_SB.TZ9._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ9.TTC1)
					Notify(\_SB.TZ9, 0x81)
				}
				Return(\_SB.TZ9._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ9.TTC2)
					Notify(\_SB.TZ9, 0x81)
				}
				Return(\_SB.TZ9._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }	    

    Case(15) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ15.TPSV)
					Notify(\_SB.TZ15, 0x81)
				}
				Return(\_SB.TZ15._PSV)
			}
				
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ15.TTSP)
					Notify(\_SB.TZ15, 0x81)
				}
				Return(\_SB.TZ15._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ15.TTC1)
					Notify(\_SB.TZ15, 0x81)
				}
				Return(\_SB.TZ15._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ15.TTC2)
					Notify(\_SB.TZ15, 0x81)
				}
				Return(\_SB.TZ15._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }

    Case(16) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ16.TPSV)
					Notify(\_SB.TZ16, 0x81)
				}
				Return(\_SB.TZ16._PSV)
			}
			
			Case(1) 
			{
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ16.TCRT)
					Notify(\_SB.TZ16, 0x81)
				}
				Return(\_SB.TZ16._CRT)
			}	
			
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ16.TTSP)
					Notify(\_SB.TZ16, 0x81)
				}
				Return(\_SB.TZ16._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ16.TTC1)
					Notify(\_SB.TZ16, 0x81)
				}
				Return(\_SB.TZ16._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ16.TTC2)
					Notify(\_SB.TZ16, 0x81)
				}
				Return(\_SB.TZ16._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }
	
    Case(17) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ17.TPSV)
					Notify(\_SB.TZ17, 0x81)
				}
				Return(\_SB.TZ17._PSV)
			}				
			
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ17.TTSP)
					Notify(\_SB.TZ17, 0x81)
				}
				Return(\_SB.TZ17._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ17.TTC1)
					Notify(\_SB.TZ17, 0x81)
				}
				Return(\_SB.TZ17._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ17.TTC2)
					Notify(\_SB.TZ17, 0x81)
				}
				Return(\_SB.TZ17._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }

    Case(18) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ18.TPSV)
					Notify(\_SB.TZ18, 0x81)
				}
				Return(\_SB.TZ18._PSV)
			}
						
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ18.TTSP)
					Notify(\_SB.TZ18, 0x81)
				}
				Return(\_SB.TZ18._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ18.TTC1)
					Notify(\_SB.TZ18, 0x81)
				}
				Return(\_SB.TZ18._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ18.TTC2)
					Notify(\_SB.TZ18, 0x81)
				}
				Return(\_SB.TZ18._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }

	Case(19) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ19.TPSV)
					Notify(\_SB.TZ19, 0x81)
				}
				Return(\_SB.TZ19._PSV)
			}
			
			Case(1) 
			{
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ19.TCRT)
					Notify(\_SB.TZ19, 0x81)
				}
				Return(\_SB.TZ19._CRT)
			}	
			
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ19.TTSP)
					Notify(\_SB.TZ19, 0x81)
				}
				Return(\_SB.TZ19._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ19.TTC1)
					Notify(\_SB.TZ19, 0x81)
				}
				Return(\_SB.TZ19._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ19.TTC2)
					Notify(\_SB.TZ19, 0x81)
				}
				Return(\_SB.TZ19._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }

    Case(20) {
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
	
	Case(21) {
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
			
			Case(1) 
			{
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ21.TCRT)
					Notify(\_SB.TZ21, 0x81)
				}
				Return(\_SB.TZ21._CRT)
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
	
	Case(22) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ22.TPSV)
					Notify(\_SB.TZ22, 0x81)
				}
				Return(\_SB.TZ22._PSV)
			}				
			
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ22.TTSP)
					Notify(\_SB.TZ22, 0x81)
				}
				Return(\_SB.TZ22._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ22.TTC1)
					Notify(\_SB.TZ22, 0x81)
				}
				Return(\_SB.TZ22._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ22.TTC2)
					Notify(\_SB.TZ22, 0x81)
				}
				Return(\_SB.TZ22._TC2)
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
			
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ38.TTSP)
					Notify(\_SB.TZ38, 0x81)
				}
				Return(\_SB.TZ38._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ38.TTC1)
					Notify(\_SB.TZ38, 0x81)
				}
				Return(\_SB.TZ38._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ38.TTC2)
					Notify(\_SB.TZ38, 0x81)
				}
				Return(\_SB.TZ38._TC2)
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

    Case(41) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ41.TPSV)
					Notify(\_SB.TZ41, 0x81)
				}
				Return(\_SB.TZ41._PSV)
			}
				
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ41.TTSP)
					Notify(\_SB.TZ41, 0x81)
				}
				Return(\_SB.TZ41._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ41.TTC1)
					Notify(\_SB.TZ41, 0x81)
				}
				Return(\_SB.TZ41._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ41.TTC2)
					Notify(\_SB.TZ41, 0x81)
				}
				Return(\_SB.TZ41._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }
	
	Case(51) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ51.TPSV)
					Notify(\_SB.TZ51, 0x81)
				}
				Return(\_SB.TZ51._PSV)
			}
				
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ51.TTSP)
					Notify(\_SB.TZ51, 0x81)
				}
				Return(\_SB.TZ51._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ51.TTC1)
					Notify(\_SB.TZ51, 0x81)
				}
				Return(\_SB.TZ51._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ51.TTC2)
					Notify(\_SB.TZ51, 0x81)
				}
				Return(\_SB.TZ51._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }
	
	Case(52) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ52.TPSV)
					Notify(\_SB.TZ52, 0x81)
				}
				Return(\_SB.TZ52._PSV)
			}
				
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ52.TTSP)
					Notify(\_SB.TZ52, 0x81)
				}
				Return(\_SB.TZ52._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ52.TTC1)
					Notify(\_SB.TZ52, 0x81)
				}
				Return(\_SB.TZ52._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ52.TTC2)
					Notify(\_SB.TZ52, 0x81)
				}
				Return(\_SB.TZ52._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }	
	
	Case(53) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ53.TPSV)
					Notify(\_SB.TZ53, 0x81)
				}
				Return(\_SB.TZ53._PSV)
			}
				
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ53.TTSP)
					Notify(\_SB.TZ53, 0x81)
				}
				Return(\_SB.TZ53._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ53.TTC1)
					Notify(\_SB.TZ53, 0x81)
				}
				Return(\_SB.TZ53._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ53.TTC2)
					Notify(\_SB.TZ53, 0x81)
				}
				Return(\_SB.TZ53._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }
	
	Case(54) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ54.TPSV)
					Notify(\_SB.TZ54, 0x81)
				}
				Return(\_SB.TZ54._PSV)
			}
				
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ54.TTSP)
					Notify(\_SB.TZ54, 0x81)
				}
				Return(\_SB.TZ54._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ54.TTC1)
					Notify(\_SB.TZ54, 0x81)
				}
				Return(\_SB.TZ54._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ54.TTC2)
					Notify(\_SB.TZ54, 0x81)
				}
				Return(\_SB.TZ54._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }		

	Case(55) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ55.TPSV)
					Notify(\_SB.TZ55, 0x81)
				}
				Return(\_SB.TZ55._PSV)
			}
				
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ55.TTSP)
					Notify(\_SB.TZ55, 0x81)
				}
				Return(\_SB.TZ55._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ55.TTC1)
					Notify(\_SB.TZ55, 0x81)
				}
				Return(\_SB.TZ55._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ55.TTC2)
					Notify(\_SB.TZ55, 0x81)
				}
				Return(\_SB.TZ55._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }
	
	Case(56) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ56.TPSV)
					Notify(\_SB.TZ56, 0x81)
				}
				Return(\_SB.TZ56._PSV)
			}
				
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ56.TTSP)
					Notify(\_SB.TZ56, 0x81)
				}
				Return(\_SB.TZ56._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ56.TTC1)
					Notify(\_SB.TZ56, 0x81)
				}
				Return(\_SB.TZ56._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ56.TTC2)
					Notify(\_SB.TZ56, 0x81)
				}
				Return(\_SB.TZ56._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }	
	
	Case(57) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ57.TPSV)
					Notify(\_SB.TZ57, 0x81)
				}
				Return(\_SB.TZ57._PSV)
			}
				
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ57.TTSP)
					Notify(\_SB.TZ57, 0x81)
				}
				Return(\_SB.TZ57._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ57.TTC1)
					Notify(\_SB.TZ57, 0x81)
				}
				Return(\_SB.TZ57._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ57.TTC2)
					Notify(\_SB.TZ57, 0x81)
				}
				Return(\_SB.TZ57._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }
	
	Case(58) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ58.TPSV)
					Notify(\_SB.TZ58, 0x81)
				}
				Return(\_SB.TZ58._PSV)
			}
				
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ58.TTSP)
					Notify(\_SB.TZ58, 0x81)
				}
				Return(\_SB.TZ58._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ58.TTC1)
					Notify(\_SB.TZ58, 0x81)
				}
				Return(\_SB.TZ58._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ58.TTC2)
					Notify(\_SB.TZ58, 0x81)
				}
				Return(\_SB.TZ58._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }	
	
	Case(59) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ59.TPSV)
					Notify(\_SB.TZ59, 0x81)
				}
				Return(\_SB.TZ59._PSV)
			}
				
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ59.TTSP)
					Notify(\_SB.TZ59, 0x81)
				}
				Return(\_SB.TZ59._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ59.TTC1)
					Notify(\_SB.TZ59, 0x81)
				}
				Return(\_SB.TZ59._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ59.TTC2)
					Notify(\_SB.TZ59, 0x81)
				}
				Return(\_SB.TZ59._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }
	
	Case(60) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ60.TPSV)
					Notify(\_SB.TZ60, 0x81)
				}
				Return(\_SB.TZ60._PSV)
			}
				
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ60.TTSP)
					Notify(\_SB.TZ60, 0x81)
				}
				Return(\_SB.TZ60._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ60.TTC1)
					Notify(\_SB.TZ60, 0x81)
				}
				Return(\_SB.TZ60._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ60.TTC2)
					Notify(\_SB.TZ60, 0x81)
				}
				Return(\_SB.TZ60._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }	
	
	Case(61) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ61.TPSV)
					Notify(\_SB.TZ61, 0x81)
				}
				Return(\_SB.TZ61._PSV)
			}
				
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ61.TTSP)
					Notify(\_SB.TZ61, 0x81)
				}
				Return(\_SB.TZ61._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ61.TTC1)
					Notify(\_SB.TZ61, 0x81)
				}
				Return(\_SB.TZ61._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ61.TTC2)
					Notify(\_SB.TZ61, 0x81)
				}
				Return(\_SB.TZ61._TC2)
			}
			
			Default 
			{
	            Return(0xFFFF)
            }
		}
    }
	
	Case(62) {
		Switch(toInteger(Arg3))
		{
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ62.TPSV)
					Notify(\_SB.TZ62, 0x81)
				}
				Return(\_SB.TZ62._PSV)
			}
				
			Case(2) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ62.TTSP)
					Notify(\_SB.TZ62, 0x81)
				}
				Return(\_SB.TZ62._TSP)
			}
			
			Case(3) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ62.TTC1)
					Notify(\_SB.TZ62, 0x81)
				}
				Return(\_SB.TZ62._TC1)
			}
			
			Case(4) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ62.TTC2)
					Notify(\_SB.TZ62, 0x81)
				}
				Return(\_SB.TZ62._TC2)
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
			Case(0) {
				If(Arg2) 
				{
					Store(Arg1, \_SB.TZ99.TPSV)
					Notify(\_SB.TZ99, 0x81)
				}
				Return(\_SB.TZ99._PSV)
			}				
			
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

