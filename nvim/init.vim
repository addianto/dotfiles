" {Neo}Vim Configuration File

" Install plugin manager (vim-plug) automatically
" https:://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install plugins using vim-plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'cocopon/iceberg.vim'
Plug 'itchyny/lightline.vim'
Plug 'sgur/vim-editorconfig'
Plug 'tpope/vim-fugitive'
if !has('nvim')
    " Install vim-sensible only when using classic Vim installation
    Plug 'tpope/vim-sensible'   
endif
Plug 'w0rp/ale'
call plug#end()

" Configure indentation
set expandtab		" Use spaces instead of tabs
set tabstop=4		" 4-spaces tab
set shiftwidth=4	" 4-spaces tab
set autoindent
set smartindent
filetype indent on
filetype plugin on

" Configure UI
set number		" Show line numbers in the gutter
set showcmd		" Show command in the bottom bar
set ruler		" Show position
set showmatch	" Highlight matching parenthesis
set wildmenu    " Enable auto-completion menu
set wildmode=longest:full,full
set noshowmode  " Do not show mode information (done by lightline)
syntax enable
colorscheme iceberg

" Configure searching behaviour
set ignorecase  " Ignore case when searching
set incsearch   " Search as characters are entered
set hlsearch    " Highligh search results

" Configure plugins
" vim-editorconfig
let g:editorconfig_blacklist = {
    \ 'filetype': ['git.*', 'fugitive'],
    \ 'pattern': ['fugitive://.*', 'scp://.*'],
    \ }

" ale
let g:ale_completion_enabled = 1

" lightline.vim
let g:lightline = {
    \ 'colorscheme': 'deus',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'smile' ] ],
    \ },
    \ 'component': {
    \   'smile': '▒(>_<)▒',
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
    \ }

" Set custom keymaps
map <silent> <A-Left> :wincmd h<CR>
map <silent> <A-Right> :wincmd l<CR>
map <silent> <A-Up> :wincmd k<CR>
map <silent> <A-Down> :wincmd j<CR>
