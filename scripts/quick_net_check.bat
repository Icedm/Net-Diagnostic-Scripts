@echo off
cls
echo ==========================================================
echo Quick Home Network Check
echo ==========================================================
echo.

for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /C:"Default Gateway"') do set "GATEWAY=%%A"
set "GATEWAY=%GATEWAY: =%"

if not "%GATEWAY%"=="" (
  echo Gateway: %GATEWAY%
  echo --- Pinging gateway ---
  ping -n 5 %GATEWAY%
) else (
  echo No default gateway found.
)

echo.
echo --- Pinging public IP ---
ping -n 5 8.8.8.8

echo.
echo --- Pinging hostname ---
ping -n 5 example.com

echo.
echo --- Traceroute ---
tracert -d -w 2000 -h 10 example.com

echo.
echo Done.
pause
