@echo off
title Git Push Tool
cd /d "%~dp0"

echo ===================================================
echo             Git Auto Push to GitHub
echo ===================================================
echo.

git status
echo.
set /p commit_msg="Enter commit message (Press Enter for 'Update files'): "
if "%commit_msg%"=="" set commit_msg=Update files

echo.
echo [1/3] Adding changes...
git add .

echo [2/3] Committing changes...
git commit -m "%commit_msg%"

echo [3/3] Pushing to GitHub (main)...
git push origin main

echo.
if errorlevel 1 (
    echo [ERROR] Push failed! Please check your network or token.
) else (
    echo [SUCCESS] Pushed to GitHub successfully!
)
echo.
pause
