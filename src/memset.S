[BITS 64]

global memset

section .text
; rax
; rdi rsi rdx
memset:
	push	rbp
        mov	rbp, rsp
        push	rcx
        
        mov	rax, rdi
        xor	rcx, rcx

        cmp	rdi, 0
        je	_end
_while:
	cmp	rcx, rdx
        je	_end

        mov	BYTE [rax + rcx], sil	; rsi sur 8 bits
        inc	rcx
        jmp	_while
_end:
	pop	rcx
        leave
        ret
