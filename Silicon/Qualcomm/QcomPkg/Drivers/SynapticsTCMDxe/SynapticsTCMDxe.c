#include <Uefi.h>

#include <Library/MemoryAllocationLib.h>
#include <Library/BaseMemoryLib.h>
#include <Library/PcdLib.h>
#include <Library/UefiBootServicesTableLib.h>
#include <Library/UefiLib.h>
#include <Library/DebugLib.h>

#include <Protocol/AbsolutePointer.h>
#include <Protocol/EFITlmm.h>
#include <Protocol/EFII2C.h>

#include "SynapticsTCM.h"

// Instance Template
TCM_INTERNAL_DATA mInstanceTemplate = {
    TCM_TCH_INSTANCE_SIGNATURE,
    0,
    0,
    {
        AbsPReset,
        AbsPGetState,
        NULL,
        NULL,
    },
    {
        0,
        0,
        0,
        0,
        0,
        0,
        0,
    },
    NULL,
    FALSE,
    0,
    0,
    0,
    NULL,
    FALSE,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    0,
    0,
    0,
}, *gI2CInstance;

// Binding
EFI_DRIVER_BINDING_PROTOCOL gTCMDriverBinding = {
    TCMAbsolutePointerDriverBindingSupported,
    TCMAbsolutePointerDriverBindingStart,
    TCMAbsolutePointerDriverBindingStop,
    0x1,
    NULL,
    NULL,
};

static SYNAPTICS_I2C_DEVICE *gTCMI2cDeviceIo = NULL;
STATIC EFI_EVENT        ExitBootServicesEvent;

EFI_STATUS
EFIAPI
TCMAbsolutePointerDriverBindingSupported(
    IN EFI_DRIVER_BINDING_PROTOCOL *This, IN EFI_HANDLE Controller,
    IN EFI_DEVICE_PATH_PROTOCOL *RemainingDevicePath)
{
  EFI_STATUS            Status;
  SYNAPTICS_I2C_DEVICE *TCMI2cDeviceIo;

  Status = gBS->OpenProtocol(
      Controller, &gSynapticsTouchDeviceProtocolGuid, (VOID **)&TCMI2cDeviceIo,
      This->DriverBindingHandle, Controller, EFI_OPEN_PROTOCOL_BY_DRIVER);

  if (EFI_ERROR(Status)) {
    return Status;
  }

  Status = EFI_SUCCESS;
  gBS->CloseProtocol(
      Controller, &gSynapticsTouchDeviceProtocolGuid, This->DriverBindingHandle,
      Controller);

  return Status;
}

