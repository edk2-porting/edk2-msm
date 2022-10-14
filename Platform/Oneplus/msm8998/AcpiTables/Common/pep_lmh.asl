Scope (\_SB.PEP0)
{
    Method (LLMH, 0, NotSerialized)
    {
        Return (NLMH) /* \_SB_.PEP0.NLMH */
    }

    Name (NLMH, Package (One)
    {
        Package (0x03)
        {
            "PEP_LMH_CFG", 
            Package (0x06)
            {
                Zero, 
                Zero, 
                0x002DB400, 
                0x0D02, 
                0x0E4C, 
                0x0E60
            }, 

            Package (0x06)
            {
                One, 
                Zero, 
                0x002DB400, 
                0x0D02, 
                0x0E4C, 
                0x0E60
            }
        }
    })
}
