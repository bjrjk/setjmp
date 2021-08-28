#include <stdio.h>
#include "setjmp.h"

setjmp_buf jmpbuf;

int main() {
    setjmp_s(&jmpbuf);
    printf("Hello, World!\n");
    longjmp_s(&jmpbuf, 1);
    return 0;
}