EFI_STATUS
EFIAPI
TCMAbsolutePointerDriverBindingStart(
    IN EFI_DRIVER_BINDING_PROTOCOL *This, IN EFI_HANDLE Controller,
    IN EFI_DEVICE_PATH_PROTOCOL *RemainingDevicePath)
{
  EFI_TPL               OldTpl;
  EFI_STATUS            Status;
  I2C_STATUS            I2CStatus;
  SYNAPTICS_I2C_DEVICE *TCMI2cDeviceIo;
  TCM_INTERNAL_DATA *  Instance;
  BOOLEAN               bI2COpened = FALSE;

  OldTpl = gBS->RaiseTPL(TPL_CALLBACK);
  Status = gBS->OpenProtocol(
      Controller, &gSynapticsTouchDeviceProtocolGuid, (VOID **)&TCMI2cDeviceIo,
      This->DriverBindingHandle, Controller, EFI_OPEN_PROTOCOL_BY_DRIVER);
  if (EFI_ERROR(Status)) {
    goto exit;
  }

  Instance = AllocateCopyPool(sizeof(TCM_INTERNAL_DATA), &mInstanceTemplate);
  ASSERT(Instance != NULL);
  ASSERT(TCMI2cDeviceIo != NULL);

  Instance->TCMDevice                  = TCMI2cDeviceIo;
  Instance->AbsPointerMode.AbsoluteMaxX = TCMI2cDeviceIo->XMax - TCMI2cDeviceIo->XMin;
  Instance->AbsPointerMode.AbsoluteMaxY = TCMI2cDeviceIo->YMax - TCMI2cDeviceIo->YMin;
  Instance->AbsPointerProtocol.Mode     = &Instance->AbsPointerMode;
  I2CStatus = TCMI2cDeviceIo->I2cQupProtocol->Open(
    Instance->TCMDevice->ControllerI2cDevice,
    &Instance->I2cController);

  if (I2C_ERROR(I2CStatus)) {
    DEBUG((EFI_D_ERROR,
      "SynapticsTouchDxe: Failed to open I2C%d: %d \n",
      Instance->TCMDevice->ControllerI2cDevice,
      I2CStatus));
    Status = EFI_DEVICE_ERROR;
    goto exit;
  }

  bI2COpened = TRUE;

  gTCMI2cDeviceIo = TCMI2cDeviceIo;
  gI2CInstance = Instance;

  Status = SynaPowerUpController(Instance);
  if (EFI_ERROR(Status)) {
    DEBUG((EFI_D_ERROR, "SynapticsTouchDxe: Failed to power on controller: %r\n", Status));
    goto exit;
  }

  Status = SynaGetTouchData(Instance, NULL, NULL);
  if (EFI_ERROR(Status)) {
    DEBUG((EFI_D_ERROR,
      "SynapticsTouchDxe: Failed to read id packet: %d\n",
      Status));
    Status = EFI_DEVICE_ERROR;
    goto exit;
  }

  // Flag device as initialized
  Instance->Initialized = TRUE;

  Instance->ConfigData = AllocateZeroPool(sizeof(TCM_BUFFER));
  if(Instance->ConfigData == NULL) {
    DEBUG((EFI_D_ERROR,
      "SynapticsTouchDxe: Failed to allocate pool for report config: %d\n",
      Status));
    Status = EFI_OUT_OF_RESOURCES;
    goto exit;
  }

  Status = TcmGetReportConfig(Instance);
  if (EFI_ERROR(Status) || Instance->ConfigData->DataLength == 0) {
    DEBUG((EFI_D_ERROR,
      "SynapticsTouchDxe: Failed to get report config: %d\n",
      Status));
    Status = EFI_DEVICE_ERROR;
    goto exit;
  }

  // Set touch event
  Status = gBS->CreateEvent(
      EVT_NOTIFY_WAIT, TPL_NOTIFY, AbsPWaitForInput, Instance,
      &Instance->AbsPointerProtocol.WaitForInput);
  ASSERT_EFI_ERROR(Status);

  // Start polling
  Status = AbsStartPolling(Instance);
  ASSERT_EFI_ERROR(Status);

  // Install protocols
  Status = gBS->InstallProtocolInterface(
      &Controller, &gEfiAbsolutePointerProtocolGuid, EFI_NATIVE_INTERFACE,
      &Instance->AbsPointerProtocol);

  if (EFI_ERROR(Status)) {
    DEBUG((EFI_D_ERROR, "SynapticsTouchDxe: Failed to install protocol interface: %r\n", Status));
  }

  // Name table
  Instance->ControllerNameTable = NULL;
  AddUnicodeString2(
      "eng", gTCMDriverComponentName.SupportedLanguages,
      &Instance->ControllerNameTable, L"Synaptics TCM Absolute Pointer", TRUE);
  AddUnicodeString2(
      "en", gTCMDriverComponentName.SupportedLanguages,
      &Instance->ControllerNameTable, L"Synaptics TCM Absolute Pointer",
      FALSE);

exit:
  if(bI2COpened == TRUE && Status == EFI_DEVICE_ERROR) {
    TCMI2cDeviceIo->I2cQupProtocol->Close(
      Instance->I2cController);
      DEBUG((EFI_D_ERROR, "SynapticsTouchDxe: Error: Closing i2c instance\n"));
  }
  gBS->RestoreTPL(OldTpl);
  return Status;
}

EFI_STATUS
EFIAPI
TCMAbsolutePointerDriverBindingStop(
    IN EFI_DRIVER_BINDING_PROTOCOL *This, IN EFI_HANDLE Controller,
    IN UINTN NumberOfChildren, IN EFI_HANDLE *ChildHandleBuffer)
{
  EFI_STATUS                     Status;
  EFI_ABSOLUTE_POINTER_PROTOCOL *AbsolutePointerProtocol;
  TCM_INTERNAL_DATA *           Instance;
  SYNAPTICS_I2C_DEVICE          *TCMI2cDeviceIo;

  Status = gBS->OpenProtocol(
      Controller, &gEfiAbsolutePointerProtocolGuid,
      (VOID **)&AbsolutePointerProtocol, This->DriverBindingHandle, Controller,
      EFI_OPEN_PROTOCOL_GET_PROTOCOL);

  if (EFI_ERROR(Status)) {
    return EFI_UNSUPPORTED;
  }

  Instance = TCM_TCH_INSTANCE_FROM_ABSTCH_THIS(AbsolutePointerProtocol);

  Status = gBS->UninstallProtocolInterface(
      Controller, &gEfiAbsolutePointerProtocolGuid,
      &Instance->AbsPointerProtocol);
  if (EFI_ERROR(Status)) {
    return Status;
  }

  gBS->CloseEvent(Instance->PollingTimerEvent);
  gBS->CloseEvent(Instance->AbsPointerProtocol.WaitForInput);

  Status = gBS->OpenProtocol(
      Controller, &gSynapticsTouchDeviceProtocolGuid, (VOID **)&TCMI2cDeviceIo,
      This->DriverBindingHandle, Controller, EFI_OPEN_PROTOCOL_BY_DRIVER);

  TCMI2cDeviceIo->I2cQupProtocol->Close(
    Instance->I2cController);
  
  DEBUG((EFI_D_ERROR, "SynapticsTouchDxe: Closing i2c instance\n"));

  return EFI_SUCCESS;
}

