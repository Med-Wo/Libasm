; ----------------------------------------------------------------------------------------
; ft_read - Lire depuis un descripteur de fichier. Runs on 64-bit Linux only.
;
;	ssize_t ft_read(int fd, void *buf, size_t count);   
; ----------------------------------------------------------------------------------------
			extern __errno_location
			global ft_read

			section .text
ft_read:								; rdi = fd, rsi = buf, rdx = count
			mov rax, 0 					; Indique le numero du syscall (read) dans rax
			syscall						; Appel de la fonction systeme write
			cmp rax, 0					; Compare le retour du sys_write (rax) a 0
			jl error					; Si est plus petit que 0
			ret 						; Retour de la taille (rax) print par la fonction 

error:
			neg rax    					; Recupere de la valeur absolue sur sys_read
   			mov rdi, rax				; Copie rax dans rdi
    		call __errno_location		; Call la fonction pour set errno avec le params rdi
   			mov [rax], rdi  			; Fix la valeur de errno
   			mov rax, -1					; set rax a -1
   			ret							; ; Retour d'un erreur (rax) lors du sys_read 