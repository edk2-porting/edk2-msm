//
// Copyright (c) 2018-2019 Mmoclauq Technologies, Inc.  All Rights Reserved.
// Mmoclauq Technologies Proprietary and Confidential.
//

Name(QUFN, 0x0 )      //enable flag for QcUsbFN driver stack
//Name(FGEN, Buffer(){0x0}) //Flag for Forcing Gen1 only for USB controller. 0-disable, 1-enable

//Flag to enable/disable Multiport re-driver for USB MP controller
//0-disable, 1-enable
//Name(MPRF, Buffer(){0x0}) 


// HPD Notification Event in Display Driver
// HPD_STATUS_LOW_NOTIFY_EVENT    -  0x92
// HPD_STATUS_HIGH_NOTIFY_EVENT   -  0x93
// All other valus are invalid
Name(HPDB, 0x00000000)

//  Holds the HPD Status
//  TYPEC_DISPLAYPORT_HPD_STATUSLOW  = 0x0
//  TYPEC_DISPLAYPORT_HPD_STATUSHIGH = 0x1
Name(HPDS, Buffer(){0x00})

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

//USBGRAPHICS_NOTIFICATION_INVALID = 0x0,  // External display hot plug-out ACPI notification 
//USBGRAPHICS_NOTIFICATION_CC1_PIN_A,      // External display  ACPI notification, CC1, Pin assignment A 
//USBGRAPHICS_NOTIFICATION_CC1_PIN_B,      // External display  ACPI notification, CC1, Pin assignment B
//USBGRAPHICS_NOTIFICATION_CC1_PIN_C,      // External display  ACPI notification, CC1, Pin assignment C
//USBGRAPHICS_NOTIFICATION_CC1_PIN_D,      // External display  ACPI notification, CC1, Pin assignment D
//USBGRAPHICS_NOTIFICATION_CC1_PIN_E,      // External display  ACPI notification, CC1, Pin assignment E
//USBGRAPHICS_NOTIFICATION_CC1_PIN_F,      // External display  ACPI notification, CC1, Pin assignment F
//USBGRAPHICS_NOTIFICATION_CC2_PIN_A,      // External display  ACPI notification, CC2, Pin assignment A
//USBGRAPHICS_NOTIFICATION_CC2_PIN_B,      // External display  ACPI notification, CC2, Pin assignment B
//USBGRAPHICS_NOTIFICATION_CC2_PIN_C,      // External display  ACPI notification, CC2, Pin assignment C
//USBGRAPHICS_NOTIFICATION_CC2_PIN_D,      // External display  ACPI notification, CC2, Pin assignment D
//USBGRAPHICS_NOTIFICATION_CC2_PIN_E,      // External display  ACPI notification, CC2, Pin assignment E
//USBGRAPHICS_NOTIFICATION_CC2_PIN_F,      // External display  ACPI notification, CC2, Pin assignment F
//USBGRAPHICS_NOTIFICATION_MAX
// USB DP Info (based on above enum), initially set to USBGRAPHICS_NOTIFICATION_MAX
Name(DPPN, 0x0000000D)

// Holds the CC OUT Status
// 0 -> CC1
// 1 -> CC2
// 2 -> CC Open
Name(CCST, Buffer(){0x02})


// Holds the Active UCSI Port Number
// 0 -> Primary
// 1 -> Secondary
// 2 -> Invalid
Name(PORT, Buffer(){0x02})

//  Holds the IRQ HPD Status
//  TYPEC_DISPLAYPORT_HPDIRQ_STATUSLOW  = 0x0
//  TYPEC_DISPLAYPORT_ HPDIRQ_STATUSHIGH = 0x1
Name(HIRQ, Buffer(){0x00})

// USB Capabilities bitmap
// Indicates the platform's USB capabilities, extend as required.
//   Bit  Description
//   ---  ---------------------------------------------------
//     0  Super Speed Gen1 supported (Synopsys IP)
//     1  PMIC VBUS detection supported
//     2  USB PHY interrupt supported (seperate from ULPI)
//     3  TypeC supported
Name(USBC, Buffer(){0x0B})

// MUX
// 00b: No connection (default)
// 01b: USB3.1 Connected
// 10b: DP Alternate Mode - 4 lanes
// 11b: USB3.1 + Display Port Lanes 0 & 1
Name(MUXC, Buffer(){0x00})