EFI_STATUS AbsPReset(
    IN EFI_ABSOLUTE_POINTER_PROTOCOL *This, IN BOOLEAN ExtendedVerification)
{
  TCM_INTERNAL_DATA *Instance;

  Instance               = TCM_TCH_INSTANCE_FROM_ABSTCH_THIS(This);
  Instance->LastX        = 0;
  Instance->LastY        = 0;
  Instance->StateChanged = FALSE;

  return EFI_SUCCESS;
}

EFI_STATUS AbsStartPolling(IN TCM_INTERNAL_DATA *Instance)
{
  EFI_STATUS Status = EFI_SUCCESS;

  // Set event routines
  Status = gBS->CreateEvent(
      EVT_NOTIFY_SIGNAL | EVT_TIMER, TPL_CALLBACK, SyncPollCallback, Instance,
      &Instance->PollingTimerEvent);
  ASSERT_EFI_ERROR(Status);

  Status = gBS->SetTimer(Instance->PollingTimerEvent, TimerPeriodic, 200000);
  ASSERT_EFI_ERROR(Status);

  return Status;
}

EFI_STATUS AbsPGetState(
    IN EFI_ABSOLUTE_POINTER_PROTOCOL *This,
    IN OUT EFI_ABSOLUTE_POINTER_STATE *State)
{
  EFI_STATUS          Status = EFI_SUCCESS;
  TCM_INTERNAL_DATA *Instance;

  if (This == NULL || State == NULL) {
    Status = EFI_INVALID_PARAMETER;
    goto exit;
  }

  Instance = TCM_TCH_INSTANCE_FROM_ABSTCH_THIS(This);
  if (!Instance->StateChanged) {
    Status = EFI_NOT_READY;
    goto exit;
  }

  State->CurrentX        = Instance->LastX;
  State->CurrentY        = Instance->LastY;
  State->CurrentZ        = 0;
  State->ActiveButtons   = 1;
  Instance->StateChanged = FALSE;

exit:
  return Status;
}

VOID EFIAPI AbsPWaitForInput(IN EFI_EVENT Event, IN VOID *Context)
{
  TCM_INTERNAL_DATA *Instance = (TCM_INTERNAL_DATA *)Context;
  EFI_TPL             OldTpl;

  //
  // Enter critical section
  //
  OldTpl = gBS->RaiseTPL(TPL_NOTIFY);

  SyncPollCallback(NULL, Instance);

  if (Instance->StateChanged) {
    gBS->SignalEvent(Event);
  }

  //
  // Leave critical section and return
  //
  gBS->RestoreTPL(OldTpl);
}

