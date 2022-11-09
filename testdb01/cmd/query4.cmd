REM query4.cmd - script to query the db and copy output
set myErrors=0



REM get password
d:
call d:\temp\case_study\testdb01\cmd\db_login.cmd openffs
if %errorlevel% NEQ 0 goto badend

@echo on
REM run sql
sqlplus -l %connectstring% @D:\scripts\mydb\sql\query4.sql
if %errorlevel% NEQ 0 (set /A myErrors+=1)

REM copy output
copy d:\temp\case_study\testdb01\log\sql4.log D:\temp\case_study\testapp01\input\
if %errorlevel% NEQ 0 (set /A myErrors+=1)

:end
exit /b %myErrors%

:badend
set myErrors=1
echo script failed
exit /b %myErrors%