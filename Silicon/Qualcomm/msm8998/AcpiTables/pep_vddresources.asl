Scope (\_SB.PEP0)
{
    Method (LVDD, 0, NotSerialized)
    {
        Return (NVDD) /* \_SB_.PEP0.NVDD */
    }

    Name (NVDD, Package (0x02)
    {
        Package (0x02)
        {
            "PEP_VDD_CX", 
            Package (0x04)
            {
                "PPP_RESOURCE_ID_RWAY_CX", 
                0x0B, 
                "RAIL_VOLTAGE_LEVEL_NOMINAL", 
                "RAIL_VOLTAGE_LEVEL_OFF"
            }
        }, 

        Package (0x02)
        {
            "PEP_VDD_MX", 
            Package (0x04)
            {
                "PPP_RESOURCE_ID_RWAY_MX", 
                0x0B, 
                "RAIL_VOLTAGE_LEVEL_TURBO", 
                "RAIL_VOLTAGE_LEVEL_OFF"
            }
        }
    })
}
