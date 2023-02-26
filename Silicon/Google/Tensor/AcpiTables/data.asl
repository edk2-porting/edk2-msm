//
// data.asl: This file contains the Data Drivers
// ACPI device definitions, configuration and look-up tables.
// 

//
// RevRmNet Driver
//
 Device (RVRM)
 {
	Name (_HID, "QCOM02A5")
  Method (_STA) 
	{
        Return (0xF)
  } 
 }

 //
// Databus Driver
//
Device (DBUS)
{
	Name (_HID, "QCOM02F0")
	Alias(\_SB.PSUB, _SUB)
	Method (CHLD)
	{
		Return (Package()
		{           
			// This package has following params
			// 1. HWID of the child
			// 2. Databus Device Type (0 - Link Local)
			// 3. Max instances supported for the child
			// 4. Number of child devices that should be Statically Enumerated.
			Package() {"DBUS\\QCOM02AA", 0, 9, 1}
		})
	}
  Method (_STA) 
	{
        Return (0xF)
  } 
}

//
// linklocal
//
// Device (LNK0)
// {
//	Name (_HID, "QCOM02AA")
//	Name (_UID, 0)
//}

// Device (LNK1)
//{
//	Name (_HID, "QCOM02AA")
//	Name (_UID, 1)
// }
// Device (LNK2)
// {
//	Name (_HID, "QCOM02AA")
//	Name (_UID, 2)
// }
// Device (LNK3)
// {
//	Name (_HID, "QCOM02AA")
//	Name (_UID, 3)
// }
// Device (LNK4)
// {
//	Name (_HID, "QCOM02AA")
//	Name (_UID, 4)
// }
// Device (LNK5)
// {
//	Name (_HID, "QCOM02AA")
//	Name (_UID, 5)
// }
// Device (LNK6)
// {
//	Name (_HID, "QCOM02AA")
//	Name (_UID, 6)
// }
// Device (LNK7)
// {
//	Name (_HID, "QCOM02AA")
//	Name (_UID, 7)
// }
// Device (LNK8)
// {
//	Name (_HID, "QCOM02AA")
//	Name (_UID, 8)
// }

//  
// Modembridge Driver
//
   Device (MBRG)
   {
     Name (_HID, "QCOM020D")
   }

//
// Remote AT Command Processor Driver
//
   Device (RMAT)
   {
     Name (_HID, "QCOM0210")
   }

//
// rmnetbridge
//
   Device (RMNT)
   {
     Name (_HID, "QCOM020E")			
   }

//
// dplbridge
//
   Device (DPLB)
   {
     Name (_HID, "QCOM02C2")
   }
