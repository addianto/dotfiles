" Plain (neo)vim configuration, without plugins
" To use it with (neo)vim, create a symlink of ~/.vimrc pointing to this file

" Filetype detection "
filetype plugin on
filetype indent on

" Syntax highlighting "
syntax on

" Spaces & tabs "
set autoindent
set smartindent
set smarttab
set expandtab
set tabstop=4       " Use 4 spaces for indentation
set shiftwidth=4

" User interface "
set background=dark
set showcmd
set ruler
set number
set wildmenu
set laststatus=2
set noshowmode      " Let lightline plugin to display mode information instead

colorscheme evening

" Text editing experience "
set backspace=indent,eol,start
set encoding=utf-8
set ignorecase      " Ignore case when searching
set hlsearch        " Highlight matches
set incsearch
