@echo off
set /p RUNS="How many pings? [10]: "
if "%RUNS%"=="" set RUNS=10
set /p DELAY="Seconds between pings? [1]: "
if "%DELAY%"=="" set DELAY=1

echo.
echo Starting ping loop to 8.8.8.8 for %RUNS% iterations with %DELAY% second(s) between pings...
for /L %%i in (1,1,%RUNS%) do @ping -n 1 8.8.8.8 & if %%i LSS %RUNS% timeout /t %DELAY% /nobreak >nul

echo.
pause
