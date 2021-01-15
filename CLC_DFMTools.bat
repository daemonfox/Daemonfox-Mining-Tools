@call :GET_CURRENT_DIR
@cd %THIS_DIR%
ECHO OFF
CLS
:MENU
CLS
ECHO.
ECHO           Daemonfox Mining Toolbox     
ECHO SUPPORT DAEMONFOX RBHXkXifDFYwbwghfyLpvYKg2tJguvwAYq
ECHO. 
ECHO .....................................................
ECHO PRESS 0-9 to select your task, p to send CLC or q to EXIT.
ECHO .....................................................
ECHO.
ECHO 0 - MAIN MENU
ECHO 1 - START CLC
ECHO 2 - CHECK GET INFO
ECHO 3 - IMPORT PRIVKEY
ECHO 4 - CHECK GET WALLET INFO
ECHO 5 - MINE CLC
ECHO 6 - CHECK GET MINING INFO
ECHO 7 - GET NEW ADDRESS
ECHO 8 - DUMP PRIVKEY
ECHO 9 - SUPPORT DAEMONFOX
ECHO p - SEND TO ADDRESS
ECHO q - EXIT
ECHO.
color 9
SET /P M=Type 1, 2, 3, 4, 5, 6, 7, 8, 9, p or q then press ENTER:
IF %M%==0 GOTO MAINMENU
IF %M%==1 GOTO CLC
IF %M%==2 GOTO GETINFO
IF %M%==3 GOTO IMPORTPRIVKEY
IF %M%==4 GOTO GETWALLETINFO
IF %M%==5 GOTO MINE
IF %M%==6 GOTO GETMININGINFO
IF %M%==7 GOTO GETNEWADDRESS
IF %M%==8 GOTO DUMPPRIVKEY
IF %M%==9 GOTO DAEMONFOX
IF %M%==p GOTO SENDTOADDRESS
IF %M%==q GOTO EOF

:MAINMENU
ECHO.
ECHO MAIN MENU
TIMEOUT /T 2
GOTO MENU

:CLC
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
start CLC.bat
ECHO.
ECHO CLC STARTED!
TIMEOUT /T 20
GOTO MENU

:GETINFO
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
komodo-cli -ac_name=CLC getinfo 
ECHO.
ECHO CALL COMPLETE
TIMEOUT /T 60
GOTO MENU

:IMPORTPRIVKEY
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
set /p privkey=Enter PrivKey: 
komodo-cli -ac_name=CLC importprivkey %privkey%
ECHO.
ECHO Key imported.
TIMEOUT /T 60
GOTO MENU

:GETWALLETINFO
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
komodo-cli -ac_name=CLC getwalletinfo
ECHO.
ECHO CALL COMPLETE
TIMEOUT /T 30
GOTO MENU

:MINE
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
set /p threads=Enter CPU threads to use: 
komodo-cli -ac_name=CLC setgenerate true %threads%
ECHO.
ECHO CALL COMPLETE. RUN GETMININGINFO NEXT.
TIMEOUT /T 20
GOTO MENU

:GETMININGINFO
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
komodo-cli -ac_name=CLC getmininginfo
ECHO.
ECHO CALL COMPLETE
TIMEOUT /T 30
GOTO MENU

:GETNEWADDRESS
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
komodo-cli -ac_name=CLC getnewaddress
ECHO.
ECHO CALL COMPLETE
TIMEOUT /T 20
GOTO MENU

:DUMPPRIVKEY
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
set /p address=Enter owned address: 
komodo-cli -ac_name=CLC dumpprivkey %address%
ECHO.
ECHO CALL COMPLETE
TIMEOUT /T 20
GOTO MENU

:DAEMONFOX
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
set /p amt=Enter CLC amount to send: 
komodo-cli -ac_name=CLC sendtoaddress RBHXkXifDFYwbwghfyLpvYKg2tJguvwAYq %amt%
ECHO.
ECHO THANK YOU!! THANK YOU!! THANK YOU!!
TIMEOUT /T 20
GOTO MENU

:SENDTOADDRESS
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
set /p amt=Enter CLC amount to send: 
set /p address=Enter CLC address:
komodo-cli -ac_name=CLC sendtoaddress %address% %amt%
ECHO.
ECHO THANK YOU!! THANK YOU!! THANK YOU!!
TIMEOUT /T 20
GOTO MENU

:GET_CURRENT_DIR
@pushd %~dp0
@set THIS_DIR=%CD%
@popd
