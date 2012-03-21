[BITS 64]

global my_strchr

section .text

; char *my_strchr(const char *s, int c);
; rax             rdi  	          rsi

my_strchr:
  push rbp		; prologue
  mov rbp, rsp

  xor rdx, rdx		; compteur
.while:
  cmp [rdi+rdx], rsi	; while s[rdx] != c
  je .endwhile
  ;cmp BYTE [rdi+rax], 'o'

  inc rax
  jmp .while

.endwhile:
  mov rax, rdi
  add rax, rdx		; return s + rax

  mov rsp,rbp		; epilogue
  pop rbp
  ret
