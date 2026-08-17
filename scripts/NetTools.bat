@echo off
setlocal enabledelayedexpansion
cls

REM Use plain ASCII in the console for maximum compatibility with default CMD fonts/code pages.
REM Unicode box-drawing characters can render incorrectly in some Windows console setups.

color 0B

:menu_start
cls

REM Show basic network status when the menu loads
set "ipaddr=Unknown"
set "gateway=Unknown"
set "internet=Unknown"

for /f "tokens=2 delims=:" %%I in ('ipconfig ^| findstr /R /C:"IPv4 Address" 2^>nul') do (
    set "ipaddr=%%I"
    set "ipaddr=!ipaddr: =!"
)

for /f "tokens=2 delims=:" %%G in ('ipconfig ^| findstr /R /C:"Default Gateway" 2^>nul') do (
    set "gateway=%%G"
    set "gateway=!gateway: =!"
)

ping -n 1 -w 500 8.8.8.8 >nul 2>&1
if not errorlevel 1 (
    set "internet=Connected"
) else (
    set "internet=No response"
)

echo.
echo     [------------------------------------------]
echo     [                                          ]
echo     [      [-------------------------------]   ]
echo     [      [   NETTOOLS - Diagnostic       ]   ]
echo     [      [       Toolkit v1.0            ]   ]
echo     [      [-------------------------------]   ]
echo     [                                          ]
echo     [------------------------------------------]
echo.
echo     [NETWORK STATUS]
echo     IP Address : !ipaddr!
echo     Gateway    : !gateway!
echo     Internet   : !internet!
echo.
echo     [DIAGNOSTIC OPTIONS]
echo.
echo     1. QUICK NET CHECK
echo        Gateway, Public IP, Hostname, Traceroute
echo.
echo     2. LOOP TRACE
echo        Repeated Traceroute for Pattern Detection
echo.
echo     3. LOOP PING PUBLIC
echo        Continuous Ping to 8.8.8.8 (Watch for Loss)
echo.
echo     4. EXIT
echo.
echo     ==========================================
echo.
echo.
echo     ==========================================
echo.
set /p choice="     Select an option [1-4]: "

if "%choice%"=="1" (
    color 0A
    echo.
    echo     Starting Quick Network Check...
    echo.
    call quick_net_check.bat
    goto menu_again
)

if "%choice%"=="2" (
    color 0E
    echo.
    echo     Starting Loop Trace...
    echo.
    call loop_trace.bat
    goto menu_again
)

if "%choice%"=="3" (
    color 09
    echo.
    echo     Starting Loop Ping Public...
    echo.
    call loop_ping_public.bat
    goto menu_again
)

if "%choice%"=="4" (
    color 07
    cls
    echo.
    echo     Goodbye! Stay connected!
    echo.
    timeout /t 2 /nobreak
    exit /b 0
)

REM Invalid selection
color 0E
cls
echo.
echo     Invalid selection. Please choose 1, 2, 3, or 4.
echo.
timeout /t 2 /nobreak
goto menu_start

:menu_again
color 0B
echo.
echo     [------------------------------------------]
echo     [ Press any key to return to menu...       ]
echo     [------------------------------------------]
pause >nul
goto menu_start
