#!/usr/bin/env zsh
set -e

PADDING=""
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

setup_zsh() {
  OLD_PADDING=${PADDING}
  PADDING="${PADDING}   > "

  echo "${PADDING}Copying .zshenv sourcing it..."
  cp -f "$SCRIPTPATH/zsh/.zshenv" "$HOME/.zshenv"
  source "$HOME/.zshenv"

  echo "${PADDING}Cloning prezto repository..."
  if  ! git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" 2>/dev/null; then
    echo "${PADDING}${ZDOTDIR:-$HOME}/.zprezto wasn't empty. Skipping cloning..."
  fi

  echo "${PADDING}Copying config files from $SCRIPTPATH/zsh/ to ${ZDOTDIR:-$HOME}..."
  cp -fa $SCRIPTPATH/zsh/ "${ZDOTDIR:-$HOME}"

  echo "${PADDING}Done!"
  PADDING=${OLD_PADDING}
}

setup_vim() {
  OLD_PADDING=${PADDING}
  PADDING="${PADDING}   > "

  if  ! git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.config/nvim/bundle/Vundle.vim" 2>/dev/null; then
    echo "${PADDING}${ZDOTDIR:-$HOME}/.zprezto wasn't empty. Skipping cloning..."
  fi

  echo "${PADDING}Copying nvim config..."
  cp "$SCRIPTPATH/nvim/init.vim" "$HOME/.config/nvim/"

  echo "${PADDING}Installing plugins..."
  nvim +PluginInstall +qall

  echo "${PADDING}Done!"
  PADDING=${OLD_PADDING}
}

if ! type git > /dev/null; then
  echo "Please install git to continue"
  exit 1
fi

if ! type nvim > /dev/null; then
  echo "Please install NeoVim to continue"
  exit 1
fi

echo "${PADDING}Setting up Vim..."
setup_vim
echo

echo "${PADDING}Setting up ZSH..."
setup_zsh

exec "$SHELL"
