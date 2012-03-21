[BITS 64]

global strchr

section .text

; char *strchr(const char *s, int c);
; rax             rdi          rsi

strchr:
  push rbp		; prologue
  mov rbp, rsp

  xor rdx, rdx		; compteur
  and rsi, 0xFF

_while:
  mov rax, [rdi + rdx]
  and rax, 0xFF		; Pour comparer juste le char

  cmp rax, rsi		; while s[rdx] != c
  je _endwhile
  cmp rax, 0
  je _notfound

  inc rdx
  jmp _while

_notfound:
  mov rax, 0
  jmp _epilog

_endwhile:
  mov rax, rdi
  add rax, rdx		; return s + rax

_epilog:
  mov rsp,rbp		; epilogue

  pop rbp
  ret
