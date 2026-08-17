@echo off
set /p RUNS="How many trace runs? [5]: "
if "%RUNS%"=="" set RUNS=5

echo.
echo Starting traceroute loop for %RUNS% runs...
for /L %%i in (1,1,%RUNS%) do (
  echo.
  echo ==== Run %%i of %RUNS% ==== 
  tracert -d -w 2000 -h 10 example.com
)

echo.
endlocal
pause
