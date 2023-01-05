#// per-device BSP DXEs
#FILE DRIVER = 5bd181db-0487-4f1a-ae73-820e165611b3 {
#  SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/Devices/clover/ButtonsDxe/ButtonsDxe.depex
#  SECTION PE32 = Platform/EFI_Binaries/Drivers/Devices/clover/ButtonsDxe/ButtonsDxe.efi
#  SECTION UI = "ButtonsDxe"
#}
#
FILE DRIVER = cb29f4d1-7f37-4692-a416-93e82e219711 {
  SECTION DXE_DEPEX = Platform/EFI_Binaries/Drivers/sdm660/NpaDxe/NpaDxe.depex
  SECTION PE32 = Platform/EFI_Binaries/Drivers/sdm660/NpaDxe/NpaDxe.efi
  SECTION UI = "NpaDxe"
}

