Name(QUFN, 0x0 )      //enable flag for QcUsbFN driver stack

//Holds the DPDM Polarity
//USB_DPDM_INVALID_INVALID = 0
//USB_DPDM_INVALID_FALLING = 1
//USB_DPDM_INVALID_RISING  = 2
//USB_DPDM_FALLING_INVALID = 3
//USB_DPDM_RISING_INVALID  = 4
//USB_DPDM_FALLING_FALLING = 5
//USB_DPDM_FALLING_RISING  = 6
//USB_DPDM_RISING_FALLING  = 7
//USB_DPDM_RISING_RISING   = 8
Name(DPP0, Buffer(){0x0})

//
// USB Role Switch
//
Device(URS0)
{
    //select HID based on flag for QcUsbFN driver stack
    Method (URSI) {
    If(Lequal(\_SB.QUFN, 0x0)) {
        return("QCOM0304")
      }
    Else{
        return ("QCOM0305")
      }
    }

    Alias(URSI, _HID)

    Name(_CID, "PNP0CA1")
    Alias(\_SB.PSUB, _SUB)
    Name (_UID, 0)
    Name(_CCA, Zero) // Cache-incoherent bus-master, Hardware does not manage cache coherency
    Name(_DEP, Package(0x1)
    {
        \_SB_.PEP0
    })

    Name(_CRS, ResourceTemplate() {
        Memory32Fixed(ReadWrite, 0x0A600000, 0x000FFFFF)
    })

    // Dynamically enumerated device (host mode stack) on logical USB bus
    Device(USB0)
    {
        Name(_ADR, 0)
        Name(_S0W, 3) // Enable power management for SDM850 BU

        // _PLD as defined in the ACPI spec. The GroupToken and GroupPosition are used to
        // derive a unique "Connector ID". The other fields are not really important.
        Name(_PLD, Package()
        {
            Buffer()
            {
                0x82,                   // Revision 2, ignore color.
                0x00,0x00,0x00,         // Color (ignored).
                0x00,0x00,0x00,0x00,    // Width and height.
                0x69,                   // User visible; Back panel; VerticalPos:Center.
                0x0c,                   // HorizontalPos:0; Shape:Vertical Rectangle; GroupOrientation:0.
                0x80,0x00,              // Group Token:0; Group Position:1; So Connector ID is 1.
                0x00,0x00,0x00,0x00,    // Not ejectable.
                0xFF,0xFF,0xFF,0xFF     // Vert. and horiz. offsets not supplied.
            }
        })
        // _UPC as defined in the ACPI spec.
        Name(_UPC, Package()
        {
            0x01,                       // Port is connectable.
            0x09,                       // Connector type: Type C connector - USB2 and SS with switch.
            0x00000000,                 // Reserved0 - must be zero.
            0x00000000                  // Reserved1 - must be zero.
        })
        Name(_CRS, ResourceTemplate() {
            // usb30_ctrl_irq[0]
            Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , , ) {0xA5}
            // Qusb2Phy_intr
            Interrupt(ResourceConsumer, Level, ActiveHigh, SharedAndWake, , , ) {0x17A}
            // qmp_usb3_lfps_rxterm_irq
            Interrupt(ResourceConsumer, Level, ActiveHigh, SharedAndWake, , , ) {0x206}
            // eud_p0_dmse_int_mx - Rising Edge
            Interrupt(ResourceConsumer, Edge, ActiveHigh, SharedAndWake, , , ) {0x208}
            // eud_p0_dpse_int_mx - Rising Edge
            Interrupt(ResourceConsumer, Edge, ActiveHigh, SharedAndWake, , , ) {0x209}
        })

        Method(_STA)
        {
            Return (0xf)
        }

        //Method to set DPDM Polarity for Pep Driver
        Method(DPM0, 0x1, NotSerialized) {
            // ARG 0 � DPDM polarity
            Store(Arg0, \_SB.DPP0)        //DPDM Polarity
            Notify(\_SB.PEP0, 0xA0)
        }

        // Returns CC Out
        Method(CCVL) {
            // Return CC OUT
            Return(\_SB.CCST)
        }
        //Returns High Speed Enumeration Flag
        Method(HSEN) {
            // Return High Speed Enumeration Flag
            Return(\_SB.HSFL)
       }

       /* HS enumeration fix
       //HSEI: High Speed pullup gpio
       Name (HSEI, ResourceTemplate ()
       {
          GpioIo (Exclusive,PullNone,0,0, ,"\\_SB.GIO0", ,) {8}
       })

       //define 1 byte long operation region HLEN w/ base address == 0 under GPIO0 devnode namespace
       Scope(\_SB.GIO0) {
          OperationRegion(HLEN, GeneralPurposeIO, 0, 1) // Note: Region is less than 8 pins long
       }

       //now connect HLEN field in op region w/ HSEI resource
       Field(\_SB.GIO0.HLEN, ByteAcc, NoLock, Preserve)
       {
          //Connect field to HSEI physical object
          Connection (\_SB.URS0.USB0.HSEI), // Following fields will be accessed atomically
          MOD1, 1 //MOD1 - variable name, 1 == 1bit wide
       }
       */

        // Device Specific Method takes 4 args:
        //  Arg0 : Buffer containing a UUID [16 bytes]
        //  Arg1 : Integer containing the Revision ID
        //  Arg2 : Integer containing the Function Index
        //  Arg3 : Empty Package (Not used)
        Method (_DSM, 0x4, NotSerialized)
        {
            // UUID selector
            switch(ToBuffer(Arg0)) {
                // UFX interface identifier
                case(ToUUID("CE2EE385-00E6-48CB-9F05-2EDB927C4899")) {
                    // Function selector
                    switch(ToInteger(Arg2)) {
                        // Function 0: Return supported functions, based on revision
                        case(0) {
                            // Version selector
                            switch(ToInteger(Arg1)) {
                                // Revision0: functions {0,2,3,4} supported
                                case(0) { Return(Buffer(){0x1D}); Break; }
                                // Function 0 only supported for invalid revision
                                default { Return(Buffer(){0x01}); Break; }
                            }
                            // default
                            Return (Buffer(){0x00}); Break;
                        }

                        // Function 2: Port type identification
                        // 0x00 � Regular USB
                        // 0x01 � HSIC
                        // 0x02 � SSIC
                        // 0x03 � 0xff reserved
                        case(2) { Return(0x0); Break; }

                        // Function 3: Query Controller Capabilities
                        // bit 0 represents the support for software assisted USB endpoint offloading feature
                        // 1 - Offloading endpoint supported
                        case(3) { Return(0x1); Break; }

                        // Function 4: Interrupter Number
                        case(4) { Return(0x2); Break; }

                        default { Return (Buffer(){0x00}); Break; }
                    } // Function
                } // {CE2EE385-00E6-48CB-9F05-2EDB927C4899}
                default { Return (Buffer(){0x00}); Break; }
            } // UUID
        } // _DSM
        //
        // The following values of PHY will be configured if OEMs do not
        // overwrite the values.
        //
        // For SNPS core, PARAMETER_OVERRIDE_X is used to configure HS PHY.
        // For SS PHY, PERIPH_SS_USB3PHY_QSERDES_TX_TX_DRV_LVL is used to tune swing
        // and PERIPH_SS_USB3PHY_QSERDES_TX_TX_EMP_POST1_LVL for de_emphasis.
        //
        // AccessMethod:
        // 0 - DirectAccess: The register address is accessed directly from the mapped memory.
        //
        Method(PHYC, 0x0, NotSerialized) {
           Name (CFG0, Package()
           {
             //         AccessMethod, REG ADDR,   Value
             //         -------------------------------
             //Package() {0x0,          0x06AF8814, 0xD191A4}, // DirectAccess,     HS PARAMETER_OVERRIDE_X_ADDR
             //Package() {0x0,          0x06A3820C, 0x11},     // DirectAccess,     SS QMP PHY TX Swing
             //Package() {0x0,          0x06A38208, 0x21},     // DirectAccess,     SS QMP PHY TX DE-Emphasis
           })
           Return (CFG0)
        }

        /*
        Device(RHUB)
        {
            Name(_ADR, 0) // Value zero reserved for Root Hub

            // Device Specific Method takes 4 args:
            //  Arg0 : Buffer containing a UUID [16 bytes]
            //  Arg1 : Integer containing the Revision ID
            //  Arg2 : Integer containing the Function Index
            //  Arg3 : Empty Package (Not used)
            Method (_DSM, 0x4, NotSerialized)
            {
                // UUID selector
                switch(ToBuffer(Arg0)) {
                    // HS enumeration fix
                    case(ToUUID("A9A82A56-95A1-4B4A-B014-3BE47DF1B7D5"))
                    {
                        // Version selector
                        switch(ToInteger(Arg1))
                        {
                            case(1)         //DSM_SDM845_HS_RH_PORT_RESET_REVISION_1
                            {
                                switch(ToInteger(Arg2)) //DSM_SDM845_HS_RH_PORT_RESET_FUNCTION_
                                {
                                    //DSM_SDM845_HS_RH_PORT_RESET_FUNCTION_PRE_RESET_ON - set GPIO high
                                    case(1)
                                    {
                                        Store (0x01, \_SB.URS0.USB0.MOD1)
                                        Return (Buffer(){0x01})   //return success
                                    }
                                    //DSM_SDM845_HS_RH_PORT_RESET_FUNCTION_POST_RESET_OFF - set GPIO low
                                    case(0)
                                    {
                                        Store (0x00, \_SB.URS0.USB0.MOD1)
                                        Return (Buffer(){0x01})    //return success
                                    }

                                    default { Return (Buffer(){0x00})}
                                }
                            }
                            default { Return (Buffer(){0x00}) }
                        }
                    }//end (A9A82A56-95A1-4B4A-B014-3BE47DF1B7D5)

                    default { Return (Buffer(){0x00}); Break; }
                } // UUID
            } // _DSM
        } // Root Hub
        */

    } // USB0

    // Dynamically enumerated device (peripheral mode stack) on logical USB bus
    Device(UFN0)
    {
        Name(_ADR, 1)
        Name(_S0W, 3)   // Enable power management for Napali BU
        // _PLD as defined in the ACPI spec. The GroupToken and GroupPosition are used to
        // derive a unique "Connector ID". The other fields are not really important.
        Name(_PLD, Package()
        {
            Buffer()
            {
                0x82,                   // Revision 2, ignore color.
                0x00,0x00,0x00,         // Color (ignored).
                0x00,0x00,0x00,0x00,    // Width and height.
                0x69,                   // User visible; Back panel; VerticalPos:Center.
                0x0c,                   // HorizontalPos:0; Shape:Vertical Rectangle; GroupOrientation:0.
                0x80,0x00,              // Group Token:0; Group Position:1; So Connector ID is 1.
                0x00,0x00,0x00,0x00,    // Not ejectable.
                0xFF,0xFF,0xFF,0xFF     // Vert. and horiz. offsets not supplied.
            }
        })
        // _UPC as defined in the ACPI spec.
        Name(_UPC, Package()
        {
            0x01,                       // Port is connectable.
            0x09,                       // Connector type: Type C connector - USB2 and SS with switch.
            0x00000000,                 // Reserved0 - must be zero.
            0x00000000                  // Reserved1 - must be zero.
        })
        Name(_CRS, ResourceTemplate() {
            // usb30_ctrl_irq[0]
            Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , , ) {0xA5}
            //usb30_power_event_irq
            Interrupt(ResourceConsumer, Level, ActiveHigh, SharedAndWake, , , ) {0xA2}
        })

        // Returns CC Out
        Method(CCVL) {
            // Return CC OUT
            Return(\_SB.CCST)
        }

        // Device Specific Method takes 4 args:
        //  Arg0 : Buffer containing a UUID [16 bytes]
        //  Arg1 : Integer containing the Revision ID
        //  Arg2 : Integer containing the Function Index
        //  Arg3 : Package that contains function-specific arguments
        Method (_DSM, 0x4, NotSerialized)
        {
            // UUID selector
            switch(ToBuffer(Arg0)) {
                // UFX interface identifier
                case(ToUUID("FE56CFEB-49D5-4378-A8A2-2978DBE54AD2")) {
                    // Function selector
                    switch(ToInteger(Arg2)) {
                        // Function 0: Return supported functions, based on revision
                        case(0) {
                            // Version selector
                            switch(ToInteger(Arg1)) {
                                // Revision0: functions {1} supported
                                case(0) { Return(Buffer(){0x03}); Break; }
                                default { Return(Buffer(){0x01}); Break; }
                            }
                            // default
                            Return (Buffer(){0x00}); Break;
                        }

                        // Function 1: Return number of supported USB PHYSICAL endpoints
                        // Synopsys core configured to support 16 IN/16 OUT EPs, including EP0
                        case(1) { Return(32); Break; }

                        default { Return (Buffer(){0x00}); Break; }
                    } // Function
                } // {FE56CFEB-49D5-4378-A8A2-2978DBE54AD2}

                // QCOM specific interface identifier
                case(ToUUID("18DE299F-9476-4FC9-B43B-8AEB713ED751")) {
                    // Function selector
                    switch(ToInteger(Arg2)) {
                        // Function 0: Return supported functions, based on revision
                        case(0) {
                            // Version selector
                            switch(ToInteger(Arg1)) {
                                // Revision0: functions {1} supported
                                case(0) { Return(Buffer(){0x03}); Break; }
                                default { Return(Buffer(){0x01}); Break; }
                            }
                            // default
                            Return (Buffer(){0x00}); Break;
                        }

                        // Function 1: Return device capabilities bitmap
                        //   Bit  Description
                        //   ---  -------------------------------
                        //     0  Superspeed Gen1 supported
                        //     1  PMIC VBUS detection supported
                        //     2  USB PHY interrupt supported
                        //     3  Type-C supported
                        //     4  Delay USB initialization
                        //     5  HW based charger detection
                        case(1) { Return(0x39); Break; }

                        default { Return (Buffer(){0x00}); Break; }
                    } // Function
                } // {18DE299F-9476-4FC9-B43B-8AEB713ED751}

                default { Return (Buffer(){0x00}); Break; }
            } // UUID
        } // _DSM

        //
        // The following values of PHY will be configured if OEMs do not
        // overwrite the values.
        //
        // For SNPS core, PARAMETER_OVERRIDE_X is used to configure HS PHY.
        // For SS PHY, PERIPH_SS_USB3PHY_QSERDES_TX_TX_DRV_LVL is used to tune swing
        // and PERIPH_SS_USB3PHY_QSERDES_TX_TX_EMP_POST1_LVL for de_emphasis.
        //
        // AccessMethod:
        // 0 - DirectAccess: The register address is accessed directly from the mapped memory.
        //
        Method(PHYC, 0x0, NotSerialized) {
           Name (CFG0, Package()
           {
             //         AccessMethod, REG ADDR,   Value
             //         -------------------------------
             //Package() {0x0,          0x06AF8814, 0xD191A4}, // DirectAccess,     HS PARAMETER_OVERRIDE_X_ADDR
             //Package() {0x0,          0x06A3820C, 0x11},     // DirectAccess,     SS QMP PHY TX Swing
             //Package() {0x0,          0x06A38208, 0x21},     // DirectAccess,     SS QMP PHY TX DE-Emphasis
           })
           Return (CFG0)
        }
    } // UFN0
} // URS0

