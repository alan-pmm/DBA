
--CREATE A NEW PERSONAL alain_space TABLESPACE 
CREATE TABLESPACE alain_space
DATAFILE '\opt\oracle\oradata\FREE\FREEPDB1\alain_space.dbf'
SIZE 50m;

--CHECK IF TABLE_SPACE HAS BEEN CREATED
SELECT * FROM SYS.DBA_DATA_FILES WHERE TABLESPACE_NAME LIKE '%ALAIN%';

-- CREATE USER 1 SQL ON THE TABLESPACE "ALAIN_SPACE"
CREATE USER alain IDENTIFIED BY alain
DEFAULT TABLESPACE "ALAIN_SPACE"
ENABLE EDITIONS ;

-- QUOTAS
ALTER USER "ALAIN" QUOTA UNLIMITED ON "ALAIN_SPACE";
ALTER USER "ALAIN" QUOTA UNLIMITED ON "USERS";
-- ROLES
GRANT ALL PRIVILEGES TO alain;
