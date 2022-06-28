@echo off
title NDIP.bat
mode con: cols=53 lines=3


 ipconfig | findstr /R /C:"IPv4 Address

pause>nul