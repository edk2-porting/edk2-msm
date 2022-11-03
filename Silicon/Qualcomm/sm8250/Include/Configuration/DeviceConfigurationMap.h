#ifndef _DEVICE_CONFIGURATION_MAP_H_
#define _DEVICE_CONFIGURATION_MAP_H_

#define CONFIGURATION_NAME_MAX_LENGTH 64

typedef struct {
  CHAR8                        Name[CONFIGURATION_NAME_MAX_LENGTH];
  UINT64                       Value;
} CONFIGURATION_DESCRIPTOR_EX, *PCONFIGURATION_DESCRIPTOR_EX;

static CONFIGURATION_DESCRIPTOR_EX gDeviceConfigurationDescriptorEx[] = {
	{"AllowNonPersistentVarsInRetail", 0x1},
	{"DloadCookieAddr", 0x01FD3000},
	{"DloadCookieValue", 0x10},
	{"EarlyInitCoreCnt", 1},
	{"EnableDisplayImageFv", 0x1},
	{"EnableDisplayThread", 0x1},
	{"EnableLogFsSyncInRetail", 0x1},
	{"EnableMultiThreading", 1},
	{"EnableSDHCSwitch", 0x1},
	{"EnableShell", 0x1},
	{"EnableUfsIOC", 0},
	{"EUDEnableAddr", 0x88E2000},
	{"MaxCoreCnt", 8},
	{"MaxLogFileSize", 0x400000},
	{"NumActiveCores", 8},
	{"NumCpusFuseAddr", 0x5C04C},
	{"NumCpus", 8},
	{"PwrBtnShutdownFlag", 0x0},
	{"Sdc1GpioConfigOff", 0xA00},
	{"Sdc1GpioConfigOn", 0x1E92},
	{"Sdc2GpioConfigOff", 0xA00},
	{"Sdc2GpioConfigOn", 0x1E92},
	{"SecPagePoolCount", 0x680},
	{"SecurityFlag", 0xC40},
	{"SharedIMEMBaseAddr ", 0x146BF000},
	{"ShmBridgememSize", 0xA00000},
	{"UefiMemUseThreshold", 0x77},
	{"UfsSmmuConfigForOtherBootDev", 1},
	{"UsbFnIoRevNum", 0x00010001},
	{"USBHS1_Config", 0x0},
	/* Terminator */
	{"Terminator", 0xFFFFFFFF}
};

#endif
