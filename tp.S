;;Le registre EDI (Destination Index) et le registre ESI (Source Index)
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
        push rbp        ;; prologue 3615casertaquoi
        mov rbp, rsp
        mov rax, 0

        beg:
          mov cl, [rdi]
          inc rdi

          cmp cl, 0
          jz end

          inc rax
          jmp beg

        end:

        mov rsp, rbp    ;; epiklog 3615bis
        pop rbp
        ret
main:
        push rbp        ;; prologue 3615casertaquoi
        mov rbp, rsp

        mov rdi, txt
        call my_strlen

        mov rsp, rbp    ;; epiklog 3615bis
        pop rbp

        push rbp
        mov rbp, rsp

        mov rdx, rax
        mov rax, 3
        mov rdi, s1
        mov rsi, txt
        call printf

        mov rsp, rsp
        pop rbp

        mov rax, 60     ;; exit syscall
        mov rdi, 0	;; exit()
        syscall		;; Appel du syscall \o/

        ret

;; RO section
section .rodata
txt db "Hello Word !", 0Ah, 0
s1 db 'Longueur de "%s" = %i', 0Ah, 0
