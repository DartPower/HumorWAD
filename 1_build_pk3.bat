@echo off
setlocal enableextensions enabledelayedexpansion
set SRC1NAME=src
set OBJNAME=bin
goto prompt

:prompt
echo --------------------------------
echo Welcome, %USERNAME%
echo --------------------------------
echo PK3 Builder
echo --------------------------------
echo Key 1. %SRC1NAME%
echo Key N. Exit
echo --------------------------------
set /p choice=Choice number of folder to build it into game-archives: 
if "%choice%"=="" goto end
if "%choice%"=="1" goto build1
if "%choice%"=="N" goto end
goto end

:build1
cls
echo Packing...
cd %SRC1NAME%
"..\7z.exe" a -r -ssw -t7z  "..\%OBJNAME%\%SRC1NAME%-replacer.pk3" "*" >..\%OBJNAME%\logs\%SRC1NAME%.log
cd "..\%OBJNAME%"
del %SRC1NAME%.pk7
ren %SRC1NAME%-replacer.pk7 %SRC1NAME%.pk7
goto end

:end
cls
echo Press ENTER key for exit.
pause>nul
exit