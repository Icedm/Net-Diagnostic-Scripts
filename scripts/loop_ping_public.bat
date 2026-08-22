@echo off
setlocal EnableExtensions EnableDelayedExpansion

set /p RUNS="How many pings? [10]: "
if "%RUNS%"=="" set RUNS=10
set /p DELAY="Seconds between pings? [1]: "
if "%DELAY%"=="" set DELAY=1
set /p CREATE_LOG="Create a log file? [Y/N]: "
set "LOG_ENABLED=0"
if /I "%CREATE_LOG%"=="Y" (
	set /p LOGFILE="Log filename [ping_log.txt]: "
	if "!LOGFILE!"=="" set "LOGFILE=ping_log.txt"
	set "LOG_ENABLED=1"
	(
		echo Network ping test log
		echo Target: 8.8.8.8
		echo Started: !date! !time!
		echo Planned pings: !RUNS!
		echo Delay: !DELAY! second^(s^)
		echo.
	) > "!LOGFILE!"
	echo Logging to: !LOGFILE!
)

echo.
echo Starting ping loop to 8.8.8.8 for %RUNS% iterations with %DELAY% second(s) between pings...
set /a SUCCESS_COUNT=0
set /a FAILURE_COUNT=0
for /L %%i in (1,1,%RUNS%) do (
	set "PING_OUTPUT=%TEMP%\net_diag_ping_output.txt"
	ping -n 1 -w 1000 8.8.8.8 > "!PING_OUTPUT!"
	set "PING_RESULT=SUCCESS"
	if errorlevel 1 set "PING_RESULT=FAILURE"
	if "!PING_RESULT!"=="SUCCESS" (set /a SUCCESS_COUNT+=1) else (set /a FAILURE_COUNT+=1)
	type "!PING_OUTPUT!"
	echo RESULT: !PING_RESULT!
	if "!LOG_ENABLED!"=="1" (
		(
			echo [!date! !time!] Ping %%i of %RUNS%
			type "!PING_OUTPUT!"
			echo RESULT: !PING_RESULT!
			echo.
		) >> "!LOGFILE!"
	)
	if %%i LSS %RUNS% timeout /t %DELAY% /nobreak >nul
)

del /q "!PING_OUTPUT!" >nul 2>&1
if "!LOG_ENABLED!"=="1" (
	(
		echo Summary: !SUCCESS_COUNT! success^(es^), !FAILURE_COUNT! failure^(s^)
		echo Completed: !date! !time!
	) >> "!LOGFILE!"
)
echo.
echo Summary: !SUCCESS_COUNT! success^(es^), !FAILURE_COUNT! failure^(s^)
if "!LOG_ENABLED!"=="1" echo Log saved to: !LOGFILE!
pause
