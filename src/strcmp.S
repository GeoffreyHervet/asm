[BITS 64]

global strcmp

section .text

; int char * char *
; rax rdi    rsi

strcmp:
	push	rbp
        mov	rbp, rsp
        push	rcx

	xor	rax, rax
	xor	rcx, rcx
_while:
	mov	al, [rdi + rcx]
	cmp	al, byte [rsi + rcx]
        jl	_less
        jg	_great
        cmp	al, 0
        je	_end

        inc	rcx
        jmp	_while

_less:
	mov	rax, -1
        jmp	_end
_great:
	mov	rax, 1
	jmp	_end
_equal:
	xor	rax, rax
_end:
	pop	rcx
        leave
        ret