EFI_STATUS
EFIAPI
SynaPowerUpController(TCM_INTERNAL_DATA *Instance)
{
  UINT32     Config;
  UINT32     ResetLine;
  EFI_STATUS Status;

  if (Instance == NULL || Instance->TCMDevice == NULL ||
      Instance->TCMDevice->GpioTlmmProtocol == NULL) {
    Status = EFI_INVALID_PARAMETER;
    goto exit;
  }

  // Pin Sanity check
  ResetLine = Instance->TCMDevice->ControllerResetPin;
  if (ResetLine <= 0) {
    DEBUG((EFI_D_ERROR, "SynapticsTouchDxe: Invalid GPIO configuration\n"));
    Status = EFI_INVALID_PARAMETER;
    goto exit;
  }

  if(Instance->TCMDevice->ControllerVddPin != 0) {
    Config = EFI_GPIO_CFG(Instance->TCMDevice->ControllerVddPin, 
      0, 
      GPIO_OUTPUT, 
      GPIO_NO_PULL, 
      GPIO_2MA);
      
    Status = Instance->TCMDevice->GpioTlmmProtocol->ConfigGpio(Config, TLMM_GPIO_ENABLE);
    Instance->TCMDevice->GpioTlmmProtocol->GpioOut(Config, 
        Instance->TCMDevice->ControllerVddCtlActiveLow ? GPIO_LOW_VALUE : GPIO_HIGH_VALUE);
  }

  if(Instance->TCMDevice->ControllerVddIoPin != 0) {
    Config = EFI_GPIO_CFG(Instance->TCMDevice->ControllerVddIoPin, 
      0, 
      GPIO_OUTPUT, 
      GPIO_NO_PULL, 
      GPIO_2MA);
      
    Status = Instance->TCMDevice->GpioTlmmProtocol->ConfigGpio(Config, TLMM_GPIO_ENABLE);
    Instance->TCMDevice->GpioTlmmProtocol->GpioOut(Config, 
        Instance->TCMDevice->ControllerVddCtlActiveLow ? GPIO_LOW_VALUE : GPIO_HIGH_VALUE);
  }
  
  // Power Seq
  Config = EFI_GPIO_CFG( ResetLine, 0, GPIO_OUTPUT, GPIO_NO_PULL, GPIO_2MA );
  Status = Instance->TCMDevice->GpioTlmmProtocol->ConfigGpio(Config, TLMM_GPIO_ENABLE);

  // Configure MSM GPIO RESET line to Low
  Instance->TCMDevice->GpioTlmmProtocol->GpioOut(Config, GPIO_LOW_VALUE);
  gBS->Stall(TOUCH_POWER_RAIL_STABLE_TIME);

  // configure MSM GPIO RESET line to High
  Instance->TCMDevice->GpioTlmmProtocol->GpioOut(Config, GPIO_HIGH_VALUE);
  gBS->Stall(TOUCH_DELAY_TO_COMMUNICATE);

  DEBUG((EFI_D_INFO, "SynapticsTouchDxe: Touch controller powered on \n"));
  Status = EFI_SUCCESS;

exit:
  return Status;
}

