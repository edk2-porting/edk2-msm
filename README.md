# EDK2 UEFI Firmware For Snapdragon 845 (sdm845)

![Github](https://img.shields.io/github/downloads/edk2-porting/edk2-sdm845/total)
![Github](https://img.shields.io/github/v/release/edk2-porting/edk2-sdm845?include_prereleases)

EDK2 implementation for Snapdragon 845 platform.

[Chinese version (中文版)](https://github.com/edk2-porting/edk2-sdm845/blob/master/README.zh.md)

## Resources

[Telegram group](https://t.me/joinchat/MNjTmBqHIokjweeN0SpoyA)

[Discord group](https://discord.gg/XXBWfag)

QQ chinese group:
[697666196 (Renegade-Project OffTopic 1)](https://jq.qq.com/?_wv=1027&k=JbOy29zv)
[996450026 (Renegade-Project OffTopic 2)](https://jq.qq.com/?_wv=1027&k=16xaDJnU)
[996450026 (Renegade-Project OffTopic 3)](https://jq.qq.com/?_wv=1027&k=o9jN36Nn)
[996450026 (Renegade-Project OffTopic 4)](https://jq.qq.com/?_wv=1027&k=YxXrIR7s)
[737223105 (Renegade-Project Linux/edk2)](https://jq.qq.com/?_wv=1027&k=KsQdNXl6)

[Windows Drivers](https://github.com/edk2-porting/WOA-Drivers)

[Project website](https://renegade-project.org/)

[Project forum](https://forum.renegade-project.org/)

## WARNING

**DO NOT EVER TRY TO PORT IT TO *SONY* and *GOOGLE* DEVICES**

**YOUR UFS WILL BE WIPED CLEAN!!!**

## Supported devices

1.  OnePlus 6                 (enchilada)
2.  OnePlus 6T                (fajita)
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
19. AYN Odin Handheld         (odin-base)
20. ZTE Axon 9 Pro            (akershus)
21. Xiaomi MI 8 UD            (equuleus)

## Dependencies

For Windows/MacOS/Other Linux distributions:

Install Docker manually or use an Ubuntu virtual machine

For Ubuntu 20.04:

```bash
sudo apt update
sudo apt upgrade
sudo apt install build-essential uuid-dev iasl git nasm gcc-aarch64-linux-gnu abootimg python3-distutils python3-pil python3-git gettext
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

## Credits

`fxsheep` for his original `edk2-sagit`

`strongtz` for maintaining Renegade Project

`BigfootACA` for build script

`Lemon_Ice` and `NTAuthority` for guidance and some blobs

`@Freak2112`, `TAO_Croatia` and `废物` for working hard on testing and debugging

`NekokeCore` for fixing MemoryMap