// HPD Notification Event in Display Driver
// HPD_STATUS_LOW_NOTIFY_EVENT    -  0x92
// HPD_STATUS_HIGH_NOTIFY_EVENT   -  0x93
// All other valus are invalid
Name(HPDB, 0x00000000)

// DP Pin Assignment
//    TYPEC_DISPLAYPORT_PINASSIGNMENTINVALID = 0x0
//    TYPEC_DISPLAYPORT_DFPDPINASSIGNMENTA   = 0x01
//    TYPEC_DISPLAYPORT_DFPDPINASSIGNMENTB   = 0x02
//    TYPEC_DISPLAYPORT_DFPDPINASSIGNMENTC   = 0x03
//    TYPEC_DISPLAYPORT_DFPDPINASSIGNMENTD   = 0x04
//    TYPEC_DISPLAYPORT_DFPDPINASSIGNMENTE   = 0x05
//    TYPEC_DISPLAYPORT_DFPDPINASSIGNMENTF   = 0x06
//    TYPEC_DISPLAYPORT_UFPDPINASSIGNMENTA   = 0x07
//    TYPEC_DISPLAYPORT_UFPDPINASSIGNMENTB   = 0x08
//    TYPEC_DISPLAYPORT_UFPDPINASSIGNMENTC   = 0x09
//    TYPEC_DISPLAYPORT_UFPDPINASSIGNMENTD   = 0x0A
//    TYPEC_DISPLAYPORT_UFPDPINASSIGNMENTE   = 0x0B
Name(PINA, 0x00000000)

