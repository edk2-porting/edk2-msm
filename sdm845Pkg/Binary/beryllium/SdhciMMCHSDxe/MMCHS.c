#include "MMCHS.h"

STATIC struct mmc_device *
PlatformCallbackInitSlot(struct mmc_config_data *config)
{
  EFI_STATUS    Status;
  BIO_INSTANCE *Instance;

  // Initialize MMC device
  struct mmc_device *dev = mmc_init(config);
  if (dev == NULL) {
    return NULL;
  }

  // Allocate instance
  Status = BioInstanceContructor(&Instance);
  if (EFI_ERROR(Status)) {
    return dev;
  }

  // Set data
  Instance->MmcDev               = dev;
  Instance->BlockMedia.BlockSize = dev->card.block_size;
  Instance->BlockMedia.LastBlock =
      dev->card.capacity / Instance->BlockMedia.BlockSize - 1;

  // Give every device a slighty different GUID
  Instance->DevicePath.Mmc.Guid.Data4[7] = config->slot;

  // Register for ExitBS event
  Status = gBS->CreateEventEx(
      EVT_NOTIFY_SIGNAL, TPL_NOTIFY, MMCHSExitBsUninit, (VOID *)Instance,
      &gEfiEventExitBootServicesGuid, &Instance->ExitBsEvent);
  ASSERT_EFI_ERROR(Status);

  // Publish BlockIO
  Status = gBS->InstallMultipleProtocolInterfaces(
      &Instance->Handle, &gEfiBlockIoProtocolGuid, &Instance->BlockIo,
      &gEfiDevicePathProtocolGuid, &Instance->DevicePath, NULL);
  ASSERT_EFI_ERROR(Status);

  return dev;
}

STATIC BIO_INSTANCE mBioTemplate = {
    BIO_INSTANCE_SIGNATURE,
    NULL, // Handle
    {
        // BlockIo
        EFI_BLOCK_IO_INTERFACE_REVISION, // Revision
        NULL,                            // *Media
        MMCHSReset,                      // Reset
        MMCHSReadBlocks,                 // ReadBlocks
        MMCHSWriteBlocks,                // WriteBlocks
        MMCHSFlushBlocks                 // FlushBlocks
    },
    {
        // BlockMedia
        BIO_INSTANCE_SIGNATURE, // MediaId
        FALSE,                  // RemovableMedia
        TRUE,                   // MediaPresent
        FALSE,                  // LogicalPartition
        FALSE,                  // ReadOnly
        FALSE,                  // WriteCaching
        0,                      // BlockSize
        4,                      // IoAlign
        0,                      // Pad
        0                       // LastBlock
    },
    {
        // DevicePath
        {
            {
                HARDWARE_DEVICE_PATH,
                HW_VENDOR_DP,
                {(UINT8)(sizeof(VENDOR_DEVICE_PATH)),
                 (UINT8)((sizeof(VENDOR_DEVICE_PATH)) >> 8)},
            },
            // Hardware Device Path for Bio
            EFI_CALLER_ID_GUID // Use the driver's GUID
        },

        {
            END_DEVICE_PATH_TYPE,
            END_ENTIRE_DEVICE_PATH_SUBTYPE,
            {sizeof(EFI_DEVICE_PATH_PROTOCOL), 0},
        },
    },
    NULL, // MMCDev
    NULL, // ExitBS Event
};

/*
 * Function: mmc_write
 * Arg     : Data address on card, data length, i/p buffer
 * Return  : 0 on Success, non zero on failure
 * Flow    : Write the data from in to the card
 */
