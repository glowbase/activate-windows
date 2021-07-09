@echo off

title Activate Windows
cls

echo ============================================================================
echo Activating your Windows...
echo ============================================================================

cscript //nologo slmgr.vbs /upk > nul
cscript //nologo slmgr.vbs /cpky > nul
wmic os | findstr /I "enterprise" > nul

if %errorlevel% EQU 0 (cscript //nologo slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43 > nul & cscript //nologo slmgr.vbs /ipk DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4 > nul & cscript //nologo slmgr.vbs /ipk WNMTR-4C88C-JK8YV-HQ7T2-76DF9 > nul & cscript //nologo slmgr.vbs /ipk 2F77B-TNFGY-69QQF-B8YKP-D69TJ > nul &cscript //nologo slmgr.vbs /ipk DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ > nul & cscript //nologo slmgr.vbs /ipk QFFDN-GRT3P-VKWWX-X7T3R-8B639 > nul) else wmic os | findstr /I "10 pro" > nul
if %errorlevel% EQU 0 (cscript //nologo slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX > nul & cscript //nologo slmgr.vbs /ipk MH37W-N47XK-V7XM9-C7227-GCQG9 > nul) else wmic os | findstr /I "home" > nul
if %errorlevel% EQU 0 (cscript //nologo slmgr.vbs /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99 > nul & cscript //nologo slmgr.vbs /ipk 3KHY7-WNT83-DGQKR-F7HPR-844BM > nul & cscript //nologo slmgr.vbs /ipk 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH > nul & cscript //nologo slmgr.vbs /ipk PVMJN-6DFY6-9CCP6-7BKTT-D3WVR > nul) else (echo.)

set i=1

:server
if %i%==1 set KMS_Sev=kms8.MSGuides.com
if %i%==2 set KMS_Sev=kms9.MSGuides.com
if %i%==3 goto notsupported

cscript //nologo slmgr.vbs /skms %KMS_Sev% > nul
cscript //nologo slmgr.vbs /ato | find /i "successfully" && (exit) || (echo Connection to KMS server failed. Trying another one... & echo Please wait... & set /a i+=1 & goto server)
goto halt

:notsupported
echo ============================================================================
echo Could not activate Windows. Unsupported version...
echo ============================================================================

:halt
pause >nul