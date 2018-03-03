:::::::::::::::
:: BUILDALL.BAT
:::::::::::::::
@ECHO OFF
:::::::::::::::
:: Init Shell
CALL "%~dp0_tools\_initextshell.bat"
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
:: Backup
PUSHD "%CD%"

:::::::::::::::
:: SHUT ASK
SET SILENT_ASK=1

:: README & Init
chgcolor %CTEXT% & TYPE "%~dp0README.txt" & CALL _ask_confirm.bat || goto :error
CALL "%EXTLIBS_BUILD_WIN_TOOLS_GIT_DIR%\_initgitsubmodules.bat" || goto :error

:: Args
CALL _parse_whitelist.bat %1 || goto:error

:: Install Dir
REM BUILD_ALL specified in _parse_whitelist
IF "%DO_CLEAN%"=="1" CALL _clean_install.bat
CALL _init_install.bat

:: Actually Init Env
CALL "%EXTLIBS_BUILD_WIN_TOOLS_MSVC_DIR%\_init_msvc.bat" || goto :error

:: Build
IF %BUILD_SFML%==1 CALL "%EXTLIBS_BUILD_WIN_DIR%\SFML\build.bat" || goto :error
IF %BUILD_tinyxml2%==1 CALL "%EXTLIBS_BUILD_WIN_DIR%\tinyxml2\build.bat" || goto :error
IF %BUILD_glew%==1 CALL "%EXTLIBS_BUILD_WIN_DIR%\glew\build.bat" || goto :error
IF %BUILD_glm%==1 CALL "%EXTLIBS_BUILD_WIN_DIR%\glm\build.bat" || goto :error

:: Check
CALL "%EXTLIBS_BUILD_WIN_DIR%\check_install.bat" || goto:error

:::::::::::::::
:: Reaching End of the Script
GOTO :success

:::::::::::::::
:error
POPD
chgcolor %CERROR%
ECHO %0: ERROR
ECHO //////////
chgcolor %CRESET%
EXIT /B 1

:::::::::::::::
:success
POPD
chgcolor %CSUCCESS%
ECHO %0: SUCCESS
ECHO //////////
chgcolor %CRESET%
EXIT /B 0

