@echo off
title Folder Locker
if EXIST "Private" goto UNLOCK
if NOT EXIST "Locker" goto CREATE
:CONFIRM
echo Are you sure you want to lock the folder? (Y/N)
set/p "cho=>"
if %cho%==Y goto LOCK
if %cho%==y goto LOCK
if %cho%==N goto END
if %cho%==n goto END
echo Invalid choice.
goto CONFIRM

:LOCK
ren Locker Private
attrib +h +s "Private"
echo Folder locked
goto END

:UNLOCK
echo Enter password to unlock folder
set/p "pass=>"
if NOT %pass%==19122009SMK goto FAIL
attrib -h -s "Private"
ren Private Locker
echo Folder unlocked
goto END

:FAIL
echo Wrong password
goto END

:CREATE
md Locker
echo Locker created
goto END

:END
pause
