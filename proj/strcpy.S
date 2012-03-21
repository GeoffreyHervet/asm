[BITS 64]

global strcpy

section .text

; char *strcpy(char *dest, const char *src);
; rax             rdi          rsi

strcpy:
  push rbp		; prologue
  mov rbp, rsp

  mov rdi, rax		; valeur de retour
  xor rcx, rcx		; Compteur

_while:
  mov r8, [rsi+rcx]
  and r8, 0xFF
  cmp r8, 0
  je _endwhile

  mov [rdi+rcx], r8
  inc rcx
  jmp _while

_endwhile:

  mov rsp,rbp		; epilogue
  pop rbp
  ret
