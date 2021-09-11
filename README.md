# EDK2 UEFI Firmware For Snapdragon 845 (sdm845)

![Github](https://img.shields.io/github/downloads/edk2-porting/edk2-sdm845/total)
![Github](https://img.shields.io/github/v/release/edk2-porting/edk2-sdm845?include_prereleases)

EDK2 implementation for Snapdragon 845 platform.

[Chinese version (中文版)](https://github.com/edk2-porting/edk2-sdm845/blob/master/README.zh.md)

## Resources

[Telegram group](https://t.me/joinchat/MNjTmBqHIokjweeN0SpoyA)

[Discord group](https://discord.gg/XXBWfag)

QQ chinese group: 697666196 (Main group)    737223105 (Linux/edk2)

[Windows Drivers](https://github.com/edk2-porting/WOA-Drivers)

[Project website](https://renegade-project.org/)

[Project forum](https://forum.renegade-project.org/)

## WARNING

**DO NOT EVER TRY TO PORT IT TO *SONY* and *GOOGLE* DEVICES**

**YOUR UFS WILL BE WIPED CLEAN!!!**

**IF YOUR DEVICE HAS A/B PARTITION LAYOUT, READ THE [A/B DEVICES](#ab-devices) SECTION!**

## Supported devices

1.  OnePlus 6                 (enchilada)   `A/B`
2.  OnePlus 6T                (fajita)      `A/B`
3.  Xiaomi MIX 3              (perseus)
4.  Xiaomi PocoPhone F1       (beryllium)
5.  Meizu 16th                (m1882)
6.  Meizu 16th Plus           (m1892)
7.  Smartisan R1              (trident)
8.  BlackShark One            (skr-a0)
9.  OPPO Find X               (pafm00)
10. Xiaomi MIX 2S             (polaris)
11. LG G7                     (judyln)
12. Samsung Galaxy S9+        (star2qltechn)
13. Xiaomi MI 7               (dipper-old)
14. Xiaomi MI 8               (dipper)
15. Nubia X                   (nx616j)
16. Nokia9 PureView           (olympic)
17. ASUS ZenFone 5Z           (draco)
18. Vivo NEX Dual Display     (pd1821)
19. ayn odin handheld         (ayn-odin)
20. ZTE Axon 9 Pro            (akershus)
21. Xiaomi MI 8 UD            (equuleus)

## Dependencies

For Windows/MacOS/Other Linux distributions:

Install Docker manually or use an Ubuntu virtual machine

For Ubuntu 20.04:

```bash
sudo apt update
sudo apt upgrade
sudo apt install build-essential uuid-dev iasl git nasm gcc-aarch64-linux-gnu abootimg python3-distutils python3-pil python3-git
```

## Building

1.Clone this project

```bash
git clone https://github.com/edk2-porting/edk2-sdm845.git --depth=1
cd edk2-sdm845
```

2.1 Build this project (only on linux)

```bash
bash build.sh --device DEVICE
```

2.2 For Macos/Windows (you can use docker)

````bash
docker-compose run edk2 ./build.sh -d DEVICE
````

3.Boot the image

```bash
fastboot boot boot_DEVICE.img
```

(DEVICE is the codename of your phone.)

Additionally, you can flash the image to recovery to achieve dual-boot.

```bash
fastboot flash recovery boot_DEVICE.img
```

## A/B Devices

This section is for devices that using A/B partitions layout such as:

1. OnePlus 6     (enchilada)
2. OnePlus 6T    (fajita)

### Pre-install Instructions

**IMPORTANT!!!** If you're about flashing EDK2 to a device that has A/B slots environment, do not rush and prepare your device first.

In some cases second inactive slot (slot where you're going to flash EDK2 generally) can be unpopulated or contain much older firmware than your active slot (slot containing your current working Android ROM), leading to various issues including a potential hard-brick. We need to ensure none of that will happen by copying the contents of active slot to inactive. **This step is NOT optional for A/B devices!**

To do this, sideload the `copy-partitions-20210323_1922.zip` package by doing the following:

1. Download the `copy-partitions-20210323_1922.zip` file from [here](assets/copy-partitions-20210323_1922.zip);
2. Sideload the `copy-partitions-20210323_1922.zip` package:
    * On the device, switch recovery to sideload mode:
      * For TWRP: select "Advanced", "ADB Sideload", then swipe to begin sideload;
      * For others look for "Apply from ADB", "Install from ADB", etc;
    * On the host machine, sideload the package using: `adb sideload copy-partitions-20210323_1922.zip`
    * Or simply copy that zip to the device and install it normally.

Now you can reboot to fastboot and flash EDK2 to second slot.

If you have Android on slot A, flash EDK2 to B:
```bash
fastboot flash boot_b boot_DEVICE.img
```
If you have Android on slot B, flash EDK2 to A:
```bash
fastboot flash boot_a boot_DEVICE.img
```

### Slot Switching

EDK2 supports switching between A/B slots in UEFI Boot Manager to achieve a dualboot between Android and EDK2:

* Press any volume key during boot to enter UEFI Menu;
* Use volume keys and power button to navigate to `Boot Manager` > `Reboot to other slot`.

From Android, you can use `bootctl` shell command to switch the active slot back to EDK2 (requires root).

## Credits

`fxsheep` for his original `edk2-sagit`

`strongtz` for maintaining Renegade Project

`BigfootACA` for build script

`Lemon_Ice` and `NTAuthority` for guidance and some blobs

`@Freak2112`, `TAO_Croatia` and `废物` for working hard on testing and debugging

`NekokeCore` for fixing MemoryMap
