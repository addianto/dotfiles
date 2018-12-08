rem Name     : setup.cmd
rem Purpose  : Windows-specific environment initialisation script
rem Author   : See Git's logs

rem Pre-initialisation
@echo OFF
setlocal
set HOME=%USERPROFILE%
set DOTFILES=%~dp0

rem Initialise XDG base dirs
set XDG_DATA_HOME="%HOME%\.local\share"
set XDG_CONFIG_HOME="%HOME%\.config"

if not exist %XDG_DATA_HOME% (
    mkdir %XDG_DATA_HOME%
)

if not exist %XDG_CONFIG_HOME% (
    mkdir %XDG_CONFIG_HOME%
)

rem Setting up Vim/Neovim
rem MKLINK invocations are restricted to Administrator-level user
rem Therefore, these commands might only works when you run this
rem script as an Administrator
if not exist "%XDG_CONFIG_HOME\nvim" (
    mkdir "%XDG_CONFIG_HOME%\nvim\pack\minpac\opt"
    mklink "%HOME%\.vimrc" "%DOTFILES%\.vim\.vimrc"
    mklink "%HOME%\.gvimrc" "%DOTFILES%\.vim\.gvimrc"
    mklink "%XDG_CONFIG_HOME%\nvim\init.vim" "%DOTFILES%\.vim\init.vim"
    mklink "%XDG_CONFIG_HOME%\nvim\ginit.vim" "%DOTFILES%\.vim\.gvimrc"
    where /q git && git clone https://github.com/k-takata/minpac.git "%XDG_CONFIG_HOME%\nvim\pack\minpac\opt\minpac"
)

rem Post-initialisation
endlocal
echo ON
@exit /B 0
