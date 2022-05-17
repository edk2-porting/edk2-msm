# EDK2 UEFI Firmware For Snapdragon 845 (sdm845)

![Github](https://img.shields.io/github/downloads/edk2-porting/edk2-sdm845/total)
![Github](https://img.shields.io/github/v/release/edk2-porting/edk2-sdm845?include_prereleases)

EDK2 implementation for Snapdragon 845 platform.

[Chinese version (中文版)](https://github.com/edk2-porting/edk2-sdm845/blob/master/README.zh.md)

## Resources

[Telegram group](https://t.me/joinchat/MNjTmBqHIokjweeN0SpoyA)

[Discord server](https://discord.gg/XXBWfag)

QQ chinese group:

[697666196 (Renegade-Project OffTopic 1)](https://jq.qq.com/?_wv=1027&k=JbOy29zv)

[996450026 (Renegade-Project OffTopic 2)](https://jq.qq.com/?_wv=1027&k=16xaDJnU)

[737223105 (Renegade-Project Linux/edk2)](https://jq.qq.com/?_wv=1027&k=KsQdNXl6)

[Windows Drivers](https://github.com/edk2-porting/WOA-Drivers)

[Project website](https://renegade-project.org/)

[Project forum](https://forum.renegade-project.org/)

## WARNING

**IT IS STRICTLY PROHIBITED TO USE THIS REPOSITORY FOR ANY COMMERCIAL PURPOSES**

**If you want to redistribute, you need to ensure that users can get updates**

**DO NOT EVER TRY TO PORT IT TO *SONY* and *GOOGLE* DEVICES**

**YOUR UFS WILL BE WIPED CLEAN!!!**

## Supported devices

[Windows Status Matrix](https://renegade-project.org/#/en/windows/state-frame.html)

## Dependencies

For Windows/MacOS/Other Linux distributions:

Install Docker manually or use an Ubuntu virtual machine

For Ubuntu 20.04:

```bash
sudo apt update
sudo apt upgrade
sudo apt install build-essential uuid-dev iasl git nasm gcc-aarch64-linux-gnu python3-distutils python3-pil python3-git gettext
```

If you are using GCC 11+, modify `edk2/BaseTools/Source/C/Makefiles/header.makefile`

```diff
diff --git a/BaseTools/Source/C/Makefiles/header.makefile b/BaseTools/Source/C/Makefiles/header.makefile
index 0df728f..247c917 100644
--- a/BaseTools/Source/C/Makefiles/header.makefile
+++ b/BaseTools/Source/C/Makefiles/header.makefile
@@ -92,7 +92,7 @@ BUILD_CFLAGS = -MD -fshort-wchar -fno-strict-aliasing -fwrapv \
 -Wno-unused-result -nostdlib -g
 else
 BUILD_CFLAGS = -MD -fshort-wchar -fno-strict-aliasing -fwrapv \
--fno-delete-null-pointer-checks -Wall -Werror \
+-fno-delete-null-pointer-checks -Wall \^M
 -Wno-deprecated-declarations -Wno-stringop-truncation -Wno-restrict \
 -Wno-unused-result -nostdlib -g
 endif
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