//
// USB Role Switch Primary
//
Device(URS0)
{
    //select HID based on flag for QcUsbFN driver stack
    Method (URSI) {
    If(Lequal(\_SB.QUFN, 0x0)) {
        return("HID_URS0")
      }
    Else{
        return ("HID_URS1")
      }
    }

    Alias(URSI, _HID)

    Name(_CID, "PNP0CA1")
    Alias(\_SB.PSUB, _SUB)
    Name (_UID, 0)
    Name(_CCA, Zero) // Cache-incoherent bus-master, Hardware does not manage cache coherency
    Name(_DEP, Package(0x2)
    {
        \_SB_.PEP0,
        \_SB_.UCS0              //Depends on USB UCSI Type-C Device
    })

    Name(_CRS, ResourceTemplate() {
        Memory32Fixed(ReadWrite, 0x0A600000, 0x000FFFFF)
    })

    // Dynamically enumerated device (host mode stack) on logical USB bus
    Device(USB0)
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
                0x00,0x00,              // Group Token:0; Group Position:0; So Connector ID is 0.
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
            // usb31_ctrl_irq[0]
            Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , , ) {0xA5}
            // usb31_power_event_irq
            Interrupt(ResourceConsumer, Level, ActiveHigh, SharedAndWake, , , ) {0xA2}
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

        // Returns CC Out        
        Method(CCVL) {
            // Return CC OUT
            And(0x1, \_SB.UCS0.ECC0, \_SB.CCST) 
            Return(\_SB.CCST)
        }


	// Method for forcing Gen1 speed
        //Method(GEN1) {
            //Return Flag
            //Return(\_SB.FGEN)
        //}


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
                        // 0x00 - Regular USB
                        // 0x01 - HSIC
                        // 0x02 - SSIC
                        // 0x03 - 0xff reserved
                        case(2) { Return(0x0); Break; }

                        // Function 3: Query Controller Capabilities
                        // bit 0 represents the support for software assisted USB endpoint offloading feature
                        // 1 - Offloading endpoint supported
                        case(3) { Return(0x0); Break; }

                        
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
    } // USB0

    // Dynamically enumerated device (peripheral mode stack) on logical USB bus
    Device(UFN0)
    {
        Name(_ADR, 1)
        Name(_S0W, 3)   // Enable power management for Function driver
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
                0x00,0x00,              // Group Token:0; Group Position:0; So Connector ID is 0.
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
            // usb31_ctrl_irq[0]
            Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , , ) {0xA5}
            //usb31_power_event_irq
            Interrupt(ResourceConsumer, Level, ActiveHigh, SharedAndWake, , , ) {0xA2}
        })

        // Returns CC Out
        Method(CCVL) {
            // Return CC OUT
            And(0x1, \_SB.UCS0.ECC0, \_SB.CCST) 
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

//
// USB Role Switch Secondary
//
Device(URS1)
{
    Name(_HID, "HID_URS0")
    Name(_CID, "PNP0CA1")
    Alias(\_SB.PSUB, _SUB)
    Name (_UID, 1)
    Name(_CCA, Zero) // Cache-incoherent bus-master, Hardware does not manage cache coherency
    Name(_DEP, Package(0x2)
    {
        \_SB_.PEP0,
        \_SB_.UCS0              //Depends on USB UCSI Type-C Device
    })

    Name(_CRS, ResourceTemplate() {
        Memory32Fixed(ReadWrite, 0x0A800000, 0x000FFFFF)
    })

    // Dynamically enumerated device (host mode stack) on logical Secondary USB bus
    Device (USB1)
    {
        Name (_S0W, 0x3)   // Enable the Power Management for Secondary port         
        Name(_ADR, 0)
        
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
            // usb31_ctrl_irq[0]
            Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , , ) {0xAA}
            // usb31_power_event_irq
            Interrupt(ResourceConsumer, Level, ActiveHigh, SharedAndWake, , , ) {0xA7}
            // qmp_usb3_lfps_rxterm_irq 
            Interrupt(ResourceConsumer, Level, ActiveHigh, SharedAndWake, , , ) {0x228}
            // eud_p1_dmse_int_mx - Rising Edge
            Interrupt(ResourceConsumer, Edge, ActiveHigh, SharedAndWake, , , ) {0x20A}
            // eud_p1_dpse_int_mx - Rising Edge
            Interrupt(ResourceConsumer, Edge, ActiveHigh, SharedAndWake, , , ) {0x20B}
        })

        //Methods for surpise removal of the controller
        Name(STVL, 0xF) // holds the device status
        Method (_STA) { 
            Return (STVL) // return the current device status
        }


        // Returns CC Out
        Method(CCVL) {
            // Return CC OUT
            And(0x1, \_SB.UCS0.ECC1, \_SB.CCST) 
            Return(\_SB.CCST)
        }


	// Method for forcing Gen1 speed
        //Method(GEN1) {
            //Return Flag
            //Return(\_SB.FGEN)
        //}


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
                        // 0x00 - Regular USB
                        // 0x01 - HSIC
                        // 0x02 - SSIC
                        // 0x03 - 0xff reserved
                        case(2) { Return(0x0); Break; }

                        // Function 3: Query Controller Capabilities
                        // bit 0 represents the support for software assisted USB endpoint offloading feature
                        // 1 - Offloading endpoint supported
                        case(3) { Return(0x0); Break; }

                        // Function 4: Interrupter Number
                        case(4) { Return(0x2); Break; }

                        default { Return (Buffer(){0x00}); Break; }
                    } // Function
                } // {CE2EE385-00E6-48CB-9F05-2EDB927C4899}
                default { Return (Buffer(){0x00}); Break; }
            } // UUID
        } // _DSM

        Method (_DIS) { } // empty method to mark device as disable

        Method (REMD) { // Method to remove the device. Your driver will evaluate this method.
            Store(0x0, STVL) // set the status to not present, not functioning, not decoding etc.
            Notify(\_SB.URS1.USB1, 0x1) // Issue notify DeviceCheck
        }

        Method (ADDD) { // Method to add the device. Your driver will evaluate this method.
            Store(0xF, STVL) // set the status to present, functioning, decoding etc.
            Notify(\_SB.URS1.USB1, 0x1) // Issue notify DeviceCheck again
        }
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
    } //USB1
	
    // Dynamically enumerated device (peripheral mode stack) on logical USB bus
    Device(UFN1)
    {
        Name(_ADR, 1)
        Name(_S0W, 3)   // Enable power management for Function driver
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
            // usb31_ctrl_irq[0]
            Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , , ) {0xAA}
            //usb31_power_event_irq
            Interrupt(ResourceConsumer, Level, ActiveHigh, SharedAndWake, , , ) {0xA7}
        })

        // Returns CC Out
        Method(CCVL) {
            // Return CC OUT
            And(0x1, \_SB.UCS0.ECC1, \_SB.CCST) 
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
    } // UFN1
	
} //URS1

