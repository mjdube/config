# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tcajee <tcajee@student.wethinkcode.co.za>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/06/04 16:49:54 by tcajee            #+#    #+#              #
#    Updated: 2019/06/04 16:58:02 by tcajee           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS = configure.sh 

all: configure 

configure:
	sh $(SRCS)

clean:
	cd ~
	rm -rf .oh-my-zsh .bashrc .zshrc .vim_runtime .vimrc

re: clean all

.PHONY: all, clean, configure
