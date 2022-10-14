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
Plug 'ap/vim-css-color'
Plug 'arcticicestudio/nord-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tiagovla/tokyodark.nvim'
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

" tokyodark.nvim configuration
let g:tokyodark_transparent_background = 1
let g:tokyodark_enable_italic_comment = 1
let g:tokyodark_enable_italic = 1

colorscheme tokyodark

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
"" See available colorschemes here: https://github.com/itchyny/lightline.vim
let g:lightline = {
    \ 'colorscheme': 'one',
    \ }

"" ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
    \ 'dir': 'node_modules',
    \ }

"" ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
