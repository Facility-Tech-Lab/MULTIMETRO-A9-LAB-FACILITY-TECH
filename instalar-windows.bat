@echo off
chcp 65001 >nul
title Instalador - Plugin OBS Multimetro JTX A9

set "DLL=facility-tech-meter.dll"
set "ORIGEM=%~dp0%DLL%"

echo ============================================
echo  INSTALADOR - PLUGIN OBS - MULTIMETRO JTX A9
echo ============================================
echo.

if not exist "%ORIGEM%" (
  echo [ERRO] Arquivo %DLL% NAO encontrado na pasta do instalador.
  echo Extraia o ZIP inteiro antes de executar este arquivo.
  echo.
  pause
  exit /b 1
)

rem ============================================================
rem  OBS 33 Windows procura plugins em (nesta ordem):
rem  1) %OBS_PLUGINS_PATH%\<Plugin>\<Plugin>.dll
rem  2) C:\ProgramData\obs-studio\plugins\<Plugin>\<Plugin>.dll
rem  SEM a subpasta "bin" (isso e so do formato antigo).
rem ============================================================

if defined OBS_PLUGINS_PATH (
  set "DEST=%OBS_PLUGINS_PATH%\facility-tech-meter"
  echo Usando OBS_PLUGINS_PATH do sistema.
) else (
  set "DEST=%ProgramData%\obs-studio\plugins\facility-tech-meter"
  echo Variavel OBS_PLUGINS_PATH nao definida.
  echo Usando pasta de dados do sistema.
)

echo Pasta de destino: %DEST%
echo.

if not exist "%DEST%" mkdir "%DEST%" 2>nul

echo Copiando o plugin...
copy /Y "%ORIGEM%" "%DEST%\%DLL%" >nul 2>nul

if not exist "%DEST%\%DLL%" (
  echo [AVISO] Nao foi possivel gravar em %DEST%
  echo Tentando na pasta do usuario...
  set "DEST=%APPDATA%\obs-studio\plugins\facility-tech-meter"
  if not exist "%DEST%" mkdir "%DEST%" 2>nul
  copy /Y "%ORIGEM%" "%DEST%\%DLL%" >nul 2>nul
)

echo.
if exist "%DEST%\%DLL%" (
  echo [OK] Plugin instalado com sucesso em:
  echo      %DEST%\%DLL%
  echo.
  dir "%DEST%\%DLL%"
  powershell -NoProfile -Command "Unblock-File -Path '%DEST%\%DLL%'" >nul 2>nul
) else (
  echo [ERRO] O plugin NAO foi copiado.
  echo Execute este arquivo como administrador.
  echo.
  pause
  exit /b 1
)

echo.
tasklist /FI "IMAGENAME eq obs64.exe" 2>nul | find /I "obs64.exe" >nul
if not errorlevel 1 (
  echo [ATENCAO] O OBS ainda esta rodando!
  echo Feche o OBS COMPLETAMENTE, inclusive o icone na bandeja,
  e abra novamente.
) else (
  echo OBS nao esta rodando. Pode abrir o OBS agora.
)
echo.
echo Se a fonte nao aparecer, abra o OBS em:
echo   Ajuda - Arquivo de registro - Mostrar arquivo de registro
echo e me mande o log mais recente.
echo.
pause
