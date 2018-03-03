:::::::::::::::
:: _INITGITSUBMODULES.BAT
:::::::::::::::
@ECHO OFF
:::::::::::::::
:: Init Shell
CALL "%~dp0../_initextshell.bat"
:::::::::::::::
:: HEADER
chgcolor %CHEADER%
ECHO //////////
ECHO %0: START
:::::::::::::::
:: Init Bolt Dev Env Variables
CALL _initextenv.bat || goto :error
:::::::::::::::

:::::::::::::::
:: Checking changes & warning before issuing git operation
SETLOCAL
CALL "%EXTLIBS_BUILD_WIN_TOOLS_GIT_DIR%\_checkgitstatus.bat" || goto :error
ENDLOCAL

:::::::::::::::
:: CD To Bolt Repository Root
PUSHD "%CD%"
CD %EXTLIBS_DIR%

:::::::::::::::
:: Running Submodules init & update recursively, output enabled
chgcolor %CGIT%
@ECHO ON
git submodule update --init --recursive
@ECHO OFF

POPD

GOTO :success

:::::::::::::::
:error
chgcolor %CERROR%
ECHO %0: ERROR
ECHO //////////
chgcolor %CRESET%
EXIT /B 1

:::::::::::::::
:success
chgcolor %CSUCCESS%
ECHO %0: SUCCESS
ECHO //////////
chgcolor %CRESET%
EXIT /B 0

