#include <Uefi.h>
#include <Library/BaseMemoryLib.h>
#include <Library/BitmapLib.h>
#include <Library/KeypadDeviceImplLib.h>
#include <Library/UefiLib.h>
#include <Library/IoLib.h>
#include <Protocol/KeypadDevice.h>
#include <Library/DebugLib.h>

typedef struct {
  KEY_CONTEXT EfiKeyContext;
  UINT32 PioBase;
  UINT32 BankOffset;
  UINT32 PinNum;
} KEY_CONTEXT_PRIVATE;


UINTN gBitmapScanCodes[BITMAP_NUM_WORDS(0x18)]    = {0};
UINTN gBitmapUnicodeChars[BITMAP_NUM_WORDS(0x7f)] = {0};


EFI_KEY_DATA gKeyDataPowerDown = {.Key = {
                                      .UnicodeChar = (CHAR16)'s',
                                  }};

EFI_KEY_DATA gKeyDataPowerUp = {.Key = {
                                    .UnicodeChar = (CHAR16)'e',
                                }};

EFI_KEY_DATA gKeyDataPowerLongpress = {.Key = {
                                           .UnicodeChar = (CHAR16)' ',
                                       }};


#define MS2NS(ms) (((UINT64)(ms)) * 1000000ULL)

STATIC inline VOID
KeySetState(UINT16 ScanCode, CHAR16 UnicodeChar, BOOLEAN Value)
{
  if (ScanCode && ScanCode < 0x18) {
    if (Value)
      BitmapSet(gBitmapScanCodes, ScanCode);
    else
      BitmapClear(gBitmapScanCodes, ScanCode);
  }

  if (UnicodeChar && UnicodeChar < 0x7f) {
    if (Value)
      BitmapSet(gBitmapUnicodeChars, ScanCode);
    else
      BitmapClear(gBitmapUnicodeChars, ScanCode);
  }
}

STATIC inline BOOLEAN KeyGetState(UINT16 ScanCode, CHAR16 UnicodeChar)
{
  if (ScanCode && ScanCode < 0x18) {
    if (!BitmapTest(gBitmapScanCodes, ScanCode))
      return FALSE;
  }

  if (UnicodeChar && UnicodeChar < 0x7f) {
    if (!BitmapTest(gBitmapUnicodeChars, ScanCode))
      return FALSE;
  }

  return TRUE;
}

STATIC inline VOID LibKeyInitializeKeyContext(KEY_CONTEXT *Context)
{
  SetMem(&Context->KeyData, sizeof(Context->KeyData), 0);
  Context->Time      = 0;
  Context->State     = KEYSTATE_RELEASED;
  Context->Repeat    = FALSE;
  Context->Longpress = FALSE;
}

STATIC inline VOID LibKeyUpdateKeyStatus(
    KEY_CONTEXT *Context, KEYPAD_RETURN_API *KeypadReturnApi, BOOLEAN IsPressed,
    UINT64 Delta)
{
  // keep track of the actual state
  KeySetState(
      Context->KeyData.Key.ScanCode, Context->KeyData.Key.UnicodeChar,
      IsPressed);

  // update key time
  Context->Time += Delta;

  switch (Context->State) {
  case KEYSTATE_RELEASED:
    if (IsPressed) {
      // change to pressed
      Context->Time  = 0;
      Context->State = KEYSTATE_PRESSED;
    }
    break;

  case KEYSTATE_PRESSED:
    if (IsPressed) {
      // keyrepeat
      if (Context->Repeat && Context->Time >= MS2NS(200)) {
        KeypadReturnApi->PushEfikeyBufTail(KeypadReturnApi, &Context->KeyData);
        Context->Time   = 0;
        Context->Repeat = TRUE;
      }

      else if (!Context->Longpress && Context->Time >= MS2NS(500)) {
        // POWER, handle key combos
        if (Context->KeyData.Key.UnicodeChar == CHAR_CARRIAGE_RETURN) {
          if (KeyGetState(SCAN_DOWN, 0)) {
            // report 's'
            KeypadReturnApi->PushEfikeyBufTail(
                KeypadReturnApi, &gKeyDataPowerDown);
          }
          else if (KeyGetState(SCAN_UP, 0)) {
            // report 'e'
            KeypadReturnApi->PushEfikeyBufTail(
                KeypadReturnApi, &gKeyDataPowerUp);
          }
          else {
            // report spacebar
            KeypadReturnApi->PushEfikeyBufTail(
                KeypadReturnApi, &gKeyDataPowerLongpress);
          }
        }

        // post first keyrepeat event
        else {
          // only start keyrepeat if we're not doing a combo
          if (!KeyGetState(0, CHAR_CARRIAGE_RETURN)) {
            KeypadReturnApi->PushEfikeyBufTail(
                KeypadReturnApi, &Context->KeyData);
            Context->Time   = 0;
            Context->Repeat = TRUE;
          }
        }

        Context->Longpress = TRUE;
      }
    }

    else {
      if (!Context->Longpress) {
        // we supressed down, so report it now
        KeypadReturnApi->PushEfikeyBufTail(KeypadReturnApi, &Context->KeyData);
        Context->State = KEYSTATE_LONGPRESS_RELEASE;
      }

      else if (Context->Time >= MS2NS(10)) {
        // we reported another key already
        Context->Time      = 0;
        Context->Repeat    = FALSE;
        Context->Longpress = FALSE;
        Context->State     = KEYSTATE_RELEASED;
      }
    }
    break;

  case KEYSTATE_LONGPRESS_RELEASE:
    // change to released
    Context->Time      = 0;
    Context->Repeat    = FALSE;
    Context->Longpress = FALSE;
    Context->State     = KEYSTATE_RELEASED;
    break;

  default:
    ASSERT(FALSE);
    break;
  }
}


