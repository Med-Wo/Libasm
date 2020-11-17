; ----------------------------------------------------------------------------------------
; ft_strdup  - Dupliquer une chaîne. Runs on 64-bit Linux only.
;
;	char *ft_strdup(const char *s);
; ----------------------------------------------------------------------------------------
			global ft_strdup
			extern malloc					; Appel la fonction extern malloc
			extern ft_strlen				; Appel de notre fonction ft_strlen
			extern ft_strcpy				; Appel de notre fonction ft_strcpy

			section .text
ft_strdup:									; rdi = s
			cmp rdi, 0
			je	null
			push rdi						; Stocke sur la pile rdi
			call ft_strlen					; Appel de ft_strlen(rdi) return len_str (rax)
			inc	rax							; Incremente len_str pour le \0
			mov rdi, rax					; Copie len_str(rax) dans rdi
			call malloc	wrt ..plt			; sys_malloc(rdi) ret rax (set errno en cas d'erreur)
			cmp rax, 0						; Compare le retour de sys_malloc avec 0(NULL)
			je err_malloc					; Jump label err_malloc si la comparaison est egal
			pop rsi							; recuperation depuis la pile de *s dans rsi
			mov rdi, rax					; Copie le buf(rax) dans rdi	
			call ft_strcpy					; Appel de ft_strcpy(rdi, rsi) return char *(rax)
			ret

null:
			mov rax, 0
			ret

err_malloc:
			mov rax, 0						; Set RAX a 0(NULL)
			pop rdi							; Recupere depuis la pile de *s1 dans RDI
			ret								; Renvoi RAX(NULL)
			