/*===-- sync_fetch_and_xor_8.S - ------------------------------------------===//
 *
 * Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
 * See https://llvm.org/LICENSE.txt for license information.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 *
 *===----------------------------------------------------------------------===//
 *
 * This file implements the __sync_fetch_and_xor_8 function for the ARM
 * architecture.
 *
 *===----------------------------------------------------------------------===*/

#include "sync-ops.h"

#if __ARM_ARCH_PROFILE != 'M'
#define xor_8(rD_LO, rD_HI, rN_LO, rN_HI, rM_LO, rM_HI) \
    eor rD_LO, rN_LO, rM_LO ; \
    eor rD_HI, rN_HI, rM_HI

SYNC_OP_8(xor_8)
#endif

NO_EXEC_STACK_DIRECTIVE

