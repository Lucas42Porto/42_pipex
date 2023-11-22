# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lumarque <lumarque@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/06 19:46:03 by lumarque          #+#    #+#              #
#    Updated: 2023/11/14 18:06:26 by lumarque         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = pipex

SRC = pipex.c
OBJS = ${SRC:.c=.o}

RULE = .all
HEADER = pipex.h
INCLUDE = -I .

MAKE = make -C
CC = cc
RM = rm -f
CFLAGS = -Wall -Wextra -Werror -g #-fsanitize=address
LIBFT_PATH = ./libft
LIBFT = -L ${LIBFT_PATH} -lft

GREEN = \033[0;32m
YELLOW = \033[0;33m
END = \033[0m

%.o: %.c
	@${CC} ${CFLAGS} ${INCLUDE} -c $< -o $@
	@echo "\nObject files created"

all: ${NAME}

${NAME}: ${RULE} ${OBJS} ${HEADER}
	${MAKE} ${LIBFT_PATH}
	${CC} ${OBJS} ${LIBFT} ${MLX} -o ${NAME}
	@echo "\n${NAME} created"

${RULE}:
	@touch ${RULE}


clean:
	@${RM} ${OBJS} ${RULE} 
	@echo "\nObject files removed"
	@make fclean -s -C Libft

fclean: clean
	@${RM} ${NAME} here_doc
	@echo "\n${NAME} removed"

re: fclean all

tests:
	@rm -f infile infile.txt outfile outfile.txt no_permissions.txt
	@echo "\n\n$(GREEN)------NORM ERRORS------$(END)"
	@norminette | grep Error
	@echo "\n\n$(GREEN)------WITHOUT FILE PERMISSIONS------$(END)\n"
	@echo "a a a" > no_permissions.txt
	@chmod 000 no_permissions.txt
	@echo "./pipex no_permissions.txt \"grep a\" \"wc -w\" outfile.txt"
	@echo "\n Shell result:"
	@< no_permissions.txt grep a | wc -w > outfile.txt; echo "Error: $$?"
	@rm -f no_permissions.txt outfile.txt
	@echo "a a a" > no_permissions.txt
	@chmod 000 no_permissions.txt
	@echo "\n Your result:"
	@./pipex no_permissions.txt "grep a" "wc -w" outfile.txt; echo "Error: $$?"
	@echo "\n\n$(GREEN)------WITH FILE PERMISSIONS------$(END)\n"
	@echo "a a a" > permissions.txt
	@chmod 777 permissions.txt
	@echo "./pipex permissions.txt \"grep a\" \"wc -w\" outfile.txt"
	@echo "\n Shell result:"
	@< permissions.txt grep a | wc -w > outfile.txt; echo "Error: $$?"
	@cat outfile.txt | cat -e
	@rm -f permissions.txt outfile.txt
	@echo "a a a" > permissions.txt
	@chmod 777 permissions.txt
	@echo "\n Your result:"
	@./pipex permissions.txt "grep a" "wc -w" outfile.txt; echo "Error: $$?"
	@cat outfile.txt | cat -e
	@rm -f permissions.txt outfile.txt
	@echo "\n\n$(GREEN)------TEST N1------$(END)\n"
	@echo "./pipex infile.txt \"cat\" \"wc -l\" outfile.txt"
	@echo "\n$(YELLOW)WITHOUT INFILE$(END)\n"
	@echo "Shell result:"
	@< infile.txt cat | wc -l > outfile.txt; echo "Error: $$?"
	@cat outfile.txt | cat -e
	@echo "Your result:"
	@./pipex infile.txt "cat" "wc -l" outfile.txt; echo "Error: $$?"
	@cat outfile.txt | cat -e
	@echo "\n$(YELLOW)WITH INFILE$(END)\n"
	@echo "ola" > infile.txt
	@echo "Shell result:"
	@< infile.txt cat | wc -l > outfile.txt; echo "Error: $$?"
	@cat outfile.txt | cat -e
	@rm -f outfile.txt
	@echo "Your result:"
	@./pipex infile.txt "cat" "wc -l" outfile.txt; echo "Error: $$?"
	@cat outfile.txt | cat -e
	@rm -f outfile.txt
	@echo "\n\n$(GREEN)------TEST N2------$(END)\n"
	@echo "./pipex infile.txt \"grep a1\" \"wc -w\" outfile.txt\n"
	@echo "Shell result:"
	@< infile.txt grep a1 | wc -w > outfile.txt; echo "Error: $$?"
	@cat outfile.txt | cat -e
	@rm -f outfile.txt
	@echo "Your result:"
	@./pipex infile.txt "grep a1" "wc -w" outfile.txt; echo "Error: $$?"
	@cat outfile.txt | cat -e
	@rm -f outfile.txt infile.txt
	@echo "\n\n$(GREEN)------TEST N3------$(END)\n"
	@echo "./pipex infile.txt \"grep a1\" \"LOL -w\" outfile.txt\n"
	@echo "Shell result:"
	@< infile.txt grep a1 | LOL -w > outfile.txt; echo "Error: $$?"
	@cat outfile.txt | cat -e
	@rm -f outfile.txt
	@echo "Your result:"
	@./pipex infile.txt "grep a1" "LOL -w" outfile.txt; echo "Error: $$?"
	@cat outfile.txt | cat -e
	@rm -f outfile.txt no_permissions.txt

.PHONY: all clean fclean re bonus unit_tests

.IGNORE:

.SILENT: