@echo off
setlocal
cd /d "%~dp0"
echo === EasyFlow First-Time Setup ===
if exist ".venv\Scripts\python.exe" goto install
where py >nul 2>nul
if not errorlevel 1 (
  py -3 -m venv .venv
  goto check
)
where python >nul 2>nul
if errorlevel 1 (
  echo Python not found. Install Python 3.11 or 3.12 from https://www.python.org/downloads/windows/
  echo Then run setup.bat again. No administrator access is needed for a per-user install.
  pause
  exit /b 1
)
python -m venv .venv
:check
if not exist ".venv\Scripts\python.exe" (
 echo Could not create virtual environment.
 pause
 exit /b 1
)
:install
".venv\Scripts\python.exe" -m pip install -r requirements.txt
if errorlevel 1 (
 echo Setup failed. Check internet connection and Python installation.
 pause
 exit /b 1
)
echo.
echo Setup complete. Double-click start.bat to launch EasyFlow.
pause
