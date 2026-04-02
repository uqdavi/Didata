@echo off
REM Script que executa o Didata preservando o diretório de trabalho atual
REM Passa o diretório atual como variável de ambiente para o Java

setlocal enabledelayedexpansion
set ORIGINAL_CWD=%CD%

java -jar "%~dp0didata.jar" %*

endlocal
