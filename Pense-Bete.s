; ----------------------------------------------------------------- ;
; Liste des registres ASM en 64 bits 								;
; ----------------------------------------------------------------- ;

R0  R1  R2  R3  R4  R5  R6  R7  R8  R9  R10  R11  R12  R13  R14  R15
RAX RCX RDX RBX RSP RBP RSI RDI

; ----------------------------------------------------------------- ;
; Registre 64 bits contenant les paramettent envoyer aux fonctions  ;
; ----------------------------------------------------------------- ;

	For integers and pointers, rdi, rsi, rdx, rcx, r8, r9.
    For floating-point (float, double), xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7. 


; ----------------------------------------------------------------- ;
; Some examples													    ;
; ----------------------------------------------------------------- ;

mov rax, rdi		; Deplace le contenu du registre rdi dans le registre rax   rax <- rdi

; ---------------------------------------------------------------------------------- ;
; L'exemple suivant permet de rechercher le bloc de 100 octets						 ;
; commençant par LOST_A pour le caractère "A" (65 décimal).							 ;
; ---------------------------------------------------------------------------------- ;

mov	al, 'A'			
mov rcx, 100
repne scasb  		
		
