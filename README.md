# EDK2 UEFI Firmware For Snapdragon 845 (sdm845)

Attempt to create a normal EDK2 for Snapdragon 845 platform.

## Resources

[Telegram group for edk2-porting](https://t.me/joinchat/MNjTmBqHIokjweeN0SpoyA)

QQ discussion group for edk2-porting: 697666196

## Dependencies

Ubuntu 18.04:

```
sudo apt update
sudo apt install build-essential uuid-dev iasl git nasm python3-distutils gcc-aarch64-linux-gnu
```
Or
```
sudo apt update
sudo apt install build-essential
sudo apt install uuid-dev
sudo apt install iasl
sudo apt install git
sudo apt install nasm
sudo apt install python3-distutils
sudo apt install gcc-aarch64-linux-gnu
```


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

```
mkdir workspaceedk2
cd workspaceedk2
git clone https://github.com/tianocore/edk2.git -o 3a3713e62cfad00d78bb938b0d9fb1eedaeff314 --recursive --depth=1
git clone https://github.com/tianocore/edk2-platforms.git -o cfdc7f907d545b14302295b819ea078bc36c6a40 --recursive --depth=1
```

2.Clone this project
```
git clone https://github.com/edk2-porting/edk2-sdm845.git
```

3.Build eenvironment
```
cd edk2-sdm845
bash firstrun.sh
```

4.Build this project
```
bash build_*.sh
```
5.Debug and use
```
fastboot boot boot_*.img
```

## Credits

MemoryMap thanks to [Lemon1Ice](https://github.com/Lemon1Ice).

ACPI etc. tables thanks to [5超级菜鸟5](https://github.com/sunshuyu)

SimpleFbDxe screen driver is from imbushuo's [Lumia950XLPkg](https://github.com/WOA-Project/Lumia950XLPkg).

Also thanks to [edk2 website](https://github.com/tianocore/tianocore.github.io/wiki/Using-EDK-II-with-Native-GCC#Install_required_software_from_apt).
