@call :GET_CURRENT_DIR
@cd %THIS_DIR%
ECHO OFF
CLS
:MENU
CLS
ECHO.
ECHO           Daemonfox Mining Toolbox     
ECHO. 
ECHO .....................................................
ECHO PRESS 1-9 to select your task, or q to EXIT.
ECHO .....................................................
ECHO.
ECHO 1 - START MINING
ECHO 2 - START STAKING
ECHO 3 - CHECK GETMININGINFO
ECHO 4 - CHECK GETWALLETINFO
ECHO 5 - IMPORTPRIVKEY
ECHO 6 - DUMPPRIVKEY
ECHO 7 - VALIDATEADDRESS
ECHO 8 - GETLASTSEGIDSTAKES
ECHO 9 - ADVANCED TOOLS
ECHO q - EXIT
ECHO.
color 9
SET /P M=Type 1, 2, 3, 4, 5, 6, 7, 8, 9, or q then press ENTER:
IF %M%==1 GOTO STARTMINING
IF %M%==2 GOTO STARTSTAKING
IF %M%==3 GOTO GETMININGINFO
IF %M%==4 GOTO GETWALLETINFO
IF %M%==5 GOTO IMPORTPRIVKEY
IF %M%==6 GOTO DUMPPRIVKEY
IF %M%==7 GOTO VALIDATEADDRESS
IF %M%==8 GOTO GETLASTSEGIDSTAKES
IF %M%==9 GOTO ADVANCEDTOOLSMENU
IF %M%==q GOTO EOF

:STARTMINING
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
cd resources\app\assets\bin\win64\
komodo-cli -ac_name=LABS setgenerate true 1
ECHO.
ECHO Mining succsesfully switched on
TIMEOUT /T 15
GOTO MENU

:STARTSTAKING
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
cd resources\app\assets\bin\win64\
komodo-cli.exe -ac_name=LABS setgenerate true 0
ECHO.
ECHO Staking succsesfully switched on
TIMEOUT /T 15
GOTO MENU

:GETMININGINFO
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
cd resources\app\assets\bin\win64\
komodo-cli -ac_name=LABS getmininginfo
ECHO.
TIMEOUT /T 15
GOTO MENU

:GETWALLETINFO
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
cd resources\app\assets\bin\win64\
komodo-cli -ac_name=LABS getwalletinfo
ECHO.
TIMEOUT /T 15
GOTO MENU

:IMPORTPRIVKEY
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
cd resources\app\assets\bin\win64\
set /p privkey=Enter ID: 
komodo-cli -ac_name=LABS importprivkey %privkey%
ECHO.
TIMEOUT /T 15
GOTO MENU

:DUMPPRIVKEY
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
cd resources\app\assets\bin\win64\
set /p pubaddress=Enter ID: 
komodo-cli -ac_name=LABS dumpprivkey %pubaddress%
ECHO.
TIMEOUT /T 15
GOTO MENU

:VALIDATEADDRESS
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
cd resources\app\assets\bin\win64\
set /p pubaddress=Enter ID: 
komodo-cli -ac_name=LABS validateaddress %pubaddress%
ECHO.
TIMEOUT /T 15
GOTO MENU

:GETLASTSEGIDSTAKES
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
cd resources\app\assets\bin\win64\
set /p depth=Enter ID: 
komodo-cli -ac_name=LABS getlastsegidstakes %depth%
ECHO.
TIMEOUT /T 15
GOTO MENU

:ADVANCEDTOOLSMENU
CLS
ECHO.
ECHO           Daemonfox Mining Toolbox     
ECHO. 
ECHO .....................................................
ECHO PRESS 1-5 to select your task, or q to EXIT.
ECHO .....................................................
ECHO.
ECHO 1 - 1
ECHO 2 - 2
ECHO 3 - 3
ECHO 4 - 4
ECHO 5 - 5
ECHO q - EXIT
ECHO.
color 8
SET /P M2=Type 1, 2, 3, 4, 5 or q then press ENTER:
IF %M2%==1 GOTO 1
IF %M2%==2 GOTO 2
IF %M2%==3 GOTO 3
IF %M2%==4 GOTO 4
IF %M2%==5 GOTO 5
IF %M2%==q GOTO MENU

:GET_CURRENT_DIR
@pushd %~dp0
@set THIS_DIR=%CD%
@popd
