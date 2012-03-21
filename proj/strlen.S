[BITS 64]

global my_strlen

section .text

; size_t strlen(const char *s);
; rdi  		rdi

my_strlen:
  push rbp		; prologue
  mov rbp, rsp

  xor rax, rax		; compteur
.while:
  cmp BYTE [rdi+rax], 0	; while s[rsi] > 0
  jle .endwhile

  inc rax
  jmp .while

.endwhile:
  mov rsp,rbp		; epilogue
  pop rbp
  ret
