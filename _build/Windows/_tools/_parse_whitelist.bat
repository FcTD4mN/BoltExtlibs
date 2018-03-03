:::::::::::::::
:: _PARSE_WHITELIST.BAT
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


chgcolor %CTEXT%
:::::::::::::::
:: Arg processing
SET "DEFAULT_WHITELIST=SFML;tinyxml2;glew;glm;cpython;Rivet"
SET "INPUT_WHITELIST="

SET "BUILD_SFML=0"
SET "BUILD_tinyxml2=0"
SET "BUILD_glew=0"
SET "BUILD_glm=0"
SET "BUILD_cpython=0"
SET "BUILD_Rivet=0"

SET "DO_CLEAN=0"

IF [%1]==[] (
    GOTO:narg
) else (
	GOTO:yarg
)

:narg
ECHO NARG
SET "INPUT_WHITELIST=%DEFAULT_WHITELIST%"
SET "DO_CLEAN=1"
GOTO:parse

:yarg
ECHO YARG
SET INPUT_WHITELIST=%1
SET INPUT_WHITELIST=%INPUT_WHITELIST:"=%
IF "%INPUT_WHITELIST%"=="%DEFAULT_WHITELIST%" SET "DO_CLEAN=1"
GOTO:parse

:parse
ECHO "%INPUT_WHITELIST%"
for %%a in (%INPUT_WHITELIST%) do (
	IF %%a==SFML SET "BUILD_SFML=1"
	IF %%a==tinyxml2 SET "BUILD_tinyxml2=1"
	IF %%a==glew SET "BUILD_glew=1"
	IF %%a==glm SET "BUILD_glm=1"
	IF %%a==cpython SET "BUILD_cpython=1"
	IF %%a==Rivet SET "BUILD_Rivet=1"
)

SET COUNTMAX=6
SET /a "SUM=%BUILD_SFML%+%BUILD_tinyxml2%+%BUILD_glew%+%BUILD_glm%+%BUILD_cpython%+%BUILD_Rivet%"
IF "%SUM%"=="%COUNTMAX%" SET "DO_CLEAN=1"

chgcolor %CEXTLIB%
ECHO [BUILD_SFML]=%BUILD_SFML%
ECHO [BUILD_tinyxml2]=%BUILD_tinyxml2%
ECHO [BUILD_glew]=%BUILD_glew%
ECHO [BUILD_glm]=%BUILD_glm%
ECHO [BUILD_cpython]=%BUILD_cpython%
ECHO [BUILD_Rivet]=%BUILD_Rivet%
ECHO [DO_CLEAN]=%DO_CLEAN%
chgcolor %CRESET%

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