//
// USB Multi Port
//
Device(USB2)
{
    Name (_HID, "HID_USB2") 
    Name(_CID, "PNP0D15") 
    Alias(\_SB.PSUB, _SUB)
    Name (_UID, 2)
    Name(_CCA, Zero) // Cache-incoherent bus-master, Hardware does not manage cache coherency
    Name(_S0W, 3) // Enable power management
    Name(_DEP, Package(0x1)
    {
        \_SB_.PEP0
    })

    Name(_CRS, ResourceTemplate() {
        Memory32Fixed(ReadWrite, 0x0A400000, 0x000FFFFF)
		
	//GPIO to enable\disable re-driver for multiport
	//GPIO will only be used, if MPRF is enable (set to 0x1)
        //GpioIo(Exclusive, PullUp, 0, 0, , "\\_SB.GIO0", ,) {54}
		
        // MP usb31_ctrl_irq[0]
        Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , , ) {0x2AE}
        // MP0 usb31_power_event_irq_0
        Interrupt(ResourceConsumer, Level, ActiveHigh, SharedAndWake, , , ) {0x2B0}
        // MP0 qmp_usb3_lfps_rxterm_irq 
        Interrupt(ResourceConsumer, Level, ActiveHigh, SharedAndWake, , , ) {0x207} 
        // MP1 usb31_power_event_irq_1
        Interrupt(ResourceConsumer, Level, ActiveHigh, SharedAndWake, , , ) {0x2AF}
        // MP1 qmp_usb3_lfps_rxterm_irq 
        Interrupt(ResourceConsumer, Level, ActiveHigh, SharedAndWake, , , ) {0x21E}
        
        // usb2_dmse_mp0 - Rising Edge
        Interrupt(ResourceConsumer, Edge, ActiveHigh, SharedAndWake, , , ) {0x22E}
        // usb2_dpse_mp0 - Rising Edge
        Interrupt(ResourceConsumer, Edge, ActiveHigh, SharedAndWake, , , ) {0x23B}

        // usb2_dmse_mp1 - Rising Edge
        Interrupt(ResourceConsumer, Edge, ActiveHigh, SharedAndWake, , , ) {0x244}
        // usb2_dpse_mp1 - Rising Edge
        Interrupt(ResourceConsumer, Edge, ActiveHigh, SharedAndWake, , , ) {0x247}
    })

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
                    // 0x00 - Regular USB
                    // 0x01 - HSIC
                    // 0x02 - SSIC
                    // 0x03 - 0xff reserved
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

    // This controller implements one root hub port
    Device(RHUB) 
    {
        Name(_ADR, 0) // Value zero reserved for Root Hub
        Device(MP0) 
        {
            Name(_ADR, 1)
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
                0x03,                       // Connector type: Type A connector - USB3.
                0x00000000,                 // Reserved0 - must be zero.
                0x00000000                  // Reserved1 - must be zero.
            })
        } //MP0
        Device(MP1) 
        {
            Name(_ADR, 2)
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
                0x03,                       // Connector type: Type A connector - USB3.
                0x00000000,                 // Reserved0 - must be zero.
                0x00000000                  // Reserved1 - must be zero.
            })
        } //MP1 
    } //RHUB

    //Methods for surpise removal of the controller
    Name(STVL, 0xF) // holds the device status
    Method (_STA) { 
        Return (STVL) // return the current device status
    }
	
    // Method to enable/disable MP re-driver
    //Method(MPRD) {
        //Return Flag
        //Return(\_SB.MPRF)
    //}


    Method (_DIS) { } // empty method to mark device as disable

    Method (REMD) { // Method to remove the device. Your driver will evaluate this method.
        Store(0x0, STVL) // set the status to not present, not functioning, not decoding etc.
        Notify(\_SB.USB2, 0x1) // Issue notify DeviceCheck
    }

    Method (ADDD) { // Method to add the device. Your driver will evaluate this method.
        Store(0xF, STVL) // set the status to present, functioning, decoding etc.
        Notify(\_SB.USB2, 0x1) // Issue notify DeviceCheck again
    }

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
} //USB2

