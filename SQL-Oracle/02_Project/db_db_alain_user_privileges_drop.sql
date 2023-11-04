--DROP USER IF EXISTS
BEGIN
  FOR rec IN
    (
      SELECT username FROM dba_users  WHERE username IN ('ALAIN')
    )
  LOOP
   EXECUTE IMMEDIATE 'alter session set "_oracle_script"=TRUE';
    EXECUTE immediate ' DROP USER '||rec.username || ' CASCADE ';
  END LOOP;
END;
/
