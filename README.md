# EDK2-MSM port for Xiaomi Poco F5 (SM7475 / Marble)

This project aims to port EDK2-based UEFI firmware to the **Xiaomi Poco F5**, which is based on the **Snapdragon 7+ Gen 2 (SM7475)** SoC.  
The port is based on prior support for SM8475 SoCs from the [EDK2-MSM](https://github.com/edk2-porting/edk2-msm) project.

---

## Status

| Component         | Status        |
|------------------|----------------|
| Firmware Build    | Successful   |
| CoreDXE Boot      | Stable(?)    |
| UART Output       | Not working  |
| Display Output    | Black screen |
| USB Debug (Gadget)| Not tested   |
| Vibration Output  | Not tested   |

---

## What Has Been Done

### 1. Platform Bring-up
- Cloned and renamed SM8475 support to `Platform/Xiaomi/sm7475/`.
- Renamed and configured `.dsc`, `.fdf`, `.dec`, and other files for `sm7475` & `marble`.

### 2. `.dsc` Configuration
- Updated:
  - `PcdSystemMemorySize` to match actual RAM.
  - `PcdCoreCount`, `PcdClusterCount` using `cpuinfo`.
  - Memory base addresses using `iomem`.
- Added:
  - `SerialPortLib` → `QcomGeniSerialPortLib`
  - UART base address: `0x894000` 

### 3. Apriori Drivers
Manually extracted and included crucial DXE drivers:
- `SmemDxe`, `DalSysDxe`, `HwIODxe`
- `ChipInfoDxe`, `ClockDxe`, `PMICDxe`, `PlatformInfoDxe`, etc.

### 4. Platform Library Modifications (`Silicon/Qualcomm/sm7475/Library/`)
- **PlatformMemoryMapLib**:
  - Adjusted MMIO/heap regions to avoid memory violations.
- **PlatformPrePiLib**:
  - Confirmed UART initialization is in place.
- **marble.dec**:
  - Added:
    ```ini
    gEfiMdePkgTokenSpaceGuid.PcdUartBaseAddress|UINT32|0x894000|0
    ```
### Planned Next Steps
Test USB Gadget Console:

    Enable ConfigFS or g_serial from firmware (if possible).

    Attempt to log using dmesg | grep usb or detect /dev/ttyGS0.