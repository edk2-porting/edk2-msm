#ifndef _PLATFORM_UTILS_H_
#define _PLATFORM_UTILS_H_

#include <Library/PcdLib.h>

#define APSS_WDT_BASE 0x17c10000
#define APSS_WDT_ENABLE_OFFSET 0x8

VOID PlatformInitialize();

#endif /* _PLATFORM_UTILS_H_ */