:: Name     : setup.cmd
:: Purpose  : Windows-specific environment initialisation script
:: Author   : See Git's logs

:: Pre-initialisation
@ECHO OFF
SETLOCAL
SET home=%USERPROFILE%
SET dotfiles=%~dp0

:: MKLINK invocations are restricted to Administrator-level user
:: Therefore, these commands might only works when you run this
:: script as an Administrator
MKLINK /D "%home%\vimfiles" "%dotfiles%\.vim"
MKLINK "%home%\.vimrc" "%home%\vimfiles\.vimrc"

:: Post-initialisation
ENDLOCAL
ECHO ON
@EXIT /B 0
