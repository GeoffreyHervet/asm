[BITS 64]

global my_strcasecmp

section .text

; int my_strcasecmp(char *, char *)
; rax                rdi    rsi

my_strcasecmp:
	push	rbp
	mov	rbp, rsp
	push	rcx
	push	r8
	push	r9

	xor rcx, rcx
_while:
	mov	r8, [rdi+rcx]
	mov	r9, [rsi+rcx]
	and	r8, 0xFF
	and	r9, 0xFF
	push	r8
	push	r9

	jmp	_lower_r8
_endlower_r8:
	jmp _lower_r9
_endlower_r9:
	cmp	r8, r9
	jl	_less
	jg	_more
	cmp	BYTE [rdi+rcx], 0
	je	_equal
	pop	r9
	pop	r8
	inc	rcx
	jmp	_while

_lower_r8:
	cmp	r8, 'A'
	jl	_endlower_r8
	cmp	r8, 'Z'
	jg	_endlower_r8
	; r8 = r8 + 'a' - 'A'
	add	r8, 'a' - 'A'
	jmp	_endlower_r8

_lower_r9:
	cmp	r9, 'A'
	jl	_endlower_r9
	cmp	r9, 'Z'
	jg	_endlower_r9
	; r9 = r8 + 'a' - 'A'
	add	r9, 'a' - 'A'
	jmp	_endlower_r9

	; Cas ou c'est equal
_equal:
	xor	rax, rax
	jmp     _end
	; Cas ou > 0
_more:
	mov	rax, r8
	sub	rax, r9
	pop	r9
	pop	r8

	jmp	_end
	; Cas ou < 0
_less:
	mov	rax, r8
	sub	rax, r9
	pop	r9
	pop	r8
	jmp	_end

_end:
	push	r9
	push	r8
	pop	rcx
        leave
	ret
