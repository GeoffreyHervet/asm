[BITS 64]

global my_memset

section .text

; void* memset(void *s, int c, size_t n)
;		rdi      rsi    rdx

my_memset:
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

; [BITS 64]
; 
;         global my_memset
;         section .text
; 
; my_memset:
;                 push rbp
;                 mov rbp, rsp
;                 push rcx
;                 mov rcx, -1
;                 mov rax, rsi
; .count:
;                 inc rcx
;                 CMP rcx, rdx
;                 JNZ .fill_value
;                 JZ  .get_result
; .fill_value:
;                 mov BYTE [rdi + rcx], al
;                 JMP .count
; .get_result:
;                 mov rax,rdi
;                 pop rcx
;                 mov rsp,rbp
;                 pop rbp
;                 ret
