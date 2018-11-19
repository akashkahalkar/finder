@echo off
rem color 0a
cls
:start
echo ###############################################
echo ************   FILE SniFFer ******************
echo ###############################################
echo. 
echo   _     ___  
echo  #_~`--'_)__ `===-,
echo    `.`.     `#.,//
echo    ,_\_\     ## #\
echo    `__.__    `####\
echo         ~~\ ,###'~
echo            \##'
echo.
:: Author : Akash Kahalkar (2014) 
echo.
echo Where To Search For File?
echo press N for cancel..
echo.
echo (c) C:\  (d) D:\  (e) E:\  (f) F:\  (g) G:\ 
echo.
choice /c cdefgn /M "Your choice "
cls
if %ERRORLEVEL%==1 set driv=c:\
if %ERRORLEVEL%==2 set driv=d:\
if %ERRORLEVEL%==3 set driv=e:\
if %ERRORLEVEL%==4 set driv=f:\
if %ERRORLEVEL%==5 set driv=g:\
if %ERRORLEVEL%==6 exit

echo "* What You Want To Search ?"
set /p "item={*.*} > "
cls
rem echo %item%
echo.
echo.
echo.

rem set /p "where=Your Choice => " 
echo.
echo.
echo.
title Finding..
echo Send Out Put To a) Console b) File 
choice /c ab /m "Your Choice "
cls
if %ERRORLEVEL%==1 goto Findit
if %ERRORLEVEL%==2 goto SendToFile

:Findit
Title finding
echo %d%%item%
dir /s /b %driv%%item% | more
pause 
cls
goto ask

:SendToFile
rem call find_file.bat %driv% %item%
set fn=findfile.html
set d=%driv%
set f=%item%
echo ^<html^>^<head^>^<title^>File Finder^</title^> >%fn%
echo ^<link rel="stylesheet" href="skeleton.css"^> ^</head^> >>%fn%
echo ^<body^>^<div id=main^> ^<table^> >> %fn%
echo ^<tr^>^<th^>File Name^</th^> ^<th^>Location^</th^>^</tr^> >> %fn%
echo %d% %f% 
pause
for /F "tokens=*" %%i IN ('dir /s /b %d%%f%') do (
	echo ^<tr^>^<td^>^<a href="file:///%%i"^>%%~nxi ^</a^> >> %fn%
	echo ^</td^> ^<td^> %d%%%~pi ^</td^> ^</tr^> >> %fn%
)
echo ^</table^>^</div^>^</body^>^</html^> >> %fn%
start %fn%
goto ask


:ask
prompt
echo.
echo.
echo Want To Find again?
choice /c yn
cls
if %ERRORLEVEL%==1 goto start
if %ERRORLEVEL%==2 (
echo ----------- Thank You For Using ----------
echo.
pause
goto exit
)

:exit
del %fn%
