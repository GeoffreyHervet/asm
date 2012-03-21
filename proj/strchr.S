[BITS 64]

global my_strchr

section .text

; char *my_strchr(const char *s, int c);
; rax             rdi  	          rsi

my_strchr:
  push rbp		; prologue
  mov rbp, rsp

  xor rdx, rdx		; compteur
  and rsi, 0xFF

_while:
  mov rax, [rdi + rdx]
  and rax, 0xFF		; Pour comparer juste le char

  cmp rax, rsi		; while s[rdx] != c
  je _endwhile
  ;cmp BYTE [rdi+rdx], 'o'

  inc rdx
  jmp _while

_endwhile:
  mov rax, rdi
  add rax, rdx		; return s + rax

  mov rsp,rbp		; epilogue
  pop rbp
  ret