//UCSI 
Device(UCSI)
{
    Name (_HID, EISAID("USBC000"))
    Name (_CID, EISAID("PNP0CA0"))
    Name (_UID, 3)
    Name (_DDN, "USB Type-C")
    Name (_DEP, Package(3) {
        \_SB_.ABD,              //Depends on ABD Device
        \_SB_.PMGK,             //Depends on PMIC GLINK Device
        \_SB_.UCS0              //Depends on USB UCSI Type-C Device
    })
    
    Method(_STA)
    {
        //Initialize the Share Memory
        Store(0x0100, VERS)                 //PPM->OPM Version
        Store(0x00000000, CCI)              //PPM->OPM CCI Indicator
        Store(0x0, MSGI)                    //OPM->PPM Message In
        IF(LGreater(\_SB.PMGK.LKUP, 0x0))   //
        {
            Return (0xf)
        }
        else
        {
            Return (0x0)
        }
    }
    
    Device(UCN0)
    {
        Name(_ADR, 0)
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
                0x00,0x00,              // Group Token:0; Group Position:0; So Connector ID is 0.
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
    }

    Device(UCN1)
    {
        Name(_ADR, 1)
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
    }

    Name(_CRS, ResourceTemplate() {
        Memory32Fixed(ReadWrite, 0x9FF90000, 0x30) //Allocated in UEFI memory map for us
    })

    //Declare System memory 
    OperationRegion(USBC, SystemMemory, 0x9FF90000, 0x30)
    Field(USBC,ByteAcc,Lock,Preserve)
    {
        // USB Type C Mailbox Interface
        VERS, 16,           //PPM->OPM Version
        RESV, 16,           //Reserved
        CCI,  32,           //PPM->OPM CCI indicator
        CTRL, 64,           //OPM->PPM Control message Index
        MSGI, 128,          //OPM->PPM Message In
        MSGO, 128,          //PPM->OPM Message Out
    }
    
    //Declare Data Buffer to exchange data
    Name(BUFF, Buffer(50){})    //50 bytes, STAT(1), SIZE(1), UCSI Payload (48)
    CreateField(BUFF,   0,      8,      BSTA)  // Create the BSTA Field for STAT            (Offset = 0-bit,   size = 8-bit)
    CreateField(BUFF,   8,      8,      BSIZ)  // Create the BSIZ Field for SIZE            (Offset = 8-bit,   size = 8-bit)
    CreateField(BUFF,   16,     16,     BVER)  // Create the BVER Field for DATA-Version    (Offset = 16-bit,  size = 384-bit)
    //Reserve 16bit here
    CreateField(BUFF,   48,     32,     BCCI)  // Create the BCCI Field for DATA-CCI        (Offset = 16-bit,  size = 384-bit)
    CreateField(BUFF,   80,     64,     BCTL)  // Create the BCTL Field for DATA-Control    (Offset = 16-bit,  size = 384-bit)
    CreateField(BUFF,   144,    128,    BMGI)  // Create the BMGI Field for DATA-MessageIn  (Offset = 16-bit,  size = 384-bit)
    CreateField(BUFF,   272,    128,    BMGO)  // Create the BMGO Field for DATA-MessageOut (Offset = 16-bit,  size = 384-bit)

    //Method to Perform OPM Write
    Method(OPMW)
    {
        //Update buffer with Mailbox content(only the field OPM->PPM)                        
        Store(CTRL, BCTL)
        Store(MSGO, BMGO)
        Store(BUFF, \_SB.PMGK.UCSI)            
        Return(0)
    }        
    
    //Method to perform OPM Read
    Method(OPMR)
    {
        //Read from Virtual Bus and Store the result in Buffer
        Store(\_SB.PMGK.UCSI, BUFF)
        
        //Update Mailbox content with buffer (only the field PPM->OPM)
        Store(BVER, VERS)
        Store(BCCI, CCI)
        Store(BMGI, MSGI)
        Return(0)
    }
    
    Method (_DSM, 4, Serialized, 0, UnknownObj, {BuffObj, IntObj, IntObj, PkgObj} )
    {
        //Arg0: UUID
        //Arg1: REVISION
    
        // Compare passed in UUID with supported UUID.
        If (LEqual(Arg0, ToUUID ("6f8398c2-7ca4-11e4-ad36-631042b5008f")))  // UUID for USB type C
        {
            //Arg2: Function Index: 0 - Supported Function
            //                      1 - Send Data
            //                      2 - Receive Data
            //                      3 - Device Controller Status
            //Arg3: Payload (not used)
            Switch (ToInteger(Arg2))
            {
                case(0)     //Supported Function
                {
                    Return (Buffer() {0x0F})
                }
                case(1)     //Send Data
                {
                    Return (OPMW())
                }
                case(2)     //Receive Data
                {
                    Return (OPMR())
                }
                case(3)     //Device Controller Status
                {
                    Return(0) // 0: Disable 1: Enable
                }
            }
        }
    }

} //UCSI


