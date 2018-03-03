:::::::::::::::
:: BUILD.BAT
:::::::::::::::
@ECHO OFF
:::::::::::::::
:: Init Shell
CALL "%~dp0..\_tools\_initextshell.bat"
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
:: Test
chgcolor %CTEXT%
ECHO Building glm

:::::::::::::::
:: Check install _install folder hierarchy
CALL _init_install.bat

:::::::::::::::
:: Install Commands
copy "%EXTLIBS_DIR%\glew-2.1.0\lib\Release\x64\glew32s.lib" "%EXTLIBS_DIR%\_install\debug_x64\lib\glew32s.lib"
copy "%EXTLIBS_DIR%\glew-2.1.0\lib\Release\x64\glew32s.lib" "%EXTLIBS_DIR%\_install\release_x64\lib\glew32s.lib"

xcopy /e /h /y "%EXTLIBS_DIR%\glew-2.1.0\include" "%EXTLIBS_DIR%\_install\include\"

:::::::::::::::
:: Reaching End of the Script
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

