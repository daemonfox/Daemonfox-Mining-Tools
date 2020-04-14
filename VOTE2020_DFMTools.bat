@call :GET_CURRENT_DIR
@cd %THIS_DIR%
ECHO OFF
CLS
:MENU
CLS
ECHO.
ECHO           Daemonfox Mining Toolbox     
ECHO VOTE FOR DAEMONFOX RDAEmonF9avm7xau2pYWf3UamgHNXrkzpt
ECHO. 
ECHO .....................................................
ECHO PRESS 1-6 to select your task, or q to EXIT.
ECHO .....................................................
ECHO.
ECHO 1 - START VOTE2020
ECHO 2 - CHECK GETINFO
ECHO 3 - IMPORTPRIVKEY
ECHO 4 - CHECK GETWALLETINFO
ECHO 5 - VOTE FOR DAEMONFOX
ECHO 6 - VOTE FOR ANY NN
ECHO q - EXIT
ECHO.
color 9
SET /P M=Type 1, 2, 3, 4, 5, 6 or q then press ENTER:
IF %M%==1 GOTO VOTE2020
IF %M%==2 GOTO GETINFO
IF %M%==3 GOTO IMPORTPRIVKEY
IF %M%==4 GOTO GETWALLETINFO
IF %M%==5 GOTO DAEMONFOX
IF %M%==6 GOTO NN
IF %M%==q GOTO EOF

:VOTE2020
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
cd resources\app\assets\bin\win64\komodod
start VOTE2020.bat
ECHO.
ECHO VOTE2020 STARTED VOTE FOR DAEMONFOX RDAEmonF9avm7xau2pYWf3UamgHNXrkzpt
TIMEOUT /T 20
GOTO MENU

:GETINFO
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
cd resources\app\assets\bin\win64\komodod
komodo-cli -ac_name=VOTE2020 getinfo 
ECHO.
ECHO VOTE FOR DAEMONFOX RDAEmonF9avm7xau2pYWf3UamgHNXrkzpt
TIMEOUT /T 20
GOTO MENU

:IMPORTPRIVKEY
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
cd resources\app\assets\bin\win64\komodod
set /p privkey=Enter PrivKey: 
komodo-cli -ac_name=VOTE2020 importprivkey %privkey%
ECHO.
ECHO Key imported. VOTE FOR DAEMONFOX RDAEmonF9avm7xau2pYWf3UamgHNXrkzpt
TIMEOUT /T 20
GOTO MENU

:GETWALLETINFO
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
cd resources\app\assets\bin\win64\komodod
komodo-cli -ac_name=VOTE2020 getwalletinfo
ECHO.
ECHO VOTE FOR DAEMONFOX RDAEmonF9avm7xau2pYWf3UamgHNXrkzpt
TIMEOUT /T 20
GOTO MENU

:DAEMONFOX
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
cd resources\app\assets\bin\win64\komodod
set /p amt=Enter VOTE2020 amount to send: 
komodo-cli -ac_name=VOTE2020 sendtoaddress RDAEmonF9avm7xau2pYWf3UamgHNXrkzpt %amt%
ECHO.
ECHO THANK YOU!! THANK YOU!! THANK YOU!!
TIMEOUT /T 20
GOTO MENU

:NN
@call :GET_CURRENT_DIR
@cd %THIS_DIR%
CLS
cd resources\app\assets\bin\win64\komodod
set /p addr=Enter NN Address: 
set /p amt=Enter VOTE2020 amount to send: 
komodo-cli -ac_name=VOTE2020 sendtoaddress %addr% %amt%
ECHO.
ECHO VOTE FOR DAEMONFOX RDAEmonF9avm7xau2pYWf3UamgHNXrkzpt
TIMEOUT /T 15
GOTO MENU

:GET_CURRENT_DIR
@pushd %~dp0
@set THIS_DIR=%CD%
@popd
