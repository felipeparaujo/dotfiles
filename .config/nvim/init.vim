"runtime! debian.vim

set termguicolors
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chriskempson/base16-vim'

" make theme background black

let g:airline_theme = 'base16_gruvbox_dark_hard'

" All of your Plugins must be added before the following line:
call vundle#end()            " required
filetype plugin indent on    " required

syntax on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden              " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set number
set nocompatible
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set laststatus=2

set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
set noshowmode

set backspace=indent,eol,start

augroup ColorOverride
	au!
	autocmd ColorScheme * highlight LineNr guibg=d5c4a1 guifg=1d2021 ctermbg=07 ctermfg=00
augroup END

colorscheme base16-gruvbox-dark-hard

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

