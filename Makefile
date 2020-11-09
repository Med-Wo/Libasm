NAME = libasm.a

SRC = ft_strlen.s ft_strcmp.s ft_strcpy.s

ASM = nasm

ASM_FLAGS = -felf64

FLAGS = -Wall -Wextra #-Werror

OBJ_DIR = obj

# Ajoute devant chaque fichier.o OBJ_DIR/
OBJS = $(addprefix $(OBJ_DIR)/, $(SRC:%.s=%.o))

all : $(NAME)

clean : 
	@rm -rf $(OBJ_DIR)

fclean : clean
	@rm -rf $(NAME) test

re : fclean $(NAME)

test : $(NAME)
	@gcc $(FLAGS) main.c -L. -lasm -o test
	@./test

$(OBJ_DIR)/%.o: %.s
	@mkdir -p $(OBJ_DIR)
	@$(ASM) $(ASM_FLAGS) $< -o $@

$(NAME) : $(OBJS)
	ar rsc $@ $(OBJS)
	ranlib $@
