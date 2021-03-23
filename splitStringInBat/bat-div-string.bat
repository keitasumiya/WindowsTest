@echo off
set moji="test sample 1 10"
rem すべての引数をスペースで分割
for /f "tokens=2 delims= " %%a in (%moji%) do echo %%a
pause