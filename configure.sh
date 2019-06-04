#! bin/bash

echo "installing Oh-My-ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "Done."
cd ~/.configs
echo "installing Vimrc"
cp -R .vim_runtime ~/.vim_runtime
sh ~/.vim_runtime/install_vimrc.sh
echo "Done."
echo "Copying .zshrc"
cp .zshrc ..
echo "Done."
echo "Copying .bashrc"
cp .bashrc ..
echo "Done."
