NAME		=	libasm.so

CC		=	nasm
CCL		=	gcc

RM		=	rm -f
FIND		=	find

SRC		=	src/strlen.S	\
			src/strchr.S	\
			src/memset.S	\
			src/memcpy.S	\
			src/strcmp.S	\
			src/rindex.S	\
#			src/strncmp.S	\
#			src/memmove.S

CFLAGS		=	-f elf64 -g3
LDFLAGS		=	-shared

OBJS		=	$(SRC:.S=.o)


$(NAME):	$(OBJS)
		@printf "$(AFF)\033[00mCompilation with flags : \033[33m$(CFLAGS)\033[33m\n"
		@printf "\033[00mLinkage with flags : \033[33m$(LDFLAGS)\033[34m\n"
		@printf "\033[00m"
		@$(CCL) $(LDFLAGS) -o $(NAME) $(OBJS)

all:		$(NAME)

%.o:		%.S
		@$(CC) -o $@ $< $(CFLAGS)
		@printf "\033[00m[OK][\033[36m$<\033[00m]%50s\033[031m\n"

clean:
		@$(FIND) . \( -name '*~' -or -name '#*#' \) -exec rm {} \;
		@$(RM) $(OBJS)
		@echo "Object directory cleaning !"

fclean:		clean
		@$(RM) $(NAME)
		@echo "$(NAME) deleted !"

re:		fclean all

.PHONY:		all clean fclean re 
