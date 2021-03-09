@echo off
 
if not "%~0"=="%~dp0.\%~nx0" (
     start /min cmd /c,"%~dp0.\%~nx0" %*
     exit
)
 
echo "Thit is a test!!"
echo "hoge!"
echo %*
 
pause
exit