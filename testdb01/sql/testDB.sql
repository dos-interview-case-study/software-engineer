-- testDB.sql

set heading off
spool d:\temp\case_study\testdb01\log\testdb.log
select instance_name from v$instance;
spool off
exit;