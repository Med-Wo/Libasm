; ----------------------------------------------------------------------------------------
; ft_strlen - Calculer la longueur d'une chaîne de caractères. Runs on 64-bit Linux only.
;
;	size_t	ft_strlen(const char *str)
; ----------------------------------------------------------------------------------------
			global	ft_strlen				; Declaration du nom de la fonction

			section .text					; Debut des instruction de la fonction
ft_strlen:

			xor rax, rax					; Initialisation du registe RAX (index) a 0
			cmp rdi, 0						; Verifie si la str envoyer en params(RDI) n' est pas null
			je return						; Si RDI == NULL quit le programme et renvoi 0
  			push  rbx                		; Sauvegarde le contenu de rbx sur la pile 
  			push  rcx                		; Sauvegarde le contenu de rcx sur la pile
  			mov   rbx, rdi            		; Copie le contenu de rdi(str) dans rbx
  			xor   al, al              		; À la recherche du "\0" (AL est utilise par SCASB)
  			mov   rcx, 0xffffffff     		; Balayage la taille maximale du Registre à 80% (RCX est utilisé par REPNE)
  			repne scasb              	 	; while(repne) [rdi] != al(scasb) { inc rdi }
  			sub rdi, rbx           			; Len_chaine = &Fin de Chaine(RDI) - &Debut de chaine(RBX)
  			mov rax, rdi           	 		; Copie la taille de la chaine dans rax
  			pop rcx                	 		; Restaure le registe sauvegarge (RCX)
  			pop rbx							; Restaure le registe sauvegarge (RBX)
			dec rax							; Decremente pour retirer le "\0"

return:
			ret