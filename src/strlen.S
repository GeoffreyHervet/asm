[BITS 64]

global strlen

section .text

strlen:
	push	rbp
        mov	rbp, rsp

        xor	rax, rax	; Valeur de retour
_while:
	cmp BYTE [rdi + rax], 0
        je	_end

        inc	rax
        jmp	_while
_end:
	leave
        ret
