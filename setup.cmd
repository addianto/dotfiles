rem Name     : setup.cmd
rem Purpose  : Windows-specific environment initialisation script
rem Author   : See Git's logs

rem Pre-initialisation
@echo OFF
setlocal
set home=%USERPROFILE%
set dotfiles=%~dp0

rem MKLINK invocations are restricted to Administrator-level user
rem Therefore, these commands might only works when you run this
rem script as an Administrator
mklink /D "%home%\vimfiles" "%dotfiles%\.vim"
mklink "%home%\.vimrc" "%home%\vimfiles\.vimrc"

rem Post-initialisation
endlocal
echo ON
@exit /B 0
