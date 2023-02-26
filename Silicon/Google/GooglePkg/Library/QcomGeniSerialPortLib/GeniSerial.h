#ifndef UARTQUPV3_H
#define UARTQUPV3_H
#define UART_DEBUG_PORT_BASE                             FixedPcdGet64(PcdDebugUartPortBase)
#define UART_BASE_ADDR                                   UART_DEBUG_PORT_BASE
#define RING_SIZE                                        256
#define MemWrite(off1,off2,val)                          (*((volatile UINT32*)(UINTN)(UART_BASE_ADDR+(off1)+(off2)))=((UINT32)(val)))
#define MemRead(off1,off2,v)                             ((*((volatile UINT32*)(UINTN)(UART_BASE_ADDR+(off1)+(off2))))&(v))
#define MemReadMask(off1,k)                              MemRead(off1,k##_ADDR,k##_MASK)
#define GENI4_CFG                                        0x0
#define GENI4_IMAGE_REGS                                 0x100
#define GENI4_DATA                                       0x600
#define QUPV3_SE_DMA                                     0xC00
#define GENI4_IMAGE                                      0x1000
#define GENI_STATUS_ADDR                                 0x00000040
#define GENI_S_IRQ_STATUS_ADDR                           0x00000040
#define GENI_RX_FIFO_ADDR                                0x00000180
#define GENI_TX_FIFO_STATUS_ADDR                         0x00000200
#define GENI_RX_FIFO_STATUS_ADDR                         0x00000204
#define SE_HW_PARAM_0_ADDR                               0x00000224
#define GENI_STATUS_MASK                                 0x1fffff
#define GENI_S_IRQ_STATUS_MASK                           0xfc07f3f
#define GENI_RX_FIFO_MASK                                0xffffffff
#define GENI_TX_FIFO_STATUS_MASK                         0xffffffff
#define GENI_RX_FIFO_STATUS_MASK                         0xffffffff
#define SE_HW_PARAM_0_MASK                               0x3f3f79ff
#define GENI_M_CMD0_ADDR                                 0x00000000
#define GENI_M_IRQ_EN_SET_ADDR                           0x0000001c
#define GENI_M_IRQ_EN_CLEAR_ADDR                         0x00000020
#define GENI_S_IRQ_CLEAR_ADDR                            0x00000048
#define GENI_S_IRQ_EN_SET_ADDR                           0x0000004c
#define GENI_S_IRQ_EN_CLEAR_ADDR                         0x00000050
#define GENI_TX_FIFO_ADDR                                0x00000100
#define UART_TX_TRANS_CFG_ADDR                           0x0000015c
#define GENI_TX_PACKING_CFG0_ADDR                        0x00000160
#define GENI_TX_PACKING_CFG1_ADDR                        0x00000164
#define UART_TX_TRANS_LEN_ADDR                           0x00000170
#define TX_FIFO_WC                                       0xfffffff
#define RX_FIFO_WC                                       0x1ffffff
#define RX_LAST_IRQ                                      0x8000000
#define TX_FIFO_DEPTH_MASK                               0x3f0000
#define TX_FIFO_DEPTH_SHIFT                              0x10
#define TX_FIFO_WATERMARK_IRQ                            0x40000000
#define RX_FIFO_WATERMARK_IRQ                            0x4000000
#define RX_LAST_VALID_BYTES_MASK                         0x70000000
#define RX_LAST_VALID_BYTES_SHIFT                        0x1c
#define M_GENI_CMD_ACTIVE                                0x1
#endif