STATIC UINT32
mmc_write(BIO_INSTANCE *Instance, UINT64 data_addr, UINT32 data_len, VOID *in)
{
  UINT32 val        = 0;
  UINT32 block_size = 0;
  UINT32 write_size = SDHCI_ADMA_MAX_TRANS_SZ;
  UINT8 *sptr       = (UINT8 *)in;

  block_size = Instance->BlockMedia.BlockSize;

  ASSERT(!(data_addr % block_size));

  if (data_len % block_size)
    data_len = ROUNDUP(data_len, block_size);

  /*
   * Flush the cache before handing over the data to
   * storage driver
   */
  arch_clean_invalidate_cache_range((addr_t)in, data_len);

  /* TODO: This function is aware of max data that can be
   * tranferred using sdhci adma mode, need to have a cleaner
   * implementation to keep this function independent of sdhci
   * limitations
   */
  while (data_len > write_size) {
    val = mmc_sdhci_write(
        Instance->MmcDev, (VOID *)sptr, (data_addr / block_size),
        (write_size / block_size));
    if (val) {
      DEBUG(
          (EFI_D_ERROR, "Failed Writing block @ %x\n",
           (UINTN)(data_addr / block_size)));
      return val;
    }
    sptr += write_size;
    data_addr += write_size;
    data_len -= write_size;
  }

  if (data_len)
    val = mmc_sdhci_write(
        Instance->MmcDev, (VOID *)sptr, (data_addr / block_size),
        (data_len / block_size));

  if (val)
    DEBUG(
        (EFI_D_ERROR, "Failed Writing block @ %x\n",
         (UINTN)(data_addr / block_size)));

  return val;
}

/*
 * Function: mmc_read
 * Arg     : Data address on card, o/p buffer & data length
 * Return  : 0 on Success, non zero on failure
 * Flow    : Read data from the card to out
 */
STATIC UINT32
mmc_read(BIO_INSTANCE *Instance, UINT64 data_addr, UINT32 *out, UINT32 data_len)
{
  UINT32 ret = 0;
  UINT32 block_size;
  UINT32 read_size = SDHCI_ADMA_MAX_TRANS_SZ;
  UINT8 *sptr      = (UINT8 *)out;

  block_size = Instance->BlockMedia.BlockSize;

  ASSERT(!(data_addr % block_size));
  ASSERT(!(data_len % block_size));

  /*
   * dma onto write back memory is unsafe/nonportable,
   * but callers to this routine normally provide
   * write back buffers. Invalidate cache
   * before read data from mmc.
   */
  arch_clean_invalidate_cache_range((addr_t)(out), data_len);

  /* TODO: This function is aware of max data that can be
   * tranferred using sdhci adma mode, need to have a cleaner
   * implementation to keep this function independent of sdhci
   * limitations
   */
  while (data_len > read_size) {
    ret = mmc_sdhci_read(
        Instance->MmcDev, (VOID *)sptr, (data_addr / block_size),
        (read_size / block_size));
    if (ret) {
      DEBUG(
          (EFI_D_ERROR, "Failed Reading block @ %x\n",
           (UINTN)(data_addr / block_size)));
      return ret;
    }
    sptr += read_size;
    data_addr += read_size;
    data_len -= read_size;
  }

  if (data_len)
    ret = mmc_sdhci_read(
        Instance->MmcDev, (VOID *)sptr, (data_addr / block_size),
        (data_len / block_size));

  if (ret)
    DEBUG(
        (EFI_D_ERROR, "Failed Reading block @ %x\n",
         (UINTN)(data_addr / block_size)));

  return ret;
}

EFI_STATUS
EFIAPI
MMCHSReset(IN EFI_BLOCK_IO_PROTOCOL *This, IN BOOLEAN ExtendedVerification)
{
  return EFI_SUCCESS;
}

EFI_STATUS
EFIAPI
MMCHSReadBlocks(
    IN EFI_BLOCK_IO_PROTOCOL *This, IN UINT32 MediaId, IN EFI_LBA Lba,
    IN UINTN BufferSize, OUT VOID *Buffer)
{
  BIO_INSTANCE *      Instance;
  EFI_BLOCK_IO_MEDIA *Media;
  EFI_TPL             OldTpl;
  UINTN               BlockSize;
  UINTN               RC;

  Instance  = BIO_INSTANCE_FROM_BLOCKIO_THIS(This);
  Media     = &Instance->BlockMedia;
  BlockSize = Media->BlockSize;

  if (MediaId != Media->MediaId) {
    return EFI_MEDIA_CHANGED;
  }

  if (Lba > Media->LastBlock) {
    return EFI_INVALID_PARAMETER;
  }

  if ((Lba + (BufferSize / BlockSize) - 1) > Media->LastBlock) {
    return EFI_INVALID_PARAMETER;
  }

  if (BufferSize % BlockSize != 0) {
    return EFI_BAD_BUFFER_SIZE;
  }

  if (Buffer == NULL) {
    return EFI_INVALID_PARAMETER;
  }

  if (BufferSize == 0) {
    return EFI_SUCCESS;
  }

  OldTpl = gBS->RaiseTPL(TPL_NOTIFY);
  RC     = mmc_read(Instance, (UINT64)Lba * BlockSize, Buffer, BufferSize);
  gBS->RestoreTPL(OldTpl);

  if (RC == 0)
    return EFI_SUCCESS;
  else
    return EFI_DEVICE_ERROR;
}

