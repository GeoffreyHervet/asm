[BITS 64]

global	memmove

section .text

; void *memmove(void *dest, const void *src, size_t n)
; rax             rdi          rsi             rdx

memmove:
	push	rbp
        mov	rbp, rsp
        push	rcx
        push	rsi
	
        xor	rcx, rcx
        xor	rax, rax
        cmp	rdi, rsi
        jl	_while_inc
        mov	rcx, rdx

_while_dec:
	cmp	rcx, 0
        je	_end

	mov	al, [rsi + rcx]
        mov	BYTE [rdi + rcx], al

        dec	rcx
        jmp	_while_dec
_while_inc:
	cmp	rcx, rdx
        je	_end

	mov	al, [rsi + rcx]
        mov	BYTE [rdi + rcx], al
        
        inc	rcx
        jmp	_while_inc
_end:
	pop	rax	; = rsi
	pop	rcx
        leave
        ret
