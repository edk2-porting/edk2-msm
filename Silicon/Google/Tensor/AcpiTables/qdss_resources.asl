//===========================================================================
//                           <qdss_resources.asl>
// DESCRIPTION
//   This file contans the power management resources needed by qdss driver.
//
//===========================================================================

//===========================================================================
// Description & Possible use cases for Qdss's  p-state implementation
// Qdss employs pstate-sets to robustly configure clock and tlmm registers
// pstate-set 0 has pstates for clock frequencies
// pstate-set 1 has pstates for managing tlmm registers for tpiu operation
//========================================================
//      Sinks              p-states allowed
//--------------------------------------------------------
//     non-TPIU            P{0,0}
//                         P{0,1}
//                         P{0,2}
//                         P{0,3}
//       TPIU              P{0,0} AND (P{1,1} OR P{1,3})
//                         P{0,1} AND (P{1,0} OR P{1,2})
//                         P{0,2} AND (P{1,0} OR P{1,2})
//                         P{0,3} AND (P{1,0} OR P{1,2})
//
// Description of pstate-sets and corresponding p-states :
//  pstate-set-0 is the set with allowed qdss clock frequencies
//  under set-0 each p-state holds the following meaning:
//      pstate-0 CLOCK OFF (0 Hz)
//      pstate-1 SVS CLOCK FREQUENCY  (depends on the voltage; ranges 150 to 300 MHz)
//      pstate-2 HIGH CLOCK FREQUENCY (300 MHz)
//      pstate-3 LOW CLOCK FREQUENCY  (150 MHz)
//
//  under set-1 each p-state hold the following meaning:
//      pstate-0 sets SET-B TLMM registers to make TPIU operational
//      pstate-1 clears SET-B TLMM registers to make TPIU operational
//      pstate-2 sets SD TLMM registers to make TPIU operational
//      pstate-3 clears SD TLMM registers to make TPIU operational
//===========================================================================

Scope(\_SB.PEP0)
{
    Method(QDMD){
        Return(QDSC)
    }

    Name(QDSC,
    Package()
    {
        Package()
        {
            "DEVICE",
            "\\_SB.QDSS",
            Package()
            {
                "COMPONENT",
                0x0,
                Package()
                {
                    "FSTATE",
                    0x0,
                },
                Package()
                {
                    "FSTATE",
                    0x1,
                    Package() {"PSTATE_ADJUST", Package() {0, 0},},
                },
                Package()
                {
                    "PSTATE_SET",
                    0x0,
                    // p-state for turning off the clock
                    Package()
                    {
                        "PSTATE",
                        0x0,
                        package() {"NPARESOURCE", package() {1, "/clk/qdss", 0},},
                    },
                    // p-state for setting the clock to SVS mode (depends on the voltage)
                    Package()
                    {
                        "PSTATE",
                        0x1,
                        package() {"NPARESOURCE", package() {1, "/clk/qdss", 1},},
                    },
                    // p-state for high speed clock
                    Package()
                    {
                        "PSTATE",
                        0x2,
                        package() {"NPARESOURCE", package() {1, "/clk/qdss", 2},},
                    },
                    // p-state for low speed mode
                    Package()
                    {
                        "PSTATE",
                        0x3,
                        package() {"NPARESOURCE", package() {1, "/clk/qdss", 3},},
                    },
                },
                Package()
                {
                    "PSTATE_SET",
                    0x1,
                    // p-state for enabling SET-B TPIU TLMM
                    // TODO: clean-up TPIU code and deprecate this functionality. TPIU is no longer used
                    package()
                    {
                        "PSTATE",
                        0x0,
                    },
                    // p-state for disabling SET-B TPIU TLMM
                    package()
                    {
                        "PSTATE",
                        0x1,
                    },
                    // p-state for enabling TPIU SD
                    package()
                    {
                        "PSTATE",
                        0x2,
                    },
                    // p-state for disabling TPIU SD
                    package()
                    {
                        "PSTATE",
                        0x3,
                    },
                },
				
                // pstate-set for enabling the HWEVT Mux clocks TO DO: requires hw event xml
                // for subsystems that are under Qdss address map
                // *the convention followed in the code is for a mux enable state is
                // immediately followed by disable state.*
                // e.g. as in 0 is to enable mmss clock and 0+1 is to disable mmss clock
                // TODO: confirm with clkrgm team for "/clk/qdss" npa node support.
                Package()
                {
                    "PSTATE_SET",
                    0x2,
                    // p-state for setting the /clk/qdss
                    package()
                    {
                        "PSTATE",
                        0x0,
                        package() {"NPARESOURCE", package() {1, "/clk/qdss", 1},},
                    },
                    // p-state for shutting of the qdss clock
                    package()
                    {
                        "PSTATE",
                        0x1,
                        package() {"NPARESOURCE", package() {1, "/clk/qdss", 0},},
                    },
                },
				
                // logger integrator GPIO 
                Package()
                {
                    "PSTATE_SET",
                    0x3,
                    // p-state for setting the /clk/qdss
                    package()
                    {
                        "PSTATE",
                        0x0,
                        package() {"TLMMPORT", package() {0x33000, 0x07FF, 0x01C8},}, // TLMM_GPIO_CFG51, qdss_cti_trig0_out_mira, See http://ipcatalog.qualcomm.com/chipio/tlmm/chip/53/map/170 TLMM base address: TLMM_NORTH, see http://ipcatalog.qualcomm.com/swi/module/1279315#TLMM_GPIO_CFG51
                    },
                },
            },
        },
    })
}
