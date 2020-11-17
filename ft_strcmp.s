; ----------------------------------------------------------------------------------------
; ft_strcmp - Comparaison de deux chaînes . Runs on 64-bit Linux only.
;
;	int ft_strcmp(const char *s1, const char *s2);
; ----------------------------------------------------------------------------------------
			global	ft_strcmp				; Declaration du nom de la fonction

			section .text					; Debut des instruction de la fonction
ft_strcmp:
			xor rax, rax					; Initialise RAX a 0
			cmp rdi, 0						; Verifie si s1(RDI) est NULL 
			je check_null					; Jump label check_null si la comparaison est egal
			cmp rsi, 0						; Verifie si s2(RSI) est NULL
			je greater						; Jump label greater si la comparaison est egal
			cld								; Mise a zero du flag de direction pour movsb

compare:
			cmp  byte [rdi], 0				; Compare le byte RDI a 0 "\0"
			je   less						; Jump label less si la comparaison est egal
			cmp  byte [rsi], 0				; Compare le byte RSI a 0 "\0"
			je 	 greater 					; Jump label greater si la comparaison est egal
			cmpsb							; Compare les bytes des strings (RSI, RDI) et inc SI ET DI
			je  compare						; Jump label compare si la comparaison est egal

mismatch:
			dec di							; Decremente SI
			dec si							; Decremente DI
			mov al, byte [rdi]				; Copie dans le 1er octet de RAX(AL) le byte de RDI(ES[DI])
			sub al, byte [rsi]				; Soustrait AL au byte de RSI(DS[SI])
			jnc return						; Jump label si la soustraction ce termine sans retenu (Carry Flag)
											; Permets la gestion des overflow(char unicode)
			neg al							; Calcul l'oppose du 1er octet de RAX(AL) 
			neg eax							; Calcul l'oppose des 4 premier octet de RAX(EAX)

return:
			ret								; Retour de RAX

less:
			cmp byte [rsi], 0				; Compare le byte RSI a 0 "\0"
			je return						; Jump label return si la comparaison est egal
			mov rax, -1						; Donne la valeur de -1 a RAX
			ret								; Retour de RAX

greater:
			mov rax, 1						; Donne la valeur de 1 a RAX
			ret								; Retour de RAX

check_null:
			cmp rsi, 0				; Compare le byte RSI a 0 "\0"
			je return						; Jump label return si la comparaison est egal
			mov rax, -1						; Donne la valeur de -1 a RAX
			ret								; Retour de RAX