// Holds the CC OUT Status
// 0 -> CC1
// 1 -> CC2
// 2 -> CC Open
Name(CCST, Buffer(){0x02})

// Holds the HS Only enumeration Flag for display alternate mode
// 0 -> Super Speed Controller Enumeration support
// 1 -> High Speed Controller Enumeration support
// 2 -> Invalid
Name(HSFL, Buffer(){0x00})

// USB Capabilities bitmap
// Indicates the platform's USB capabilities, extend as required.
//   Bit  Description
//   ---  ---------------------------------------------------
//     0  Super Speed Gen1 supported (Synopsys IP)
//     1  PMIC VBUS detection supported
//     2  USB PHY interrupt supported (seperate from ULPI)
//     3  TypeC supported
Name(USBC, Buffer(){0x0B})


//
// USB Type-C/PD Switch
//
Device(UCP0)
{
    Name(_HID, "QCOM02D0") // QCOM24D3
    Name(_DEP, Package(0x3)
    {
        \_SB_.PEP0,
        \_SB_.PTCC,
        \_SB_.URS0
    })

        Device(CON0)
        {
            // These devices are not meant to be enumerated by ACPI, hence you should not assign
            // HWIDs to them. Instead, use _ADR to assign unique addresses to them.
            // The addresses are required to be a 0-based index of the connector. First connector
            // should have "0", second one "1", etc.
            Name(_ADR, 0x00000000)
            // _PLD as defined in the ACPI spec. The GroupToken and GroupPosition are used to
            // derive a unique "Connector ID". The other fields are not really important.
            Name(_PLD, Package()
            {
                Buffer()
                {
                    0x82,                   // Revision 2, ignore color.
                    0x00,0x00,0x00,         // Color (ignored).
                    0x00,0x00,0x00,0x00,    // Width and height.
                    0x69,                   // User visible; Back panel; VerticalPos:Center.
                    0x0c,                   // HorizontalPos:0; Shape:Vertical Rectangle; GroupOrientation:0.
                    0x80,0x00,              // Group Token:0; Group Position:1; So Connector ID is 1.
                    0x00,0x00,0x00,0x00,    // Not ejectable.
                    0xFF,0xFF,0xFF,0xFF     // Vert. and horiz. offsets not supplied.
                }
            })
            // _UPC as defined in the ACPI spec.
            Name(_UPC, Package()
            {
                0x01,                       // Port is connectable.
                0x09,                       // Connector type: Type C connector - USB2 and SS with switch.
                0x00000000,                 // Reserved0 - must be zero.
                0x00000000                  // Reserved1 - must be zero.
            })
            Name(_DSD, Package()
            {
                // The UUID for Type-C connector capabilities.
                ToUUID("6b856e62-40f4-4688-bd46-5e888a2260de"),
                // The data structure which contains the connector capabilities. Each package
                // element contains two elements: the capability type ID, and the capability data
                // (which depends on the capability type). Note that any information defined here
                // will override similar information described by the driver itself. For example, if
                // the driver claims the port controller is DRP-capable, but ACPI says it is UFP-only
                // ACPI will take precedence.
                Package()
                {
                    Package() {1, 4},      // Supported operating modes (DRP).
                    Package() {2, 3},      // Supported Type-C sourcing capabilities (DefaultUSB & 1500mA).
                    Package() {3, 0},      // Audio accessory capable (False).
                    Package() {4, 1},      // Is PD supported (True).
                    Package() {5, 3},      // Supported power roles (Sink and Source).
                    Package()
                    {
                        6,                  // Capability type ID of PD Source Capabilities.
                        Package()
                        {
                            0x00019096      // Source PDO #0: Fixed:5V, 1.5A. No need to describe fixed bits.
                        }
                    },
                    Package()
                    {
                        7,                  // Capability type ID of PD Sink Capabilities.
                        Package ()
                        {
                            0x0001912C,     // Sink PDO #0: Fixed:5V, 3.0A. No need to describe fixed bits.
                            0x0002D0C8,      // Sink PDO #1: Fixed:9V, 2.0A. No need to describe fixed bits.
                            0x0003C096,     // Sink PDO #2: Fixed:12V, 1.5A. No need to describe fixed bits.
                        }
                    },
                    Package()
                    {
                        8,                  // Capability type ID of supported PD Alternate Modes.
                        Package()
                        {
                            0xFF01, 0x3C86  // DFP_D capable (B0:1); DFP v1.3 signalling (B2:5); DP on Type-C plug (B6);
                                            // usb r2.0 signalling not required (B7); Pin Assignment Supported - C,D,E,F (B8:15)
                        }
                    },
                    Package()
                    {
                        9,                  // Add Delay in loading of host stack
                        1
                    },
                    Package()               // Hardware CC debounce is supported
                    {
                        0xA,
                        1
                    }
                }
            })
        } // Device(CON0)

    // Device Specific Method takes 4 args:
    //  Arg0 : Buffer containing a UUID [16 bytes]
    //  Arg1 : Integer containing the Revision ID
    //  Arg2 : Integer containing the Function Index
    //  Arg3 : Package that contains function-specific arguments
    Method (_DSM, 0x4, NotSerialized)
    {
        // UUID selector
        switch(ToBuffer(Arg0)) {
            // QCOM specific interface identifier
            case(ToUUID("18DE299F-9476-4FC9-B43B-8AEB713ED751")) {
                // Function selector
                switch(ToInteger(Arg2)) {
                    // Function 0: Return supported functions, based on revision
                    case(0) {
                        // Version selector
                        switch(ToInteger(Arg1)) {
                            // Revision0: functions {0,1} supported
                            case(0) { Return(Buffer(){0x01}); Break; }  // TypeC support only, No PD
                            default { Return(Buffer(){0x01}); Break; }
                        }
                        // default
                        Return (Buffer(){0x00}); Break;
                    }

                    // Function1: Return Capabilities Data Objects
                    case(1) {
                        switch(ToInteger(Arg3)) {
                        // Source Power PDO
                        case (0) { Return(Package(){0x36019050}); Break; }
                        // Sink Power PDO
                        case (1) { Return(Package(){0x3601912C}); Break; }
                        //default
                        default  { Return (Package(){0x00}); Break; }
                        }
                    }
                    default { Return (Buffer(){0x00}); Break; }
                } // Function
            } // {18DE299F-9476-4FC9-B43B-8AEB713ED751}

            default { Return (Buffer(){0x00}); Break; }
        } // UUID
    } // _DSM
    // Method for updating the CC Out status and HS Mode Flag
    // Arg 0 - CC Out value (CC1/CC2/CC Open)
    // Arg 1 - HS Mode Flag (SS/HS/Invalid)
    Method(CCOT, 0x2, NotSerialized) {
        // ARG 0 - CC_OUT
        Store(Arg0, \_SB.CCST)
        Store(Arg1, \_SB.HSFL)
    }
    // Method for reading CC Out Value from Type-C client driver
    // Only for sanity testing
    Method(CCVL) {
        // Return CC OUT
        Return(\_SB.CCST)
    }

     Method(HPDS, 0x0, NotSerialized) {
      // Notify event ID - 0x92 to GFX driver on a hot plug-in event
      Notify(\_SB.GPU0, 0x94)
    }

    Method(HPDF, 0x2, NotSerialized) {
        // ARG 0 - HPD Status
        Store(Arg0, \_SB.HPDB)
        // Arg 1 - Pin Assignment
        Store(Arg1, \_SB.PINA)
        // Invoke Display Driver HPD event
        Notify(\_SB.GPU0, \_SB.HPDB)
    }

    // Method for reading CC Out Value from Type-C client driver
    // Only for sanity testing
    Method(HPDV) {
        // Return HPD
        Return(\_SB.HPDB)
    }
    // Method for reading HPD and Pin Assignment values from Type-C client driver
    // Only for sanity testing
    Method(PINV) {
        // Return Pin Assignment
        Return(\_SB.PINA)
    }

} // UCP0

