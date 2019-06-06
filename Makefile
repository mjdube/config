#
#**************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tcajee <tcajee@student.wethinkcode.co.za>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/06/04 16:49:54 by tcajee            #+#    #+#              #
#    Updated: 2019/06/04 17:11:06 by tcajee           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CONFIG = configure.sh

RELOAD = reload.sh

all: configure

configure: fclean
	sh $(CONFIG)

reload: clean
	sh $(RELOAD)

clean:
	rm -rf ~/.vim_runtime ~/.vimrc ~/.bashrc ~/.zshrc

fclean: clean
	rm -rf ~/.oh-my-zsh

re: fclean all

destroy: fclean
	rm -rf ~/.configs

.PHONY: all, clean, configure, destroy, fclean, re, reload
