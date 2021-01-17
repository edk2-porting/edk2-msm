# EDK2 UEFI Firmware For Snapdragon 845 (sdm845)

Attempt to create a normal EDK2 for Snapdragon 845 platform.

Pull requests for new devices and device tree or ACPI fixes are welcomed!

![Github](https://img.shields.io/github/downloads/edk2-porting/edk2-sdm845/total)
![Github](https://img.shields.io/github/v/release/edk2-porting/edk2-sdm845?include_prereleases)

## Resources

[Telegram group (recommended)](https://t.me/joinchat/MNjTmBqHIokjweeN0SpoyA)

[Discord group](https://discord.gg/XXBWfag)

QQ group: 697666196

## WARNING

**DO NOT EVER TRY TO PORT IT TO *SONY* DEVICES**

**YOUR UFS WILL BE WIPED CLEAN!!!**


**This repo only supports Snapdragon 845 (sdm845) and does not support others such as Snapdragon 855 (sm8150)**

**Do not try to run on other non sdm845 devices such as Xiaomi MIX3 5G**

## Dependencies

Ubuntu 18.04:

```bash
sudo apt update
sudo apt install build-essential uuid-dev iasl git nasm gcc-aarch64-linux-gnu abootimg python3-distutils python3-pil python3-git
```
Ubuntu 20.04 is also proved to be fine.

## Supported devices

1. Xiaomi MIX 2S       (polaris)
2. Xiaomi MIX 3        (perseus)
3. Xiaomi MI 8         (dipper)
4. Xiaomi PocoPhone F1 (beryllium)
5. OnePlus 6           (enchilada)
6. OnePlus 6T          (fajita)
7. Sony Xperia XZ2     (akari)     (Removed)

## Building

1.Clone this project

```bash
git clone https://github.com/edk2-porting/edk2-sdm845.git --recursive --depth=1
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

Special thanks to [fxsheep](https://github.com/fxsheep)

MemoryMap thanks to [Lemon1Ice](https://github.com/Lemon1Ice).

ACPI tables thanks to [sunshuyu](https://github.com/sunshuyu) and many other people related.

SimpleFbDxe driver is from imbushuo's [Lumia950XLPkg](https://github.com/WOA-Project/Lumia950XLPkg).

Also thanks to [edk2 website](https://github.com/tianocore/tianocore.github.io/wiki/Using-EDK-II-with-Native-GCC#Install_required_software_from_apt).

## Simple Porting Guide
 WIP
