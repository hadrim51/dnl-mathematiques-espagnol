@echo off
chcp 65001 >nul
setlocal
set "SCRIPT=%~dp0navigation_defilante.py"

if not exist "%SCRIPT%" (
  echo ERREUR : navigation_defilante.py est introuvable dans :
  echo %~dp0
  echo.
  pause
  exit /b 2
)

where py >nul 2>nul
if %errorlevel%==0 (
  py -3 "%SCRIPT%" --recursive --no-pause
) else (
  where python >nul 2>nul
  if %errorlevel%==0 (
    python "%SCRIPT%" --recursive --no-pause
  ) else (
    echo ERREUR : Python 3 est introuvable.
    echo Installez Python 3 puis cochez "Add Python to PATH".
    echo.
    pause
    exit /b 2
  )
)

set "RESULT=%errorlevel%"
echo.
if "%RESULT%"=="0" (
  echo Traitement termine avec succes.
) else (
  echo Traitement termine avec le code erreur %RESULT%.
)
pause
exit /b %RESULT%
