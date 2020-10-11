#ifndef _MMCHS_H_
#define _MMCHS_H_

#include <Uefi.h>

#include <Library/LKEnvLib.h>

#include <Library/BaseLib.h>
#include <Library/BaseMemoryLib.h>
#include <Library/DebugLib.h>
#include <Library/MemoryAllocationLib.h>
#include <Library/PcdLib.h>
#include <Library/QcomPlatformMmcLib.h>
#include <Library/QcomTargetMmcSdhciLib.h>
#include <Library/UefiBootServicesTableLib.h>

#include <Chipset/mmc_sdhci.h>

#include <Protocol/BlockIo.h>
#include <Protocol/DevicePath.h>

//#include "mmc_p.h"

//
// Device structures
//
typedef struct {
  VENDOR_DEVICE_PATH Mmc;
  EFI_DEVICE_PATH    End;
} MMCHS_DEVICE_PATH;

typedef struct {
  UINT32                Signature;
  EFI_HANDLE            Handle;
  EFI_BLOCK_IO_PROTOCOL BlockIo;
  EFI_BLOCK_IO_MEDIA    BlockMedia;
  MMCHS_DEVICE_PATH     DevicePath;
  struct mmc_device *   MmcDev;
  EFI_EVENT             ExitBsEvent;
} BIO_INSTANCE;

#define BIO_INSTANCE_SIGNATURE SIGNATURE_32('e', 'm', 'm', 'c')

#define BIO_INSTANCE_FROM_BLOCKIO_THIS(a)                                      \
  CR(a, BIO_INSTANCE, BlockIo, BIO_INSTANCE_SIGNATURE)

#ifdef DEBUG_SDHCI
#define DBG(...) dprintf(ALWAYS, __VA_ARGS__)
#else
#define DBG(...)
#endif

//
// Function Prototypes
//

EFI_STATUS
EFIAPI
MMCHSReset(IN EFI_BLOCK_IO_PROTOCOL *This, IN BOOLEAN ExtendedVerification);

EFI_STATUS
EFIAPI
MMCHSReadBlocks(
    IN EFI_BLOCK_IO_PROTOCOL *This, IN UINT32 MediaId, IN EFI_LBA Lba,
    IN UINTN BufferSize, OUT VOID *Buffer);

EFI_STATUS
EFIAPI
MMCHSWriteBlocks(
    IN EFI_BLOCK_IO_PROTOCOL *This, IN UINT32 MediaId, IN EFI_LBA Lba,
    IN UINTN BufferSize, IN VOID *Buffer);

EFI_STATUS
EFIAPI
MMCHSFlushBlocks(IN EFI_BLOCK_IO_PROTOCOL *This);

EFI_STATUS
BioInstanceContructor(OUT BIO_INSTANCE **NewInstance);

VOID EFIAPI MMCHSExitBsUninit(IN EFI_EVENT Event, IN VOID *Context);

/* API: to initialize the controller */
void sdhci_init(struct sdhci_host *);
/* API: Send the command & transfer data using adma */
uint32_t sdhci_send_command(struct sdhci_host *, struct mmc_command *);
/* API: Set the bus width for the contoller */
uint8_t sdhci_set_bus_width(struct sdhci_host *, uint16_t);
/* API: Clock supply for the controller */
uint32_t sdhci_clk_supply(struct sdhci_host *, uint32_t);
/* API: To enable SDR/DDR mode */
void sdhci_set_uhs_mode(struct sdhci_host *, uint32_t);
/* API: Soft reset for the controller */
void sdhci_reset(struct sdhci_host *host, uint8_t mask);

/*
 * APIS exposed to block level driver
 */
/* API: Initialize the mmc card */
struct mmc_device *mmc_init(struct mmc_config_data *);
/* API: Read required number of blocks from card into destination */
uint32_t mmc_sdhci_read(
    struct mmc_device *dev, void *dest, uint64_t blk_addr, uint32_t num_blocks);
/* API: Write requried number of blocks from source to card */
uint32_t mmc_sdhci_write(
    struct mmc_device *dev, void *src, uint64_t blk_addr, uint32_t num_blocks);
/* API: Erase len bytes (after converting to number of erase groups), from
 * specified address */
uint32_t
mmc_sdhci_erase(struct mmc_device *dev, uint32_t blk_addr, uint64_t len);
/* API: Write protect or release len bytes (after converting to number of write
 * protect groups) from specified start address*/
uint32_t mmc_set_clr_power_on_wp_user(
    struct mmc_device *dev, uint32_t addr, uint64_t len, uint8_t set_clr);
/* API: Get the WP status of write protect groups starting at addr */
uint32_t
mmc_get_wp_status(struct mmc_device *dev, uint32_t addr, uint8_t *wp_status);
/* API: Put the mmc card in sleep mode */
void mmc_put_card_to_sleep(struct mmc_device *dev);
/* API: Change the driver type of the card */
bool mmc_set_drv_type(
    struct sdhci_host *host, struct mmc_card *card, uint8_t drv_type);
/* API: Send the read & write command sequence to rpmb */
uint32_t mmc_sdhci_rpmb_send(struct mmc_device *dev, struct mmc_command *cmd);
/* API: De-init the card */
void mmc_put_card_to_sleep_disable_hc(struct mmc_device *dev);

#endif
