# EDK2 UEFI Firmware For Snapdragon 845 (sdm845)

![Github](https://img.shields.io/github/downloads/edk2-porting/edk2-sdm845/total)
![Github](https://img.shields.io/github/v/release/edk2-porting/edk2-sdm845?include_prereleases)

A broken but working EDK2 implementation for Snapdragon 845 platform.

[Chinese version (中文版)](https://github.com/edk2-porting/edk2-sdm845/blob/master/README.zh.md)

## Resources

[Telegram group (recommended)](https://t.me/joinchat/MNjTmBqHIokjweeN0SpoyA)

[Discord group](https://discord.gg/XXBWfag)

QQ group: 697666196 (Main group)

QQ group: 737223105 (Linux/edk2)

[Windows Drivers](https://github.com/edk2-porting/WOA-Drivers)

[Useless documents](https://renegade-doc.readthedocs.io/en/latest/index.html)

## WARNING

**DO NOT EVER TRY TO PORT IT TO *SONY* DEVICES**

**YOUR UFS WILL BE WIPED CLEAN!!!**

## Supported devices

1. Xiaomi MIX 2S       (polaris)
2. Xiaomi MIX 3        (perseus)
3. Xiaomi MI 8         (dipper)
4. Xiaomi PocoPhone F1 (beryllium)
5. OnePlus 6           (enchilada)
6. OnePlus 6T          (fajita)
7. Nubia X             (nx616j)
8. Meizu 16th          (m1882)
9. BlackShark One      (skr-a0)
10. LG G7              (judyln)         (Will automatically restart)
11. Samsung Galaxy S9+ (star2qltechn)   (May wipe your UFS)
12. Xiaomi MI 7        (dipper-old)
13. OPPO Find X        (pafm00)
14. Smartisan R1       (trident)
15. Nokia9 PureView    (olympic)

## Dependencies

For Ubuntu 20.04:

```bash
sudo apt update
sudo apt upgrade
sudo apt install build-essential uuid-dev iasl git nasm gcc-aarch64-linux-gnu abootimg python3-distutils python3-pil python3-git
```

## Building

1.Clone this project (no need for recursive)

```bash
git clone https://github.com/edk2-porting/edk2-sdm845.git --depth=1
cd edk2-sdm845
```

2.Build this project

```bash
bash build.sh --device DEVICE
```

3.Boot the image

```bash
fastboot boot boot_DEVICE.img
```

(DEVICE is the codename of your phone.)

Additionally, you can flash the image to recovery to achieve dual-boot.

```bash
fastboot flash recovery boot_DEVICE.img
```

## Credits

@fxsheep for his original `edk2-sagit`

@strongtz for the creating and maintaining the whole Renegade Project

@BigfootACA for build script

@lemon1ice and NTAuthority for guidance and some blobs

@wetdreams and TAOCroatia for working hard on testing and debugging

@NekokeCore for fixing MemoryMap

## Porting Guide

[edk2-sdm845 Porting Guide](https://renegade-doc.readthedocs.io/en/latest/edk2/port.html).

## License

This project is released under the [WTFPL LICENSE](http://www.wtfpl.net/).
