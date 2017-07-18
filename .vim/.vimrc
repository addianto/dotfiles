" Setup plugins (instructions from: https://github.com/k-takata/minpac)

" Disable backward compatibility to vi
if &compatible
    set nocompatible
endif

" Add plugins
if exists('*minpac#init')
    call minpac#init()
    call minpac#add('k-takata/minpac', {'type': 'opt'})

    " Plugins
    call minpac#add('ap/vim-css-color')
    call minpac#add('ctrlpvim/ctrlp.vim')
    call minpac#add('itchyny/lightline.vim')
    call minpac#add('janko-m/vim-test')
    call minpac#add('klen/python-mode')
    call minpac#add('nathanaelkane/vim-indent-guides')
    call minpac#add('othree/html5.vim')
    call minpac#add('scrooloose/nerdtree')
    call minpac#add('sheerun/vim-polyglot')

    " Colors
    call minpac#add('lifepillar/vim-solarized8', {'type': 'opt'})
    call minpac#add('tomasr/molokai', {'type': 'opt'})

endif

" Spaces & tabs "
set tabstop=4           " 4-spaces tab
set expandtab           " Use spaces for tabs
set softtabstop=4       " 4-spaces tab
set shiftwidth=4        " An indent gives 4 spaces
set autoindent          " Self-explanatory
set smartindent
filetype indent on
filetype plugin on

" User interface "
set number                  " Show line numbers
set showcmd                 " Show command in bottom bar
set nocursorline            " Highlight current line
set wildmenu                " Autocomplete-assist menu
set showmatch               " Highlight matching parenthesis
set ruler                   " Show row & column number at bottom-right
set modelines=1
set laststatus=2
set noshowmode
colorscheme desert          " Preferred color scheme
syntax enable               " Syntax highlighting

if has('gui_running')
    set guioptions-=T   " No toolbar
    if has('gui_win32')
        set guifont=Consolas:h11
        colorscheme solarized8_dark
    endif
endif

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
"
" Plugins configuration
let g:pymode_python = 'python3'
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ }

" Custom user commands
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
