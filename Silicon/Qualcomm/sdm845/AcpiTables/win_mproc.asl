//
// MPROC Drivers (PIL Driver and Subsystem Drivers)
//

// 
// RPE Subsystem Notifier (RPEN) 
//
Device (RPEN)
{
    Name (_HID, "QCOM026D")
	Alias(\_SB.PSUB, _SUB)
} 

//
// Peripheral Image Loader (PIL) Driver
//
Device (PILC)
{
    Name (_HID, "QCOM023B")

    Method(PILX)
    {
        return (PILP)
    }

    Name(PILP,
        Package()
        {
            // Methods needed for PIL bootup proceedure
            // Drive will parse this list and call each 
            // method accordingly
            "OPCA",         // ACPO - ACPI Override for MBA load address
        }
    )

    Method (ACPO)
    {
        Name(PKGG, Package()
        {
            Package ()
            {
                // Represents MBA subsystem
                0x00000000, // Address
                0x00000000, // Length
                ToUUID ("BA58766D-ABF2-4402-88D7-90AB243F6C77")
            }
        })

        // Copy ACPI globals for Address for this subsystem into above package for use in driver
        Store (RMTB, Index(DeRefOf(Index (PKGG, 0)), 0))
        Store (RMTX, Index(DeRefOf(Index (PKGG, 0)), 1))
        
        Return (PKGG)
    }
}


// 
// RPE Crash Dump Injector (CDI) Driver
//
Device (CDI)
{
    Name (_DEP, Package(0x2)
    {
        \_SB_.PILC,
        \_SB_.RPEN
    })
    Name (_HID, "QCOM026C")
	Alias(\_SB.PSUB, _SUB)
    
    Method(_STA, 0)
    {
        return (0xf)
    }
}


//
// SCSS device : loads sensors subsystem (SCSS) image
//
Device (SCSS)
{
    Name (_DEP, Package(0x6)
    {
          \_SB_.PEP0,
          \_SB_.PILC,
          \_SB_.GLNK,
          \_SB_.IPC0,
          \_SB_.RPEN,
          \_SB_.SSDD,
    })

    Name (_HID, "QCOM02BE")
	Alias(\_SB.PSUB, _SUB)

    Method (_CRS, 0x0, NotSerialized) 
    {
        Name (RBUF, ResourceTemplate ()
        {
            // Inbound interrupt from SCSS dog bite
            // See http://ipcatalog.qualcomm.com/irqs/chip/53/map/438
            // q6ss_irq_out_apps_ipc[5 = SYS_apssQgicSPI[377] = 409
            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {409}
        })
        Return (RBUF)
    }

	
}

//
// ADSP Driver: load ADSP image
//
Device (ADSP)
{
    Name (_DEP, Package(0x7)
    {
          \_SB_.PEP0,
          \_SB_.PILC,
          \_SB_.GLNK,
          \_SB_.IPC0,
          \_SB_.RPEN,
          \_SB_.SSDD,
          \_SB_.PDSR,
    })
    Name (_HID, "QCOM023D")
    Alias(\_SB.PSUB, _SUB)
    //
    // WDIR - Watch Dog Interrupt Registers
    //
    Method (WDIR)
    {
		// See http://ipcatalog.qualcomm.com/swi/module/1280630
        Return( Package ()
        {
            0x02,           		// Interrupt number - 2nd bit in Seventh register
            0x17A0011C,       	// APSS_GICD_ISENABLERn  (n represents Seventh register), register used to enable WDOG bite interrupt. 0x17A00000 + 0x00000100 (0x17A00100) + 0x4 * (n), n=7
            0x17A0019C,       	// APSS_GICD_ICENABLERn  (n represents Seventh register), register used to disable WDOG bite interrupt.  0x17A00000 + 0x00000180 (0x17A00180) + 0x4 * (n), n=7
            0x17A0021C	    	// APSS_GICD_ISPENDRn  (n represents Seventh register), register used to clear pending WDOG bite interrupt. 0x17A00000 + 0x00000200 (0x17A00200) + 0x4 * (n), n=7
        })
    }

    Method (_CRS, 0x0, NotSerialized) 
    {
        Name (RBUF, ResourceTemplate ()
        {
            // Inbound interrupt from LPASS dog bite
            // See http://ipcatalog.qualcomm.com/irqs/chip/53/map/438
            // u_lpass_lpass_irq_out_apcs[6] = SYS_apcsQgicSPI[162] = 194
            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {194}
        })
        Return (RBUF)
    }



    Include("slimbus.asl") 
}


