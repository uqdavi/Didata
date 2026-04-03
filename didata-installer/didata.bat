@echo off
setlocal enabledelayedexpansion

REM Define o diretório onde o script está localizado (com barra final)
set SCRIPT_DIR=%~dp0

REM Procura pelo java.exe em bin (estrutura após instalação)
if exist "%SCRIPT_DIR%bin\java.exe" (
    "%SCRIPT_DIR%bin\java.exe" -jar "%SCRIPT_DIR%didata.jar" %*
) else if exist "%SCRIPT_DIR%jre\bin\java.exe" (
    REM Fallback para desenvolvimento/testes com jre em subpasta
    "%SCRIPT_DIR%jre\bin\java.exe" -jar "%SCRIPT_DIR%didata.jar" %*
) else (
    REM Fallback: tenta usar java do PATH do sistema
    java.exe -jar "%SCRIPT_DIR%didata.jar" %*
)

endlocal
