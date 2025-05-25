/*
 * Copyright (c) 2008-2014 Travis Geiselbrecht
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files
 * (the "Software"), to deal in the Software without restriction,
 * including without limitation the rights to use, copy, modify, merge,
 * publish, distribute, sublicense, and/or sell copies of the Software,
 * and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
 * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
#ifndef __LIB_ATOMIC_H
#define __LIB_ATOMIC_H

#include <Library/UefiBootServicesTableLib.h>

STATIC inline INTN AtomicAnd(volatile INTN *Address, INTN Value)
{
  EFI_TPL OriginalTPL;
  INTN    OldValue;

  OriginalTPL = gBS->RaiseTPL(TPL_HIGH_LEVEL);
  OldValue    = *Address;
  *Address &= Value;
  gBS->RestoreTPL(OriginalTPL);

  return OldValue;
}

STATIC inline INTN AtomicOr(volatile INTN *Address, INTN Value)
{
  EFI_TPL OriginalTPL;
  INTN    OldValue;

  OriginalTPL = gBS->RaiseTPL(TPL_HIGH_LEVEL);
  OldValue    = *Address;
  *Address |= Value;
  gBS->RestoreTPL(OriginalTPL);

  return OldValue;
}

STATIC inline INTN AtomicRead(volatile INTN *Address) { return *Address; }

STATIC inline VOID AtomicSet(volatile INTN *Address, INTN Value)
{
  *Address = Value;
}

#endif
