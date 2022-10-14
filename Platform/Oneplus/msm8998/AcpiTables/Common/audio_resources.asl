//===========================================================================
//                           <audio_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by audio drivers.
//
//===========================================================================

Scope (\_SB.PEP0)
{
    Method (APMD, 0, NotSerialized)
    {
        Return (APCC) /* \_SB_.PEP0.APCC */
    }

    Name (APCC, Package (One)
    {
        Package (0x1A)
        {
            "DEVICE", 
            "\\_SB.ADSP.SLM1.ADCM.AUDD", 
            Package (0x05)
            {
                "COMPONENT", 
                Zero, 
                Package (0x04)
                {
                    "FSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "PMICGPIO", 
                        Package (0x08)
                        {
                            "IOCTL_PM_GPIO_CONFIG_DIGITAL_OUTPUT", 
                            Zero, 
                            0x0C, 
                            Zero, 
                            One, 
                            0x04, 
                            0x03, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "PMICVREGVOTE", 
                        Package (0x04)
                        {
                            "PPP_RESOURCE_ID_CXO_BUFFERS_DIVCLK1_A", 
                            0x06, 
                            One, 
                            Zero
                        }
                    }
                }, 

                Package (0x04)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "PMICVREGVOTE", 
                        Package (0x04)
                        {
                            "PPP_RESOURCE_ID_CXO_BUFFERS_DIVCLK1_A", 
                            0x06, 
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
                            0x0C, 
                            Zero, 
                            One, 
                            Zero, 
                            0x03, 
                            Zero
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
                            "PMICVREGVOTE", 
                            Package (0x0E)
                            {
                                "PPP_RESOURCE_ID_SMPS4_A", 
                                0x02, 
                                0x001B7740, 
                                0x000DA430, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0x05, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "PSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0E)
                            {
                                "PPP_RESOURCE_ID_SMPS4_A", 
                                0x02, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0x05, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "PREPARE_PSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "ABANDON_PSTATE", 
                        One
                    }
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                One, 
                Package (0x03)
                {
                    "FSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "PMICVREGVOTE", 
                        Package (0x08)
                        {
                            "PPP_RESOURCE_ID_BUCK_BOOST1_B", 
                            0x0C, 
                            0x00328980, 
                            One, 
                            0x02, 
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                }, 

                Package (0x03)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "PMICVREGVOTE", 
                        Package (0x08)
                        {
                            "PPP_RESOURCE_ID_BUCK_BOOST1_B", 
                            0x0C, 
                            Zero, 
                            Zero, 
                            0x02, 
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x02, 
                Package (0x03)
                {
                    "FSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "PMICVREGVOTE", 
                        Package (0x0D)
                        {
                            "PPP_RESOURCE_ID_SMPS4_A", 
                            0x001B7740, 
                            0x000DA430, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                }, 

                Package (0x03)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "PMICVREGVOTE", 
                        Package (0x0E)
                        {
                            "PPP_RESOURCE_ID_SMPS4_A", 
                            0x02, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
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
                "COMPONENT", 
                0x03, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x02)
                {
                    "FSTATE", 
                    One
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x04, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x02)
                {
                    "FSTATE", 
                    One
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x05, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x02)
                {
                    "FSTATE", 
                    One
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x06, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x02)
                {
                    "FSTATE", 
                    One
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x07, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x02)
                {
                    "FSTATE", 
                    One
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x08, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x02)
                {
                    "FSTATE", 
                    One
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x09, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x02)
                {
                    "FSTATE", 
                    One
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x0A, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x02)
                {
                    "FSTATE", 
                    One
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x0B, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x02)
                {
                    "FSTATE", 
                    One
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x0C, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x02)
                {
                    "FSTATE", 
                    One
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x0D, 
                Package (0x07)
                {
                    "FSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x3A, 
                            One, 
                            One, 
                            One, 
                            One, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x3B, 
                            One, 
                            One, 
                            One, 
                            One, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x3D, 
                            One, 
                            One, 
                            One, 
                            One, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x3C, 
                            One, 
                            One, 
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
                            0x3E, 
                            One, 
                            One, 
                            Zero, 
                            One, 
                            Zero
                        }
                    }
                }, 

                Package (0x07)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x3A, 
                            Zero, 
                            One, 
                            One, 
                            One, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x3B, 
                            Zero, 
                            One, 
                            One, 
                            One, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x3D, 
                            Zero, 
                            One, 
                            One, 
                            One, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x3C, 
                            Zero, 
                            One, 
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
                            0x3E, 
                            Zero, 
                            One, 
                            Zero, 
                            One, 
                            Zero
                        }
                    }
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x0E, 
                Package (0x05)
                {
                    "FSTATE", 
                    Zero, 
                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x3A, 
                            One, 
                            One, 
                            One, 
                            One, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x3B, 
                            One, 
                            One, 
                            One, 
                            One, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x3D, 
                            One, 
                            One, 
                            One, 
                            One, 
                            Zero
                        }
                    }
                }, 

                Package (0x05)
                {
                    "FSTATE", 
                    One, 
                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x3A, 
                            Zero, 
                            One, 
                            One, 
                            One, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x3B, 
                            Zero, 
                            One, 
                            One, 
                            One, 
                            Zero
                        }
                    }, 

                    Package (0x02)
                    {
                        "TLMMGPIO", 
                        Package (0x06)
                        {
                            0x3D, 
                            Zero, 
                            One, 
                            One, 
                            One, 
                            Zero
                        }
                    }
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x0F, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x02)
                {
                    "FSTATE", 
                    One
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x10, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x02)
                {
                    "FSTATE", 
                    One
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x11, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x02)
                {
                    "FSTATE", 
                    One
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x12, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x02)
                {
                    "FSTATE", 
                    One
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x13, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x02)
                {
                    "FSTATE", 
                    One
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x14, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x02)
                {
                    "FSTATE", 
                    One
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x15, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x02)
                {
                    "FSTATE", 
                    One
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x16, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x02)
                {
                    "FSTATE", 
                    One
                }
            }, 

            Package (0x04)
            {
                "COMPONENT", 
                0x17, 
                Package (0x02)
                {
                    "FSTATE", 
                    Zero
                }, 

                Package (0x02)
                {
                    "FSTATE", 
                    One
                }
            }
        }
    })
}
