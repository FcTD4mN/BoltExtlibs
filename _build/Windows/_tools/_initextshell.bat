:::::::::::::::
::_INITEXTSHELL.BAT
:::::::::::::::
@ECHO OFF
:::::::::::::::
:: GUARD
IF DEFINED _INITEXTSHELL_BAT_HH goto :EOF
:::::::::::::::

:: Add _tools to PATH for Shell Session
SET "PATH=%PATH%;%~dp0"

:: Init Shell Color Variables
REM COLOR 07
SET COLOR_Black=0
SET COLOR_Blue=1
SET COLOR_Green=2
SET COLOR_Aqua=3
SET COLOR_Red=4
SET COLOR_Purple=5
SET COLOR_Yellow=6
SET COLOR_White=7
SET COLOR_Gray=7
SET COLOR_Light_Blue=9
SET COLOR_Light_Green=A
SET COLOR_Light_Aqua=B
SET COLOR_Light_Red=C
SET COLOR_Light_Purple=D
SET COLOR_Light_Yellow=E
SET COLOR_Bright_White=F

:: Shorthand Color Cmds
SET CHEADER=1F
SET CFOOTER=1F
SET CERROR=4F
SET CSUCCESS=2F
SET CTEXT=06
SET CRESET=07

SET CEXTLIB=03
SET CGIT=09
SET CMSVC=0D
SET CQT=02

:: DEF GUARD
SET _INITEXTSHELL_BAT_HH=1

:::::::::::::::
EXIT /B 0

