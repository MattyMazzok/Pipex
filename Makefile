# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmazzocc <mmazzocc@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/09 03:17:03 by mmazzocc          #+#    #+#              #
#    Updated: 2023/02/09 04:21:39 by mmazzocc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC		= gcc
FLAGS	= -Wall -Wextra -Werror

NAME	= pipex
NAMEB	= pipex_bonus

INC	= inc
SRC_PATH	= src
OBJ_PATH	= obj
OBJB_PATH	= obj

SRCS = pipex.c \
		utils.c \
		utils2.c

SRCSB = pipex.bonus.c \
		utils.bonus.c \
		utils.c \
		utils2.c

SRC		= $(addprefix $(SRC_PATH)/,$(SRCS))
SRC_B	= $(addprefix $(SRC_PATH)/,$(SRCSB))
OBJ		= $(addprefix $(OBJ_PATH)/,$(SRCS:.c=.o))
OBJB	= $(addprefix $(OBJB_PATH)/,$(SRCSB:.c=.o))

all: $(NAME)

bonus: $(NAMEB)

$(NAME): $(OBJ)
	@$(CC) $(FLAGS) -o $@ $^

$(OBJ_PATH)/%.o: $(SRC_PATH)/%.c $(INC)/$(NAME).h
	@mkdir -p obj
	$(CC) $(FLAGS) -I $(INC) -c -o $@ $<

$(NAMEB): $(OBJB)
	@$(CC) $(FLAGS) -o $@ $^

$(OBJB_PATH)/%.o: $(SRC_PATH)/%.c $(INC)/$(NAMEB).h
	@mkdir -p obj_bonus
	$(CC) $(FLAGS) -I $(INC) -c -o $@ $<

clean:
	@rm -rf $(OBJ_PATH)
	@rm -rf $(OBJB_PATH)

fclean: clean
	@rm -f $(NAME) ${NAMEB}

re: fclean all


.PHONY:	all clean fclean re
