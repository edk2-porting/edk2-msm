#ifndef _FRAMEBUFFER_SERIALPORT_LIB_H_
#define _FRAMEBUFFER_SERIALPORT_LIB_H_

typedef struct _FBCON_POSITION {
  INTN x;
  INTN y;
} FBCON_POSITION, *PFBCON_POSITION;

typedef struct _FBCON_COLOR {
  UINTN Foreground;
  UINTN Background;
} FBCON_COLOR, *PFBCON_COLOR;

enum FbConMsgType {
  /* type for menu */
  FBCON_COMMON_MSG = 0,
  FBCON_UNLOCK_TITLE_MSG,
  FBCON_TITLE_MSG,
  FBCON_SUBTITLE_MSG,

  /* type for warning */
  FBCON_YELLOW_MSG,
  FBCON_ORANGE_MSG,
  FBCON_RED_MSG,
  FBCON_GREEN_MSG,

  /* and the select message's background */
  FBCON_SELECT_MSG_BG_COLOR,
};

void ResetFb(void);

UINTN
EFIAPI
SerialPortWriteCritical(IN UINT8 *Buffer, IN UINTN NumberOfBytes);

#endif
