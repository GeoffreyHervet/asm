[BITS 64]

global my_memmove

section .text

; void *memmove(void *dest, const void *src, size_t n)
; rax             rdi          rsi             rdx

my_memmove:
  push rbp		; prologue
  mov rbp, rsp
  push r8
  push r9

  xor r8, r8

_while:
  cmp rdx, r8
  jle _enwhile

  mov r9, [rsi+r8]
  mov [rdi+r8], r9

  add r8, 4
  jmp _while

_enwhile:
  mov rax, rdi
  pop r9
  pop r8
  pop rbp
  ret
