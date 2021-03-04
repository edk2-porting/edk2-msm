//===========================================================================
//                           <qdss_remote_etm.asl>
// DESCRIPTION
//   This file contans the REMOTE ETM details needed by qdss driver.
//
//===========================================================================

Scope(\_SB.QDSS)
{
    // References: 
    // http://agiledocument.qualcomm.com/AgileDocument?itemno=80-NH952-62  -- See section 2.4.2 Service Instance Values

    Method (RETM)  // Remote ETMs
    {
        Return
        (
            Package()
            {
            // ETM Subsystem source index - Need to aligned as per REMOTE_ETM_SUBSYS_TYPE defined QdssCommonTypes.h)

            //              RemoteETMName,   ETM Subsystem source id.
                Package() {  "MODEMQ6ETM",          1},        // Qdss Remote ETM index 0 MODEMQ6ETM
                Package() {  "SPSSETM",            12},        // Qdss Remote ETM index 1 SPSSETM
            }
        )
    }

    Method (RECF)  // Remote ETM Config
    {
        Return
        (
            Package()
            {
                Package()
                {
                    0,      // Qdss Remote ETM index (MODEMQ6ETM)
                    1,      // QMI support flag
                    2,      // QMI inst ID
                },
                Package()
                {
                    1,      // Qdss Remote ETM index (SPSSETM)
                    0,      // QMI support flag
                    0,      // QMI inst ID
                },
            }
        )
    }
}
