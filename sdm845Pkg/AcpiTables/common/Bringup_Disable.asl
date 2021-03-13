/*
	adsprpc.asl components
 */

// Disabling ADSP RPC

Scope(\_SB.ARPC)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

/*
	audio.asl components
 */

// Disabling ACSP

Scope(\_SB.ACSP)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

/*
	audio_bus.asl components
 */

// Disabling ADCM

Scope(\_SB.ADCM)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// AUDD, QCRT, MBHC iare children of ADCM so we do not appear to need to make _STA for them

/*
	cust_buttons.asl components
 */

// Disabling Buttons

Scope(\_SB.BTNS)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}




/*
	cust_camera.asl components
 */

// Disabling Camera

Scope(\_SB.CAMP)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

/*
	cust_hwn.asl components
 */

// Disabling HWN Haptics

Scope(\_SB.HWN1)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling HWN LED
Scope(\_SB.HWN0)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

/*
	cust_sensors.asl components
 */

// Disabling Sensor Collection

Scope(\_SB.SEN1)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

/*
	cust_touch.asl components
 */

// Disabling Touch

Scope(\_SB.TSC1)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// CAMS, CAMF, VFE0, JPGE are children CAMP so disabling CAMP is enough

/* 
	corebsp_mproc.asl components
*/


/*
	data.asl components
 */

// Disabling All data Links

Scope(\_SB.RVRM)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

Scope(\_SB.LNK0)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

Scope(\_SB.LNK1)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

Scope(\_SB.LNK2)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

Scope(\_SB.LNK3)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

Scope(\_SB.LNK4)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

Scope(\_SB.LNK5)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

Scope(\_SB.LNK6)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

Scope(\_SB.LNK7)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

Scope(\_SB.LNK8)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling Composite Links

Scope(\_SB.MBRG)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

Scope(\_SB.RMNT)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

Scope(\_SB.RMAT)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

Scope(\_SB.DPLB)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

/* 
	dsdt.asl components
*/

// Disabling Qualcomm Diag Consumer Interface

Scope(\_SB.QDC1)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

/* 
	dsdt_common.asl components
*/

// Disabling IPA

Scope(\_SB.IPA)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling DIAG

Scope(\_SB.QDIG)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling BCrypt Cipher

Scope(\_SB.QBCC)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling GPS

Scope(\_SB.GPS)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}


/* 
	Mmi.asl components
*/

// Disabling MMI
Scope(\_SB.QMMI)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

/* 
	pcie.asl, pcie2.asl, pcie1.asl components
*/

// Disabling PCIE and root port
Scope(\_SB.PCI0)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

Scope(\_SB.RP1)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Check if you need to disable ENDP

/* 
	qcdb.asl components
*/

// Disabling Qc Diag Bridge
Scope(\_SB.QCDB)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

/* 
	qdss.asl components
*/

// Disabling QDSS
Scope(\_SB.QDSS)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

/* 
	rfs.asl components
*/

// Disabling Remote FS
Scope(\_SB.RFS0)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling Remote FS
Scope(\_SB.SDC2)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}
/* 
	slimbus.asl components
*/

// Disabling Slimbus
Scope(\_SB.SLM1)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

Scope(\_SB.SLM2)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

/* 
	ssm.asl components
*/

// Disabling SSM
Scope(\_SB.SSM)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

/* 
	usb.asl components
*/

// Disabling USB Role Switch

Scope(\_SB.URS0)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling USB FN

Scope(\_SB.UFN0)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling USB 1. USB2 doesn' exist

Scope(\_SB.USB1)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

/* 
	wcnss_wlan.asl, wcnss_bt.asl, wcnss_coex.asl and wcnss_fm.asl components
*/

// Disabling Bluetooth

Scope(\_SB.BTH0)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling FM
Scope(\_SB.FMSL)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling LTE Coexistence 
Scope(\_SB.COEX)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling WLAN Endpoint 
Scope(\_SB.ENDP)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}


/* 
	win_mproc.asl components
*/

// Disabling AMSS

Scope(\_SB.AMSS)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling RPEN

Scope(\_SB.RPEN)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling CDI

Scope(\_SB.CDI)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling Sensors

Scope(\_SB.SCSS)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling ADSP

Scope(\_SB.ADSP)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling QMI Service Manager

Scope(\_SB.QSM)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling Subsys Dependency Device

Scope(\_SB.SSDD)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling PDSR

Scope(\_SB.PDSR)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling PMIC
Scope(\_SB.PMIC)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling PMIC GPIO
Scope(\_SB.PM01)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling PMIC GPIO
Scope(\_SB.PM02)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling PMIC GPIO
Scope(\_SB.PM03)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling PMIC battery manager
Scope(\_SB.PMBT)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling PMIC battery miniclass
Scope(\_SB.PMBM)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling PMIC battery miniclass second device
Scope(\_SB.PBTD)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling PMIC apps
Scope(\_SB.PMAP)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling PMIC rtc interface
Scope(\_SB.PRTC)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling PMIC fgbcl
Scope(\_SB.BCL1)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}

// Disabling PMIC Type-C Controler
Scope(\_SB.PTCC)
{
    // Don't load component for any version. Version check (SDIV) has been disabled
    Method(_STA, 0)
    {
        //If(LGreaterEqual(\_SB_.SIDV, 0x0000000000020000)) {return (0x0F)}  // Load driver
        //else {
        return (0x0) //}  // Do not load driver. 
    }
}
