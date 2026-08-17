@echo off
set /p RUNS="How many pings? [10]: "
if "%RUNS%"=="" set RUNS=10

echo.
echo Starting ping loop to 8.8.8.8 for %RUNS% iterations...
for /L %%i in (1,1,%RUNS%) do @ping -n 1 8.8.8.8

echo.
pause
