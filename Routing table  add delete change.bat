@ECHO off
::This batch script is used to add, delete or change routes in a routing table.

:BEGIN
ECHO **********************************
ECHO *** Here is your routing table ***
ECHO **********************************

route print

ECHO.
ECHO.

:BEGIN
ECHO *********************************************************
ECHO *** Press 1 - to add route                            ***
ECHO *** Press 2 - to delete route                         ***
ECHO *** Press 3 - to change routes default gateway	   ***
ECHO *** Press 4 - to change routes default metric	   ***
ECHO *********************************************************

CHOICE /C:1234

IF errorlevel 4 goto CNGE2
IF errorlevel 3 goto CNGE
IF errorlevel 2 goto DEL
IF errorlevel 1 goto ADD

:ADD
ECHO ***************************************
ECHO.
set /p DESTIP=Destination IP:
ECHO.
set /p DESTMSK=Destination Mask:
ECHO.
set /p SRCE=Your Gateway:
ECHO.
ECHO Do you want this route to be persistent?
set /p PSTNT=Type "-p" if yes or press ENTER for no:
route add "%DESTIP%" MASK "%DESTMSK%" "%SRCE%" "%PSTNT%"
ECHO Route Added Successfully
ECHO To go to the beginning:
PAUSE
GOTO BEGIN

:DEL
ECHO ***************************************
ECHO.
set /p DESTIP=Destination IP:
ECHO.
route delete "%DESTIP%"
ECHO Route Deleted Successfully
ECHO To go to the beginning:
PAUSE
GOTO BEGIN

:CNGE
ECHO ***************************************
ECHO Change can be used only to modify the gateway only
ECHO.
ECHO Route to be changed:
set /p DESTIP=Destination IP:
ECHO.
set /p DESTMSK=Destination Mask:
ECHO.
set /p SRCE=Type your new 'Gateway IP' (or press close CMD to cancel):
ECHO.
ECHO Do you want this route to be persistent?
set /p PSTNT=Type "-p" if yes or press ENTER for no:
route change "%DESTIP%" MASK "%DESTMSK%" "%SRCE%" "%PSTNT%"
ECHO Route Changed Successfully
ECHO To go to the beginning:
PAUSE
GOTO BEGIN

:CNGE2
ECHO ***************************************
ECHO Change can be used only to modify the metric only
ECHO.
ECHO Route to be changed:
set /p DESTIP=Destination IP:
ECHO.
set /p DESTMSK=Destination Mask:
ECHO.
set /p SRCE=Gateway:
ECHO.
set /p MTRC= Type the new metric number you want (or press close CMD to cancel):
route change "%DESTIP%" MASK "%DESTMSK%" "%SRCE%" METRIC "%MTRC%"
ECHO Route Changed Successfully
ECHO To go to the beginning:
PAUSE
GOTO BEGIN

