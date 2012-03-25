[BITS 64]

global strchr

section .text

; char *strchr(const char *s, int c)
; rax           rdi           rsi

strchr:
	push	rbp
        mov	rbp, rsp
        push	rdx

        xor	rax, rax
_while:
	cmp BYTE [rdi + rax], 0
        je	_fail
_nofail:
	mov	rdx, [rdi + rax]
        and	rdx, 0xFF
        cmp	rdx, rsi
        je	_good
	inc	rax
        jmp	_while

_fail:
	cmp	rsi, 0
        je	_nofail
	xor	rax, rax
        jmp	_end
_good:
	add	rax, rdi
_end:
	pop	rdx
	leave
        ret
