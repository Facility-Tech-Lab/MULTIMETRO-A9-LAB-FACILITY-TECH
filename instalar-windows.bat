@echo off
chcp 65001 >nul
echo ====================================================
echo  Facility Tech Lab - MULTIMETRO JTX A9 (Windows)
echo ====================================================

set "DEST=%APPDATA%\obs-studio\plugins\facility-tech-meter"
mkdir "%DEST%\bin" 2>nul

if not exist "%~dp0facility-tech-meter.dll" (
  echo ERRO: facility-tech-meter.dll nao encontrado nesta pasta.
  pause
  exit /b 1
)

copy /Y "%~dp0facility-tech-meter.dll" "%DEST%\bin\" >nul
echo.
echo Plugin do multimetro instalado em:
echo   %DEST%\bin\facility-tech-meter.dll
echo.
echo Feche e reabra o OBS Studio para carregar a source.
echo.
pause
