:::::::::::::::
:: _INIT_INSTALL.BAT
:::::::::::::::
@ECHO OFF
:::::::::::::::
:: Init Shell
CALL "%~dp0_initextshell.bat"
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
:: Creating _install folder hierarchy
chgcolor %CTEXT%
ECHO Building _install folder hierarchy
call:checkMakeDir "%EXTLIBS_DIR%\_install\"
call:checkMakeDir "%EXTLIBS_DIR%\_install\release_x64\"
call:checkMakeDir "%EXTLIBS_DIR%\_install\release_x64\bin\"
call:checkMakeDir "%EXTLIBS_DIR%\_install\release_x64\lib\"
call:checkMakeDir "%EXTLIBS_DIR%\_install\debug_x64\"
call:checkMakeDir "%EXTLIBS_DIR%\_install\debug_x64\bin\"
call:checkMakeDir "%EXTLIBS_DIR%\_install\debug_x64\lib\"
call:checkMakeDir "%EXTLIBS_DIR%\_install\include\"
call:checkMakeDir "%EXTLIBS_DIR%\_install\resources\"

:::::::::::::::
:: Reaching End of the Script
GOTO :success

:::::::::::::::
:: Dir processing
:checkMakeDir
IF NOT EXIST "%~1\" ( MKDIR "%~1" )
goto:EOF
:: Return

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

