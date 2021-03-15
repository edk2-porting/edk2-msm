# EDK2 UEFI Firmware For Snapdragon 845 (sdm845)

A broken but working EDK2 implementation for Snapdragon 845 platform.

中国人请看中文版
[Chinese version (中文版)](https://github.com/edk2-porting/edk2-sdm845/blob/master/README.zh.md)

## Resources

[Telegram group (recommended)](https://t.me/joinchat/MNjTmBqHIokjweeN0SpoyA)

[Discord group](https://discord.gg/XXBWfag)

QQ group: 697666196 (Never On-Topic)

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
