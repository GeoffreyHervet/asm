[BITS 64]

global rindex

section .text

; char *___(char *, int)
; rax        rdi    rsi

rindex:
	push	rbp              ; prologue
	mov	rbp, rsp
	push	rdx
	push	r8

	xor	rax, rax
	xor	rdx, rdx

_while:
	cmp	BYTE [rdi+rdx], 0
	je	_end
	mov	r8, [rdi+rdx]
	and	r8, 0xFF
	cmp	r8, rsi
	je	_new_val

_end_new_val:
	inc	rdx
	jmp	_while
	
_new_val:
	mov	rax, rdi
	add	rax, rdx
	jmp	_end_new_val

_end:
	pop	r8
	pop	rdx
        leave
	ret
