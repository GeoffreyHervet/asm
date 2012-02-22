;; Declaration des symboles

global main
extern printf

;; code
section .text

main:
        push rbp
        mov rbp, rsp

        mov rdi, FormatString
        call printf

        mov rsp, rbp
        pop rbp

        mov rax, 60
        xor rdi, rdi
        syscall

        ret

;; RO section
section .rodata
FormatString db 'Hello Word !', 0Ah, 0
