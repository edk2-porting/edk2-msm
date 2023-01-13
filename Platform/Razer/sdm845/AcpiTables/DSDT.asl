//
// NOTE: The 3rd parameter (i.e. ComplianceRevision) must be >=2 for 64-bit integer support.
//
DefinitionBlock("DSDT.AML", "DSDT", 0x02, "QCOMM ", "SDM850 ", 3)
{
    External (_SB_.TZ98, UnknownObj)
    External (_SB_.TZ98._PSV, IntObj)
    External (_SB_.TZ98._TC1, IntObj)
    External (_SB_.TZ98._TC2, IntObj)
    External (_SB_.TZ98._TSP, IntObj)
    External (_SB_.TZ98.TPSV, UnknownObj)
    External (_SB_.TZ98.TTC1, UnknownObj)
    External (_SB_.TZ98.TTC2, UnknownObj)
    External (_SB_.TZ98.TTSP, UnknownObj)
    External (BFCC, IntObj)
    External (BOCP, IntObj)
    External (CUST, IntObj)
    External (DCMA, IntObj)
    External (EMPT, IntObj)
    External (IFGD, IntObj)
    External (PCT1, UnknownObj)
    External (PCT2, UnknownObj)
    External (RID2, IntObj)
    External (RID3, IntObj)
    External (TRUU, UnknownObj)
    External (VFGD, IntObj)
    External (VLOW, IntObj)
    External (VNOM, IntObj)

    Scope(\_SB_) {

        Include("DSDT_common.asl")

        // ADC driver
        Include("adc.asl")

        // Thermal Zone devices depend on PEP (included in dsdt_common). Please be CAREFUL on location
		Include("cust_thermal_zones.asl")

    }


    // other
    Name (WAKP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        \_SB.ADBG (Concatenate ("_PTS:ARG0:", ToHexString (Arg0)))
        \_SB.LED1.LEDR = Zero
        \_SB.LID0.LIDB = One
        \_SB.ADBG ("PLID1")
        \_SB.ADBG (Concatenate ("_PTS:LEDR:", ToHexString (\_SB.LED1.LEDR)))
        If (Arg0) {}
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        \_SB.ADBG (Concatenate ("_WAK:ARG0:", ToHexString (Arg0)))
        \_SB.LED1.LEDR = 0x04
        \_SB.ADBG (Concatenate ("_WAK:LEDR:", ToHexString (\_SB.LED1.LEDR)))
        Return (WAKP) /* \WAKP */
    }


}
