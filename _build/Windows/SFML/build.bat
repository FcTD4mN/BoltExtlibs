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
:: Backup
PUSHD "%CD%"

:::::::::::::::
:: Test
chgcolor %CTEXT%
ECHO Building SFML

:::::::::::::::
:: Check install _install folder hierarchy
CALL _init_install.bat

:::::::::::::::
:: Check clean & update repo
CD "%EXTLIBS_DIR%\SFML\"
chgcolor %CGIT%
@ECHO ON
REM git clean -f -d -x
REM git checkout master
REM git submodule update --init --recursive
@ECHO OFF

:::::::::::::::
:: Create tmp dir for out of source build
chgcolor %CRESET%
RMDIR /s /q "%EXTLIBS_DIR%\_tmp"
MKDIR "%EXTLIBS_DIR%\_tmp"

:::::::::::::::
:: Actual build commands
CD "%EXTLIBS_DIR%\_tmp"
cmake -G "Visual Studio 15 2017 Win64" -DBUILD_SHARED_LIBS=OFF -DBUILD_STATIC_LIBS=ON "%EXTLIBS_DIR%\SFML\" || goto :error
cmake --build . --config Release || goto :error
cmake --build . --config Debug || goto :error

:::::::::::::::
:: Install Commands
XCOPY /e /h /y "%EXTLIBS_DIR%\_tmp\lib\Debug" "%EXTLIBS_DIR%\_install\debug_x64\lib"
XCOPY /e /h /y "%EXTLIBS_DIR%\_tmp\lib\Release" "%EXTLIBS_DIR%\_install\release_x64\lib"
XCOPY /e /h /y "%EXTLIBS_DIR%\SFML\include" "%EXTLIBS_DIR%\_install\include"

XCOPY /e /h /y "%EXTLIBS_DIR%\SFML\extlibs\libs-msvc-universal\x64" "%EXTLIBS_DIR%\_install\debug_x64\lib"
XCOPY /e /h /y "%EXTLIBS_DIR%\SFML\extlibs\libs-msvc-universal\x64" "%EXTLIBS_DIR%\_install\release_x64\lib"

copy "%EXTLIBS_DIR%\SFML\extlibs\bin\x64\openal32.dll" "%EXTLIBS_DIR%\_install\debug_x64\bin\openal32.dll"
copy "%EXTLIBS_DIR%\SFML\extlibs\bin\x64\openal32.dll" "%EXTLIBS_DIR%\_install\release_x64\bin\openal32.dll"

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

