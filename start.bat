@echo off
setlocal
cd /d "%~dp0"
if not exist ".venv\Scripts\python.exe" (
 echo EasyFlow is not set up yet. Run setup.bat first.
 pause
 exit /b 1
)
set "NS_HOST=127.0.0.1"
set "NS_PORT=8000"
if exist "config.bat" call "config.bat"
if "%NS_HOST%"=="0.0.0.0" (
 echo WARNING: LAN access enabled. Only use on trusted networks.
 set "BROWSER_HOST=127.0.0.1"
) else (
 set "BROWSER_HOST=%NS_HOST%"
)
echo Starting EasyFlow at http://%BROWSER_HOST%:%NS_PORT%/dashboard
start "" "http://%BROWSER_HOST%:%NS_PORT%/dashboard"
".venv\Scripts\python.exe" -m uvicorn backend.main:app --host %NS_HOST% --port %NS_PORT%
if errorlevel 1 echo Server stopped with an error. Check port and dependencies.
pause
