[BITS 64]

global my_memset

section .text

; void* memset(void *s, int c, size_t n)
;		rdi      rsi    rdx

my_memset:
  push rbp	; prologue
  mov rbp, rsp

.boucle:
  

  mov rax, rdi	; valeur de retour
  mov rsp,rbp	;epilogue
  pop rbp
  ret
