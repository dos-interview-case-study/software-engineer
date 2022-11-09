REM query2.cmd - script to query the db and copy output
set myErrors=0

REM get password
d:
call d:\temp\case_study\testdb01\cmd\db_login.cmd openffs_up
if %errorlevel% NEQ 0 goto badend

REM run sql
sqlplus -l %connectstring% @D:\temp\case_study\testdb01\sql\query2.sql
if %errorlevel% NEQ 0 (set /A myErrors+=1)

REM copy output
copy d:\temp\case_study\testdb01\log\sql2.log D:\temp\case_study\testapp01\input\ 
if %errorlevel% NEQ 0 (set /A myErrors+=1)

:end
echo Success!
exit /b 0

:badend
set myErrors=1
echo script failed
exit /b %myErrors%