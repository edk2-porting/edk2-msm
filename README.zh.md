# 骁龙845(sdm845)的EDK2 UEFI固件

尝试为骁龙845平台移植EDK2。

欢迎PR新设备和设备树或ACPI的修复！

![Github](https://img.shields.io/github/downloads/edk2-porting/edk2-sdm845/total)
![Github](https://img.shields.io/github/v/release/edk2-porting/edk2-sdm845?include_prereleases)

## 资源

[Telegram交流群](https://t.me/joinchat/MNjTmBqHIokjweeN0SpoyA)

[Discord交流群](https://discord.gg/XXBWfag)

QQ交流群: 697666196

## 警告

**请勿尝试移植到任何的*索尼*设备**

**你的UFS会被清空!!!**


**仅支持骁龙845(sdm845)平台，不支持其它任何平台如骁龙855 (sm8150)**

**请不要在非骁龙845(sdm845)平台设备如小米MIX3 5G**

## 依赖

Ubuntu 18.04:

```bash
sudo apt update
sudo apt install build-essential uuid-dev iasl git nasm gcc-aarch64-linux-gnu abootimg python3-distutils python3-pil python3-git
```
Ubuntu 20.04同上。

## 已支持的设备

1. 小米MIX2S        (polaris)
2. 小米MIX3         (perseus)
3. 小米8            (dipper)
4. 小米PocoPhone F1 (beryllium)
5. 一加6            (enchilada)
6. 一加6T           (fajita)
7. 索尼Xperia XZ2   (akari)     (已移除)

## 构建

1.克隆此项目

```bash
git clone https://gitee.com/strongtz/edk2-sdm845.git --depth=1
```

2.编译此项目

```bash
bash build.sh --chinese --device DEVICE
```

3.启动镜像

```bash
fastboot boot boot_DEVICE.img
```

(请将DEVICE替换成你的设备代号.)

## 贡献

特别感谢[fxsheep](https://github.com/fxsheep)

感谢[Lemon1Ice](https://github.com/Lemon1Ice)提供MemoryMap

感谢[5超级菜鸟5](https://github.com/sunshuyu)以及其他人提供的ACPI表

SimpleFbDxe驱动来自imbushuo的[Lumia950XLPkg](https://github.com/WOA-Project/Lumia950XLPkg)

同样感谢[edk2 website](https://github.com/tianocore/tianocore.github.io/wiki/Using-EDK-II-with-Native-GCC#Install_required_software_from_apt)

## 简单移植教程
 WIP