//
// AMSS Driver: Used for loading the modem binaries
//
Device (AMSS)
{
    Name(_CCA, 0)
    Name (_DEP, Package(0x9)
    {
        \_SB_.PEP0,
        //\_SB_.PMIC,
	    \_SB_.IPA,
        \_SB_.GLNK,
        \_SB_.IPC0,
        \_SB_.PILC,
        \_SB_.RFS0,
        \_SB_.RPEN,
        \_SB_.SSDD,
        \_SB_.PDSR,
    })
    Name (_HID, "QCOM023E")
    
    Name (WLEN, 0x1)				// Holds the enable/disable flag for WLAN
	
	Method(_STA, 0)
    {
        return (0xf)
    }

    Method (_CRS, 0x0, NotSerialized) 
    {
        Name (RBUF, ResourceTemplate ()
        {
            // Inbound interrupt from Q6SW dog bite: refer http://ipcatalog.qualcomm.com/irqs/chip/53/map/438
            // q6ss_wdog_exp_irq = SYS_apssQgicSPI[266] = 298
            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {298}
        })
        Return (RBUF)
    }

    //
    // WDIR - Watch Dog Interrupt Registers
    //
    Method (WDIR)
    {
        Return( Package ()
        {
            // See http://ipcatalog.qualcomm.com/swi/module/1280630
			0x00,           	// Interrupt number - 0th bit in Fifteenth register
            0x17A0013C,       	// APSS_GICD_ISENABLERn  (n represents Fifteenth register), register used to enable WDOG bite interrupt.
            0x17A001BC,       	// APSS_GICD_ICENABLERn  (n represents Fifteenth register), register used to disable WDOG bite interrupt.
            0x17A002BC	    	// APSS_GICD_ICPENDRn  (n represents Fifteenth register), register used to clear pending WDOG bite interrupt.
        })
    }
	
    Include("wcnss_wlan.asl")
}


// QMI Service manager
//
Device (QSM)
{
    Name (_HID, "QCOM02B9")
	
	Alias(\_SB.PSUB, _SUB)

    Name (_DEP, Package(0x4)
    {
        \_SB_.GLNK,
        \_SB_.IPC0,
        \_SB_.PILC,
        \_SB_.RPEN
    })

    //
    // DHMS client memory config
    //
    Method (_CRS, 0x0, NotSerialized) {
        Name (RBUF, ResourceTemplate ()
        {
            // UEFI memory bank for DHMS clients
            // Note: must match order of flagged for carveout packages below. See http://ipcatalog.qualcomm.com/memmap/chip/53/map/353#block=755839
            Memory32Fixed(ReadWrite, 0x98f00000, 0x00600000) 
        })
        Return (RBUF)
    }

    Method(_STA, 0)
    {
        return (0xf)
    } 
   
}

//
// Subsys Dependency Device
//    Subsys devices that use QCCI should have an dependency on this
//
Device (SSDD)
{
    Name (_HID, "QCOM02D1")
	
	Alias(\_SB.PSUB, _SUB)

    Name (_DEP, Package(0x2)
    {
        \_SB_.GLNK,
        \_SB_.TFTP
    })
}


//
// PDSR device
//
Device (PDSR)
{
     Name (_HID, "QCOM02CE")
	 
	 Alias(\_SB.PSUB, _SUB)

     Name (_DEP, Package(0x3)
     {
           \_SB_.PEP0,
           \_SB_.GLNK,
           \_SB_.IPC0,
     })
}


//
// CDSP Driver: load CDSP image
//
Device (CDSP)
{
    Name (_DEP, Package(0x7)
    {
          \_SB_.PEP0,
          \_SB_.PILC,
          \_SB_.GLNK,
          \_SB_.IPC0,
          \_SB_.RPEN,
          \_SB_.SSDD,
          \_SB_.PDSR,
    })
    Name (_HID, "QCOM02F7")
    Alias(\_SB.PSUB, _SUB)

    Method (_CRS, 0x0, NotSerialized) 
    {
        Name (RBUF, ResourceTemplate ()
        {
            // TURING QDSP6 WDOG Bite to APCS
            // See http://ipcatalog.qualcomm.com/irqs/chip/53/map/480
            // q6ss_wdog_exp_irq = SYS_apssQgicSPI[578] = 610
            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {610}
        })
        Return (RBUF)
    }
}


//
// TFTP Device
//
Device (TFTP)
{
     Name (_HID, "QCOM02F6")
	 
	 Alias(\_SB.PSUB, _SUB)

     Name (_DEP, Package(0x1)
     {
           \_SB_.IPC0,
     })
}

// QcShutdownSvc Device
Device (SSVC)
{
     Name (_DEP, Package(0x2)
    {
        \_SB_.IPC0, // IPC Router used by QMI, in turn depends on GLINK
        \_SB_.QDIG  // Qualcomm DIAG service        
    })
    Name (_HID, "QCOM0302")
    Alias(\_SB.PSUB, _SUB)
    Name (_CID, "ACPI\QCOM0302")
    Name (_UID, 0)
}

// Warning:  Include these files after device scopes have been defined
//Include("cust_win_mproc.asl")   // Customer specific data
Include("plat_win_mproc.asl")   // Platform specific data
