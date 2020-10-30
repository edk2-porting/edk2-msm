//
// MPROC Drivers (PIL Driver and Subsystem Drivers)
//

// 
// RPE Subsystem Notifier (RPEN)  
//
Device (RPEN)
{
    Name (_HID, "HID_RPEN")
	Alias(\_SB.PSUB, _SUB)
} 

//
// Peripheral Image Loader (PIL) Driver
//
Device (PILC)
{
    Name (_HID, "HID_PILC")
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
    Name (_HID, "HID_CDI")
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

    Name (_HID, "HID_SCSS")
    Alias(\_SB.PSUB, _SUB)

    Method(_STA, 0)
    {
        Return (0xF)
    }

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
    Name (_DEP, Package(0x6)
     {
        \_SB_.PEP0,
        \_SB_.PILC,
        \_SB_.GLNK,
        \_SB_.IPC0,
        \_SB_.RPEN,
        \_SB_.SSDD,
    })
    Name (_HID, "HID_ADSP")
    Alias(\_SB.PSUB, _SUB)

    Method(_STA, 0)
    {
        Return (0xF)
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
   Name (_DEP, Package(0x5)
   {
       // \_SB_.PEP0,
       //\_SB_.PMIC,
        \_SB_.GLNK,
        \_SB_.PILC,
        \_SB_.RFS0,
        \_SB_.RPEN,
        \_SB_.SSDD,
    })
    Name (_HID, "HID_AMSS")

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

   Include("wcnss_wlan.asl")
}

//
// QMI Service manager
//
Device (QSM)
{
    Name (_HID, "HID_QSM")

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
            Memory32Fixed(ReadWrite, 0x9A500000, 0x00600000) 
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
    Name (_HID, "HID_SSDD")

	Alias(\_SB.PSUB, _SUB)

    Name (_DEP, Package(0x3)
    {
        \_SB_.GLNK,
        \_SB_.PDSR,
        \_SB_.TFTP
    })
}

//
// Modem Proc Thermal Mitigation Device
//
Device (MPTM)
{
    Name (_HID, "HID_MPTM")
    Alias(\_SB.PSUB, _SUB)

    Name (_DEP, Package(0x1)
    {
        \_SB_.AMSS
    })
}

//
// PDSR device
//
Device (PDSR)
{
     Name (_HID, "HID_PDSR")

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
    Name (_DEP, Package(0x6)
    {
        \_SB_.PEP0,
        \_SB_.PILC,
        \_SB_.GLNK,
        \_SB_.IPC0,
        \_SB_.RPEN,
        \_SB_.SSDD,
    })
    Name (_HID, "HID_CDSP")
    Alias(\_SB.PSUB, _SUB)

    Method(_STA, 0)
    {
        Return (0xF)
    }

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
// SPSS device : loads secure processor (SPU) image
//
Device (SPSS)
{
    Name (_DEP, Package(0x3)
    {
        \_SB_.PEP0,
        \_SB_.PILC,
        \_SB_.RPEN,
    })

    Name (_HID, "HID_SPSS")
    Alias(\_SB.PSUB, _SUB)

    Method(_STA, 0)
    {
        Return (0x0) // SPSS disabled for UFS/NVME for v1/v2
    }

    Method (_CRS, 0x0, NotSerialized) 
    {
        Name (RBUF, ResourceTemplate ()
        {
            // Inbound interrupt from SPSS dog bite - SP2SOC IRQ
            // See http://ipcatalog.qualcomm.com/irqs/chip/103/map/703
            // SYS_apcsQgicSPI[352] = 384
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {384}
            Memory32Fixed (ReadWrite, 0x1881028, 0x04)  // SP_CNOC_SP_SCSR_RMB_SP2SOC_IRQ_MASK
            Memory32Fixed (ReadWrite, 0x1881024, 0x04)  // SP_CNOC_SP_SCSR_RMB_SP2SOC_IRQ_CLR
            Memory32Fixed (ReadWrite, 0x188101C, 0x04)  // SP_CNOC_SP_SCSR_RMB_SP2SOC_IRQ_STATUS
            Memory32Fixed (ReadWrite, 0x188103C, 0x04)  // SP_CNOC_SP_SCSR_RMB_ERR_STATUS
            Memory32Fixed (ReadWrite, 0x188200C, 0x04)  // SP_CNOC_SP_SCSR_RMB_ERR_STATUS_SPARE0
        })
        Return (RBUF)
    }

}

//
// TFTP Device
//
Device (TFTP)
{
    Name (_HID, "HID_TFTP")

    Alias(\_SB.PSUB, _SUB)

    Name (_DEP, Package(0x1)
    {
        \_SB_.IPC0,
    })
}

// Warning:  Include these files after device scopes have been defined
//Include("cust_win_mproc.asl")   // Customer specific data
Include("plat_win_mproc.asl")   // Platform specific data
