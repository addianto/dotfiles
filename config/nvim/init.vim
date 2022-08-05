" References:
" - https://neovim.io/doc/user/options.html
" - https://neovim.io/doc/user/starting.html#vimrc "

" Plugin "
" Use vim-plug: https://github.com/junegunn/vim-plug
call plug#begin()
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'arcticicestudio/nord-vim'
call plug#end()

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
colorscheme nord

" Text editing experience "
set backspace=indent,eol,start
set encoding=utf-8
set ignorecase      " Ignore case when searching
set hlsearch        " Highlight matches
set incsearch

" Plugin configuration "

"" editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"" lightline
let g:lightline = {
    \ 'colorscheme': 'nord',
    \ }

"" ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"" ale
"" https://github.com/dense-analysis/ale#5xvi-will-this-plugin-eat-all-of-my-laptop-battery-power
