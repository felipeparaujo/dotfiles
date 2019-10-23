#!/usr/bin/env zsh
set -e

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

setup_zsh
setup_vim

setup_zsh() {
  cp -f "$SCRIPTPATH/zsh/.zshenv" "$HOME/.zshenv"
  exec "$SHELL"

  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

  cp -f "$SCRIPTPATH/zsh/.zshrc" "${ZDOTDIR:-$HOME}/.zprezto/runcoms/"
  cp -f "$SCRIPTPATH/zsh/.zpreztorc" "${ZDOTDIR:-$HOME}/.zprezto/runcoms/"
  cp -f "$SCRIPTPATH/zsh/.p10k.zsh" "${ZDOTDIR:-$HOME}/"

  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
}

setup_vim() {
  git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.config/nvim/bundle/Vundle.vim"
  cp "$SCRIPTPATH/nvim/init.vim" "$HOME/.config/nvim/"
  vim +PluginInstall +qall
}
