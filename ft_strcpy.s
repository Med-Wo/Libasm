; ----------------------------------------------------------------------------------------
; ft_strcpy - Copier une chaîne. Runs on 64-bit Linux only.
;
;	char *ft_strcpy(char *dest, const char *src);
; ----------------------------------------------------------------------------------------
			global	ft_strcpy		; Declaration du nom de la fonction
			extern	ft_strlen

			section .text			; Debut des instruction de la fonction
ft_strcpy:
			push rdi			; Copie dest(RDI) sur la pile
			cmp  rdi, 0			; Verifie si dest(RDI) est NULL
			jz   check_null			; Si dest(RDI) est NULL jump label check_null
			cmp  rsi, 0			; Verifie si src(RSI) est NULL
			jz   return			; Si src(RSI) est NULL jump label return
			cld				; Mise a zero du flag de direction pour movsb

copy:
			cmp  byte [rsi], 0		; Verifie si src(RSI) est egale a 0 "\0"
			jz   return			; Si src(RSI) est egale a 0 "\0" jump return
			movsb				; Copie le byte de [rsi] a [rdi] et incremente si, di
			jmp  copy			; jump au debut du label copy

return:
			mov rax, 0			; Copie 0 dans rax
			mov [rdi], rax			; Place [rdi] a 0, fin de string
			pop rax				; Recupere le buffer sauver et le place dans RAX
			ret				; Returne RAX

check_null:
			pop rdi				; Recupere le buffer sauver et le place dans RDI
			mov rax, 0			; Defini RAX a 0
			ret				; Retourne RAX(NULL)