//Dummy device to allow KDNET on 2ndary port debugger registration
// Device (USB1)
// {
//     Name (_DEP, Package(0x1)
//     {
//         \_SB_.PEP0
//     })
//     Name (_HID, "QCOM02BA")  // QCOM02BA
//     Name (_UID, 1)

//     //set device status as not present, disabled, not shown in UI, not functioning properly
//     Name(STVL, 0x0)

//     Method (_STA) {
//         Return (STVL) // return the current device status
//     }
// } // USB1


//
// USB Type-C Audio Driver
//
// Device (USBA)
// {
//     Name (_DEP, Package(0x1)
//     {
//         \_SB_.IMM0
//     })
//     Name (_HID, "QCOM0300")
//     Alias(\_SB.PSUB, _SUB)
// }


//URS1 specific
/*

//Holds the DPDM Polarity
//USB_DPDM_INVALID_INVALID = 0
//USB_DPDM_INVALID_FALLING = 1
//USB_DPDM_INVALID_RISING  = 2
//USB_DPDM_FALLING_INVALID = 3
//USB_DPDM_RISING_INVALID  = 4
//USB_DPDM_FALLING_FALLING = 5
//USB_DPDM_FALLING_RISING  = 6
//USB_DPDM_RISING_FALLING  = 7
//USB_DPDM_RISING_RISING   = 8
Name(DPP1, Buffer(){0x0})

//USB Role Switch For Secondary Port
Device(URS1)
{
    Name(_HID, "QCOM0304")
    Name(_CID, "PNP0CA1")
    Alias(\_SB.PSUB, _SUB)
    Name (_UID, 1)
    Name(_CCA, Zero) // Cache-incoherent bus-master, Hardware does not manage cache coherency
    Name(_DEP, Package(0x1)
    {
        \_SB_.PEP0
    })

    Name(_CRS, ResourceTemplate() {
        Memory32Fixed(ReadWrite, 0x0A800000, 0x000FFFFF)
        //USBID pin Interrupt [USB_ID]
        GpioInt(Edge, ActiveBoth, Exclusive, PullUp, 0, "\\_SB.PM01",,,,) {488}
    })

    // Dynamically enumerated device (host mode stack) on logical USB bus
    Device(USB1)
    {
        Name(_ADR, 0)
        Name(_S0W, 3) // Enable power management
        // _PLD as defined in the ACPI spec. The GroupToken and GroupPosition are used to
        // derive a unique "Connector ID". The other fields are not really important.
        Name(_PLD, Package()
        {
            Buffer()
            {
                0x82,                   // Revision 2, ignore color.
                0x00,0x00,0x00,         // Color (ignored).
                0x00,0x00,0x00,0x00,    // Width and height.
                0x69,                   // User visible; Back panel; VerticalPos:Center.
                0x0c,                   // HorizontalPos:0; Shape:Vertical Rectangle; GroupOrientation:0.
                0x80,0x01,              // Group Token:0; Group Position:1; So Connector ID is 1.
                0x00,0x00,0x00,0x00,    // Not ejectable.
                0xFF,0xFF,0xFF,0xFF     // Vert. and horiz. offsets not supplied.
            }
        })
        // _UPC as defined in the ACPI spec.
        Name(_UPC, Package()
        {
            0x01,                       // Port is connectable.
            0x06,                       // Connector type: uAB
            0x00000000,                 // Reserved0 - must be zero.
            0x00000000                  // Reserved1 - must be zero.
        })

        Method (_CRS, 0x0, NotSerialized)
        {
            Name (RBUF, ResourceTemplate ()
            {
                //usb30_sec_ctrl_irq[0]
                Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , , ) {0xAA}
            })
            Store(RBUF, Local0)

            ConcatenateResTemplate(Local0, ResourceTemplate()
            {
                //Qusb2Phy_sec_intr
                Interrupt(ResourceConsumer, Level, ActiveHigh, SharedAndWake, , , ) {0x17B}
                // qmp_usb3_lfps_rxterm_irq
                Interrupt(ResourceConsumer, Level, ActiveHigh, SharedAndWake, , , ) {0x207}
                // eud_p1_dmse_int_mx - Rising Edge
                Interrupt(ResourceConsumer, Edge, ActiveHigh, SharedAndWake, , , ) {0x20A}
                // eud_p1_dpse_int_mx - Rising Edge
                Interrupt(ResourceConsumer, Edge, ActiveHigh, SharedAndWake, , , ) {0x20B}
            }, Local1)

            Return(Local1)
        }

        Method(_STA)
        {
            Return (0xf)
        }

        //Method to set DPDM Polarity for Pep Driver
        Method(DPM1, 0x1, NotSerialized) {
            // ARG 0 � DPDM polarity
            Store(Arg0, \_SB.DPP1)        //DPDM Polarity
            Notify(\_SB.PEP0, 0xA1)
        }

        // Device Specific Method takes 4 args:
        //  Arg0 : Buffer containing a UUID [16 bytes]
        //  Arg1 : Integer containing the Revision ID
        //  Arg2 : Integer containing the Function Index
        //  Arg3 : Empty Package (Not used)
        Method (_DSM, 0x4, NotSerialized)
        {
            // UUID selector
            switch(ToBuffer(Arg0)) {
                // UFX interface identifier
                case(ToUUID("CE2EE385-00E6-48CB-9F05-2EDB927C4899")) {
                    // Function selector
                    switch(ToInteger(Arg2)) {
                        // Function 0: Return supported functions, based on revision
                        case(0) {
                            // Version selector
                            switch(ToInteger(Arg1)) {
                                // Revision0: functions {0,2,3} supported
                                case(0) { Return(Buffer(){0x0D}); Break; }
                                // Function 0 only supported for invalid revision
                                default { Return(Buffer(){0x01}); Break; }
                            }
                            // default
                            Return (Buffer(){0x00}); Break;
                        }

                        // Function 2: Port type identification
                        // 0x00 � Regular USB
                        // 0x01 � HSIC
                        // 0x02 � SSIC
                        // 0x03 � 0xff reserved
                        case(2) { Return(0x0); Break; }

                        // Function 3: Query Controller Capabilities
                        // bit 0 represents the support for software assisted USB endpoint offloading feature
                        // 1 - Offloading endpoint supported
                        case(3) { Return(0x1); Break; }

                        default { Return (Buffer(){0x00}); Break; }
                    } // Function
                } // {CE2EE385-00E6-48CB-9F05-2EDB927C4899}
                default { Return (Buffer(){0x00}); Break; }
            } // UUID
        } // _DSM
        //
        // The following values of PHY will be configured if OEMs do not
        // overwrite the values.
        //
        // For SNPS core, PARAMETER_OVERRIDE_X is used to configure HS PHY.
        // For SS PHY, PERIPH_SS_USB3PHY_QSERDES_TX_TX_DRV_LVL is used to tune swing
        // and PERIPH_SS_USB3PHY_QSERDES_TX_TX_EMP_POST1_LVL for de_emphasis.
        //
        // AccessMethod:
        // 0 - DirectAccess: The register address is accessed directly from the mapped memory.
        //
        Method(PHYC, 0x0, NotSerialized) {
           Name (CFG0, Package()
           {
             //         AccessMethod, REG ADDR,   Value
             //         -------------------------------
             //Package() {0x0,          0x06AF8814, 0xD191A4}, // DirectAccess,     HS PARAMETER_OVERRIDE_X_ADDR
             //Package() {0x0,          0x06A3820C, 0x11},     // DirectAccess,     SS QMP PHY TX Swing
             //Package() {0x0,          0x06A38208, 0x21},     // DirectAccess,     SS QMP PHY TX DE-Emphasis
           })
           Return (CFG0)
        }
    } // USB1

    // Dynamically enumerated device (peripheral mode stack) on logical USB bus
    Device(UFN1)
    {
        Name(_ADR, 1)
        Name(_S0W, 3)   // Enable power management
        // _PLD as defined in the ACPI spec. The GroupToken and GroupPosition are used to
        // derive a unique "Connector ID". The other fields are not really important.
        Name(_PLD, Package()
        {
            Buffer()
            {
                0x82,                   // Revision 2, ignore color.
                0x00,0x00,0x00,         // Color (ignored).
                0x00,0x00,0x00,0x00,    // Width and height.
                0x69,                   // User visible; Back panel; VerticalPos:Center.
                0x0c,                   // HorizontalPos:0; Shape:Vertical Rectangle; GroupOrientation:0.
                0x80,0x01,              // Group Token:0; Group Position:1; So Connector ID is 1.
                0x00,0x00,0x00,0x00,    // Not ejectable.
                0xFF,0xFF,0xFF,0xFF     // Vert. and horiz. offsets not supplied.
            }
        })
        // _UPC as defined in the ACPI spec.
        Name(_UPC, Package()
        {
            0x01,                       // Port is connectable.
            0x09,                       // Connector type: Type C connector - USB2 and SS with switch.
            0x00000000,                 // Reserved0 - must be zero.
            0x00000000                  // Reserved1 - must be zero.
        })
        Name(_CRS, ResourceTemplate() {
            // usb30_sec_ctrl_irq[0]
            Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , , ) {0xAA}
            //usb30_sec_power_event_irq
            Interrupt(ResourceConsumer, Level, ActiveHigh, SharedAndWake, , , ) {0xA7}
            //Attach,Detach Interrupt [USB2_VUSB_DET]
            GpioInt(Edge, ActiveBoth, ExclusiveAndWake, PullNone, 0, "\\_SB.PM01",,,,RawDataBuffer() {0x00, 0x00, 0x00, 0x00}) {487}
        })

        // Device Specific Method takes 4 args:
        //  Arg0 : Buffer containing a UUID [16 bytes]
        //  Arg1 : Integer containing the Revision ID
        //  Arg2 : Integer containing the Function Index
        //  Arg3 : Package that contains function-specific arguments
        Method (_DSM, 0x4, NotSerialized)
        {
            // UUID selector
            switch(ToBuffer(Arg0)) {
                // UFX interface identifier
                case(ToUUID("FE56CFEB-49D5-4378-A8A2-2978DBE54AD2")) {
                    // Function selector
                    switch(ToInteger(Arg2)) {
                        // Function 0: Return supported functions, based on revision
                        case(0) {
                            // Version selector
                            switch(ToInteger(Arg1)) {
                                // Revision0: functions {1} supported
                                case(0) { Return(Buffer(){0x03}); Break; }
                                default { Return(Buffer(){0x01}); Break; }
                            }
                            // default
                            Return (Buffer(){0x00}); Break;
                        }

                        // Function 1: Return number of supported USB PHYSICAL endpoints
                        // Synopsys core configured to support 16 IN/16 OUT EPs, including EP0
                        case(1) { Return(32); Break; }

                        default { Return (Buffer(){0x00}); Break; }
                    } // Function
                } // {FE56CFEB-49D5-4378-A8A2-2978DBE54AD2}

                // QCOM specific interface identifier
                case(ToUUID("18DE299F-9476-4FC9-B43B-8AEB713ED751")) {
                    // Function selector
                    switch(ToInteger(Arg2)) {
                        // Function 0: Return supported functions, based on revision
                        case(0) {
                            // Version selector
                            switch(ToInteger(Arg1)) {
                                // Revision0: functions {1} supported
                                case(0) { Return(Buffer(){0x03}); Break; }
                                default { Return(Buffer(){0x01}); Break; }
                            }
                            // default
                            Return (Buffer(){0x00}); Break;
                        }

                        // Function 1: Return device capabilities bitmap
                        //   Bit  Description
                        //   ---  -------------------------------
                        //     0  Superspeed Gen1 supported
                        //     1  PMIC VBUS detection supported
                        //     2  USB PHY interrupt supported
                        //     3  Type-C supported
                        //     4  Delay USB initialization
                        //     5  HW based charger detection
                        case(1) { Return(0x33); Break; }

                        default { Return (Buffer(){0x00}); Break; }
                    } // Function
                } // {18DE299F-9476-4FC9-B43B-8AEB713ED751}

                default { Return (Buffer(){0x00}); Break; }
            } // UUID
        } // _DSM

        //
        // The following values of PHY will be configured if OEMs do not
        // overwrite the values.
        //
        // For SNPS core, PARAMETER_OVERRIDE_X is used to configure HS PHY.
        // For SS PHY, PERIPH_SS_USB3PHY_QSERDES_TX_TX_DRV_LVL is used to tune swing
        // and PERIPH_SS_USB3PHY_QSERDES_TX_TX_EMP_POST1_LVL for de_emphasis.
        //
        // AccessMethod:
        // 0 - DirectAccess: The register address is accessed directly from the mapped memory.
        //
        Method(PHYC, 0x0, NotSerialized) {
           Name (CFG0, Package()
           {
             //         AccessMethod, REG ADDR,   Value
             //         -------------------------------
             //Package() {0x0,          0x06AF8814, 0xD191A4}, // DirectAccess,     HS PARAMETER_OVERRIDE_X_ADDR
             //Package() {0x0,          0x06A3820C, 0x11},     // DirectAccess,     SS QMP PHY TX Swing
             //Package() {0x0,          0x06A38208, 0x21},     // DirectAccess,     SS QMP PHY TX DE-Emphasis
           })
           Return (CFG0)
        }
    } // UFN1
} // URS1
*/
