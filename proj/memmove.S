[BITS 64]

global my_memmove

section .text

; void *memmove(void *dest, const void *src, size_t n)
; rax             rdi          rsi             rdx
my_memmove:
  push rbp		; prologue
  mov rbp, rsp
  push r8

  xor r8, r8

_while:
  cmp r8, rdx
  jge _endwhile

  mov al, [rsi+r8]
  mov [rdi+r8], al
  inc r8
  jmp _while

_endwhile:
  mov rax, rdi

  pop r8
  mov rsp,rbp		; epilogue
  pop rbp
  ret
