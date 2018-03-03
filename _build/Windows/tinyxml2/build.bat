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

PUSHD "%CD%"
:::::::::::::::
:: Test
chgcolor %CTEXT%
ECHO Building tinyxml2

:: Actually Init Env
CALL "%EXTLIBS_BUILD_WIN_TOOLS_MSVC_DIR%\_init_msvc.bat" || goto :error

:::::::::::::::
:: Check install _install folder hierarchy
CALL _init_install.bat

:::::::::::::::
:: Check clean & update repo
CD "%EXTLIBS_DIR%\tinyxml2\"
chgcolor %CGIT%
@ECHO ON
git clean -f -d -x
git checkout master
git submodule update --init --recursive
@ECHO OFF

:::::::::::::::
:: Create tmp dir for out of source build
chgcolor %CRESET%
RMDIR /s /q "%EXTLIBS_DIR%\_tmp"
MKDIR "%EXTLIBS_DIR%\_tmp"

:::::::::::::::
:: Actual build commands
CD "%EXTLIBS_DIR%\_tmp"
cmake -G "Visual Studio 15 2017 Win64" -DBUILD_SHARED_LIBS=OFF -DBUILD_STATIC_LIBS=ON "%EXTLIBS_DIR%\tinyxml2\" || goto :error
cmake --build . --config Release || goto :error
cmake --build . --config Debug || goto :error

:::::::::::::::
:: Install Commands
copy "%EXTLIBS_DIR%\_tmp\Debug\tinyxml2d.lib" "%EXTLIBS_DIR%\_install\debug_x64\lib\tinyxml2d.lib"
copy "%EXTLIBS_DIR%\_tmp\Release\tinyxml2.lib" "%EXTLIBS_DIR%\_install\release_x64\lib\tinyxml2.lib"
copy "%EXTLIBS_DIR%\tinyxml2\tinyxml2.h" "%EXTLIBS_DIR%\_install\include\tinyxml2.h"

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

