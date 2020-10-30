//
// Copyright (c) 2017, Mmoclauq Technologies Inc. All rights reserved.
//
// This file contains the Power Management IC (PMIC)
// ACPI device definitions, configuration and look-up tables.
//

// Include("cust_pmic_batt.asl")



 //
 // PMIC Battery Miniclass Driver
 //
 Device (PMBM) {
    Name (_HID, "HID_PMBM")
    Alias(\_SB.PSUB, _SUB)
    Name (_DEP, Package(0x1)
    {
        \_SB_.PMGK
    })

    Method (_STA) {
        Return (0xF)    // Device is installable, functional & should be visible in OSPM/Device Manager
    }

    Method (_CRS, 0x0, NotSerialized) {
        Name (RBUF, ResourceTemplate () {
        })
        Return (RBUF)
    }
}

//
//FGBCL Driver
//
Device (BCL1) {
    Name (_HID, "HID_BCL1")
    Alias(\_SB.PSUB, _SUB)
    Name (_DEP, Package(0x1)
    {
       \_SB_.PMIC
    })

    Method (_CRS, 0x0, NotSerialized) {
       Name (RBUF, ResourceTemplate () {
          GpioInt(Edge, ActiveLow, Shared, PullUp, 0, "\\_SB.PM01",,,,) {488} // PM_INT__PM3_BCLBIG_LVL0 listen to active low to go to level_sys_ok
          GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {489} // PM_INT__PM3_BCLBIG_LVL1
          GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {490} // PM_INT__PM3_BCLBIG_LVL2
          GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {491} // PM_INT__PM3_BCLBIG_BAN
          GpioInt(Edge, ActiveLow, Shared, PullUp, 0, "\\_SB.PM01",,,,) {288} // PM_INT__PM2_BCLBIG_LVL0 listen to active low to go to level_sys_ok
          GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {289} // PM_INT__PM2_BCLBIG_LVL1
          GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {290} // PM_INT__PM2_BCLBIG_LVL2
          GpioInt(Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01",,,,) {291} // PM_INT__PM2_BCLBIG_BA

       })
       Return (RBUF)
    }
      //ACPI methods for Interrupt Name
      Method (BCLQ) {
          Name (CFG0,
          Package(){
       "PM3_BCLBIG_LVL0",       //pmic3 bclbig_level0 IRQ
       "PM3_BCLBIG_LVL1",       //pmic3  bclbig_level1 IRQ
       "PM3_BCLBIG_LVL2",       //pmic3  bclbig_level2 IRQ
       "PM3_BCLBIG_BAN",        //pmic3 bclbig_ban IRQ
       "PM2_BCLBIG_LVL0",       //pmic2 bclbig_level0 IRQ
       "PM2_BCLBIG_LVL1",       //pmic2  bclbig_level1 IRQ
       "PM2_BCLBIG_LVL2",       //pmic2  bclbig_level2 IRQ
       "PM2_BCLBIG_BAN"         //pmic2 bclbig_ban IRQ
          })
          Return (CFG0)
      }
}

// //
// // PMIC Glink Driver
// //
Device (PMGK) {
    Name (_HID, "HID_PMGK")
    Alias(\_SB.PSUB, _SUB)
    Name (_DEP, Package(0x2)
    {
       \_SB_.GLNK,
       \_SB_.ABD
    })
    Name (LKUP, 0x00);          

    Method (_STA) {
        Return (0xB)
    }

    // Get pseudo SPB controller port which is used to handle the ACPI operation region access
    Method(GEPT)
    {
        Name(BUFF, Buffer(4){})
        CreateByteField(BUFF, 0x00, STAT)
        CreateWordField(BUFF, 0x02, DATA)
        Store(0x3, DATA)
        Return(DATA)
    }

    //Declare Data Buffer to exchange data
    Name(BUFF, Buffer(50){})    //50 bytes, STAT(1), SIZE(1), UCSI Payload (48)
    CreateField(BUFF,   0,      8,      BSTA)  // Create the BSTA Field for STAT            (Offset = 0-bit,   size = 8-bit)
    CreateField(BUFF,   8,      8,      BSIZ)  // Create the BSIZ Field for SIZE            (Offset = 8-bit,   size = 8-bit)
    CreateField(BUFF,   16,     16,     BVER)  // Create the BVER Field for DATA-Version    (Offset = 16-bit,  size = 16-bit)
    //Reserve 16bit here
    CreateField(BUFF,   48,     32,     BCCI)  // Create the BCCI Field for DATA-CCI        (Offset = 16-bit,  size = 32-bit)
    CreateField(BUFF,   80,     64,     BCTL)  // Create the BCTL Field for DATA-Control    (Offset = 16-bit,  size = 64-bit)
    CreateField(BUFF,   144,    128,    BMGI)  // Create the BMGI Field for DATA-MessageIn  (Offset = 16-bit,  size = 128-bit)
    CreateField(BUFF,   272,    128,    BMGO)  // Create the BMGO Field for DATA-MessageOut (Offset = 16-bit,  size = 128-bit)
    
    Method(USBN, 1)
    {
        //Read mailbox from buffer
        Store(UCSI, BUFF)
        
        //Update Mailbox content with buffer (only the field PPM->OPM)
        Store(BVER, \_SB.UCSI.VERS)
        Store(BCCI, \_SB.UCSI.CCI)
        Store(BMGI, \_SB.UCSI.MSGI)
        
        //Notify UCSI Driver for Mailbox Update
        Notify(\_SB.UCSI, Arg0)
        Return(0) 
    }
    
    Method(UPAN, 1)
    {
        Name (VNTF, 0xFFFFFFFF) //Variable for Notification
        Name (VPRT, 0x04)       //Variable for Port
        Name (VMUX, 0x00)       //Variable for Mux
        Name (VCCS, 0x02)       //Variable for CC State
        Name (VDPP, 0x00)       //Variable for DP Pin
        Name (VHPD, 0x00)       //Variable for HPD State
        Name (VHSF, 0x02)       //Variable for High-Speed flag
        Name (VHIQ, 0x00)       //Variable for HPD IRQ

        Name (BCCX, 0x00)       //Create variable for CC Status, Mux and HS Flag
        Name (BDIX, 0x00)       //Create variable for Pin Assignment, HPD Status, IRQ_HPD Status
        
        Store(Arg0,VNTF)        
        //Arg0 is 4 bytes content for pin assignment
        //byte 0: port_index
        AND(VNTF,0xFF,VPRT)
        
        //byte 1: orientation
        ShiftRight(VNTF,8,VNTF)
        AND(VNTF,0xFF,VCCS)
                
        //byte 2: mux_ctrl
        ShiftRight(VNTF,8,VNTF)
        AND(VNTF,0xFF,VMUX)
        
        switch(VMUX)
        {
            case(0)
            {
                Store(0,VHSF)
                break;
            }         
            case(1)
            {
                Store(0,VHSF)
                break;
            }            
            case(2)
            {
                Store(1,VHSF)
                break;
            }            
            case(3)
            {
                Store(0,VHSF)
                break;
            }
        }
        
        //byte 3: dpam_hpd (bit7: IrqHPD, bit6: HPDState, bit 0-5: Pin Assignment)
        ShiftRight(VNTF,8,VNTF)
        AND(VNTF,0x80,VHIQ)
        If(LEqual(VHIQ,0))
        {
            Store(0,VHIQ)
        }
        Else
        {
            Store(1,VHIQ)
        }
        
        AND(VNTF,0x40,VHPD)
        If(LEqual(VHPD,0))
        {
            Store(0,VHPD)
        }
        Else
        {
            Store(1,VHPD)
        }
        
        AND(VNTF,0x3F,VDPP)
        //If VDPP is 0, report TYPEC_DISPLAYPORT_PINASSIGNMENTINVALID(0x0)
        If(LEqual(VDPP,0))
        {
            Store(0, VDPP)
        }
        //If VDPP is Non-zero, add 6(USBGRAPHICS_NOTIFICATION_CC1_PIN_F) if CC status is CC2
        ElseIf(LEqual(VCCS,1))
        {
            Add(VDPP,0x6,VDPP)
        }
                        
        //CC Status(0:1), Mux (2:3), High Speed Flag(4:5), Reserved(6:7)
        Store(VCCS, BCCX)
        
        ShiftLeft(VMUX,2,VMUX)
        OR(VMUX, BCCX, BCCX)
        
        ShiftLeft(VHSF,4,VHSF)
        OR(VHSF, BCCX, BCCX)        
        //Display Info - PINA(0:3), HPD(4), IRQ_HPD(5), Reserved(6:7)
        Store(VDPP, BDIX)
        
        ShiftLeft(VHPD,4,VHPD)
        OR(VHPD, BDIX, BDIX)
        
        ShiftLeft(VHIQ,5,VHIQ)
        OR(VHIQ, BDIX, BDIX)
        
        //Update USB Driver
        Store(0x2, \_SB.UCS0.EINF)//2 ports
        switch(VPRT)
        {
            case(0)
            {
                //1st Port
                OR(0x1, \_SB.UCS0.EUPD, \_SB.UCS0.EUPD)   //Set Bit 0
                Store(BCCX, \_SB.UCS0.ECC0)
                Store(BDIX, \_SB.UCS0.EDI0)
                \_SB.UCS0.USBR()
                break;
            }
            case(1)
            {
                //2nd Port
                OR(0x2, \_SB.UCS0.EUPD, \_SB.UCS0.EUPD)   //Set Bit 1
                Store(BCCX, \_SB.UCS0.ECC1)
                Store(BDIX, \_SB.UCS0.EDI1)
                \_SB.UCS0.USBR()
                break;
            }                 
        }        
        
        //Sent Notify for PAN ACK - Uncomment for loop back testing
        //Notify(\_SB.PMGK, VPRT)
        Return(0) 
    }
     
    Method (_CRS, 0x0, NotSerialized) {
       Name (RBUF, ResourceTemplate () {
       })
       Return (RBUF)
    }
    
    Method(LKST, 1)
    {
        Store(Arg0, LKUP)
        Notify(\_SB.UCSI, 0x0)  //Send Bus Check Notification for UCSI Re-enumeration
        Return(0)
    }

    //Virtual Bus (ABD) and its register map
    Field (\_SB.ABD.ROP1, BufferAcc, NoLock, Preserve)
    {
        Connection(I2CSerialBus(0x3,,0x0,, "\\_SB.ABD",,,,)),
        AccessAs (BufferAcc, AttribRawBytes(48)), 
        UCSI, 384
    }
}

