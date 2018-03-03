:::::::::::::::
:: CHECK_INSTALL.BAT
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
:: Checking installation directory status
chgcolor %CTEXT%
ECHO Checking installation directory status...

SET ERRORLEVEL=0

call:checkExist "%EXTLIBS_DIR%\_install\" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\release_x64\" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\release_x64\bin\" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\release_x64\lib\" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\debug_x64\" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\debug_x64\bin\" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\debug_x64\lib\" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\include\" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\resources\" || goto :error

call:checkExist "%EXTLIBS_DIR%\_install\include\GL\" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\include\glm\" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\include\SFML\" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\include\tinyxml2.h" || goto :error

call:checkExist "%EXTLIBS_DIR%\_install\resources\monaco-editor" || goto :error

call:checkExist "%EXTLIBS_DIR%\_install\debug_x64\lib\glew32s.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\debug_x64\lib\sfml-audio-s-d.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\debug_x64\lib\sfml-graphics-s-d.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\debug_x64\lib\sfml-main-d.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\debug_x64\lib\sfml-network-s-d.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\debug_x64\lib\sfml-system-s-d.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\debug_x64\lib\sfml-window-s-d.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\debug_x64\lib\tinyxml2d.lib" || goto :error

call:checkExist "%EXTLIBS_DIR%\_install\debug_x64\lib\flac.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\debug_x64\lib\freetype.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\debug_x64\lib\ogg.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\debug_x64\lib\openal32.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\debug_x64\lib\vorbis.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\debug_x64\lib\vorbisenc.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\debug_x64\lib\vorbisfile.lib" || goto :error

call:checkExist "%EXTLIBS_DIR%\_install\debug_x64\bin\openal32.dll" || goto :error



call:checkExist "%EXTLIBS_DIR%\_install\release_x64\lib\glew32s.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\release_x64\lib\sfml-audio-s.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\release_x64\lib\sfml-graphics-s.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\release_x64\lib\sfml-main.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\release_x64\lib\sfml-network-s.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\release_x64\lib\sfml-system-s.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\release_x64\lib\sfml-window-s.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\release_x64\lib\tinyxml2.lib" || goto :error

call:checkExist "%EXTLIBS_DIR%\_install\release_x64\lib\flac.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\release_x64\lib\freetype.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\release_x64\lib\ogg.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\release_x64\lib\openal32.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\release_x64\lib\vorbis.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\release_x64\lib\vorbisenc.lib" || goto :error
call:checkExist "%EXTLIBS_DIR%\_install\release_x64\lib\vorbisfile.lib" || goto :error

call:checkExist "%EXTLIBS_DIR%\_install\release_x64\bin\openal32.dll" || goto :error

IF %ERRORLEVEL%==1 (
    goto :error
)
:::::::::::::::
:: Reaching End of the Script
GOTO :success

:::::::::::::::
:: Check Processing
:checkExist
chgcolor %CRESET%
ECHO Checking path "%~1"
IF NOT EXIST "%~1" (
    SET ERRORLEVEL=1 
    goto :error
)
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

