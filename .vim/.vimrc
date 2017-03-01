" Disable backward compatibility to vi
set nocompatible

" Run pathogen
execute pathogen#infect()

" Spaces & Tabs "
set tabstop=4           " 4-spaces tab
set expandtab           " Use spaces for tabs
set softtabstop=4       " 4-spaces tab
set shiftwidth=4        " An indent gives 4 spaces
set modelines=1         " ???
set autoindent          " Self-explanatory
set smartindent
filetype indent on
filetype plugin on

" User Interface "
set number              " Show line numbers
set showcmd             " Show command in bottom bar
set nocursorline        " Highlight current line
set wildmenu            " Autocomplete-assist menu
set showmatch           " Highlight matching parenthesis
set ruler               " Show row & column number at bottom-right
set background=dark
colorscheme molokai     " Preferred color scheme
syntax enable           " Syntax highlighting

" Searching "
set ignorecase          " Ignore case when searching
set incsearch           " Search as characters are entered
set hlsearch            " Highlight matches

" Backup "
set nobackup
set noswapfile

" Here be dragons... "
set ttyfast                     " ???
set backspace=indent,eol,start  " ???

" Configure Molokai colorscheme
let g:rehash256 = 1

" Configure riv.vim plugin
let g:riv_fold_auto_update = 0
