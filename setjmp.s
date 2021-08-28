.globl _setjmp_s
.globl _longjmp_s

_setjmp_s:
    # uint64_t __cdecl setjmp_s(setjmp_buf *buf);
    # &buf in %rdi
    movq (%rsp), %rax
    movq %rax, (%rdi)

    movq $0, %rax
    ret

_longjmp_s:
    # void __cdecl longjmp_s(setjmp_buf *buf, uint64_t retVal);
    # &buf in %rdi, retVal in %rsi
    popq %rax
    movq (%rdi), %rax
    pushq %rax

    movq %rsi, %rax
    ret

