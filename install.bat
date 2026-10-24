@echo off
title MPOTO INVESTMENTS 2026 - GitHub Auto Push
color 0A
echo ===============================================
echo  MPOTO INVESTMENTS 2026 - GitHub Auto Setup
echo  Repo: wycliffe36/mpoto-investments-2026
echo ===============================================
echo.

:: Check if git is installed
git --version >nul 2>&1
if %errorlevel% neq 0 (
  echo [ERROR] Git is not installed!
  echo Please install Git from https://git-scm.com/download/win
  echo Then run this file again.
  pause
  exit /b
)

echo [1/7] Git found - OK
echo.

:: Set Git config if not set
git config --global user.name >nul 2>&1
if %errorlevel% neq 0 (
  echo Setting up Git user...
  set /p GITNAME="Enter your GitHub username (wycliffe36): "
  set /p GITEMAIL="Enter your GitHub email: "
  git config --global user.name "%GITNAME%"
  git config --global user.email "%GITEMAIL%"
) else (
  echo Git user already configured:
  git config --global user.name
  git config --global user.email
)

echo.
echo [2/7] Checking files...
if not exist index.html (
  echo [ERROR] index.html not found! Put this install.bat in same folder as index.html
  pause
  exit /b
)
echo Files OK - Found index.html

echo.
echo [3/7] Initializing Git...
if not exist .git (
  git init
) else (
  echo Git already initialized
)

echo.
echo [4/7] Adding files to Git...
git add .

echo.
echo [5/7] Committing...
set /p COMMITMSG="Enter commit message (press Enter for default): "
if "%COMMITMSG%"=="" set COMMITMSG=MPOTO INVESTMENTS 2026 - Full Hotel System Neon Edition - All Excel details
git commit -m "%COMMITMSG%"

echo.
echo [6/7] Setting branch to main...
git branch -M main

echo.
echo [7/7] Connecting to GitHub...

:: Remove old remote if exists
git remote remove origin >nul 2>&1

:: Add remote - YOUR REPO
git remote add origin https://github.com/wycliffe36/mpoto-investments-2026.git

echo.
echo ===============================================
echo  Pushing to GitHub...
echo  Repo: https://github.com/wycliffe36/mpoto-investments-2026
echo ===============================================
echo You will be asked for GitHub login
echo Username: wycliffe36
echo Password: Use Personal Access Token (not normal password)
echo Get token from: GitHub ^> Settings ^> Developer settings ^> Personal access tokens ^> Generate
echo.

git push -u origin main

if %errorlevel% equ 0 (
  echo.
  echo ===============================================
  echo  SUCCESS! MPOTO INVESTMENTS pushed to GitHub!
  echo ===============================================
  echo  Your repo: https://github.com/wycliffe36/mpoto-investments-2026
  echo  Live link (after enabling Pages): https://wycliffe36.github.io/mpoto-investments-2026/
  echo.
  echo  To make live website:
  echo  1. Go to GitHub repo ^> Settings ^> Pages
  echo  2. Source: main ^> Save
  echo ===============================================
) else (
  echo.
  echo [ERROR] Push failed!
  echo Check:
  echo 1. Did you create repo mpoto-investments-2026 on GitHub?
  echo 2. Is your Personal Access Token correct?
  echo 3. Is internet connected?
)

pause
