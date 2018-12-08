rem Name     : setup.cmd
rem Purpose  : Windows-specific environment initialisation script
rem Author   : See Git's logs

rem Pre-initialisation
@echo OFF
setlocal
set HOME=%USERPROFILE%
set DOTFILES=%~dp0

rem MKLINK invocations are restricted to Administrator-level user
rem Therefore, these commands might only works when you run this
rem script as an Administrator
mklink /D "%HOME%\vimfiles" "%DOTFILES%\.vim"
mklink "%HOME%\.vimrc" "%HOME%\vimfiles\.vimrc"

rem Post-initialisation
endlocal
echo ON
@exit /B 0
