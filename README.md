# EDK2 UEFI Firmware For Snapdragon 845 (sdm845)

Attempt to create a normal EDK2 for Snapdragon 845 platform.

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
git clone https://github.com/tianocore/edk2.git --recursive
git clone https://github.com/tianocore/edk2-platforms.git
cd edk2
git checkout 3a3713e62cfad00d78bb938b0d9fb1eedaeff314
cd ..
cd edk2-platforms
git checkout cfdc7f907d545b14302295b819ea078bc36c6a40
```

2.Clone this project
```
git clone https://github.com/NekokeCore/edk2-dipper.git
```

3.Build eenvironment
```
cd edk2-dipper
mkdir workspace
bash firstrun.sh
```

4.Build this project
```
bash build.sh
```
5.Debug and use
```
fastboot boot uefi.img
```

## Credits

MemoryMap thanks [Lemon1Ice](https://github.com/Lemon1Ice).

ACPI etc. tables thanks [5超级菜鸟5](https://github.com/sunshuyu)

SimpleFbDxe screen driver is from imbushuo's [Lumia950XLPkg](https://github.com/WOA-Project/Lumia950XLPkg).

Also thanks [edk2 website](https://github.com/tianocore/tianocore.github.io/wiki/Using-EDK-II-with-Native-GCC#Install_required_software_from_apt).
