#include <Base.h>
#include <PiDxe.h>
#include <Library/UefiLib.h>
#include <Library/BaseLib.h>
#include <Library/SerialPortLib.h>
#include "GeniSerial.h"
STATIC UINT32 ReadIndex=0,WriteIndex=0,TxFIFOSize=0;
UINTN EFIAPI SerialPortRead(OUT UINT8*Buffer,IN UINTN Bytes){
	CHAR8*ReadBuffer;
	BOOLEAN Status;
	STATIC UINT8 RxBuffer[255];
	UINT8*Buff=Buffer;
	UINT32 Room=Bytes,Copied=0,Avail=0,Num,WriteOffset,BytesRead,WordsRead,Index,FIFOStatus,Word,IRQStatus,AvailBytes;
	while(1){
		if(ReadIndex==WriteIndex)ReadIndex=WriteIndex=0;
		if(sizeof(RxBuffer)-WriteIndex>4){
			ReadBuffer=(CHAR8*)(RxBuffer+WriteIndex);
			WriteOffset=0,BytesRead=0,WordsRead=0;
			MemWrite(GENI4_DATA,GENI_S_IRQ_EN_SET_ADDR,RX_LAST_IRQ|RX_FIFO_WATERMARK_IRQ);
			IRQStatus=MemReadMask(GENI4_DATA,GENI_S_IRQ_STATUS);
			FIFOStatus=MemReadMask(GENI4_DATA,GENI_RX_FIFO_STATUS);
			if(IRQStatus&(RX_LAST_IRQ|RX_FIFO_WATERMARK_IRQ)){
				BytesRead=(FIFOStatus&RX_LAST_VALID_BYTES_MASK)>>RX_LAST_VALID_BYTES_SHIFT;
				WordsRead=FIFOStatus&RX_FIFO_WC;
				if(BytesRead!=0&&BytesRead!=4)WordsRead-=1;
				else BytesRead=0;
			}
			AvailBytes=WordsRead*4+BytesRead;
			if(WriteOffset+AvailBytes>sizeof(RxBuffer)-WriteIndex){
				if(sizeof(RxBuffer)-WriteIndex-WriteOffset<4){
					MemWrite(GENI4_DATA,GENI_S_IRQ_CLEAR_ADDR,IRQStatus);
					MemWrite(GENI4_DATA,GENI_S_IRQ_EN_CLEAR_ADDR,RX_LAST_IRQ|RX_FIFO_WATERMARK_IRQ);
					goto ok;
				}else{
					WordsRead=((sizeof(RxBuffer)-WriteIndex-WriteOffset)&0x3)>>2;
					BytesRead=0,AvailBytes=WordsRead*4;
				}
			}else MemWrite(GENI4_DATA,GENI_S_IRQ_CLEAR_ADDR,(IRQStatus&RX_LAST_IRQ));
			ReadBuffer+=WriteOffset;
			Status=(ReadBuffer-(CHAR8*)NULL)&0x03;
			for(Index=0;Index<WordsRead;Index++){
				Word=MemReadMask(GENI4_DATA,GENI_RX_FIFO);
				if(Status){
					ReadBuffer[0]=(UINT8)(Word>>0),ReadBuffer[1]=(UINT8)(Word>>8);
					ReadBuffer[2]=(UINT8)(Word>>16),ReadBuffer[3]=(UINT8)(Word>>24);
				}else *(UINT32*)ReadBuffer=Word;
				ReadBuffer+=4;
			}
			if(BytesRead){
				Word=MemReadMask(GENI4_DATA,GENI_RX_FIFO);
				for(Index=0;Index<BytesRead;Index++)ReadBuffer[Index]=(UINT8)(Word>>Index*8);
			}
			WriteOffset+=AvailBytes;
			MemWrite(GENI4_DATA,GENI_S_IRQ_CLEAR_ADDR,(IRQStatus&RX_FIFO_WATERMARK_IRQ));
			ok:WriteIndex+=WriteOffset;
		}
		Avail=ReadIndex<WriteIndex?WriteIndex-ReadIndex:0;
		Num=Room<Avail?Room:Avail;
		if(Num==0)break;
		for(Index=0;Index<Num;Index++)*Buff++=RxBuffer[ReadIndex++&(sizeof(RxBuffer)-1)];
		Copied+=Num,Room-=Num;
	}
	return Copied;
}
UINTN EFIAPI SerialPortWrite(IN UINT8*Buffer,IN UINTN Bytes){
	UINT8*MsgBuff=Buffer;
	UINT32 Slots,FIFOSize,WordValue,Index,WordsSend,BytesSend,Full,Partial;
	UINTN BytesRemain=Bytes,Send;
	FIFOSize=(MemReadMask(QUPV3_SE_DMA,SE_HW_PARAM_0)&TX_FIFO_DEPTH_MASK)>>TX_FIFO_DEPTH_SHIFT;
	if(TxFIFOSize==0)TxFIFOSize=FIFOSize<<2;
	while(BytesRemain>0){
		Send=(BytesRemain>TxFIFOSize)?TxFIFOSize:BytesRemain;
		if(MemReadMask(GENI4_CFG,GENI_STATUS)&M_GENI_CMD_ACTIVE)continue;
		MemWrite(GENI4_IMAGE_REGS,UART_TX_TRANS_LEN_ADDR,Send);
		MemWrite(GENI4_DATA,GENI_M_CMD0_ADDR,0x08000000);
		if(Send){
			Full=Send>>2,Partial=Send&0x03;
			Slots=FIFOSize-(MemReadMask(GENI4_DATA,GENI_TX_FIFO_STATUS)&TX_FIFO_WC);
			WordsSend=Full>Slots?Slots:Full,BytesSend=Full>=Slots?0:Partial;
			BOOLEAN k=((CHAR8*)Buffer-(CHAR8*)NULL)&0x03;
			for(Index=0;Index<WordsSend;Index++){
				MemWrite(
					GENI4_DATA,GENI_TX_FIFO_ADDR,(k?(
						Buffer[0]<<0|Buffer[1]<<8|
						Buffer[2]<<16|Buffer[3]<<24
					):(*(UINT32*)Buffer))
				);
				Buffer+=4;
			}
			if(BytesSend){
				WordValue=0;
				for(Index=0;Index<BytesSend;Index++)WordValue|=Buffer[Index]<<Index*8;
				MemWrite(GENI4_DATA,GENI_TX_FIFO_ADDR,WordValue);
			}
			MemWrite(
				GENI4_DATA,
				(Send==WordsSend*4+BytesSend)?
				GENI_M_IRQ_EN_CLEAR_ADDR:GENI_M_IRQ_EN_SET_ADDR,
				TX_FIFO_WATERMARK_IRQ
			);
		}
		MsgBuff+=Send,BytesRemain-=Send;
	}
	return Bytes;
}
UINTN EFIAPI SerialPortControl(IN UINTN Arg,IN UINTN Param){return 0;}
BOOLEAN EFIAPI SerialPortPoll(VOID){return (MemReadMask(GENI4_DATA,GENI_S_IRQ_STATUS)&(RX_LAST_IRQ|RX_FIFO_WATERMARK_IRQ))||(WriteIndex-ReadIndex>0);}
EFI_STATUS EFIAPI SerialPortSetAttributes(IN OUT UINT64*BaudRate,IN OUT UINT32*ReceiveFifoDepth,IN OUT UINT32*Timeout,IN OUT EFI_PARITY_TYPE*Parity,IN OUT UINT8*DataBits,IN OUT EFI_STOP_BITS_TYPE *StopBits){return EFI_UNSUPPORTED;}
EFI_STATUS EFIAPI SerialPortGetControl(OUT UINT32*Control){return EFI_UNSUPPORTED;}
EFI_STATUS EFIAPI SerialPortSetControl(IN UINT32 Control){return EFI_UNSUPPORTED;}
EFI_STATUS EFIAPI SerialPortInitialize(VOID){return EFI_SUCCESS;}
