@echo off
setlocal

git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
  echo ERROR: Not inside a Git repository.
  pause
  exit /b 1
)

set "msg=%*"
if "%msg%"=="" set "msg=update"

git add -A
git diff --cached --quiet
if not errorlevel 1 (
  echo Nothing to commit.
  exit /b 0
)

git commit -m "%msg%"
git push

echo Done.
pause