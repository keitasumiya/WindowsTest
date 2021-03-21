@REM @REM getAudioDuration.bat sound.wav

@echo off
setlocal
cd %~dp0

set filename=%1
set CMD="ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 %filename%"
set duration=
for /f "usebackq delims=" %%a in (`%CMD%`) do set duration=%%a
echo %duration%
echo %duration%
echo %duration%

endlocal
exit /b 0