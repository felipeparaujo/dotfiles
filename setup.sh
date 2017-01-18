#!/bin/sh
ENVPATH="$HOME/.env"
mkdir "$ENVPATH"
cp * "$ENVPATH"
cd zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git "$ENVPATH/zsh/.oh-my-zsh/custom"
ln -s "$ENVPATH/zsh/.oh-my-zsh/custom/powerlevel9k/powerlevel9k.zsh-theme" "$ENVPATH/zsh/.oh-my-zsh/themes"
ln -s "$HOME/.env/zsh/.zshrc" "$HOME/.zshrc"
ln -s "$HOME/.env/vim/.vim" "$HOME/.vim"
ln -s "$HOME/.env/vim/.vimrc" "$HOME/.vimrc"
