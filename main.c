#include <stdio.h>
#include "setjmp.h"

setjmp_buf jmpbuf;

void test1(){
    int cnt = 0;
    setjmp_s(&jmpbuf);
    cnt++;
    printf("test1: %d times.\n", cnt);
    if(cnt >= 10) return;
    longjmp_s(&jmpbuf, 1);
}

void test2(int cnt, setjmp_buf *bufptr){
    if(cnt >= 10) return;
    setjmp_buf buf;
    int flag = 0;
    setjmp_s(&buf);
    printf("test2: cnt %d, before recursive.\n", cnt);
    flag++;
    if(flag < 2) test2(cnt + 1, &buf);
    printf("test2: cnt %d, after recursive.\n", cnt);
    longjmp_s(bufptr, 1);
}

int main() {
    test1();
    test2(0, NULL);
    return 0;
}


