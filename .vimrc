" Spaces & Tabs "
set tabstop=4           " 4-spaces tab
set expandtab           " Use spaces for tabs
set softtabstop=4       " 4-spaces tab
set shiftwidth=4        " An indent gives 4 spaces
set modelines=1
filetype indent on
filetype plugin on
set autoindent

" User Interface "
set number              " Show line numbers
set showcmd             " Show command in bottom bar
set nocursorline        " Highlight current line
set wildmenu            " Autocomplete-assist menu
set showmatch           " Highlight matching parenthesis
colorscheme desert      " Preferred color scheme
syntax enable           " Syntax highlighting

" Searching "
set ignorecase          " Ignore case when searching
set incsearch           " Search as characters are entered
set hlsearch            " Highlight matches

" Backup "
set nobackup

" Here be dragons... "
set ttyfast
set backspace=indent,eol,start          " What?