Device(UCS0)
{
    Name(_HID, "HID_UCS0")
    Alias(\_SB.PSUB, _SUB)
    Name(_DEP, Package(0x1)
    {
        \_SB_.PEP0
    })


    Name(_CRS, ResourceTemplate() {
        //Hardcoded (Allocated from UEFI)
         Memory32Fixed(ReadWrite, 0x9FF90040, 0x6)

        // Please do not change GPIO order as they are listed per USB-C port in order of USB-C port and UCSI_GPIO_TYPE
        // Primary Port
        GpioIo (Shared, PullNone, 0, 0, IoRestrictionNone, "\\_SB.GIO0", 0, ResourceConsumer, , RawDataBuffer(0x1){0x01}) {38}          // CC_OUT 
        GpioIo (Exclusive, PullUp, 0, 0, IoRestrictionOutputOnly, "\\_SB.GIO0", 0, ResourceConsumer, , RawDataBuffer(0x1){0x01}) {152}  // SBU_OE_N
        GpioIo (Exclusive, PullUp, 0, 0, IoRestrictionOutputOnly, "\\_SB.GIO0", 0, ResourceConsumer, , RawDataBuffer(0x1){0x01}) {100}  // SBU_SEL

        // Secondary Port
        GpioIo (Shared, PullNone, 0, 0, IoRestrictionNone, "\\_SB.GIO0", 0, ResourceConsumer, , RawDataBuffer(0x1){0x01}) {58}          // CC_OUT 
        GpioIo (Exclusive, PullUp, 0, 0, IoRestrictionOutputOnly, "\\_SB.GIO0", 0, ResourceConsumer, , RawDataBuffer(0x1){0x01}) {188}  // SBU_OE_N
        GpioIo (Exclusive, PullUp, 0, 0, IoRestrictionOutputOnly, "\\_SB.GIO0", 0, ResourceConsumer, , RawDataBuffer(0x1){0x01}) {187}  // SBU_SEL
    })

    //Declare System memory 
    OperationRegion(USBC, SystemMemory, 0x9FF90040, 0x6) 
    Field(USBC,ByteAcc,Lock,Preserve)
    {
        // USB Type C Mailbox Interface
        INFO, 8,          //USBC->PPM(EC) INFO Capability - Number of Type-C ports
        UPDT, 8,          //PPM(EC)->USBC & USBC->PPM(EC)  - Port Updated (Set by EC and cleared by USBC after        reading)
        CCM0, 8,          //PPM(EC)->USBC Port0 - CC Status, Mux and HS Flag
        DIS0, 8,          //PPM(EC)->USBC Port0 - Pin Assignment, HPD Status, IRQ_HPD Status
        CCM1, 8,          //PPM(EC)->USBC Port1 - CC Status, Mux and HS Flag
        DIS1, 8,          //PPM(EC)->USBC Port1 - Pin Assignment, HPD Status, IRQ_HPD Status
    }

    Name(PORT, Buffer(6){0x2, 0x0, 0x2, 0x0, 0x2, 0x0}) // Create data buffer as BUFF
    // Init Info - Set to 2 by QC USB Driver or EC - need to be decided on every boot up
    CreateByteField(PORT, 0x00, EINF) // INFO    - Number of Ports (0:3), Reserved(4:7) - max ports supported 7. This field would be set to 0x3 by default in ACPI.
    CreateByteField(PORT, 0x01, EUPD) // UPDATED - Port Updated(Bit map) (0:6) - Set the bit for port number that�s updated, Reserved(7). Updated by EC and cleared by QC Type-C driver on each update
    // Port 0 Info - Updated by EC
    CreateByteField(PORT, 0x02, ECC0) // CCMX    - CC Status(0:1), Mux (2:3), High Speed Flag(4:5), Reserved(6:7)
    CreateByteField(PORT, 0x03, EDI0) // DISP    - Display Info - PINA(0:3), HPD(4), IRQ_HPD(5), Reserved(6:7)
    // Port 1 Info - Updated by EC
    CreateByteField(PORT, 0x04, ECC1) // CCMX    - CC Status(0:1), Mux (2:3), High Speed Flag(4:5), Reserved(6:7)
    CreateByteField(PORT, 0x05, EDI1) // DISP    - Display Info - PINA(0:3), HPD(4), IRQ_HPD(5), Reserved(6:7)

    Method(USBW)
    {
        //Acquire Mutex 0
        //Update buffer with Mailbox content(only the field USBC->PPM(EC))                        
        Store(UPDT, EUPD)
        //Store(PORT, \_SB.PMGK.UCSI)    // Can be removed, need to be replaced with SAM (EC) interface
       // TBD -   need to notify EC � Need guidance here
        //Release Mutex 0
        Notify(\_SB.PMGK, 0xF0)
        Return(0)
    }

    //Method to perform USBC Read
    Method(USBR)
    {
        //Acquire Mutex 0 � need recommendation here
        //Read from Virtual Bus and Store the result in Buffer
        //Store(\_SB.XXXX, PORT)        // XXXX Need to be replaced with SAM (EC) interface
        //Update Mailbox content with buffer (only the field PPM(EC)->USBC)
        Store(EINF, INFO)
        Store(EUPD, UPDT)
        // Port 0 (Primary)
        Store(ECC0, CCM0)
        Store(EDI0, DIS0)     
        // Port 1 (Secondary)
        Store(ECC1, CCM1)
        Store(EDI1, DIS1)
        // USBC Notify
        Notify(UCS0, 0xA0) // Need to define notification code. Also need to make sure that this happens synhronously
        //Release Mutex 0. need recommendation here
        Return(0)
    }

} //UCS0