EFI_STATUS
EFIAPI
SynaGetTouchData(TCM_INTERNAL_DATA *Instance, IN PTOUCH_DATA DataBuffer, IN TCM_BUFFER *ResponseData)
{
  EFI_STATUS Status                             = EFI_SUCCESS;
  TCM_MSG_HEADER messageHeader;
  UINT8 *payloadPtr = NULL, *payloadData = NULL;
  UINT32 readLength = 0;

  if (Instance == NULL) {
    Status = EFI_INVALID_PARAMETER;
    goto exit;
  }

  // if (!Instance->Initialized) {
  //   Status = EFI_NOT_READY;
  //   goto exit;
  // }

  Status = SynaI2cRawRead(Instance, (UINT8*)&messageHeader, MESSAGE_HEADER_SIZE);
  if (EFI_ERROR(Status)) {
    DEBUG((EFI_D_ERROR, "SynapticsTCMDxe: Read msg header failed\n"));
    goto exit;
  }

  if (messageHeader.Marker != MESSAGE_MARKER) {
    DEBUG((EFI_D_ERROR, "SynapticsTCMDxe: Invalid msg header marker: 0x%x\n", messageHeader.Marker));
    Status = EFI_INVALID_PARAMETER;
    goto exit;
  }
  
  if (messageHeader.Code <= TCM_STATUS_ERROR || messageHeader.Code == TCM_STATUS_INVALID) {
		switch (messageHeader.Code) {
		case TCM_STATUS_OK:
			break;
		case TCM_STATUS_CONTINUED_READ:
				DEBUG((EFI_D_ERROR, "SynapticsTCMDxe: Out-of-sync continued read\n"));
		case TCM_STATUS_IDLE:
		case TCM_STATUS_BUSY:
      Status = EFI_INVALID_PARAMETER;
			goto exit;
			break;
		default:
			if(messageHeader.Code == TCM_STATUS_INVALID) {
				messageHeader.Length = 0;
			}
			break;
		}
	}

  readLength = messageHeader.Length + 3;
  payloadData = AllocateZeroPool(readLength + 4);
  if(payloadData == NULL) {
    Status = EFI_OUT_OF_RESOURCES;
    goto exit;
  }

  CopyMem(payloadData, &messageHeader, MESSAGE_HEADER_SIZE);
  payloadPtr = &(payloadData[4]);

  if (messageHeader.Length == 0) {
		payloadPtr[readLength - 1] = MESSAGE_PADDING;
	}
	else {
    Status = SynaI2cRawRead(Instance, payloadPtr, readLength);
    if(EFI_ERROR(Status)) {
      DEBUG((EFI_D_ERROR, "SynapticsTCMDxe: Could not read message payload\n"));
      goto free_buffer;
    }

    if (payloadPtr[0] != MESSAGE_MARKER || payloadPtr[1] != TCM_STATUS_CONTINUED_READ) {
      DEBUG((EFI_D_ERROR, "SynapticsTCMDxe: Incorrect continued read header marker/code(0x%02x/0x%02x)\n",
        payloadPtr[0], payloadPtr[1]));
      Status = EFI_INVALID_PARAMETER;
      goto free_buffer;
    }

    payloadPtr += 2;
		readLength -= 2;
  }

  UINT8 temp = payloadPtr[readLength - 1];

	if (temp != MESSAGE_PADDING) {
		DEBUG((EFI_D_ERROR, "SynapticsTCMDxe: Incorrect message padding byte: 0x%02x\n", temp));
		Status = EFI_INVALID_PARAMETER;
		goto free_buffer;
	}

  if (messageHeader.Code >= TCM_REPORT_IDENTIFY) {
		switch(messageHeader.Code) {
			case TCM_REPORT_TOUCH:
				if(Instance->Initialized == TRUE) {
          if(DataBuffer != NULL)
            TcmDispatchReport(Instance,
              (UINT8*)&messageHeader,
              payloadPtr,
              readLength,
              DataBuffer);
				} else {
					DEBUG((EFI_D_ERROR,
						"SynapticsTCMDxe: Received report before initialization, report_code:0x%x\n",
						messageHeader.Code));
				}
				
				break;
			case TCM_REPORT_IDENTIFY:
				if (readLength < sizeof(TCM_ID_INFO)) {
					DEBUG((EFI_D_ERROR,
						"SynapticsTCMDxe: Received ID Info smaller than buffer"));
					Status = EFI_INVALID_PARAMETER;
					goto free_buffer;
				}
        if(Instance->IDInfo == NULL) {
          Instance->IDInfo = AllocateZeroPool(sizeof(TCM_ID_INFO));
        }
				CopyMem(Instance->IDInfo, payloadPtr, sizeof(TCM_ID_INFO));
				Instance->ChunkSize = MIN(Instance->IDInfo->MaxWriteSize, DEFAULT_CHUNK_SIZE);
				
				DEBUG((EFI_D_VERBOSE,
          "SynapticsTCMDxe: Received identify report (firmware mode = 0x%02x)\n",
					Instance->IDInfo->Mode));
				
				if(Instance->CommandStatus == CMD_BUSY) {
					switch(Instance->CurrentCommand) {
						case CMD_RESET:
						case CMD_RUN_BOOTLOADER_FIRMWARE:
						case CMD_RUN_APPLICATION_FIRMWARE:
						case CMD_ENTER_PRODUCTION_TEST_MODE:
						case CMD_ROMBOOT_RUN_BOOTLOADER_FIRMWARE:
							Instance->CurrentResponse = TCM_STATUS_OK;
							Instance->CommandStatus = CMD_IDLE;
							break;
						default:
							Instance->CommandStatus = CMD_ERROR;
							break;
					}
				}
				if(Instance->Initialized == TRUE) {
					DEBUG((EFI_D_ERROR,
						"SynapticsTCMDxe: Received identify report with Init done state (IC reset occured, need reinit)\n"));
					Instance->Initialized = FALSE;
				}
				break;
			case TCM_REPORT_RAW:
			case TCM_REPORT_DELTA:
				// TODO
			default:
				break;
		}
	}
	else { // Response
    if(Instance->CommandStatus != CMD_BUSY) goto free_buffer;
    if(ResponseData != NULL) {
      if(readLength == 0) {
        if(Instance->CommandStatus == CMD_BUSY)
          Instance->CommandStatus = CMD_ERROR;
      } else {
        CopyMem(ResponseData->Buffer, payloadPtr, readLength);
        ResponseData->DataLength = readLength;
      }
    } else {
      DEBUG((EFI_D_ERROR,
						"SynapticsTCMDxe: No response buffer supplied\n"));
    }
	}

  // DataBuffer->TouchStatus = TouchCoordinates[0];
  // DataBuffer->TouchX =
  //     ((TouchCoordinates[1] & 0xFF) | ((TouchCoordinates[2] & 0xFF) << 8));
  // DataBuffer->TouchY =
  //     ((TouchCoordinates[3] & 0xFF) | ((TouchCoordinates[4] & 0xFF) << 8));

free_buffer:
  if(payloadData != NULL)
    FreePool(payloadData);

exit:
  return Status;
}

