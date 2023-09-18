//===========================================================================
//                       <cust_camera_resources.asl>
// DESCRIPTION
//   This file contains the resources needed by camera drivers.
//
//===========================================================================

Scope (\_SB.PEP0)
{
    Method (CPMD, 0, NotSerialized)
    {
        Return (CPCC) /* \_SB_.PEP0.CPCC */
    }

    Method (CPMX, 0, NotSerialized)
    {
        Return (CPXC) /* \_SB_.PEP0.CPXC */
    }

    Name (CPCC, Package (0x04)
    {
        Package (0x04)
        {
            "DEVICE", 
            "\\_SB.JPGE", 
            Package (0x06)
            {
                "COMPONENT", 
                Zero, 
                Package (0x0B)
                {
                    "FSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_jpeg0_clk", 
                            0x09, 
                            0x12
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_jpeg0_clk", 
                            0x09, 
                            0x14
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_jpeg_axi_clk", 
                            0x09, 
                            0x12
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_jpeg_axi_clk", 
                            0x09, 
                            0x14
                        }
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            One, 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_jpeg0_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_jpeg_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_jpeg_axi_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            Zero, 
                            0x02
                        }
                    }
                }, 

                Package (0x0A)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "mmss_camss_jpeg0_clk", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "mmss_camss_jpeg_ahb_clk", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "mmss_camss_jpeg_axi_clk", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            One, 
                            0x15
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_jpeg_axi_clk", 
                            0x09, 
                            0x15
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_jpeg_axi_clk", 
                            0x09, 
                            0x13
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_jpeg0_clk", 
                            0x09, 
                            0x15
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_jpeg0_clk", 
                            0x09, 
                            0x13
                        }
                    }
                }, 

                Package (0x06)
                {
                    "PSTATE_SET", 
                    Zero, 
                    Package (0x03)
                    {
                        "PSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_jpeg0_clk", 
                                0x03, 
                                0x1C9C3800, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_jpeg0_clk", 
                                0x03, 
                                0x1312D000, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x02, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_jpeg0_clk", 
                                0x03, 
                                0x08F0D180, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_jpeg0_clk", 
                                0x03, 
                                0x047868C0, 
                                0x03
                            }
                        }
                    }
                }, 

                Package (0x18)
                {
                    "PSTATE_SET", 
                    One, 
                    Package (0x03)
                    {
                        "PSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xEE6B2800, 
                                0xEE6B2800
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xD09DC300, 
                                0xD09DC300
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x02, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xC4B20100, 
                                0xC4B20100
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xB8C63F00, 
                                0xB8C63F00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x04, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xACDA7D00, 
                                0xACDA7D00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x05, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xA0EEBB00, 
                                0xA0EEBB00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x06, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x9502F900, 
                                0x9502F900
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x07, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x89173700, 
                                0x89173700
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x08, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x7D2B7500, 
                                0x7D2B7500
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x09, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x713FB300, 
                                0x713FB300
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0A, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x6553F100, 
                                0x6553F100
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0B, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x59682F00, 
                                0x59682F00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0C, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x4D7C6D00, 
                                0x4D7C6D00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0D, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x4190AB00, 
                                0x4190AB00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0E, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x35A4E900, 
                                0x35A4E900
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0F, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x29B92700, 
                                0x29B92700
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x10, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x1DCD6500, 
                                0x1DCD6500
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x11, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x17D78400, 
                                0x17D78400
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x12, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x11E1A300, 
                                0x11E1A300
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x13, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x0BEBC200, 
                                0x0BEBC200
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x14, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x05F5E100, 
                                0x05F5E100
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x15, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }
            }, 

            Package (0x06)
            {
                "COMPONENT", 
                One, 
                Package (0x11)
                {
                    "FSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_CAMSS_TOP", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_CAMSS_VFE0", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_CAMSS_VFE1", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_CAMSS_CPP", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_jpeg0_clk", 
                            0x09, 
                            0x12
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_jpeg0_clk", 
                            0x09, 
                            0x14
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_axi", 
                            0x4B00
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_ahb", 
                            0x9C40
                        }
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            One, 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_top_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_jpeg0_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_jpeg_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_jpeg_axi_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            Zero, 
                            0x02
                        }
                    }
                }, 

                Package (0x10)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "mmss_camss_ahb_clk", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "mmss_camss_top_ahb_clk", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "mmss_camss_jpeg0_clk", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "mmss_camss_jpeg_ahb_clk", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "mmss_camss_jpeg_axi_clk", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            One, 
                            0x03
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_jpeg0_clk", 
                            0x09, 
                            0x15
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_jpeg0_clk", 
                            0x09, 
                            0x13
                        }
                    }, 

                    Package (0x02)
                    {
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_CAMSS_CPP", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_CAMSS_VFE1", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_CAMSS_VFE0", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_CAMSS_TOP", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_ahb", 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_axi", 
                            Zero
                        }
                    }
                }, 

                Package (0x05)
                {
                    "PSTATE_SET", 
                    Zero, 
                    Package (0x03)
                    {
                        "PSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_jpeg0_clk", 
                                0x03, 
                                0x1C9C3800, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_jpeg0_clk", 
                                0x03, 
                                0x1312D000, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x02, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_jpeg0_clk", 
                                0x03, 
                                0x047868C0, 
                                0x03
                            }
                        }
                    }
                }, 

                Package (0x06)
                {
                    "PSTATE_SET", 
                    One, 
                    Package (0x03)
                    {
                        "PSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_JPEG", 
                                "ICBID_SLAVE_EBI1", 
                                0x376EAC80, 
                                0x376EAC80
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_JPEG", 
                                "ICBID_SLAVE_EBI1", 
                                0x2625A000, 
                                0x2625A000
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x02, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_JPEG", 
                                "ICBID_SLAVE_EBI1", 
                                0x07A12000, 
                                0x07A12000
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_JPEG", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }
            }
        }, 

        Package (0x03)
        {
            "DEVICE", 
            "\\_SB.CAMP", 
            Package (0x05)
            {
                "COMPONENT", 
                Zero, 
                Package (0x12)
                {
                    "FSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_axi", 
                            0x4B00
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_ahb", 
                            0x9C40
                        }
                    }, 

                    Package (0x02)
                    {
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_CAMSS_TOP", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_top_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_cci_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_cci_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x11, 
                            One, 
                            One, 
                            One, 
                            0x03, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x12, 
                            One, 
                            One, 
                            One, 
                            0x03, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x13, 
                            One, 
                            One, 
                            One, 
                            0x03, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x14, 
                            One, 
                            One, 
                            One, 
                            0x03, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x1C, 
                            One, 
                            One, 
                            One, 
                            0x03, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x0D, 
                            One, 
                            One, 
                            One, 
                            Zero, 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x0E, 
                            One, 
                            One, 
                            One, 
                            Zero, 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x0F, 
                            One, 
                            One, 
                            One, 
                            Zero, 
                            0x02
                        }
                    }
                }, 

                Package (0x11)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x0F, 
                            Zero, 
                            Zero, 
                            Zero, 
                            One, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x0E, 
                            Zero, 
                            Zero, 
                            Zero, 
                            One, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x0D, 
                            Zero, 
                            Zero, 
                            Zero, 
                            One, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x14, 
                            Zero, 
                            Zero, 
                            Zero, 
                            One, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x13, 
                            Zero, 
                            Zero, 
                            Zero, 
                            One, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x12, 
                            Zero, 
                            Zero, 
                            Zero, 
                            One, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x11, 
                            Zero, 
                            Zero, 
                            Zero, 
                            One, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x1C, 
                            Zero, 
                            Zero, 
                            Zero, 
                            One, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "mmss_camss_cci_ahb_clk", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "mmss_camss_cci_clk", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "mmss_camss_ahb_clk", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x02)
                        {
                            "mmss_camss_top_ahb_clk", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_ahb", 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_axi", 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_CAMSS_TOP", 
                            0x02
                        }
                    }
                }, 

                Package (0x04)
                {
                    "PSTATE_SET", 
                    Zero, 
                    Package (0x03)
                    {
                        "PSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_cci_clk", 
                                0x03, 
                                0x0124F800, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_cci_clk", 
                                0x03, 
                                0x0237A080, 
                                0x03
                            }
                        }
                    }
                }
            }
        }, 

        Package (0x09)
        {
            "DEVICE", 
            "\\_SB.MPCS", 
            Package (0x04)
            {
                "COMPONENT", 
                Zero, 
                Package (0x0D)
                {
                    "FSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            0x09, 
                            0x12
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            0x09, 
                            0x14
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            0x09, 
                            0x12
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            0x09, 
                            0x14
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi0_clk", 
                            0x08, 
                            0x0F424000, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_cphy_csid0_clk", 
                            0x08, 
                            0x0F424000, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi0pix_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi0rdi_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi0_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }
                }, 

                Package (0x0D)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi0_ahb_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi0rdi_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi0pix_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_cphy_csid0_clk", 
                            0x0C, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi0_clk", 
                            0x0C, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            0x09, 
                            0x15
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            0x09, 
                            0x13
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            0x09, 
                            0x15
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            0x09, 
                            0x13
                        }
                    }
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                One, 
                Package (0x0D)
                {
                    "FSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            0x09, 
                            0x12
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            0x09, 
                            0x14
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            0x09, 
                            0x12
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            0x09, 
                            0x14
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi1_clk", 
                            0x08, 
                            0x0F424000, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_cphy_csid1_clk", 
                            0x08, 
                            0x0F424000, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi1pix_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi1rdi_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi1_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }
                }, 

                Package (0x0D)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi1_ahb_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi1rdi_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi1pix_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_cphy_csid1_clk", 
                            0x0C, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi1_clk", 
                            0x0C, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            0x09, 
                            0x15
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            0x09, 
                            0x13
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            0x09, 
                            0x15
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            0x09, 
                            0x13
                        }
                    }
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x02, 
                Package (0x0D)
                {
                    "FSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            0x09, 
                            0x12
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            0x09, 
                            0x14
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            0x09, 
                            0x12
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            0x09, 
                            0x14
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi2_clk", 
                            0x08, 
                            0x0F424000, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_cphy_csid2_clk", 
                            0x08, 
                            0x0F424000, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi2pix_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi2rdi_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi2_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }
                }, 

                Package (0x0D)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi2_ahb_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi2rdi_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi2pix_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_cphy_csid2_clk", 
                            0x0C, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi2_clk", 
                            0x0C, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            0x09, 
                            0x15
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            0x09, 
                            0x13
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            0x09, 
                            0x15
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            0x09, 
                            0x13
                        }
                    }
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x03, 
                Package (0x0C)
                {
                    "FSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            0x09, 
                            0x12
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            0x09, 
                            0x14
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            0x09, 
                            0x12
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            0x09, 
                            0x14
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi3_clk", 
                            0x08, 
                            0x0F424000, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi3pix_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi3rdi_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi3_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }
                }, 

                Package (0x0C)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi3_ahb_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi3rdi_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi3pix_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi3_clk", 
                            0x0C, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            0x09, 
                            0x15
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe0_clk", 
                            0x09, 
                            0x13
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            0x09, 
                            0x15
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_csi_vfe1_clk", 
                            0x09, 
                            0x13
                        }
                    }
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x04, 
                Package (0x04)
                {
                    "FSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi0phytimer_clk", 
                            0x08, 
                            0x0BEBC200, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csiphy0_clk", 
                            0x08, 
                            0x0BEBC200, 
                            One
                        }
                    }
                }, 

                Package (0x04)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csiphy0_clk", 
                            0x0C, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi0phytimer_clk", 
                            0x0C, 
                            Zero, 
                            Zero
                        }
                    }
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x05, 
                Package (0x04)
                {
                    "FSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi1phytimer_clk", 
                            0x08, 
                            0x0BEBC200, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csiphy1_clk", 
                            0x08, 
                            0x0BEBC200, 
                            One
                        }
                    }
                }, 

                Package (0x04)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csiphy1_clk", 
                            0x0C, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi1phytimer_clk", 
                            0x0C, 
                            Zero, 
                            Zero
                        }
                    }
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x06, 
                Package (0x04)
                {
                    "FSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi2phytimer_clk", 
                            0x08, 
                            0x0BEBC200, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csiphy2_clk", 
                            0x08, 
                            0x0F424000, 
                            One
                        }
                    }
                }, 

                Package (0x04)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csiphy2_clk", 
                            0x0C, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_csi2phytimer_clk", 
                            0x0C, 
                            Zero, 
                            Zero
                        }
                    }
                }
            }
        }, 

        Package (0x06)
        {
            "DEVICE", 
            "\\_SB.VFE0", 
            Package (0x06)
            {
                "COMPONENT", 
                Zero, 
                Package (0x0D)
                {
                    "FSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_axi", 
                            0x4B00
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_ahb", 
                            0x9C40
                        }
                    }, 

                    Package (0x02)
                    {
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_CAMSS_VFE0", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            One, 
                            0x03
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_top_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_vfe_vbif_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_vfe_vbif_axi_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_vfe0_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            Zero, 
                            0x05
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_vfe0_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }
                }, 

                Package (0x0D)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_vfe0_ahb_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            Zero, 
                            0x08
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_vfe0_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            One, 
                            0x15
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_vfe_vbif_axi_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_vfe_vbif_ahb_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_top_ahb_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_ahb_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_CAMSS_VFE0", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_ahb", 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_axi", 
                            Zero
                        }
                    }
                }, 

                Package (0x0B)
                {
                    "PSTATE_SET", 
                    Zero, 
                    Package (0x03)
                    {
                        "PSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_vfe0_clk", 
                                0x03, 
                                0x23C34600, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_vfe0_clk", 
                                0x03, 
                                0x22551000, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x02, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_vfe0_clk", 
                                0x03, 
                                0x1C9C3800, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_vfe0_clk", 
                                0x03, 
                                0x18148D00, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x04, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_vfe0_clk", 
                                0x03, 
                                0x16E36000, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x05, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_vfe0_clk", 
                                0x03, 
                                0x1312D000, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x06, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_vfe0_clk", 
                                0x03, 
                                0x11E1A300, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x07, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_vfe0_clk", 
                                0x03, 
                                0x0BEBC200, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x08, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_vfe0_clk", 
                                0x03, 
                                Zero, 
                                0x03
                            }
                        }
                    }
                }, 

                Package (0x18)
                {
                    "PSTATE_SET", 
                    One, 
                    Package (0x03)
                    {
                        "PSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xEE6B2800, 
                                0xEE6B2800
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xD09DC300, 
                                0xD09DC300
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x02, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xC4B20100, 
                                0xC4B20100
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xB8C63F00, 
                                0xB8C63F00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x04, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xACDA7D00, 
                                0xACDA7D00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x05, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xA0EEBB00, 
                                0xA0EEBB00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x06, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x9502F900, 
                                0x9502F900
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x07, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x89173700, 
                                0x89173700
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x08, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x7D2B7500, 
                                0x7D2B7500
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x09, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x713FB300, 
                                0x713FB300
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0A, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x6553F100, 
                                0x6553F100
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0B, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x59682F00, 
                                0x59682F00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0C, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x4D7C6D00, 
                                0x4D7C6D00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0D, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x4190AB00, 
                                0x4190AB00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0E, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x35A4E900, 
                                0x35A4E900
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0F, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x29B92700, 
                                0x29B92700
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x10, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x1DCD6500, 
                                0x1DCD6500
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x11, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x17D78400, 
                                0x17D78400
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x12, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x11E1A300, 
                                0x11E1A300
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x13, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x0BEBC200, 
                                0x0BEBC200
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x14, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x05F5E100, 
                                0x05F5E100
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x15, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }
            }, 

            Package (0x06)
            {
                "COMPONENT", 
                One, 
                Package (0x0D)
                {
                    "FSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_axi", 
                            0x4B00
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_ahb", 
                            0x9C40
                        }
                    }, 

                    Package (0x02)
                    {
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_CAMSS_VFE1", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            One, 
                            0x03
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_vfe_vbif_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_vfe_vbif_axi_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_top_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_vfe1_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            Zero, 
                            0x05
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_vfe1_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }
                }, 

                Package (0x0D)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_vfe1_ahb_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            Zero, 
                            0x08
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_vfe1_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            One, 
                            0x15
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_top_ahb_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_ahb_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_vfe_vbif_axi_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_vfe_vbif_ahb_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_CAMSS_VFE1", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_ahb", 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_axi", 
                            Zero
                        }
                    }
                }, 

                Package (0x0B)
                {
                    "PSTATE_SET", 
                    Zero, 
                    Package (0x03)
                    {
                        "PSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_vfe1_clk", 
                                0x03, 
                                0x23C34600, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_vfe1_clk", 
                                0x03, 
                                0x22551000, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x02, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_vfe1_clk", 
                                0x03, 
                                0x1C9C3800, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_vfe1_clk", 
                                0x03, 
                                0x18148D00, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x04, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_vfe1_clk", 
                                0x03, 
                                0x16E36000, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x05, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_vfe1_clk", 
                                0x03, 
                                0x1312D000, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x06, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_vfe1_clk", 
                                0x03, 
                                0x11E1A300, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x07, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_vfe1_clk", 
                                0x03, 
                                0x0BEBC200, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x08, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_vfe1_clk", 
                                0x03, 
                                Zero, 
                                0x03
                            }
                        }
                    }
                }, 

                Package (0x18)
                {
                    "PSTATE_SET", 
                    One, 
                    Package (0x03)
                    {
                        "PSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xEE6B2800, 
                                0xEE6B2800
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xD09DC300, 
                                0xD09DC300
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x02, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xC4B20100, 
                                0xC4B20100
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xB8C63F00, 
                                0xB8C63F00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x04, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xACDA7D00, 
                                0xACDA7D00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x05, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xA0EEBB00, 
                                0xA0EEBB00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x06, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x9502F900, 
                                0x9502F900
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x07, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x89173700, 
                                0x89173700
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x08, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x7D2B7500, 
                                0x7D2B7500
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x09, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x713FB300, 
                                0x713FB300
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0A, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x6553F100, 
                                0x6553F100
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0B, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x59682F00, 
                                0x59682F00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0C, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x4D7C6D00, 
                                0x4D7C6D00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0D, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x4190AB00, 
                                0x4190AB00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0E, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x35A4E900, 
                                0x35A4E900
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0F, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x29B92700, 
                                0x29B92700
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x10, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x1DCD6500, 
                                0x1DCD6500
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x11, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x17D78400, 
                                0x17D78400
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x12, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x11E1A300, 
                                0x11E1A300
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x13, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x0BEBC200, 
                                0x0BEBC200
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x14, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x05F5E100, 
                                0x05F5E100
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x15, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }
            }, 

            Package (0x07)
            {
                "COMPONENT", 
                0x02, 
                Package (0x16)
                {
                    "FSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_axi", 
                            0x4B00
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_ahb", 
                            0x9C40
                        }
                    }, 

                    Package (0x02)
                    {
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_CAMSS_CPP", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_cpp_clk", 
                            0x09, 
                            0x12
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_cpp_clk", 
                            0x09, 
                            0x14
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_cpp_axi_clk", 
                            0x09, 
                            0x12
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_cpp_axi_clk", 
                            0x09, 
                            0x14
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_micro_ahb_clk", 
                            0x09, 
                            0x12
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_micro_ahb_clk", 
                            0x09, 
                            0x14
                        }
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            One, 
                            0x04
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_top_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_cpp_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            Zero, 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_cpp_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_cpp_vbif_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_cpp_axi_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_micro_ahb_clk", 
                            0x0A, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_micro_ahb_clk", 
                            0x0B, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_micro_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }
                }, 

                Package (0x14)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_micro_ahb_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_cpp_axi_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_cpp_vbif_ahb_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_cpp_ahb_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            Zero, 
                            0x07
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_cpp_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_top_ahb_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_ahb_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "PSTATE_ADJUST", 
                        Package (0x02)
                        {
                            One, 
                            0x15
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_micro_ahb_clk", 
                            0x09, 
                            0x15
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_micro_ahb_clk", 
                            0x09, 
                            0x13
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_cpp_axi_clk", 
                            0x09, 
                            0x15
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_cpp_axi_clk", 
                            0x09, 
                            0x13
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_cpp_clk", 
                            0x09, 
                            0x15
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x03)
                        {
                            "mmss_camss_cpp_clk", 
                            0x09, 
                            0x13
                        }
                    }, 

                    Package (0x02)
                    {
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_CAMSS_CPP", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_ahb", 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_axi", 
                            Zero
                        }
                    }
                }, 

                Package (0x0A)
                {
                    "PSTATE_SET", 
                    Zero, 
                    Package (0x03)
                    {
                        "PSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_cpp_clk", 
                                0x03, 
                                0x23C34600, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_cpp_clk", 
                                0x03, 
                                0x22551000, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x02, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_cpp_clk", 
                                0x03, 
                                0x1C9C3800, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_cpp_clk", 
                                0x03, 
                                0x18148D00, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x04, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_cpp_clk", 
                                0x03, 
                                0x16E36000, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x05, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_cpp_clk", 
                                0x03, 
                                0x0BEBC200, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x06, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_cpp_clk", 
                                0x03, 
                                0x05F5E100, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x07, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "mmss_camss_cpp_clk", 
                                0x03, 
                                Zero, 
                                0x03
                            }
                        }
                    }
                }, 

                Package (0x18)
                {
                    "PSTATE_SET", 
                    One, 
                    Package (0x03)
                    {
                        "PSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xEE6B2800, 
                                0xEE6B2800
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xD09DC300, 
                                0xD09DC300
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x02, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xC4B20100, 
                                0xC4B20100
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xB8C63F00, 
                                0xB8C63F00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x04, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xACDA7D00, 
                                0xACDA7D00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x05, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0xA0EEBB00, 
                                0xA0EEBB00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x06, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x9502F900, 
                                0x9502F900
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x07, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x89173700, 
                                0x89173700
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x08, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x7D2B7500, 
                                0x7D2B7500
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x09, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x713FB300, 
                                0x713FB300
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0A, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x6553F100, 
                                0x6553F100
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0B, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x59682F00, 
                                0x59682F00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0C, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x4D7C6D00, 
                                0x4D7C6D00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0D, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x4190AB00, 
                                0x4190AB00
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0E, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x35A4E900, 
                                0x35A4E900
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x0F, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x29B92700, 
                                0x29B92700
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x10, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x1DCD6500, 
                                0x1DCD6500
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x11, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x17D78400, 
                                0x17D78400
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x12, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x11E1A300, 
                                0x11E1A300
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x13, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x0BEBC200, 
                                0x0BEBC200
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x14, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                0x05F5E100, 
                                0x05F5E100
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        0x15, 
                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_VFE", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }, 

                Package (0x04)
                {
                    "PSTATE_SET", 
                    0x02, 
                    Package (0x03)
                    {
                        "PSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/clk/mmnoc_ahb", 
                                0x00013880
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "REQUIRED_RESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/clk/mmnoc_ahb", 
                                0x9C40
                            }
                        }
                    }
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x03, 
                Package (0x0D)
                {
                    "FSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_axi", 
                            0x4B00
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_ahb", 
                            0x9C40
                        }
                    }, 

                    Package (0x02)
                    {
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_CAMSS_TOP", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_fd_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_fd_core_uar_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_fd_core_clk", 
                            0x08, 
                            0x17D78400, 
                            0x03
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_cpp_axi_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_top_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_cpp_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_cpp_vbif_ahb_clk", 
                            One, 
                            Zero, 
                            One
                        }
                    }
                }, 

                Package (0x0D)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_fd_core_clk", 
                            0x0C, 
                            Zero, 
                            0x03
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_fd_core_uar_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_fd_ahb_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_cpp_ahb_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_cpp_vbif_ahb_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_top_ahb_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_ahb_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "CLOCK", 
                        Package (0x04)
                        {
                            "mmss_camss_cpp_axi_clk", 
                            0x02, 
                            Zero, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "FOOTSWITCH", 
                        Package (0x02)
                        {
                            "VDD_CAMSS_TOP", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_ahb", 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "REQUIRED_RESOURCE", 
                        Package (0x03)
                        {
                            One, 
                            "/clk/mmnoc_axi", 
                            Zero
                        }
                    }
                }
            }
        }
    })
    Name (CPXC, Package (0x03)
    {
        Package (0x04)
        {
            "DEVICE", 
            "\\_SB.CAMS", 
            Package (0x07)
            {
                "DSTATE", 
                Zero, 
                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LVS1_A", 
                        0x04, 
                        0x001B7740, 
                        0x000186A0, 
                        One, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "PMICGPIO", 
                    Package (0x08)
                    {
                        "IOCTL_PM_GPIO_CONFIG_DIGITAL_OUTPUT", 
                        Zero, 
                        0x13, 
                        Zero, 
                        One, 
                        One, 
                        0x03, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "DELAY", 
                    Package (0x01)
                    {
                        0x0A
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "mmss_camss_mclk0_clk", 
                        0x08, 
                        0x016E3600, 
                        0x03
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "mmss_camss_ispif_ahb_clk", 
                        One, 
                        Zero, 
                        One
                    }
                }
            }, 

            Package (0x06)
            {
                "DSTATE", 
                0x03, 
                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "mmss_camss_ispif_ahb_clk", 
                        0x02, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "mmss_camss_mclk0_clk", 
                        0x0C, 
                        Zero, 
                        0x03
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LVS1_A", 
                        0x04, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "PMICGPIO", 
                    Package (0x08)
                    {
                        "IOCTL_PM_GPIO_CONFIG_DIGITAL_OUTPUT", 
                        Zero, 
                        0x13, 
                        Zero, 
                        One, 
                        Zero, 
                        0x03, 
                        Zero
                    }
                }
            }
        }, 

        Package (0x04)
        {
            "DEVICE", 
            "\\_SB.CAMF", 
            Package (0x08)
            {
                "DSTATE", 
                Zero, 
                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LVS1_A", 
                        0x04, 
                        0x001B7740, 
                        0x000186A0, 
                        One, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0A)
                    {
                        "PPP_RESOURCE_ID_LDO22_A", 
                        One, 
                        0x002AB980, 
                        0xEA60, 
                        One, 
                        Zero, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "TLMMGPIO", 
                    Package (0x06)
                    {
                        0x17, 
                        One, 
                        Zero, 
                        One, 
                        Zero, 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "DELAY", 
                    Package (0x01)
                    {
                        0x0A
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "mmss_camss_mclk2_clk", 
                        0x08, 
                        0x016E3600, 
                        0x03
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "mmss_camss_ispif_ahb_clk", 
                        One, 
                        Zero, 
                        One
                    }
                }
            }, 

            Package (0x07)
            {
                "DSTATE", 
                0x03, 
                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "mmss_camss_ispif_ahb_clk", 
                        0x02, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "mmss_camss_mclk2_clk", 
                        0x0C, 
                        Zero, 
                        0x03
                    }
                }, 

                Package (0x02)
                {
                    "TLMMGPIO", 
                    Package (0x06)
                    {
                        0x17, 
                        Zero, 
                        Zero, 
                        One, 
                        Zero, 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x0A)
                    {
                        "PPP_RESOURCE_ID_LDO22_A", 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LVS1_A", 
                        0x04, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                }
            }
        }, 

        Package (0x04)
        {
            "DEVICE", 
            "\\_SB.CAMI", 
            Package (0x07)
            {
                "DSTATE", 
                Zero, 
                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LVS1_A", 
                        0x04, 
                        0x001B7740, 
                        0x000186A0, 
                        One, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "TLMMGPIO", 
                    Package (0x06)
                    {
                        0x08, 
                        One, 
                        Zero, 
                        One, 
                        Zero, 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "DELAY", 
                    Package (0x01)
                    {
                        0x0A
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "mmss_camss_mclk1_clk", 
                        0x08, 
                        0x016E3600, 
                        0x03
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "mmss_camss_ispif_ahb_clk", 
                        One, 
                        Zero, 
                        One
                    }
                }
            }, 

            Package (0x06)
            {
                "DSTATE", 
                0x03, 
                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "mmss_camss_ispif_ahb_clk", 
                        0x02, 
                        Zero, 
                        Zero
                    }
                }, 

                Package (0x02)
                {
                    "CLOCK", 
                    Package (0x04)
                    {
                        "mmss_camss_mclk1_clk", 
                        0x0C, 
                        Zero, 
                        0x03
                    }
                }, 

                Package (0x02)
                {
                    "TLMMGPIO", 
                    Package (0x06)
                    {
                        0x08, 
                        Zero, 
                        Zero, 
                        One, 
                        Zero, 
                        0x02
                    }
                }, 

                Package (0x02)
                {
                    "PMICVREGVOTE", 
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LVS1_A", 
                        0x04, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                }
            }
        }
    })
}
