print("Hello lua!")
address=0x17FE00000
magic=0x5241
iolib=uefi.GetLib("IoLib")
for i=1,128 do
    iolib.MmioWrite16(address + (i - 1)*2, magic)
end
uefi.GetLib("ArmCacheMaintenanceLib").WriteBackInvalidateDataCacheRange(address, 128)
uefi.gRT:ResetSystem("warm", uefi.Status("success"))