STATIC KEY_CONTEXT_PRIVATE KeyContextPower;
STATIC KEY_CONTEXT_PRIVATE KeyContextVolumeUp;
STATIC KEY_CONTEXT_PRIVATE KeyContextVolumeDown;

STATIC KEY_CONTEXT_PRIVATE *KeyList[] = { &KeyContextVolumeDown, &KeyContextVolumeUp, &KeyContextPower };

STATIC
VOID KeypadInitializeKeyContextPrivate(KEY_CONTEXT_PRIVATE *Context)
{
  Context->PioBase    = 0;
  Context->BankOffset = 0;
  Context->PinNum     = 0;
}

STATIC
KEY_CONTEXT_PRIVATE *KeypadKeyCodeToKeyContext(UINT32 KeyCode)
{
  if (KeyCode == 114)
    return &KeyContextVolumeDown;
  else if (KeyCode == 115)
    return &KeyContextVolumeUp;
  else if (KeyCode == 116)
    return &KeyContextPower;
  else
    return NULL;
}

RETURN_STATUS
EFIAPI
KeypadDeviceImplConstructor(VOID)
{
  UINTN                Index;
  KEY_CONTEXT_PRIVATE *StaticContext;

  // Reset all keys
  for (Index = 0; Index < (sizeof(KeyList) / sizeof(KeyList[0])); Index++) {
    KeypadInitializeKeyContextPrivate(KeyList[Index]);
  }

  // Configure keys

  // vol down (gpa7-3)
  StaticContext             = KeypadKeyCodeToKeyContext(114);
  StaticContext->PioBase    = 0x174e0000;
  StaticContext->BankOffset = 0x20;
  StaticContext->PinNum     = 3;

  // vol up (gpa8-1)
  StaticContext             = KeypadKeyCodeToKeyContext(115);
  StaticContext->PioBase    = 0x174e0000;
  StaticContext->BankOffset = 0x40;
  StaticContext->PinNum     = 1;

  // power (gpa10-1)
  StaticContext             = KeypadKeyCodeToKeyContext(116);
  StaticContext->PioBase    = 0x174d0000;
  StaticContext->BankOffset = 0xe0;
  StaticContext->PinNum     = 1;

  return RETURN_SUCCESS;
}

EFI_STATUS EFIAPI KeypadDeviceImplReset(KEYPAD_DEVICE_PROTOCOL *This)
{
  LibKeyInitializeKeyContext(&KeyContextVolumeDown.EfiKeyContext);
  KeyContextVolumeDown.EfiKeyContext.KeyData.Key.ScanCode = SCAN_DOWN;

  LibKeyInitializeKeyContext(&KeyContextVolumeUp.EfiKeyContext);
  KeyContextVolumeUp.EfiKeyContext.KeyData.Key.ScanCode = SCAN_UP;

  LibKeyInitializeKeyContext(&KeyContextPower.EfiKeyContext);
  KeyContextPower.EfiKeyContext.KeyData.Key.UnicodeChar = CHAR_CARRIAGE_RETURN;

  return EFI_SUCCESS;
}

EFI_STATUS KeypadDeviceImplGetKeys(
    KEYPAD_DEVICE_PROTOCOL *This, KEYPAD_RETURN_API *KeypadReturnApi,
    UINT64 Delta)
{
    BOOLEAN IsPressed;
    UINTN Index;

    for (Index = 0; Index < (sizeof(KeyList) / sizeof(KeyList[0])); Index++) {
        KEY_CONTEXT_PRIVATE *Context = KeyList[Index];

        IsPressed = FALSE;

  		UINT32 PinAddr = ((Context->PioBase + Context->BankOffset) + 0x4);

        UINT32 PinState = MmioRead32(PinAddr);

        if ( !(PinState & (1 << Context->PinNum)) ) {
        	IsPressed = TRUE;
        }

        LibKeyUpdateKeyStatus(
            &Context->EfiKeyContext, KeypadReturnApi, IsPressed, Delta);
    }

    return EFI_SUCCESS;
}
