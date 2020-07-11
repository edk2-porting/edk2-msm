# EDK2 UEFI Firmware For Snapdragon 845 (sdm845)

## NOTICE: This repo won't receive updates in the next 12 months because of my studying. Please join the groups below.

Attempt to create a normal EDK2 for Snapdragon 845 platform.

Pull requests for new devices and device tree or ACPI fixes are welcomed!

![Github](https://img.shields.io/github/downloads/edk2-porting/edk2-sdm845/total)
![Github](https://img.shields.io/github/v/release/edk2-porting/edk2-sdm845?include_prereleases)

## Resources

[Telegram group for edk2-porting](https://t.me/joinchat/MNjTmBqHIokjweeN0SpoyA)

QQ discussion group for edk2-porting: 697666196

## Pictures

<img src="http://sophonwu.com/blog/wp-content/uploads/2020/06/IMG_20200520_201548.jpg" alt="Windows arm64" style="zoom: 25%;" />

<img src="http://sophonwu.com/blog/wp-content/uploads/2020/06/IMG_20200521_171520-1152x1536.jpg" alt="Ubuntu 20.04" style="zoom:25%;" />



## Dependencies

Ubuntu 18.04:

```bash
sudo apt update
sudo apt install build-essential uuid-dev iasl git nasm python3-distutils gcc-aarch64-linux-gnu abootimg
```
Ubuntu 20.04 is also proved to be fine.


## Building

1.Clone edk2 and edk2-platforms (Place three directories side by side.)

edk2:
```
commit:3a3713e62cfad00d78bb938b0d9fb1eedaeff314
```

edk2-platforms:
```
commit:cfdc7f907d545b14302295b819ea078bc36c6a40
```

```bash
mkdir workspace-edk2
cd workspace-edk2
git clone https://github.com/tianocore/edk2.git -o 3a3713e62cfad00d78bb938b0d9fb1eedaeff314 --recursive --depth=1
git clone https://github.com/tianocore/edk2-platforms.git -o cfdc7f907d545b14302295b819ea078bc36c6a40 --recursive --depth=1
```

2.Clone this project

```bash
git clone https://github.com/edk2-porting/edk2-sdm845.git
```

3.Initialize environment

```bash
cd edk2-sdm845
bash firstrun.sh
```

4.Build this project
```bash
bash build_*.sh
```
5.Debug and use

```bash
fastboot boot boot_*.img
```

## Credits

Special thanks to [fxsheep](https://github.com/fxsheep)

MemoryMap thanks to [Lemon1Ice](https://github.com/Lemon1Ice).

ACPI tables thanks to [5超级菜鸟5](https://github.com/sunshuyu) and many other people related.

SimpleFbDxe driver is from imbushuo's [Lumia950XLPkg](https://github.com/WOA-Project/Lumia950XLPkg).

Also thanks to [edk2 website](https://github.com/tianocore/tianocore.github.io/wiki/Using-EDK-II-with-Native-GCC#Install_required_software_from_apt).

## Simple Porting Guide (Chinese)
 http://sophonwu.com/blog/?p=85