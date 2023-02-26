#ifndef _SOC_SMBIOS_INFO_LIB_H_
#define _SOC_SMBIOS_INFO_LIB_H_
#include <Base.h>
#include <Protocol/Smbios.h>

typedef EFI_STATUS EFIAPI (*SMBIOS_LOG_SMBIOS_DATA)(
	IN EFI_SMBIOS_TABLE_HEADER *Template,
	IN CHAR8 **StringPack,
	OUT EFI_SMBIOS_HANDLE *DataSmbiosHandle
);
VOID RegisterSOCSmbiosInfo(
	SMBIOS_LOG_SMBIOS_DATA LogSmbiosData,
	EFI_SMBIOS_HANDLE Type16
);
#endif
