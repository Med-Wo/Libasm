; ----------------------------------------------------------------------------------------
; ft_strlen - Calculer la longueur d'une chaîne de caractères. Runs on 64-bit Linux only.
;
;	size_t	ft_strlen(const char *s)
; ----------------------------------------------------------------------------------------
			global	ft_strlen				; Declaration du nom de la fonction

			section .text					; Debut des instruction de la fonction
ft_strlen: 									; RDI == const char *s
			cmp rdi, 0						; Verifie si la str envoyer en params(RDI) n' est pas null
			je return						; Si RDI == NULL quit le programme et renvoi 0
			xor rax, rax					; Initialisation du registe RAX (index) a 0
			jmp loop						; Jump dans le label compare

loop:										; Boucle de parcours de la chaine
			cmp byte [rdi + rax], 0			; Compare si le byte rdi a l'index rax est egale a \0 "$"
			je return						; Si rdi[rax] est egual a \0 saute au label return
			inc rax							; Incremente le registre rsi qui sert d'index
			jmp compare						; Jump au debut du label compare

return:
			ret								; Return le registre rax contenant la taille de la chaine
