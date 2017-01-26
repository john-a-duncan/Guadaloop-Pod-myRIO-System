@ECHO OFF

SET LVDIR=%1

ECHO This script will update the LINX provider after LabVIEW closes.

:LOOP
tasklist | find /i "LabVIEW" >nul 2>&1
IF ERRORLEVEL 1 (
  GOTO CONTINUE
) ELSE (
  ECHO Waiting for LabVIEW to close.
  Timeout /T 3 /Nobreak
  GOTO LOOP
)

:CONTINUE
7z.exe x LinxProvider2014.zip -aoa -o%LVDIR%
CD %LVDIR%
start LabVIEW.exe
exit