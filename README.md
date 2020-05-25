# EDK2 UEFI Firmware For Xiaomi MI 8 (Dipper)
Attempt to create a normal EDK2 for Xiaomi MI8 - dipper.

Based on zhuowei's port for [Pixel3XL](https://github.com/Pixel3Dev/edk2-pixel3/).

[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FNekokeCore%2Fedk2-dipper.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2FNekokeCore%2Fedk2-dipper?ref=badge_shield)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FNekokeCore%2Fedk2-dipper.svg?type=small)](https://app.fossa.com/projects/git%2Bgithub.com%2FNekokeCore%2Fedk2-dipper?ref=badge_small)

## The Most Important
DO NOT FLASH THIS UEFI FIRMWARE IN YOUR MAIN PHONE !!!

It's very unstable and you may lost your data.

## Status 
 UFS WORK！

 Can boot Linux Arm

 Clock WORK!

 Test ACPI etc. tables removeed.

 And can load Windows PE.

## Dev Logs
2020.1.6 Fix 5 compiler error.

2020.1.7 Start work and successfully run on my phone.

2020.1.8 Fix Display.

2020.4.17 Fix UFS drive and Fix MemoryMap（Thanks [Lemon1Ice](https://github.com/Lemon1Ice)）.

2020.4.19 Add ACPI etc. Tables and Fix DSDT 24 Errors. （PS.The ACPI and SSDT etc. Tables Provided by [5超级菜鸟5](https://github.com/sunshuyu)

2020.4.24 Fix Clock and The Clock is work well && Add SmemDxe SPI SPMI HWIODxeDriver PmicDxe ButtonsDxe ChipInfoDxe to Binary && Add USB driver

2020.4.30 Re added MemoryMap and can boot Windows to BlueScreen（Stop Code：Memory Managent） and （Stop Code：IRQL NOT LESS OR EQUAL）

2020.5.6 Fix A Lot but Nothing.

2020.5.8 Fix A Lot but Nothing.

2020.5.10 Can boot WindowsPE . Thank for [Lemon1Ice](https://github.com/Lemon1Ice) patience and great help！

## To-Do
1.Fix fts touchscreen
2.Fix ACPI tables
3.Partition UFS
4.make USB work

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

Orther edk2 project [EngLearnsh](https://github.com/EngLearnsh/edk2-dipper).

SimpleFbDxe screen driver is from imbushuo's [Lumia950XLPkg](https://github.com/WOA-Project/Lumia950XLPkg).

Also thanks [edk2 website](https://github.com/tianocore/tianocore.github.io/wiki/Using-EDK-II-with-Native-GCC#Install_required_software_from_apt).
