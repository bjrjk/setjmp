#ifndef SETJMP_SETJMP_H
#define SETJMP_SETJMP_H

#include <stdint.h>

typedef struct{
    uint64_t rip;
}
setjmp_buf;

uint64_t __cdecl setjmp_s(setjmp_buf *buf);
void __cdecl longjmp_s(setjmp_buf *buf, uint64_t retVal);

#endif //SETJMP_SETJMP_H
