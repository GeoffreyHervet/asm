[BITS 64]

global strcmp

section .text

; int strcmp(const char *s1, const char *s2);
; rax             rdi          rsi

strcmp:
  push rbp		; prologue
  mov rbp, rsp

  xor rdx, rdx
_while:
  mov r8, [rdi+rdx]
  mov r9, [rsi+rdx]
  and r8, 0xFF
  and r9, 0xFF
  cmp r8, r9
  jl _less
  jg _more
  cmp r8, 0
  je _equal
  inc rdx
  jmp _while

_equal:
  mov rax, 0
  jmp _end

_less:
  mov rax, -1
;  mov rax, r8
;  sub rax, r9
  jmp _end

_more:
  mov rax, 1
;  mov rax, r8
;  sub rax, r9
  jmp _end

_end:
  mov rsp,rbp		; epilogue
  pop rbp
  ret
