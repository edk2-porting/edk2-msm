#ifndef _DEVICE_CONFIGURATION_MAP_H_
#define _DEVICE_CONFIGURATION_MAP_H_

#define CONFIGURATION_NAME_MAX_LENGTH 64

typedef struct {
  CHAR8                        Name[CONFIGURATION_NAME_MAX_LENGTH];
  UINT64                       Value;
} CONFIGURATION_DESCRIPTOR_EX, *PCONFIGURATION_DESCRIPTOR_EX;

static CONFIGURATION_DESCRIPTOR_EX gDeviceConfigurationDescriptorEx[] = {
	{"ConfigParameterCount", 58},
	{"NumCpusFuseAddr", 0x5C04C},
	{"EnableShell", 0x1},
	{"SharedIMEMBaseAddr", 0x146AA000},
	{"DloadCookieAddr", 0x01FD3000},
	{"DloadCookieValue", 0x10},
	{"NumCpus", 4},
	{"NumActiveCores", 8},
	{"MaxLogFileSize", 0x400000},
	{"USBHS1_Config", 0x0},
	{"UsbFnIoRevNum", 0x00010001},
	{"PwrBtnShutdownFlag", 0x0},
	{"Sdc1GpioConfigOn", 0x1E92},
	{"Sdc2GpioConfigOn", 0x1E92},
	{"Sdc1GpioConfigOff", 0xA00},
	{"Sdc2GpioConfigOff", 0xA00},
	{"EnableSDHCSwitch", 0x1},
	{"EnableUfsIOC", 0},
	{"SecurityFlag", 0xC4},
	{"TzAppsRegnAddr", 0x86d00000},
	{"TzAppsRegnSize", 0x02200000},
	{"EnableLogFsSyncInRetail", 0x0},
	{"DetectRetailUserAttentionHotkey", 0x00},
	{"DetectRetailUserAttentionHotkeyCode", 0x17},
	{"EnableOEMSetupAppInRetail", 0x0},
	{"EnableMultiThreading", 1},
	{"MaxCoreCnt", 8},
	{"EarlyInitCoreCnt", 1},
	{"EnableDisplayThread", 0},
	{"AllowNonPersistentVarsInRetail", 0x1},
	{"EnableUefiSecAppDebugLogDump", 0x0},
	{"DDRInfoNotifyFlag", 0x1},
	/* Terminator */
	{"Terminator", 0xFFFFFFFF}
};

#endif
