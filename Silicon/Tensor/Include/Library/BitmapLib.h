/*
 * Copyright (c) 2008 Travis Geiselbrecht
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
#ifndef __LIB_BITMAP_H
#define __LIB_BITMAP_H

#include <Library/AtomicLib.h>

#define BIT_SHIFT(x, bit) (((x) >> (bit)) & 1)
#define BITS_SHIFT(x, high, low)                                               \
  (((x) >> (low)) & ((1 << ((high) - (low) + 1)) - 1))
#define BIT_SET(x, bit) (((x) & (1UL << (bit))) ? 1 : 0)

#define BITMAP_BITS_PER_WORD (sizeof(UINTN) * 8)
#define BITMAP_NUM_WORDS(x)                                                    \
  (((x) + BITMAP_BITS_PER_WORD - 1) / BITMAP_BITS_PER_WORD)
#define BITMAP_WORD(x) ((x) / BITMAP_BITS_PER_WORD)
#define BITMAP_BIT_IN_WORD(x) ((x) & (BITMAP_BITS_PER_WORD - 1))

#define BITMAP_BITS_PER_INT (sizeof(UINTN) * 8)
#define BITMAP_BIT_IN_INT(x) ((x) & (BITMAP_BITS_PER_INT - 1))
#define BITMAP_INT(x) ((x) / BITMAP_BITS_PER_INT)

#define BIT_MASK(x)                                                            \
  (((x) >= sizeof(UINTN) * 8) ? (0UL - 1) : ((1UL << (x)) - 1))

STATIC inline INTN BitmapSet(UINTN *bitmap, INTN bit)
{
  UINTN mask = 1UL << BITMAP_BIT_IN_INT(bit);
  return AtomicOr(&((INTN *)bitmap)[BITMAP_INT(bit)], mask) & mask ? 1 : 0;
}

STATIC inline INTN BitmapClear(UINTN *bitmap, INTN bit)
{
  UINTN mask = 1UL << BITMAP_BIT_IN_INT(bit);

  return AtomicAnd(&((INTN *)bitmap)[BITMAP_INT(bit)], ~mask) & mask ? 1 : 0;
}

STATIC inline INTN BitmapTest(UINTN *bitmap, INTN bit)
{
  return BIT_SET(bitmap[BITMAP_WORD(bit)], BITMAP_BIT_IN_WORD(bit));
}

#endif
