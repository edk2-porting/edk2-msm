#ifndef _LINUX_UTILS_H_
#define _LINUX_UTILS_H_

typedef VOID (*LINUX_KERNEL) (UINT64 ParametersBase,
                              UINT64 Reserved0,
                              UINT64 Reserved1,
                              UINT64 Reserved2);

#define LINUX_KERNEL_ARCH_MAGIC_OFFSET 0x38
#define LINUX_KERNEL_AARCH64_MAGIC 0x644D5241

VOID ContinueToLinuxIfAcquired(IN VOID *DeviceTreeLoadAddress, IN VOID *KernelLoadAddress);

#endif /* _LINUX_UTILS_H_ */