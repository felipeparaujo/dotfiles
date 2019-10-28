#!/usr/bin/env zsh
set -e

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

setup_zsh() {
  cp -f "$SCRIPTPATH/zsh/.zshenv" "$HOME/.zshenv"
  source "$HOME/.zshenv"

  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  echo $ZDOTDIR

  cp -f "$SCRIPTPATH/zsh/zshrc" "${ZDOTDIR:-$HOME}/.zprezto/runcoms/"
  cp -f "$SCRIPTPATH/zsh/zpreztorc" "${ZDOTDIR:-$HOME}/.zprezto/runcoms/"
  cp -f "$SCRIPTPATH/zsh/.p10k.zsh" "${ZDOTDIR:-$HOME}/"

  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
  
  source "${ZDOTDIR:-$HOME}/.zshrc"
}

setup_vim() {
  git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.config/nvim/bundle/Vundle.vim"
  cp "$SCRIPTPATH/nvim/init.vim" "$HOME/.config/nvim/"
  nvim +PluginInstall +qall
}

if ! type git > /dev/null; then
  echo "Please install git to continue"
  exit 1
fi

if ! type pyenv > /dev/null; then
  echo "Please install pyenv to continue"
  exit 1
fi

if ! type nvim > /dev/null; then
  echo "Please install NeoVim to continue"
  exit 1
fi

setup_zsh
setup_vim

exec "$SHELL"
