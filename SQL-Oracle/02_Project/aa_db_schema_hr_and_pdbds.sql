--SELECT DTB CONTAINERS
 SELECT * FROM  v$containers
 SELECT * FROM sys.CONTAINER$
 
--SEEL ALL TABLES
SELECT * FROM all_tables;

--SEE ALL TABLES COLUMNS
SELECT col.column_id,  col.owner as schema_name, col.table_name, col.column_name, col.data_type, col.data_length, col.data_precision, col.data_scale, col.nullable 
FROM sys.all_tab_columns col 
INNER JOIN sys.all_tables t ON col.owner = t.owner  AND col.table_name = t.table_name 
WHERE col.OWNER = 'SYS' 
AND col.column_name LIKE '%PORT%';

--IN TERMINAL with HR SCHEMA
SELECT col.owner as schema_name, col.table_name, col.column_name FROM sys.all_tab_columns col INNER JOIN sys.all_tables t ON col.owner = t.owner  AND col.table_name = t.table_name WHERE col.OWNER = 'SYS' 
AND col.column_name LIKE '%PORT%';


--SEE ALL PLUGGABLES DTB
SELECT * FROM v$pdbs;
SELECT * FROM SYS.VIEW_PDB$

--ACTIVE SERVICE
SELECT * FROM CDB_SERVICES;

--SEE ALL CONTAINER DATE
SELECT * FROM CDB_CONTAINER_DATA;

--SEE ALL USERS
SELECT * FROM dba_users;
SELECT * FROM all_users;
SELECT * FROM dba_users d FULL JOIN all_users a ON d.user_id = a.user_id ;
SELECT a.USERNAME, account_status FROM dba_users d FULL JOIN all_users a ON d.user_id = a.user_id ;


--FIND HR SCHEMA AND ITS TABLESPACE
SELECT d.user_id, d.username, default_tablespace FROM dba_users d FULL JOIN all_users a ON d.user_id = a.user_id WHERE d.username = 'HR';
--FIND HR TABLESPACE LOCATION
SELECT * FROM DBA_DATA_FILES WHERE tablespace_name = 'USERS';
SELECT file_name, tablespace_name FROM DBA_DATA_FILES WHERE tablespace_name = 'USERS';

--CONNECTED USER
SHOW USER;
--SEE CURRENT CONNECTION
SHOW con_name;


--UNLOCK USER
ALTER USER "HR" IDENTIFIED BY oracle ACCOUNT UNLOCK;

--GRANT ALL PRIVILEGES
GRANT ALL PRIVILEGES TO "HR";

--CREATE USER
alter session set container;
alter session set "_ORACLE_SCRIPT"=true;
CREATE USER alain IDENTIFIED BY alain;