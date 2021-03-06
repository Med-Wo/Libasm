# Libasm

### L’objectif de ce projet de l'Ecole 42 (Paris) est de devenir familier avec le langage assembleur.

Le langage assembleur, souvent appellé asm, est un langage de bas niveau pour ordinateur ou autre machine programmable qui possède une très forte correspondance entre le langage et l’architecture de la machine. Chaque asm est spécifique à un ordinateur particulier. A l’opposé, les langages haut-niveau sont généralement portables sur de multiples plateformes mais nécessitent com-pilation ou interprétation. Le langage assembleur peut également être appellé langagemachine symbolique.


### Instructions générales

- [x] Ecrire en ASM 64 bits. Attention aux "calling convention".
- [x] Rendre des fichiers ’.s’ et pas de l’asm inline
- [x] Compiler votre code avec nasm
- [x] Utiliser la syntaxe Intel, pas celle d’AT&T
- [x] Verifier les erreurs lors des syscalls et les renvoyer correctement
- [x] Permettre la lecture de la variable errno (de <errno.h>) depuis un fichier .c

### Partie obligatoire

```C
int		ft_strlen(char const *str);
int		ft_strcmp(char const *s1, char const *s2);
char		*ft_strcpy(char *dst, char const *src);
ssize_t		ft_write(int fd, void const *buf, size_t nbyte);
ssize_t		ft_read(int fd, void *buf, size_t nbyte);
char		*ft_strdup(char const *s1);
```
### Comment tester la partie obligatoire  

`$> make`  pour assembler la librairie libasm.a  
`$> make test` pour creer l' executable  
`$> ./test`  pour relancer l' executable  

### Ressources

* >[NASM Tutorial](https://cs.lmu.edu/~ray/notes/nasmtutorial/) 
* >[Liste instruction Assembleur Intel x86](http://jeanfrederic.gosio.free.fr/Enligne/asm/asm.html#neg) 
* >[Programmation Assembleur](https://fr.wikibooks.org/wiki/Programmation_Assembleur) 
* >[Assembly Language Instruction set](http://vitaly_filatov.tripod.com/ng/asm/) 
