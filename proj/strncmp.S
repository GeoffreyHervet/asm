[BITS 64]

global my_strncmp

section .text

; int strncmp(const char *s1, const char *s2, size_t n);
; rax           rdi            rdi              rdx

my_strncmp:
  push rbp		; prologue
  mov rbp, rsp
  push rcx
  push r8
  push r9
  push r10

  xor rcx, rcx
_while:
  cmp rcx, rdx
  je _equal
  mov r8, [rdi+rcx]
  mov r9, [rsi+rcx]
  and r8, 0xFF
  and r9, 0xFF
  cmp r8, r9
  jl _less
  jg _more
  cmp r8, 0
  je _equal
  inc rcx
  jmp _while

_equal:
  mov rax, 0
  jmp _end

_less:
;  mov rax, -1
  mov rax, r8
  sub rax, r9
  jmp _end

_more:
;  mov rax, 1
  mov rax, r8
  sub rax, r9
  jmp _end

_end:
  pop r10
  pop r9
  pop r8
  pop rcx
  mov rsp,rbp		; epilogue
  pop rbp
  ret
