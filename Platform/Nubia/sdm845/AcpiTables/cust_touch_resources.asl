//===========================================================================
//                           <cust_touch_resources.asl>
// DESCRIPTION
//   This file contains the resources needed by touch driver.
//
//===========================================================================
Scope(\_SB_.PEP0)
{
    
  Method(LPMX)
  {
     Return(LPXC)
  }
  
  Name(LPXC,
    Package(){
      Package ()
      {
          "DEVICE", 
          "\\_SB.TSC1", 
          Package ()
          {
              "DSTATE", 
              Zero, 
              Package ()
              {
                  "PMICVREGVOTE", 
                  Package ()
                  {
                      "PPP_RESOURCE_ID_LDO6_A", 
                      One, 
                      0x001C5200, 
                      One, 
                      0x07, 
                      Zero
                  }
              }, 

              Package ()
              {
                  "PMICVREGVOTE", 
                  Package ()
                  {
                      "PPP_RESOURCE_ID_LDO28_A", 
                      One, 
                      0x002DE600, 
                      One, 
                      0x07, 
                      Zero
                  }
              }, 

              Package ()
              {
                  "TLMMGPIO", 
                  Package ()
                  {
                      0x17, 
                      One, 
                      Zero, 
                      One, 
                      0x03, 
                      Zero
                  }
              }, 

              Package ()
              {
                  "TLMMGPIO", 
                  Package ()
                  {
                      0x7D, 
                      Zero, 
                      Zero, 
                      Zero, 
                      0x03, 
                      Zero
                  }
              }, 

              Package ()
              {
                  "TLMMGPIO", 
                  Package ()
                  {
                      0x63, 
                      Zero, 
                      Zero, 
                      One, 
                      Zero, 
                      Zero
                  }
              }, 

              Package ()
              {
                  "DELAY", 
                  Package ()
                  {
                      0x02
                  }
              }, 

              Package ()
              {
                  "TLMMGPIO", 
                  Package ()
                  {
                      0x63, 
                      One, 
                      Zero, 
                      One, 
                      Zero, 
                      Zero
                  }
              }, 

              Package ()
              {
                  "DELAY", 
                  Package ()
                  {
                      0xC8
                  }
              }
          }, 

          Package ()
          {
              "DSTATE", 
              0x03, 
              Package ()
              {
                  "PMICVREGVOTE", 
                  Package ()
                  {
                      "PPP_RESOURCE_ID_LDO6_A", 
                      One, 
                      Zero, 
                      Zero, 
                      Zero, 
                      Zero
                  }
              }, 

              Package ()
              {
                  "PMICVREGVOTE", 
                  Package ()
                  {
                      "PPP_RESOURCE_ID_LDO28_A", 
                      One, 
                      Zero, 
                      Zero, 
                      Zero, 
                      Zero
                  }
              }, 

              Package ()
              {
                  "TLMMGPIO", 
                  Package ()
                  {
                      0x17, 
                      Zero, 
                      Zero, 
                      One, 
                      One, 
                      Zero
                  }
              }, 

              Package ()
              {
                  "TLMMGPIO", 
                  Package ()
                  {
                      0x63, 
                      Zero, 
                      Zero, 
                      Zero, 
                      One, 
                      Zero
                  }
              }, 

              Package ()
              {
                  "TLMMGPIO", 
                  Package ()
                  {
                      0x7D, 
                      Zero, 
                      Zero, 
                      Zero, 
                      One, 
                      Zero
                  }
              }
          }
      }
    })
}
