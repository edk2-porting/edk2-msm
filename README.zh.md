# 骁龙845(sdm845)的EDK2 UEFI固件

一个针对骁龙845平台的勉强能用的EDK2 UEFI

## 资源

[Telegram交流群](https://t.me/joinchat/MNjTmBqHIokjweeN0SpoyA)

[Discord交流群](https://discord.gg/XXBWfag)

QQ交流群: 697666196

[没什么用的文档](https://renegade-doc.readthedocs.io/zh_CN/latest/index.html)

## 警告

**请勿尝试移植到任何索尼设备上**

**你的UFS会被清空!!!**

## 已支持的设备

1. 小米MIX2S        (polaris)
2. 小米MIX3         (perseus)
3. 小米8            (dipper)
4. 小米PocoPhone F1 (beryllium)
5. 一加6            (enchilada)
6. 一加6T           (fajita)
7. 努比亚X          (nx616j)

## 依赖

Ubuntu 20.04:

```bash
sudo apt update
sudo apt install build-essential uuid-dev iasl git nasm gcc-aarch64-linux-gnu abootimg python3-distutils python3-pil python3-git
```

## 构建

1.克隆此项目（默认使用国内fastgit镜像加速）

```bash
git clone https://hub.fastgit.org/edk2-porting/edk2-sdm845.git --depth=1
```

2.编译此项目（默认使用fastgit加速submodule克隆）

```bash
bash build.sh --chinese --device DEVICE
```

3.启动镜像

```bash
fastboot boot boot_DEVICE.img
```

(请将DEVICE替换成你的设备代号.)

## 贡献

待填充

## 简单的适配指南

[edk2-sdm845适配指南](https://renegade-doc.readthedocs.io/zh_CN/latest/edk2/port.html).

## 开源许可证

该项目在[WTFPL LICENSE](http://www.wtfpl.net/)下发布.
