[BITS 64]

global memset

section .text

; void* memset(void *s, int c, size_t n)
;		rdi      rsi    rdx

memset:
  push rbp		; prologue
  mov rbp, rsp

  imul rdx, 4
  xor rcx, rcx		; compteur
.while:
  cmp rcx, rdx		; while rcx <= rdx
  jg .endwhile

  mov [rdi+rcx], rsi	; remplissage
  add rcx, 4		; incrementation du compteur

  jmp .while

.endwhile:
  mov rax, rdi		; valeur de retour

  mov rsp,rbp		; epilogue
  pop rbp
  ret
