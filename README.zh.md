# 骁龙845(sdm845)的EDK2 UEFI固件

![Github](https://img.shields.io/github/downloads/edk2-porting/edk2-sdm845/total)
![Github](https://img.shields.io/github/v/release/edk2-porting/edk2-sdm845?include_prereleases)

**在编译该项目前，请确定你有一定的Linux常识，以下步骤已经是最简单的方法，如果你看不懂，那么请离开**

一个针对骁龙845平台的勉强能用的EDK2 UEFI

## 资源

**群里问智障问题会被踢**

[Telegram交流群](https://t.me/joinchat/MNjTmBqHIokjweeN0SpoyA)

[Discord交流群](https://discord.gg/XXBWfag)

QQ交流群: 697666196

[Windows 驱动](https://github.com/edk2-porting/WOA-Drivers)

[没什么用的文档](https://renegade-doc.readthedocs.io/zh_CN/latest/index.html)

## 警告

**请勿尝试移植到任何索尼设备上**

**你的UFS会被清空!!!**

## 已支持的设备

此列表为能够启动进入UEFI Shell的设备

1. 小米MIX2S        (polaris)
2. 小米MIX3         (perseus)
3. 小米8            (dipper)
4. 小米PocoPhone F1 (beryllium)
5. 一加6            (enchilada)
6. 一加6T           (fajita)
7. 努比亚X          (nx616j)
8. 魅族16th         (m1882)
9. 黑鲨手机一代     (skr-a0)
10. LG G7           (judyln)            (会自动重启)
11. 三星S9+         (star2qltechn)
12. 小米7           (dipper-old)
13. OPPO Find X     (pafm00)
14. 锤子坚果R1      (trident)

## 依赖

Ubuntu 20.04:

```bash
sudo apt update
sudo apt upgrade
sudo apt install build-essential uuid-dev iasl git nasm gcc-aarch64-linux-gnu abootimg python3-distutils python3-pil python3-git
```

## 视频教程

[【UEFI】edk2-sdm845项目编译教程 - 5超级菜鸟5](https://www.bilibili.com/video/BV1ab4y197e7)

## 构建

**不建议使用Ubuntu 18.04版本，请使用Ubuntu 20.04或以上版本**

1.克隆此项目（默认使用国内fastgit镜像加速）

```bash
git clone https://hub.fastgit.org/edk2-porting/edk2-sdm845.git --depth=1
cd edk2-sdm845
```

2.编译此项目（默认使用fastgit加速submodule克隆，若不需要请删去 `--chinese`）

```bash
bash build.sh --chinese --device DEVICE
```

3.启动镜像

```bash
fastboot boot boot_DEVICE.img
```

(请将DEVICE替换成你的设备代号.)

另外，你可以将UEFI刷写至recovery分区以实现双重启动。

```bash
fastboot flash recovery boot_DEVICE.img
```

## 贡献

待填充

## 简单的适配指南

[edk2-sdm845适配指南](https://renegade-doc.readthedocs.io/zh_CN/latest/edk2/port.html).

## 开源许可证

该项目在[WTFPL LICENSE](http://www.wtfpl.net/)下发布.
