" References:
" - https://neovim.io/doc/user/options.html
" - https://neovim.io/doc/user/starting.html#vimrc "

" Plugin "
" Use vim-plug (https://github.com/junegunn/vim-plug)
call plug#begin()
if !(has('nvim-0.9'))
    Plug 'editorconfig/editorconfig-vim'
endif
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ap/vim-css-color'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'folke/tokyonight.nvim'
Plug 'preservim/nerdtree'
call plug#end()

" Spaces & tabs "
set autoindent
set smartindent
set expandtab
set tabstop=4       " Use 4 spaces for indentation
set shiftwidth=4

" User interface "
set background=dark
set showcmd
set number
set noshowmode      " Let lightline plugin display mode information

colorscheme tokyonight-night   " Require neovim 0.7+

" Text editing experience "
set encoding=utf-8
set ignorecase      " Ignore case when searching
set hlsearch        " Highlight matches

"" Python 3 provider configuration
"" Use Python 3 provided by the virtual environment managed py pyenv
if !(empty($PYENV_ROOT))
    if !(has('win32'))
        let g:python3_host_prog = expand("$PYENV_ROOT/versions/pynvim/bin/python3")
    else
        let g:python3_host_prog = expand("$PYENV_ROOT/versions/pynvim/python3")
    endif
endif

" Plugin configuration "

"" editorconfig-vim
if !(has('nvim-0.9'))
    let g:EditorConfig_exclude_patterns = ['fugitive://.*']
endif

"" lightline
"" See available colorschemes here: https://github.com/itchyny/lightline.vim
let g:lightline = { 'colorscheme': 'tokyonight-night' }

"" ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
    \ 'dir': 'node_modules',
    \ }

"" ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_completion_enabled = 1

set omnifunc=ale#completion#OmniFunc " Use <C-x><C-o> to trigger autocompletion

if (has('nvim-0.6'))
    let g:ale_use_neovim_diagnostics_api = 1
endif

"" NERDTree
"" See https://github.com/preservim/nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
