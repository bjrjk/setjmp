.globl _setjmp_s
.globl _longjmp_s

_setjmp_s:
    # uint64_t __cdecl setjmp_s(setjmp_buf *buf);
    # &buf in %rdi
    testq %rdi, %rdi    # If ptr is NULL, return in-place.
    jz _setjmp_s_ret
    movq (%rsp), %rax   # Save %rip
    movq %rax, (%rdi)
    movq %rbx, 8(%rdi)  # Save %rbx
    movq %rsp, 16(%rdi) # Save %rsp
    movq %rbp, 24(%rdi) # Save %rbp
    movq %r12, 32(%rdi) # Save %r12
    movq %r13, 40(%rdi) # Save %r13
    movq %r14, 48(%rdi) # Save %r14
    movq %r15, 56(%rdi) # Save %r14
    _setjmp_s_ret:
    movq $0, %rax       # Return 0
    ret

_longjmp_s:
    # void __cdecl longjmp_s(setjmp_buf *buf, uint64_t retVal);
    # &buf in %rdi, retVal in %rsi
    testq %rdi, %rdi    # If ptr is NULL, return in-place.
    jz _longjmp_s_ret
    movq 8(%rdi), %rbx  # Restore %rbx
    movq 16(%rdi), %rsp # Restore %rsp
    movq 24(%rdi), %rbp # Restore %rbp
    movq 32(%rdi), %r12 # Restore %r12
    movq 40(%rdi), %r13 # Restore %r13
    movq 48(%rdi), %r14 # Restore %r14
    movq 56(%rdi), %r15 # Restore %r14
    movq (%rdi), %rax   # Move new %rip in stack
    movq %rax, (%rsp)
    _longjmp_s_ret:
    movq %rsi, %rax     # Set return value
    ret
