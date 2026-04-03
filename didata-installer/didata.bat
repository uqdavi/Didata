@echo off

setlocal enabledelayedexpansion

set SCRIPT_DIR=%~dp0

set JAVA_EXE=%SCRIPT_DIR%bin\java.exe

if not exist "%JAVA_EXE%" (
    set JAVA_EXE=%SCRIPT_DIR%jre\bin\java.exe
)

if not exist "%JAVA_EXE%" (
    set JAVA_EXE=java.exe
)

"%JAVA_EXE%" -jar "%SCRIPT_DIR%didata.jar" %*

endlocal
