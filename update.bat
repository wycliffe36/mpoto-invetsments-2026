@echo off
title MPOTO INVESTMENTS - Quick Update
echo Updating MPOTO INVESTMENTS to GitHub...
set /p MSG="What did you change? (e.g., Updated dashboard): "
if "%MSG%"=="" set MSG=Updated MPOTO INVESTMENTS 2026
git add .
git commit -m "%MSG%"
git push
echo Done! Check https://github.com/wycliffe36/mpoto-investments-2026
pause