VOID EFIAPI SyncPollCallback(IN EFI_EVENT Event, IN VOID *Context)
{
  EFI_STATUS          Status;
  TCM_INTERNAL_DATA *Instance = (TCM_INTERNAL_DATA *)Context;
  TOUCH_DATA          TouchPointerData;
  UINT32 Config, IntIO, Val = 1;
  //EFI_TPL             OldTpl;

  ASSERT(Instance != NULL);
  IntIO = Instance->TCMDevice->ControllerInterruptPin;
  ASSERT(IntIO != 0);

  Config = EFI_GPIO_CFG( IntIO, 0, GPIO_INPUT, GPIO_PULL_UP, GPIO_2MA );
  Instance->TCMDevice->GpioTlmmProtocol->ConfigGpio(Config, TLMM_GPIO_ENABLE);
  Instance->TCMDevice->GpioTlmmProtocol->GpioIn(Config, &Val);

  if(Val == 1) return;
  //
  // Enter critical section
  //
  //OldTpl = gBS->RaiseTPL(TPL_NOTIFY);

  if(Instance->Initialized == FALSE) {
    DEBUG((EFI_D_ERROR, "SynapticsTouchDxe: controller uninitialized unexpectedly\n"));
    return;
  }

  // Check interrupt pin here
  // if()

  Status = SynaGetTouchData(Instance, &TouchPointerData, NULL);

  if (EFI_ERROR(Status)) {
    DEBUG((EFI_D_ERROR, "SynapticsTouchDxe: Failed to get touch data: %r\n", Status));
  }
  else {
    if (TouchPointerData.TouchStatus > 0) {
      Instance->LastX        = TouchPointerData.TouchX + Instance->TCMDevice->XMin;
      Instance->LastY        = TouchPointerData.TouchY + Instance->TCMDevice->YMin;
      Instance->StateChanged = TRUE;
      if (Instance->TCMDevice->XInverted) {
        Instance->LastX = Instance->AbsPointerMode.AbsoluteMaxX - Instance->LastX;
      }
      if (Instance->TCMDevice->YInverted) {
        Instance->LastY = Instance->AbsPointerMode.AbsoluteMaxY - Instance->LastY;
      }

      DEBUG(
          (EFI_D_INFO, "SynapticsTouchDxe: Touch: X: %d, Y: %d \n", Instance->LastX,
           Instance->LastY));
    }
  }

  //
  // Leave critical section and return
  //
  //gBS->RestoreTPL(OldTpl);
}

