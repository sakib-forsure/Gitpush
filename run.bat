@echo off
title GitPush Server
cd /d "%~dp0"

echo ===================================================
echo             Starting GitPush Server
echo ===================================================
echo.

:: Check Python
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python is not installed or not in PATH!
    echo Please install Python 3 and add it to your PATH.
    pause
    exit /b 1
)

:: Check and install requirements if needed
echo [1/3] Checking dependencies...
python -m pip install -r requirements.txt --quiet

:: Open browser
echo [2/3] Opening browser at http://localhost:5000 ...
start "" "http://localhost:5000"

:: Start the app
echo [3/3] Running GitPush server...
echo.
python main.py

pause
