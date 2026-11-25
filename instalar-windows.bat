@echo off
chcp 65001 >nul
title Instalador - Plugin OBS Multimetro JTX A9

set "DLL=facility-tech-meter.dll"
set "ORIGEM=%~dp0%DLL%"
set "DEST=%APPDATA%\obs-studio\plugins\facility-tech-meter\bin"

echo ============================================
echo  INSTALADOR - PLUGIN OBS - MULTIMETRO JTX A9
echo ============================================
echo.
echo Pasta do instalador : %~dp0
echo Pasta de destino    : %DEST%
echo.

if not exist "%ORIGEM%" (
  echo [ERRO] Arquivo %DLL% NAO encontrado na pasta do instalador.
  echo Extraia o ZIP inteiro antes de executar este arquivo.
  echo.
  pause
  exit /b 1
)

if not exist "%DEST%" (
  echo Criando pasta de destino...
  mkdir "%DEST%" 2>nul
)

echo Copiando o plugin...
copy /Y "%ORIGEM%" "%DEST%\%DLL%"

echo.
if exist "%DEST%\%DLL%" (
  echo [OK] Plugin instalado com sucesso!
  echo.
  dir "%DEST%\%DLL%"
) else (
  echo [ERRO] O plugin NAO foi copiado para a pasta de destino.
  echo.
  pause
  exit /b 1
)

echo.
tasklist /FI "IMAGENAME eq obs64.exe" 2>nul | find /I "obs64.exe" >nul
if not errorlevel 1 (
  echo [ATENCAO] O OBS ainda esta rodando!
  echo Feche o OBS COMPLETAMENTE, inclusive o icone na bandeja,
  echo e abra novamente para carregar o plugin.
) else (
  echo OBS nao esta rodando. Pode abrir o OBS agora.
)
echo.
echo Se a fonte nao aparecer, feche o OBS, execute este
echo instalador de novo e abra o OBS novamente.
echo.
pause
