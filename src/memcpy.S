[BITS 64]

global memcpy

section .text
; void *memcpy(void *dest, const void *src, size_t n);
; rax            rdi           rsi            rdx

memcpy:
	push	rbp
        mov	rbp, rsp
        push	rcx

	xor	rcx, rcx
_while:
	cmp	rcx, rdx
        je	_end

        mov	al, [rsi + rcx]
        mov	[rdi + rcx], al
        inc	rcx
        jmp	_while

_end:
	mov	rax, rdi
	pop	rdx
	leave
        ret
