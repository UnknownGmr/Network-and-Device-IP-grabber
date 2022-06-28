@echo off
color b
start readme.md
mode con: cols=51 lines=18
IF NOT EXIST "c:\uname.txt" goto SIGNUP
IF NOT EXIST "c:\password.txt" goto SIGNUP
goto LOGIN

:SIGNUP
title NDIP CLI TOOL
cls
echo #################################################
echo                     SignUp                     
echo #################################################
echo.
set/p "unamesu=Enter Username : "
set/p "passsu=Enter Password : "
echo.
echo.
IF ["%unamesu%"] == [""] goto SIGNUPERROR
IF ["%passsu%"] ==[""] goto SIGNUPERROR
goto CREATEACC

:SIGNUPERROR
echo #################################################
echo                     Error
echo #################################################
echo Invalid Username or password
pause
goto SIGNUP

:CREATEACC
echo %unamesu% >> C:\uname.txt
echo %passsu% >> C:\password.txt
attrib "C:\uname.txt" +s +h
attrib "C:\password.txt" +s +h


:LOGIN
set/p uname= < C:\uname.txt
set/p pass=< C:\password.txt
title Login
cls
echo #################################################
echo                       Login
echo #################################################
echo.
echo.
set/p "unamel=_               Username : "
set/p "passwordl=_               Password : "
echo.
IF "%unamel%"=="" goto LOGINERROR
IF "%passwordl"=="" goto LOGINERROR
IF NOT %unamel%==%uname% goto LOGINERROR
IF NOT %passwordl%==%pass% goto LOGINERROR
goto LOADING

:LOGINERROR
echo #################################################
echo                     Error
echo #################################################
echo Invalid Username or password
pause
goto LOGIN


:LOADING
title NDIP CLI TOOL
set load=%load%******
cls
echo #################################################
echo                       Login
echo #################################################
echo.
echo.
echo                 Username : %unamel%
echo                 Password : %passwordl%
echo.
echo.
echo          Logging in...
echo          ===================================
echo          %load%
echo          ===================================
echo.                              Please Wait...
echo.
ping localhost -n 2 >nul
set/a loadnum=%loadnum% +1
if %loadnum%==5 goto DONE
goto LOADING

:DONE
title NDIP CLI TOOL
cls
echo #################################################
echo                       Done
echo #################################################
echo.
echo               #
echo             #
echo     #     #            Login Successfully
echo      #  #
echo       #
echo.
echo.
echo #################################################
pause
goto THANKS

:THANKS
title NDIP CLI TOOL
cls
echo #################################################
echo               LOADING THE SCRIPT
echo #################################################
echo.
echo    	      STARTING SCRIPT...

   
echo.
echo #################################################-
pause
start NDIP_TOOL.bat
exit