-- testDB.sql

set heading off
spool d:\temp\case_study\testdb01\log\sql3.txt
select instance_name from v$instance;
spool off
exit;