EFI_STATUS
EFIAPI
TcmDispatchReport(
	TCM_INTERNAL_DATA *Instance, 
	IN UINT8* messageHeader, 
	IN UINT8* payloadData, 
	IN UINT32 readLength,
	IN PTOUCH_DATA touchData) 
{
  EFI_STATUS Status = EFI_SUCCESS;
	UINT8 *ConfigData = Instance->ConfigData->Buffer;
	UINT32 Index = 0, Next = 0, EndOfForeach = 0, BufIdx = 0;
	UINT32 BitsToRead = 0, BitsOffset = 0;
	UINT32 ObjectIndex = 0, ActiveObjectsNum = 0, ActiveObjectsIndex = 0;
	UINT32 DataByte = 0;
	UINT8 Code = 0;
	INT32 DataInt = 0;
	BOOLEAN ActiveOnly = FALSE, NeedReport = FALSE;

	if (Instance->ConfigData->DataLength <= 0) {
		DEBUG((EFI_D_ERROR, "SynapticsTouchDxe: Report config data not ready\n"));
		return EFI_INVALID_PARAMETER;
	}

  ZeroMem(touchData, sizeof(TOUCH_DATA));

	while(Index < Instance->ConfigData->DataLength) {
		Code = ConfigData[Index];
		Index++;
		switch (Code) {
			case TOUCH_END:
				goto exit;
				break;
			case TOUCH_FOREACH_ACTIVE_OBJECT:
				ObjectIndex = 0;
				Next = Index;
				ActiveOnly = TRUE;
				break;
			case TOUCH_FOREACH_OBJECT:
				ObjectIndex = 0;
				Next = Index;
				ActiveOnly = FALSE;
				break;
			case TOUCH_FOREACH_END:
				EndOfForeach = Index;
				if (ActiveOnly) {
					if (ActiveObjectsNum) {
						ActiveObjectsIndex++;
						if (ActiveObjectsIndex < ActiveObjectsNum)
							Index = Next;
					} else if (BitsOffset < readLength * 8) {
						Index = Next;
					}
				} else {
					ObjectIndex++;
					if (ObjectIndex < MAX_FINGER)
						Index = Next;
				}
				break;
			case TOUCH_PAD_TO_NEXT_BYTE:
				BitsOffset = ceil_div(BitsOffset, 8) * 8;
				break;
			case TOUCH_CUSTOMER_GESTURE_DETECTED:
				BitsToRead = ConfigData[Index];
				Index++;
				// Status = TcmParseSingleByte(payloadData, readLength, BitsOffset, BitsToRead, &DataByte);
				// if(DataByte == DETECT_NORMAL_TOUCH) {
				// 	touchData->TouchStatus = 1;
				// }
				BitsOffset += BitsToRead;
				break;

			case TOUCH_CUSTOMER_GESTURE_INFO:
      case TOUCH_CUSTOMER_GESTURE_INFO2:
				BitsToRead = ConfigData[Index];
				Index++;
				BufIdx = 0;
				while (BitsToRead > 0) {
					if (BufIdx >= 20)
						break;
					BitsOffset += 8;
					BitsToRead -= 8;
					BufIdx++;
				}
				break;

      case TOUCH_OBJECT_N_INDEX:
				BitsToRead = ConfigData[Index];
				Index++;
				Status = TcmParseSingleByte(payloadData, readLength, BitsOffset, BitsToRead, &DataByte);
				if (Status < 0) {
					DEBUG((EFI_D_ERROR, "Failed to get object index\n"));
					goto exit;
				}
				DataInt = (INT32)DataByte;
				if (DataInt < 0) {
					DEBUG((EFI_D_VERBOSE, "Invalid ObjectIndex = %d -> 0\n", DataInt));
					ObjectIndex = 0;
          goto exit;
				} else if (DataInt >= MAX_FINGER) {
					DEBUG((EFI_D_VERBOSE, "Invalid ObjectIndex = %d -> MAX_FINGER\n", DataInt));
					ObjectIndex = MAX_FINGER - 1;
          goto exit;
				} else {
					ObjectIndex = DataInt;
					DEBUG((EFI_D_VERBOSE, "TOUCH_OBJECT_N_INDEX: %d\n", DataInt));
				}

				BitsOffset += BitsToRead;
				break;

			case TOUCH_OBJECT_N_CLASSIFICATION:
				BitsToRead = ConfigData[Index];
				Index++;
				Status = TcmParseSingleByte(payloadData, readLength, BitsOffset, BitsToRead, &DataByte);
				if (Status < 0) {
					DEBUG((EFI_D_ERROR, "SynapticsTouchDxe: Failed to get object N classification\n"));
					goto exit;
				}
				touchData->TouchStatus |= (DataByte >= 1) ? 1 : 0;

				BitsOffset += BitsToRead;
				break;

			case TOUCH_OBJECT_N_X_POSITION:
				BitsToRead = ConfigData[Index];
				Index++;
				Status = TcmParseSingleByte(payloadData, readLength, BitsOffset, BitsToRead, &DataByte);
				if (Status < 0) {
					DEBUG((EFI_D_ERROR, "SynapticsTouchDxe: Failed to get object x position\n"));
					goto exit;
				}
				touchData->TouchX = DataByte;
				BitsOffset += BitsToRead;
				break;
			case TOUCH_OBJECT_N_Y_POSITION:
				BitsToRead = ConfigData[Index];
				Index++;
				Status = TcmParseSingleByte(payloadData, readLength, BitsOffset, BitsToRead, &DataByte);
				if (Status < 0) {
					DEBUG((EFI_D_ERROR, "SynapticsTouchDxe: Failed to get object y position\n"));
					goto exit;
				}
				touchData->TouchY = DataByte;
				BitsOffset += BitsToRead;
				break;
      
      // Unused data in UEFI (Single touch)
			case TOUCH_OBJECT_N_Z:
			case TOUCH_OBJECT_N_ANGLE:
			case TOUCH_OBJECT_N_MAJOR:
			case TOUCH_OBJECT_N_MINOR:
			case TOUCH_OBJECT_N_X_WIDTH:
			case TOUCH_OBJECT_N_Y_WIDTH:
			case TOUCH_OBJECT_N_AREA:
			case TOUCH_OBJECT_N_FORCE:
			case TOUCH_TIMESTAMP:
			case TOUCH_GESTURE_ID:
			case TOUCH_FINGERPRINT_AREA_MEET:
			case TOUCH_0D_BUTTONS_STATE:
			case TOUCH_OBJECT_N_TX_POSITION_TIXELS:
			case TOUCH_OBJECT_N_RX_POSITION_TIXELS:
      case TOUCH_NUM_OF_ACTIVE_OBJECTS:
			default:
				BitsToRead = ConfigData[Index];
				Index++;
				BitsOffset += BitsToRead;
				break;
		}
	}
exit:
	return Status;
}

