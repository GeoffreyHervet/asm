[BITS 64]

;; Le registre EDI (Destination Index) et le registre ESI (Source Index)
;; Ces registres sont utilisés lors des opérations sur les manipulations — copie, etc. — de suites d'octets.

;; Declaration des symboles

global main
extern printf

;; code
section .text

  print_hello:
    push rbp        ;; prologue 3615casertaquoi
    mov rbp, rsp

    mov rdi, 1      ;; fd
    mov rsi, txt    ;; pointer on "Hello Word !"
    mov rdx, 13     ;; len of txt
    mov rax, 1      ;; write syscall
    syscall

    mov rsp, rbp    ;; epiklog 3615bis
    pop rbp
    ret

  my_strlen:
    push rbp        ;; prologue :begin of new stack frame
    mov rbp, rsp

    mov rax, 0	;; init de la valeur de retour
    mov rbx, 0	;; set all bits to 0 

    beg__my_strlen:
      mov bl, [rdi]
      inc rdi

      cmp bl, 0
      jz end__my_strlen

      inc rax
      jmp beg__my_strlen
    end__my_strlen:

    mov rsp, rbp    ;; epilogue
    pop rbp
    ret

  my_setmem:
    ;; my_seymem(ADDR, N, V)
    ;; rsi -> taille du tableau
    ;; rdx -> new content

    push rbp        ;; prologue :begin of new stack frame
    mov rbp, rsp

    xor rax, rax

    __loop:
      cmp rsi, 0
      jz __end
      dec rsi
      mov [rdi+rsi], rdx
      ;a=b -> ZF=1
    __end:

    mov rsp, rbp    ;; epilogue
    pop rbp
    ret


  main:
    push rbp        ;; prologue
    mov rbp, rsp

;    mov rdi, txt
;    call my_strlen
;
;    mov rdx, rax
;    mov rax, 3
;    mov rdi, s1
;    mov rsi, txt
;    call printf

    mov edi, tab
    mov esi, 15
    mov edx, 0x2121
    call my_setmem

    mov rax, 2
    mov rdi, s2
    mov rsi, tab
    call printf


    mov rsp, rsp
    pop rbp

    mov rax, 60		;; exit syscall
    xor rdi, rdi	;; exit(0)
    syscall		;; Appel du syscall \o/

    ret

;; RO section
section .rodata
  txt db "Hello Word", 0
  s1 db 'Longueur de "%s" = %i', 0Ah, 0
  s2 db 'Contenu du tableau "%s"', 0Ah, 0
  s3 db '%d\n', 0

section .data
  tab db "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", 0
  ;; resb ??

;; Segment de data non initialise
