[BITS 64]

global strlen

section .text

; size_t strlen(const char *s);
; rdi  		rdi

strlen:
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