EFI_STATUS
EFIAPI
MMCHSWriteBlocks(
    IN EFI_BLOCK_IO_PROTOCOL *This, IN UINT32 MediaId, IN EFI_LBA Lba,
    IN UINTN BufferSize, IN VOID *Buffer)
{
  BIO_INSTANCE *      Instance;
  EFI_BLOCK_IO_MEDIA *Media;
  UINTN               BlockSize;
  UINTN               RC;
  EFI_TPL             OldTpl;

  Instance  = BIO_INSTANCE_FROM_BLOCKIO_THIS(This);
  Media     = &Instance->BlockMedia;
  BlockSize = Media->BlockSize;

  if (MediaId != Media->MediaId) {
    return EFI_MEDIA_CHANGED;
  }

  if (Lba > Media->LastBlock) {
    return EFI_INVALID_PARAMETER;
  }

  if ((Lba + (BufferSize / BlockSize) - 1) > Media->LastBlock) {
    return EFI_INVALID_PARAMETER;
  }

  if (BufferSize % BlockSize != 0) {
    return EFI_BAD_BUFFER_SIZE;
  }

  if (Buffer == NULL) {
    return EFI_INVALID_PARAMETER;
  }

  if (BufferSize == 0) {
    return EFI_SUCCESS;
  }

  // Here goes a fail-safe design (see issue #5)
  // Assume the partition layout before partition 36 is identical on our target
  // devices
  // Only slot 1 (eMMC) is protected
  if (Instance->MmcDev->config.slot <= 1 && (0 <= Lba && Lba <= 253951)) {
    return EFI_UNSUPPORTED;
  }

  OldTpl = gBS->RaiseTPL(TPL_NOTIFY);
  RC     = mmc_write(Instance, (UINT64)Lba * BlockSize, BufferSize, Buffer);
  gBS->RestoreTPL(OldTpl);

  if (RC == 0)
    return EFI_SUCCESS;
  else
    return EFI_DEVICE_ERROR;
}

EFI_STATUS
EFIAPI
MMCHSFlushBlocks(IN EFI_BLOCK_IO_PROTOCOL *This)
{
  // Nothing required
  return EFI_SUCCESS;
}

VOID EFIAPI MMCHSExitBsUninit(IN EFI_EVENT Event, IN VOID *Context)
{
  EFI_TPL OldTpl;

  BIO_INSTANCE *Instance = (BIO_INSTANCE *)Context;
  ASSERT(Instance != NULL);

  OldTpl = gBS->RaiseTPL(TPL_NOTIFY);

  // Put card into sleep
  mmc_put_card_to_sleep(Instance->MmcDev);

  gBS->RestoreTPL(OldTpl);
}

EFI_STATUS
BioInstanceContructor(OUT BIO_INSTANCE **NewInstance)
{
  BIO_INSTANCE *Instance;

  Instance = AllocateCopyPool(sizeof(BIO_INSTANCE), &mBioTemplate);
  if (Instance == NULL) {
    return EFI_OUT_OF_RESOURCES;
  }

  Instance->BlockIo.Media = &Instance->BlockMedia;

  *NewInstance = Instance;
  return EFI_SUCCESS;
}

EFI_STATUS
EFIAPI
MMCHSInitialize(IN EFI_HANDLE ImageHandle, IN EFI_SYSTEM_TABLE *SystemTable)
{
  // let the target register MMC devices
  LibQcomTargetMmcSdhciInit(PlatformCallbackInitSlot);

  return EFI_SUCCESS;
}
