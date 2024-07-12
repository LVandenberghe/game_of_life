##
## EPITECH PROJECT, 2024
## Makefile
## File description:
## Wolfram
##

BINARY_PATH := $(shell stack path --local-install-root)
NAME := wolfram

all:
	echo $(EXTRACTED)
	stack build
	cp .stack-work/install/x86_64-linux-tinfo6/528a3e8f819239f5d8dd1a57f366069e92795fe084a7511e8946a3cc09216685/9.6.4/bin/wolfram-exe ./$(NAME)

clean:
	stack clean

fclean:
	clean
	rm -f $(NAME)

re:
	fclean all

.PHONY:
	all clean fclean re
