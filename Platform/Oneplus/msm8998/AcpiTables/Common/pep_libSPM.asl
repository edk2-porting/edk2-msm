Scope (\_SB.PEP0)
{
    Method (LSPM, 0, NotSerialized)
    {
        Return (NSPM) /* \_SB_.PEP0.NSPM */
    }

    Name (NSPM, Package (0x05)
    {
        "SPM_CONFIG", 
        0x0B, 
        0x03, 
        Package (0x04)
        {
            "SPM_CLUSTER_CONFIG", 
            0x05, 
            0x05, 
            One
        }, 

        Package (0x0C)
        {
            "SPM_PHYS_CONFIG", 
            0x17989000, 
            0x17999000, 
            0x179A9000, 
            0x179B9000, 
            0x17912000, 
            0x17889000, 
            0x17899000, 
            0x178A9000, 
            0x178B9000, 
            0x17812000, 
            0x179D2000
        }
    })
}