EFI_STATUS
EFIAPI
TcmParseSingleByte(
	UINT8 *Payload,
	UINT32 PayloadLength,
	UINT32 BitsOffset,
	UINT32 BitsToRead,
	UINT32 *OutputData
)
{
	UINT8 mask = 0, byte_data = 0;
	UINT32 bit_offset = 0, byte_offset = 0, data_bits = 0, output_data = 0;
	INT32 remaining_bits = 0, available_bits = 0;
	UINT8 *PayloadData = (UINT8*) Payload;

  DEBUG((EFI_D_VERBOSE, "    BitsOffset=%d, BitsToRead=%d, PayloadLength=%d\n", BitsOffset, BitsToRead, PayloadLength));

	if (BitsToRead == 0 || BitsToRead > 32) {
		DEBUG((EFI_D_ERROR, "SynapticsTouchDxe: Invalid number of BitsToRead\n"));
		return EFI_INVALID_PARAMETER;
	}

	if (BitsOffset + BitsToRead > PayloadLength * 8) {
		DEBUG((EFI_D_VERBOSE, "SynapticsTouchDxe: Overflow BitsOffset+BitsToRead:%d+%d\n",
			BitsOffset,
			BitsToRead));

		// *OutputData = 0;
		return EFI_INVALID_PARAMETER;
	}

	output_data = 0;
	remaining_bits = BitsToRead;

	bit_offset = BitsOffset % 8;
	byte_offset = BitsOffset / 8;

	while (remaining_bits > 0) {
		byte_data = PayloadData[byte_offset];
		byte_data >>= bit_offset;

		available_bits = 8 - bit_offset;
		data_bits = MIN(available_bits, remaining_bits);
		mask = 0xff >> (8 - data_bits);

		byte_data &= mask;

		output_data |= byte_data << (BitsToRead - remaining_bits);

		bit_offset = 0;
		byte_offset += 1;
		remaining_bits -= data_bits;
		if (remaining_bits < 0) {
			DEBUG((EFI_D_ERROR, "SynapticsTouchDxe: remaining_bits is negative value:%d\n", remaining_bits));
			break;
		}
	}

	*OutputData = output_data;

	DEBUG((EFI_D_VERBOSE, "TcmParseSingleByte: OutputData = 0x%x\n", *OutputData));

	return EFI_SUCCESS;
}

EFI_STATUS
EFIAPI
TcmGetReportConfig(
  TCM_INTERNAL_DATA *Instance)
{
  UINT8 Buffer[3] = {CMD_GET_TOUCH_REPORT_CONFIG, 0, 0};
  UINT32 Config, IntIO, Val = 1;
  INT32 Timeout = 10000;
  EFI_STATUS Status = EFI_SUCCESS;

  ASSERT(Instance != NULL);
  IntIO = Instance->TCMDevice->ControllerInterruptPin;
  ASSERT(IntIO != 0);

  Instance->CurrentCommand = CMD_GET_TOUCH_REPORT_CONFIG;
  Instance->CommandStatus = CMD_BUSY;

  SynaI2cRawWrite(Instance, Buffer, 3);

  Config = EFI_GPIO_CFG( IntIO, 0, GPIO_INPUT, GPIO_PULL_UP, GPIO_2MA );
  Status = Instance->TCMDevice->GpioTlmmProtocol->ConfigGpio(Config, TLMM_GPIO_ENABLE);

  while(Timeout > 0 && Val == 1) {
    Instance->TCMDevice->GpioTlmmProtocol->GpioIn(Config, &Val);
    gBS->Stall(TIMER_INTERVAL_TOUCH_POLL);
    Timeout -= TIMER_INTERVAL_TOUCH_POLL;
  }
  if(Val == 1) {
    DEBUG((EFI_D_ERROR, "TcmGetReportConfig: timed out waiting for response\n"));
    return EFI_INVALID_PARAMETER;
  }
  
  Status = SynaGetTouchData(Instance, NULL, Instance->ConfigData);
  if(Instance->ConfigData->DataLength == 0 || EFI_ERROR(Status)) {
    return EFI_INVALID_PARAMETER;
  }

  return EFI_SUCCESS;
}

STATIC
VOID
SynapticsTcmDxeExitBootService (
   EFI_EVENT  Event,
   VOID *Context
)
{
  if(gTCMI2cDeviceIo != NULL && gI2CInstance != NULL)
    gTCMI2cDeviceIo->I2cQupProtocol->Close(gI2CInstance->I2cController);

  DEBUG((EFI_D_ERROR, "SynapticsTouchDxe: Closing i2c instance\n"));
}

EFI_STATUS
EFIAPI
SynaInitialize(IN EFI_HANDLE ImageHandle, IN EFI_SYSTEM_TABLE *SystemTable)
{
  EFI_STATUS Status;

  Status = EfiLibInstallDriverBindingComponentName2(
      ImageHandle, SystemTable, &gTCMDriverBinding, ImageHandle,
      &gTCMDriverComponentName, &gTCMDriverComponentName2);
  ASSERT_EFI_ERROR(Status);

  gBS->CreateEventEx(
      EVT_NOTIFY_SIGNAL,
      TPL_CALLBACK,
      SynapticsTcmDxeExitBootService,
      NULL,
      &gEfiEventExitBootServicesGuid,
      &ExitBootServicesEvent
   );

  return EFI_SUCCESS;
}
