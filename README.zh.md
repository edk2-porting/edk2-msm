# 骁龙845(sdm845)的EDK2 UEFI固件

![Github](https://img.shields.io/github/downloads/edk2-porting/edk2-sdm845/total)
![Github](https://img.shields.io/github/v/release/edk2-porting/edk2-sdm845?include_prereleases)

**在编译该项目前，请确定你有一定的Linux常识，以下步骤已经是最简单的方法，如果你看不懂，那么请使用Releases中的编译成品**

## 资源

[Telegram英语交流群](https://t.me/joinchat/MNjTmBqHIokjweeN0SpoyA)

[Discord英语交流群](https://discord.gg/XXBWfag)

QQ中文交流群:

[697666196 (Renegade-Project OffTopic 1)](https://jq.qq.com/?_wv=1027&k=JbOy29zv)

[996450026 (Renegade-Project OffTopic 2)](https://jq.qq.com/?_wv=1027&k=16xaDJnU)

[543536453 (Renegade-Project OffTopic 3)](https://jq.qq.com/?_wv=1027&k=o9jN36Nn)

[390610032 (Renegade-Project OffTopic 4)](https://jq.qq.com/?_wv=1027&k=YxXrIR7s)

[737223105 (Renegade-Project Linux/edk2)](https://jq.qq.com/?_wv=1027&k=KsQdNXl6)

991796138（屁眼通红群，请勿进入）
766060878（核心管理群，暂不开放）

[Windows 驱动](https://github.com/edk2-porting/WOA-Drivers)

[项目官网](https://renegade-project.org/)

[项目论坛](https://forum.renegade-project.org/)

## 警告

**该仓库禁止用于任何商业用途**

**如果要重分发，你需要保证用户可以获取更新**

**请勿尝试移植到任何索尼和谷歌设备上**

**你的UFS会被清空!!!**

## 已支持的设备

参阅[Windows设备支持状态](https://renegade-project.org/#/zh/windows/state-frame.html)

## 依赖

Windows/MacOS/其它Linux发行版:

手动安装Docker或者使用Ubuntu虚拟机

Ubuntu 20.04:

```bash
sudo apt update
sudo apt upgrade
sudo apt install build-essential uuid-dev iasl git nasm gcc-aarch64-linux-gnu python3-distutils python3-pil python3-git gettext
```

如果你的编译器为 GCC 11+, 请手动修改 `edk2/BaseTools/Source/C/Makefiles/header.makefile`

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

## 构建

**不建议使用Ubuntu 18.04版本，请使用Ubuntu 20.04**

1.克隆此项目（默认使用国内cnpmjs.org镜像加速）

```bash
git clone https://github.com.cnpmjs.org/edk2-porting/edk2-sdm845.git --depth=1
cd edk2-sdm845
```

2.1 编译此项目（默认使用cnpmjs加速submodule克隆，若不需要请删去 `--chinese`）

```bash
bash build.sh --chinese --device DEVICE
```

2.2 如果你使用MacOS/Windows，则可以借助Docker编译

````bash
docker-compose run edk2 ./build.sh -d DEVICE
````

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

感谢`fxsheep`的`edk2-sagit`

感谢`strongtz`维护Renegade Project

感谢`BigfootACA`的编译脚本

感谢`Lemon_Ice`和`NTAuthority`提供指导以及一些有用的blob

感谢`@Freak2112`, `TAO_Croatia`和`废物`的实机调试

感谢`NekokeCore`参与了MemoryMap的修复
