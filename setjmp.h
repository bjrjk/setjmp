#ifndef SETJMP_SETJMP_H
#define SETJMP_SETJMP_H

#include <stdint.h>

typedef struct{
    uint64_t rip;
    uint64_t rbx;
    uint64_t rsp;
    uint64_t rbp;
    uint64_t r12;
    uint64_t r13;
    uint64_t r14;
    uint64_t r15;
}
setjmp_buf;

uint64_t __cdecl setjmp_s(setjmp_buf *buf);
void __cdecl longjmp_s(setjmp_buf *buf, uint64_t retVal);

#endif //SETJMP_SETJMP_H
